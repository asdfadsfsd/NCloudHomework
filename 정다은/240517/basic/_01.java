package basic;

import java.util.ArrayList;
import java.util.List;

public class _01 {
// 1. List<Integer> intList를 생성하고 10개의 랜덤값(1~10)을 저장합니다. 
//	intList를 Stream으로 만들어서 각 요소에 곱하기 3을 한 요소로 새로운 스트림을 만들어서 출력하세요.

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Integer> intList = new ArrayList<>();
		
		for(int i = 0; i < 10; i++) {
			intList.add((int)(Math.random() * 10 + 1));
		}
		
		System.out.println(intList);
		intList.stream().map(num -> num * 3).forEach(num -> System.out.print(num + " "));
	}

}
