package homework7;

import java.util.Scanner;

public class Basic7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
        //1

		Scanner sc = new Scanner(System.in);
		StringBuffer stb = new StringBuffer();
		
		stb.append(sc.nextLine());
		stb.append(sc.nextLine());
		stb.append(sc.nextLine());
		System.out.println(stb);
		
		//2
		StringBuffer stb2 = new StringBuffer(30);
		stb2.append("hello");
		int remain = stb2.capacity() - stb2.length();
		for(int i = 0; i  < remain;i++)
		{
			stb2.append('a');
		}
		System.out.println(stb2);
		
	}

}
