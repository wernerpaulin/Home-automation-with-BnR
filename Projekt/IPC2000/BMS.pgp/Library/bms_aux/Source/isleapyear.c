/****************************************************************************
**********         				  isLeapYear()   			        *********
*****************************************************************************
*                                                                           *
*  Description:                                                             *
*     This function determine whether given year is a leap year             *
*                                                                           *
*  Interface:                                                               *
*     Input:                                                                *
*       year            : year to be checked                                *
*                                                                           *
*     Return:                                                               *
*       0	            : year is no leap year                              *
*       1	            : year is a leap year                               *
*                                                                           *
*---------------------------------------------------------------------------*
*   History                                                                 *
*   Version     Date        Autor                                           *
*   01.00       03.05.05    W. Paulin     created 							*
****************************************************************************/

#include <bms_aux_gn.h>

unsigned char isLeapYear(UINT year)
{
	if ( ( ((year % 4) == 0) && ((year % 100) != 0) ) || ((year % 400) == 0)  )
	{
		return(1);
	}
	else
	{
		return(0);
	}    
}