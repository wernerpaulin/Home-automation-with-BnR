/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	2-point hysteresis                                                           *
*                                                                                            *
*    Filename   hyst2p.c                                                                     *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*                applies a 2 point hysteresis on a input signal                              *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         02.05.05      W. Paulin     created                                         *
*********************************************************************************************/

#include <bms_aux_gn.h>

void hyst2p(hyst2p_typ* fHyst2p)
{
	fHyst2p->y = 1;

	/* switch off heating if living temperature reached set value */
	if ( fHyst2p->xAct > (fHyst2p->xSet + fHyst2p->pHyst) )
	{
		fHyst2p->y = 0;
		fHyst2p->xActOld = fHyst2p->xAct;
	}
	/* switch off heating if living temperature is still above lower  */
	else if ( (fHyst2p->xActOld > fHyst2p->xAct) && (fHyst2p->xAct >= (fHyst2p->xSet - fHyst2p->nHyst)) )
	{
		fHyst2p->y = 0;
	}
	else if ( fHyst2p->xAct < (fHyst2p->xSet - fHyst2p->nHyst) )
	{
		fHyst2p->xActOld = fHyst2p->xAct;
	}
}