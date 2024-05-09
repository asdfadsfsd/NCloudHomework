package chap99_homework.homework08;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class advance {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		1. 2001년 12월 19일이 결혼기념일인 부부가 있다. 
//	    윤년이 있는 년도에는 결혼기념일의 날짜를 하루씩 더하기로 했다.
//	    2022년의 결혼기념일 날짜를 구하세요.

		Scanner sc = new Scanner(System.in);
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(2001, 11, 19);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar calendar1 = Calendar.getInstance();
		System.out.println("결혼기념일 년도를 입력하세요");
		int year = sc.nextInt();
		year = calendar.get(Calendar.YEAR);
			
		if(isLeapYear(year)) {
			Date date = simpleDateFormat.parse(year);
			calendar.setTime(date);
			calendar.add(Calendar.DATE, 1);

		} else {
			System.out.println(year + "년은 윤년이 아닙니다.");
		}
		
		
	}
	
	public static boolean isLeapYear(int year) {
		// 윤년의 조건
		// 년도가 400으로 나누어떨어지거나 4로는 나누어떨어지고 100으로는 나눠떨어지지 않는 년도
//		if(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
//			return true;
//		
//		return false;
		
		return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0);
	}
		

//	2. 사용자가 두 개의 날짜(yyyy-MM-dd 형식)를 입력하고 입력받은
//	    두 날짜 사이의 날짜를 모두 출력하세요. (Calendar 클래스를 사용하세요).
//	    ex) 2023-01-29 2023-02-05 입력
//		출력       2023-01-29
//	             2023-01-30
//	             2023-01-31
//	             2023-02-01
//	             2023-02-02
//	             2023-02-03
//	             2023-02-04
//	             2023-02-05
//
//	3. 사용자가 입력한 5개의 정수를 저장하는 List<Integer>를 생성하고
//	    연속된 두 수의 합이 가장 커지는 구간의 두 수를 출력하세요.
//	    ex) [1, 2, 3, 4, 5] => 4, 5 출력
//
//	4. 사용자가 입력한 6개의 정수를 저장하는 List<Integer>를 생성하고
//	    두 수의 합이 유일한 값이 되는 개수를 출력하세요.(중복 숫자 사용불가)
//	    ex) [1, 2, 3, 4, 5, 6] => 총 4개(3, 4, 10, 11)
		
	}

}
