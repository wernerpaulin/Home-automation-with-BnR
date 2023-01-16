/****************************************************************************
**********         				dateOfYearDay()   			        *********
*****************************************************************************
*                                                                           *
*  Description:                                                             *
*     This function determine the day and month of a year's day             *
*                                                                           *
*  Interface:                                                               *
*     Input:                                                                *
*       year            : current year                                      *
*       dayOfYear       : day with in year                                  *
*                                                                           *
*     Return:                                                               *
*       month           : month of year's day                               *
*       day             : day with in month                                 *
*                                                                           *
*---------------------------------------------------------------------------*
*   History                                                                 *
*   Version     Date        Autor                                           *
*   01.00       03.05.05    W. Paulin     created 							*
****************************************************************************/

#include <bms_aux_gn.h>

void dateOfYearDay(dateOfYearDay_typ* fDateOfYearDay)
{
	UINT 		monthIndex     = 0;
	USINT 		dayPerMonth[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};		/* number days per month - without leap year - starting at index #1 */
	UINT		dayOfYear = 0;
	

	/* plausibility */
	if ( (fDateOfYearDay->dayOfYear == 0) || (fDateOfYearDay->dayOfYear > 366) ) 
	{
		fDateOfYearDay->month = 1;
		fDateOfYearDay->day   = 1;
		return;
	}

	/* adjust february in case of leap year */
	if ( isLeapYear(fDateOfYearDay->year) ) dayPerMonth[2] = 29;

	/* find month of this year's day */
	for (monthIndex = 1; (monthIndex <= 12) && (dayOfYear < fDateOfYearDay->dayOfYear); monthIndex++) 
	{
		dayOfYear += dayPerMonth[monthIndex];
	}

	fDateOfYearDay->month = monthIndex - 1;
	
	dayOfYear -= dayPerMonth[fDateOfYearDay->month];	/* get day count of end of last month */
	fDateOfYearDay->day = fDateOfYearDay->dayOfYear - dayOfYear;
	
	return;   
}