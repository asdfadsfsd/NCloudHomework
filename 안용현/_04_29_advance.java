package aa_examples;

import java.util.Scanner;

public class _04_29_advance {

	public static void main(String[] args) {
		System.out.println("======24-04-29 middle ~ advance======");
		// TODO Auto-generated method stub
		//*************** middle *******************
//5. 20개 배열을 선언하세요.
//    20개의 값을 난수를 이용해서 0 ~ 100까지의 값으로 채워넣고
//    인덱스의 홀수번째는 앞에서부터 출력하고
//    짝수번째는 뒤에서부터 출력하세요.
//		int[] intArr = new int[20];
//		for(int i = 0; i < intArr.length; i++) {
//			intArr[i] = (int) (Math.random() * 100 )+1;
//			}
//		for(int j =0; j < intArr.length; j++) {
//			if(intArr[j] % 2 == 1) {
//				System.out.println(intArr[j]);
//				}
//			}
//		for(int k = intArr.length-1; k >= 0; k--) {		
//			if(intArr[k] % 2 == 0) {
//				System.out.println(intArr[k]);
//				}
//			}
		
//6. 중첩 for문을 이용해서 아래와 같이 출력하세요.
//6-1)  
//*
//**
//***
//****
//*****
//		for(int i = 0; i < 5; i++) {
//			for(int j = 0; j <= i; j++) {
//				System.out.print("*");
//			}
//			System.out.println( );
//		}
		
//6-2)
//    *
//   **
//  ***
// ****
//*****
//		for(int i = 0; i < 5; i++) {
//			for(int j = 0; j < 5-i ; j++) {
//				System.out.print(" ");
//			}
//			for(int k = 0; k <= i ; k++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
		
//6-3)
//*****
//****
//***
//**
//*
//		for(int i = 0; i < 5; i++) {
//			for(int j = 5; j > i; j--){
//				System.out.print("*");
//			}
//			System.out.println();
//		}
		
//6-4)
//*****
// ****
//  ***
//   **
//    *	 
//		for(int i = 0; i < 5; i++) {
//			for(int j = 0; j < i; j++) {
//				System.out.print(" ");
//			}
//			for(int k = 5; k > i; k--) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
		
		
		//**********advance**********
//		1. 사용자가 입력한 금액을 오만원권, 만원권, 오천원권, 천원권, 500원동전, 100원동전, 50원동전, 10원동전, 1원동전 
//		   각 몇개로 변환되는지 출력하세요.
//		   출력 개수는 단위가 큰 것 순서로 계산합니다
//		   예를 들어 78670원이면 <오만원 1매, 만원 2매, 오천원 1매, 천원 3매, 500원 1개, 100원 1개, 50원 1개, 10원 2개> 입니다.
			
//		Scanner sc = new Scanner(System.in);
//		System.out.print("금액을 입력 하세요: ");
//		int input = sc.nextInt();
//		if(input / 50000 >= 1) {
//			System.out.println("오만원 "  + input/50000 + " 매");
//			input = input % 50000;
//		}
//		if(input / 10000 >= 1) {
//			System.out.println("만원 "  + input/10000 + " 매");
//			input = input % 10000;
//		}
//		if(input / 5000 >= 1) {
//			System.out.println("오천원 "  + input/5000 + " 매");
//			input = input % 5000;
//		}
//		if(input / 1000 >= 1) {
//			System.out.println("천원 "  + input/1000 + " 매");
//			input = input % 1000;
//		}
//		if(input / 500 >= 1) {
//			System.out.println("오백원 "  + input/500 + " 개");
//			input = input % 500;
//		}
//		if(input / 100 >= 1) {
//			System.out.println("백원 "  + input/100 + " 개");
//			input = input % 100;
//		}
//		if(input / 50 >= 1) {
//			System.out.println("오십원 "  + input/50 + " 개");
//			input = input % 50;
//		}
//		if(input / 10 >= 1) {
//			System.out.println("십원 "  + input/10 + " 개");
//			input = input % 10;
//		}
//		if(input / 1 >= 1) {
//			System.out.println("일원 "  + input/1 + " 개");
//			input = input % 1;
//		}
//		System.out.println("-----");
		
//		2. 369게임을 작성합니다.
//		   1~99까지의 정수를 입력받고
//		   3,6,9중 하나가 있으면 "박수짝"을 출력하고
//		   2개가 있으면 "박수짝짝"을 출력하세요
//		   예를 들어 13은 "박수짝"
//		   36인 경우는 "박수짝짝"을 출력하면 됩니다.

//		Scanner sc = new Scanner(System.in);
//		while(true) {
//			System.out.print("1 ~ 99 중 하나의 정수 입력(종료: 0): ");
//			int intNum = sc.nextInt();
//			if(intNum == 0) {
//				System.out.println("종료합니다.");
//				break;
//			}
//			
//			if(intNum < 1 || intNum >99) {
//				System.out.println("잘못된 입력.");
//				continue;
//			}
//			
//			int tNum = intNum / 10;
//			int oNum = intNum % 10;
//			
//			if(oNum % 3 == 0) {
//				System.out.print("박수짝");
//				if(tNum % 3 ==0) {
//					System.out.println("짝");
//				}else System.out.println();
//			}
		
//			else if(tNum % 3 == 0) {
//				System.out.print("박수짝");
//				if(oNum % 3 ==0) {
//					System.out.println("짝");
//				}else System.out.println();
//			}	
//		}		
		
//		3. 다음과 같이 출력하세요.
//		    *
//		   ***
//		  *****
//		 *******
//		*********
		
//		for(int i = 0; i < 5; i++) {
//			for(int j = 4; j > i; j--) {
//				System.out.print(" ");
//			}
//			for(int k = 0; k <= i; k++) {
//				System.out.print("*");
//			}
//			for(int k = 1; k <= i; k++) {
//				System.out.print("*");
//			}
//			System.out.println( );	
//		}
		
		
	}

}
