(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: hs_con
 * File: hs_con.typ
 * Author: paulinw
 * Created: February 04, 2010
 ********************************************************************
 * Local data types of program hs_con
 ********************************************************************)

TYPE
	trendDebug_typ : 	STRUCT 
		name : ARRAY[0..9] OF USINT;
		dayOfYear : UINT;
		date : DTStructure;
		dayOfYearFromDate : UINT;
		tempAct : REAL;
		tempSet : REAL;
		cmdTempSet : USINT;
		heatingHoursDayAct : UDINT;
		heatingHoursDaySet : UDINT;
		cmdHeatingHoursDaySet : USINT;
	END_STRUCT;
END_TYPE
