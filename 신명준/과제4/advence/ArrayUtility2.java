package homework4.advence;

import javax.swing.plaf.SliderUI;

public class ArrayUtility2 {
	 
	 private ArrayUtility2() {};
	
	 static int[] concat(int[] s1, int[] s2) // s1과 s2를 연결한 새로운 배열 리턴
	 {
		 int[] newArr = new int[s1.length + s2.length];
		 int index =0;
		 for (int i : s1) {
			newArr[index] =i;
			index++;
		 }
		 for (int i : s2) {
				newArr[index] =i;
				index++;
		 }
		 return newArr;
	 }
	 
	 static int[] remove(int[] s1, int[] s2) // s1에서 s2배열의 숫자를 모두 삭제한 새로운 배열 리턴
	 {
		int[] newArr = new int[s1.length];
		int index =0;
		for (int val1 : s1) {
			boolean flag = true;
			for(int val2 : s2 )
			{
				if(val2 == val1)
				{
					flag =false;
					break;
				}
			}
			if(flag)
			  newArr[index++] = val1;
		}
		
		int[] newArr2 = new int[index];
        for(int i =0;i<newArr2.length;i++)
		 newArr2[i] = newArr[i];
		return newArr2;
	 }
}
