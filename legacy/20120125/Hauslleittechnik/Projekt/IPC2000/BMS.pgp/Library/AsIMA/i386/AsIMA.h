/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef ASIMA_H_
#define ASIMA_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>



/* Constants */
_WEAK const unsigned short ERR_IMA_DATA_INCOMPLETE = 28907;
_WEAK const unsigned short ERR_IMA_DATOBJ_NAME = 28901;
_WEAK const unsigned short ERR_IMA_IDENT = 28900;
_WEAK const unsigned short ERR_IMA_INFOSTRUCT = 28902;
_WEAK const unsigned short ERR_IMA_INTERN = 28917;
_WEAK const unsigned short ERR_IMA_KEYWORD = 28904;
_WEAK const unsigned short ERR_IMA_NAME = 28905;
_WEAK const unsigned short ERR_IMA_NR_BRMOD = 28911;
_WEAK const unsigned short ERR_IMA_NR_CONNECTIONS = 28908;
_WEAK const unsigned short ERR_IMA_NR_PV = 28909;
_WEAK const unsigned short ERR_IMA_NR_PV_LIST = 28910;
_WEAK const unsigned short ERR_IMA_PV_ADR = 28912;
_WEAK const unsigned short ERR_IMA_PV_LEN = 28913;
_WEAK const unsigned short ERR_IMA_SYNTAX = 28903;
_WEAK const unsigned short ERR_IMA_TASK_CYCLE = 28914;
_WEAK const unsigned short ERR_IMA_TMP_ALLOC = 28915;
_WEAK const unsigned short ERR_IMA_TMP_FREE = 28916;
_WEAK const unsigned short ERR_IMA_VALUE = 28906;
_WEAK const unsigned short IMA_CONNECTING = 2;
_WEAK const unsigned short IMA_DISCONNECTING = 3;
_WEAK const unsigned short IMA_ERROR = 4;
_WEAK const unsigned short IMA_IDLE = 1;
_WEAK const unsigned short IMA_OK = 0;


/* Datatypes */
typedef struct imaInfoStruct
{
	unsigned short connectionStatus;
	unsigned short commandClearError;
	unsigned short errorNr;
	unsigned short errorSectionRowNr;
	plcstring errorSectionName[80+1];
	plcstring errorString[80+1];
} imaInfoStruct;



/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned short IMAinit(unsigned long pDatObjName, imaInfoStruct* errorInfo, unsigned long* ident);
unsigned short IMAclose(unsigned long ident);
unsigned short IMAcomm(unsigned long ident, imaInfoStruct* connInfoPV, imaInfoStruct* connInfoAUX);



#endif /* ASIMA_H_ */