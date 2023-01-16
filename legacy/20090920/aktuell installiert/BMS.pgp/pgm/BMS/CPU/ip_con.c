/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	Irrigation Plant Control                                                     *
*                                                                                            *
*    Filename   ip_con.c                                                                     *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*               irrigation control                                                           *
*               statistics                                                                   *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         28.04.05      W. Paulin     created                                         *
*  01.01         08.12.05      W. Paulin     animation for irrigation                        *
*  01.02         17.06.06      W. Paulin     tank level high lightly changed                 *
*                                            bugfix: segment watchdog handling               *
*  01.03         17.08.07      W. Paulin     valve service switch on/off cycle implemented   *
*********************************************************************************************/

#include <bms_gn.h>
#include <bms_global.h>
#include <bms_io.h>

_LOCAL	rcpParIrrigation_typ	rcpPar;
_LOCAL	RTInfo_typ				fRTInfo;

_LOCAL	UDINT					segmentIndex;
_LOCAL	UDINT					timeIndex;
_LOCAL	BOOL					stateOld[NB_SEGMENT];
_LOCAL	USINT					newMinute;
_LOCAL	USINT					oldMinute;
_LOCAL	UDINT					dayMinute;
_LOCAL	UDINT					segmentWatchdogTimer[NB_SEGMENT];
_LOCAL	USINT					cmdPumpOn;
_LOCAL	UDINT					cycT;
_LOCAL	UDINT					pumpOnTimer;

_LOCAL	animationInf_typ		irrigAnimation[NB_SEGMENT];

_LOCAL	UDINT					segmentServiceIndex;
_LOCAL	USINT					cmdValveServiceCycle;

_INIT void ip_conini()
{
	oldMinute = gActData.general.time.minute;

	fRTInfo.enable = 1;
	RTInfo(&fRTInfo);
	cycT = fRTInfo.cycle_time / 1000;

	/* animation - Rasen */
	irrigAnimation[0].timer      = 0;
	irrigAnimation[0].duration   = 150;
	irrigAnimation[0].index      = 0; 
	irrigAnimation[0].nbElements = 5;
	 
	/* animation - Blumentrog */
	irrigAnimation[1].timer      = 0;
	irrigAnimation[1].duration   = 150;
	irrigAnimation[1].index      = 0; 
	irrigAnimation[1].nbElements = 5;
	 
	/* animation - Gemüsegarten oben */
	irrigAnimation[2].timer      = 0;
	irrigAnimation[2].duration   = 350;
	irrigAnimation[2].index      = 0; 
	irrigAnimation[2].nbElements = 4;
	
	/* animation - Gemüsegarten unten */
	irrigAnimation[3].timer      = 0;
	irrigAnimation[3].duration   = 350;
	irrigAnimation[3].index      = 0; 
	irrigAnimation[3].nbElements = 4;
	 
	/* animation - Gemüsegarten mitte */
	irrigAnimation[4].timer      = 0;
	irrigAnimation[4].duration   = 350;
	irrigAnimation[4].index      = 0; 
	irrigAnimation[4].nbElements = 4;
	
	/* animation - Blumenhang */
	irrigAnimation[5].timer      = 0;
	irrigAnimation[5].duration   = 150;
	irrigAnimation[5].index      = 0; 
	irrigAnimation[5].nbElements = 7;
}	/* _INIT void ip_conini() */



_CYCLIC void ip_concyc()
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
		newMinute = INACTIVE;
	}


	/* apply recipe parameter if allowed */
	if (gCfgData.parLock == INACTIVE)
	{
		memcpy( &rcpPar, &gCfgData.rcpPar.irrigation, sizeof(rcpPar) );
	}


	/********************************************************************/
	/*** WATER SEGMENT HANDLING                                       ***/
	/********************************************************************/
	cmdPumpOn = INACTIVE;		/* assume pump is not active any more */
	for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ )
	{
		/* segment manually switched off */
		if (rcpPar.segment[segmentIndex].mode == MODE_OFF)
		{
			gActData.irrigation.segment[segmentIndex].state = INACTIVE;
		}
		/* segment manually switched on */
		else if (rcpPar.segment[segmentIndex].mode == MODE_ON)
		{
			gActData.irrigation.segment[segmentIndex].state = ACTIVE;
			
			/* switch off segment after some time assuming user forgot to switch it off */
			segmentWatchdogTimer[segmentIndex] += newMinute;
			if (segmentWatchdogTimer[segmentIndex] >= SEGMENT_WATCHDOG_TIME)
			{
				gHMIrcpPar.irrigation.segment[segmentIndex].mode = MODE_OFF;
			}
		}
		/* segment in automatic mode -> check start time and duration */
		else
		{
			gActData.irrigation.segment[segmentIndex].state = INACTIVE;			/* default: not supposed to be active */
			for ( timeIndex = 0; timeIndex < NB_IRRIGATION_START_TIME; timeIndex++ )
			{
				/* start time reached and within duration */
				if ( (dayMinute >= rcpPar.segment[segmentIndex].startTime[timeIndex]) && (dayMinute < rcpPar.segment[segmentIndex].startTime[timeIndex] + rcpPar.segment[segmentIndex].duration[timeIndex]) )
				{
					gActData.irrigation.segment[segmentIndex].state = ACTIVE;
				}
			}
		}
		
		/* reset watchdog if not switched on */
		if (rcpPar.segment[segmentIndex].mode != MODE_ON)
		{
			segmentWatchdogTimer[segmentIndex] = 0;
		}
		
		/* statistics */
		if ( stateOld[segmentIndex] != gActData.irrigation.segment[segmentIndex].state )
		{
			gActData.statistics.irrigation.valve[segmentIndex]++;
			stateOld[segmentIndex] = gActData.irrigation.segment[segmentIndex].state;
		}

		/* switch on pump if valve is open */
		if (gActData.irrigation.segment[segmentIndex].state == ACTIVE)
		{
			cmdPumpOn = ACTIVE;
		}
		
		/* set valve output */	
		BMS_IO_SET_IRRIGATION_VALVE(segmentIndex);
	} /* for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ ) */	


	/* force valve switch on/off cycle in order to avoid to get stuck /Begin */
	if ( (gActData.general.time.wday == 0)   && 
	     (gActData.general.time.hour == 0)   && 
	     (gActData.general.time.minute == 0) && (newMinute) )		/* sunday - midnight */
	{
		cmdValveServiceCycle = ACTIVE;
	}
	
	if (cmdValveServiceCycle == ACTIVE)
	{
		/* once the command is active, switch on one valve every minute */
		if (segmentServiceIndex < NB_SEGMENT)
		{
			gActData.irrigation.segment[segmentServiceIndex].state = ACTIVE;
			if (newMinute) gActData.irrigation.segment[segmentServiceIndex].state = INACTIVE;

			/* set valve output cyclically since standard program above would override it every cycle */	
			BMS_IO_SET_IRRIGATION_VALVE(segmentServiceIndex);

			if (newMinute) segmentServiceIndex++; /* next segment */
		}
		else
		{
			/* segment cycle finished */
			cmdValveServiceCycle = INACTIVE;
		}
	}
	else
	{
		segmentServiceIndex = 0;
	}
	/* force valve switch on/off cycle in order to avoid to get stuck /End */


	/* switch pump on after some time -> filter frequent change of user input */
	if ( (cmdPumpOn == ACTIVE) && (pumpOnTimer >= IRRIGATION_PUMP_ON_DELAY) )
	{
		doPump = ACTIVE;
	}
	else if (cmdPumpOn == ACTIVE)
	{
		pumpOnTimer += cycT;
		doPump = INACTIVE;
	}
	else
	{
		pumpOnTimer = 0;
		doPump = INACTIVE;
	}
	
	/* generate level of tank */
	if ( (diTankLevelHigh == ACTIVE) && (diTankLevelLow == ACTIVE) )
	{
		gActData.irrigation.tankLevel = 9;
	}
	else if ( (diTankLevelHigh == INACTIVE) && (diTankLevelLow == ACTIVE) )
	{
		gActData.irrigation.tankLevel = 6;
	}
	else if ( (diTankLevelHigh == INACTIVE) && (diTankLevelLow == INACTIVE) )
	{
		gActData.irrigation.tankLevel = 2;
	}

	/* statistics */
	if ( (doPump == ACTIVE) && (newMinute) )
	{
		gActData.statistics.irrigation.onTimePump++;
	}

	/***********************************************************************************************************************/
	/*** ANIMATED BITMAP FOR SIMULATION OF IRRIGATION                                                                    ***/
	/***********************************************************************************************************************/
	for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ )
	{
		if (irrigAnimation[segmentIndex].timer >= irrigAnimation[segmentIndex].duration)
		{
			irrigAnimation[segmentIndex].timer = 0;
			 
			if (gActData.irrigation.segment[segmentIndex].state == ACTIVE)
			{
				if (++irrigAnimation[segmentIndex].index >= irrigAnimation[segmentIndex].nbElements) irrigAnimation[segmentIndex].index = 1;
			 }
			 else
			 {
				 irrigAnimation[segmentIndex].index = 0;					/* init bitmap*/
			 }
		}
		else
		{
			irrigAnimation[segmentIndex].timer += cycT;
		}
	} /* ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ ) */
}	/* _CYCLIC void ip_concyc() */