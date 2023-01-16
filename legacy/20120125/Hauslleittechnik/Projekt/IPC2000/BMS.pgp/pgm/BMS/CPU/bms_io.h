/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose    IO declaration                                                               *
*                                                                                            *
*    Filename   bms_io.h                                                                     *
*********************************************************************************************/

#ifndef _BMS_IO_H_
#define _BMS_IO_H_

#include "bms_gn.h"

/* IRRIGATION PLANT */
/* inputs */
_GLOBAL plcbit	diTankLevelHigh;
_GLOBAL plcbit	diTankLevelLow;

/* outputs */
_GLOBAL plcbit	doPump;
_GLOBAL plcbit	doValve1;
_GLOBAL plcbit	doValve2;
_GLOBAL plcbit	doValve3;
_GLOBAL plcbit	doValve4;
_GLOBAL plcbit	doValve5;
_GLOBAL plcbit	doValve6;


/* HEATING SYSTEM */
/* inputs */
_GLOBAL UINT	aiTempBoiler;
_GLOBAL UINT	aiTempBurner;
_GLOBAL UINT	aiTempFlow;
_GLOBAL UINT	aiTempOutside;
_GLOBAL UINT	aiTempLivingroom;

/* outputs */
_GLOBAL plcbit	doBurner;
_GLOBAL	plcbit	doFlowPump;
_GLOBAL	plcbit	doBoilerPump;
_GLOBAL	plcbit	doMixerOpen;
_GLOBAL	plcbit	doMixerClose;
_GLOBAL UINT 	aoAT324cfgWord14;					/* AT324 configuration - not connected physically to an outout */



/************************************************************************/
/* macro set irrigation plant specific IO points						*/
/*																	 	*/
/* Declaration:														 	*/
/* #define BMS_IO_SET_IRRIGATION_VALVE(segmentIndex)					*/
/*																		*/
/* The macro copies IO commands of irrigation plant to the outputs		*/
/************************************************************************/
#define BMS_IO_SET_IRRIGATION_VALVE(segmentIndex)								\
{																				\
	switch(segmentIndex)														\
	{																			\
		case 0:																	\
			doValve1 = gActData.irrigation.segment[segmentIndex].state;			\
		break;																	\
		case 1:																	\
			doValve2 = gActData.irrigation.segment[segmentIndex].state;			\
		break;																	\
		case 2:																	\
			doValve3 = gActData.irrigation.segment[segmentIndex].state;			\
		break;																	\
		case 3:																	\
			doValve4 = gActData.irrigation.segment[segmentIndex].state;			\
		break;		 															\
		case 4:																	\
			doValve5 = gActData.irrigation.segment[segmentIndex].state;			\
		break;																	\
		case 5:																	\
			doValve6 = gActData.irrigation.segment[segmentIndex].state;			\
		break;																	\
	} /* switch(segmentIndex) */												\
}

#endif
