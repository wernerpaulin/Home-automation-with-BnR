/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Managment System - remote operation                                 *
*    Purpose    Irrigation Plant Operator                                                    *
*                                                                                            *
*    Filename   ip_op.c                                                                      *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*    remote control of irrigation plant                                                      *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         29.05.05      W. Paulin     Created                                         *
*********************************************************************************************/

#include <bms_gn.h>
#include <bms_global.h>
#include <bms_io.h>

_LOCAL	UDINT			cycT;
_LOCAL	RTInfo_typ		fRTInfo;
_LOCAL	DTGetTime_typ	fDTgetTime;

_LOCAL	UINT			segmentIndex;

_LOCAL	USINT			welcomeText[32];
_LOCAL	USINT			mode[NB_SEGMENT];
_LOCAL	USINT			newMode[NB_SEGMENT];


_INIT void ip_opini()
{
	fRTInfo.enable = 1; 
	RTInfo(&fRTInfo);
	cycT = fRTInfo.cycle_time / 1000;					/* convert cycle time us -> ms */
}	/* _INIT void ip_opini() */


_CYCLIC void ip_opcyc()
{
	/* get current time */
	fDTgetTime.enable = 1;
	DTGetTime(&fDTgetTime);
	if (fDTgetTime.status == 0)
	{
		DT_TO_DTStructure(fDTgetTime.DT1, (UDINT)&gActData.general.time);
	}

	/* set welcome text */
	if ( (gActData.general.time.hour >= 4) && (gActData.general.time.hour <= 9) )
	{
		strcpy( &welcomeText[0], "Guten Morgen Mutti!" );
	}
	else
	{
		memset( &welcomeText[0], 0, sizeof(welcomeText) );
	} 


	/* segment control */	
	for (segmentIndex = 0; segmentIndex < NB_SEGMENT; segmentIndex++)
	{
		if (mode[segmentIndex] >= MAX_NB_MODE)
		{
			mode[segmentIndex] = 0;		
		}
		
		if (newMode[segmentIndex] == ACTIVE)
		{
			newMode[segmentIndex] = 0;
			gHMIrcpPar.irrigation.segment[segmentIndex].mode = mode[segmentIndex];
		}
	}	/* for (segmentIndex = 0; segmentIndex < NB_SEGMENTS; segmentIndex++) */
}	/* _CYCLIC void ip_opcyc() */