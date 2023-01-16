/****************************************************************************
**********         				getChartValueY()  	 		        *********
*****************************************************************************
*                                                                           *
*  Description:                                                             *
*     Evaluates a value corresponding to a given value corresponding to a   *
*     given chart.                                                          *
*     Between to known values will be interpolated lineary.                 *
*     Outside the table will be extrapolated lineary according to last      *
*     known values                                                          *
*                                                                           *
*  Interface:                                                               *
*     Input:                                                                *
*       x        : given value in X direction                       		*
*       pData    : pointer to chart table                           		*
*       nbPoints : number of entries                                		*
*                                                                           *
*     Output:                                                               *
*       y-value                                                             *
*                                                                           *
*---------------------------------------------------------------------------*
*   History                                                                 *
*   Version     Date        Autor                                           *
*   01.00       01.05.05    W. Paulin     created 							*
****************************************************************************/

#include <bms_aux_gn.h>

/* prototyping */
REAL calcK(REAL x1, REAL y1, REAL x2, REAL y2);
REAL calcD(REAL x1, REAL y1, REAL x2, REAL y2);
REAL calcY(REAL x,  REAL k,  REAL d);


float getChartValueY(float x, xyPointREAL_typ* pData, unsigned long nbPoints)
{
	UDINT pointIndex = 0;
	REAL  k          = 0;
	REAL  d          = 0;
	
	/* chart must contain at least two values */ 
	if (nbPoints < 2) return(0);								

	/* nill pointer */
	if (pData == 0) return(0);
	 
	if (x < pData[0].x)																								/* 1. x is out of lower range of chart */
	{
		/* get characteristic of chart according to the very first to values */
		k = calcK(pData[0].x, pData[0].y, pData[1].x, pData[1].y);
		d = calcD(pData[0].x, pData[0].y, pData[1].x, pData[1].y);
	}
	else if (x > pData[nbPoints - 2].x) 																			/* 2. inValue is out of higher range of chart */
	{
		/* get characteristic of chart according to the very last to values */
		k = calcK(pData[nbPoints - 2].x, pData[nbPoints - 2].y, pData[nbPoints - 1].x, pData[nbPoints - 1].y);
		d = calcD(pData[nbPoints - 2].x, pData[nbPoints - 2].y, pData[nbPoints - 1].x, pData[nbPoints - 1].y);
	}
	else																											/* 3. inValue is within chart */
	{
		/* find pairs of coordinats in which desired x will be find */
		for (pointIndex = 0; pointIndex < nbPoints - 2; pointIndex++)
		{
			if ( (x >= pData[pointIndex].x) && (x <= pData[pointIndex+1].x) )
			{
				/* get characteristic of chart according to surrounding x/y pairs */
				k = calcK(pData[pointIndex].x, pData[pointIndex].y, pData[pointIndex + 1].x, pData[pointIndex + 1].y);
				d = calcD(pData[pointIndex].x, pData[pointIndex].y, pData[pointIndex + 1].x, pData[pointIndex + 1].y);
				break;
			}
		} /* for (pointIndex = 0; pointIndex < nbPoints - 2; pointIndex++) */
	} /* if (x < pData[0].x) */
	  
	return( calcY(x, k, d) ); 							/* calculate y and say good bye... */
}



/* gets k of linear equation: y = k*x + d */
REAL calcK(REAL x1, REAL y1, REAL x2, REAL y2)
{
	if (x1 == x2) return(0);
	return( (y1 - y2) / (x1 - x2) );
}

/* gets d of linear equation: y = k*x + d */
REAL calcD(REAL x1, REAL y1, REAL x2, REAL y2)
{
	if (x1 == x2) return(0);
	return( ((y2*x1) - (y1*x2)) / (x1 - x2) );
}

/* gets y of linear equation: y = k*x + d */
REAL calcY(REAL x, REAL k, REAL d)
{
	return( k*x + d );
}