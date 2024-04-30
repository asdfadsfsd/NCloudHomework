package homework01;

import java.util.Random;

public class _middle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        /*1. 1~100까지의 숫자 중 2와 3의 공배수를 출력하세요.
for(int i = 1; i <= 100; i++) {
	if()  {
		System.out.print(i + ", ");
	} => if문의 조건만 완성
}

3. while문을 이용해서 1부터 10까지 중에 짝수만 출력하세요.

4. 1000이하의 자연수 중에서 2의 배수이면서 7의 배수인 숫자를 출력하고,
   그 출력된 숫자들의 합을 구하는 프로그램을 작성하세요.

5. 20개 배열을 선언하세요.
    20개의 값을 난수를 이용해서 0 ~ 100까지의 값으로 채워넣고
    인덱스의 홀수번째는 앞에서부터 출력하고
    짝수번째는 뒤에서부터 출력하세요.

6. 중첩 for문을 이용해서 아래와 같이 출력하세요.
6-1)  
*
**
***
****
*****
6-2)
    *
   **
  ***
 ****
*****
6-3)
*****
****
***
**
*
6-4)
*****
 ****
  ***
   **
    */
		
		
		//1
		for(int i = 1; i <= 100; i++) {
			if(i%2 ==0 && i%3 ==0)  {
				System.out.print(i + ", ");
			}
		}
		
		System.out.println();
		
		//3
		int val_2 = 1;
		while(val_2 <= 10)
		{
			if(val_2%2 == 0)
				System.out.println(val_2);
			val_2 ++;
		}
		
		System.out.println();
		
		//4
		int sum3 =0;
		for (int i = 0; i <= 1000; i++) {
			if(i%3 == 0 && i%7 ==0)
			 sum3 +=i;
		}
		System.out.print(sum3);
		
		System.out.println();
		
		//5
		int[] arr =new int[20];
		Random r = new Random(); 
		for (int i = 0; i < arr.length; i++) {
			arr[i] = r.nextInt(100) +1 ;
		}
		
		for (int i = 1; i < arr.length; i+=2) {
			System.out.print(arr[i]+" ");
		}
		System.out.println();
		for (int i = 0; i < arr.length; i+=2) {
			System.out.print(arr[ (arr.length-2) -i]+" ");
		}
		System.out.println();
		
		
		//6-1
		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 5; j++) {
			   if(j<=i)
				System.out.print('*');
			   else
			    System.out.print(' ');
			}
			System.out.println();
	   	}
		
		System.out.println();
		//6-2
		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 5; j++) {
			   if(4-j <= i)
				System.out.print('*');
			   else
			    System.out.print(' ');
			}
			System.out.println();
	   	}
		
		System.out.println();
		//6-3
		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < 5; j++) {
			   if(5-i > j)
				System.out.print('*');
			   else
			    System.out.print(' ');
			}
			System.out.println();
	   	}
		
		
		System.out.println();
		//6-4
		for (int i = 0; i < 5; i++) {
			for (int j = 0; j < i; j++) {
				  System.out.print(' ');
			}
			for (int j = i;j < 5; j++) {
			    System.out.print('*');
			}
			
			System.out.println();
	   	}
		System.out.println();
	}

}
