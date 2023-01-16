(********************************************************************
 * COPYRIGHT -- WERNER PAULIN 
 ********************************************************************
 * Package: bmslib
 * File: bmslib.st
 * Author: paulinw
 * Created: December 27, 2009
 *******************************************************************)


(* writes data to dataobjects and creates it if it does not exists *)
FUNCTION_BLOCK DatObjUpdate
	fDatObjInfo(enable := 1, pName := pName);

	(* create data object if it does not exists *)
	IF (fDatObjInfo.status <> ERR_OK) OR (fDatObjCreate.status = ERR_FUB_BUSY) THEN
		fDatObjCreate(enable := 1, grp := 0, pName := fDatObjInfo.pName, len := nbElement * sizeOfElement, MemType := doUSRROM, Option := 0, pCpyData := 0);

		IF (fDatObjCreate.status = ERR_FUB_BUSY) THEN		(* wait until fub is finished *)
			status := ERR_FUB_BUSY;
			RETURN;
		ELSIF (fDatObjCreate.status = ERR_OK) THEN			(* save ident for writing if finished without error *)
  			ident := fDatObjCreate.ident;
   		ELSE												(* return any error and abort fub *)
			status := fDatObjCreate.status;
			RETURN;
		END_IF;
	ELSIF (fDatObjInfo.status = ERR_OK) THEN				(* save ident for writing if finished without error *)
		ident := fDatObjInfo.ident;
	END_IF;

	(* start writing only if module was created or found *)
	IF (ident <> 0) THEN
		fDatObjWrite(enable := 1, ident := ident, Offset := index * sizeOfElement, pSource := pData, len := sizeOfElement);
		status := fDatObjWrite.status;
		RETURN;
	END_IF;

	status := ERR_FUB_BUSY;
END_FUNCTION_BLOCK

(* Irrigation Valve Manager *)
FUNCTION_BLOCK IrrigValveMgr
	(* monitor ontime with watch in order to avoid that user forgets to switch off segment *)
	IF (switchOnRequest = TRUE) THEN
		watchdogTimer := watchdogTimer + newMinute;
		IF (watchdogTimer >= SEGMENT_WATCHDOG_TIME) THEN
			switchOnRequest := FALSE;
			watchdogTimer := 0;
  		END_IF;		
	ELSE
		watchdogTimer := 0;
	END_IF;
	
	pumpRequest := valve := switchOnRequest;		(* switch on valve and request pump to be switched on *)
END_FUNCTION_BLOCK

(* calculates the day of a year from a date *)
FUNCTION DayOfYear
	(* plausibility *)
	IF (inDate.month = 0) OR (inDate.month > 12) OR (inDate.day = 0) OR (inDate.day > 31) THEN
		DayOfYear := 1;
		RETURN;
	END_IF;

	(* count all days before this month *)
	DayOfYear := 0;
	FOR monthIndex := 1 TO inDate.month-1 DO
		DayOfYear := DayOfYear + dayPerMonth[monthIndex];
	END_FOR;

	(* add days of current month *)
	DayOfYear := DayOfYear + inDate.day;
 
	(* if year is a leap year and february has been already passed -> add one day because OF 29th OF feb. *)
	IF (IsLeapYear(inDate.year) = TRUE) AND (inDate.month > 2) THEN
		DayOfYear := DayOfYear + 1;
	END_IF;
	
	(* avoid invalid output *)
	IF (DayOfYear = 0) THEN
		DayOfYear := 1;
	END_IF;
END_FUNCTION

(* determine whether the given year is a leap year *)
FUNCTION IsLeapYear
	IF (((year MOD 4) = 0) AND ((year MOD 100) <> 0)) OR ((year MOD 400) = 0) THEN
		IsLeapYear := TRUE;
	ELSE
		IsLeapYear := FALSE;
	END_IF;
END_FUNCTION

(* 2 point hysteresis - optimized for heating *)
FUNCTION_BLOCK Hyst2p
	(* deviation: not used in function block but might be interesting for further usage *)
	e := xSet - xAct;
	
	(* switch off if temperature is outside of higher threshold *)
	IF (xAct > (xSet + pHyst)) THEN
		y := FALSE;
		xActOld := xAct;
	(* switch off if temperature has not yet reached lower threshold *)
	ELSIF ((xActOld > xAct) AND (xAct >= (xSet - nHyst))) THEN
		y := FALSE;
	(* switch on if temperature reached lower threshold *)
	ELSIF (xAct < (xSet - nHyst)) THEN
		y := TRUE;
		xActOld := xAct;
	ELSE
		y := TRUE;
	END_IF;
END_FUNCTION_BLOCK

(* Generates the name of a trend data object with the year in the suffix *)
FUNCTION_BLOCK GetTrendDatObjName
	memset(ADR(datObjName), 0, SIZEOF(datObjName));
	strcpy(ADR(datObjName), ADR(templateName));					(* template name *)
	
	itoa((year / 10) MOD 10, ADR(stringDigit));					(* add second digit of year *)
	strcat(ADR(datObjName), ADR(stringDigit));
	
	itoa((year /  1) MOD 10, ADR(stringDigit));					(* add first digit of year *)
	strcat(ADR(datObjName), ADR(stringDigit));
END_FUNCTION_BLOCK

(* calculates day and month according to a given day of year *)
FUNCTION_BLOCK DateOfDay
	(* plausibility *)
	IF (dayOfYear = 0) OR (dayOfYear > 366) THEN
		outDate.month := 1;
		outDate.day   := 1;
		RETURN;
	END_IF;

	(* adjust February in case of leap year *)
	IF IsLeapYear(year) = TRUE THEN
		dayPerMonth[2] := 29;
	ELSE
		dayPerMonth[2] := 28;
	END_IF;

	(* find month of this year's day *)
	dayOfYearSum := 0;
	FOR monthIndex := 1 TO 12 DO
		dayOfYearSum := dayOfYearSum + dayPerMonth[monthIndex];
		(* stop counting up days if desired day reached -> monthIndex shows the corresponding month *)
		IF dayOfYearSum >= dayOfYear THEN	
			EXIT;
		END_IF;
	END_FOR;

	outDate.month := monthIndex;
	outDate.day   := dayPerMonth[monthIndex] - UINT_TO_USINT(dayOfYearSum - dayOfYear);		(* add the remaining days of this month *)
END_FUNCTION_BLOCK
