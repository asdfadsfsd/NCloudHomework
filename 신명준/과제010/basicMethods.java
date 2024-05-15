package homeWork10.basic;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class basicMethods {
  
	
    public static void main(String[] args) {
        //1
    	GenericCla<Integer> test1 = new GenericCla<Integer>();
    	test1.setT(1);
    	System.out.println(test1.getT());
    	//2
    	System.out.println(add(12354,21321));
    	//3
    	List<Integer> test3List = new ArrayList<Integer>();
    	test3List.add(1);
    	test3List.add(145);
    	test3List.add(134);
    	System.out.println(sum(test3List));
    	//4
    	printArr(test3List);
    	//5
    	Double[] arr= {1.2,3.3,2.3,1.4,4.5};
    	System.out.println(getMin(arr));
    	//6
    	Map<Integer,Long> map = new HashMap<Integer,Long>();
    	map.put(12, 232322323232L);
    	map.put(12, 232322322L);
    	map.put(12, 2323223232382L);
    	map.put(12, 2323223232L);
    	map.put(12, 2323232L);
    	printOverTen(map);
    	//7
    	Contry c =Contry.KOR;
    	c.notifyFood("KOR");
    
    
    }
    //2. public static <T> String add(T t1, T t2) 제네릭 메소드를 정의하고 매개변수로 어떤 값이 들어오던 문자열 결합연산이 돼서 스트링값으로 리턴하도록 만드세요.
    public static <T> String add(T t1, T t2)
    {
    	return t1.toString() + t2.toString();
    }
    // 3. public static Integer sum(List<?> list) 와일드 카드를 이용하여 리스트의 총합을 구하는 메소드를 구현하세요.
    public static <T> Integer sum(List<T> list)
    {
    	int sumVal =0;
    	for ( var obj : list) {
    		sumVal += Integer.valueOf((int)obj);
		}
    	return sumVal;
    }
    //4. 어떤 배열이던지 받아서 인덱스가 3의 배수인 요소만 출력하는 메소드 void printArr을 구현하세요.(와일드 카드 사용)
    public static void printArr(List<?> list)
    {
    	for (int i = 0; i < list.size(); i++) {
			if(i != 0 && i%3 == 0)
				System.out.println(list.get(i));
			
		}
    }
    //5. Number를 상속받은 클래스타입의 배열만 받아서 배열의 최소값을 구해서 리턴하는 메소드 getMin을 구현하세요.
    public static <T extends Number> Integer  getMin(T[] arr)
    {
    	int min = Integer.MAX_VALUE;
    	for (T t : arr) {
			Math.min(min,t.intValue());
		}
    	return min;
    }
    //6. Map을 어떤형태로든 받아서 value를 String으로 변경했을 때 길이가 10이상되는 key를 출력하는 메소드 void printOverTen을 구현하세요.
    public static <K, V> void printOverTen(Map<K,V> map)
    {
    	for (var en : map.entrySet()) {
			if( String.valueOf(en.getValue()) != null  &&  String.valueOf(en.getValue()).length() >= 10)
			{
				System.out.println(en.getKey());
			}
		}
    }

    //7. KOR, CHI, JAP, USA 네 개의 상수를 갖는 enum을 생성하고 첫 번째 값은 "나라 한글명"이고 두 번째 값은 "대표음식"으로 지정한다. public void notifyFood(String country) 메소드를 만들고 country 값과 동일한 한글명인 나라의 음식을 다음과 같이 출력하도록 구현하세요. country에 "중국"이 들어오면 "중국의 대표음식은 짜장면입니다."라고 나오도록 하세요. (각 국의 음식은 한국=불고기, 중국=짜장면, 일본=초밥, 미국=햄버거)
	 
}
