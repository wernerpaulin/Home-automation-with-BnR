/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BMSLIB_
#define _BMSLIB_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define SEGMENT_WATCHDOG_TIME 45U
#else
 #ifndef _GLOBAL_CONST
  #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned long SEGMENT_WATCHDOG_TIME;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct DatObjUpdate
{
	/* VAR_INPUT (analog) */
	unsigned long pName;
	unsigned long pData;
	unsigned long index;
	unsigned long nbElement;
	unsigned long sizeOfElement;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long ident;
	struct DatObjInfo fDatObjInfo;
	struct DatObjCreate fDatObjCreate;
	struct DatObjWrite fDatObjWrite;
} DatObjUpdate_typ;

typedef struct IrrigValveMgr
{
	/* VAR (analog) */
	unsigned long watchdogTimer;
	/* VAR_INPUT (digital) */
	plcbit newMinute;
	/* VAR_OUTPUT (digital) */
	plcbit pumpRequest;
	/* VAR_IN_OUT (digital) */
	plcbit* switchOnRequest;
	plcbit* valve;
} IrrigValveMgr_typ;

typedef struct Hyst2p
{
	/* VAR_INPUT (analog) */
	float xAct;
	float xSet;
	float pHyst;
	float nHyst;
	/* VAR_OUTPUT (analog) */
	float e;
	/* VAR (analog) */
	float xActOld;
	/* VAR_OUTPUT (digital) */
	plcbit y;
} Hyst2p_typ;

typedef struct GetTrendDatObjName
{
	/* VAR_INPUT (analog) */
	plcstring templateName[11];
	unsigned short year;
	/* VAR_OUTPUT (analog) */
	plcstring datObjName[11];
	/* VAR (analog) */
	plcstring stringDigit[2];
} GetTrendDatObjName_typ;

typedef struct DateOfDay
{
	/* VAR_INPUT (analog) */
	unsigned short year;
	unsigned short dayOfYear;
	/* VAR_OUTPUT (analog) */
	struct DTStructure outDate;
	/* VAR (analog) */
	unsigned char monthIndex;
	unsigned char dayPerMonth[13];
	unsigned short dayOfYearSum;
} DateOfDay_typ;



/* Prototyping of functions and function blocks */
void DatObjUpdate(struct DatObjUpdate* inst);
void IrrigValveMgr(struct IrrigValveMgr* inst);
void Hyst2p(struct Hyst2p* inst);
void GetTrendDatObjName(struct GetTrendDatObjName* inst);
void DateOfDay(struct DateOfDay* inst);
unsigned short DayOfYear(struct DTStructure* inDate);
plcbit IsLeapYear(unsigned short year);


__asm__(".section \".plc\"");

__asm__(".previous");


#endif /* _BMSLIB_ */

