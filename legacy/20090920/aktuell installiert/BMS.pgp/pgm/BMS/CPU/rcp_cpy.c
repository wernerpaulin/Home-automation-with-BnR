/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	Recipe Copy Manager                                                          *
*                                                                                            *
*    Filename   rcp_cpy.c                                                                    *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*    interface of recipe parameters between HMI and control                                  *
*    Recipe Parameters coming from HMI:                                                      *
*      - checked cyclically and after limitation applied to global configuration: gCfgData   *
*                                                                                            *
*    Recipe Parameters coming from Data Objects:                                             *
*      - Stored in Data Object and read out with gHMIrcpCtrl.cmdNewRecipe = ACTIVE           *
*      - HMI parameters will be updated automatically with new recipe data                   *
*      - Alarm generation if recipe handling was not successful                              *
*      - If no recipe specified, a default recipe will be loaded after power up              *
*                                                                                            *
*    Limitation:                                                                             *
*    Limits of all parameters are part of the recipe data there they can be modified by the  *
*    operator if requested. However the responsibility is up to the operator skill           *
*                                                                                            *
*    How to add new Parameters:                                                              *
*    - add element in desired recipe parameter structure                                     *
*    - add code sequence in rcp_cpy task to copy this new data                               *
*    - use this parameter in the corresponding task                                          *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         14.07.03      W. Paulin     created                                         *
*********************************************************************************************/

#include "bms_gn.h"
#include "bms_global.h"

/* variables */
_LOCAL 	UDINT			segmentIndex;
_LOCAL	UDINT			timeIndex;
_LOCAL 	DatObjInfo_typ	fDatObjInfo;
_LOCAL 	DatObjWrite_typ	fDatObjWrite;
_LOCAL 	rcpPar_typ		*pNewRcpPar;
_LOCAL	UDINT			doCalcLength;
_LOCAL 	USINT			cmdCpyRecipe;
_LOCAL	RTInfo_typ		fRTInfo;
_LOCAL	UDINT			cycT;
_LOCAL	USINT			saveState;
_LOCAL	UDINT			saveTimer;

/************************************************************************/
/* macro apply recipe parameter to internal data						*/
/*																	 	*/
/* With new recipe -> recipe value will be taken and HMI value updated  */
/* If no new recipe -> HMI value will be taken                          */
/* given and internal values will be limited if necessary               */
/* DO NOT WRITE TO rcpValue - IT'S IN A DATA OBJECT!!!					*/
/************************************************************************/
#define RcpApplyParameter(cpyRecipe, rcpValue, hmiValue, intValue, min, max)	\
{																				\
	/* apply either value from recipe or from HMI */							\
	if ( (cpyRecipe) == ACTIVE )												\
	{																			\
		(intValue) = (rcpValue);												\
	}																			\
	else																		\
	{																			\
		(intValue) = (hmiValue);												\
	}																			\
																				\
	/* limit given value */														\
	intValue = MIN( MAX( (intValue), (min) ), (max) );							\
																				\
	/* write limited value back to HMI */										\
	(hmiValue) = (intValue);													\
} /* RcpApplyRcpParameter() */




_INIT void rcp_cpyini()
{
	fRTInfo.enable = 1;
	RTInfo(&fRTInfo);
	cycT = fRTInfo.cycle_time / 1000;

	/* load last active recipe - if no recipe given try to load default one */
	if ( strlen(&gHMIrcpCtrl.rcpName[0]) == 0 ) 
	{
		strcpy( &gHMIrcpCtrl.rcpName[0], BMS_DEF_RCP_DO_NAME );
	}
	
	gHMIrcpCtrl.cmdNewRecipe = ACTIVE;
	
	/* defensive proramming: initialize pointer */
	pNewRcpPar = &gCfgData.rcpPar;
} /* _INIT void rcp_cpyini() */



_CYCLIC void rcp_cpycyc()
{
	/* animation of save for vis */
	if (gHMIcmd.general.diRcpWriteTrigger == ACTIVE)
	{
		saveTimer = 0;
	}
	
	if (saveTimer < 1500)
	{
		saveTimer += cycT;
		saveState = ACTIVE;
	}
	else
	{
		saveState = INACTIVE;
	}


	/* save receipe */
	if ( (gHMIcmd.general.diRcpWriteTrigger == ACTIVE) || (fDatObjWrite.status == ERR_FUB_BUSY) )
	{
		fDatObjInfo.enable = 1;
		fDatObjInfo.pName  = (UDINT)&gHMIrcpCtrl.rcpName[0];
		DatObjInfo(&fDatObjInfo);

		fDatObjWrite.enable  = 1;
		fDatObjWrite.ident   = fDatObjInfo.ident;
		fDatObjWrite.Offset  = 0;
		fDatObjWrite.pSource = (UDINT)&gHMIrcpPar;
		fDatObjWrite.len     = sizeof(gHMIrcpPar);
		
		DatObjWrite(&fDatObjWrite);
		if (fDatObjWrite.status == 0)
		{
			gHMIcmd.general.diRcpWriteTrigger = INACTIVE;
		}
	}


	cmdCpyRecipe = INACTIVE;
	
	/********************************************************************/
	/*** check for new recipe - limit it and provide it to other task ***/
	/********************************************************************/
	/* input:  Data Object:  gHMIrcpCtrl.rcpName (rcpPar_typ) */
	/* output: gCfgData.rcpPar -> each task will copy this information locally (rcpParXxxxx_typ) at its need and if new data given */
	if (gHMIrcpCtrl.cmdNewRecipe == ACTIVE)
	{
		/* reset flag */
		gHMIrcpCtrl.cmdNewRecipe = INACTIVE;

		fDatObjInfo.enable = 1;
		fDatObjInfo.pName  = (UDINT)&gHMIrcpCtrl.rcpName[0];
		
		DatObjInfo(&fDatObjInfo);

		gHMIrcpCtrl.status = fDatObjInfo.status;
		
		/* basic compatibility: check length :                     */
		/* length of data objects are always a multiple of 4 bytes */
		if (gHMIrcpCtrl.status == 0)
		{
			doCalcLength = sizeof(gCfgData.rcpPar) % sizeof(UDINT);
			
			if (doCalcLength > 0)								/* length is not a multible of 4 byte -> stuff bytes to next 4 byte block */
			{
				doCalcLength = sizeof(gCfgData.rcpPar) + (sizeof(UDINT) - doCalcLength);
			}
			else
			{
				doCalcLength = sizeof(gCfgData.rcpPar);
			}

			if (fDatObjInfo.len != doCalcLength)				/* compare calculated length with actual length */
			{
				gHMIrcpCtrl.status = ERR_RCP_INCOMPATIBLE;	
			}
		}

		/* set command if status is still OK */
		if (gHMIrcpCtrl.status == 0)
		{
			pNewRcpPar                                   = (rcpPar_typ*) fDatObjInfo.pDatObjMem;
			cmdCpyRecipe                                 = ACTIVE;
			gAlarm.request[ALARM_NO_VALID_RECIPE_ACTIVE] = INACTIVE;
		}
		else
		{
			gAlarm.request[ALARM_NO_VALID_RECIPE_ACTIVE] = ACTIVE;
		}
	} /* if (gHMIrcpCtrl.cmdNewRecipe == ACTIVE) */
	
	gCfgData.parLock = ACTIVE;												/* lock parameters */
		
		
	/********************************************************************/
	/*** IRRIGATION PLANT PARAMETERS                                  ***/
	/********************************************************************/
	for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ )
	{
	    if (gHMIrcpPar.irrigation.segment[segmentIndex].mode >= MAX_NB_MODE)
	    {
	    	gHMIrcpPar.irrigation.segment[segmentIndex].mode = MODE_OFF;
	    }

		RcpApplyParameter( cmdCpyRecipe,																	/* 0...off, 1...on, 2...auto */
	                       pNewRcpPar->irrigation.segment[segmentIndex].mode, 						
		                   gHMIrcpPar.irrigation.segment[segmentIndex].mode, 
		                   gCfgData.rcpPar.irrigation.segment[segmentIndex].mode, 
	                       (DINT)0, 
	                       (DINT)(MAX_NB_MODE-1) );

		/* mode "on" is not allowed to be loaded */
		if ( (cmdCpyRecipe == ACTIVE) && (pNewRcpPar->irrigation.segment[segmentIndex].mode == MODE_ON) )
		{
			gHMIrcpPar.irrigation.segment[segmentIndex].mode      = MODE_OFF;
			gCfgData.rcpPar.irrigation.segment[segmentIndex].mode = MODE_OFF;
		}
	    
		for ( timeIndex = 0; timeIndex < NB_IRRIGATION_START_TIME; timeIndex++ )
		{
			RcpApplyParameter( cmdCpyRecipe,																/* start time of irrigation [min] */
		                       pNewRcpPar->irrigation.segment[segmentIndex].startTime[timeIndex], 						
			                   gHMIrcpPar.irrigation.segment[segmentIndex].startTime[timeIndex], 
			                   gCfgData.rcpPar.irrigation.segment[segmentIndex].startTime[timeIndex], 
		                       (DINT)0, 
		                       (DINT)1440 );	/* 24h */
	
			RcpApplyParameter( cmdCpyRecipe,																/* duration [min]*/
		                       pNewRcpPar->irrigation.segment[segmentIndex].duration[timeIndex], 						
			                   gHMIrcpPar.irrigation.segment[segmentIndex].duration[timeIndex], 
			                   gCfgData.rcpPar.irrigation.segment[segmentIndex].duration[timeIndex], 
		                       (DINT)0, 
		                       (DINT)1440 );	/* 24h */
		} /* for ( timeIndex = 0; timeIndex < NB_IRRIGATION_START_TIME; timeIndex++ ) */
	} /* for ( segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++ ) */


	/********************************************************************/
	/*** HEATING SYSTEM PARAMETERS                                    ***/
	/********************************************************************/
	RcpApplyParameter( cmdCpyRecipe,										/* 0...off, 1...on */
                       pNewRcpPar->heating.mode, 						
	                   gHMIrcpPar.heating.mode, 
	                   gCfgData.rcpPar.heating.mode, 
                       (DINT)0, 
                       (DINT)1 );

	RcpApplyParameter( cmdCpyRecipe,										/* start time of heating [min] */
                       pNewRcpPar->heating.startTime, 						
	                   gHMIrcpPar.heating.startTime, 
	                   gCfgData.rcpPar.heating.startTime, 
                       (DINT)0, 
                       (DINT)1440 );	/* 24h */

	RcpApplyParameter( cmdCpyRecipe,										/* end time of heating [min] */
                       pNewRcpPar->heating.endTime, 						
	                   gHMIrcpPar.heating.endTime, 
	                   gCfgData.rcpPar.heating.endTime, 
                       (DINT)0, 
                       (DINT)1440 );	/* 24h */

	RcpApplyParameter( cmdCpyRecipe,										/* 0...off, 1...on */
                       pNewRcpPar->heating.outOfHome.mode, 						
	                   gHMIrcpPar.heating.outOfHome.mode, 
	                   gCfgData.rcpPar.heating.outOfHome.mode, 
                       (DINT)0, 
                       (DINT)1 );

	RcpApplyParameter( cmdCpyRecipe,										/* out of home begin [day]  */
                       pNewRcpPar->heating.outOfHome.startDay, 						
	                   gHMIrcpPar.heating.outOfHome.startDay, 
	                   gCfgData.rcpPar.heating.outOfHome.startDay, 
                       (DINT)0, 
                       (DINT)366 );	/* 366 days */

	RcpApplyParameter( cmdCpyRecipe,										/* out of home end [day] */
                       pNewRcpPar->heating.outOfHome.endDay, 						
	                   gHMIrcpPar.heating.outOfHome.endDay, 
	                   gCfgData.rcpPar.heating.outOfHome.endDay, 
                       (DINT)0, 
                       (DINT)366 );	/* 366 days */

	RcpApplyParameter( cmdCpyRecipe,										/* living room set temperature [°C] */
                       pNewRcpPar->heating.tempLivingroomSet, 						
	                   gHMIrcpPar.heating.tempLivingroomSet, 
	                   gCfgData.rcpPar.heating.tempLivingroomSet, 
                       (REAL)15.0, 
                       (REAL)30.0 );

	RcpApplyParameter( cmdCpyRecipe,										/* manual offset to living room set temperature [°C] */
                       pNewRcpPar->heating.tempManOffset, 						
	                   gHMIrcpPar.heating.tempManOffset, 
	                   gCfgData.rcpPar.heating.tempManOffset, 
                       (REAL)-5.0, 
                       (REAL)5.0 );

	RcpApplyParameter( cmdCpyRecipe,										/* lowering offset to living room set temperature [°C] */
                       pNewRcpPar->heating.tempLowOffset, 						
	                   gHMIrcpPar.heating.tempLowOffset, 
	                   gCfgData.rcpPar.heating.tempLowOffset, 
                       (REAL)-5.0, 
                       (REAL)0.0 );

	RcpApplyParameter( cmdCpyRecipe,										/* temperature offset to flow set temperature [°C] */
                       pNewRcpPar->heating.tempFlowSetOffset, 						
	                   gHMIrcpPar.heating.tempFlowSetOffset, 
	                   gCfgData.rcpPar.heating.tempFlowSetOffset, 
                       (DINT)-10, 
                       (DINT)10 );

	RcpApplyParameter( cmdCpyRecipe,										/* kp of heat controller */
                       pNewRcpPar->heating.kp, 						
	                   gHMIrcpPar.heating.kp, 
	                   gCfgData.rcpPar.heating.kp, 
                       (REAL)0, 
                       (REAL)15 );

	RcpApplyParameter( cmdCpyRecipe,										/* ti of heat controller */
                       pNewRcpPar->heating.ti, 						
	                   gHMIrcpPar.heating.ti, 
	                   gCfgData.rcpPar.heating.ti, 
                       (REAL)0, 
                       (REAL)1000.0 );

	/********************************************************************/
	/*** HOT WATER PARAMETERS                                         ***/
	/********************************************************************/
	for ( timeIndex = 0; timeIndex < NB_HOTWATER_TIME; timeIndex++ )
	{
		RcpApplyParameter( cmdCpyRecipe,									/* start time of irrigation [min] */
	                       pNewRcpPar->heating.hotwater.startTime[timeIndex], 						
		                   gHMIrcpPar.heating.hotwater.startTime[timeIndex], 
		                   gCfgData.rcpPar.heating.hotwater.startTime[timeIndex], 
	                       (DINT)0, 
	                       (DINT)1440 );	/* 24h */

		RcpApplyParameter( cmdCpyRecipe,									/* end time of irrigation [min] */
	                       pNewRcpPar->heating.hotwater.endTime[timeIndex], 						
		                   gHMIrcpPar.heating.hotwater.endTime[timeIndex], 
		                   gCfgData.rcpPar.heating.hotwater.endTime[timeIndex], 
	                       (DINT)0, 
	                       (DINT)1440 );	/* 24h */
	} /* for ( timeIndex = 0; timeIndex < NB_IRRIGATION_START_TIME; timeIndex++ ) */

	RcpApplyParameter( cmdCpyRecipe,										/* boiler set temperature */
                       pNewRcpPar->heating.hotwater.tempSet, 						
	                   gHMIrcpPar.heating.hotwater.tempSet, 
	                   gCfgData.rcpPar.heating.hotwater.tempSet, 
                       (DINT)0, 
                       (DINT)MAX_BOILER_TEMP );

	if (cmdCpyRecipe) gHMIrcpCtrl.cntNewRcpData++;							/* indicate change of recipe */

	gCfgData.parLock = INACTIVE;											/* release parameters for further processing */
} /* _CYCLIC void rcp_cpycyc() */