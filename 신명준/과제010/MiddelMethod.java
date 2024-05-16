package homeWork10.basic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class MiddelMethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        
		//1
		Map<Integer,Long> map = new HashMap<Integer,Long>();
    	map.put(12, 232322323232L);
    	map.put(12, 232322322L);
    	map.put(12, 2323223232382L);
    	map.put(12, 2323223232L);
    	map.put(12, 2323232L);
    	System.out.println(getMaxMul(map));
    	
    	//2
        Cal<Integer> ca = new Cal<Integer>();
        Integer[] a= {1,2};
        System.out.println(ca.add(a));
		
        
        //3
		CAFE cafe = CAFE.COLDBRE;
		cafe.solve();
		
		//4
		Map<Integer,Integer> map4 = new HashMap<Integer,Integer>();
		map4.put(12, 123);
    	map4.put(17, 11);
    	map4.put(15, 111);
    	map4.put(134, 2);
    	map4.put(42, 23);
		System.out.println(getOverHundr(map4));
		
		//5
		List<Integer> test5List = new ArrayList<Integer>();
    	test5List.add(1);
    	test5List.add(145);
    	test5List.add(134);
    	test5List.add(123);
    	test5List.add(112);
    	test5List.add(145);
    	test5List.add(142);
    	test5List.add(166);
    	test5List.add(112);
    	test5List.add(123);
    	test5List.add(1767);
		TList<Integer> t = new  TList<Integer>();
		t.li = test5List;
		t.splitList();
		System.out.println(t.li1);
		System.out.println(t.li2);
		
		//ad1
		Advence ad = Advence.MON1;
		ad.sumDays(2022);
		
	}
    
	//1. key와 value 모두 Number를 상속받은 클래스만 받고 매개변수로 Map이 주어졌을 때 key, value의 곱이 가장 큰 Entry를 리턴하는 메소드 getMaxMul을 구현하세요.
	public static <K extends Number ,V extends Number> Entry<K,V>   getMaxMul( Map<K,V> map)
	{   int max = Integer.MIN_VALUE;
	    Entry<K,V> maxEn = null;
	    for (Entry<K,V> en : map.entrySet()) {
	    	int val = en.getKey().intValue() *en.getValue().intValue();
			if( val >max)
			{
				max = val;
				maxEn = en;
			}
		}
		return maxEn;
	}
	
	
	//3. 커피 메뉴를 갖는 enum을 생성하고W 4개로 지정한다. 가격이 값이 되고 순서대로 2000, 3000, 4000, 4500으로 지정한다. 메뉴의 총 가격을 계산하는 추상 메소드를 정의하고 각각의 상수에서 구현하는데 아메리카노(아이스 300 추가), 라떼(아이스 500 추가), 모카(휘핑 1000 추가), 콜드브루(시럽 200 추가) 모든 메뉴 옵션 없는 주문은 지정한 가격대로 진행된다. totalPrice(int optionOrder, int normalOrder) 옵션 추가 잔수와 일반 메뉴 잔수를 받아서 각 메뉴의 가격을 계산하는 추상 메소드 구현한다. 아아 2잔 뜨아 1잔 아라 1잔 휘핑 모카 2잔 콜드브루 2잔일 때의 가격을 출력하세요.
      //CAFE
    
	//4. Map<Integer, Integer>을 매개변수로 받아서 List<Entry<K, V>>를 리턴하는 메소드 getOverHundr를 구현하세요. 매개변수 Map에는 key는 50~60까지 value는 15~25까지 넣어주고 키와 밸류의 곱셈의 결과가 1000을 넘는 Entry만 List에 저장합니다.
	public static  List<Entry<Integer,Integer>> getOverHundr(Map<Integer, Integer> map)
	{
		List<Entry<Integer ,Integer> > li = new ArrayList<Entry<Integer ,Integer>>();
		for (Entry<Integer, Integer> entry :  map.entrySet()) {
			if( entry.getKey() * entry.getValue() >= 1000)
			{
				 li.add(entry);
			}
				
		}
		return li;
	}
	//5. 제네릭 타입의 리스트를 멤버 변수로 갖는 TList라는 제네릭 클래스를 만들고 splitList라는 메소드를 만들고 멤버변수인 List를 반반씩 두개의 리스트로 나누는 기능을구현하세요.(리스트의 요소 개수가 짝수면 반반 동일한 개수로, 홀수면 첫 번째 리스트의 요소가 한 개씩 많게)
	
	
	
}
