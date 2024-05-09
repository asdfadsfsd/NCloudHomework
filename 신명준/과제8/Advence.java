package homwork8;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Advence {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//01
		 Calendar ltd1 =  Calendar.getInstance();
		 ltd1.set(2001,12, 19);
		 for (int i = 2001; i <= 2022; i++) {
			 
			if(i%400 == 0 || i%4 == 0 && i%100 != 0)
				ltd1.add(ltd1.DATE, 1);
		}
		System.out.println( ltd1.get(ltd1.MONTH)+"월" + ltd1.get(ltd1.DATE)+"일" );
		
		 //02
		 Scanner sc = new  Scanner(System.in);
		 SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
		 Calendar ltd2 =  Calendar.getInstance();
		 Calendar ltd3 =  Calendar.getInstance();
		 try
			{
				 Date d1 = fd.parse(sc.nextLine());
				 Date d2 = fd.parse(sc.nextLine());
				 ltd2.setTime(d1);
				 ltd3.setTime(d2);
				 
				 long prev = Math.min( ltd2.getTimeInMillis() , ltd3.getTimeInMillis());
				 long timeGap = ltd2.getTimeInMillis() - ltd3.getTimeInMillis();
				 long day = 1000*60*60*24;
				 timeGap =Math.abs(timeGap);
				 
				 for (int i = 0; i < (int)(timeGap/day); i++) {
					 System.out.println(fd.format(new Date(prev)));
					 prev+=day;
				}
			}
		 catch(Exception e) {
			 
		 }
		 //3
		 List<Integer> arr = new ArrayList<>();
		 arr.add(23);
		 arr.add(34);
		 arr.add(45);
		 arr.add(87);
		 arr.add(21);
		 int max =arr.get(0) + arr.get(1);
		 for (int i = 0; i < arr.size()-1; i++) {
			max = Math.max(max, arr.get(i) + arr.get(i+1));
	  	 }
		 System.out.println(max);
		 
		 //4
		 List<Integer> arr2 = new ArrayList<>();
		 List<Integer> checker  = new ArrayList<>();
		 arr2.add(23);
		 arr2.add(34);
		 arr2.add(45);
		 arr2.add(87);
		 arr2.add(21);
		 for (int i = 0; i < arr.size(); i++) {
			 for (int j = 0; j < arr.size(); j++) {
					if(i != j)
					{
						if(checker.indexOf(arr2.get(i) + arr2.get(j)) == -1)
							checker.add(arr.get(i) + arr2.get(j));
						
					}
			 }
		 }
		 System.out.println(checker.size());
		 
		 
		 
	}

}
