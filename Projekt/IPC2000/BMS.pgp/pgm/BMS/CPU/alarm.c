/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Any System                                                                   *
*    Purpose	Alarm Manager                                                                *
*                                                                                            *
*    Filename   alarm.c                                                                      *
*--------------------------------------------------------------------------------------------*
*  Description :                                                                             *
*    evaluates incoming alarm requests according:                                            *
*      - configuration                                                                       *
*      - acknowledge requirement                                                             *
*      - acknowledge requests                                                                *
*      - suppress requests (alarms can be supressed in special conditions: manual/auto)      *
*                                                                                            *
*  Features :                                                                                *
*    - individual alarm configuration                                                        *
*      - acknowledge required/not required                                                   *
*      - emergency stop as reaction yes/no                                                   *
*      - stop as reaction yes/no                                                             *
*    - up to 65535 alarms supported                                                          *
*    - single (.ack array) or collective acknowledge on each alarm                           *
*    - suppressing individual alarms supported                                               *
*    - number currently pending alarms as information available                              *
*    - Visual Components compatible due to .state[] and .ack[] array                         *
*--------------------------------------------------------------------------------------------*
*  History :                                                                                 *
*  Version       Datum         Autor                                                         *
*  01.00         01.04.03      W. Paulin     created                                         *
*  01.01         13.07.03      W. Paulin     io access (diAlarmAck) removed                  *
*  01.02         21.08.03      W. Paulin     diAlarmAckBlock implement for fast acknowledge  *
*                                            of several alarms WEPA20030821                  *
*********************************************************************************************/

#include "bms_gn.h"
#include "bms_global.h"
#include "alarm.h"

_LOCAL UINT 			loopIndex;
_LOCAL BOOL 			alarmRequest;
_LOCAL BOOL 			stopRequest;
_LOCAL BOOL 			eStopRequest;
_LOCAL UINT				nbPendingAlarms;


_INIT void alarmini()
{
	loopIndex = 0;

	/* reset alarm info structure - forget everything */
	memset( &gAlarm.request,  0, sizeof(gAlarm.request) );
	memset( &gAlarm.wait4ack, 0, sizeof(gAlarm.wait4ack) );
	memset( &gAlarm.state,    0, sizeof(gAlarm.state) );

	/* set alarm configuration */
	SET_ALARM_CONFIG();
} /* _INIT void alarmini() */



_CYCLIC void alarmcyc()
{
	stopRequest     = 0;	/* assume no stop required */
	eStopRequest    = 0;	/* assume no emergency stop required */
	nbPendingAlarms = 0;	/* assume no alarms pending */

	/* evaluate all alarms */
 	for (loopIndex = 0; loopIndex < MAX_NB_ALARMS; loopIndex++)
 	{
 		/* check for pending alarm - consider suppress possibility */
 		alarmRequest = gAlarm.request[loopIndex] & (~gAlarm.suppress[loopIndex]);

		/* acknowledgement: general or single acknowledge possible */
		if ( (gHMIcmd.general.diAlarmAck      == DI_STATE_ALARM_ACK) ||
		     (gHMIcmd.general.diAlarmAckBlock == DI_STATE_ALARM_ACK) || 		/* WEPA20030821 */
		     (gAlarm.ack[loopIndex]           == ACTIVE) )
		{
			gAlarm.wait4ack[loopIndex] = INACTIVE;		/* try to acknowledge alarm - if still pending it will be set again below */
		}
		

		/* alarm is pending */
		if (alarmRequest == ACTIVE)
		{
			/* if acknowledge configured -> mark/refresh alarm as "acknowledge required" */
			if ( (gAlarm.cfg[loopIndex] & ALARM_CFG_CMD_WAIT_4_ACK) == ALARM_CFG_CMD_WAIT_4_ACK )	
				gAlarm.wait4ack[loopIndex] = ACTIVE;
			else
				gAlarm.wait4ack[loopIndex] = INACTIVE;
		}

		/* check if acknowlede necessary - if yes -> alarm still pending -> override alarmRequest */
 		gAlarm.state[loopIndex] = alarmRequest | gAlarm.wait4ack[loopIndex];
 		
 		/* process result of alarm evaluation */
		if (gAlarm.state[loopIndex] == ACTIVE)
		{
			nbPendingAlarms++;			/* count pending alarms */
			
	 		/* handle configured reactions if alarm is realy active */
 			if ( (gAlarm.cfg[loopIndex] & ALARM_CFG_REA_E_STOP) == ALARM_CFG_REA_E_STOP ) eStopRequest = ACTIVE;
 			if ( (gAlarm.cfg[loopIndex] & ALARM_CFG_REA_STOP)   == ALARM_CFG_REA_STOP   ) stopRequest  = ACTIVE;
 		}
 		else
 		{
 			gAlarm.wait4ack[loopIndex] = INACTIVE;
 			gAlarm.ack[loopIndex]      = INACTIVE;
 		}
 	} /* for (loopIndex = 0; loopIndex < MAX_NB_ALARMS; loopIndex++) */
 	
 	/* publish gathered information */
 	gAlarm.eStop            = eStopRequest;
 	gAlarm.stop             = stopRequest;
 	gAlarm.nbPending        = nbPendingAlarms;

	/* saftey: reset ack command in order to avoid continous acknowledge */
 	gHMIcmd.general.diAlarmAck = INACTIVE;
 	
 	/* reset block acknowledge automatically if there is not alarm anymore pending */
 	if (nbPendingAlarms == 0) gHMIcmd.general.diAlarmAckBlock = INACTIVE;
} /* _CYCLIC void alarmcyc() */

