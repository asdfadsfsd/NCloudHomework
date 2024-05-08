package homework7;

import java.util.Scanner;

public class Middle7 {

	public static void main(String[] args) {
		//1
		Scanner sc = new Scanner(System.in);
		StringBuffer stb2 = new StringBuffer(30);
		stb2.append("hello");
		int remain = stb2.capacity() - stb2.length();
		for(int i = 0; i  < remain;i++)
		{
			if(i%3 ==0)
				stb2.append('b');
			else if(i%3 ==1)
				stb2.append('i');
			else if(i%3 ==2)
				stb2.append('o');
			
		}
		System.out.println(stb2);
		//2
		StringBuffer stb3 = new StringBuffer("유용한 클래스는 많다. 다양한 라이브러리를 활용한다.");
		stb3.reverse();
		System.out.println(stb3.charAt(sc.nextInt()));
		
		
	}

}
