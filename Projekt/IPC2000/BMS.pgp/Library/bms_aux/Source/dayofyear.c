/****************************************************************************
**********         				   dayOfYear()   			        *********
*****************************************************************************
*                                                                           *
*  Description:                                                             *
*     This function determine the day of this year                          *
*                                                                           *
*  Interface:                                                               *
*     Input:                                                                *
*       pDate           : pointer to date as DTStructure                    *
*                                                                           *
*     Return:                                                               *
*        	            : day of year (1-366)                               *
*                                                                           *
*---------------------------------------------------------------------------*
*   History                                                                 *
*   Version     Date        Autor                                           *
*   01.00       03.05.05    W. Paulin     created 							*
****************************************************************************/

#include <bms_aux_gn.h>

unsigned short dayOfYear(DTStructure* pDTStructure)
{
	UINT monthIndex     = 0;
	USINT dayPerMonth[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		/* number days per month - without leap year - starting at index #1 */
	UINT dayOfYear      = 0;

	/* plausibility */
	if ( (pDTStructure->month == 0) || (pDTStructure->month > 12) || (pDTStructure->day == 0) || (pDTStructure->day > 31) ) return(1);
 
	/* count all days before this month */
	for (monthIndex = 1; monthIndex < pDTStructure->month; monthIndex++) dayOfYear += dayPerMonth[monthIndex];
   
	/* add days of this month */    
	dayOfYear += pDTStructure->day;
 
	/* if year is a leap year and february has been already passed -> add one day because of 29th of feb. */
	if ( (isLeapYear(pDTStructure->year)) && (pDTStructure->month > 2) ) dayOfYear++;

	return(dayOfYear);   
}