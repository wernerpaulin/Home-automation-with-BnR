(********************************************************************
 * COPYRIGHT --  WERNER PAULIN
 ********************************************************************
 * File: Global.typ
 * Author: paulinw
 * Created: December 26, 2009
 ********************************************************************
 * Global data types of project bms
 ********************************************************************)

TYPE
	rcpDataOutOfHome_typ : 	STRUCT 
		startDay : UDINT;
		endDay : UDINT;
	END_STRUCT;
	rcpDataHotwater_typ : 	STRUCT 
		startTime : ARRAY[0..MAX_HOTWATER_TIME_INDEX] OF UDINT;
		endTime : ARRAY[0..MAX_HOTWATER_TIME_INDEX] OF UDINT;
		tempSet : REAL;
	END_STRUCT;
	rcpDataHeating_typ : 	STRUCT 
		startTime : UDINT;
		endTime : UDINT;
		outOfHome : rcpDataOutOfHome_typ;
		tempLivingroomSet : REAL;
		tempManOffset : REAL;
		tempLowOffset : REAL;
		tempFlowSetOffset : REAL;
		kp : REAL;
		tn : REAL;
		hotwater : rcpDataHotwater_typ;
	END_STRUCT;
	rcpCtrl_typ : 	STRUCT 
		name : ARRAY[0..9] OF USINT;
		nameIndex : UINT;
		load : BOOL;
		save : BOOL;
		cntLoad : USINT;
		saveOk : USINT;
		loadOk : USINT;
	END_STRUCT;
	rcpData_typ : 	STRUCT 
		heating : rcpDataHeating_typ;
	END_STRUCT;
	rcp_typ : 	STRUCT 
		ctrl : rcpCtrl_typ;
		data : rcpData_typ;
	END_STRUCT;
	hmiCmd_typ : 	STRUCT 
		setTime : BOOL;
		updatePID : BOOL;
		doScreenShot : BOOL;
		updateDateTime : BOOL;
		screenCleaning : BOOL;
	END_STRUCT;
	hmiGeneral_typ : 	STRUCT 
		setTime : DTStructure;
		actPage : UINT;
		setPage : UINT;
		cmdNewPage : UINT;
		screenCleanTime : UDINT;
	END_STRUCT;
	hmiDayTime_typ : 	STRUCT 
		hour : USINT;
		minute : USINT;
	END_STRUCT;
	hmiOutOfHome_typ : 	STRUCT 
		startDate : DTStructure;
		endDate : DTStructure;
	END_STRUCT;
	hmiHotwater_typ : 	STRUCT 
		startTime : ARRAY[0..MAX_HOTWATER_TIME_INDEX] OF hmiDayTime_typ;
		endTime : ARRAY[0..MAX_HOTWATER_TIME_INDEX] OF hmiDayTime_typ;
	END_STRUCT;
	hmiHeating_typ : 	STRUCT 
		tempOutsideTendency : USINT;
		tempLivingroomTendency : USINT;
		startTime : hmiDayTime_typ;
		endTime : hmiDayTime_typ;
		outOfHome : hmiOutOfHome_typ;
		hotwater : hmiHotwater_typ;
		statusDatapointLoweringText : UINT;
		statusDatapointAlarmIndicator : UINT;
	END_STRUCT;
	hmiTrendYearTempData_typ : 	STRUCT 
		enable : BOOL;
		tempDate : REAL;
		tempAv : REAL;
		dataBuffer : ARRAY[0..MAX_SAMPLE_INDEX_YEAR] OF REAL;
		nbSamples : UDINT;
		statusDatapoint : UINT;
	END_STRUCT;
	hmiTrendYearHeatData_typ : 	STRUCT 
		enable : BOOL;
		hoursTotal : UDINT;
		hoursDate : UDINT;
		dataBuffer : ARRAY[0..MAX_SAMPLE_INDEX_YEAR] OF UDINT;
		nbSamples : UDINT;
		statusDatapoint : UINT;
	END_STRUCT;
	hmiTrendYear_typ : 	STRUCT 
		update : BOOL;
		date : DTStructure;
		high : hmiTrendYearTempData_typ;
		low : hmiTrendYearTempData_typ;
		heat : hmiTrendYearHeatData_typ;
		tempAv : REAL;
	END_STRUCT;
	hmiTrendDay_typ : 	STRUCT 
		dataBuffer : ARRAY[0..MAX_SAMPLE_INDEX_DAY] OF REAL;
		nbSamples : UDINT;
	END_STRUCT;
	hmiTrend_typ : 	STRUCT 
		year : ARRAY[0..MAX_TREND_YEAR_INDEX] OF hmiTrendYear_typ;
		day : ARRAY[0..MAX_TREND_DAY_INDEX] OF hmiTrendDay_typ;
	END_STRUCT;
	hmi_typ : 	STRUCT 
		recipe : rcp_typ;
		cmd : hmiCmd_typ;
		general : hmiGeneral_typ;
		heating : hmiHeating_typ;
		trend : hmiTrend_typ;
	END_STRUCT;
	cfg_typ : 	STRUCT 
		data : rcpData_typ;
		isValid : BOOL;
	END_STRUCT;
	actDataGeneral_typ : 	STRUCT 
		time : DTStructure;
	END_STRUCT;
	actDataSegment_typ : 	STRUCT 
		switchOnRequest : BOOL;
	END_STRUCT;
	actDataIrrigation_typ : 	STRUCT 
		tankLevel : UINT;
		segment : ARRAY[0..5] OF actDataSegment_typ;
	END_STRUCT;
	actDataBurner_typ : 	STRUCT 
		switchOnRequest : BOOL;
		tempSet : REAL;
		tempAct : REAL;
		heatHoursDay : UDINT;
	END_STRUCT;
	actDataHotWater_typ : 	STRUCT 
		enable : BOOL;
		tempAct : REAL;
	END_STRUCT;
	actDataHeating_typ : 	STRUCT 
		enable : BOOL;
		manSwitchedOff : BOOL;
		outOfHomeActive : BOOL;
		loweringActive : BOOL;
		tempFlowSet : REAL;
		tempFlowAct : REAL;
		tempOutsideAct : REAL;
		tempLivingroomAct : REAL;
		tempLivingroomSet : REAL;
		tempOutsideDayLow : REAL;
		tempOutsideDayHigh : REAL;
		sSetMixer : REAL;
		sActMixer : REAL;
		burner : actDataBurner_typ;
		hotwater : actDataHotWater_typ;
	END_STRUCT;
	irrigationStatistics_typ : 	STRUCT 
		onTimePump : UDINT;
		valve : ARRAY[0..5] OF UDINT;
	END_STRUCT;
	heatingStatistics_typ : 	STRUCT 
		onTimeBurner : UDINT;
		onTimeBoilerBump : UDINT;
		onTimeFlowPump : UDINT;
	END_STRUCT;
	actDataStatistics_typ : 	STRUCT 
		irrigation : irrigationStatistics_typ;
		heating : heatingStatistics_typ;
	END_STRUCT;
	actData_typ : 	STRUCT 
		general : actDataGeneral_typ;
		irrigation : actDataIrrigation_typ;
		heating : actDataHeating_typ;
		statistics : actDataStatistics_typ;
	END_STRUCT;
	simulation_typ : 	STRUCT 
		isActive : BOOL;
		kp : REAL;
		tn : REAL;
		updatePID : BOOL;
	END_STRUCT;
END_TYPE
