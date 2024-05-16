package homwork12;

public class Basic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] numArr = {1,2,3,4,5,6,7,8,9};
		printEvenNum(numArr,arr ->{
			  for (int i : arr) {
				 if(i%2 == 0)
				  System.out.println(i);
			   }
			}
		 );
	}
    
	public static void printEvenNum(int[] arr,PrintNumber pr)
	{
		pr.printEnvenNum(arr);
	}
}
