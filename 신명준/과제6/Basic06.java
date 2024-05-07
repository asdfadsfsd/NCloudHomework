package homwork6;

public class Basic06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1
		String testText1 ="가가ㅏㄴ안아나나ㅏ가가ㅏ바바바가나나";
		
		int sum =0;
	    for (int i = 0; i < testText1.length(); i++) {
			if(testText1.charAt(i) =='가' || testText1.charAt(i) =='바'){ 
				sum+=1;
			};
		}
	    
	    if(sum != 0) System.out.println(sum);
	    else System.out.println("가, 바가 존재하지 않습니다.");
	    
	    //2
	    String testText2="dfabdflbakjbfjdsfDSAFDSAFWWDAFgfva";
	    String goal ="";
	    char[] block = {'a', 'e', 'i', 'o', 'u','A', 'E', 'I', 'O', 'U'};
	    for (int i = 0; i < testText2.length(); i++) {
		  
	      boolean flag = true;
		  for (int j = 0; j < block.length; j++)
		  {
			  if(testText2.charAt(i) == block[j])
			  {
				  flag = false;
				  break;
			  }
		  }
		  if(flag == true)
			  goal +=testText2.charAt(i);
		}
	    System.out.println(goal);
	    
		
		//3
        System.out.println(Math.round(16.459 *100)/100.0);
	}

}
