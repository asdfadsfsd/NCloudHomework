package homwork8;

import java.util.ArrayList;
import java.util.Calendar;

import  java.util.List;
import java.util.Scanner;

public class Basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Calendar ca1 = Calendar.getInstance();
        Calendar ca2 = Calendar.getInstance();
        List<Integer> li3 = new  ArrayList<Integer>();
        
        //1
        ca1.set(2020, 3, 8);
        ca1.add(ca1.YEAR, 5);
        ca1.add(ca1.MONTH, 2);
        ca1.add(ca1.DATE, 3);
        System.out.println(ca1.get(ca1.YEAR) +"-" + ca1.get(ca1.MONTH) +"-" + ca1.get(ca1.DATE));
        
        //2
        
        ca2.set(2023, 3, 24);
        System.out.println(ca2.get(ca1.YEAR) +"년 " + ca2.get(ca1.MONTH) +"월 " + ca2.get(ca1.DATE)+"일" + ca2.get(ca1.HOUR_OF_DAY)+"시" + ca2.get(ca1.MINUTE)+"분" + ca2.get(ca1.SECOND)+"초");
        
        //3
        Scanner sc = new   Scanner(System.in);
        for (int i = 0; i < 5; i++) {
		   li3.add(sc.nextInt());
		}
        
	}

}
