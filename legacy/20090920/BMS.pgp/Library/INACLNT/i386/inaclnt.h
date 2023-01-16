/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef INACLNT_H_
#define INACLNT_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>



/* Constants */
_WEAK const unsigned short ERR_INAIQ_ACCESS_DENIED = 10212;
_WEAK const unsigned short ERR_INAIQ_CONN_ABORT = 10210;
_WEAK const unsigned short ERR_INAIQ_DLM_BRM_CS = 10226;
_WEAK const unsigned short ERR_INAIQ_DLM_BRM_INSTALL = 10227;
_WEAK const unsigned short ERR_INAIQ_DLM_BRM_INVALID = 10225;
_WEAK const unsigned short ERR_INAIQ_DLM_BRM_LENGTH = 10228;
_WEAK const unsigned short ERR_INAIQ_DLM_BRNC_ERROR = 10232;
_WEAK const unsigned short ERR_INAIQ_DLM_BURN = 10230;
_WEAK const unsigned short ERR_INAIQ_DLM_CANCEL = 10223;
_WEAK const unsigned short ERR_INAIQ_DLM_DECODE_TEL = 10221;
_WEAK const unsigned short ERR_INAIQ_DLM_DEFAULT = 10222;
_WEAK const unsigned short ERR_INAIQ_DLM_ENCODE_TEL = 10220;
_WEAK const unsigned short ERR_INAIQ_DLM_NO_ACCESS = 10224;
_WEAK const unsigned short ERR_INAIQ_DLM_NO_BRNC = 10231;
_WEAK const unsigned short ERR_INAIQ_DLM_TARGET_SIZE = 10229;
_WEAK const unsigned short ERR_INAIQ_NO_COMMSERV_BR = 10211;
_WEAK const unsigned short ERR_INAIQ_ULM_CANCEL = 10243;
_WEAK const unsigned short ERR_INAIQ_ULM_DECODE_TEL = 10241;
_WEAK const unsigned short ERR_INAIQ_ULM_DEFAULT = 10242;
_WEAK const unsigned short ERR_INAIQ_ULM_ENCODE_TEL = 10240;
_WEAK const unsigned short ERR_INAIQ_ULM_NO_ACCESS = 10247;
_WEAK const unsigned short ERR_INAIQ_ULM_OBJ_NOT_EXISTS = 10244;
_WEAK const unsigned short ERR_INAIQ_ULM_OBJ_NO_ACCESS = 10246;
_WEAK const unsigned short ERR_INAIQ_ULM_OBJ_STATE_CONFLIT = 10245;
_WEAK const unsigned short ERR_INAS_CONN_MAX = 10102;
_WEAK const unsigned short ERR_INAS_DO_BLOCKED = 10130;
_WEAK const unsigned short ERR_INAS_DO_BUFFER = 10132;
_WEAK const unsigned short ERR_INAS_DO_DATA_MISMATCH = 10126;
_WEAK const unsigned short ERR_INAS_DO_DUPLICATE = 10125;
_WEAK const unsigned short ERR_INAS_DO_EMPTY = 10129;
_WEAK const unsigned short ERR_INAS_DO_FULL = 10128;
_WEAK const unsigned short ERR_INAS_DO_INPUT = 10127;
_WEAK const unsigned short ERR_INAS_DO_INSTALL = 10121;
_WEAK const unsigned short ERR_INAS_DO_MAX = 10124;
_WEAK const unsigned short ERR_INAS_DO_MEMORY = 10122;
_WEAK const unsigned short ERR_INAS_DO_NO_SUCH_ID = 10123;
_WEAK const unsigned short ERR_INAS_DO_VERSION = 10120;
_WEAK const unsigned short ERR_INAS_MEMORY = 10100;
_WEAK const unsigned short ERR_INAS_NO_ITEM_FOUND = 10104;
_WEAK const unsigned short ERR_INAS_NO_SUCH_ID = 10101;
_WEAK const unsigned short ERR_INAS_OBJ_MAX = 10103;
_WEAK const unsigned short ERR_INAS_REQ_FRAME = 10111;
_WEAK const unsigned short ERR_INAS_STM_WRONG_STATE = 10110;
_WEAK const unsigned short ERR_INA_ACCESS_TYPE = 10024;
_WEAK const unsigned short ERR_INA_ACT_BUSY = 10027;
_WEAK const unsigned short ERR_INA_COMMAND_FIFO = 10049;
_WEAK const unsigned short ERR_INA_CONN_MAX = 10041;
_WEAK const unsigned short ERR_INA_CONN_STATE = 10025;
_WEAK const unsigned short ERR_INA_INPUT = 10022;
_WEAK const unsigned short ERR_INA_INPUTSIZE = 10039;
_WEAK const unsigned short ERR_INA_INSTALL = 10020;
_WEAK const unsigned short ERR_INA_LOC_DATA = 10030;
_WEAK const unsigned short ERR_INA_LOC_OBJ_NOT_EXIST = 10036;
_WEAK const unsigned short ERR_INA_LOC_OBJ_TYPE = 10032;
_WEAK const unsigned short ERR_INA_LOC_OBJ_TYPE_CHANGED = 10038;
_WEAK const unsigned short ERR_INA_LOC_PV_ZERO = 10034;
_WEAK const unsigned short ERR_INA_MEMORY = 10021;
_WEAK const unsigned short ERR_INA_NO_ITEM_FOUND = 10043;
_WEAK const unsigned short ERR_INA_NO_SUCH_ID = 10040;
_WEAK const unsigned short ERR_INA_OBJ_MAX = 10042;
_WEAK const unsigned short ERR_INA_OBJ_STATE = 10026;
_WEAK const unsigned short ERR_INA_PV_LIST = 10023;
_WEAK const unsigned short ERR_INA_REM_DATA = 10029;
_WEAK const unsigned short ERR_INA_REM_DYN_PV_ZERO = 10033;
_WEAK const unsigned short ERR_INA_REM_OBJ_NOT_EXIST = 10035;
_WEAK const unsigned short ERR_INA_REM_OBJ_TYPE = 10031;
_WEAK const unsigned short ERR_INA_REM_OBJ_TYPE_CHANGED = 10037;
_WEAK const unsigned short ERR_INA_TEXT_MAN = 10050;
_WEAK const unsigned short ERR_INA_TYPE_CHECK = 10028;
_WEAK const unsigned short ERR_IQVW_CONN_MAX = 10003;
_WEAK const unsigned short ERR_IQVW_DRIVER_MAX = 10002;
_WEAK const unsigned short ERR_IQVW_ID_ALREADY = 10007;
_WEAK const unsigned short ERR_IQVW_MEM = 10001;
_WEAK const unsigned short ERR_IQVW_NO_SUCH_DRV = 10004;
_WEAK const unsigned short ERR_IQVW_NO_SUCH_ID = 10000;
_WEAK const unsigned short ERR_IQVW_SYNTAX = 10006;
_WEAK const unsigned short ERR_IQVW_VERSION = 10008;
_WEAK const unsigned short inaACT_ERROR = 3;
_WEAK const unsigned short inaACT_READY = 0;
_WEAK const unsigned short inaACT_WORKING = 1;
_WEAK const unsigned char inaBRMODUL = 2;
_WEAK const unsigned short inaCONN_ACTIVE = 2;
_WEAK const unsigned short inaCONN_CONNECTING = 1;
_WEAK const unsigned short inaCONN_ERROR = 3;
_WEAK const unsigned short inaCONN_NOTEXISTING = 0;
_WEAK const unsigned char inaCPU = 3;
_WEAK const unsigned short inaCSTART = 5;
_WEAK const unsigned char inaDATAOBJ = 5;
_WEAK const unsigned char inaDATETIME = 4;
_WEAK const unsigned short inaDISABLE = 9;
_WEAK const unsigned short inaDL = 4;
_WEAK const unsigned short inaENABLE = 8;
_WEAK const unsigned char inaEVENTPV = 8;
_WEAK const unsigned short inaHALT = 7;
_WEAK const unsigned char inaMODE_ACTION = 3;
_WEAK const unsigned char inaMODE_CONNECT = 1;
_WEAK const unsigned char inaMODE_CONNECTSTRING = 4;
_WEAK const unsigned char inaMODE_CONN_ACT_ERR = 7;
_WEAK const unsigned char inaMODE_IQDRV = 32;
_WEAK const unsigned char inaMODE_IQDRVGLOBAL = 16;
_WEAK const unsigned char inaMODE_LINK = 2;
_WEAK const unsigned char inaMODE_LINKSTRINGLOCAL = 6;
_WEAK const unsigned char inaMODE_LINKSTRINGREMOTE = 5;
_WEAK const unsigned char inaMODE_QUEUE = 0;
_WEAK const unsigned char inaMODE_RING = 1;
_WEAK const unsigned short inaOBJ_ACTIVE = 2;
_WEAK const unsigned short inaOBJ_ERROR = 3;
_WEAK const unsigned short inaOBJ_LINKING = 1;
_WEAK const unsigned short inaOBJ_NOTEXISTING = 0;
_WEAK const unsigned long inaOPTION_DRAM = 6;
_WEAK const unsigned long inaOPTION_FIXRAM = 2;
_WEAK const unsigned long inaOPTION_IMMEDIATE = 16;
_WEAK const unsigned long inaOPTION_MEMCARD = 3;
_WEAK const unsigned long inaOPTION_NO_OPTION = 0;
_WEAK const unsigned long inaOPTION_SYSROM = 4;
_WEAK const unsigned long inaOPTION_USRRAM = 5;
_WEAK const unsigned long inaOPTION_USRROM = 1;
_WEAK const unsigned char inaPV = 1;
_WEAK const unsigned short inaREAD = 1;
_WEAK const unsigned short inaUL = 3;
_WEAK const unsigned short inaWRITE = 2;
_WEAK const unsigned short inaWSTART = 6;
_WEAK const unsigned char inaIO_OUTPUT = 7;
_WEAK const unsigned char inaIO_INPUT = 6;


/* Datatypes */
typedef struct inaInfoIQDrvGlobalStruct
{
	unsigned char IQDrvCntMax;
	unsigned char IQDrvCntAct;
} inaInfoIQDrvGlobalStruct;

typedef struct inaInfoIQDrvStruct
{
	unsigned char ConnCntMax;
	unsigned char ConnCntAct;
} inaInfoIQDrvStruct;

typedef struct inaInfoConnectStruct
{
	unsigned short LinkCntMax;
	unsigned short LinkCntAct;
	unsigned short ConnAbortCnt;
} inaInfoConnectStruct;

typedef struct inaInfoLinkStruct
{
	unsigned char link_type;
	unsigned char no_copy;
	unsigned char no_check;
	unsigned char dummy;
} inaInfoLinkStruct;

typedef struct inaInfoActionStruct
{
	unsigned char l_identcnt;
	unsigned short command;
	unsigned long option;
} inaInfoActionStruct;

typedef struct inaObjRemoteEventPV
{
	unsigned long pEventObj;
	unsigned long hysterese;
	unsigned long idle_tmo;
	unsigned long max_tmo;
} inaObjRemoteEventPV;

typedef struct inaObjLocalEventPV
{
	unsigned long pEventObj;
	unsigned long pPollObj;
} inaObjLocalEventPV;



/* Datatypes of function blocks */
typedef struct INAconnect
{
	/* VAR_INPUT (analogous) */
	unsigned long pPath;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long c_ident;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAconnect_typ;

typedef struct INAdisconn
{
	/* VAR_INPUT (analogous) */
	unsigned long c_ident;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAdisconn_typ;

typedef struct INAlink
{
	/* VAR_INPUT (analogous) */
	unsigned long c_ident;
	unsigned char type;
	unsigned long pObjRemote;
	unsigned long pObjLocal;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long l_ident;
	/* VAR_INPUT (digital) */
	plcbit enable;
	plcbit no_copy;
	plcbit no_check;
} INAlink_typ;

typedef struct INAunlink
{
	/* VAR_INPUT (analogous) */
	unsigned long c_ident;
	unsigned long l_ident;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAunlink_typ;

typedef struct INAaction
{
	/* VAR_INPUT (analogous) */
	unsigned long c_ident;
	unsigned char l_identcnt;
	unsigned long pl_ident;
	unsigned short command;
	unsigned long option;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAaction_typ;

typedef struct INAstate
{
	/* VAR_INPUT (analogous) */
	unsigned long c_ident;
	unsigned long l_ident;
	unsigned char mode;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned short INAstate;
	unsigned short INAerror;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAstate_typ;

typedef struct INAinfo
{
	/* VAR_INPUT (analogous) */
	unsigned long c_ident;
	unsigned long l_ident;
	unsigned char mode;
	unsigned long pInfo;
	unsigned short size;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAinfo_typ;



/* Prototyping of functions and function blocks */
void INAconnect(INAconnect_typ* inst);
void INAdisconn(INAdisconn_typ* inst);
void INAlink(INAlink_typ* inst);
void INAunlink(INAunlink_typ* inst);
void INAaction(INAaction_typ* inst);
void INAstate(INAstate_typ* inst);
void INAinfo(INAinfo_typ* inst);



#endif /* INACLNT_H_ */