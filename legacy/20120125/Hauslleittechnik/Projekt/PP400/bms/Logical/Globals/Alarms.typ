(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * File: Alarms.typ
 * Author: paulinw
 * Created: December 26, 2009
 ********************************************************************
 * Global data types of project bms
 ********************************************************************)
(*How to add new alarms:*)
(*1. add alarm in enum list*)
(*2. define reaction in alarm.st*)
(*3. add alarm in Visual Components*)
(*4. use the alarm in program*)

TYPE
	ALARMS : 
		(
		ALARM_RECIPE_READ := 0,
		ALARM_RECIPE_WRITE,
		ALARM_RECIPE_NAME_INV,
		ALARM_HEATING_BURNER_TEMP_HIGH,
		ALARM_HEATING_BOILER_TEMP_HIGH,
		ALARM_HEATING_NODE_CON_ERROR,
		ALARM_IRRIGATION_NODE_CON_ERROR,
		ALARM_HEATING_BURNER_TEMP_LIMIT,
		ALARM_MAX
		);
	ALARM_REACTIONS : 
		(
		ALARM_REACTION_NOTHING := 0,
		ALARM_REACTION_STOP,
		ALARM_REACTION_WARNING
		);
	alarm_typ : 	STRUCT 
		request : ARRAY[0..ALARM_MAX] OF BOOL;
		ack : ARRAY[0..ALARM_MAX] OF BOOL;
		reaction : ARRAY[0..ALARM_MAX] OF DINT;
		warning : BOOL;
		stop : BOOL;
		ackBlock : BOOL;
	END_STRUCT;
END_TYPE
