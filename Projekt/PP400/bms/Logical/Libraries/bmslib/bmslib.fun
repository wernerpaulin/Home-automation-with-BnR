(********************************************************************
 * COPYRIGHT -- WERNER PAULIN 
 ********************************************************************
 * Library: bmslib
 * File: bmslib.fun
 * Author: paulinw
 * Created: December 27, 2009
 ********************************************************************
 * Functions and function blocks of library bmslib
 ********************************************************************)

FUNCTION_BLOCK DatObjUpdate (*writes data to dataobjects and creates it if it does not exists*)
	VAR_INPUT
		pName : UDINT;
		pData : UDINT;
		index : UDINT;
		nbElement : UDINT;
		sizeOfElement : UDINT;
	END_VAR
	VAR_OUTPUT
		status : UINT;
	END_VAR
	VAR
		ident : UDINT;
		fDatObjInfo : DatObjInfo;
		fDatObjCreate : DatObjCreate;
		fDatObjWrite : DatObjWrite;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK IrrigValveMgr (*irrigation valve manager*)
	VAR_INPUT
		newMinute : BOOL;
	END_VAR
	VAR_OUTPUT
		pumpRequest : BOOL;
	END_VAR
	VAR_IN_OUT
		switchOnRequest : BOOL;
		valve : BOOL;
	END_VAR
	VAR
		watchdogTimer : UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION DayOfYear : UINT (*calculates the day of a year from a date*)
	VAR_INPUT
		inDate : DTStructure;
	END_VAR
	VAR
		monthIndex : USINT;
		dayPerMonth : ARRAY[0..12] OF USINT := [0,31,28,31,30,31,30,2(31),30,31,30,31]; (*number days per month - without leap year - starting at index #1*)
	END_VAR
END_FUNCTION

FUNCTION IsLeapYear : BOOL (*determine whether the given year is a leap year*)
	VAR_INPUT
		year : UINT;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK Hyst2p (*2 point hysteresis - optimized for heating *)
	VAR_INPUT
		xAct : REAL;
		xSet : REAL;
		pHyst : REAL;
		nHyst : REAL;
	END_VAR
	VAR_OUTPUT
		y : BOOL;
		e : REAL;
	END_VAR
	VAR
		xActOld : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GetTrendDatObjName (*Generates the name of a trend data object with the year in the suffix*)
	VAR_INPUT
		templateName : STRING[10];
		year : UINT;
	END_VAR
	VAR_OUTPUT
		datObjName : STRING[10];
	END_VAR
	VAR
		stringDigit : STRING[1];
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK DateOfDay (*calculates day and month according to a given day of year*)
	VAR_INPUT
		year : UINT;
		dayOfYear : UINT;
	END_VAR
	VAR_OUTPUT
		outDate : DTStructure;
	END_VAR
	VAR
		monthIndex : USINT;
		dayPerMonth : ARRAY[0..12] OF USINT := [0,31,28,31,30,31,30,2(31),30,31,30,31]; (*number days per month - without leap year - starting at index #1*)
		dayOfYearSum : UINT;
	END_VAR
END_FUNCTION_BLOCK
