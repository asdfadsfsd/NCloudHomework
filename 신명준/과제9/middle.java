package homework9;



import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

public class middle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1. 학생이름을 key로 시험점수를 value로 가지는 Map<String, Integer>를 생성하고
		//  4명의 학생 데이터를 입력한 후 4명 중 최고 점을 맞은 학생의 이름과 점수을 출력하세요.(이름 : 90)
		Scanner sc = new Scanner(System.in);
		Map<String, Integer> student = new HashMap<String, Integer>();
		
		for (int i = 0; i < 4; i++) {
			System.out.print("이름: ");
			String name = sc.nextLine();
			System.out.print("점수: ");
			int score= sc.nextInt();
			student.put(name, score);
			sc.nextLine();
		}
		
		String bestMan="";
		int bestScore =0;
		for (Entry<String,Integer> val : student.entrySet()) {
			if(bestScore < val.getValue())
			{
				bestMan = val.getKey();
				bestScore =val.getValue();
			}
		}
		System.out.println("이름: %s  점수: %d".formatted(bestMan,bestScore ));
		
		
		//2. 매개변수로 Map<Integer, Integer>이 주어졌을 때 key, value의 곱이 가장 큰 Entry를 리턴하는 메소드 getMaxMul을 구현하세요.
		 Map<Integer, Integer> intMap = new HashMap<Integer, Integer>();
		 intMap.put(4, 3);
		 intMap.put(2, 7);
		 intMap.put(5, 3);
		 intMap.put(7, 9);
		 intMap.put(6, 2);
		 int max  = Integer.MIN_VALUE;
		 for (Entry<Integer,Integer> val : intMap.entrySet()) {
			 
			 max = Math.max(max,val.getKey() *val.getValue() );
	    }
		System.out.println(max);
		
		
		//3. Map<Integer, Integer>을 매개변수로 받아서 key는 정순 출력, value는 역순 출력하는 printKVDesc라는 메소드를 구현하세요. 
		//{1: 3, 2: 4, 3: 5}
		//1 : 5
		//2 : 4
		//3 : 3
		//intMap 그대로
		List<Integer> vals = new ArrayList<Integer>(intMap.values());
		List<Integer> keys =new ArrayList<Integer>(intMap.keySet());
		Collections.sort(vals);
		Collections.sort(keys);
		for (int i = 0; i < vals.size(); i++) {
			System.out.println("%d: %d".formatted( keys.get(i) ,vals.get(vals.size()-1-i)));
		}
		
		
		
	}

}
