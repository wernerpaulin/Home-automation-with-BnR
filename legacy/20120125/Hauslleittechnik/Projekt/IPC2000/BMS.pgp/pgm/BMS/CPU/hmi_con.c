/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	HMI Control                                                                  *
*                                                                                            *
*    Filename   hmi_con.c                                                                    *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*                                                                                            *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         28.04.05      W. Paulin     created                                         *
*  01.01         28.08.05      W. Paulin     bugfix: date calculation by touch position      *
*  01.02         01.11.05      W. Paulin     init page handling modified: no splash timer    *
*                                            trend date set when trend page opened           *
*  01.03         09.05.08      W. Paulin     in case of current year use current number of   *
*                                            days for average measurement                    *
*  01.04         03.01.10      W. Paulin     delete data in trend buffer before writing new  *
*                                            data. nbDays div by zero protection corrected   *
*********************************************************************************************/

#include <bms_gn.h>
#include <bms_global.h>

_LOCAL	RTInfo_typ			fRTInfo;
_LOCAL	TouchAction			touchAction;
_LOCAL	dateOfYearDay_typ	fDateOfYearDay;
_LOCAL	DatObjUpdate_typ	fDatObjUpdateYearTempHigh;
_LOCAL	DatObjUpdate_typ	fDatObjUpdateYearTempLow;
_LOCAL	DatObjUpdate_typ	fDatObjUpdateYearHeat;
_LOCAL	DatObjInfo_typ		fDatObjInfo;

_LOCAL	USINT		initOk;

_LOCAL	USINT		newMinute;
_LOCAL	USINT		oldMinute;
_LOCAL	USINT		cntMinute;
_LOCAL	USINT		new4Minute;


_LOCAL	UDINT		cycT;
_LOCAL	USINT		alarmStatus;
_LOCAL	UDINT		vcHandle;

_LOCAL	USINT		tempOutsideTendency;
_LOCAL	USINT		tempLivingroomTendency;
_LOCAL	REAL		tempOutsideActOld;
_LOCAL	REAL		tempLivingroomActOld;

_LOCAL	UDINT		segmentIndex;
_LOCAL	UDINT		timeIndex;
_LOCAL	UDINT		yearIndex;
_LOCAL	UDINT		dayIndex;

_LOCAL	USINT		cmdUpdateSegmentCfg[NB_SEGMENT];
_LOCAL	USINT		cmdUpdateHeatingCfg;
_LOCAL	USINT		cmdUpdateOutOfHomeCfg;
_LOCAL	USINT		cmdUpdateTempManOffset;
_LOCAL	USINT		cmdUpdateYearTrend;

_LOCAL	UINT		status;

_LOCAL	DTStructure	rcpDateTime;

_LOCAL	UDINT		trendIdTempYear;
_LOCAL	UDINT		trendIdHeatHourYear;
_LOCAL	UDINT		trendIdTempDay;

_LOCAL	UDINT		hGridTempYear;
_LOCAL	UDINT		hGridHeatHourYear;

_LOCAL	UINT		actPicOld;
_LOCAL	USINT		trendDOname[9];
_LOCAL	UINT		status;
_LOCAL	UINT		statusTrendYearTemp;
_LOCAL	UINT		statusTrendYearHeat;
_LOCAL	UINT		statusTrendDayTemp;
_LOCAL	UINT		nbDays;

_LOCAL	DINT		tempHighTot[TREND_NB_YEAR];
_LOCAL	DINT		tempHighAv[TREND_NB_YEAR];
_LOCAL	DINT		tempLowTot[TREND_NB_YEAR];
_LOCAL	DINT		tempLowAv[TREND_NB_YEAR];

_LOCAL	REAL		dayTempHigh;
_LOCAL	REAL		dayTempLow;
_LOCAL	UDINT		dayHeatHours;
_LOCAL	UDINT		sumDayMonthYear[TREND_NB_YEAR];
_LOCAL	DINT		dayTempDINT;


_LOCAL	actDataStatistics_typ	*pStatistics;

_LOCAL	trendDebug_typ	trendDebug;
_LOCAL	DatObjUpdate_typ	fDatObjUpdateYearTempDebug;
_LOCAL	DatObjUpdate_typ	fDatObjUpdateYearHeatDebug;


/* makros */
USINT dayPerMonth[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		/* number days per month - without leap year - starting at index #1 */
#define DRAW_GRID_MONTH(hGrid, y1, y2)											\
{																				\
	for ( dayIndex = 0, timeIndex = 1; timeIndex <= 12; timeIndex++ )			\
	{																			\
		dayIndex += dayPerMonth[timeIndex];										\
		vsLine( hGrid, dayIndex, y1, dayIndex, y2, TREND_COLOR_LIGHT_GRAY );	\
	}																			\
}



_INIT void hmi_conini()
{
	fRTInfo.enable = 1;
	RTInfo(&fRTInfo);
	cycT = fRTInfo.cycle_time / 1000;
	
	initOk = INACTIVE;
	
	/* TREND: Temperature - year */
	TR_init( &trendIdTempYear, 366, 40, 60, 1, 100, TREND_COLOR_GRAY );
	TR_addGrid( trendIdTempYear, 0, 0, TREND_COLOR_LIGHT_GRAY );
	TR_action( trendIdTempYear, TR_ACTION_GET_GRID_HANDLE, (UDINT)&hGridTempYear );
	DRAW_GRID_MONTH( hGridTempYear, 0, 100 );

	/* year #0 */
	status = TMP_alloc( sizeof(REAL) * 366, (void**)&gHMIcmd.trend.year[0].high.pData );
	if (status) return;
	status = TMP_alloc( sizeof(REAL) * 366, (void**)&gHMIcmd.trend.year[0].low.pData );
	if (status) return;
	TR_addCurve( trendIdTempYear, 0, (UDINT*)&gHMIcmd.trend.year[0].high.pData, &gHMIcmd.trend.year[0].high.enable, -150, 350, TREND_COLOR_BLACK );
	TR_action( trendIdTempYear, TR_ACTION_GET_CURVE_ID, (UDINT)&gHMIcmd.trend.year[0].high.curveId );
	TR_addCurve( trendIdTempYear, 0, (UDINT*)&gHMIcmd.trend.year[0].low.pData,  &gHMIcmd.trend.year[0].low.enable,  -150, 350, TREND_COLOR_ORANGE );
	TR_action( trendIdTempYear, TR_ACTION_GET_CURVE_ID, (UDINT)&gHMIcmd.trend.year[0].low.curveId );

	/* cursor */
	gHMIcmd.trend.year[0].cursorX.enable         = 1;
	gHMIcmd.trend.year[0].cursorX.color          = TREND_COLOR_BLACK;
	gHMIcmd.trend.year[0].cursorX.x              = 0;
	gHMIcmd.trend.year[0].cursorX.y              = 0;

	/*
	TR_setCursorXY( gHMIcmd.trend.year[0].high.curveId, (UDINT)&gHMIcmd.trend.year[0].cursorX, 0, 0, 0, 0, 0 );
	TR_setCursorXY( gHMIcmd.trend.year[0].low.curveId,  (UDINT)&gHMIcmd.trend.year[0].cursorX, 0, 0, 0, 0, 0 );
	*/

	/* year #1 */
	status = TMP_alloc( sizeof(REAL) * 366, (void**)&gHMIcmd.trend.year[1].high.pData );
	if (status) return;
	status = TMP_alloc( sizeof(REAL) * 366, (void**)&gHMIcmd.trend.year[1].low.pData );
	if (status) return;
	TR_addCurve( trendIdTempYear, 0, (UDINT*)&gHMIcmd.trend.year[1].high.pData, &gHMIcmd.trend.year[1].high.enable, -150, 350, TREND_COLOR_RED );
	TR_action( trendIdTempYear, TR_ACTION_GET_CURVE_ID, (UDINT)&gHMIcmd.trend.year[1].high.curveId );
	TR_addCurve( trendIdTempYear, 0, (UDINT*)&gHMIcmd.trend.year[1].low.pData,  &gHMIcmd.trend.year[1].low.enable,  -150, 350, TREND_COLOR_BLUE );
	TR_action( trendIdTempYear, TR_ACTION_GET_CURVE_ID, (UDINT)&gHMIcmd.trend.year[1].low.curveId );

	/* cursor */
	gHMIcmd.trend.year[1].cursorX.enable         = 1;
	gHMIcmd.trend.year[1].cursorX.color          = TREND_COLOR_BLACK;
	gHMIcmd.trend.year[1].cursorX.x              = 0;
	gHMIcmd.trend.year[1].cursorX.y              = 0;
	
	TR_setCursorXY( gHMIcmd.trend.year[1].high.curveId, (UDINT)&gHMIcmd.trend.year[1].cursorX, 0, 0, 0, 0, 0 );
	/*TR_setCursorXY( gHMIcmd.trend.year[1].low.curveId,  (UDINT)&gHMIcmd.trend.year[1].cursorX, 0, 0, 0, 0, 0 );*/

	/* TREND: Heating hours - year */
	TR_init( &trendIdHeatHourYear, 366, 40, 190, 1, 50, TREND_COLOR_GRAY );
	TR_addGrid( trendIdHeatHourYear, 0, 0, TREND_COLOR_LIGHT_GRAY );
	TR_action( trendIdHeatHourYear, TR_ACTION_GET_GRID_HANDLE, (UDINT)&hGridHeatHourYear );
	DRAW_GRID_MONTH( hGridHeatHourYear, 0, 50 );

	status = TMP_alloc( sizeof(UDINT) * 366, (void**)&gHMIcmd.trend.year[0].heat.pData );
	if (status) return;
	status = TMP_alloc( sizeof(UDINT) * 366, (void**)&gHMIcmd.trend.year[1].heat.pData );
	if (status) return;

	TR_addCurve( trendIdHeatHourYear, 0, (UDINT*)&gHMIcmd.trend.year[0].heat.pData, 0, 0, 100, TREND_COLOR_GREEN );
	TR_action( trendIdHeatHourYear, TR_ACTION_GET_CURVE_ID, (UDINT)&gHMIcmd.trend.year[0].heat.curveId );
	TR_addCurve( trendIdHeatHourYear, 0, (UDINT*)&gHMIcmd.trend.year[1].heat.pData, 0, 0, 100, TREND_COLOR_PURPLE );
	TR_setCursorXY( gHMIcmd.trend.year[0].heat.curveId, (UDINT)&gHMIcmd.trend.year[0].cursorX, 0, 0, 0, 0, 0 );

	/* TREND: Temperature - interday */
	TR_init( &trendIdTempDay, 360, 40, 300, 1, 100, TREND_COLOR_GRAY );
	TR_addGrid( trendIdTempDay, 15, 10, TREND_COLOR_LIGHT_GRAY );

	TR_addCurve( trendIdTempDay, &dayTempDINT, (DINT*)&gHMIcmd.trend.day[0].pData, 0, -150, 350, TREND_COLOR_ORANGE );
	TR_addCurve( trendIdTempDay,            0, (DINT*)&gHMIcmd.trend.day[1].pData, 0, -150, 350, TREND_COLOR_BLACK );

	dayTempHigh = -1000;
	dayTempLow  = 1000;

	fDatObjInfo.enable = 1;
	fDatObjInfo.pName  = (UDINT)BMS_STATISTICS_DO_NAME;
	DatObjInfo(&fDatObjInfo);
	pStatistics = (actDataStatistics_typ *)fDatObjInfo.pDatObjMem;

	initOk = ACTIVE;
}	/* _INIT void hmi_conini() */



_CYCLIC void hmi_concyc()
{
	/* generate time flag */
	if (oldMinute != gActData.general.time.minute)
	{
		newMinute = ACTIVE;
		cntMinute++;
		oldMinute = gActData.general.time.minute;
	}
	else
	{
		newMinute = 0;
	}

	/* four minute flag */
	if (cntMinute >= 4)
	{
		new4Minute = ACTIVE;
		cntMinute  = 0;
	}
	else
	{
		new4Minute = INACTIVE;
	}

	/* VISAPI */
	if (vcHandle == 0)
	{
		vcHandle = VA_Setup(1, VISCOMP_HMI_PANEL_OBJECT_NAME);
	}

	
	/* get touch coordinates */
	if (VA_Saccess( 1, vcHandle ) == 0)
	{
		VA_GetTouchAction( 1, vcHandle, 0, (UDINT)&touchAction );
		VA_Srelease( 1, vcHandle );
	}


	/* init picture handling */
	if ( (gHMIcmd.general.actPic == PIC_INIT) && (touchAction.status == 1) )
	{
		gHMIcmd.general.setPic = PIC_TREND;
	}
	
	/* Touch calibration */
	if (gHMIcmd.general.cmdTouchCal != TOUCH_CALIBRATION_DONE) 
	{
		if ( VA_Saccess(1, vcHandle) == 0 )
		{
			switch (gHMIcmd.general.cmdTouchCal)
			{
				case CHANGE_TO_TOUCH_CALIBRATION_PICTURE:
					gHMIcmd.general.setPic = PIC_TOUCH_CAL;
					gHMIcmd.general.cmdTouchCal = START_TOUCH_CALIBRATION;
				break;

				case START_TOUCH_CALIBRATION:
					if (gHMIcmd.general.actPic == PIC_TOUCH_CAL)
					{
						VA_StartTouchCal(1, vcHandle);
						gHMIcmd.general.cmdTouchCal = GET_TOUCH_CALIBRATION_STATUS;
					}
				break;

				case GET_TOUCH_CALIBRATION_STATUS:
					status = VA_GetCalStatus (1, vcHandle);
	
					if ((status == 0) || (status == 0xFFFF))				/* all done or a general error occured */
					{
						gHMIcmd.general.cmdTouchCal = TOUCH_CALIBRATION_DONE;
						gHMIcmd.general.setPic      = PIC_SERVICE;
					}
				break;
			} /* switch (gHMIcmd.general.cmdTouchCal) */
		} /* if ( VA_Saccess(1, vcHandle) == 0 ) */
		
		VA_Srelease(1, vcHandle);
	}


	/* tendency of temperatures */
	if (newMinute)
	{
		/* outside temperature */
		if ( (gActData.heating.tempOutsideAct - tempOutsideActOld) >= TEMP_TENDENY_HYSTERESIS )
		{
			tempOutsideTendency = 1;
			tempOutsideActOld   = gActData.heating.tempOutsideAct;
		}
		else if ( (gActData.heating.tempOutsideAct - tempOutsideActOld) <= -TEMP_TENDENY_HYSTERESIS )
		{
			tempOutsideTendency = 0;
			tempOutsideActOld   = gActData.heating.tempOutsideAct;
		}

		/* living room temperature */
		if ( (gActData.heating.tempLivingroomAct - tempLivingroomActOld) >= TEMP_TENDENY_HYSTERESIS )
		{
			tempLivingroomTendency = 1;
			tempLivingroomActOld   = gActData.heating.tempLivingroomAct;
		}
		else if ( (gActData.heating.tempLivingroomAct - tempLivingroomActOld) <= -TEMP_TENDENY_HYSTERESIS )
		{
			tempLivingroomTendency = 0;
			tempLivingroomActOld   = gActData.heating.tempLivingroomAct;
		}
	}
	

	/* alarm indication */
	if (gAlarm.nbPending == 0)
	{
		alarmStatus = 0;
	}
	else
	{
		alarmStatus = 1;
	}
	
	/* time conversions - irrigation plant */
	for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ )
	{
		for ( timeIndex = 0; timeIndex < NB_IRRIGATION_START_TIME; timeIndex++ )
		{
			if (cmdUpdateSegmentCfg[segmentIndex] == ACTIVE)
			{
				gHMIrcpPar.irrigation.segment[segmentIndex].startTime[timeIndex]  = gHMIcmd.irrigation.segment[segmentIndex].time[timeIndex].hour * 60 + gHMIcmd.irrigation.segment[segmentIndex].time[timeIndex].minute;
				gHMIrcpPar.irrigation.segment[segmentIndex].duration[timeIndex]   = gHMIcmd.irrigation.segment[segmentIndex].time[timeIndex].duration;
			}
			else
			{
				gHMIcmd.irrigation.segment[segmentIndex].time[timeIndex].hour     = gHMIrcpPar.irrigation.segment[segmentIndex].startTime[timeIndex] / 60;
				gHMIcmd.irrigation.segment[segmentIndex].time[timeIndex].minute   = gHMIrcpPar.irrigation.segment[segmentIndex].startTime[timeIndex] % 60;
				gHMIcmd.irrigation.segment[segmentIndex].time[timeIndex].duration = gHMIrcpPar.irrigation.segment[segmentIndex].duration[timeIndex];
			}
		} /* for ( timeIndex = 0; timeIndex < NB_IRRIGATION_START_TIME; timeIndex++ ) */
		
		cmdUpdateSegmentCfg[segmentIndex] = INACTIVE;		
	} /* for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ ) */
	
	
	/* time conversion - heating system */
	if (cmdUpdateHeatingCfg == ACTIVE)
	{
		gHMIrcpPar.heating.startTime = gHMIcmd.heating.startTime.hour * 60 + gHMIcmd.heating.startTime.minute;
		gHMIrcpPar.heating.endTime   = gHMIcmd.heating.endTime.hour   * 60 + gHMIcmd.heating.endTime.minute;
		
		for ( timeIndex = 0; timeIndex < NB_HOTWATER_TIME; timeIndex++ )
		{
			gHMIrcpPar.heating.hotwater.startTime[timeIndex] = gHMIcmd.heating.hotwater.startTime[timeIndex].hour * 60 + gHMIcmd.heating.hotwater.startTime[timeIndex].minute;
			gHMIrcpPar.heating.hotwater.endTime[timeIndex]   = gHMIcmd.heating.hotwater.endTime[timeIndex].hour   * 60 + gHMIcmd.heating.hotwater.endTime[timeIndex].minute;
		} /* for ( timeIndex = 0; timeIndex < NB_HOTWATER_TIME; timeIndex++ ) */
		
		cmdUpdateHeatingCfg = INACTIVE;	
	}
	else
	{
		gHMIcmd.heating.startTime.hour   = gHMIrcpPar.heating.startTime / 60;
		gHMIcmd.heating.startTime.minute = gHMIrcpPar.heating.startTime % 60;

		gHMIcmd.heating.endTime.hour   = gHMIrcpPar.heating.endTime   / 60;
		gHMIcmd.heating.endTime.minute = gHMIrcpPar.heating.endTime   % 60;
		
		for ( timeIndex = 0; timeIndex < NB_HOTWATER_TIME; timeIndex++ )
		{
			gHMIcmd.heating.hotwater.startTime[timeIndex].hour   = gHMIrcpPar.heating.hotwater.startTime[timeIndex] / 60;
			gHMIcmd.heating.hotwater.startTime[timeIndex].minute = gHMIrcpPar.heating.hotwater.startTime[timeIndex] % 60;
			
			gHMIcmd.heating.hotwater.endTime[timeIndex].hour     = gHMIrcpPar.heating.hotwater.endTime[timeIndex] / 60;
			gHMIcmd.heating.hotwater.endTime[timeIndex].minute   = gHMIrcpPar.heating.hotwater.endTime[timeIndex] % 60;
		} /* for ( timeIndex = 0; timeIndex < NB_HOTWATER_TIME; timeIndex++ ) */
	}
	
	/* day conversion - heating system */
	if (cmdUpdateOutOfHomeCfg == ACTIVE)
	{
		gHMIcmd.heating.cmdUpdateHeatCurve = ACTIVE;
		
		memcpy( &rcpDateTime, &gActData.general.time, sizeof(rcpDateTime) );

		rcpDateTime.day   = gHMIcmd.heating.outOfHome.startDate.day;
		rcpDateTime.month = gHMIcmd.heating.outOfHome.startDate.month;
		gHMIrcpPar.heating.outOfHome.startDay = dayOfYear(&rcpDateTime);   

		rcpDateTime.day   = gHMIcmd.heating.outOfHome.endDate.day;
		rcpDateTime.month = gHMIcmd.heating.outOfHome.endDate.month;
		gHMIrcpPar.heating.outOfHome.endDay = dayOfYear(&rcpDateTime);   
		
		cmdUpdateOutOfHomeCfg = INACTIVE;
	}
	else
	{
		fDateOfYearDay.year      = gActData.general.time.year;

		fDateOfYearDay.dayOfYear = gHMIrcpPar.heating.outOfHome.startDay;
		dateOfYearDay(&fDateOfYearDay);
		gHMIcmd.heating.outOfHome.startDate.day   = fDateOfYearDay.day;
		gHMIcmd.heating.outOfHome.startDate.month = fDateOfYearDay.month;
		
		fDateOfYearDay.dayOfYear = gHMIrcpPar.heating.outOfHome.endDay;
		dateOfYearDay(&fDateOfYearDay);
		gHMIcmd.heating.outOfHome.endDate.day   = fDateOfYearDay.day;
		gHMIcmd.heating.outOfHome.endDate.month = fDateOfYearDay.month;
	}	
	
	
	/* convert manual tempoffset */
	if (cmdUpdateTempManOffset == ACTIVE)
	{
		gHMIrcpPar.heating.tempManOffset = (REAL)gHMIcmd.heating.tempManOffset - 4;
		cmdUpdateOutOfHomeCfg = INACTIVE;
	}
	else
	{
		gHMIcmd.heating.tempManOffset = (REAL)gHMIrcpPar.heating.tempManOffset + 4;
	}



	/***********************************************************************************************************************/
	/*** YEAR TEMPERATURE / HEATING HOURS TREND                                                                          ***/
	/***********************************************************************************************************************/
	/* data logging - high temperature */
	if ( dayTempHigh < gActData.heating.tempOutsideAct ) dayTempHigh = gActData.heating.tempOutsideAct;

	if ( ((gActData.general.time.hour == 23) && (gActData.general.time.minute == 59) && (newMinute)) || (fDatObjUpdateYearTempHigh.status == AUX_ERR_FUB_BUSY) )
	{
		memset( &trendDOname[0], 0, sizeof(trendDOname) );
		strcpy( &trendDOname[0], BMS_TEMP_HIGH_DO_NAME_BASE);
		trendDOname[strlen(trendDOname)] = gActData.general.time.year / 10 % 10 + '0';
		trendDOname[strlen(trendDOname)] = gActData.general.time.year /  1 % 10 + '0';

		fDatObjUpdateYearTempHigh.pName         = (UDINT)&trendDOname[0];
		fDatObjUpdateYearTempHigh.pData         = (UDINT)&dayTempHigh;
		fDatObjUpdateYearTempHigh.index         = dayOfYear(&gActData.general.time) - 1;
		fDatObjUpdateYearTempHigh.nbElement     = 366;
		fDatObjUpdateYearTempHigh.sizeOfElement = sizeof(REAL);
		
		DatObjUpdate(&fDatObjUpdateYearTempHigh);
		
		if (fDatObjUpdateYearTempHigh.status == 0)
		{
			dayTempHigh = -1000;
		}
	}

	/* data logging - low temperature */
	if ( dayTempLow > gActData.heating.tempOutsideAct ) dayTempLow = gActData.heating.tempOutsideAct;

	if ( ((gActData.general.time.hour == 23) && (gActData.general.time.minute == 59) && (newMinute)) || (fDatObjUpdateYearTempLow.status == AUX_ERR_FUB_BUSY) )
	{
		memset( &trendDOname[0], 0, sizeof(trendDOname) );
		strcpy( &trendDOname[0], BMS_TEMP_LOW_DO_NAME_BASE);
		trendDOname[strlen(trendDOname)] = gActData.general.time.year / 10 % 10 + '0';
		trendDOname[strlen(trendDOname)] = gActData.general.time.year /  1 % 10 + '0';

		fDatObjUpdateYearTempLow.pName         = (UDINT)&trendDOname[0];
		fDatObjUpdateYearTempLow.pData         = (UDINT)&dayTempLow;
		fDatObjUpdateYearTempLow.index         = dayOfYear(&gActData.general.time) - 1;
		fDatObjUpdateYearTempLow.nbElement     = 366;
		fDatObjUpdateYearTempLow.sizeOfElement = sizeof(REAL);
		
		DatObjUpdate(&fDatObjUpdateYearTempLow);

		if (fDatObjUpdateYearTempLow.status == 0)
		{
			dayTempLow = 1000;
		}
	}

	/* data logging - heating hours */
	if (fDatObjUpdateYearHeat.status != AUX_ERR_FUB_BUSY)
	{
		dayHeatHours = gActData.statistics.heating.onTimeBurner - pStatistics->heating.onTimeBurner;
	}
	
	if ( ((gActData.general.time.hour == 23) && (gActData.general.time.minute == 59) && (newMinute)) || (fDatObjUpdateYearHeat.status == AUX_ERR_FUB_BUSY) )
	{
		memset( &trendDOname[0], 0, sizeof(trendDOname) );
		strcpy( &trendDOname[0], BMS_HEAT_DO_NAME_BASE);
		trendDOname[strlen(trendDOname)] = gActData.general.time.year / 10 % 10 + '0';
		trendDOname[strlen(trendDOname)] = gActData.general.time.year /  1 % 10 + '0';

		fDatObjUpdateYearHeat.pName         = (UDINT)&trendDOname[0];
		fDatObjUpdateYearHeat.pData         = (UDINT)&dayHeatHours;
		fDatObjUpdateYearHeat.index         = dayOfYear(&gActData.general.time) - 1;
		fDatObjUpdateYearHeat.nbElement     = 366;
		fDatObjUpdateYearHeat.sizeOfElement = sizeof(UDINT);
		
		DatObjUpdate(&fDatObjUpdateYearHeat);
	}


	/* trend display */
	for ( yearIndex = 0; yearIndex < TREND_NB_YEAR; yearIndex++ )
	{
		/* force update on picture change -> update usually trigger on input complition in vis */
		if ( (actPicOld != gHMIcmd.general.actPic) && (gHMIcmd.general.actPic == PIC_TREND) )
		{
			gHMIcmd.trend.year[yearIndex].cmdUpdate = ACTIVE;
			
			memcpy( &gHMIcmd.trend.year[yearIndex].date, &gActData.general.time, sizeof(gHMIcmd.trend.year[yearIndex].date) );
			if (yearIndex == 0) gHMIcmd.trend.year[yearIndex].date.year--;

			fDateOfYearDay.year      = gHMIcmd.trend.year[yearIndex].date.year;
			fDateOfYearDay.dayOfYear = dayOfYear(&gHMIcmd.trend.year[yearIndex].date) - 1;
			dateOfYearDay(&fDateOfYearDay);

			gHMIcmd.trend.year[yearIndex].date.day   = fDateOfYearDay.day;
			gHMIcmd.trend.year[yearIndex].date.month = fDateOfYearDay.month;
			
			gHMIcmd.trend.year[yearIndex].high.enable = ACTIVE;
		} /* if ( (actPicOld != gHMIcmd.general.actPic) && (gHMIcmd.general.actPic == PIC_TREND) ) */

		/* update trend */
		if (gHMIcmd.trend.year[yearIndex].cmdUpdate == ACTIVE)
		{
			/* in case of current year -> use current number of days */
			if (gHMIcmd.trend.year[yearIndex].date.year == gActData.general.time.year)
			{
				nbDays = dayOfYear(&gActData.general.time);
				/* current day is not yet finished */
				if (nbDays > 1) nbDays -= 1;
				/* avoid division by zero */
				if (nbDays == 0) nbDays = 1;
			}
			else
			{
				nbDays = 365 + (UINT)isLeapYear(gHMIcmd.trend.year[yearIndex].date.year);
			}
			
			/*** temperature high ***/
			memset( &trendDOname[0], 0, sizeof(trendDOname) );
			strcpy( &trendDOname[0], BMS_TEMP_HIGH_DO_NAME_BASE);
			trendDOname[strlen(trendDOname)] = gHMIcmd.trend.year[yearIndex].date.year / 10 % 10 + '0';
			trendDOname[strlen(trendDOname)] = gHMIcmd.trend.year[yearIndex].date.year /  1 % 10 + '0';

			fDatObjInfo.enable = 1;
			fDatObjInfo.pName  = (UDINT)&trendDOname[0];
			DatObjInfo(&fDatObjInfo);
			
            /* delete data in trend buffer */
			memset( gHMIcmd.trend.year[yearIndex].high.pData, 0, sizeof(REAL) * 366 );

			if (fDatObjInfo.status == 0)
			{
				/* get average maximum temperature and copy data */
				tempHighTot[yearIndex] = 0;
				for ( dayIndex = 0; dayIndex < nbDays; dayIndex++ )
				{
					gHMIcmd.trend.year[yearIndex].high.pData[dayIndex] = (DINT)( ((REAL*)fDatObjInfo.pDatObjMem)[dayIndex] * 10.0 );
					tempHighTot[yearIndex] += gHMIcmd.trend.year[yearIndex].high.pData[dayIndex];
				}
				tempHighAv[yearIndex] = tempHighTot[yearIndex] / (DINT)nbDays;
			}
			else
			{
				tempHighAv[yearIndex] = 0;
			}

			/*** temperature low ***/
			memset( &trendDOname[0], 0, sizeof(trendDOname) );
			strcpy( &trendDOname[0], BMS_TEMP_LOW_DO_NAME_BASE);
			trendDOname[strlen(trendDOname)] = gHMIcmd.trend.year[yearIndex].date.year / 10 % 10 + '0';
			trendDOname[strlen(trendDOname)] = gHMIcmd.trend.year[yearIndex].date.year /  1 % 10 + '0';

			fDatObjInfo.enable = 1;
			fDatObjInfo.pName  = (UDINT)&trendDOname[0];
			DatObjInfo(&fDatObjInfo);

            /* delete data in trend buffer */
			memset( gHMIcmd.trend.year[yearIndex].low.pData, 0, sizeof(REAL) * 366 );


			if (fDatObjInfo.status == 0)
			{
				/* get average minimum temperature and copy data */
				tempLowTot[yearIndex] = 0;
				for ( dayIndex = 0; dayIndex < nbDays; dayIndex++ )
				{
					gHMIcmd.trend.year[yearIndex].low.pData[dayIndex] = (DINT)( ((REAL*)fDatObjInfo.pDatObjMem)[dayIndex] * 10.0);
					tempLowTot[yearIndex] += gHMIcmd.trend.year[yearIndex].low.pData[dayIndex];
				}
				tempLowAv[yearIndex] = tempLowTot[yearIndex] / (DINT)nbDays;
			}
			else
			{
				tempLowAv[yearIndex] = 0;
			}
			
			/* get average temperature */
			gActData.trend.year[yearIndex].tempAv = (tempHighAv[yearIndex] + tempLowAv[yearIndex]) / 2;


			/*** heating hours ***/
			memset( &trendDOname[0], 0, sizeof(trendDOname) );
			strcpy( &trendDOname[0], BMS_HEAT_DO_NAME_BASE);
			trendDOname[strlen(trendDOname)] = gHMIcmd.trend.year[yearIndex].date.year / 10 % 10 + '0';
			trendDOname[strlen(trendDOname)] = gHMIcmd.trend.year[yearIndex].date.year /  1 % 10 + '0';

			fDatObjInfo.enable = 1;
			fDatObjInfo.pName  = (UDINT)&trendDOname[0];
			DatObjInfo(&fDatObjInfo);

            /* delete data in trend buffer */
			memset( gHMIcmd.trend.year[yearIndex].heat.pData, 0, sizeof(UDINT) * 366 );

			if (fDatObjInfo.status == 0)
			{
				/* get total heating hours and copy data */
				gActData.trend.year[yearIndex].heatingHoursTot = 0;
				for ( dayIndex = 0; dayIndex < nbDays; dayIndex++ )
				{
					gActData.trend.year[yearIndex].heatingHoursTot += ((UDINT*)fDatObjInfo.pDatObjMem)[dayIndex];
					gHMIcmd.trend.year[yearIndex].heat.pData[dayIndex] = ((UDINT*)fDatObjInfo.pDatObjMem)[dayIndex] * 10 / 60;
				}
			}
			else
			{
				gActData.trend.year[yearIndex].heatingHoursTot = 0;
			}
		} /* if (gHMIcmd.trend.year[yearIndex].cmdUpdate == ACTIVE) */


		/* load date according to cursor postion when touched */
		if ( (gHMIcmd.general.actPic == PIC_TREND) && (touchAction.status == 1) && 
		     (touchAction.x >= 40) && (touchAction.x <= 405) && 
		     (touchAction.y >= 60) && (touchAction.y <= 240) )
		{
			gHMIcmd.trend.year[0].cursorX.x = touchAction.x - 40;
			gHMIcmd.trend.year[1].cursorX.x = gHMIcmd.trend.year[0].cursorX.x;

			fDateOfYearDay.year      = gHMIcmd.trend.year[0].date.year;
			fDateOfYearDay.dayOfYear = gHMIcmd.trend.year[0].cursorX.x + 1;
			dateOfYearDay(&fDateOfYearDay);

			gHMIcmd.trend.year[yearIndex].date.day   = fDateOfYearDay.day;
			gHMIcmd.trend.year[yearIndex].date.month = fDateOfYearDay.month;
			gHMIcmd.trend.year[yearIndex].cmdUpdate  = ACTIVE;
		}


		/* update daily statistic data */
		if ( ((UDINT)gHMIcmd.trend.year[yearIndex].date.day + (UDINT)gHMIcmd.trend.year[yearIndex].date.month + (UDINT)gHMIcmd.trend.year[yearIndex].date.year) != sumDayMonthYear[yearIndex] )
		{
			sumDayMonthYear[yearIndex] = (UDINT)gHMIcmd.trend.year[yearIndex].date.day + (UDINT)gHMIcmd.trend.year[yearIndex].date.month + (UDINT)gHMIcmd.trend.year[yearIndex].date.year;
			gActData.trend.year[yearIndex].tempHigh        = gHMIcmd.trend.year[yearIndex].high.pData[dayOfYear(&gHMIcmd.trend.year[yearIndex].date) - 1];
			gActData.trend.year[yearIndex].tempLow         = gHMIcmd.trend.year[yearIndex].low.pData[dayOfYear(&gHMIcmd.trend.year[yearIndex].date) - 1];
			gActData.trend.year[yearIndex].heatingHoursDay = gHMIcmd.trend.year[yearIndex].heat.pData[dayOfYear(&gHMIcmd.trend.year[yearIndex].date) - 1];
		}


		if (gHMIcmd.trend.year[yearIndex].cmdUpdate == ACTIVE) 
		{
			cmdUpdateYearTrend = ACTIVE;
			gHMIcmd.trend.year[yearIndex].cmdUpdate = INACTIVE;	
		}
	} /* for ( yearIndex = 0; yearIndex < TREND_NB_YEAR; yearIndex++ ) */

	/* show trend */
	if (cmdUpdateYearTrend == ACTIVE)
	{
		/* draw trend */
		if ( (statusTrendYearTemp == 0) && (statusTrendYearHeat == 0) )
		{
			statusTrendYearTemp = TR_draw( 1, trendIdTempYear,     vcHandle );
			statusTrendYearHeat = TR_draw( 1, trendIdHeatHourYear, vcHandle );
		}
		else
		{
			statusTrendYearTemp = TR_redraw( 1, trendIdTempYear,     vcHandle );
			statusTrendYearHeat = TR_redraw( 1, trendIdHeatHourYear, vcHandle );
			cmdUpdateYearTrend = ACTIVE;	
		}
	
		if ( (statusTrendYearTemp == 0) && (statusTrendYearHeat == 0) )
		{
			cmdUpdateYearTrend = INACTIVE;
		}
	}
					

	/***********************************************************************************************************************/
	/*** INTERDAY TEMPERATURE TREND                                                                                      ***/
	/***********************************************************************************************************************/
	/* data logging */
	if (new4Minute)
	{
		/* current day */
		dayTempDINT = (DINT)(gActData.heating.tempOutsideAct * 10.0);
		TR_record( 1, trendIdTempDay );
	}

	/* start new day recording at midnight */
	if ( (gActData.general.time.hour == 23) && (gActData.general.time.minute == 59) && (newMinute) )
	{
		memcpy( gHMIcmd.trend.day[1].pData, gHMIcmd.trend.day[0].pData, 360 * sizeof(DINT) );
		TR_reset( 1, trendIdTempDay );
	}
	

	/* show trend */
	if (gHMIcmd.general.actPic == PIC_TREND)
	{
		if ( (new4Minute) || (actPicOld != gHMIcmd.general.actPic) || (statusTrendDayTemp != 0) )
		{
			/* draw trend */
			if (statusTrendDayTemp == 0)
			{
				statusTrendDayTemp = TR_draw( 1, trendIdTempDay, vcHandle );
			}
			else
			{
				statusTrendDayTemp = TR_redraw( 1, trendIdTempDay, vcHandle );
			}
		}
	}


	/* debugging */
	fDatObjInfo.enable = 1;
	fDatObjInfo.pName  = (UDINT)&trendDebug.name[0];
	DatObjInfo(&fDatObjInfo);
	
	trendDebug.dayOfYear = MIN(MAX(trendDebug.dayOfYear, 0),366);
	
	if (fDatObjInfo.status == 0)
	{
		trendDebug.tempAct            = ((REAL*)fDatObjInfo.pDatObjMem)[trendDebug.dayOfYear - 1];
		trendDebug.heatingHoursDayAct = ((UDINT*)fDatObjInfo.pDatObjMem)[trendDebug.dayOfYear - 1];
		
		if (trendDebug.cmdTempSet == ACTIVE)
		{
			fDatObjUpdateYearTempDebug.pName         = (UDINT)&trendDebug.name[0];
			fDatObjUpdateYearTempDebug.pData         = (UDINT)&trendDebug.tempSet;
			fDatObjUpdateYearTempDebug.index         = trendDebug.dayOfYear - 1;
			fDatObjUpdateYearTempDebug.nbElement     = 366;
			fDatObjUpdateYearTempDebug.sizeOfElement = sizeof(REAL);
			
			DatObjUpdate(&fDatObjUpdateYearTempDebug);
			if  (fDatObjUpdateYearTempDebug.status == 0)
			{
				trendDebug.cmdTempSet = INACTIVE;
			}
		}

		if (trendDebug.cmdHeatingHoursDaySet == ACTIVE)
		{
			fDatObjUpdateYearHeatDebug.pName         = (UDINT)&trendDebug.name[0];
			fDatObjUpdateYearHeatDebug.pData         = (UDINT)&trendDebug.heatingHoursDaySet;
			fDatObjUpdateYearHeatDebug.index         = trendDebug.dayOfYear - 1;
			fDatObjUpdateYearHeatDebug.nbElement     = 366;
			fDatObjUpdateYearHeatDebug.sizeOfElement = sizeof(UDINT);
			
			DatObjUpdate(&fDatObjUpdateYearHeatDebug);
			if  (fDatObjUpdateYearHeatDebug.status == 0)
			{
				trendDebug.cmdHeatingHoursDaySet = INACTIVE;
			}
		}
	}


	actPicOld = gHMIcmd.general.actPic;
}	/* _CYCLIC void hmi_concyc() */