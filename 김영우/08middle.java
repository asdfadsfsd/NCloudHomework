package chap99_homework.homework08;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class middle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		1. 사용자가 입력한 날짜(yyyy-MM-dd 형식으로 입력받음)에 add 메소드로 3일뒤로 변경하고
//	     yyyy-MM-dd 형식으로 출력하세요. (SimpleDateFormat 클래스 사용. SimpleDateFormat의
//	     parse() 메소드를 이용하면 String -> Calendar로 변환가능)

		
		Scanner sc = new Scanner(System.in);
		
//		[1] simpledateformat 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		System.out.println("날짜를 입력하세요. 형식은 yyyy-MM-dd 입니다.");

//		[2] 사용자가 입력한 String을 dateString으로 지정 
		String dateString = sc.nextLine();
		
//		[3] catch 문에서 parse를 이용할 때 설명
//		try-catch 구문은 예외 처리를 위해 사용됩니다. 
//		try 블록 내의 코드는 예외가 발생할 수 있는 코드입니다. 
//		만약 예외가 발생하면 해당 예외를 캐치하여 처리할 수 있는 catch 블록이 실행됩니다.
		
//		parse 메서드는 문자열을 다른 형식으로 변환하는 메서드 중 하나이며, 
//		여기서는 SimpleDateFormat 클래스의 parse 메서드를 사용하여 문자열을 Date 객체로 변환하려고 합니다.
//		하지만 parse 메서드는 문자열을 지정된 형식에 맞게 변환할 수 없는 경우 ParseException 예외를 던집니다. 
//		따라서 parse 메서드를 사용할 때는 이 예외를 적절하게 처리해 주어야 합니다.
//		보통은 try-catch 블록을 사용하여 parse 메서드 호출 부분을 감싸고, ParseException 예외를 캐치하여 오류를 처리합니다.
		try {
// 		1. SimpleDateFormat 객체 생성
// 		SimpleDateFormat 객체를 생성할 때 생성자의 매개변수로 지정할 날짜 포맷을 전달한다.
//		SimpleDateFormat은 String 값을 받아서 date 값으로 result 하기 때문에
//		date에 대입을 해야한다.

//		위에서 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		만들어준 형식을 parse를 통해 simpledateformat을 date형식으로 변환시킨다.

		Date date = simpleDateFormat.parse(dateString);

		Calendar calendar = Calendar.getInstance();

//		setTime : date 형식을 calendar 로 변환 
		calendar.setTime(date);
		
//		3일 추가
		calendar.add(Calendar.DATE, 3);
		System.out.println("3일 뒤 날짜: " + simpleDateFormat.format(calendar.getTime()));
		} catch(ParseException e) {
			System.out.println("날짜 형식이 틀렸습니다. 다시 입력하세요.");
		}


		System.out.println("---------------------------");
		
//		---------------------------------------------
//	2. 길이가 8이며 한글로 된 요일이 저장되어 있는 요일 배열을 만들고
//	   사용자가 입력한 날짜(yyyy-MM-dd 형식으로 입력받음)의 요일을 한글로 출력하세요.

		String[] dayArr = {"", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};

//		[1] calendar 객체 생성
		

//		[1] simpledateformat 객체 생성 / 형식 지정
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");

		System.out.println("날짜를 입력하세요. 형식은 yyyy-MM-dd 입니다.");
		String userInput = sc.nextLine();
		
		try {
			Date date1 = simpleDateFormat.parse(userInput);
			Calendar calendar2 = Calendar.getInstance();
			calendar2.setTime(date1);
			System.out.println("입력한 날짜는 " + 
					calendar2.get(Calendar.YEAR) + "-" +
					((calendar2.get(Calendar.MONTH) + 1) < 10 
							? "0" + (calendar2.get(Calendar.MONTH) + 1) 
							: (calendar2.get(Calendar.MONTH) + 1)) + "-" +
					(calendar2.get(Calendar.DATE) < 10 
							? "0" + calendar2.get(Calendar.DATE)
							: calendar2.get(Calendar.DATE))
				);
			
			System.out.println("오늘은 " +
					dayArr[calendar2.get(Calendar.DAY_OF_WEEK)]
			);
			
			} catch(ParseException e) {
				System.out.println("날짜 형식이 틀렸습니다. 다시 입력하세요.");
				
			}
 		

		
//	3. 두 개의 날짜 데이터 2023-03-15 20:31:45와 2021-07-08 11:58:04의 차이를
//	     시 분 초 형태로 나타내시오.
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		
//		달에 +1을 해줘야 함
		cal1.set(2023, 2, 15);
		cal2.set(2021, 6, 8);
		
		// getTimeInMills(): 현재 날짜 시간을 밀리세컨트로 변환(long)
		// 두 날짜의 차이 = 날짜1.getTimeInMills() - 날짜2.getTimeInMills() (long) 밀리초
		long diff = cal1.getTimeInMillis() - cal2.getTimeInMillis();
		
		// 밀리초를 시, 분, 초로 변환
		long diffYear = diff / ((long)1000 * 60 * 60 * 24 * 365);
		diff %= ((long)1000 * 60 * 60 * 24 * 365);
		long diffDate = diff / ((long)1000 * 60 * 60 * 24);
		diff %= ((long)1000 * 60 * 60 * 24);
		long diffTime = diff / ((long)1000 * 60 * 60);
		diff %= ((long)1000 * 60 * 60);
		long diffMin = diff / ((long)1000 * 60);
		diff %= ((long)1000 * 60);
		long diffSec = diff / ((long)1000);
		
		System.out.println("cal2부터 cal1까지 " + diffYear + "년 " + diffDate + "일 " +
			diffTime + "시간 " + diffMin + "분 " + diffSec + "초가 지났습니다.");
		
		
	}

}
