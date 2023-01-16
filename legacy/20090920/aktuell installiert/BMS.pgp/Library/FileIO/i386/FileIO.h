/* Automation Studio Generated Header File, Format Version 1.00 */
/* do not change */
#ifndef FILEIO_H_
#define FILEIO_H_
#define _WEAK	__attribute__((__weak__))

#include <bur/plctypes.h>



/* Constants */
_WEAK const unsigned char FILE_ALL = 2;
_WEAK const unsigned char FILE_DETMEM = 1;
_WEAK const unsigned char FILE_DIR = 1;
_WEAK const unsigned char FILE_FILE = 0;
_WEAK const unsigned char FILE_ONCE = 0;
_WEAK const unsigned char FILE_OW_DETMEM = 2;
_WEAK const unsigned char FILE_OW_ONCE = 3;
_WEAK const unsigned char FILE_R = 0;
_WEAK const unsigned char FILE_RW = 2;
_WEAK const unsigned char FILE_W = 1;
_WEAK const unsigned short fiERR_ACCESS = 20706;
_WEAK const unsigned short fiERR_ASYNC_MANAGER = 20720;
_WEAK const unsigned short fiERR_COM_FILE_CLOSE = 20715;
_WEAK const unsigned short fiERR_COM_FILE_IOCTL = 20718;
_WEAK const unsigned short fiERR_COM_FILE_OPEN = 20714;
_WEAK const unsigned short fiERR_COM_FILE_READ = 20716;
_WEAK const unsigned short fiERR_COM_FILE_WRITE = 20717;
_WEAK const unsigned short fiERR_DATA = 20719;
_WEAK const unsigned short fiERR_DATA_SIZE = 20701;
_WEAK const unsigned short fiERR_DETMEMINFO = 20726;
_WEAK const unsigned short fiERR_DEVICE_DRIVER = 20797;
_WEAK const unsigned short fiERR_DEVICE_MANAGER = 20798;
_WEAK const unsigned short fiERR_DIR_ALREADY_EXIST = 20725;
_WEAK const unsigned short fiERR_DIR_NOT_EMPTY = 20724;
_WEAK const unsigned short fiERR_DIR_NOT_EXIST = 20723;
_WEAK const unsigned short fiERR_EXIST = 20705;
_WEAK const unsigned short fiERR_FILE = 20712;
_WEAK const unsigned short fiERR_FILE_DEVICE = 20709;
_WEAK const unsigned short fiERR_FILE_NOT_FOUND = 20708;
_WEAK const unsigned short fiERR_FILE_NOT_OPENED = 20721;
_WEAK const unsigned short fiERR_INVALID_DIRECTORY = 20722;
_WEAK const unsigned short fiERR_INVALID_PATH = 20700;
_WEAK const unsigned short fiERR_INVALID_TYP = 20704;
_WEAK const unsigned short fiERR_LESS_VIRTUAL_MEMORY = 20713;
_WEAK const unsigned short fiERR_MODE = 20707;
_WEAK const unsigned short fiERR_NOT_ENOUGH_FREEMEM = 20727;
_WEAK const unsigned short fiERR_NOT_SUPPORTED = 20703;
_WEAK const unsigned short fiERR_NO_MORE_ENTRIES = 20702;
_WEAK const unsigned short fiERR_SEEK = 20711;
_WEAK const unsigned short fiERR_SPACE = 20710;
_WEAK const unsigned short fiERR_SYSTEM = 20799;


/* Datatypes */
typedef struct fiLOCAL_OBJ
{
	unsigned short StateMan;
	unsigned short ErrMan;
	unsigned long Init;
} fiLOCAL_OBJ;

typedef struct fiDIR_READ_DATA
{
	unsigned char Filename[260];
	DATE_AND_TIME Date;
	unsigned long Filelength;
} fiDIR_READ_DATA;



/* Datatypes of function blocks */
typedef struct FileCopy
{
	/* VAR_INPUT (analogous) */
	unsigned long pSrcDev;
	unsigned long pSrc;
	unsigned long pDestDev;
	unsigned long pDest;
	unsigned char option;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileCopy_typ;

typedef struct DirRead
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pPath;
	unsigned long entry;
	unsigned char option;
	unsigned long pData;
	unsigned long data_len;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} DirRead_typ;

typedef struct DirInfo
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pPath;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long dirnum;
	unsigned long filenum;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} DirInfo_typ;

typedef struct FileDelete
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pName;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileDelete_typ;

typedef struct FileWrite
{
	/* VAR_INPUT (analogous) */
	unsigned long ident;
	unsigned long offset;
	unsigned long pSrc;
	unsigned long len;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileWrite_typ;

typedef struct FileRead
{
	/* VAR_INPUT (analogous) */
	unsigned long ident;
	unsigned long offset;
	unsigned long pDest;
	unsigned long len;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileRead_typ;

typedef struct FileClose
{
	/* VAR_INPUT (analogous) */
	unsigned long ident;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileClose_typ;

typedef struct FileOpen
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pFile;
	unsigned char mode;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long ident;
	unsigned long filelen;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileOpen_typ;

typedef struct FileCreate
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pFile;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long ident;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} FileCreate_typ;

typedef struct DirCreate
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pName;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} DirCreate_typ;

typedef struct DirDelete
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	unsigned long pName;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} DirDelete_typ;

typedef struct DevMemInfo
{
	/* VAR_INPUT (analogous) */
	unsigned long pDevice;
	/* VAR_OUTPUT (analogous) */
	unsigned short status;
	unsigned long freemem;
	unsigned long memsize;
	/* VAR (analogous) */
	struct fiLOCAL_OBJ Obj;
	/* VAR_INPUT (digital) */
	plcbit enable;
} DevMemInfo_typ;



/* Prototyping of functions and function blocks */
unsigned short FileIoGetSysError();
void FileCopy(FileCopy_typ* inst);
void DirRead(DirRead_typ* inst);
void DirInfo(DirInfo_typ* inst);
void FileDelete(FileDelete_typ* inst);
void FileWrite(FileWrite_typ* inst);
void FileRead(FileRead_typ* inst);
void FileClose(FileClose_typ* inst);
void FileOpen(FileOpen_typ* inst);
void FileCreate(FileCreate_typ* inst);
void DirCreate(DirCreate_typ* inst);
void DirDelete(DirDelete_typ* inst);
void DevMemInfo(DevMemInfo_typ* inst);



#endif /* FILEIO_H_ */