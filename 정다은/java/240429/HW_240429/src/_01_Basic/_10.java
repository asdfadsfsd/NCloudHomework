package _01_Basic;

import java.util.Scanner;

public class _10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		10. int배열을 10개 생성해서
//		  사용자로부터 10개의 값을 입력받고
//		  순서대로 출력하고 총합을 구하세요.
		
		Scanner sc = new Scanner(System.in);
		
		int[] intArr = new int[10];
		int sum = 0;
		
		for(int i = 0; i < intArr.length; i++) {
			intArr[i] = sc.nextInt();
			sum += intArr[i];
		}
		for(int i = 0; i < intArr.length; i++) {
			System.out.print(intArr[i] + " ");
		}
		System.out.println("\nTotal: " + sum);
		
		sc.close();
	}
	

}
