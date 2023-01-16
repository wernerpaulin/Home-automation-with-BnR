(********************************************************************
 * COPYRIGHT -- WERNER PAULIN
 ********************************************************************
 * Program: statistics
 * File: statistics.st
 * Author: paulinw
 * Created: December 27, 2009
 ********************************************************************
 * Implementation of program statistics
 * Features:
 * - backups statistical data
 * - 
 * Interfaces:
 * - gActData
 ********************************************************************
 * History:
 * Version	Date		Author		Comment
 * V1.00	27.12.09	W. Paulin	created
 ********************************************************************)

PROGRAM _INIT
	(* initialize statistical data after power up with last saved data *)
	fDatObjInfo(enable := 1, pName := ADR(BMS_STATISTICS_DO_NAME));
	IF (fDatObjInfo.status = ERR_OK) THEN
		fDatObjRead(enable := 1, ident := fDatObjInfo.ident, Offset := 0, pDestination := ADR(gActData.statistics), len := SIZEOF(gActData.statistics));
	END_IF;
END_PROGRAM


PROGRAM _CYCLIC
	(* save statistical information at midnight *)
	IF (oldHour <> gActData.general.time.hour) AND (gActData.general.time.hour = 0) THEN
		cmdWriteStatistics := TRUE;
	END_IF;
	oldHour := gActData.general.time.hour;

	IF (cmdWriteStatistics = TRUE) THEN
 		fDatObjUpdate(pName := ADR(BMS_STATISTICS_DO_NAME), pData := ADR(gActData.statistics), index := 0, nbElement := 1, sizeOfElement := SIZEOF(gActData.statistics));

		IF (fDatObjUpdate.status <> ERR_FUB_BUSY) THEN
			cmdWriteStatistics := FALSE;
		END_IF
	END_IF;	
END_PROGRAM
