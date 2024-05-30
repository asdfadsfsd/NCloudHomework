#include<stdio.h>
double  arr[10001];

int main()
{
    int size;
    scanf("%d",&size);
    double  max =0;
    for(int i =0; i<size ;i++)
    {
        scanf("%lf",&arr[i]);
        if(arr[i] >max)
            max =arr[i];
    }
    
    double sum =0;
    for(int i =0; i<size ;i++)
    {
       sum += (arr[i]/max)  *100;
    }
    printf("%lf\n",sum/size);
    
}
