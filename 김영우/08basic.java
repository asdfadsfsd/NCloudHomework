package chap99_homework.homework08;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Scanner;

public class basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		1. Calendar 객체를 오늘날짜로 생성하세요.
//		   객체의 날짜를 2020년 4월 8일로 변경하고 출력하세요.
//		   위의 객체의 날짜를 add 메소드를 이용해서 5년뒤 2달뒤 3일뒤(동시에)로 변경하고 출력하세요.
		
//		[1] calendar 객체 생성 / getInstance 활용
		Calendar calendar = Calendar.getInstance();
		
//		[2] printCalendar 매서드로 형식 활용
		printCalendar(calendar);
		
		System.out.println("---------------");
		
//		[3] set 형식으로 날짜 변경
		calendar.set(2020, 3, 8);
		printCalendar(calendar);
		
		System.out.println("---------------");
		
		calendar.add(Calendar.YEAR, 5);
		calendar.add(Calendar.MONTH, 2);
		calendar.add(Calendar.DATE, 3);
		
		
		
		
		
//		2. Calendar 객체를 오늘날짜로 생성하세요.
//		   오늘날짜를 2023-03-24 형식으로 출력하세요.
//		   오늘날짜를 2023년 03월 24일 xx시 xx분 xx초 형식으로 출력하세요.

//		[1] calendar 객체 생성 / getInstance 활용
		Calendar calendar2 = Calendar.getInstance();
		
//		[2] calendar2가 오늘 날짜이기 때문에 형식만 지정
//		10보다 작으면 +1을 해주는 이유는 month와 date가 0부터 시작하기 때문에
		System.out.println("현재 날짜는 " + 
				calendar2.get(Calendar.YEAR) + "-" +
				((calendar2.get(Calendar.MONTH) + 1) < 10 
						? "0" + (calendar2.get(Calendar.MONTH) + 1) 
						: (calendar2.get(Calendar.MONTH) + 1)) + "-" +
				(calendar2.get(Calendar.DATE) < 10 
						? "0" + calendar2.get(Calendar.DATE)
						: calendar2.get(Calendar.DATE))
			);
		
//		[3] calendar2.set으로 형식을 지정해주고 DateToString과 TimeToString 메서드를 미리 지정해줘서 메서드 활용
		int xx = 0;
		calendar2.set(2024, 03, 24, xx, xx, xx);
		System.out.println();
		
		System.out.println(DateToString(calendar2) + " " + TimeToString(calendar2));

		
//		3. 정수형 데이터를 저장할 수 있는 ArrayList를 생성하고 사용자가 입력한 5개의 정수를 저장하고 출력하세요.

//		[4] ArrayList를 integer 형식의 list로 객체 생성
		
		List<Integer> list = new ArrayList<>();
		
		Scanner sc = new Scanner(System.in);
		
//		[5] arraylist에 사용자가 입력한 정수를 입력
		for(int i = 0 ; i < 5 ; i++) {
			System.out.println(i+1 + "번째 정수를 입력하세요.");
			list.add(sc.nextInt());
		}	
		
		System.out.println(list);
		
		
		
		

	}
	
//	System.out.println("---------------메서드");
	
	
	
	public static void printCalendar(Calendar cal) {
		System.out.println(cal.get(Calendar.YEAR) + "년 " + 
				(cal.get(Calendar.MONTH) + 1) + "월 " +
				cal.get(Calendar.DATE) + "일");
	}
	
	public static String DateToString(Calendar calendar) {
		// 몇년 몇월 몇일 형태의 String이 리턴되도록 구현
		return calendar.get(Calendar.YEAR) + "년 " +
				(calendar.get(Calendar.MONTH) + 1) + "월 " +
				calendar.get(Calendar.DATE) + "일";
	}
	
	public static String TimeToString(Calendar calendar) {
		// 몇시(0~23) 몇분 몇초 형태의 String이 리턴되도록 구현
		return calendar.get(Calendar.HOUR_OF_DAY) + "시 " + 
				calendar.get(Calendar.MINUTE) + "분 " + 
				calendar.get(Calendar.SECOND) + "초";
	}

}
