//#include "stdafx.h"
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <stdio.h>
#define _USE_MATH_DEFINES
#include <math.h>

void f_x(float *a);
int main(void) {
	IplImage *image1 = 0;

	image1 = cvLoadImage("123.png",1);

	int ratio = 4;
	int w = image1->width * ratio;
	int h = image1->height * ratio;

	IplImage *image = cvCreateImage(cvSize(w, h), IPL_DEPTH_8U,3);
	  unsigned char *data, *result1;
	data = ( unsigned char *)image1->imageData;
	result1 = ( unsigned char *)image->imageData;
	char file_name[20] = "result";



	FILE *fp1 = fopen("result_chceck.txt", "w");
	float x1, x2, x3, x4;
	float y1, y2, y3, y4;
	//data = (*unsigned char )
	float x, y;
	float p1, p2, p3, p4;
	float p[4] = { 0, };
	int t = 1;
	float result;
	char med;
	int i, j;
	int num = 0;
	int x0, y0;
	float hi = 0.25;
	long a;
	int rgb = 0;
	int channel = 3;

	for (rgb = 0; rgb < 3; rgb++) {
		for (j = 0; j < (image1->height * ratio); j++) {
			//      if (j = 400) t = 1;
			printf("\nLine %d / %d\n", j + 1, (image1->height) * 4);
			printf("***************************************\n");
			for (i =0; i < (image1->width * ratio); i++) {
				result = 0;

				for (int x_a = -1; x_a < ratio - 1; x_a++) {


					x = i * hi;
					y = j * hi;
					x0 = (int)(i * hi);
					y0 = (int)(j * hi);


					x1 = 1 + x - floor(x);// # 내림함수
					x2 = x - floor(x); //## 커널의 중심
					x3 = floor(x) + 1 - x;
					x4 = floor(x) + 2 - x;

					y1 = 1 + y - floor(y);
					y2 = y - floor(y); //## 커널의 중심
					y3 = floor(y) + 1 - y;
					y4 = floor(y) + 2 - y;
					t = 1;
					f_x(&x1);
					f_x(&x2);
					f_x(&x3);
					f_x(&x4);

					f_x(&y1);
					f_x(&y2);
					f_x(&y3);
					f_x(&y4);
					t = 1;
					p[num] = x1 * data[channel * ((x0 -1) + (y0 +x_a) *(image1->width)) + rgb] + x2 * data[channel*(x0 + (y0+x_a) *(image1->width)) + rgb] + x3 * data[channel*(x0+1 + (y0 +x_a) *(image1->width)) + rgb] + x4 * data[channel*(x0 + 2 + (y0 + x_a) *(image1->width)) + rgb];
					
					//x1 * data[channel * ((x0 + x_a) + (y0 - 1) *(image1->width))+rgb] + x2 * data[channel*(x0 + x_a + (y0) *(image1->width))+rgb] + x3 * data[channel*(x0 + x_a + (y0 + 1) *(image1->width))+rgb] + x4 * data[channel*(x0 + x_a + (y0 + 2) *(image1->width))+rgb];
					
					t = 1;
					//p[num] = x1 * data[(x0 + x_a) + (y0 - 1) * image1->width] + x2 * data[(x0 + x_a) + y0 * image1->width]+ x3 * data[(x0 + x_a) + (y0 + 1) * image1->width]+ x4 * data[(x0 + x_a) + (y0 + 2) * image1->width];
					//p[num] = data[(x0 + x_a + (y0 - 1) * image1->width)];
					if (num == 3) num = 0;
					else num++;
					t = 1;
				}



				result = p[0] * y1 + p[1] * y2 + p[2] * y3 + p[3] * y4;
				t = 1;
				fprintf(fp1, "%f\n", result);
				//if (int(result) < 0) result = 0;
				//if (int(result) > 255) result = 255;
				t = 1;
				med = result;
				t = 1;
				result1[channel*((i + j * (image1->width) * ratio)) + rgb] = result;
			}
		}
	}

	// cvEqualizeHist(image, image);

	   //Creating Window

	sprintf(file_name, "result.png");
	cvSaveImage(file_name, image);
	cvNamedWindow("Result", 1);

	//Show image from each pointers
	cvShowImage("Result", image);

	cvWaitKey(0);
	//Closuring Window
	cvDestroyWindow("Result");
}


void f_x(float *a)
{

	float result;
	if ((fabs(*a) >= 0) && (fabs(*a) <= 1))
		result = (1.5)*pow(double(fabs(double(*a))), 3.0) - (2.5) * pow(double(fabs(double(*a))), 2.0) + 1;
	else if ((fabs(*a) > 1) && (fabs(*a) <= 2))
		result = (-0.5) * pow(double(fabs(double(*a))), 3.0) + (2.5)* pow(double(fabs(double(*a))), 2.0) + (-4.0)*fabs(double(*a)) + 2;
	else
		result = 0;

	*a = result;



}
