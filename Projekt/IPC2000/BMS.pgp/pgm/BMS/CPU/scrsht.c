/****************************************************************************
*   Copyright:  2004  BERNECKER & RAINER Industrie-Elektronik Ges.m.b.H     *
*---------------------------------------------------------------------------*
*   Identification:                                                         *
*       System    any system                                                *
*       Purpose   creating screen shots                                     *
*       Filename  scrsht.c                                                  *
*                                                                           *
*---------------------------------------------------------------------------*
*   Description:                                                            *
*       1. insert library vcscrsht including a-file                         *
*       2. configure device and set DEVICE_DISK_C                           *
*       3. set VC_PANEL_OBJECT_NAME                                         *
*       4. set scrShtFileName (max. 8 char) with .bmp                       *
*       5. trigger cmdScreenShot for screen shot                            *
*                                                                           *
*---------------------------------------------------------------------------*
*   History                                                                 *
*   Version     Date        Autor                                           *
*   01.00       16.02.04    W. Paulin     created                           *
****************************************************************************/

#include <vcscrsht.h>

/* defines */
#define	DEVICE_DISK_C						"DISK_C"		/* specified in sysconf */
#define	VC_PANEL_OBJECT_NAME				"hmi"			/* specifed in software tree */

#define	sWAIT_CMD							00
#define	sDO_SCREEN_SHOT						10
#define	sDEINIT								20

/* variables */
_LOCAL	USINT		cmdScreenShot;
_LOCAL	USINT		scrShtFileName[16];
_LOCAL	UDINT		scrShtHandle;

_LOCAL	UINT		sScrSht;
_LOCAL	UDINT		scrStatus;


_CYCLIC void scrshtcyc()
{
	switch(sScrSht)
	{
		case sWAIT_CMD:
			if (cmdScreenShot)
			{
				/* initialize screen shot */
				scrStatus = InitScreenShot(1, (UDINT)&scrShtHandle, (UDINT)&scrShtFileName[0], (UDINT)DEVICE_DISK_C, (UDINT)VC_PANEL_OBJECT_NAME);
				if (scrStatus == 0)
				{
					sScrSht = sDO_SCREEN_SHOT;
					break;
				}
			}
		break;

		case sDO_SCREEN_SHOT:
			scrStatus = ScreenShot(1, scrShtHandle);
			if (scrStatus != 1001)
			{
				sScrSht = sDEINIT;
				break;
			}
		break;
		
		case sDEINIT:
			scrStatus = DeInitScreenShot(1, scrShtHandle);
			if (scrStatus == 0)
			{
				sScrSht       = sWAIT_CMD;
				cmdScreenShot = 0;
				break;
			}
		break;
	}	/* switch(sScrSht) */
}	/* _CYCLIC void scrshtcyc() */