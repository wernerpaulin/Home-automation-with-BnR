/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef VCTREND_H_
#define VCTREND_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plc.h>



/* Constants */
_WEAK const unsigned short ERR_TR_DENIED = 38709;
_WEAK const unsigned short ERR_TR_INVADDRESS = 38706;
_WEAK const unsigned short ERR_TR_INVCURVECONF = 38704;
_WEAK const unsigned short ERR_TR_INVHANDLE = 38700;
_WEAK const unsigned short ERR_TR_INVVALUE = 38707;
_WEAK const unsigned short ERR_TR_NOTACTIVE = 65535;
_WEAK const unsigned short ERR_TR_TOFEWVALUES = 38703;
_WEAK const unsigned short ERR_TR_UNKNOWN = 38708;
_WEAK const unsigned short TR_ACTION_CURVE_OFFSET = 1000;
_WEAK const unsigned short TR_ACTION_DRAW_VIRTUAL = 7;
_WEAK const unsigned short TR_ACTION_FREEZE = 11;
_WEAK const unsigned short TR_ACTION_GET_CURVE_ID = 3;
_WEAK const unsigned short TR_ACTION_GET_DRAW_HANDLE = 1;
_WEAK const unsigned short TR_ACTION_GET_GRID_HANDLE = 2;
_WEAK const unsigned short TR_ACTION_GET_P_CURVE_COLOR = 9;
_WEAK const unsigned short TR_ACTION_GET_QUEUE_INDEX = 6;
_WEAK const unsigned short TR_ACTION_SET_BUFFER = 10;
_WEAK const unsigned short TR_ACTION_SET_GRID_ENABLE = 0;
_WEAK const unsigned short TR_ACTION_SET_MAX_Y = 5;
_WEAK const unsigned short TR_ACTION_SET_MIN_Y = 4;
_WEAK const unsigned short TR_ACTION_SET_REFRESH = 8;
_WEAK const unsigned short TR_ACTION_SET_ZOOM = 12;


/* Datatypes */
typedef struct tr_cursor_typ
{
	plcbit enable;
	unsigned char res1;
	unsigned short color;
	signed long x;
	signed long y;
} tr_cursor_typ;



/* Datatypes of function blocks */


/* Prototyping of functions and function blocks */
unsigned short TR_init(unsigned long* pTrendId, unsigned short nbValues, unsigned short left, unsigned short top, unsigned short sampleWidth, unsigned short height, unsigned short backColor);
unsigned short TR_addGrid(unsigned long trendId, unsigned short gridX, unsigned short gridY, unsigned short color);
unsigned short TR_addCurve(unsigned long trendId, signed long* pLiveVal, unsigned long* ppData, plcbit* pEnable, signed long minY, signed long maxY, unsigned short color);
unsigned short TR_addChart(unsigned long trendId, unsigned short* pNbPoints, signed long* pData, plcbit* pEnable, signed long minY, signed long maxY, unsigned short color);
unsigned short TR_record(plcbit enable, unsigned long trendId);
unsigned short TR_draw(plcbit enable, unsigned long trendId, unsigned long vcHandle);
unsigned short TR_redraw(plcbit enable, unsigned long trendId, unsigned long vcHandle);
unsigned short TR_reset(plcbit enable, unsigned long trendId);
unsigned short TR_action(unsigned long trendId, unsigned short action, unsigned long value);
unsigned short TR_deinit(unsigned long trendId);
unsigned short TR_setCursorXY(unsigned long curveId, unsigned long pCursorAx, unsigned long pCursorAy, unsigned long pCursorBx, unsigned long pCursorBy, unsigned long pDeltaX, unsigned long pDeltaY);



#endif /* VCTREND_H_ */