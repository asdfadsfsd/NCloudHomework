package homework9;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1. Map<String, Integer>을 하나 생성하여 key는 알파벳(대소문자 구분) value는 해당 알파벳의 유니코드 값을 Integer형태로 저장하세요.
		Map<String, Integer> englinshMap = new HashMap<String, Integer>();
		for (int i = 'A'; i <= 'Z'; i++) {
			englinshMap.put("%c".formatted((char)i), i);
		}
        for (int i = 'a'; i <= 'z'; i++) {
        	englinshMap.put("%c".formatted((char)i), i);
		}
		
		//2. 이름과 전화번호를 쌍으로 하는 주소록을 HashMap으로 구현하고, 특정 이름의 전화번호를 조회하는 기능을 구현하세요.
        Map<String, String> phonNumMap = new HashMap<String, String>();
        phonNumMap.put("AAA", "010-0000-0000");
        phonNumMap.put("BBB", "010-0000-1111");
        phonNumMap.put("CCC", "010-0000-2222");
        phonNumMap.put("DDD", "010-0000-3333");
        phonNumMap.put("EEE", "010-0000-4444");
        
        Scanner sc =  new Scanner(System.in);
        String name =sc.nextLine();
        if(phonNumMap.get(name) == null )
        {
        	System.out.println("empty");
        }
        else
        {
        	System.out.println(phonNumMap.get(name));
        }
        
        
	}
	

}
