package homework4.middle;

import java.util.Scanner;
//3개의 정숫값을 입력하고 중앙값을 구한 다음 출력합니다.

class Median {
	
	static int med3(int a, int b, int c) {
		//여기를 완성하세요.
		int max = a;
	    int min =a;
	    int mid =0;
	    max = max>b ? max:b;
		max = max>c ? max:c;
		
		min = min<b ? min:b;
		min = min<c ? min:c;
		
		if(max != a && min != a)
		  mid =a;
		else if(max != b && min != b)
			  mid =b;
		else if(max != c && min != c)
			  mid =c;
		else if(a == b)
		   mid =a;
		else if(a == c)
			   mid =a;
		else if(c == b)
			   mid =b;
			
		
		
		return mid;
	}

	public static void main(String[] args) {
		Scanner stdIn = new Scanner(System.in);

		System.out.println("세 정수의 중앙값을구합니다.");
		System.out.print("a의 값：");	
		int a = stdIn.nextInt();
		System.out.print("b의 값：");	
		int b = stdIn.nextInt();
		System.out.print("c의 값：");	
		int c = stdIn.nextInt();

		System.out.println("중앙값은 " + med3(a, b, c) + "입니다.");
	}
}