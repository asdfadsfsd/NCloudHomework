package homwork12;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

public class Middle {
	public static void main(String[] args) {
		StringBuilder sb1 = new StringBuilder("sadsafdsa");
		StringBuilder sb2 = new StringBuilder("ufkjhgkjgk");
		
		//1
		System.out.println(combineStrBuilder(sb1,sb2,(str1,str2) ->{
			StringBuilder newStr =new StringBuilder();
			newStr.append(str1);
			newStr.append(str2);
			return newStr.reverse();
		} ));
		
		//2
		StringBuilder newStr = new StringBuilder();

		newStr = appendSb(sb1,newStr::append);
		newStr = appendSb(sb2,newStr::append);
		newStr = reverseSb(newStr,StringBuilder::reverse);
		System.out.println(newStr);
		
		
		
		//3
		Integer[] numArr = {1,2,3,4,5,6,7,8,9};
		System.out.println(IntArrUtils.getMax(numArr, arr->{
			Integer[] sub = arr.clone();
			Arrays.sort(arr);
			return arr[arr.length-1];
		}));
		System.out.println(IntArrUtils.getMin(numArr, arr->{
			Integer[] sub = arr.clone();
			Arrays.sort(arr);
			return arr[0];
		}));
		System.out.println(IntArrUtils.getMid(numArr, arr->{
			Integer[] sub = arr.clone();
			Arrays.sort(arr);
			return arr[arr.length/2];
		}));
		
	}
	
	public static StringBuilder combineStrBuilder(StringBuilder sb1, StringBuilder sb2, StringBuilderUtils strUni)
	{
		return  strUni.combineStrBuilder(sb1, sb2);
	}
	
	public static  StringBuilder appendSb(StringBuilder sb1,middle2 m)
	{
		return m.toolstr(sb1);
	}
	
	public static StringBuilder reverseSb(StringBuilder sb1,middle2 m )
	{
		return m.toolstr(sb1);
	}
}
