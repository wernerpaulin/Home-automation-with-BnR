(********************************************************************
 * COPYRIGHT -- WERNER PAULIN 
 ********************************************************************
 * Program: rcp_cpy
 * File: rcp_cpy.st
 * Author: paulinw
 * Created: December 26, 2009
 ********************************************************************
 * Implementation of program rcp_cpy
 * Features:
 * - load & save data to recipe data object
 * - validates recipe data gHMI.recipe from HMI and copies them to gCfg.data
 * Interfaces:
 * - gHMI.recipe.ctrl.name: name of recipe data object
 * - gHMI.recipe.ctrl.load: triggers loading data
 * - gHMI.recipe.ctrl.save: triggers saving data
 * - gCfg.data:             recipe data
 * - gCfg.isValid:			indicates that gCfg.data is valid
 ********************************************************************
 * History:
 * Version	Date		Author		Comment
 * V1.00	26.12.09	W. Paulin	created
 ********************************************************************)

PROGRAM _INIT
	strcpy(ADR(gHMI.recipe.ctrl.name[0]), ADR('rcp_def'));	(* default recipe *)
	gHMI.recipe.ctrl.load := TRUE;							(* load recipe after power up *)
END_PROGRAM


PROGRAM _CYCLIC
	(* generate new page flag *)
	IF (actPicOld <> gHMI.general.actPage) THEN
		newPage := TRUE;
	ELSE
		newPage := FALSE;
	END_IF;
	actPicOld := gHMI.general.actPage;
	
	(* reset save/load indicators if page was changed *)
	IF (newPage = TRUE) THEN
		gHMI.recipe.ctrl.loadOk := OK_FLAG_INVISIBLE;
		gHMI.recipe.ctrl.saveOk := OK_FLAG_INVISIBLE;
	END_IF;

	
	(* get predefined file name according to selected index *)
	IF (gHMI.recipe.ctrl.nameIndex = 0) THEN
		strcpy(ADR(gHMI.recipe.ctrl.name[0]), ADR('rcp_def'));	(* default recipe *)
	ELSIF (gHMI.recipe.ctrl.nameIndex = 1) THEN
		strcpy(ADR(gHMI.recipe.ctrl.name[0]), ADR(RECIPE_FILE_NAME_1));
	ELSIF (gHMI.recipe.ctrl.nameIndex = 2) THEN
		strcpy(ADR(gHMI.recipe.ctrl.name[0]), ADR(RECIPE_FILE_NAME_2));
	ELSE
		strcpy(ADR(gHMI.recipe.ctrl.name[0]), ADR('rcp_def'));	(* default recipe *)
	END_IF;

	(* load data from recipe file and overwrite actual live data *)
	IF (gHMI.recipe.ctrl.load = TRUE) THEN
		fDatObjInfo(enable := 1, pName := ADR(gHMI.recipe.ctrl.name[0]));
	
		(* read data if data object found *)
		IF (fDatObjInfo.status = 0) THEN
	 		fDatObjRead(enable := 1, ident := fDatObjInfo.ident, Offset := 0, pDestination := ADR(gHMI.recipe.data), len := SIZEOF(gHMI.recipe.data)); (* read data from file *)
			(* wait until reading has been finished *)
			IF (fDatObjRead.status <> ERR_FUB_BUSY) THEN
				(* in case of any error during reading restore old data and raise alarm *)
				IF (fDatObjRead.status <> ERR_OK) THEN
					memcpy(ADR(gHMI.recipe.data), ADR(gCfg.data), SIZEOF(gHMI.recipe.data));
					gAlarm.request[ALARM_RECIPE_READ] := TRUE;
					gHMI.recipe.ctrl.loadOk := OK_FLAG_ERROR;
				ELSE
					gHMI.recipe.ctrl.cntLoad := gHMI.recipe.ctrl.cntLoad + 1;		(* indicate that new receipe has been loaded *)
					gHMI.recipe.ctrl.loadOk := OK_FLAG_OK;
				END_IF;
				gHMI.recipe.ctrl.load    := FALSE;
			END_IF;
		ELSE
			(* recipe name is invalid *)
			gAlarm.request[ALARM_RECIPE_NAME_INV] := TRUE;
			gHMI.recipe.ctrl.load := FALSE;			
			gHMI.recipe.ctrl.loadOk := OK_FLAG_ERROR;
		END_IF;
		gHMI.recipe.ctrl.save := FALSE;			(* in case of pending reading cancel save *)
	END_IF;

	(* do not allow saving data to default recipe *)
	IF (gHMI.recipe.ctrl.save = TRUE) AND (strcmp(ADR(gHMI.recipe.ctrl.name[0]), ADR('rcp_def')) = 0) THEN
 		gHMI.recipe.ctrl.save := FALSE;
		gHMI.recipe.ctrl.saveOk := OK_FLAG_ERROR;
	END_IF;	

	(* save data to recipe *)
	IF (gHMI.recipe.ctrl.save = TRUE) THEN
		fDatObjUpdate(pName := ADR(gHMI.recipe.ctrl.name[0]), pData := ADR(gCfg.data), index := 0, nbElement := 1, sizeOfElement := SIZEOF(gCfg.data));
		IF (fDatObjUpdate.status <> ERR_FUB_BUSY) THEN
			(* in case of any error raise alarm *)
			IF (fDatObjUpdate.status <> ERR_OK) THEN
				gAlarm.request[ALARM_RECIPE_WRITE] := TRUE;	
				gHMI.recipe.ctrl.saveOk := OK_FLAG_ERROR;
			END_IF;
			gHMI.recipe.ctrl.save := FALSE;
			gHMI.recipe.ctrl.saveOk := OK_FLAG_OK;
		END_IF;
	END_IF;

	(* validating the recipe data with hardcoded system limits and publish them in gCfg - only if no load or save is in progress *)
	IF (gHMI.recipe.ctrl.load = FALSE) AND (gHMI.recipe.ctrl.save = FALSE) THEN		
		gCfg.isValid := FALSE;	(* indicate for all lower priority tasks that this is not valid *)
	
		(* heating *)
		gHMI.recipe.data.heating.startTime 			:= gCfg.data.heating.startTime			:= MIN(MAX(gHMI.recipe.data.heating.startTime, 0), 1440);				(* 24h *)
		gHMI.recipe.data.heating.endTime			:= gCfg.data.heating.endTime			:= MIN(MAX(gHMI.recipe.data.heating.endTime, 0), 1440);					(* 24h *)

		gHMI.recipe.data.heating.outOfHome.startDay	:= gCfg.data.heating.outOfHome.startDay	:= MIN(MAX(gHMI.recipe.data.heating.outOfHome.startDay, 0), 366);		(* 366 days *)
		gHMI.recipe.data.heating.outOfHome.endDay	:= gCfg.data.heating.outOfHome.endDay 	:= MIN(MAX(gHMI.recipe.data.heating.outOfHome.endDay, 0), 366);			(* 366 days *)

		gHMI.recipe.data.heating.tempLivingroomSet	:= gCfg.data.heating.tempLivingroomSet	:= MIN(MAX(gHMI.recipe.data.heating.tempLivingroomSet, 15.0), 30.0);	(* °C *)
		gHMI.recipe.data.heating.tempManOffset		:= gCfg.data.heating.tempManOffset		:= MIN(MAX(gHMI.recipe.data.heating.tempManOffset, -5.0), 5.0);			(* °C *)
		gHMI.recipe.data.heating.tempLowOffset		:= gCfg.data.heating.tempLowOffset		:= MIN(MAX(gHMI.recipe.data.heating.tempLowOffset, -5.0), 0.0);			(* °C *)
		gHMI.recipe.data.heating.tempFlowSetOffset	:= gCfg.data.heating.tempFlowSetOffset	:= MIN(MAX(gHMI.recipe.data.heating.tempFlowSetOffset, -10), 10);		(* °C *)

		gHMI.recipe.data.heating.kp 				:= gCfg.data.heating.kp					:= MIN(MAX(gHMI.recipe.data.heating.kp, 0), 15.0);						(* gain *)
		gHMI.recipe.data.heating.tn 				:= gCfg.data.heating.tn					:= MIN(MAX(gHMI.recipe.data.heating.tn, 0), 1000.0);					(* s *)

		(* hot water *)
		FOR index := 0 TO MAX_HOTWATER_TIME_INDEX DO
			gHMI.recipe.data.heating.hotwater.startTime[index] := gCfg.data.heating.hotwater.startTime[index] := MIN(MAX(gHMI.recipe.data.heating.hotwater.startTime[index], 0), 1440);		(* 24h *)
			gHMI.recipe.data.heating.hotwater.endTime[index]   := gCfg.data.heating.hotwater.endTime[index]   := MIN(MAX(gHMI.recipe.data.heating.hotwater.endTime[index], 0), 1440);		(* 24h *)
		END_FOR;
		gHMI.recipe.data.heating.hotwater.tempSet := gCfg.data.heating.hotwater.tempSet := MIN(MAX(gHMI.recipe.data.heating.hotwater.tempSet, 0), BOILER_MAX_TEMP);	(* °C *)

		gCfg.isValid := TRUE;	(* data is validated *)
	END_IF;
END_PROGRAM
