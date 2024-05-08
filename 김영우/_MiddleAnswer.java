package chap99_homework.homework07;

import java.util.Scanner;

public class _MiddleAnswer {

	public static void main(String[] args) {

		StringBuffer sb = new StringBuffer(30);
		
		sb.append("hello");
		
		for(int i = sb.length() ; i < 30 ; i++) {
			if(i%3==2) {
				sb.append('b');
			}
			else if(i%3==0) {
				sb.append('i');
				
			}
			else if(i%3==1) {
				sb.append('t');
			}
		}
		
		
		System.out.println(sb);
	
	
		System.out.println("----------------------");
		
		Scanner sc = new Scanner(System.in);
		
		StringBuffer sb1 = new StringBuffer("유용한 클래스는 많다. 다양한 라이브러리를 활용한다.");
		System.out.println(sb1.length());
		System.out.println("출력하고 싶은 자릿수의 숫자를 입력하세요.");
		int userInput = sc.nextInt();
		
		StringBuffer sb2 = sb1.reverse();
		
		if(userInput > sb1.length() || userInput < 0){
			System.out.println("잘못 입력하셨습니다.");
		} else {
			System.out.println(sb2.substring(userInput-1, userInput));
		}
		
		
	
	
	
	
	
	}
}
