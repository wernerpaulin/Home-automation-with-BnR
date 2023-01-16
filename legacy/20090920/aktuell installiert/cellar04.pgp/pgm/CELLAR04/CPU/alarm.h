/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
;*    Purpose	Alarm Configuration                                                          *
;*                                                                                           *
;*    Filename  alarm.h                                                                      *
;*-------------------------------------------------------------------------------------------*
;*  History :                                                                                *
;*  Version       Datum         Autor                                                        *
;*  01.00         28.04.05      W. Paulin     created                                        *
;********************************************************************************************/

#ifndef _ALARM_H_
#define _ALARM_H_

#define	DI_STATE_ALARM_ACK	1

/* alarms */
enum ALARM_DEFNITION
{
	ALARM_ESTOP = 0,						/*  0 */
	ALARM_NO_VALID_RECIPE_ACTIVE,			/*  1 */
	ALARM_NO_CONNECTION_HEATING_EX270,		/*  2 */
	ALARM_OVERTEMPERATURE_BURNER,			/*  3 */
	ALARM_OVERTEMPERATURE_BOILER,			/*  4 */
	MAX_NB_ALARMS
};


/* alarm configuration - bit coded */
#define ALARM_CFG_CMD_WAIT_4_ACK		0x01
#define ALARM_CFG_REA_E_STOP 			0x02
#define ALARM_CFG_REA_STOP 				0x04

#define SET_ALARM_CONFIG()														\
{																				\
	gAlarm.cfg[0]  = 0x02;				/* ALARM_ESTOP */						\
	gAlarm.cfg[1]  = 0x00;				/* ALARM_NO_VALID_RECIPE_ACTIVE */		\
	gAlarm.cfg[2]  = 0x02;				/* ALARM_NO_CONNECTION_HEATING_EX270 */	\
	gAlarm.cfg[3]  = 0x02;				/* ALARM_OVERTEMPERATURE_BURNER */		\
	gAlarm.cfg[4]  = 0x02;				/* ALARM_OVERTEMPERATURE_BOILER */		\
}

#endif