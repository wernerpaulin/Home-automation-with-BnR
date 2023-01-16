/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _VISAPI_
#define _VISAPI_

#include <bur/plctypes.h>

#ifndef _IEC_CONST
#define _IEC_CONST _WEAK const
#endif

/* Datatypes and datatypes of function blocks */
typedef struct display_info
{
	unsigned short width;
	unsigned short height;
	unsigned long func1;
	unsigned long func2;
	unsigned char bpp;
} display_info;

typedef struct VCHANDLE
{
} VCHANDLE;

typedef struct TouchAction
{
	unsigned long status;
	unsigned long y;
	unsigned long x;
} TouchAction;

typedef struct sVCBitmap
{
	unsigned long vpInternalData;
	unsigned long vpData;
	signed long iBPP;
	signed long iHeight;
	signed long iWidth;
} sVCBitmap;



/* Prototyping of functions and function blocks */
unsigned short VA_Attach(plcbit enable, unsigned long VCHandle, unsigned long uiType, unsigned long uiPara);
unsigned short VA_BlitBitmap(plcbit enable, unsigned long VCHandle, unsigned long pBitmap, signed long iDestX, signed long iDestY, signed long iClipX1, signed long iClipY1, signed long iClipX2, signed long iClipY2, unsigned long uiFlags);
unsigned short VA_Configure(plcbit enable, plcstring* ucProjectName, unsigned long uiOption, unsigned long uiValue);
unsigned short VA_CopyScreenRect(plcbit enable, unsigned long VCHandle, unsigned short x1, unsigned short y1, unsigned short x2, unsigned short y2, signed short dx, signed short dy);
unsigned short VA_DelAlarmHistory(plcbit enable, unsigned long VCHandle);
unsigned short VA_Detach(plcbit enable, unsigned long VCHandle);
unsigned short VA_DrawBitmap(plcbit enable, unsigned long VCHandle, unsigned short index, unsigned short x, unsigned short y);
unsigned short VA_Ellipse(plcbit enable, unsigned long VCHandle, unsigned short x, unsigned short y, unsigned short heigth, unsigned short width, unsigned short fill, unsigned short color);
unsigned short VA_ExchangeFont(plcbit enable, unsigned long VCHandle, unsigned char cIndex, unsigned char cNewIndex);
unsigned short VA_ExtractKeyMatrix(plcbit enable, unsigned long VCHandle, unsigned long pKeyMatrix, unsigned long uiKeysToRead, unsigned long puiKeyRead, unsigned long uiTimeoutInMsec, unsigned long puiAgeInMsec);
unsigned short VA_FreeBitmap(plcbit enable, unsigned long VCHandle, unsigned long pBitmap);
unsigned short VA_GetActAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned char cSeperator, unsigned char cDateTimeFormat);
unsigned short VA_GetAlCurPos(plcbit enable, unsigned long VCHandle, signed long pGroupNumber, signed long pAlarmNumber);
unsigned short VA_GetAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction);
unsigned short VA_GetBrightness(plcbit enable, unsigned long VCHandle, unsigned long pValue);
unsigned short VA_GetCalStatus(plcbit enable, unsigned long VCHandle);
unsigned short VA_GetContrast(plcbit enable, unsigned long VCHandle);
unsigned short VA_GetDisplayInfo(plcbit enable, unsigned long VCHandle, unsigned long InfoType, unsigned long pValue);
unsigned short VA_GetExAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned char cSeperator, unsigned char cDateTimeFormat);
unsigned short VA_GetKeyMatrix(plcbit enable, unsigned long VCHandle, unsigned long pKeyMatrix, unsigned long KeysToRead, unsigned long pKeysRead);
unsigned long VA_GetPaletteColor(plcbit enable, unsigned long VCHandle, unsigned char uiIndex);
unsigned short VA_GetPanelStatus(plcbit enable, unsigned long VCHandle, unsigned long puiPanelStatus);
unsigned short VA_GetTextByTextGroup(plcbit enable, unsigned long VCHandle, unsigned long TG_id, unsigned short TGT_id, unsigned long pcText, unsigned long psTextlength);
unsigned short VA_GetTouchAction(plcbit enable, unsigned long VCHandle, unsigned long uiType, unsigned long pStatus);
unsigned short VA_LangIsAvailable(plcbit enable, unsigned long VCHandle, unsigned long uiIndex, unsigned long pucIsInstalled);
unsigned short VA_Line(plcbit enable, unsigned long VCHandle, unsigned short x1, unsigned short y1, unsigned short x2, unsigned short y2, unsigned short color);
unsigned short VA_LoadBitmap(plcbit enable, unsigned long VCHandle, plcstring* ucDevice, plcstring* ucPath, unsigned long ppBitmap);
unsigned short VA_NGetAlCurPos(plcbit enable, unsigned long VCHandle, signed long pGroupNumber, signed long pAlarmNumber);
unsigned short VA_NGetCalStatus(plcbit enable, unsigned long VCHandle, unsigned long pValue);
unsigned short VA_NGetContrast(plcbit enable, unsigned long VCHandle, unsigned long pValue);
unsigned long VA_NGetPaletteColor(plcbit enable, unsigned long VCHandle, unsigned char uiIndex, unsigned long pValue);
unsigned short VA_Quit(plcbit enable, unsigned long VCHandle, unsigned short usGroupNumber, unsigned short usAlarmNumber);
unsigned short VA_QuitAlarms(plcbit enable, unsigned long VCHandle, unsigned short wGroupNumber);
unsigned short VA_Rect(plcbit enable, unsigned long VCHandle, unsigned short x1, unsigned short y1, unsigned short width, unsigned short height, unsigned short fill, unsigned short color);
unsigned short VA_Redraw(plcbit enable, unsigned long VCHandle);
unsigned short VA_Saccess(plcbit enable, unsigned long VCHandle);
unsigned short VA_SaveSettings(plcbit enable, unsigned long VCHandle, unsigned short uiAction);
unsigned short VA_SetBacklight(plcbit enable, unsigned long VCHandle, plcbit bSet);
unsigned short VA_SetBrightness(plcbit enable, unsigned long VCHandle, unsigned long uiPercent);
unsigned short VA_SetClipRegion(plcbit enable, unsigned long VCHandle, unsigned long uiX1, unsigned long uiY1, unsigned long uiX2, unsigned long uiY2);
unsigned short VA_SetContrast(plcbit enable, unsigned long VCHandle, unsigned long uiPercent);
unsigned short VA_SetPaletteColor(plcbit enable, unsigned long VCHandle, unsigned char index, unsigned long color);
unsigned short VA_SetUserParam(plcbit enable, unsigned long VCHandle, unsigned char Type, unsigned long pParameter);
unsigned long VA_Setup(plcbit enable, plcstring* pProjectName);
unsigned short VA_SetupX(plcbit enable, unsigned long VCHandle, plcstring* pProjectName);
unsigned short VA_Shutdown(plcbit enable, unsigned long VCHandle);
unsigned short VA_Srelease(plcbit enable, unsigned long VCHandle);
unsigned short VA_StartProject(plcbit enable, unsigned long VCHandle);
unsigned short VA_StartVisuByName(plcbit enable, plcstring* pProjectName);
unsigned short VA_StartTouchCal(plcbit enable, unsigned long VCHandle);
unsigned short VA_StopProject(plcbit enable, unsigned long VCHandle);
unsigned short VA_Textout(plcbit enable, unsigned long VCHandle, unsigned short font_index, unsigned short x, unsigned short y, unsigned char fC, unsigned char bC, plcstring* pText);
unsigned short VA_TimeSynchronize(plcbit enable, unsigned long VC_Handle);
unsigned short VA_wcAlarmGetList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction);
unsigned short VA_wcGetActAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned short usSeperator, unsigned char cDateTimeFormat);
unsigned short VA_wcGetExAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned short usSeperator, unsigned char cDateTimeFormat);
unsigned short VA_wcGetTextByTextGroup(plcbit enable, unsigned long VCHandle, unsigned long TG_id, unsigned short TGT_id, unsigned long pwText, unsigned long psTextLength);
unsigned short VA_wcTextout(plcbit enable, unsigned long VCHandle, unsigned short font_index, unsigned short x, unsigned short y, unsigned char fC, unsigned char bC, unsigned long pwText);
unsigned short VA_GetActualLang();
unsigned short VA_ClearTouchEventBuffer();
unsigned short VA_RegisterClient();



#endif /* _VISAPI_ */

