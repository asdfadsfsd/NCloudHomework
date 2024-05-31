#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<iostream>

int main()
{
    int x, y;
    int arr[50][50];
    scanf("%d%d", &x, &y);
    for (int i = 0; i < x; i++)
    {
            std::string str;
            std::cin >> str;
            for(int j = 0; j < y; j++)
             // 값 그냥 1,-1 로 바꾸기
             if (str.at(j) == 'W')
                arr[i][j] = 1;
             else
                arr[i][j] = -1;
        
    }

    int min = 10001;
    for (int st_x = 0; st_x <= x - 8; st_x++)
    {
        for (int st_y = 0; st_y <= y - 8; st_y++)
        {
            //확인하기
            //case 1 start WB
            int sum1 = 0;
            int flag1 = 1;
            for (int i = 0; i < 8; i++)
            {
                for (int j = 0; j < 8; j++)
                {
                    if (arr[st_x + i][st_y + j] != flag1)
                    {
                        sum1 += 1;
                    }
                    flag1 *= -1;
                }
                flag1 *= -1;
            }
            if (sum1 < min)min = sum1;

            //case 2 start BW
            int sum2 = 0;
            int flag2 = -1;
            for (int i = 0; i < 8; i++)
            {
                for (int j = 0; j < 8; j++)
                {
                    if (arr[st_x + i][st_y + j] != flag2)
                    {
                        sum2 += 1;
                    }
                    flag2 *= -1;
                }
                flag2 *= -1;
            }
            if (sum2 < min)min = sum2;

        }
    }

    printf("%d", min);
}