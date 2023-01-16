/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef BMS_AUX_H_
#define BMS_AUX_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>

#include <DataObj.h>


/* Constants */
_WEAK const unsigned short AUX_ERR_FUB_BUSY = 65535;
_WEAK const unsigned short AUX_ERR_OK = 0;


/* Datatypes */
typedef struct xyPointREAL_typ
{
	float x;
	float y;
} xyPointREAL_typ;

typedef struct xyPointDINT_typ
{
	signed long x;
	signed long y;
} xyPointDINT_typ;



/* Datatypes of function blocks */
typedef struct DatObjUpdate
{
	/* VAR_INPUT (analogous) */
	unsigned long pName;
	unsigned long pData;
	unsigned long index;
	unsigned long nbElement;
	unsigned long sizeOfElement;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct DatObjInfo fDatObjInfo;
	struct DatObjCreate fDatObjCreate;
	struct DatObjWrite fDatObjWrite;
} DatObjUpdate_typ;

typedef struct hyst2p
{
	/* VAR_INPUT (analogous) */
	float xAct;
	float xSet;
	float pHyst;
	float nHyst;
	/* VAR_OUTPUT (analogous) */
	unsigned char y;
	/* VAR (analogous) */
	float xActOld;
} hyst2p_typ;

typedef struct dateOfYearDay
{
	/* VAR_INPUT (analogous) */
	unsigned short year;
	unsigned short dayOfYear;
	/* VAR_OUTPUT (analogous) */
	unsigned char month;
	unsigned char day;
} dateOfYearDay_typ;



/* Prototyping of functions and function blocks */
void DatObjUpdate(DatObjUpdate_typ* inst);
float getChartValueY(float x, xyPointREAL_typ* pData, unsigned long nbPoints);
void hyst2p(hyst2p_typ* inst);
unsigned short dayOfYear(DTStructure* pDTStructure);
unsigned char isLeapYear(unsigned short year);
void dateOfYearDay(dateOfYearDay_typ* inst);



#endif /* BMS_AUX_H_ */