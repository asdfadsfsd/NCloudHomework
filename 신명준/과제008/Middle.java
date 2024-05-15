package homwork8;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;



public class Middle {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		String str = sc.nextLine();
		SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
		try
		{
			 Calendar ltd =  Calendar.getInstance();
			 ltd.setTime(fd.parse(str));
			 ltd.add(ltd.DATE, 3);
             System.out.println(fd.format(ltd.getTime()));
			 
			System.out.println(fd.parse(str));
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
		//2
		String[] date = {"","일","월","화","수","목","금","토"};
		String str2 = sc.nextLine();
		try
		{
			 Date d = fd.parse(str);
			 Calendar ltd =  Calendar.getInstance();
			 ltd.setTime(d);
			 System.out.println(date[ltd.get(ltd.DAY_OF_WEEK)]);
		}catch(Exception e)
		{
			
		
		}
		
		//2023-03-15 20:31:45와 2021-07-08 11:58:04
		try
		{
			
			 Calendar ltd1 =  Calendar.getInstance();
			 ltd1.set(2023,03,1, 20,31,45);
			 Calendar ltd2 =  Calendar.getInstance();
			 ltd2.set(2021,07,8, 11,5804);
			 
			 long timeGap = ltd1.getTimeInMillis() - ltd2.getTimeInMillis();
			 System.out.println(timeGap);
			 int h= (int)( timeGap / (long)(1000*60*60));
		     timeGap %= (long)(1000*60*60);
		     System.out.println(timeGap);  
		     int m = (int)(timeGap/ (long)(1000*60));
		     timeGap %= (long)(1000*60);
		     System.out.println(timeGap); 
		     int s= (int)(timeGap/(long)1000);  
		     System.out.println("%d시 %d분 %d초".formatted(h,m,s));
			 
			 
		}catch(Exception e)
		{
			
		
		}
		
		
		
	} 
}
