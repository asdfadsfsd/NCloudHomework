package homwork6;

public class middle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        //1
		String testText1 ="가나다라";
		String testText2 ="마바사";
		System.out.println(solve1(testText1));
		System.out.println(solve1(testText2));
		
		//2
		char[] arr = {'b', 'c', 's', 'i', 'i', 'o', 'q', 'n', 't', 'm', 'l', 't'};
		System.out.println( String.format("%c%c%c", arr[0], arr[4] , arr[8]) );
		System.out.println(String.format("%c%c%c",arr[1], arr[5] , arr[9]) );
		System.out.println(String.format("%c%c%c",arr[2], arr[6] , arr[10]) );
		System.out.println(String.format("%c%c%c",arr[3], arr[7] , arr[11]) );
		
		//3
		double initalMoney =10000;
		for (int i = 0; i < 10; i++) {
			initalMoney *=1.1;
			
		}
		System.out.println(initalMoney);
		
	}
	
	
	public static String solve1(String str)
	{
		String goal ="";
	    if(str.length()%2 ==0)
	    {
	    	goal += str.charAt(str.length()/2 -1);
	    	goal += str.charAt(str.length()/2);
	    }
	    else
	    {
	    	goal += str.charAt(str.length()/2);
	    }
		return goal;
	}

}
