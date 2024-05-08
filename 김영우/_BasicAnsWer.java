package chap99_homework.homework07;

import java.util.Scanner;

public class _BasicAnsWer {

	
	
	public static void main(String[] args) {
	
		Scanner sc = new Scanner(System.in);
		String str = null;
		StringBuffer sb = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
		
		// TODO Auto-generated method stub
		for(int i = 0 ; i < 3 ; i++) {
			System.out.println(i+1 + "번째 문자열을 입력하세요.");
			str = sc.nextLine();
			sb2 = sb.append(str);
		}
		System.out.println(sb2);	

		StringBuffer sb3 = new StringBuffer(30);
//		버퍼 크기가 30인 stringBuffer
		
		int remain = sb3.capacity() - sb3.length(); 
		
		sb3.append("hello");
		
		for(int i = 0 ; i < remain ; i++) {
			sb3.append("a");
		}
		
		System.out.println(sb3.capacity());		
		System.out.println(sb3);
	}
	
}
