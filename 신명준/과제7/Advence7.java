package homework7;

import java.util.Scanner;



public class Advence7 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		StringBuffer stb = new StringBuffer(sc.nextLine());
		
		int st =0;
		while(st < stb.length())
		{
			int ed = st;
			char val = stb.charAt(st);
			for (int i = st+1; i < stb.length(); i++) {
				if(val ==stb.charAt(i))
				  ed  = i;
				else
					break;
			}
			if(st != ed)
			 stb.replace(st, ed, "");
			st++;
		}
		
		System.out.println(stb);
		
	}
}
