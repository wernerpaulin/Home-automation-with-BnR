(********************************************************************
 * COPYRIGHT -- WERNER PAULIN 
 ********************************************************************
 * Program: ip_con
 * File: ip_con.st
 * Author: paulinw
 * Created: December 27, 2009
 ********************************************************************
 * Implementation of program ip_con
 * Features:
 * - controlling 6 valves (fixed) and 1 pump
 * Interfaces:
 * - gActData.irrigation
 ********************************************************************
 * History:
 * Version	Date		Author		Comment
 * V1.00	27.12.09	W. Paulin	created
 ********************************************************************)

PROGRAM _INIT
	fRTInfo(enable := 1);
	cycT := fRTInfo.cycle_time / 1000;
END_PROGRAM


PROGRAM _CYCLIC
	(* generate flag indicating new minute *)
	IF (oldMinute <> gActData.general.time.minute) THEN
		newMinute := TRUE;
		oldMinute := gActData.general.time.minute;
	ELSE
		newMinute := FALSE;
	END_IF;	

	(* apply recipe parameter if allowed  *)
	IF (gCfg.isValid) THEN
		memcpy(ADR(rcpData), ADR(gCfg.data), SIZEOF(rcpData));
	END_IF;	

	(* link switches to valves including watchdog monitoring *)
	IrrigValveMgr1(newMinute := newMinute, switchOnRequest := gActData.irrigation.segment[0].switchOnRequest, valve := doIrrigValve1);
	IrrigValveMgr2(newMinute := newMinute, switchOnRequest := gActData.irrigation.segment[1].switchOnRequest, valve := doIrrigValve2);
	IrrigValveMgr3(newMinute := newMinute, switchOnRequest := gActData.irrigation.segment[2].switchOnRequest, valve := doIrrigValve3);
	IrrigValveMgr4(newMinute := newMinute, switchOnRequest := gActData.irrigation.segment[3].switchOnRequest, valve := doIrrigValve4);
	IrrigValveMgr5(newMinute := newMinute, switchOnRequest := gActData.irrigation.segment[4].switchOnRequest, valve := doIrrigValve5);
	IrrigValveMgr6(newMinute := newMinute, switchOnRequest := gActData.irrigation.segment[5].switchOnRequest, valve := doIrrigValve6);

	(* switch on pump if any valve requests water *)
	doIrrigPump := IrrigValveMgr1.pumpRequest OR 
				   IrrigValveMgr2.pumpRequest OR 
				   IrrigValveMgr3.pumpRequest OR 
				   IrrigValveMgr4.pumpRequest OR 
				   IrrigValveMgr5.pumpRequest OR 
				   IrrigValveMgr6.pumpRequest;

	(* service cycle in order to void that valves get stuch during winter season *)
	IF (gActData.general.time.wday = 1) AND 		(* sunday to monday *)
	   (gActData.general.time.hour = 0) AND 		(* midnight *)
	   (doIrrigPump = FALSE) THEN					(* only if pump is switch off *)
		
		(* use valve outputs directly in order to avoid that pump will be switched on *)
		doIrrigValve1 := FALSE;
		doIrrigValve2 := FALSE;
		doIrrigValve3 := FALSE;
		doIrrigValve4 := FALSE;
		doIrrigValve5 := FALSE;
		doIrrigValve6 := FALSE;
	
		CASE gActData.general.time.minute OF		(* turn on every minute another valve *)
			1 : doIrrigValve1 := TRUE;
			2 : doIrrigValve2 := TRUE;
			3 : doIrrigValve3 := TRUE;
			4 : doIrrigValve4 := TRUE;
			5 : doIrrigValve5 := TRUE;
			6 : doIrrigValve6 := TRUE;
		END_CASE;
	END_IF;

	(* statistics *)
	gActData.statistics.irrigation.valve[0] := gActData.statistics.irrigation.valve[0] + EDGEPOS(doIrrigValve1);
	gActData.statistics.irrigation.valve[1] := gActData.statistics.irrigation.valve[1] + EDGEPOS(doIrrigValve2);
	gActData.statistics.irrigation.valve[2] := gActData.statistics.irrigation.valve[2] + EDGEPOS(doIrrigValve3);
	gActData.statistics.irrigation.valve[3] := gActData.statistics.irrigation.valve[3] + EDGEPOS(doIrrigValve4);
	gActData.statistics.irrigation.valve[4] := gActData.statistics.irrigation.valve[4] + EDGEPOS(doIrrigValve5);
	gActData.statistics.irrigation.valve[5] := gActData.statistics.irrigation.valve[5] + EDGEPOS(doIrrigValve6);

	IF (doIrrigPump = TRUE) THEN
		gActData.statistics.irrigation.onTimePump := gActData.statistics.irrigation.onTimePump + newMinute;
	END_IF;

	(* tank level feedback *)
	IF (diTankLevelHigh = TRUE) AND (diTankLevelLow = TRUE) THEN
		gActData.irrigation.tankLevel := 9;
	ELSIF (diTankLevelHigh = FALSE) AND (diTankLevelLow = TRUE) THEN
		gActData.irrigation.tankLevel := 6;
	ELSE 
		gActData.irrigation.tankLevel := 3;
	END_IF;
	
	(* alarm handling *)
	gAlarm.request[ALARM_IRRIGATION_NODE_CON_ERROR] := NOT(gIrrigationNodeOk);
END_PROGRAM
