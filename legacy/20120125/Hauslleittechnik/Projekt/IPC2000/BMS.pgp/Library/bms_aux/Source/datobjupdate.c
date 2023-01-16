/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose	Update Data Object information                                               *
*                                                                                            *
*    Filename   datobjupdate.c                                                               *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*                creates a new file if it does not exists                                    *
*                                                                                            *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         30.04.05      W. Paulin     created                                         *
*********************************************************************************************/

#include <bms_aux_gn.h>

void DatObjUpdate(DatObjUpdate_typ* fDatObjUpdate)
{
	fDatObjUpdate->fDatObjInfo.enable = 1;
	fDatObjUpdate->fDatObjInfo.pName  = fDatObjUpdate->pName;
	
	DatObjInfo(&fDatObjUpdate->fDatObjInfo);
	
	if ( (fDatObjUpdate->fDatObjInfo.status != 0) || (fDatObjUpdate->fDatObjCreate.status == AUX_ERR_FUB_BUSY) )		/* create data object if it does not exists */
	{
		fDatObjUpdate->fDatObjCreate.enable 	= 1;
		fDatObjUpdate->fDatObjCreate.grp	 	= 0;
		fDatObjUpdate->fDatObjCreate.pName   	= fDatObjUpdate->fDatObjInfo.pName;
		fDatObjUpdate->fDatObjCreate.len 		= fDatObjUpdate->nbElement * fDatObjUpdate->sizeOfElement;
		fDatObjUpdate->fDatObjCreate.MemType 	= doUSRROM;
		fDatObjUpdate->fDatObjCreate.Option 	= 0;
		fDatObjUpdate->fDatObjCreate.pCpyData 	= 0;
	 
		DatObjCreate(&fDatObjUpdate->fDatObjCreate);
	 
 		if (fDatObjUpdate->fDatObjCreate.status == 0)
 		{
			fDatObjUpdate->fDatObjInfo.ident = fDatObjUpdate->fDatObjCreate.ident;
 		}
		else if (fDatObjUpdate->fDatObjCreate.status == 65535)
		{
			fDatObjUpdate->status = AUX_ERR_FUB_BUSY;
			return;																	/* asynchronous calling */
		}
		else
		{
			fDatObjUpdate->status = fDatObjUpdate->fDatObjCreate.status;
			return;																	/* error */
		}
	} /* if ( (fDatObjUpdate->fDatObjInfo.status == 0) || (fDatObjUpdate->fDatObjCreate.status == ERR_FUB_BUSY) ) */


	/* start writing only if module was created or found */ 				
	if (fDatObjUpdate->fDatObjInfo.ident != 0)
	{
		fDatObjUpdate->fDatObjWrite.enable       = 1;
		fDatObjUpdate->fDatObjWrite.ident        = fDatObjUpdate->fDatObjInfo.ident;
		fDatObjUpdate->fDatObjWrite.Offset       = fDatObjUpdate->index * fDatObjUpdate->sizeOfElement;
		fDatObjUpdate->fDatObjWrite.pSource      = fDatObjUpdate->pData;
		fDatObjUpdate->fDatObjWrite.len          = fDatObjUpdate->sizeOfElement;		
		
		DatObjWrite(&fDatObjUpdate->fDatObjWrite);									/* ignore error -> operator can't fix it anyway */
		
		fDatObjUpdate->status = fDatObjUpdate->fDatObjWrite.status;
		return;
	} /* if (fDatObjUpdate->fDatObjInfo.ident != 0) */

	fDatObjUpdate->status = AUX_ERR_FUB_BUSY;
	return;
}

