package homework.basic;

import java.util.Iterator;

public class Reverse {
	 public String reverseString(String str)
	 {
		 
		 char[] newStr = new char[str.length()];
		 for (int i = 0; i < newStr.length; i++) {
			 newStr[i] =str.charAt(str.length()-i-1);
		 }
		 String returnStr = new String(newStr);
		 return returnStr;
	 }
}
