package homework9;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

public class advence {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<Character, Integer> map = new HashMap<Character, Integer>() ;
		String s= "sadhbzsahcbdsakjvcbxzkjvbfakjvbfdkjvknzbvcxzbzbkjfdzbvkjfnbvjfdsafab";
		for (int i = 0; i < s.length(); i++) {
			char val = s.charAt(i);
			if(map.get(val) == null)
				map.put(val, 1);
			else
				map.put(val, map.get(val)+1);
		}
		int max =0;
		char chr ='a';
		for (Entry<Character, Integer> val :  map.entrySet() ) {
			if(max < val.getValue())
			{
				max =val.getValue();
				chr  =val.getKey();		
			}
		}
		System.out.println("%c %d 개".formatted(chr,max));
			
		
		
	}

}
