(********************************************************************
 * COPYRIGHT -- WERNER PAULIN 
 ********************************************************************
 * Program: hmi_sup
 * File: hmi_sup.st
 * Author: paulinw
 * Created: December 27, 2009
 ********************************************************************
 * Implementation of program hmi_sup
 * Features:
 * - clock handling
 * - 
 * Interfaces:
 * - gActData
 ********************************************************************
 * History:
 * Version	Date		Author		Comment
 * V1.00	27.12.09	W. Paulin	created
 ********************************************************************)

PROGRAM _INIT
	fRTInfo(enable := 1);
	cycT := fRTInfo.cycle_time / 1000;
	
	gHMI.trend.day[YESTERDAY].nbSamples := MAX_SAMPLE_INDEX_DAY + 1;
END_PROGRAM


PROGRAM _CYCLIC
	(* generate flag indicating new minute *)
	IF (oldMinute <> gActData.general.time.minute) THEN
		newMinute := TRUE;
		cntMinute := cntMinute + 1;
		IF cntMinute >= 4 THEN
			new4Minute := TRUE;
			cntMinute  := 0;
		END_IF;
		oldMinute := gActData.general.time.minute;
	ELSE
		newMinute  := FALSE;
		new4Minute := FALSE;
	END_IF;	
	
	(* change page by global buttons *)
	IF (gHMI.general.setPage = 65535) AND (gHMI.general.cmdNewPage <> cmdNewPageOld) THEN
		gHMI.general.setPage := gHMI.general.cmdNewPage;
		cmdNewPageOld := gHMI.general.cmdNewPage;
	END_IF;

	IF (gHMI.general.actPage = PAGE_POWERUP) THEN
		pagePowerUpTimer := pagePowerUpTimer + cycT;
		IF (pagePowerUpTimer >= DELAY_POWERUP_PAGE) THEN
			gHMI.general.setPage := PAGE_HS_OVERVIEW;
			pagePowerUpTimer := 0;
		END_IF;
	END_IF;

	(* generate new page flag *)
	IF (actPicOld <> gHMI.general.actPage) THEN
		newPage := TRUE;
	ELSE
		newPage := FALSE;
	END_IF;
	actPicOld := gHMI.general.actPage;

	fDTStructureGetTime(enable := 1, pDTStructure := ADR(gActData.general.time));		(* read current time *)
 
	(* load actual time in set time variable when entering service page *)
	IF ((newPage = TRUE) AND (gHMI.general.actPage = PAGE_BMS_CFG)) THEN
		memcpy( ADR(gHMI.general.setTime), ADR(gActData.general.time), SIZEOF(gHMI.general.setTime) );
		gHMI.general.setTime.second := 0;
	END_IF;

	(* set time *)
	IF (gHMI.cmd.setTime = TRUE) THEN
		fDTStructureSetTime(enable := 1, pDTStructure := ADR(gHMI.general.setTime));
		IF (fDTStructureSetTime.status <> ERR_FUB_BUSY) THEN
			gHMI.cmd.setTime := FALSE;
		END_IF;
	END_IF;
	
	(* temperature tendency *)
	IF (newMinute = TRUE) THEN
		(* outside temperature *)
		IF (gActData.heating.tempOutsideAct - tempOutsideActOld) > TEMP_TENDENCY_HYSTERESIS THEN
  			gHMI.heating.tempOutsideTendency := TEMP_TENDENCY_UP;
			tempOutsideActOld := gActData.heating.tempOutsideAct;
		ELSIF (gActData.heating.tempOutsideAct - tempOutsideActOld) < -TEMP_TENDENCY_HYSTERESIS THEN
  			gHMI.heating.tempOutsideTendency := TEMP_TENDENCY_DOWN;
			tempOutsideActOld := gActData.heating.tempOutsideAct;
		END_IF;		
		
		(* living room temperature *)
		IF (gActData.heating.tempLivingroomAct - tempLivingroomActOld) > TEMP_TENDENCY_HYSTERESIS THEN
  			gHMI.heating.tempLivingroomTendency := TEMP_TENDENCY_UP;
			tempLivingroomActOld := gActData.heating.tempLivingroomAct;
		ELSIF (gActData.heating.tempLivingroomAct - tempLivingroomActOld) < -TEMP_TENDENCY_HYSTERESIS THEN
  			gHMI.heating.tempLivingroomTendency := TEMP_TENDENCY_DOWN;
			tempLivingroomActOld := gActData.heating.tempLivingroomAct;
		END_IF;		
	END_IF;
	
	(* year trend *)
	FOR yearIndex := 0 TO MAX_TREND_YEAR_INDEX DO
		(* initialize date field with date and time of the previous day *)
		IF ((newPage = TRUE) AND (gHMI.general.actPage = PAGE_HS_OVERVIEW)) THEN
			fDTGetTime(enable := 1);	(* get time in DATE_AND_TIME format for easier day arithmetic *)
			DT_TO_DTStructure(fDTGetTime.DT1 - ONE_DAY, ADR(gHMI.trend.year[yearIndex].date));				(* substract a day to get the day before *)
			gHMI.trend.year[yearIndex].date.year   := gHMI.trend.year[yearIndex].date.year - yearIndex;		(* first index: current year, second: last year *)
			gHMI.trend.year[yearIndex].high.enable := TRUE;
			gHMI.trend.year[yearIndex].low.enable  := FALSE;
			gHMI.trend.year[yearIndex].heat.enable := TRUE;
			gHMI.trend.year[yearIndex].update      := TRUE;
		END_IF;

		(* curve visibility *)
		gHMI.trend.year[yearIndex].high.statusDatapoint.0 := NOT(gHMI.trend.year[yearIndex].high.enable);
		gHMI.trend.year[yearIndex].low.statusDatapoint.0  := NOT(gHMI.trend.year[yearIndex].low.enable);
		gHMI.trend.year[yearIndex].heat.statusDatapoint.0 := NOT(gHMI.trend.year[yearIndex].heat.enable);

		(* update data and trend buffer when a date has been entered *)
		IF (gHMI.trend.year[yearIndex].update = TRUE) THEN
			(* set nbDays for loop: in case of current year loop only until the day before today *)
			IF (gHMI.trend.year[yearIndex].date.year = gActData.general.time.year) THEN
				nbDays := DayOfYear(gActData.general.time);
				IF (nbDays > 1) THEN
					nbDays := nbDays - 1;		(* current day is not yet finished *)
				END_IF;
			ELSE
				nbDays := MAX_SAMPLE_INDEX_YEAR + BOOL_TO_UINT(IsLeapYear(gHMI.trend.year[yearIndex].date.year));
			END_IF;

			(* access high temperature data object *)
			fGetTrendDatObjName(templateName := DO_NAME_TREND_TEMP_HIGH, year := gHMI.trend.year[yearIndex].date.year);
			fDatObjInfo(enable := 1, pName := ADR(fGetTrendDatObjName.datObjName));

			memset(ADR(gHMI.trend.year[yearIndex].high.dataBuffer[0]), 0, SIZEOF(gHMI.trend.year[yearIndex].high.dataBuffer));
			gHMI.trend.year[yearIndex].high.nbSamples := MAX_SAMPLE_INDEX_YEAR + 1;
			gHMI.trend.year[yearIndex].high.tempAv := 0.0;
			IF (fDatObjInfo.status = 0) THEN
   				(* copy data into variable buffer for trending *)
				bufferElementREAL ACCESS fDatObjInfo.pDatObjMem;
				FOR dayIndex := 0 TO (nbDays-1) DO
					gHMI.trend.year[yearIndex].high.dataBuffer[dayIndex] := bufferElementREAL[dayIndex];
					gHMI.trend.year[yearIndex].high.tempAv := gHMI.trend.year[yearIndex].high.tempAv + gHMI.trend.year[yearIndex].high.dataBuffer[dayIndex];
				END_FOR;
				gHMI.trend.year[yearIndex].high.tempAv   := gHMI.trend.year[yearIndex].high.tempAv / UINT_TO_REAL(nbDays);									(* average high temperature *)
				gHMI.trend.year[yearIndex].high.tempDate := gHMI.trend.year[yearIndex].high.dataBuffer[DayOfYear(gHMI.trend.year[yearIndex].date) - 1];		(* temperature at selected date *)
			END_IF;			

			(* access low temperature data object *)
			fGetTrendDatObjName(templateName := DO_NAME_TREND_TEMP_LOW, year := gHMI.trend.year[yearIndex].date.year);
			fDatObjInfo(enable := 1, pName := ADR(fGetTrendDatObjName.datObjName));

			memset(ADR(gHMI.trend.year[yearIndex].low.dataBuffer[0]), 0, SIZEOF(gHMI.trend.year[yearIndex].low.dataBuffer));
			gHMI.trend.year[yearIndex].low.nbSamples := MAX_SAMPLE_INDEX_YEAR + 1;
			gHMI.trend.year[yearIndex].low.tempAv := 0.0;
			IF (fDatObjInfo.status = 0) THEN
   				(* copy data into variable buffer for trending *)
				bufferElementREAL ACCESS fDatObjInfo.pDatObjMem;
				FOR dayIndex := 0 TO (nbDays-1) DO
					gHMI.trend.year[yearIndex].low.dataBuffer[dayIndex] := bufferElementREAL[dayIndex];
					gHMI.trend.year[yearIndex].low.tempAv := gHMI.trend.year[yearIndex].low.tempAv + gHMI.trend.year[yearIndex].low.dataBuffer[dayIndex];
				END_FOR;
				gHMI.trend.year[yearIndex].low.tempAv   := gHMI.trend.year[yearIndex].low.tempAv / UINT_TO_REAL(nbDays);									(* average low temperature *)
				gHMI.trend.year[yearIndex].low.tempDate := gHMI.trend.year[yearIndex].low.dataBuffer[DayOfYear(gHMI.trend.year[yearIndex].date) - 1];		(* temperature at selected date *)
			END_IF;	

			(* average year temperature *)
			gHMI.trend.year[yearIndex].tempAv := (gHMI.trend.year[yearIndex].high.tempAv + gHMI.trend.year[yearIndex].low.tempAv) / 2; 

			(* access heating hours data object *)
			fGetTrendDatObjName(templateName := DO_NAME_TREND_HEAT, year := gHMI.trend.year[yearIndex].date.year);
			fDatObjInfo(enable := 1, pName := ADR(fGetTrendDatObjName.datObjName));

			memset(ADR(gHMI.trend.year[yearIndex].heat.dataBuffer[0]), 0, SIZEOF(gHMI.trend.year[yearIndex].heat.dataBuffer));
			gHMI.trend.year[yearIndex].heat.nbSamples  := MAX_SAMPLE_INDEX_YEAR + 1;
			gHMI.trend.year[yearIndex].heat.hoursTotal := 0;
			IF (fDatObjInfo.status = 0) THEN
   				(* copy data into variable buffer for trending *)
				bufferElementUDINT ACCESS fDatObjInfo.pDatObjMem;
				FOR dayIndex := 0 TO (nbDays-1) DO
					gHMI.trend.year[yearIndex].heat.dataBuffer[dayIndex] := bufferElementUDINT[dayIndex];
					gHMI.trend.year[yearIndex].heat.hoursTotal := gHMI.trend.year[yearIndex].heat.hoursTotal + gHMI.trend.year[yearIndex].heat.dataBuffer[dayIndex];
				END_FOR;
				gHMI.trend.year[yearIndex].heat.hoursDate := gHMI.trend.year[yearIndex].heat.dataBuffer[DayOfYear(gHMI.trend.year[yearIndex].date) - 1];	(* temperature at selected date *)
			END_IF;	

			(* update finished *)
			gHMI.trend.year[yearIndex].update := FALSE;
		END_IF;
	END_FOR;

	(* interday trend *)
	IF (new4Minute = TRUE) THEN
		gHMI.trend.day[TODAY].nbSamples := ((gActData.general.time.hour * 60 + gActData.general.time.minute) / 4) + 1;	(* absolute index to void problems after powerfail with incrementing index *)	
		IF gHMI.trend.day[TODAY].nbSamples > (MAX_SAMPLE_INDEX_DAY + 1) THEN
			gHMI.trend.day[TODAY].nbSamples := MAX_SAMPLE_INDEX_DAY + 1;												(* limit index in case something went wrong in the calculation above *)
		ELSIF gHMI.trend.day[TODAY].nbSamples = 0 THEN
			gHMI.trend.day[TODAY].nbSamples := 1;
		END_IF;
		gHMI.trend.day[TODAY].dataBuffer[gHMI.trend.day[TODAY].nbSamples - 1] := gActData.heating.tempOutsideAct;		(* log current outside temperature *)
	END_IF;
	
	(* copy temperature data of current day at midnight to yesterday buffer and reset today buffer *)
	IF ((newMinute = TRUE) AND (gActData.general.time.hour = 23) AND (gActData.general.time.minute = 59)) THEN
		memcpy(ADR(gHMI.trend.day[YESTERDAY].dataBuffer[0]), ADR(gHMI.trend.day[TODAY].dataBuffer[0]), SIZEOF(gHMI.trend.day[YESTERDAY].dataBuffer));
		memset(ADR(gHMI.trend.day[TODAY].dataBuffer[0]), 0, SIZEOF(gHMI.trend.day[TODAY].dataBuffer));
	END_IF;

	(* convert hours and minutes in minutes since midnight when entered or refresh visualization - copying to gCfg will be done by rcp_cpy task *)
	IF (gHMI.cmd.updateDateTime = TRUE) THEN
		(* heating *)
		gHMI.recipe.data.heating.startTime := gHMI.heating.startTime.hour * 60 + gHMI.heating.startTime.minute;
		gHMI.recipe.data.heating.endTime   := gHMI.heating.endTime.hour   * 60 + gHMI.heating.endTime.minute;
		
		(* out of home *)
		gHMI.recipe.data.heating.outOfHome.startDay := DayOfYear(gHMI.heating.outOfHome.startDate);
		gHMI.recipe.data.heating.outOfHome.endDay   := DayOfYear(gHMI.heating.outOfHome.startDate);

		(* hot water *)
		FOR index := 0 TO MAX_HOTWATER_TIME_INDEX DO
			gHMI.recipe.data.heating.hotwater.startTime[index] := gHMI.heating.hotwater.startTime[index].hour * 60 + gHMI.heating.hotwater.startTime[index].minute;
			gHMI.recipe.data.heating.hotwater.endTime[index]   := gHMI.heating.hotwater.endTime[index].hour   * 60 + gHMI.heating.hotwater.endTime[index].minute;
		END_FOR;
		
		gHMI.cmd.updateDateTime := FALSE;
	ELSE
		(* heating *)
		gHMI.heating.startTime.hour   := UDINT_TO_USINT(gHMI.recipe.data.heating.startTime /   60);
		gHMI.heating.startTime.minute := UDINT_TO_USINT(gHMI.recipe.data.heating.startTime MOD 60);
		gHMI.heating.endTime.hour     := UDINT_TO_USINT(gHMI.recipe.data.heating.endTime   /   60);
		gHMI.heating.endTime.minute   := UDINT_TO_USINT(gHMI.recipe.data.heating.endTime   MOD 60);
		
		(* out of home *)
		fDateOfDay(year := gActData.general.time.year, dayOfYear := UDINT_TO_UINT(gHMI.recipe.data.heating.outOfHome.startDay));
		gHMI.heating.outOfHome.startDate := fDateOfDay.outDate;
		fDateOfDay(year := gActData.general.time.year, dayOfYear := UDINT_TO_UINT(gHMI.recipe.data.heating.outOfHome.endDay));
		gHMI.heating.outOfHome.endDate := fDateOfDay.outDate;

		(* hot water *)
		FOR index := 0 TO MAX_HOTWATER_TIME_INDEX DO
			gHMI.heating.hotwater.startTime[index].hour   := UDINT_TO_USINT(gHMI.recipe.data.heating.hotwater.startTime[index] /   60);
			gHMI.heating.hotwater.startTime[index].minute := UDINT_TO_USINT(gHMI.recipe.data.heating.hotwater.startTime[index] MOD 60);
			gHMI.heating.hotwater.endTime[index].hour     := UDINT_TO_USINT(gHMI.recipe.data.heating.hotwater.endTime[index]   /   60);
			gHMI.heating.hotwater.endTime[index].minute   := UDINT_TO_USINT(gHMI.recipe.data.heating.hotwater.endTime[index]   MOD 60);
		END_FOR;		
	END_IF;

	(* visibility *)
	gHMI.heating.statusDatapointLoweringText.0 := NOT(gActData.heating.loweringActive);
	gHMI.heating.statusDatapointAlarmIndicator.0 := NOT(gAlarm.stop OR gAlarm.warning);
	
	(* screen cleaning *)
	IF (gHMI.general.actPage = PAGE_SCREEN_CLEAN) THEN
		IF screenCleanTimer > cycT THEN
			screenCleanTimer := screenCleanTimer - cycT;	
		ELSE
			gHMI.general.setPage := pageBeforeScreenClean;
		END_IF;
	ELSE
		screenCleanTimer := SCREEN_CLEAN_TIME;
		pageBeforeScreenClean := gHMI.general.actPage;
	END_IF;	
	gHMI.general.screenCleanTime := screenCleanTimer / 1000;	(* displayed in s *)


	(* screenshot of current page *)
	CASE sScrSht OF
		sWAIT_CMD:
			IF ((gHMI.cmd.doScreenShot = TRUE) AND (strlen(ADR(fileScrSht)) > 0)) THEN
				status := InitScreenShot(1, ADR(hScrSht), ADR(fileScrSht), ADR('DISK_C_ROOT'), ADR('MainHM'));
				IF (status = 0) THEN
					sScrSht := sDO_SCREEN_SHOT;
				END_IF;				
			END_IF;

		sDO_SCREEN_SHOT:
			status := ScreenShot(1, hScrSht);
			IF (status <> 1001) THEN
				sScrSht := sDEINIT;
			END_IF;				
		
		sDEINIT:
			status := DeInitScreenShot(1, hScrSht);
			IF (status = 0) THEN
				gHMI.cmd.doScreenShot := FALSE;
				sScrSht := sWAIT_CMD;
			END_IF;		
	END_CASE;

	(* LED control of PW35 visualization in basement *)
	FOR index := 0 TO MAX_SEGMENT_INDEX DO
		(* switch it on if segment is switch off to indicate active key, fast blinking if segment is switch on *)
		IF (gActData.irrigation.segment[index].switchOnRequest = TRUE) THEN
			ledControl[index] := 3;		(* fast blinking *)
		ELSE
			ledControl[index] := 0;		(* off *)
		END_IF;
	END_FOR;

END_PROGRAM
