/****************************************************************************
*                                                                           *
*  Name     : canio.h                                                       *
*  Titel    : DEFINES for the libcanio.a Library                            *
*  Version  : V1.20.3                                                       *
*  Datum    : 15.05.2003                                                    *
*                                                                           *
******************************COPYRIGHT (C)**********************************
*     THIS SOFTWARE IS THE PROPERTY OF B&R AUSTRIA: ALL RIGHTS RESERVED.    *
*     NO PART OF THIS SOFTWARE MAY BE USED OR COPIED IN ANY WAY WITHOUT     *
*              THE PRIOR WRITTEN PERMISSION OF B&R AUSTRIA.                 *
*****************************************************************************
*                                                                           *
*  Project  : CANIO-MASTER                                                  *
*                                                                           *
****************************************************************************/


#ifndef     CANIO_H

#define     CANIO_H

#include 	<bur/plctypes.h>

/* Parameter for CANIOcmd() */
typedef struct CANIOcmd
{
	/* not boolean input */
        USINT   busnr;              /* 1 */
		USINT   nodenr;             /* 1 */
		UDINT   cmd;                /* 4 */
		UDINT   res;                /* 4 */
    /* not boolean output */
		UINT    status;             /* 2 */
    /* not boolean static */
		UDINT   initcnt;            /* 4 */
		UDINT   fcb_ptr;            /* 4 */
		UDINT   fcb_cnt;            /* 4 */
		UDINT   tiotick;            /* 4 */
		UDINT   node_ptr;           /* 4 */
		USINT   local_flag;         /* 1 */
		USINT   first_flag;         /* 1 */
		USINT   state;              /* 1 */
		USINT   pp_ix;              /* 1 */
    /* boolean input */
        BOOL    enable;
    /* boolean output */
    /* boolean static */
		
} CANIOcmd_typ;
	
/* Parameter for CANIOexc() */
typedef struct CANIOexc
{
    /* not boolean input */
	/* not boolean output */
    	UINT    status;             /* 2 */
		USINT   exctyp;             /* 1 */
		USINT   busnr;              /* 1 */
		USINT   nodenr;             /* 1 */
                                    /* 1 align! */
		UINT    errcode;            /* 2 */
		UINT    addcode;            /* 2 */
	/* not boolean static */
		UDINT   initcnt;            /* 4 */
		USINT   first_flag;         /* 1 */
		USINT   state;              /* 1 */
	/* boolean input */
    	BOOL    enable;              
    /* boolean output */
    /* boolean static */
} CANIOexc_typ;


/* Prototypes */
void CANIOcmd(CANIOcmd_typ* cmd);
void CANIOexc(CANIOexc_typ* exc);

#endif /* CANIO_H */
