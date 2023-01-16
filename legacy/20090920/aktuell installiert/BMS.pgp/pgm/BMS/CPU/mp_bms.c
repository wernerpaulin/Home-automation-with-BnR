/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	Main process - general tasks                                                 *
*                                                                                            *
*    Filename   mp_bms.c                                                                     *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*              actual time handling                                                          *
*              statistics                                                                    *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         28.04.05      W. Paulin     created                                         *
*********************************************************************************************/

#include <bms_gn.h>
#include <bms_global.h>
#include <bms_io.h>

_LOCAL	DTGetTime_typ		fDTGetTime;
_LOCAL	DTSetTime_typ		fDTSetTime;
_LOCAL	DatObjInfo_typ		fDatObjInfo;
_LOCAL	DatObjUpdate_typ	fDatObjUpdate;

_LOCAL	USINT				hourOld;
_LOCAL	USINT				cmdWriteStatistics;
_LOCAL	UINT				actPicOld;


_INIT void mp_bmsini()
{
	/* read last save statistics when power up */
	fDatObjInfo.enable = 1;
	fDatObjInfo.pName  = (UDINT)BMS_STATISTICS_DO_NAME;
	
	DatObjInfo(&fDatObjInfo);
	
	if (fDatObjInfo.status == 0)
	{
		memcpy( &gActData.statistics, (void*)fDatObjInfo.pDatObjMem, sizeof(gActData.statistics) );
	}
}	/* _INIT void mp_bmsini() */



_CYCLIC void mp_bmscyc()
{
	/* get current time */
	fDTGetTime.enable = 1;
	DTGetTime(&fDTGetTime);
	if (fDTGetTime.status == 0)
	{
		DT_TO_DTStructure( fDTGetTime.DT1, (UDINT)&gActData.general.time );
	}

	/* load actual time in set time variable when entering service page */
	if ( (actPicOld != gHMIcmd.general.actPic) && (gHMIcmd.general.actPic == PIC_SERVICE) )
	{
		memcpy( &gHMIcmd.general.setTime, &gActData.general.time, sizeof(gHMIcmd.general.setTime) );
	}

	/* set time */
	if (gHMIcmd.general.diSetTime == ACTIVE)
	{
		fDTSetTime.enable = 1;
		fDTSetTime.DT1 = DTStructure_TO_DT( (UDINT)&gHMIcmd.general.setTime );
		
		DTSetTime(&fDTSetTime);

		gHMIcmd.general.diSetTime = INACTIVE;
	}
	
	/* save statistical information at midnight */
	if ( (hourOld != gActData.general.time.hour) && (gActData.general.time.hour == 0) )
	{
		cmdWriteStatistics = ACTIVE;
	}
	hourOld = gActData.general.time.hour;
	
	if (cmdWriteStatistics == ACTIVE)
	{
		fDatObjUpdate.pName         = (UDINT)BMS_STATISTICS_DO_NAME;
		fDatObjUpdate.pData         = (UDINT)&gActData.statistics;
		fDatObjUpdate.index         = 0;
		fDatObjUpdate.nbElement     = 1;
		fDatObjUpdate.sizeOfElement = sizeof(gActData.statistics);
		
		DatObjUpdate(&fDatObjUpdate);

		if (fDatObjUpdate.status != AUX_ERR_FUB_BUSY)
		{
			cmdWriteStatistics = INACTIVE;
		}
	} /* if (cmdWriteStatistics == ACTIVE) */

	actPicOld = gHMIcmd.general.actPic;
}	/* _CYCLIC void mp_bmscyc() */