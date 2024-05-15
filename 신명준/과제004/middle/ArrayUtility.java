package homework4.middle;

public class ArrayUtility {
	  private ArrayUtility() {};
	  
	  public static double[] intToDouble(int[] source)
	  {
		  double[] darr = new double[source.length];
		  for (int i = 0; i < darr.length; i++) {
			darr[i] = (double)source[i];
			
		 }
		  return darr;
	  }
	  
	  public static int[] doubleToInt(double[] source)
	  {
		  int[] arr = new int[source.length];
		  for (int i = 0; i < arr.length; i++) {
			arr[i] = (int)source[i];
			
		 }
		  return arr;
	  
	  }
	  
}
