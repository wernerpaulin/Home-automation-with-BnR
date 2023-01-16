(********************************************************************
 * COPYRIGHT -- WERNER PAULIN 
 ********************************************************************
 * Program: hs_con
 * File: hs_con.st
 * Author: paulinw
 * Created: December 27, 2009
 ********************************************************************
 * Implementation of program hs_con
 * Features:
 * - PID control of room temperature
 * Interfaces:
 * - gActData
 ********************************************************************
 * History:
 * Version	Date		Author		Comment
 * V1.00	27.12.09	W. Paulin	created
 * V1.10	03.07.10	W. Paulin	hotwater state machine implemented
 *                                  tempFlowSetOffset limited to zero
 ********************************************************************)

PROGRAM _INIT
	fRTInfo(enable := 1);
	cycT := fRTInfo.cycle_time / 1000;
	
	dmyTabEntry.x := dmyTabEntry.x;	(* just to be used for sizeof calculation *)
	(* load linearisation for burner, boiler and flow temperature *)
	fDatObjInfo(enable := 1, pName := ADR(BMS_LIN_HEAT_DO_NAME));
	pLinDataHeatSensor := fDatObjInfo.pDatObjMem;
	nbPointsHeatSensorLin := UDINT_TO_UINT(fDatObjInfo.len / SIZEOF(dmyTabEntry));

	(* load linearisation for outside sensor *)
	fDatObjInfo(enable := 1, pName := ADR(BMS_LIN_OUTSIDE_DO_NAME));
	pLinDataOutsideSensor := fDatObjInfo.pDatObjMem;
	nbPointsOutsideSensorLin := UDINT_TO_UINT(fDatObjInfo.len / SIZEOF(dmyTabEntry));

	(* load linearisation for inside sensor *)
	fDatObjInfo(enable := 1, pName := ADR(BMS_LIN_INSIDE_DO_NAME));
	pLinDataInsideSensor := fDatObjInfo.pDatObjMem;
	nbPointsInsideSensorLin := UDINT_TO_UINT(fDatObjInfo.len / SIZEOF(dmyTabEntry));

	(* load curve for relation between outside temperature and flow temperature *)
	fDatObjInfo(enable := 1, pName := ADR(BMS_HEATING_CURVE));
	pHeatCurve := fDatObjInfo.pDatObjMem;
	nbPointsHeatCurve := UDINT_TO_UINT(fDatObjInfo.len / SIZEOF(dmyTabEntry));

	(* Mixer *)
	sStepMixer    := 1.0 / (MIXER_FULLY_OPEN_TIME / MIXER_FULLY_OPEN_POSITION) * UDINT_TO_REAL(cycT) / 1000.0;
	mixerRefTime  := REAL_TO_UDINT(MIXER_FULLY_OPEN_TIME * 1.2 * 1000);	(* close 20% longer for referencing *)
	mixerRefTimer := 0;
	sMixer        := sMIXER_REFERENCE;		(* reference after powerup *)

	(* Hotwater management *)
	sHotwater := sHOTWATER_STANDBY;
	
	cntLoadOld := gHMI.recipe.ctrl.cntLoad;
END_PROGRAM


PROGRAM _CYCLIC
	(* apply recipe parameter if allowed  *)
	IF (gCfg.isValid) THEN
		memcpy(ADR(rcpData), ADR(gCfg.data), SIZEOF(rcpData));
	END_IF;
	
	(* generate flag indicating new minute *)
	IF (oldMinute <> gActData.general.time.minute) THEN
		newMinute := TRUE;
		oldMinute := gActData.general.time.minute;
	ELSE
		newMinute := FALSE;
	END_IF;	
	
	(* convert temperatures from measured raw values to °C - if simulation is active the temperatures are simulated directly *)
	IF (gSimulation.isActive = FALSE) THEN
		fLCRCurveByPoints(x := 1 / (1/(UINT_TO_REAL(aiTempBoiler)     / 10.0) - 1/BOILER_PARALLEL_RESISTANCE) , NoOfPoints := nbPointsHeatSensorLin   , ptr_table := pLinDataHeatSensor);
		gActData.heating.hotwater.tempAct := fLCRCurveByPoints.y;
		fLCRCurveByPoints(x := 1 / (1/(UINT_TO_REAL(aiTempBurner)     / 10.0) - 1/BURNER_PARALLEL_RESISTANCE) , NoOfPoints := nbPointsHeatSensorLin   , ptr_table := pLinDataHeatSensor);
		gActData.heating.burner.tempAct := fLCRCurveByPoints.y;
		fLCRCurveByPoints(x := 1 / (1/(UINT_TO_REAL(aiTempFlow)       / 10.0) - 1/FLOW_PARALLEL_RESISTANCE)   , NoOfPoints := nbPointsHeatSensorLin   , ptr_table := pLinDataHeatSensor);
		gActData.heating.tempFlowAct := fLCRCurveByPoints.y;
		fLCRCurveByPoints(x := 1 / (1/(UINT_TO_REAL(aiTempOutside)    / 10.0) - 1/OUTSIDE_PARALLEL_RESISTANCE), NoOfPoints := nbPointsOutsideSensorLin, ptr_table := pLinDataOutsideSensor);
		gActData.heating.tempOutsideAct := fLCRCurveByPoints.y;
		fLCRCurveByPoints(x := 1 / (1/(UINT_TO_REAL(aiTempLivingroom) / 10.0) - 1/INSIDE_PARALLEL_RESISTANCE) , NoOfPoints := nbPointsInsideSensorLin , ptr_table := pLinDataInsideSensor);
		gActData.heating.tempLivingroomAct := fLCRCurveByPoints.y;
	END_IF;

	(* calculate set temperature for living room *)
	yearDay := DayOfYear(gActData.general.time);																	(* day within a year *)
	dayMinute := gActData.general.time.hour * 60 + gActData.general.time.minute;									(* minute within a day *)	

	IF (UDINT_TO_BOOL(gActData.heating.outOfHomeActive) = TRUE) AND (yearDay >= rcpData.heating.outOfHome.startDay) AND (yearDay <= rcpData.heating.outOfHome.endDay) THEN
		gActData.heating.tempLivingroomSet := rcpData.heating.tempLivingroomSet + rcpData.heating.tempLowOffset + rcpData.heating.tempManOffset;	(* lower heating if nobody is home *)
		gActData.heating.loweringActive := TRUE;
	ELSIF (dayMinute < rcpData.heating.startTime) OR (dayMinute > rcpData.heating.endTime) THEN
		gActData.heating.tempLivingroomSet := rcpData.heating.tempLivingroomSet + rcpData.heating.tempLowOffset + rcpData.heating.tempManOffset;	(* lower heating if outside schedule *)
		gActData.heating.loweringActive := TRUE;
	ELSE
		gActData.heating.tempLivingroomSet := rcpData.heating.tempLivingroomSet + rcpData.heating.tempManOffset;									(* standard mode *)
		gActData.heating.loweringActive := FALSE;
	END_IF;



	(* activate / deactivate heating with 2point control according to living room temperature *)
	fHyst2pLivingRoom(xAct := gActData.heating.tempLivingroomAct, xSet := gActData.heating.tempLivingroomSet, pHyst := LIVING_ROOM_TEMP_POS_HYSTERESIS, nHyst := LIVING_ROOM_TEMP_NEG_HYSTERESIS);
	gActData.heating.enable := fHyst2pLivingRoom.y;
	
	IF (gActData.heating.enable = TRUE) AND (oldHeatingEnable = FALSE) THEN
 		gHMI.cmd.updatePID := TRUE;
	END_IF;	
	oldHeatingEnable := gActData.heating.enable;
	
	(* manual override heating if completely switched off by operator *)
	IF (gActData.heating.manSwitchedOff = TRUE) THEN
		gActData.heating.enable := FALSE;
	END_IF;

	(* PID parameters can be updated by HMI or loaded from recipe *)
	IF (cntLoadOld <> gHMI.recipe.ctrl.cntLoad) THEN
		gHMI.cmd.updatePID := TRUE;
 		cntLoadOld := gHMI.recipe.ctrl.cntLoad;
	END_IF;	

	(* update PID parameters: in case of new recipe or new parameters entered in visualization - only if PID is enabled *)
	IF (gHMI.cmd.updatePID = TRUE) AND (fLCRSlimPID.enable = TRUE) THEN
		tempLCRSlimPIDpara.Kp    := rcpData.heating.kp;
		tempLCRSlimPIDpara.Tn    := rcpData.heating.tn;
		tempLCRSlimPIDpara.Kfbk  := PID_HEATING_I_MAX;
		tempLCRSlimPIDpara.Tv    := 0;
		tempLCRSlimPIDpara.Y_max := MIXER_FULLY_OPEN_POSITION;
		tempLCRSlimPIDpara.Y_min := 0;
	
		tempPIDrequest           := LCRSLIMPID_REQU_READ_PARAS;
		gHMI.cmd.updatePID       := FALSE;
 	ELSE
		tempPIDrequest           := LCRSLIMPID_REQU_OFF;
	END_IF;

	(* derive set value for flow from outside temperature using chart 'heatcurve' *)
	fLCRCurveByPoints(x := gActData.heating.tempOutsideAct, NoOfPoints := nbPointsHeatCurve, ptr_table := pHeatCurve);	(* get flow set temperature derived from outside temperature *)
	gActData.heating.tempFlowSet := MAX(fLCRCurveByPoints.y + rcpData.heating.tempFlowSetOffset, 0.0);					(* add manual offset, limit to zero to avoid negative set values on very warm days *)	

	(* PID control: enable depends on hysteresis of living room temperature *)
	fLCRSlimPID(enable := (gActData.heating.enable AND NOT(gAlarm.stop)), W := gActData.heating.tempFlowSet, X := gActData.heating.tempFlowAct, request := tempPIDrequest, pPar := ADR(tempLCRSlimPIDpara));
	gActData.heating.sSetMixer := fLCRSlimPID.Y;
		
	(* energy saving: squeeze out any energy left in the burner *)
	IF (gActData.heating.manSwitchedOff = FALSE)  AND 									(* only if heating is not manually switched off *)
	   (dayMinute > rcpData.heating.endTime)      AND 									(* and heating is switched of for this day *)
	   (gActData.heating.hotwater.enable = FALSE) AND 									(* and no hot water preparation active *)
	   ((gActData.heating.burner.tempAct - gActData.heating.tempFlowAct) > 2.0) THEN	(* and burner is still warmer than flow temperature *)
		doFlowPump := TRUE;																(* override flow pump *)
		gActData.heating.sSetMixer := 75.0;												(* set mixer to fixed position: 3/4 open *)
	END_IF;

	(* override flow pump in case outside temperature is too low -> avoid freezing pipes *)
	doFlowPump := gActData.heating.enable;		(* switch on flow pump if heating is enabled *)
	IF (gActData.heating.tempOutsideAct <= CRITICAL_FREEZING_OUTSIDE_TEMP) THEN
		doFlowPump := TRUE;
	END_IF;

	(* Mixer control *)
	(* open and close mixer - move mixer only if a certain lag window is exceeded *)
	CASE sMixer OF
		(* wait *)
		sMIXER_STANDBY:
			doMixerOpen					:= FALSE;
			doMixerClose 				:= FALSE;
			(* reference mixer every midnight - assume referencing takes more then a minute *)
			IF ((gActData.general.time.hour = 0) AND (gActData.general.time.minute = 0)) THEN
				mixerRefTimer := 0;
				sMixer        := sMIXER_REFERENCE;
			END_IF;	

			(* mixer is out of tolerance band *)
			IF (ABS(gActData.heating.sSetMixer - gActData.heating.sActMixer) > MIXER_ZERO_WINDOW) THEN
				IF ((gActData.heating.sSetMixer - gActData.heating.sActMixer) > 0) THEN
					sMixer := sMIXER_OPEN;
				ELSE
					sMixer := sMIXER_CLOSE;
				END_IF;
			END_IF;
			
		(* open mixer until it reaches its set position *)
		sMIXER_OPEN:
			doMixerOpen					:= TRUE;
			doMixerClose 				:= FALSE;
			gActData.heating.sActMixer	:= gActData.heating.sActMixer + sStepMixer;			(* calculate/guess actual position *)
			IF (gActData.heating.sActMixer >= gActData.heating.sSetMixer) THEN
   				sMixer := sMIXER_STANDBY;
			END_IF;
		
		(* close mixer until it reaches its set position *)
		sMIXER_CLOSE:
			doMixerOpen  				:= FALSE;
			doMixerClose 				:= TRUE;
			gActData.heating.sActMixer 	:= gActData.heating.sActMixer - sStepMixer;			(* calculate/guess actual position *)
			IF (gActData.heating.sActMixer <= gActData.heating.sSetMixer) THEN
   				sMixer := sMIXER_STANDBY;
			END_IF;

		(* reference mixer by closing *)
		sMIXER_REFERENCE:
			doMixerOpen  				:= FALSE;
			doMixerClose 				:= TRUE;
			mixerRefTimer 				:= mixerRefTimer + cycT;		
			IF (mixerRefTimer > mixerRefTime) THEN
				gActData.heating.sActMixer := 0;	(* mixer is now closed for sure *)
				sMixer := sMIXER_STANDBY;		
			END_IF;
	END_CASE;

	(* limit calculated actual position *)
	gActData.heating.sActMixer := MIN(MAX(gActData.heating.sActMixer, 0), MIXER_FULLY_OPEN_POSITION);

	(* hot water management *)
	IF (gActData.general.time.wday = 0) THEN
		rcpData.heating.hotwater.tempSet := HOTWATER_TEMP_LEGION_DISTINCTION;	(* Override temperature for legionellae distinction - every sunday *)
	END_IF;	
	CASE sHotwater OF
		(* wait until hot water should be prepared according to schedule *)
		sHOTWATER_STANDBY:
			doBoilerPump := FALSE;
	
			(* check schedule whether hot water need to be prepared *)
			gActData.heating.hotwater.enable := FALSE;		(* assume hot water preparation is not requested *)
			FOR index := 0 TO MAX_HOTWATER_TIME_INDEX DO
				IF (dayMinute >= rcpData.heating.hotwater.startTime[index]) AND (dayMinute <= rcpData.heating.hotwater.endTime[index]) THEN
					gActData.heating.hotwater.enable := TRUE;
				END_IF;
			END_FOR;	
	
			(* if hot water is enabled, monitor actual temperature and initiate heating if necessary *)
			IF (gActData.heating.hotwater.enable = TRUE) AND (gActData.heating.hotwater.tempAct < rcpData.heating.hotwater.tempSet) THEN
				sHotwater := sHOTWATER_WAIT_BURNER_HOT;
			END_IF;	
	
		(* wait to switch on pump until burner is warmer than boiler in order to avoid unwanted heat dissipation *)
		sHOTWATER_WAIT_BURNER_HOT:
			IF (gActData.heating.burner.tempAct >= gActData.heating.hotwater.tempAct) THEN
				sHotwater := sHOTWATER_WAIT_HOTWATER_READY;
			END_IF;
		
		(* heat up hot water until it reaches the set value *)	
		sHOTWATER_WAIT_HOTWATER_READY:
			doBoilerPump := TRUE;
			IF (gActData.heating.hotwater.tempAct >= rcpData.heating.hotwater.tempSet) THEN
				sHotwater := sHOTWATER_STANDBY;
			END_IF;
	END_CASE;


	(* burner control - use the higher set temperature from flow and hotwater and ignore temperature if not enabled *)
	gActData.heating.burner.tempSet := MAX(gActData.heating.tempFlowSet     * BOOL_TO_REAL(gActData.heating.enable), 
	                                       rcpData.heating.hotwater.tempSet * BOOL_TO_REAL(gActData.heating.hotwater.enable));
	
	(* add offset to make sure there is a heat disipation from the burner to the water *)
	IF (gActData.heating.enable = TRUE) OR (gActData.heating.hotwater.enable = TRUE) THEN
		gActData.heating.burner.tempSet := gActData.heating.burner.tempSet + BURNER_TEMP_SET_OFFSET;
	ELSE
		gActData.heating.burner.tempSet := 0.0;
	END_IF;


	(* Limit maximum set value for burner temperature *)
	gActData.heating.burner.tempSet := MIN(gActData.heating.burner.tempSet, BURNER_MAX_SET_TEMP);

	(* 2-point controller of burner *)
	fHyst2pBurner(xAct := gActData.heating.burner.tempAct, xSet := gActData.heating.burner.tempSet, pHyst := BURNER_TEMP_POS_HYSTERESIS, nHyst := BURNER_TEMP_NEG_HYSTERESIS);
	doBurner := fHyst2pBurner.y;

	(* ensure minimum runtime of burner - not during simulation as the simulation model would always reach maximum temperature because it is faster *)
	IF (gSimulation.isActive = FALSE) THEN
		IF (minRuntimeTimerBurner > 0) AND (minRuntimeTimerBurner < BURNER_MIN_RUNTIME) THEN
			doBurner := TRUE;											(* keep burner switched on even if not requested anymore but minimum runtime is not yet exceeded *)
		ELSIF (minRuntimeTimerBurner >= BURNER_MIN_RUNTIME) AND (doBurner = FALSE) THEN
			minRuntimeTimerBurner := 0;									(* reset timer if minimum runtime is elapsed and burner is switched off again *)
		END_IF;	
		IF (doBurner = TRUE) THEN
			minRuntimeTimerBurner := minRuntimeTimerBurner + cycT;		(* elapsed switched on time *)
		END_IF;
	END_IF;

	(* override digital outputs in case of stop request due to pending alarms *)
	IF (gAlarm.stop = TRUE) THEN
		doBurner     := FALSE;			(* switch of burner in case of error *)
		doFlowPump   := FALSE;			(* switch of pumps in order to avoid that too hot water is flowing though pipes *)

		IF (gActData.heating.hotwater.tempAct < BOILER_MAX_TEMP) THEN
			doBoilerPump := TRUE;			(* cool burner with boiler as long is boiler is not too hot *)
		ELSE
			doBoilerPump := FALSE;			(* switch of pumps in order to avoid that too hot water is flowing though pipes *)
		END_IF;		
	END_IF;

	(* statistics *)
	IF (doBurner = TRUE) THEN
		gActData.statistics.heating.onTimeBurner     := gActData.statistics.heating.onTimeBurner     + newMinute;
	END_IF;	
	IF (doFlowPump = TRUE) THEN
		gActData.statistics.heating.onTimeFlowPump   := gActData.statistics.heating.onTimeFlowPump   + newMinute;
	END_IF;	
	IF (doBoilerPump = TRUE) THEN
		gActData.statistics.heating.onTimeBoilerBump := gActData.statistics.heating.onTimeBoilerBump + newMinute;
	END_IF;	


	(* data logging - maximum temperature *)
	IF (gActData.heating.tempOutsideDayHigh = 0.0) THEN
		gActData.heating.tempOutsideDayHigh := -1000.0;			(* initialisation of remanent data in case of first download: 0.0 won't happen with real values *)
	ELSIF (gActData.heating.tempOutsideAct > gActData.heating.tempOutsideDayHigh) THEN
		gActData.heating.tempOutsideDayHigh := gActData.heating.tempOutsideAct;
	END_IF;

	IF ((newMinute = TRUE) AND (gActData.general.time.hour = 23) AND (gActData.general.time.minute = 59)) OR (fDatObjUpdateYearTempHigh.status = ERR_FUB_BUSY) THEN
		fGetTrendDatObjNameHighTemp(templateName := DO_NAME_TREND_TEMP_HIGH, year := gActData.general.time.year);
		fDatObjUpdateYearTempHigh(pName := ADR(fGetTrendDatObjNameHighTemp.datObjName), pData := ADR(gActData.heating.tempOutsideDayHigh), index := DayOfYear(gActData.general.time) - 1, nbElement := 366, sizeOfElement := SIZEOF(gActData.heating.tempOutsideDayHigh));
	ELSIF ((newMinute = TRUE) AND (gActData.general.time.hour = 0) AND (gActData.general.time.minute = 0)) THEN
		gActData.heating.tempOutsideDayHigh := -1000.0;			(* reinitialize drag indicator at midnight *)
	END_IF;


	(* data logging - minimum temperature *)
	IF (gActData.heating.tempOutsideDayLow = 0.0) THEN
		gActData.heating.tempOutsideDayLow := 1000.0;			(* initialisation of remanent data in case of first download: 0.0 won't happen with real values *)
	ELSIF (gActData.heating.tempOutsideAct < gActData.heating.tempOutsideDayLow) THEN
		gActData.heating.tempOutsideDayLow := gActData.heating.tempOutsideAct;
	END_IF;

	IF ((newMinute = TRUE) AND (gActData.general.time.hour = 23) AND (gActData.general.time.minute = 59)) OR (fDatObjUpdateYearTempLow.status = ERR_FUB_BUSY) THEN
		fGetTrendDatObjNameLowTemp(templateName := DO_NAME_TREND_TEMP_LOW, year := gActData.general.time.year);
		fDatObjUpdateYearTempLow(pName := ADR(fGetTrendDatObjNameLowTemp.datObjName), pData := ADR(gActData.heating.tempOutsideDayLow), index := DayOfYear(gActData.general.time) - 1, nbElement := 366, sizeOfElement := SIZEOF(gActData.heating.tempOutsideDayLow));
	ELSIF ((newMinute = TRUE) AND (gActData.general.time.hour = 0) AND (gActData.general.time.minute = 0)) THEN
		gActData.heating.tempOutsideDayLow := 1000.0;			(* reinitialize drag indicator at midnight *)
	END_IF;


	(* data logging - burner operation hours *)
	IF (doBurner = TRUE) THEN
		gActData.heating.burner.heatHoursDay := gActData.heating.burner.heatHoursDay + newMinute;
	END_IF;

	IF ((newMinute = TRUE) AND (gActData.general.time.hour = 23) AND (gActData.general.time.minute = 59)) OR (fDatObjUpdateYearHeat.status = ERR_FUB_BUSY) THEN
		fGetTrendDatObjNameHeat(templateName := DO_NAME_TREND_HEAT, year := gActData.general.time.year);
		fDatObjUpdateYearHeat(pName := ADR(fGetTrendDatObjNameHeat.datObjName), pData := ADR(gActData.heating.burner.heatHoursDay), index := DayOfYear(gActData.general.time) - 1, nbElement := 366, sizeOfElement := SIZEOF(gActData.heating.burner.heatHoursDay));
	ELSIF ((newMinute = TRUE) AND (gActData.general.time.hour = 0) AND (gActData.general.time.minute = 0)) THEN
		gActData.heating.burner.heatHoursDay := 0;				(* reinitialize drag indicator at midnight *)
	END_IF;



	(* Debugging - access to trend data objects *)
	trendDebug.dayOfYearFromDate := DayOfYear(trendDebug.date);	(* auxillary function to get day of year from a date *)
	
	trendDebug.dayOfYear := MIN(MAX(trendDebug.dayOfYear, 0),366);
	fDatObjInfo(enable := 1, pName := ADR(trendDebug.name[0]));

	IF (fDatObjInfo.status = 0) THEN
		memcpy(ADR(trendDebug.tempAct), fDatObjInfo.pDatObjMem + (trendDebug.dayOfYear - 1) * SIZEOF(trendDebug.tempAct), SIZEOF(trendDebug.tempAct));
		memcpy(ADR(trendDebug.heatingHoursDayAct), fDatObjInfo.pDatObjMem + (trendDebug.dayOfYear - 1) * SIZEOF(trendDebug.heatingHoursDayAct), SIZEOF(trendDebug.heatingHoursDayAct));

		IF (trendDebug.cmdTempSet = TRUE) THEN
			fDatObjUpdateTempDebug(pName := ADR(trendDebug.name[0]), pData := ADR(trendDebug.tempSet), index := trendDebug.dayOfYear - 1, nbElement := 366, sizeOfElement := SIZEOF(trendDebug.tempSet));
   
   			IF (fDatObjUpdateTempDebug.status <> ERR_FUB_BUSY) THEN
				trendDebug.cmdTempSet := FALSE;
			END_IF;	
		END_IF;

		IF (trendDebug.cmdHeatingHoursDaySet = TRUE) THEN
			fDatObjUpdateHeatDebug(pName := ADR(trendDebug.name[0]), pData := ADR(trendDebug.heatingHoursDaySet), index := trendDebug.dayOfYear - 1, nbElement := 366, sizeOfElement := SIZEOF(trendDebug.heatingHoursDaySet));
   
   			IF (fDatObjUpdateHeatDebug.status <> ERR_FUB_BUSY) THEN
				trendDebug.cmdHeatingHoursDaySet := FALSE;
			END_IF;	
		END_IF;
	END_IF;


	(* alarm handling *)
	IF (gActData.heating.burner.tempAct >= BURNER_MAX_TEMP) THEN
		gAlarm.request[ALARM_HEATING_BURNER_TEMP_HIGH] := TRUE;
	ELSE
		gAlarm.request[ALARM_HEATING_BURNER_TEMP_HIGH] := FALSE;
	END_IF;

	IF (gActData.heating.burner.tempSet >= BURNER_MAX_SET_TEMP) THEN
		gAlarm.request[ALARM_HEATING_BURNER_TEMP_LIMIT] := TRUE;
	ELSE
		gAlarm.request[ALARM_HEATING_BURNER_TEMP_LIMIT] := FALSE;
	END_IF;

	IF (gActData.heating.hotwater.tempAct >= BOILER_MAX_TEMP) THEN
		gAlarm.request[ALARM_HEATING_BOILER_TEMP_HIGH] := TRUE;
	ELSE
		gAlarm.request[ALARM_HEATING_BOILER_TEMP_HIGH] := FALSE;
	END_IF;
	
	gAlarm.request[ALARM_HEATING_NODE_CON_ERROR] := NOT(gHeatingNodeTemp1Ok AND gHeatingNodeTemp2Ok AND gHeatingNodeRelais1Ok AND gHeatingNodeRelais2Ok);
END_PROGRAM
