/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef VSCREEN_H_
#define VSCREEN_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plc.h>



/* Constants */
_WEAK const unsigned short ERR_VS_DIMENSIONS = 38604;
_WEAK const unsigned short ERR_VS_INVALID_HANDLE = 38603;
_WEAK const unsigned short ERR_VS_LENERROR = 38611;
_WEAK const unsigned short ERR_VS_MODEERROR = 38610;
_WEAK const unsigned short ERR_VS_NOERROR = 0;
_WEAK const unsigned short ERR_VS_ONLY_I386 = 38600;
_WEAK const unsigned short ERR_VS_SCREEN_SIZE = 38602;
_WEAK const unsigned short ERR_VS_WRONG_HW = 38601;
_WEAK const unsigned short VS_INFO_BACKCOLOR = 3;
_WEAK const unsigned short VS_INFO_HEIGHT = 2;
_WEAK const unsigned short VS_INFO_PDATA = 0;
_WEAK const unsigned short VS_INFO_WIDTH = 1;


/* Datatypes */


/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned char vsGetPixel(unsigned long hScreen, unsigned short x, unsigned short y);
unsigned short vsPutPixel(unsigned long hScreen, unsigned short x, unsigned short y, unsigned char color);
unsigned short vsScan(unsigned long hScreen, unsigned long vcHandle, unsigned short x, unsigned short y);
unsigned short vsPaint(unsigned long hScreen, unsigned long vcHandle, unsigned short x, unsigned short y);
unsigned short vsSetBackColor(unsigned long hScreen, unsigned char color);
unsigned short vsRotate(unsigned long hScreenSrc, unsigned long hScreenDst, float angle);
unsigned short vsCombine(unsigned long hScreenBack, unsigned long hScreenObj);
unsigned short vsLine(unsigned long hScreen, signed short x1, signed short y1, signed short x2, signed short y2, unsigned char color);
unsigned short vsCopy(unsigned long hScreenSrc, unsigned short xSrc, unsigned short ySrc, unsigned short width, unsigned short height, unsigned long hScreenDst, unsigned short xDst, unsigned short yDst);
unsigned short vsCopys(unsigned long hScreenSrc, unsigned long hScreenDst);
unsigned short vsGetBmp(unsigned long vcHandle, unsigned char mode, unsigned char* startAdr, unsigned long len);
unsigned short vsInfo(unsigned long hScreen, unsigned short parId, unsigned long* pData);
unsigned short vsLineV(unsigned long hScreen, signed short x, signed short y, unsigned short len, unsigned char color);
unsigned short vsLineH(unsigned long hScreen, signed short x, signed short y, unsigned short len, unsigned char color);
unsigned short vsClear(unsigned long hScreen);
unsigned short vsDelete(unsigned long hScreen);
unsigned short vsCreate(unsigned short width, unsigned short height, unsigned long* phScreen);



#endif /* VSCREEN_H_ */