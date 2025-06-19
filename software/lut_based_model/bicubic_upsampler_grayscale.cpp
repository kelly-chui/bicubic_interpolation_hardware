#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <stdio.h>
#define _USE_MATH_DEFINES
#include <math.h>
#include "bicubic_weights.h"

int main(void)
{

    IplImage *image1 = 0;

    image1 = cvLoadImage("123_g.png", 0); //orig :: image

    int ratio = 4;
    int w = image1->width * ratio;
    int h = image1->height * ratio;

    IplImage *image = cvCreateImage(cvSize(w, h), IPL_DEPTH_8U, 1);
    unsigned char *orig_image, *result;
    orig_image = (unsigned char *)image1->imageData;
    result = (unsigned char *)image->imageData;
    char file_name[20] = "result";



    FILE *fp1 = fopen("result_check.txt", "w");
    FILE *fp2 = fopen("orig_image.txt", "w");
    float x1, x2, x3, x4;
    float y1, y2, y3, y4;
    //data = (*unsigned char )
    float x, y;
    float p1, p2, p3, p4;
    float p[4] = { 0, };
    int t = 1;
    float result_1, result_2, result_3, result_4;
    char med;
    int i, j;
    int num = 0;
    int x0, y0;
    float hi = 0.25;
    long a;
    int rgb = 0;
    int channel = 3;

    unsigned char data[16];

    float x_weight_sum_1, x_weight_sum_2, x_weight_sum_3, x_weight_sum_4;
    float xy_weight_sum_1, xy_weight_sum_2, xy_weight_sum_3, xy_weight_sum_4;

    float reg_result_1 = 0, reg_result_2 = 0, reg_result_3 = 0, reg_result_4 = 0;
    float box_memory[16];
    int image_size = image->width * image->height;
    float * result_check = new float[image_size];

    int count = 1;
    int data_index;
    int box_index;
    int box_width = 4;
    int box_index_1, box_index_2, box_index_3, box_index_4;
    
    for(int c= 0; c <image1->width * image1->height ; c++) fprintf(fp2, "%d\n", orig_image[c]);

    //for (rgb = 0; rgb < 3; rgb++) {

    for (j = 0; j < (image1->height * ratio); j = j + 4)
    {

        printf("\nLine %d / %d\n", j + 1, (image1->height) * 4);
        printf("***************************************\n");

        for (i = 0; i < (image1->width * ratio); i = i + 4)
        {

            x0 = (int)(i * hi);
            y0 = (int)(j * hi);
            box_index = 0;
            data_index = 0;

            // original image를 data 에 할당하기
            // 앞단 testbench 에서 주어야 할것
            for (int x_a = -1; x_a < ratio - 1; x_a++)
            {

                data[data_index] = orig_image[(x0 - 1) + (y0 + x_a) *(image1->width)];
                data[data_index + 1] = orig_image[(x0)+(y0 + x_a) *(image1->width)];
                data[data_index + 2] = orig_image[(x0 + 1) + (y0 + x_a) *(image1->width)];
                data[data_index + 3] = orig_image[(x0 + 2) + (y0 + x_a) *(image1->width)];
                t = 1;
                data_index += 4;
                t = 1;
                //OK
            }

            for (int box_count = 0; box_count < 4; box_count++) // 4번 다 돌리면 box 채워진다.
            {
                data_index = 0;
                for (count = 1; count < 5; count++)
                {
                    x = i * hi;
                    y = j * hi;


                    /* 굳이 MUX로 설계할 이유가 없음. 심지어 비교기도 들어간다.
                    if (count == 1) data_index = 0;
                    else if (count == 2) data_index = 4;
                    else if (count == 3) data_index = 8;
                    else if (count == 4) data_index = 12;
                    */

                    t = 1;
                    x1_weight(&data[data_index], &data[data_index + 1], &data[data_index + 2], &data[data_index + 3], &x_weight_sum_1);
                    x2_weight(&data[data_index], &data[data_index + 1], &data[data_index + 2], &data[data_index + 3], &x_weight_sum_2);
                    x3_weight(&data[data_index], &data[data_index + 1], &data[data_index + 2], &data[data_index + 3], &x_weight_sum_3);
                    x4_weight(&data[data_index], &data[data_index + 1], &data[data_index + 2], &data[data_index + 3], &x_weight_sum_4);

                    data_index = data_index + 4;

                    if (box_count == 0)
                    {
                        y1_weight(&x_weight_sum_1, &xy_weight_sum_1, &count);
                        y2_weight(&x_weight_sum_2, &xy_weight_sum_2, &count);
                        y3_weight(&x_weight_sum_3, &xy_weight_sum_3, &count);
                        y4_weight(&x_weight_sum_4, &xy_weight_sum_4, &count);
                        reg_result_1 = reg_result_1 + xy_weight_sum_1;
                        reg_result_2 = reg_result_2 + xy_weight_sum_2;
                        reg_result_3 = reg_result_3 + xy_weight_sum_3;
                        reg_result_4 = reg_result_4 + xy_weight_sum_4;
                    }

                    if (box_count == 1)
                    {
                        y1_weight(&x_weight_sum_2, &xy_weight_sum_2, &count);
                        y2_weight(&x_weight_sum_3, &xy_weight_sum_3, &count);
                        y3_weight(&x_weight_sum_4, &xy_weight_sum_4, &count);
                        y4_weight(&x_weight_sum_1, &xy_weight_sum_1, &count);
                        reg_result_1 = reg_result_1 + xy_weight_sum_2;
                        reg_result_2 = reg_result_2 + xy_weight_sum_3;
                        reg_result_3 = reg_result_3 + xy_weight_sum_4;
                        reg_result_4 = reg_result_4 + xy_weight_sum_1;
                    }

                    if (box_count == 2)
                    {
                        y1_weight(&x_weight_sum_3, &xy_weight_sum_3, &count);
                        y2_weight(&x_weight_sum_4, &xy_weight_sum_4, &count);
                        y3_weight(&x_weight_sum_1, &xy_weight_sum_1, &count);
                        y4_weight(&x_weight_sum_2, &xy_weight_sum_2, &count);
                        reg_result_1 = reg_result_1 + xy_weight_sum_3;
                        reg_result_2 = reg_result_2 + xy_weight_sum_4;
                        reg_result_3 = reg_result_3 + xy_weight_sum_1;
                        reg_result_4 = reg_result_4 + xy_weight_sum_2;
                    }

                    if (box_count == 3)
                    {
                        y1_weight(&x_weight_sum_4, &xy_weight_sum_4, &count);
                        y2_weight(&x_weight_sum_1, &xy_weight_sum_1, &count);
                        y3_weight(&x_weight_sum_2, &xy_weight_sum_2, &count);
                        y4_weight(&x_weight_sum_3, &xy_weight_sum_3, &count);
                        reg_result_1 = reg_result_1 + xy_weight_sum_4;
                        reg_result_2 = reg_result_2 + xy_weight_sum_1;
                        reg_result_3 = reg_result_3 + xy_weight_sum_2;
                        reg_result_4 = reg_result_4 + xy_weight_sum_3;
                    }

                    t = 1;
                    t = 1;
                    /*
                    reg_result_1 = reg_result_1 + xy_weight_sum_1;
                    reg_result_2 = reg_result_2 + xy_weight_sum_2;
                    reg_result_3 = reg_result_3 + xy_weight_sum_3;
                    reg_result_4 = reg_result_4 + xy_weight_sum_4;
                    */
                    t = 1;
                    
                    //for. y1_weight_COUNTER 더불어 아래에 위치에 해야 한다.
                    if (count == 4)
                    {
                        //    count = 1; //reset

                        result_1 = reg_result_1;
                        result_2 = reg_result_2;
                        result_3 = reg_result_3;
                        result_4 = reg_result_4;

                        //testbench 에서 구성해야 할 것 :: output 결과를 받아줄 memory
                        //box count =2일때가 잘못됨 =>
                        box_index_1 = (box_count + 0 >= 4) ? (box_count + 0) - 4 : box_count; // 이 제어문은 걸릴 일이 없긴함
                        box_index_2 = (box_count + 1 >= 4) ? (box_count + 1) - 4 : box_count + 1;
                        box_index_3 = (box_count + 2 >= 4) ? (box_count + 2) - 4 : box_count + 2;
                        box_index_4 = (box_count + 3 >= 4) ? (box_count + 3) - 4 : box_count + 3;


                        box_memory[(box_index_1)+0 * box_width] = result_1;
                        box_memory[(box_index_2)+1 * box_width] = result_2;
                        box_memory[(box_index_3)+2 * box_width] = result_3;
                        box_memory[(box_index_4)+3 * box_width] = result_4; //ok
                        t = 1;

                        //4clk에 결과 완성되므로 reset
                        reg_result_1 = 0;
                        reg_result_2 = 0;
                        reg_result_3 = 0;
                        reg_result_4 = 0;

                    }

                }


            }
            // 뒷단 testbench Box 다 채워지는거

            for (int y = 0; y < 4; y++)
            {
                for (int x = 0; x < 4; x++)
                {
                    result[(i + x) + (j + y) * image->width] = box_memory[x + y * box_width]; //OK
                    t = 1;
                    result_check[(i + x) + (j + y) * image->width] = box_memory[x + y * box_width]; //OK

                }
            }

        }
    }

    //result_check
    for (int i = 0; i < image->width * image->height; i++) fprintf(fp1, "%f\n", result_check[i]);


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


void x1_weight(unsigned char *data1, unsigned char *data2, unsigned char *data3, unsigned char *data4, float *x_weight_sum)
// for <1,0,1,2> cutoff는 나중에 따지자.
{
    float x_data1, x_data2, x_data3, x_data4;

    x_data1 = (*data1) * 0;
    x_data2 = (*data2) * 1;
    x_data3 = (*data3) * 0;
    x_data4 = (*data4) * 0;

    *x_weight_sum = x_data1 + x_data2 + x_data3 + x_data4;

}

void x2_weight(unsigned char *data1, unsigned char *data2, unsigned char *data3, unsigned char *data4, float *x_weight_sum)
// for <1.25,0.25,1.25,2.25> cutoff는 나중에 따지자.
{
    float x_data1, x_data2, x_data3, x_data4;

    x_data1 = (*data1) * -0.0703125;
    x_data2 = (*data2) * 0.867187500;
    x_data3 = (*data3) * 0.226562500;
    x_data4 = (*data4) * -0.0234375;

    *x_weight_sum = x_data1 + x_data2 + x_data3 + x_data4;

}

void x3_weight(unsigned char *data1, unsigned char *data2, unsigned char *data3, unsigned char *data4, float *x_weight_sum)
// for <1.5,0.5,1.5,2.5> cutoff는 나중에 따지자.
{
    float x_data1, x_data2, x_data3, x_data4;

    x_data1 = (*data1) * -0.062500000;
    x_data2 = (*data2) * 0.562500000;
    x_data3 = (*data3) *0.562500000;
    x_data4 = (*data4) *-0.062500000;

    *x_weight_sum = x_data1 + x_data2 + x_data3 + x_data4;

}

void x4_weight(unsigned char *data1, unsigned char *data2, unsigned char *data3, unsigned char *data4, float *x_weight_sum)
// for <1.75,0.75,1.75,2.75> cutoff는 나중에 따지자.
{
    float x_data1, x_data2, x_data3, x_data4;

    x_data1 = (*data1) * -0.023437500;
    x_data2 = (*data2) * 0.226562500;
    x_data3 = (*data3) * 0.8671875;
    x_data4 = (*data4) * -0.0703125;

    *x_weight_sum = x_data1 + x_data2 + x_data3 + x_data4;

}

// for y_weight

void y1_weight(float *x_weight_sum, float * xy_weight_sum, int * count)
// for <1,0,1,2> cutoff는 나중에 따지자. 소숫점 x 소숫점일테니까 cutoff해주어야함
{
    if (*count == 1) * xy_weight_sum = (*x_weight_sum) * 0;
    if (*count == 2) * xy_weight_sum = (*x_weight_sum) * 1;
    if (*count == 3) * xy_weight_sum = (*x_weight_sum) * 0;
    if (*count == 4) * xy_weight_sum = (*x_weight_sum) * 0;

}

void y2_weight(float *x_weight_sum, float * xy_weight_sum, int * count)
// for <1.25,0.25,1.25,2.25> cutoff는 나중에 따지자. 소숫점 x 소숫점일테니까 cutoff해주어야함
{
    if (*count == 1) * xy_weight_sum = (*x_weight_sum) * -0.070312500;
    if (*count == 2) * xy_weight_sum = (*x_weight_sum) * 0.867187500;
    if (*count == 3) * xy_weight_sum = (*x_weight_sum) * 0.226562500;
    if (*count == 4) * xy_weight_sum = (*x_weight_sum) * -0.0234375;

}

void y3_weight(float *x_weight_sum, float * xy_weight_sum, int * count)
// for <1.5,0.5,1.5,2.5> cutoff는 나중에 따지자. 소숫점 x 소숫점일테니까 cutoff해주어야함
{
    if (*count == 1) * xy_weight_sum = (*x_weight_sum) *-0.062500000;
    if (*count == 2) * xy_weight_sum = (*x_weight_sum) * 0.562500000;
    if (*count == 3) * xy_weight_sum = (*x_weight_sum) * 0.562500000;
    if (*count == 4) * xy_weight_sum = (*x_weight_sum) * -0.062500000;

}
void y4_weight(float *x_weight_sum, float * xy_weight_sum, int * count)
// for <1.75,0.75,1.75,2.75> cutoff는 나중에 따지자. 소숫점 x 소숫점일테니까 cutoff해주어야함
{
    if (*count == 1) * xy_weight_sum = (*x_weight_sum) * -0.023437500;
    if (*count == 2) * xy_weight_sum = (*x_weight_sum) * 0.226562500;
    if (*count == 3) * xy_weight_sum = (*x_weight_sum) * 0.867187500;
    if (*count == 4) * xy_weight_sum = (*x_weight_sum) * -0.0703125000;

}
