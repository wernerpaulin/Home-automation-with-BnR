/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef COMMSERV_H_
#define COMMSERV_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plc.h>



/* Constants */


/* Datatypes */


/* Datatypes of function blocks */
typedef struct INADevClose
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	unsigned char state;
	unsigned short internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INADevClose_typ;

typedef struct INADevOpen
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	unsigned char state;
	unsigned short internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INADevOpen_typ;

typedef struct INAdelete
{
	/* VAR_INPUT (analogous) */
	unsigned long ident;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAdelete_typ;

typedef struct INAcreate
{
	/* VAR_INPUT (analogous) */
	unsigned long pName;
	unsigned long size;
	unsigned long count;
	unsigned char mode;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long ident;
	/* VAR_INPUT (digital) */
	plcbit enable;
} INAcreate_typ;



/* Prototyping of functions and function blocks */
void INADevClose(INADevClose_typ* inst);
void INADevOpen(INADevOpen_typ* inst);
void INAdelete(INAdelete_typ* inst);
void INAcreate(INAcreate_typ* inst);



#endif /* COMMSERV_H_ */