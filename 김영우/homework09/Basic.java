package review.homework09;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		
//		[1번문제]
//		[1] 새로운 Map 생성 = keyValue 메서드와 동일
		Map<String, Integer> correct = keyValue(sc);
		
	
//		[3] 사용자가 입력한 것을 출력
		Set<Entry<String, Integer>> entrySet = correct.entrySet();
		
		Iterator<Entry<String, Integer>> iterator = entrySet.iterator();
		
		while(iterator.hasNext()) {
			Entry<String, Integer> entry = iterator.next();
			
			System.out.println("Key 값은: " + entry.getKey() + ", Value 값은: " + entry.getValue());

		}
		
		
		
		
		
		
		
		
		
		
//		[2번문제]
		
		
//		[1] phoneNumberCheck 메서드 이용
		
		Map<String, String> phoneBook2 = phoneNumberCheck(sc);

		
		
		
		
		sc.close();
		
	}

	
	
	
	
	
	
	
	
//	1. Map<String, Integer>을 하나 생성하여 key는 알파벳(대소문자 구분) value는 해당 알파벳의 유니코드 값을 Integer형태로 저장하세요.

//	[1번문제 메서드]
	public static Map<String, Integer> keyValue(Scanner sc) {
		

//		[1] Map 생성
		Map<String, Integer> map = new HashMap<>() ;
		
//		[2] key 값: 알파벳(대소문자 구분), value 값: 해당 알파벳 유니코드 지정
		while(true) {
			System.out.println("문자를 입력하세요. 문자 범위는 'a-z' 혹은 'A-Z' 입니다.");
			
			String inputUserKey = sc.nextLine();
			
			if(inputUserKey.length() == 1 && ((inputUserKey.charAt(0) >= 'a' && inputUserKey.charAt(0) <= 'z') || 
					(inputUserKey.charAt(0) >= 'A' && inputUserKey.charAt(0)<= 'Z'))) {
	
				Integer userKeyUnicode = (int) inputUserKey.charAt(0);
				map.put(inputUserKey, userKeyUnicode);
				return map;
			}
			else {
				System.out.println("문자열을 잘못 입력하셨습니다.");
				continue;
			}
			
			
		}
		
	}
//	2. 이름과 전화번호를 쌍으로 하는 주소록을 HashMap으로 구현하고, 특정 이름의 전화번호를 조회하는 기능을 구현하세요.
	
	public static Map<String, String> phoneNumberCheck (Scanner sc) {

		Map<String, String> phoneBook = new HashMap<>();
		
		while(true) {
			System.out.println("---------전화번호부----------");
			System.out.println("0. 이름, 전화번호 입력");
			System.out.println("1. 전화번호 찾기");
			System.out.println("2. 종료");
			
			int userInput = sc.nextInt();
			sc.nextLine();
			
			switch(userInput) {
			case 0:
				String pattern = "010.*-[0-9]{4}-[0-9]{4}";
				Pattern pt = Pattern.compile(pattern);
				
				System.out.println("이름을 입력하세요.");
				String userName = sc.nextLine();
				Matcher matcher = null;
				String userPhoneNumber = "";
				
//				전화번호 형식이 틀리면 입력되지 않도록 지정
				do {
					System.out.println("전화번호를 입력하세요. [형식: 010-xxxx-xxxx]");
					userPhoneNumber = sc.nextLine();
					
					matcher = pt.matcher(userPhoneNumber);
					
					if(!matcher.matches()) {
						System.out.println("형식이 올바르지 않습니다. 다시 입력하세요.");
					}
					
				} while(!matcher.matches());
				
				phoneBook.put(userName, userPhoneNumber);
				 
				break;
				
			case 1:

				
				System.out.println("찾고자 하는 이름을 입력하세요.");
				userName = sc.nextLine();
				if(phoneBook.containsKey(userName)) {
					System.out.println("전화번호: " + phoneBook.get(userName));
					break;
				} else {
					System.out.println("찾으시는 사용자가 없습니다.");
					break;
				}
				
				
			case 2:
				System.exit(0);
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력하세요.");
				continue;
			
			}
		
			
		}

		

	}
	
	
	
	
	
	
	
	
	
}
