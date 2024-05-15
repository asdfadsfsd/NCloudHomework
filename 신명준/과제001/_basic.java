package homework01;

import java.util.Random;
import java.util.Scanner;

public class _basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        /*
         * 1. int num = 10;을 선언하고 증감연산자를 통해 다음과 같이 출력하세요. 출력된 값은 모두 증감연산자가 포함된 상태입니다.
    11
    12
    12
    10
    10
     8

2. 관계연산자(<, >) 두 개를 사용하여 int a = 10; int b = 20; 의 관계를 다음과 같이 출력하세요.
    true
    false

3. 10 ~ 1까지 거꾸로 while문으로 출력

4. 10 ~ 1까지 거꾸로 do ~ while문으로 출력

5. 10 ~ 1까지 거꾸로 for문으로 출력

6. 1 ~ 100까지 합을 while문으로 출력

7. 1 ~ 100까지 합을 do ~ while문으로 출력

8. 1 ~ 100까지 합을 for문으로 출력

9. int 10개짜리 배열 생성하여
 int배열에 3의 배수를 차례대로 저장하세요.
 그리고 거꾸로 출력하세요.
 
10. int배열을 10개 생성해서
  사용자로부터 10개의 값을 입력받고
  순서대로 출력하고 총합을 구하세요.
 
11. int 배열로 10개의 공간을 생성하세요.
  1 ~ 10까지의 임의의 수를 저장하고
  홀수만 골라서 출력하세요.
  
12. 정수 10개를 입력받아 배열에 저장하고, 
    이 정수 중에서 2의 배수와 3의 배수를 출력하세요.
         * 
         * */
		
		int num = 10;
		System.out.println(++num);
		System.out.println(++num);
		System.out.println(num--);
		System.out.println(--num);
		System.out.println(num--);
		System.out.println(--num);
		
		System.out.println(10<20);
		System.out.println(10>20);
		
		num =10;
		while(num>0)
		{
			System.out.println(num);
			num-=1;
		}
		
		num =10;
		do {
			System.out.println(num);
			num-=1;
		}
		while(num>1);
		
		for (int i = 10; i > 0; i--) {
			System.out.println(i);
		}
		
		num =1;
		int sum=0;
		while(num<=100)
		{
			sum+= num;
			num++;
		}
		System.out.println(sum);
		
		num =1;
		sum=0;
		do {
			sum+= num;
			num++;
		}
		while(num<100);
		System.out.println(sum);
		
		sum=0;
		for (int i = 1; i <= 100; i++) {
			sum+=i;
		}
		System.out.println(sum);
		
		int[] arr = new int[10];
		for (int i = 0; i < 10; i++) {
					arr[i] = (i+1)*3;
		}
		
		for (int i = 9; i >= 0; i--) {
			System.out.println(arr[i]);
        }
		
		
		Scanner sc = new Scanner(System.in);
		sum=0;
		for (int i = 0; i < 10; i++) {
			arr[i] = sc.nextInt();
			sum+=arr[i];
        }
		for (int i = 0; i < 10; i++) {
			System.out.print(arr[i]);
        }
		System.out.println(sum);
		
		Random r = new Random();
		for (int i = 0; i < 10; i++) {
			arr[i] = r.nextInt(10)+1;
        }
		for (int i = 0; i < 10; i++) {
			if(arr[i] %2 !=0 )
			 System.out.print(arr[i]);
        }
		
		
		for (int i = 0; i < 10; i++) {
			arr[i] = sc.nextInt();
        }
		for (int i = 0; i < 10; i++) {
			if(arr[i] %2 ==0 || arr[i] %3 ==0 )
			 System.out.print(arr[i]);
        }
		System.out.println();
	}

}
