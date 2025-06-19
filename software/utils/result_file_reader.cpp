/* *************************************
영상마다 다르게 적용할 수 있는 코드

맵 :: 284 * 216 // 30
sawtooth :: 434 * 380 // 20

츠쿠바 :: 384 * 288 //16 (110592)
venus :: 434 * 383 // 20 (166222)
cone :: 450 * 375 // 60 (168750)
teddy :: 450 * 375 // 60 (168750)

기존코드와 다른점은 t_value, t_value1 값을 안썼음.나머지 파라미터 값은 동일하다.

이미지는 각각에서 venus_left cone_left 이렇게만 바꾸어주면 된다.
************************************* */

//#include "stdafx.h"
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <stdio.h>
#define _USE_MATH_DEFINES
#include <math.h>
// atof 함수를 사용하기 위해서 필요한 헤더파일이다.
#include <stdlib.h>

// 데이터는 최대 10개까지 읽는다.
#define MAX_DATA_COUNT    166222

void main()
{
	// 파일에서 읽은 데이터의 개수를 저장할 변수
	int count = 0, i = 0;
	// 파일에서 읽은 데이터를 저장할 변수
	int data[MAX_DATA_COUNT];
	// 파일에서 한줄씩 읽어서 저장할 변수
	char temp[32];

	// 데이터 파일을 읽기 모드로 연다.
	FILE *p_file = fopen("venus.txt", "rt");
	if (p_file != NULL) {
		// 파일의 끝이 나올때까지 한줄씩 문자열을 읽어서 temp에 저장한다.
		while (fgets(temp, 32, p_file) != NULL) {
			// 읽어들은 문자열을 double 형 실수로 변환한다.
			data[count] = atoi(temp);

			// 데이터를 읽은 개수를 증가 시킨다.
			count++;

			// 읽은 개수가 최대치를 초과하는지 체크한다.
			if (count >= MAX_DATA_COUNT) break;
		}

		// 파일을 닫는다.
		fclose(p_file);
	}

	// 읽어들인 데이터의 개수를 출력한다.
	printf("Total Read Count = %d.\n", count);
	printf("Data List\n");

	// 읽어들인 데이터를 출력한다.
	for (i = 0; i < count; i++) {
		// 읽어들인 데이터는 소수 2번째 자리까지만 출력한다.
		printf("[%2d]: %.2f\n", i + 1, data[i]);
	}
}
/*
int main()
{
	FILE *fp1 = fopen("1234.txt", "r+");
	int venus;
	int i = 0;

	fscanf(fp1, "%d" &venus);
	//for ( i = 0; i < 166222; i++) fscanf_s(fp1, "%d\e", &venus[i]);


	fclose(fp1);
	
	//printf("%d", &venus[166000]);

	return 0;
}
*/
