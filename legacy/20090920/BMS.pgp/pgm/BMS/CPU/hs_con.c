/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	Heating System Control                                                       *
*                                                                                            *
*    Filename   hs_con.c                                                                     *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         28.04.05      W. Paulin     created                                         *
*  01.01         06.11.05      W. Paulin     use up all energy generated by the burner       *
*  01.02         08.12.05      W. Paulin     heat curve in PIC_HEAT_CFG                      *
*********************************************************************************************/

#include <bms_gn.h>
#include <bms_global.h>
#include <bms_io.h>

_LOCAL	DatObjInfo_typ		fDatObjInfo;
_LOCAL	RTInfo_typ			fRTInfo;
_LOCAL	hyst2p_typ			fHyst2pLivingroom;
_LOCAL	hyst2p_typ			fHyst2pBurner;
_LOCAL	pidInf_typ			pidHeating;

_LOCAL	UDINT				cycT;

_LOCAL	rcpPar_typ			rcpPar;
_LOCAL	xyPointREAL_typ		*pLinDataHeatSensor;
_LOCAL	xyPointREAL_typ		*pLinDataOutsideSensor;
_LOCAL	xyPointREAL_typ		*pLinDataInsideSensor;
_LOCAL	xyPointREAL_typ		*pHeatCurve;

_LOCAL	UDINT				linDataLenHeatSensor;
_LOCAL	UDINT				linDataLenOutsideSensor;
_LOCAL	UDINT				linDataLenInsideSensor;
_LOCAL	UDINT				dataLenHeatCurve;

_LOCAL	USINT				newMinute;
_LOCAL	USINT				oldMinute;
_LOCAL	UDINT				dayMinute;

_LOCAL	UDINT				timeIndex;
_LOCAL	UDINT				loopIndex;

_LOCAL	UINT				yearDay;
_LOCAL	REAL				sStepMixer;						/* step of mixer during in one task cycle */
_LOCAL	UDINT				mixerRefTimer;
_LOCAL	UDINT				mixerRefTime;

_LOCAL	USINT				cmdStartAT324cfg;
_LOCAL	UINT				sAT324configuration;
_LOCAL	USINT				cmdBuffer[8];
_LOCAL	USINT				resBuffer[8];
_LOCAL	CANIOcmd_typ		fCANIOcmd;

_LOCAL	DINT				heatCurve[TREND_HEAT_CURVE_NB_VALUES];
_LOCAL	DINT				*pHeatCurveData;

_LOCAL	UINT				nbHeatCurveValues;
_LOCAL	UDINT				trendIdHeatCurve;
_LOCAL	UDINT				vcHandle;
_LOCAL	UINT				actPicOld;
_LOCAL	UINT				statusTrendHeatCurve;

_LOCAL	UDINT				minRuntimeTimerBurner;
_LOCAL	BOOL				doBurnerRequest;

enum AT324_CONFIGURATION_STATES
{
	sWAIT_START_CONFIGURATION = 0,
	sWRITE_CONFIGWORD_14,
	sACTIVATE_PARAMETERS,
};


_INIT void hs_conini()
{
	fRTInfo.enable = 1;
	RTInfo(&fRTInfo);
	cycT = fRTInfo.cycle_time / 1000;

	fDatObjInfo.enable = 1;
	
	/* load linearisation for burner, boiler and flow temperature */
	fDatObjInfo.pName       = (UDINT)BMS_LIN_HEAT_DO_NAME;
	DatObjInfo(&fDatObjInfo);
	pLinDataHeatSensor      = (xyPointREAL_typ*)fDatObjInfo.pDatObjMem;
	linDataLenHeatSensor    = fDatObjInfo.len / sizeof(xyPointREAL_typ);
	
	/* load linearisation for outside sensor */
	fDatObjInfo.pName       = (UDINT)BMS_LIN_OUTSIDE_DO_NAME;
	DatObjInfo(&fDatObjInfo);
	pLinDataOutsideSensor   = (xyPointREAL_typ*)fDatObjInfo.pDatObjMem;
	linDataLenOutsideSensor = fDatObjInfo.len / sizeof(xyPointREAL_typ);

	/* load linearisation for inside sensor */
	fDatObjInfo.pName       = (UDINT)BMS_LIN_INSIDE_DO_NAME;
	DatObjInfo(&fDatObjInfo);
	pLinDataInsideSensor    = (xyPointREAL_typ*)fDatObjInfo.pDatObjMem;
	linDataLenInsideSensor  = fDatObjInfo.len / sizeof(xyPointREAL_typ);

	/* load curve of outside temperature and flow set temperature */
	fDatObjInfo.pName       = (UDINT)BMS_HEATING_CURVE;
	DatObjInfo(&fDatObjInfo);
	pHeatCurve              = (xyPointREAL_typ*)fDatObjInfo.pDatObjMem;
	dataLenHeatCurve        = fDatObjInfo.len / sizeof(xyPointREAL_typ);

	/* PID */
	pidHeating.Ta    = (REAL)cycT / 1000.0;				/* sample time of PID controller */
	pidHeating.y_max = MIXER_FULLY_OPEN_POSITION;		/* output limitation */
	pidInit(&pidHeating);

	/* MIXER */
	sStepMixer = 1.0 / (MIXER_FULLY_OPEN_TIME / MIXER_FULLY_OPEN_POSITION) * (REAL)cycT / 1000.0;
	mixerRefTime = (UDINT)(MIXER_FULLY_OPEN_TIME * 1.2 * 1000);
	mixerRefTimer = 1;		/* reference after power-up */

	/* HEAT CURVE TREND CHART */
	nbHeatCurveValues = TREND_HEAT_CURVE_NB_VALUES;
	if (nbHeatCurveValues > dataLenHeatCurve) nbHeatCurveValues = dataLenHeatCurve;
	
	TR_init( &trendIdHeatCurve, nbHeatCurveValues, 450, 240, 15, 160, TREND_COLOR_GRAY );
	TR_addGrid( trendIdHeatCurve, 30, 40, TREND_COLOR_LIGHT_GRAY );
	pHeatCurveData = &heatCurve[0];
	TR_addCurve( trendIdHeatCurve, 0, (UDINT*)&pHeatCurveData, 0, 0, 80, TREND_COLOR_RED );

	/* AT324 */
	cmdStartAT324cfg = ACTIVE;
}	/* _INIT void hs_conini() */



_CYCLIC void hs_concyc()
{
	/* generate time flag */
	if (oldMinute != gActData.general.time.minute)
	{
		newMinute = ACTIVE;
		dayMinute = (UDINT)gActData.general.time.hour * 60 + (UDINT)gActData.general.time.minute;
		oldMinute = gActData.general.time.minute;
	}
	else
	{
		newMinute = 0;
	}
	
	yearDay = dayOfYear(&gActData.general.time);

	/* VISAPI */
	if (vcHandle == 0)
	{
		vcHandle = VA_Setup(1, VISCOMP_HMI_PANEL_OBJECT_NAME);
	}
	
	/* apply recipe parameter if allowed */
	if (gCfgData.parLock == INACTIVE)
	{
		memcpy( &rcpPar, &gCfgData.rcpPar, sizeof(rcpPar) );
	}

	/* get actual temperatures out of measured raw values */
	gActData.heating.hotwater.boiler.tempAct = getChartValueY( 1 / ( 1/((REAL)aiTempBoiler/10)     - 1/(REAL)BOILER_PARALLEL_RESISTANCE  ), pLinDataHeatSensor,    linDataLenHeatSensor    );
	gActData.heating.burner.tempAct          = getChartValueY( 1 / ( 1/((REAL)aiTempBurner/10)     - 1/(REAL)BURNER_PARALLEL_RESISTANCE  ), pLinDataHeatSensor,    linDataLenHeatSensor    );
	gActData.heating.tempFlowAct             = getChartValueY( 1 / ( 1/((REAL)aiTempFlow  /10)     - 1/(REAL)FLOW_PARALLEL_RESISTANCE    ), pLinDataHeatSensor,    linDataLenHeatSensor    );
	gActData.heating.tempOutsideAct          = getChartValueY( 1 / ( 1/((REAL)aiTempOutside/10)    - 1/(REAL)OUTSIDE_PARALLEL_RESISTANCE ), pLinDataOutsideSensor, linDataLenOutsideSensor );
	gActData.heating.tempLivingroomAct       = getChartValueY( 1 / ( 1/((REAL)aiTempLivingroom/10) - 1/(REAL)INSIDE_PARALLEL_RESISTANCE  ), pLinDataInsideSensor,  linDataLenInsideSensor  );

	/* calculate set temperature for living room */
	gActData.heating.tempLivingroomSet = rcpPar.heating.tempLivingroomSet + rcpPar.heating.tempManOffset;
	
	/* lower heating if outside schedule */
	if ( (dayMinute < rcpPar.heating.startTime) || (dayMinute > rcpPar.heating.endTime) )
	{
		 gActData.heating.tempLivingroomSet += rcpPar.heating.tempLowOffset;
	}
	/* lower heating if nobody is home */
	else if ( (rcpPar.heating.outOfHome.mode == MODE_ON) && (yearDay >= rcpPar.heating.outOfHome.startDay) && (yearDay <= rcpPar.heating.outOfHome.endDay) )
	{
		 gActData.heating.tempLivingroomSet += rcpPar.heating.tempLowOffset;
	}
	
	/* activate/deactivate heating with 2point control according to living room temperature */
	fHyst2pLivingroom.xAct  = gActData.heating.tempLivingroomAct;
	fHyst2pLivingroom.xSet  = gActData.heating.tempLivingroomSet;
	fHyst2pLivingroom.pHyst = LIVING_ROOM_TEMP_POS_HYSTERESIS;
	fHyst2pLivingroom.nHyst = LIVING_ROOM_TEMP_NEG_HYSTERESIS;
	
	hyst2p( &fHyst2pLivingroom );
	gActData.heating.state = fHyst2pLivingroom.y;

	/* overule state for heating by schedule */
	if (rcpPar.heating.mode == MODE_OFF)
	{
		gActData.heating.state = INACTIVE;
	}


	/* generate state for hot water to schedule */
	gActData.heating.hotwater.state = INACTIVE;
	for ( timeIndex = 0; timeIndex < NB_HOTWATER_TIME; timeIndex++ )
	{
		if ( (dayMinute >= rcpPar.heating.hotwater.startTime[timeIndex]) && (dayMinute <= rcpPar.heating.hotwater.endTime[timeIndex]) )
		{
			gActData.heating.hotwater.state = ACTIVE;
		}
	}

	/* heating PID */
	gActData.heating.tempFlowSet = getChartValueY( gActData.heating.tempOutsideAct, pHeatCurve, dataLenHeatCurve ) + rcpPar.heating.tempFlowSetOffset;
	if (gActData.heating.state == ACTIVE)
	{
		pidHeating.e     = gActData.heating.tempFlowSet - gActData.heating.tempFlowAct;
		pidHeating.Kp    = rcpPar.heating.kp;
		pidHeating.Ti    = rcpPar.heating.ti;
		pidHeating.i_max = HEATING_PID_I_MAX;
		pid(&pidHeating);

		gActData.heating.sSetMixer = (DINT)pidHeating.y;
	}
	else
	{
		gActData.heating.sSetMixer = 0.0;
	}


	/* heating and boiler pump control */
	doFlowPump   = (BOOL)gActData.heating.state;
	doBoilerPump = (BOOL)gActData.heating.hotwater.state;

	/* override heating pump in case burner is still warm in order to use up all energy generated by the burner */
	if ( (rcpPar.heating.mode             == MODE_ON)  && 
	     (gActData.heating.hotwater.state == INACTIVE) &&
	     (gActData.heating.state          == INACTIVE) && 
	     ((gActData.heating.burner.tempAct - gActData.heating.tempFlowAct) > 2.0) )
	{
		doFlowPump                 = ACTIVE;
		gActData.heating.sSetMixer = 70.0;
	}

	/* override heating pump in case outside temperature is to low -> avoid freezing */
	if (gActData.heating.tempOutsideAct <= CRITICAL_FREEZING_OUTSIDE_TEMP)
	{
		doFlowPump = ACTIVE;
	}

	/* mixer control */
	gActData.heating.sSetMixer = MIN(MAX(gActData.heating.sSetMixer, 0), MIXER_FULLY_OPEN_POSITION);
	
	if ( abs(gActData.heating.sSetMixer - gActData.heating.sActMixer) > MIXER_ZERO_WINDOW )
	{
		if ( (gActData.heating.sSetMixer - gActData.heating.sActMixer) > 0)
		{
			doMixerOpen  = ACTIVE;
			doMixerClose = INACTIVE;
			
			gActData.heating.sActMixer += sStepMixer;
		}
		else
		{
			doMixerOpen  = INACTIVE;
			doMixerClose = ACTIVE;
	
			gActData.heating.sActMixer -= sStepMixer;
		}
	}
	else
	{
		doMixerOpen  = INACTIVE;
		doMixerClose = INACTIVE;
	}
	
	/* limit actual position */
	gActData.heating.sActMixer = MIN(MAX(gActData.heating.sActMixer, 0), MIXER_FULLY_OPEN_POSITION);

	/* reference mixer every midnight in order to compensate lag errors */
	if ( (mixerRefTimer > 0) || ((gActData.general.time.hour == 0) && (newMinute)) )
	{
		mixerRefTimer += cycT;
		
		if (mixerRefTimer < mixerRefTime)
		{
			doMixerOpen  = INACTIVE;
			doMixerClose = ACTIVE;
		}
		else
		{
			mixerRefTimer = 0;
			gActData.heating.sActMixer = 0;

			doMixerOpen  = INACTIVE;
			doMixerClose = INACTIVE;
		}
	}
	

	/* burner control -> boiler rules: set temperature from boiler if heating also active */
	if (gActData.heating.hotwater.state == ACTIVE)
	{
		gActData.heating.burner.tempSet = rcpPar.heating.hotwater.tempSet + TEMP_SET_OFFSET;
	}
	else if (gActData.heating.state == ACTIVE)
	{
		gActData.heating.burner.tempSet = gActData.heating.tempFlowSet + TEMP_SET_OFFSET;
	}
	else
	{
		gActData.heating.burner.tempSet = 0;
	}
	
	fHyst2pBurner.xAct  = gActData.heating.burner.tempAct;
	fHyst2pBurner.xSet  = gActData.heating.burner.tempSet;
	fHyst2pBurner.pHyst = BURNER_TEMP_HYSTERESIS;
	fHyst2pBurner.nHyst = BURNER_TEMP_HYSTERESIS;
	
	hyst2p( &fHyst2pBurner );
	
	doBurnerRequest = (BOOL)fHyst2pBurner.y;

	/* ensure minimum runtime of burner */
	if ( (doBurnerRequest | doBurner) == INACTIVE ) 
	{
		minRuntimeTimerBurner = 0;
	}

	if (doBurnerRequest == ACTIVE)
	{
		doBurner = ACTIVE;
		minRuntimeTimerBurner += cycT;
	}
	else
	{
		if ( (minRuntimeTimerBurner > 0) && (minRuntimeTimerBurner < BURNER_MIN_RUNTIME) )
		{
			doBurner = ACTIVE;
			minRuntimeTimerBurner += cycT;
		}
		else
		{
			doBurner = INACTIVE;
		}
	}

	

	/* statistics */
	if ( (doBurner == ACTIVE) && (newMinute) )
	{
		gActData.statistics.heating.onTimeBurner++;
	}
	if ( (doFlowPump == ACTIVE) && (newMinute) )
	{
		gActData.statistics.heating.onTimeFlowPump++;
	}


	/***********************************************************************************************************************/
	/*** ALARM HANDLING                                                                                                  ***/
	/***********************************************************************************************************************/
	if (gActData.heating.burner.tempAct >= MAX_BURNER_TEMP)
	{
		gAlarm.request[ALARM_OVERTEMPERATURE_BURNER] = ACTIVE;
	}
	else
	{
		gAlarm.request[ALARM_OVERTEMPERATURE_BURNER] = INACTIVE;
	}

	if (gActData.heating.hotwater.boiler.tempAct >= MAX_BOILER_TEMP)
	{
		gAlarm.request[ALARM_OVERTEMPERATURE_BOILER] = ACTIVE;
	}
	else
	{
		gAlarm.request[ALARM_OVERTEMPERATURE_BOILER] = INACTIVE;
	}

	if (gAlarm.eStop == ACTIVE)
	{
		doBurner     = INACTIVE;
		doBoilerPump = INACTIVE;
		doFlowPump   = INACTIVE;
		doMixerOpen  = INACTIVE;
		doMixerClose = INACTIVE;
	}
	
	
	/***********************************************************************************************************************/
	/*** HEAT CURVE TREND                                                                                                ***/
	/***********************************************************************************************************************/
	if ( (actPicOld != gHMIcmd.general.actPic) && (gHMIcmd.general.actPic == PIC_HEAT_CFG) )
	{
		gHMIcmd.heating.cmdUpdateHeatCurve = ACTIVE;	
	}

	if ( (gHMIcmd.heating.cmdUpdateHeatCurve == ACTIVE) || (statusTrendHeatCurve != 0) )
	{
		/* draw trend */
		if (statusTrendHeatCurve == 0)
		{
			statusTrendHeatCurve = TR_draw( 1, trendIdHeatCurve, vcHandle );
			gHMIcmd.heating.cmdUpdateHeatCurve = INACTIVE;	
		}
		else
		{
			statusTrendHeatCurve = TR_redraw( 1, trendIdHeatCurve, vcHandle );
		}
	}


	
	/* fill curve data with values */
	if (pHeatCurve != 0)
	{
		for ( loopIndex = 0; loopIndex < nbHeatCurveValues; loopIndex++ )
		{
			heatCurve[loopIndex] = (DINT)pHeatCurve[loopIndex].y + rcpPar.heating.tempFlowSetOffset;
		}
	}


	/***********************************************************************************************************************/
	/*** AT324 CONFIGURATION                                                                                             ***/
	/***********************************************************************************************************************/
	switch(sAT324configuration)
	{
		case sWAIT_START_CONFIGURATION:
			if (cmdStartAT324cfg == 1)
			{
				sAT324configuration = sWRITE_CONFIGWORD_14;
				aoAT324cfgWord14    = AT324_ALL_CHANNELS_RESISTANCE_MEASUREMENT;
			}
		break;
	  
		case sWRITE_CONFIGWORD_14:
			cmdBuffer[0] = 0;															/* free number in range 0-126 */
			cmdBuffer[1] = CANIO_WRITE_PARAMETER;										/* 11 ...write parameter */
			cmdBuffer[2] = CANIO_PARAMETER_FOR_SCREW_IN_MODULE;							/* 28 ...parameter for screw in module */
			cmdBuffer[3] = 0;															/*  0 ...screw-in module 1 and 2 */    
			
			cmdBuffer[4] = (USINT)(aoAT324cfgWord14 >> 8);								/* High Byte of configword 14 / slot 1 */
			cmdBuffer[5] = (USINT)aoAT324cfgWord14;										/* Low  Byte of configword 14 / slot 1 */
			
			cmdBuffer[6] = (USINT)(aoAT324cfgWord14 >> 8);								/* High Byte of configword 14 / slot 2 */
			cmdBuffer[7] = (USINT)aoAT324cfgWord14;										/* Low  Byte of configword 14 / slot 2 */
			
			fCANIOcmd.enable = 1;
			fCANIOcmd.busnr  = HEATING_EX270_BUS_NUMBER;
			fCANIOcmd.nodenr = HEATING_EX270_NODE_NUMBER;
			fCANIOcmd.cmd    = (UDINT)&cmdBuffer[0];
			fCANIOcmd.res    = (UDINT)&resBuffer[0];
			
			CANIOcmd(&fCANIOcmd);
			    
			if (fCANIOcmd.status != ERR_FUB_BUSY)										/* ignore errors at this possition -> will be done anyway in next step */
			{
				sAT324configuration = sACTIVATE_PARAMETERS;
			}
		break;
	  
		case sACTIVATE_PARAMETERS:
			cmdBuffer[0] = 0;															/* free number in range 0-126 */
			cmdBuffer[1] = CANIO_ACTIVATE_PARAMETER;									/* 12 ...activate parameter */
			cmdBuffer[2] = 0;															/* not used */
			cmdBuffer[3] = 0;															/* no block transfer */    
			
			cmdBuffer[4] = 0;															/* not used */
			cmdBuffer[5] = 0;															/* not used */
			cmdBuffer[6] = 0;															/* not used */
			cmdBuffer[7] = 0;															/* not used */
			
			fCANIOcmd.enable = 1;
			fCANIOcmd.busnr  = HEATING_EX270_BUS_NUMBER;
			fCANIOcmd.nodenr = HEATING_EX270_NODE_NUMBER;
			fCANIOcmd.cmd    = (UDINT)&cmdBuffer[0];
			fCANIOcmd.res    = (UDINT)&resBuffer[0];
			
			CANIOcmd(&fCANIOcmd);
			
			if (fCANIOcmd.status != ERR_FUB_BUSY)										/* all done,... */
			{
				/* if node is not responding or not (yet) set alarm and keep trying if possible */
				if ( (fCANIOcmd.status == 8985) || (fCANIOcmd.status == 8979) )
				{
					gAlarm.request[ALARM_NO_CONNECTION_HEATING_EX270] = ACTIVE;
				}
				else
				{
					cmdStartAT324cfg = 0;
					gAlarm.request[ALARM_NO_CONNECTION_HEATING_EX270] = INACTIVE;
				}
				       
				sAT324configuration = sWAIT_START_CONFIGURATION;
			}
		break;
	}

	actPicOld = gHMIcmd.general.actPic;
}	/* _CYCLIC void hs_concyc() */