package homework.basic;

public class Middle12 {
   public static void main (String[] args)
   {
	   //중복제거
	   String str1 = "aaabbccab";
	   String str ="";
	   for (int i = 0; i < str1.length(); i++) {
		   boolean flag = true;
		   for (int j = 0; j < str.length(); j++) {
				  if(str1.charAt(i) ==str.charAt(j))
				  {
					  flag = false;
					  break;
				  }
			   	
		    }
		    if(flag == true)
	   	       str += str1.charAt(i);
	   }
	   
	   
	   
	   System.out.println(str);
	   //3,5
	   String str2="aaaaaaaaaaa";
	   String Newstr = "";
	   for (int i = 0; i < str2.length(); i++) {
		    if(i%3 == 0 && i != 0)
		    {
		    	Newstr +='3';
		    }
		    else if(i%5 ==0 && i != 0)
		    {
		    	Newstr +='5';
		    }
		    else if (i%15 ==0 && i != 0)
		    {
		    	Newstr +="35";
		    }
		    else {
		    	Newstr += str2.charAt(i);
		    }
		
	    }
	   System.out.println(Newstr);
   }
}
