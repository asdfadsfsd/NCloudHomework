package basic;

public class _01 {
//	1. 매개변수로 받아온 정수배열에서 짝수만 찾아서 출력하는 printEvenNum을 람다식으로 구현하세요. 
//	PrintNumber 함수형 인터페이스 생성, printEnvenNum(int[] numArr) 추상 메소드로 선언.

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		print(arr -> {
			for(int i = 0; i < arr.length; i++) {
				if(arr[i] % 2 == 0) {
					System.out.print(arr[i] + " ");
				}
			}
		});
	}

	public static void print(PrintNumber printNumber) {
		
		int[] numArr = new int[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		
		printNumber.printEvenNum(numArr);
	}
}
