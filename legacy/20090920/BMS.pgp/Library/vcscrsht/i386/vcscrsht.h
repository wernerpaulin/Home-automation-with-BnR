/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef VCSCRSHT_H_
#define VCSCRSHT_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>



/* Constants */


/* Datatypes */


/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned long ScreenShot(plcbit bEnable, unsigned long pHandle);
unsigned long DeInitScreenShot(plcbit bEnable, unsigned long pHandle);
unsigned long InitScreenShot(plcbit bEnable, unsigned long pHandle, unsigned long pFileName, unsigned long pDeviceName, unsigned long pDisplName);



#endif /* VCSCRSHT_H_ */