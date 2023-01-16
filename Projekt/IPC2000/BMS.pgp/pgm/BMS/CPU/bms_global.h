/*********************************************************************************************
*  Copyright: 2005 by Paulin Werner                                                          *
*--------------------------------------------------------------------------------------------*
*  Identification:                                                                           *
*    System     Building Management System                                                   *
*    Purpose    global process variables                                                     *
*                                                                                            *
*    Filename   bms_global.h                                                                 *
*********************************************************************************************/

#ifndef _BMS_GLOBAL_H_
#define _BMS_GLOBAL_H_

#include "bms_gn.h"

_GLOBAL	hmiCmd_typ			gHMIcmd;
_GLOBAL	rcpPar_typ			gHMIrcpPar;
_GLOBAL	hmiRcpCtrl_typ		gHMIrcpCtrl;

_GLOBAL	alarm_typ			gAlarm;
_GLOBAL	actData_typ			gActData;
_GLOBAL	cfgData_typ			gCfgData;

#endif