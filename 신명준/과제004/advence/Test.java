package homework4.advence;

public class Test {
   public static void main(String[] args)
   {
	
	  int[] arr = ArrayUtility2.concat(new int[] {1, 2}, new int[] {3, 4});
	  
	  for(int i : arr) {
		  System.out.println(i);
	  }
	  
	  arr = ArrayUtility2.remove(new int[] {3, 4, 1, 2,6}, new int[] {3, 4,3, 4, 3, 4, 5,5,5,5,5,5});
	  
	  for(int i : arr) {
		  System.out.println(i);
	  }
   }
}
