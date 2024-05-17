package homework13;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Integer> intList = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			intList.add((int)(Math.random()*10));
		}	
		intList.stream().map(var -> var*3).forEach(var-> System.out.println(var));
		
		Scanner sc = new Scanner(System.in);
		List<String> strList = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			strList.add(sc.nextLine());
		}	
		strList.stream().filter(var -> var.length() >= 5).forEach(var-> System.out.println(var));
		
		List<String> strList2 = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			strList2.add(sc.nextLine());
		}	
		strList.stream().filter(var -> {
			boolean flag =false;
			for(int i =0 ; i< var.length(); i++)
			  if('a' <= var.charAt(i) && 'z' >= var.charAt(i) || 'A' <= var.charAt(i) && 'Z' >= var.charAt(i))
			  {
				 flag = true;
				 break;
			  }
		    return flag;
		}).forEach(var-> System.out.println(var));
		
		
	}

}
