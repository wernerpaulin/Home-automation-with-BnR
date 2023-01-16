/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose    general include file                                                         *
*                                                                                            *
*    Filename   bms_gn.h                                                                     *
*********************************************************************************************/

#ifndef _BMS_GN_H_
#define _BMS_GN_H_

#include <bur/plctypes.h>
#include <astime.h>
#include <asstring.h>
#include <sys_lib.h>
#include <brsystem.h>
#include <visapi.h>
#include <dataobj.h>
#include <string.h>
#include <vcTrend.h>
#include <alarm.h>

#if __i386__
#include <canio.h>
#include <commserv.h>
#include <bms_aux.h>
#include <vscreen.h>
#endif


/* defines */
#define INACTIVE						0
#define ACTIVE							1

enum MODES
{
	MODE_OFF = 0,
	MODE_ON,
	MODE_AUTO,
	MAX_NB_MODE
};	

#define BMS_DEF_RCP_DO_NAME				"rcp_def"
#define BMS_STATISTICS_DO_NAME			"bms_stat"

/* errors */
#define	ERR_RCP_INCOMPATIBLE			0xFFFF
#define	ERR_FUB_BUSY					65535


/* IRRIGATION PLANT */
#define	NB_SEGMENT						6	/* changes effect macros, receipe and statistic data object! */
#define	NB_IRRIGATION_START_TIME		2	/* changes effect macros, receipe */
#define	SEGMENT_WATCHDOG_TIME			45	/* segment timeout [min] */

#define IRRIGATION_CX408_BUS_NUMBER		1	/* CAN-Bus number where CAN-IO with CX408 is located */
#define IRRIGATION_CX408_NODE_NUMBER	2	/* Node number of CX408 */
#define	IRRIGATION_PUMP_ON_DELAY		1000	/* delay for switching on pump */


/* HEATING SYSTEM */
#define	BMS_LIN_HEAT_DO_NAME			"lin_heat"
#define	BMS_LIN_OUTSIDE_DO_NAME			"lin_out"
#define	BMS_LIN_INSIDE_DO_NAME			"lin_in"
#define	BMS_HEATING_CURVE				"heatcurv"

#define	NB_HOTWATER_TIME				2

#define	LIVING_ROOM_TEMP_POS_HYSTERESIS	0.3
#define	LIVING_ROOM_TEMP_NEG_HYSTERESIS	0.2

#define	MIXER_ZERO_WINDOW				0.9
#define MIXER_FULLY_OPEN_TIME			118.0	/* time [s] which is needed to open mixer completely */
#define	MIXER_FULLY_OPEN_POSITION		100.0
#define	BURNER_TEMP_HYSTERESIS			3.0

#define BOILER_PARALLEL_RESISTANCE		4715.8	/* exact value of parallel restance used with NTC */
#define BURNER_PARALLEL_RESISTANCE		4696.8	/* exact value of parallel restance used with NTC */
#define FLOW_PARALLEL_RESISTANCE		4649.0	/* exact value of parallel restance used with NTC */
#define OUTSIDE_PARALLEL_RESISTANCE		4692.2	/* exact value of parallel restance used with NTC */
#define INSIDE_PARALLEL_RESISTANCE		4651.1	/* exact value of parallel restance used with NTC */

#define	MAX_BOILER_TEMP 				80.0
#define	MAX_BURNER_TEMP 				90.0
#define	TEMP_SET_OFFSET					5.0

#define AT324_ALL_CHANNELS_RESISTANCE_MEASUREMENT	0x0B6D 	/* bit 0 and 2 of each channel confiuration set */

#define HEATING_EX270_BUS_NUMBER					1		/* CAN-Bus number where CAN-IO with AT324 is located */
#define HEATING_EX270_NODE_NUMBER					3		/* Node number of EX270 */
#define CANIO_WRITE_PARAMETER						11		/* code according CANIO-Master */
#define CANIO_ACTIVATE_PARAMETER					12		/* code according CANIO-Master */
#define CANIO_READ_OS_VERSION						16		/* code according CANIO-Master */
#define CANIO_PARAMETER_FOR_SCREW_IN_MODULE			28		/* code according CANIO-Master */

#define	CRITICAL_FREEZING_OUTSIDE_TEMP				3.0

#define	HEATING_PID_I_MAX							100.0

#define	BURNER_MIN_RUNTIME							180000

#define	TREND_HEAT_CURVE_NB_VALUES					9

#define	TREND_COLOR_BLACK							0
#define	TREND_COLOR_GRAY							7
#define	TREND_COLOR_LIGHT_GRAY						59
#define	TREND_COLOR_DARK_GRAY						8
#define	TREND_COLOR_WHITE							15
#define	TREND_COLOR_RED								4
#define	TREND_COLOR_BLUE							1
#define	TREND_COLOR_TEAL							3
#define	TREND_COLOR_GREEN							2
#define	TREND_COLOR_PURPLE							5
#define	TREND_COLOR_ORANGE							49

/* HMI */
#define	VISCOMP_HMI_PANEL_OBJECT_NAME	"hmi"
#define	BMS_HEAT_DO_NAME_BASE			"heat_"
#define	BMS_TEMP_HIGH_DO_NAME_BASE		"temph_"
#define	BMS_TEMP_LOW_DO_NAME_BASE		"templ_"


enum PICTURE_NUMBER
{
	PIC_INIT = 0,
	PIC_IRRIGATION,
	PIC_HEATING,
	PIC_IRRIG_CFG,
	PIC_HEAT_CFG,
	PIC_TREND,
	PIC_SERVICE,
	PIC_ALARM,
	PIC_TOUCH_CAL,
	MAX_NB_PICUTRE
};

enum TOUCH_CALIBRATION_STATES
{
	TOUCH_CALIBRATION_DONE = 0,
	CHANGE_TO_TOUCH_CALIBRATION_PICTURE,
	START_TOUCH_CALIBRATION,
	GET_TOUCH_CALIBRATION_STATUS,
};

#define	TEMP_TENDENY_HYSTERESIS			0.1			/* [0.1°C] */
#define	TREND_NB_YEAR					2
#define	TREND_NB_DAY					2

/* data types */
/*-------------------------------------------- RECIPE HANDLING ---------------------------------------------------------*/
/* NOTE: any change of data types requires changes in rcp_cpy task */	
/* 32bit ALIGNMENT!!! */
typedef struct rcpParSegment_typ							/* segment configuration */
{
	UDINT					mode;									/* 0...off, 1...on, 2...auto */
	UDINT					startTime[NB_IRRIGATION_START_TIME];	/* start time of irrigation [min] */
	UDINT					duration[NB_IRRIGATION_START_TIME];		/* duration [min] */
}	rcpParSegment_typ;
/* 32bit ALIGNMENT!!! */
typedef struct rcpParIrrigation_typ							/* irrigation plant recipe parameters */
{
	rcpParSegment_typ		segment[NB_SEGMENT];			/* segment configuration */
}	rcpParIrrigation_typ;
/* 32bit ALIGNMENT!!! */
typedef struct rcpParHotwater_typ							/* heating system recipe parameters */
{
	UDINT					startTime[NB_HOTWATER_TIME];	/* start time of hot water generation [min] */
	UDINT					endTime[NB_HOTWATER_TIME];		/* end time of heating generation [min] */
	REAL					tempSet;						/* set temperature of boiler */
}	rcpParHotwater_typ;
/* 32bit ALIGNMENT!!! */
typedef struct rcpParOutOfHome_typ							/* heating system recipe parameters */
{
	UDINT					mode;							/* 0...off, 1...on */
	UDINT					startDay;						/* out of home begin [day] */
	UDINT					endDay;							/* out of home end [day] */
}	rcpParOutOfHome_typ;
/* 32bit ALIGNMENT!!! */
typedef struct rcpParHeating_typ							/* heating system recipe parameters */
{
	UDINT					mode;							/* 0...off, 1...on */
	UDINT					startTime;						/* start time of heating [min] */
	UDINT					endTime;						/* end time of heating [min] */
	rcpParOutOfHome_typ		outOfHome;						/* out of home configuration */
	REAL					tempLivingroomSet;				/* living room set temperature */
	REAL					tempManOffset;					/* manual offset to living room set temperature [°C] */
	REAL					tempLowOffset;					/* lowering offset to living room set temperature [°C] */
	DINT					tempFlowSetOffset;				/* offset to flow temperature */
	REAL					kp;								/* kp of heat controller */
	REAL					ti;								/* ti of heat controller */
	rcpParHotwater_typ		hotwater;						/* hot water configuration */
}	rcpParHeating_typ;
/* 32bit ALIGNMENT!!! */
typedef struct rcpPar_typ									/* recipe parameters */
{
	rcpParIrrigation_typ	irrigation;
	rcpParHeating_typ		heating;
}	rcpPar_typ;

typedef struct cfgData_typ									/* internal configuration data */
{
	rcpPar_typ				rcpPar;							/* recipe based parameters */
	USINT					parLock;						/* locking flag - active while manipulation */
}	cfgData_typ;

typedef struct hmiRcpCtrl_typ								/* control interface for recipe handling */
{
	USINT					rcpName[10];					/* name of recipe */
	USINT					cmdNewRecipe;					/* trigger: read out new recipe data object */
	UINT					status;							/* status whether read out was ok or not */
	UINT					cntNewRcpData;					/* infinit counter indicating new recipe loaded */
}	hmiRcpCtrl_typ;


/*---------------------------------------------- HMI ACCESS ------------------------------------------------------------*/
typedef struct hmiCmdGeneral_typ							/* general commands from HMI to control */
{
	BOOL					diAlarmAck;						/* acknowledge pending alarms */
	BOOL					diAlarmAckBlock;				/* acknowledge all pending alarms at once */
	BOOL					diRcpWriteTrigger;				/* write recipe data */
	BOOL					diSetTime;						/* set time */
	USINT					cmdTouchCal;					/* touch calibration */
	DTStructure				setTime;						/* set time */
	UINT					actPic;							/* actual picture */
	UINT					setPic;							/* set picture */
}	hmiCmdGeneral_typ;

typedef struct hmiCmdTime_typ								/* time in hours and minutes */
{
	UDINT					hour;							
	UDINT					minute;
	UDINT					duration;
}	hmiCmdTime_typ;

typedef struct hmiCmdDate_typ								/* date in days and month */
{
	UDINT					day;							
	UDINT					month;
}	hmiCmdDate_typ;

typedef struct hmiCmdSegment_typ							/* segment configuration */
{
	hmiCmdTime_typ			time[NB_IRRIGATION_START_TIME];
}	hmiCmdSegment_typ;
typedef struct hmiCmdIrrigation_typ							/* irrigation plant recipe parameters */
{
	hmiCmdSegment_typ		segment[NB_SEGMENT];			/* segment configuration */
}	hmiCmdIrrigation_typ;

typedef struct hmiCmdHotwater_typ							/* hot water commands from HMI to control */
{
	hmiCmdTime_typ			startTime[NB_HOTWATER_TIME];
	hmiCmdTime_typ			endTime[NB_HOTWATER_TIME];
}	hmiCmdHotwater_typ;

typedef struct hmiCmdOutOfHome_typ							/* out of home commands from HMI to control */
{
	hmiCmdDate_typ			startDate;
	hmiCmdDate_typ			endDate;
}	hmiCmdOutOfHome_typ;
typedef struct hmiCmdHeating_typ							/* heating system commands from HMI to control */
{
	hmiCmdTime_typ			startTime;
	hmiCmdTime_typ			endTime;
	DINT					tempManOffset;					/* manual offset to living room set temperature [°C] */
	hmiCmdOutOfHome_typ		outOfHome;
	hmiCmdHotwater_typ		hotwater;						/* hot water */
	USINT					cmdUpdateHeatCurve;				
}	hmiCmdHeating_typ;


typedef struct hmiCmdTrendInfo_typ							/* trend information */
{
	BOOL					enable;
	UDINT					curveId;
	DINT					*pData;
}	hmiCmdTrendInfo_typ;

typedef struct hmiCmdTrendYear_typ							/* trend information */
{
	DTStructure				date;							/* date */
	hmiCmdTrendInfo_typ		high;
	hmiCmdTrendInfo_typ		low;
	hmiCmdTrendInfo_typ		heat;
	USINT					cmdUpdate;
	tr_cursor_typ			cursorX;
}	hmiCmdTrendYear_typ;

typedef struct hmiCmdTrendDay_typ
{
	DINT					*pData;
}	hmiCmdTrendDay_typ;

typedef struct hmiCmdTrend_typ								/* trending */
{
	hmiCmdTrendYear_typ		year[TREND_NB_YEAR];			/* trend information */
	hmiCmdTrendDay_typ		day[TREND_NB_DAY];				/* trend information */
}	hmiCmdTrend_typ;

typedef struct hmiCmd_typ									/* commands from HMI to control */
{
	hmiCmdGeneral_typ		general;						/* general commands */
	hmiCmdIrrigation_typ	irrigation;						/* irrigiation plant */
	hmiCmdHeating_typ		heating;						/* heating system */
	hmiCmdTrend_typ			trend;							/* trending */
}	hmiCmd_typ;


/*---------------------------------------------- ACTUAL DATA -----------------------------------------------------------*/

typedef struct actDataGeneral_typ							/* general information */
{
	DTStructure				time;							/* current time */
}	actDataGeneral_typ;


typedef struct irrigationStatistics_typ						/* irrigation statistics */
{
	UDINT					onTimePump;
	UDINT					valve[NB_SEGMENT];
}	irrigationStatistics_typ;
typedef struct heatingStatistics_typ						/* heating statistics */
{
	UDINT					onTimeBurner;
	UDINT					onTimeBoilerBump;
	UDINT					onTimeFlowPump;
}	heatingStatistics_typ;
typedef struct actDataStatistics_typ						/* statistics */
{
	irrigationStatistics_typ	irrigation;
	heatingStatistics_typ		heating;
}	actDataStatistics_typ;


typedef struct actDataSegment_typ							/* irrigation plant segment */
{
	BOOL					state;
}	actDataSegment_typ;
typedef struct actDataIrrigation_typ						/* irrigation plant commands from HMI to control */
{
	UINT					tankLevel;						/* level of water tank */
	actDataSegment_typ		segment[NB_SEGMENT];			/* irrigation segment */
}	actDataIrrigation_typ;


typedef struct actDataBurner_typ							/* burner */
{
	REAL					tempSet;						/* burner set temperature [°C] */
	REAL					tempAct;						/* burner act temperature [°C] */
}	actDataBurner_typ;

typedef struct actDataBoiler_typ							/* boiler */
{
	BOOL					state;							/* INACTIVE, ACTIVE */
	REAL					tempAct;						/* burner act temperature [°C] */
}	actDataBoiler_typ;

typedef struct actDataHotWater_typ							/* hot water information */
{
	BOOL					state;							/* INACTIVE, ACTIVE */
	actDataBoiler_typ		boiler;							
}	actDataHotWater_typ;

typedef struct actDataHeating_typ							/* heating information */
{
	BOOL					state;							/* INACTIVE, ACTIVE */
	REAL					tempFlowSet;					/* set flow temperature   [°C] */
	REAL					tempFlowAct;					/* flow temperature   [°C] */
	REAL					tempOutsideAct;					/* outside temp.      [°C] */
	REAL					tempLivingroomAct;				/* living room temp.  [°C] */
	REAL					tempLivingroomSet;				/* living room set temp. [°C] */
	REAL					sSetMixer;						/* set position of mixer */
	REAL					sActMixer;						/* actual position of mixer */
	actDataBurner_typ		burner;
	actDataHotWater_typ		hotwater;
}	actDataHeating_typ;

typedef struct actDataTrendYear_typ							/* year trend information */
{
	DINT					tempAv;							/* average temperature of this year */
	UDINT					heatingHoursTot;				/* heating hours of this year */
	UDINT					heatingHoursDay;				/* heating hours of a specific day in this year */
	DINT					tempHigh;						/* maximum temperature of a specific day */
	DINT					tempLow;						/* minimum temperature of a specific day */
}	actDataTrendYear_typ;

typedef struct actDataTrend_typ								/* trending */
{
	actDataTrendYear_typ	year[TREND_NB_YEAR];			/* year trending */
}	actDataTrend_typ;


typedef struct actData_typ									/* actual data of building management system */
{
	actDataGeneral_typ		general;						/* general information */
	actDataIrrigation_typ	irrigation;						/* irrigation plant */
	actDataHeating_typ		heating;						/* heating system */
	actDataStatistics_typ	statistics;						/* statistical information */
	actDataTrend_typ		trend;							/* trending  */
}	actData_typ;


/*-------------------------------------------------- ALARMS ------------------------------------------------------------*/
typedef struct alarm_typ									/* alarm info structure */
{
	BOOL				request[MAX_NB_ALARMS];				/* alarm request by application */
	USINT				cfg[MAX_NB_ALARMS];					/* alarm configuration */
	BOOL				wait4ack[MAX_NB_ALARMS];			/* wait for acknowlege set if alarm came and ack configured */
	BOOL				suppress[MAX_NB_ALARMS];			/* online suppress of alarm */
	BOOL				state[MAX_NB_ALARMS];				/* actual state of alarm -> Visual Components: alarm bit array */
	BOOL				ack[MAX_NB_ALARMS];					/* alarm acknowledge -> Visual Components: acknowledge bit array */
	UINT				nbPending;							/* number of actual pending alarms */
	USINT				eStop;								/* Emergency stop recommended by alarm manager */
	USINT				stop;								/* stop recommended by alarm manager */
}	alarm_typ;


/* PID */
typedef struct pidInf_typ
{
	REAL	e;												/* control deviation e = w-x */
	REAL	Kp;												/* proportional gain */
	REAL	Ti;												/* integral action time */
	REAL	i_max;											/* maximum integral action */
	REAL	Td;												/* derivative action time */
	REAL	T1;												/* filter time */
	REAL	Ta;												/* sample time of PID controller */
	REAL	y_max;											/* output limitation */
	REAL	y;												/* output signal */
	REAL	yp;												/* proportional part */
	REAL	yi;												/* integral part */
	REAL	yd;												/* differencial part */
	REAL	ydt1;											/* filtered d-part by T1 */
	REAL	yp_old;											/* last yp used for d-part (internal use only) */
	REAL	i_lim;											/* actual anit wind-up limitation (internal use only) */
	USINT	yiHold;											/* 1 ...holds yi part at actual value */
}	pidInf_typ;

void pid(pidInf_typ *pPID);
void pidInit(pidInf_typ *pPID);


/* trend debugging */
typedef struct trendDebug_typ
{
	USINT					name[10];
	UINT					dayOfYear;
	REAL					tempAct;
	REAL					tempSet;
	USINT					cmdTempSet;
	UDINT					heatingHoursDayAct;
	UDINT					heatingHoursDaySet;
	USINT					cmdHeatingHoursDaySet;
}	trendDebug_typ;


typedef struct animationInf_typ
{
	UDINT					timer;
	UDINT					duration;
	UINT					index;
	UINT					nbElements;
}	animationInf_typ;


/* makros */
#define EDGE(ep, en, value, oldValue)				\
{													\
	if ( ((value) > 0) && ((oldValue) == 0) )		\
	{												\
		(ep) = 1;									\
	}												\
	else if ( ((value) == 0) && ((oldValue) > 0) )	\
	{												\
		(en) = 1;									\
	}												\
													\
	oldValue = value;								\
}


#define SIGN(value)	( (value) >= (0)? (1):(-1) )

#define MAX(a,b)	( (a) > (b)? (a):(b) ) 		/* find maximum */
#define MIN(a,b)	( (a) < (b)? (a):(b) ) 		/* find minimum */


#endif

