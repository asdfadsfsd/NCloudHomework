package chap99_homework.homework07;

import java.util.Scanner;

public class _AdvanceAnswer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);

		System.out.println("문자를 입력하세요.");
		String userInput = sc.nextLine();
		
		System.out.println(returnMethod(userInput));

	}	
		//----------------------------------------------------------
		public static String returnMethod(String userInput) {
			StringBuilder sb = new StringBuilder(userInput);
			StringBuilder Emptysb = new StringBuilder();
		for(int i = 0 ; i < userInput.length() ; i++) {
			char ch = sb.charAt(i);
			boolean check = false;
			for(int j = 0 ; j < i ; j++) {
				if(ch == sb.charAt(j)) {
					check = true;
					break;
				}
			}
			
			if(!check) {
				 Emptysb.append(ch);
			}
		}
		
		return  Emptysb.toString();
		}
				
			
				
		
		
	

}
