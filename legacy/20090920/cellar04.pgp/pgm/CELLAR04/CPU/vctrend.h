/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef VCTREND_H_
#define VCTREND_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>



/* Constants */
_WEAK const unsigned short ERR_TR_BUSY = 65534;
_WEAK const unsigned short ERR_TR_DENIED = 38709;
_WEAK const unsigned short ERR_TR_INVADDRESS = 38706;
_WEAK const unsigned short ERR_TR_INVCURVECONF = 38704;
_WEAK const unsigned short ERR_TR_INVHANDLE = 38700;
_WEAK const unsigned short ERR_TR_INVVALUE = 38707;
_WEAK const unsigned short ERR_TR_NOTACTIVE = 65535;
_WEAK const unsigned short ERR_TR_TOFEWVALUES = 38703;
_WEAK const unsigned short ERR_TR_UNKNOWN = 38708;
_WEAK const unsigned short TR_ACTION_DRAW_VIRTUAL = 7;
_WEAK const unsigned short TR_ACTION_FREEZE = 11;
_WEAK const unsigned short TR_ACTION_GET_CURVE_ID = 3;
_WEAK const unsigned short TR_ACTION_GET_CURVE_LABEL_BUF_X = 21;
_WEAK const unsigned short TR_ACTION_GET_DRAW_HANDLE = 1;
_WEAK const unsigned short TR_ACTION_GET_GRID_HANDLE = 2;
_WEAK const unsigned short TR_ACTION_GET_LABEL_BUFFER_X = 15;
_WEAK const unsigned short TR_ACTION_GET_P_CURVE_COLOR = 9;
_WEAK const unsigned short TR_ACTION_GET_QUEUE_INDEX = 6;
_WEAK const unsigned short TR_ACTION_SET_BUFFER = 10;
_WEAK const unsigned short TR_ACTION_SET_DATA_SOURCE = 22;
_WEAK const unsigned short TR_ACTION_SET_GRID_ENABLE = 0;
_WEAK const unsigned short TR_ACTION_SET_GRID_OFFSET = 20;
_WEAK const unsigned short TR_ACTION_SET_LABEL_CURVE = 16;
_WEAK const unsigned short TR_ACTION_SET_LIVE_DATA_TYPE = 13;
_WEAK const unsigned short TR_ACTION_SET_LIVE_SOURCE = 14;
_WEAK const unsigned short TR_ACTION_SET_MAX_Y = 5;
_WEAK const unsigned short TR_ACTION_SET_MIN_Y = 4;
_WEAK const unsigned short TR_ACTION_SET_REFRESH = 8;
_WEAK const unsigned short TR_ACTION_SET_ZOOM = 12;
_WEAK const unsigned short TR_ACTION_SET_ZOOM_CURSOR_X = 18;
_WEAK const unsigned short TR_ACTION_SET_ZOOM_CURSOR_Y = 19;
_WEAK const unsigned short TR_ACTION_SET_ZOOM_DISPLAY_MODE = 17;


/* Datatypes */
typedef struct tr_cursor_typ
{
	plcbit enable;
	unsigned char sizeEyeCatcher;
	unsigned short color;
	signed long x;
	signed long y;
} tr_cursor_typ;

typedef struct tr_axisText_typ
{
	unsigned short fontIndex;
	unsigned char width;
	unsigned char height;
	unsigned short foreColor;
	unsigned short backColor;
} tr_axisText_typ;

typedef struct tr_axisLabel_typ
{
	unsigned char margin;
	unsigned char leadingZero;
	unsigned char nbDecimalPlaces;
	unsigned char seperator;
	unsigned short prescaler;
	unsigned char nbChar;
	unsigned char res0;
	unsigned long pValue;
	unsigned long pEnable;
} tr_axisLabel_typ;



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
unsigned short TR_addLabel(unsigned long trendId, unsigned long curveId, unsigned long vcHandle, unsigned long pTextCfg, unsigned long pLabelCfgX, unsigned long pLabelCfgY, unsigned short waitCycle);



#endif /* VCTREND_H_ */