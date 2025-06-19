//#include "stdafx.h"
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <stdio.h>
#define _USE_MATH_DEFINES
#include <math.h>

void f_x(float *a);

int main()
{

	float x1, x2, x3, x4;

	while (1) {
		printf("\n input :: ");
		scanf_s("%f", &x1);

		f_x(&x1);
		printf(" output :: %f \n", x1);
	
	}


	return 0;
}
void f_x(float *a)
	{

		float result;
		if ((fabs(*a) >= 0) && (fabs(*a) <= 1))
			result = (1.5)*pow(double(fabs(double(*a))), 3.0) - (2.5) * pow(double(fabs(double(*a))), 2.0) + 1;
		else if ((fabs(*a) > 1) && (fabs(*a) <= 2))
			result = (-0.5) * pow(double(fabs(double(*a))), 3.0) + (2.5)* pow(double(fabs(double(*a))), 2.0) + (-4)*fabs(double(*a)) + 2;
		else
			result = 0;

		*a = result;



	}
