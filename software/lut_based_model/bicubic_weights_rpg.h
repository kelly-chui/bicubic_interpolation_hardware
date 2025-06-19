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