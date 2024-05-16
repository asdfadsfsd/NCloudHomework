package homework01;

import java.util.Scanner;

public class _advance_ {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        /*1. . 사용자가 입력한 금액을 오만원권, 만원권, 오천원권, 천원권, 500원동전, 100원동전, 50원동전, 10원동전, 1원동전 각 몇개로 변환되는지 출력하세요.
   출력 개수는 단위가 큰 것 순서로 계산합니다
   예를 들어 78670원이면 <오만원 1매, 만원 2매, 오천원 1매, 천원 3매, 500원 1개, 100원 1개, 50원 1개, 10원 2개> 입니다.

2. 369게임을 작성합니다.
   1~99까지의 정수를 입력받고
   3,6,9중 하나가 있으면 "박수짝"을 출력하고
   2개가 있으면 "박수짝짝"을 출력하세요
   예를 들어 13은 "박수짝"
   36인 경우는 "박수짝짝"을 출력하면 됩니다.

3. 다음과 같이 출력하세요.
    *
   ***
  *****
 *******
**********/
		
		
		Scanner sc = new Scanner(System.in);
		//1\
		
		int val = sc.nextInt();
		int[] money_val ={50000,10000,5000,1000,500,100,50,10,1};
		int[] money_num = {0,0,0,0,0,0,0,0,0};
		
		for (int i = 0; i < money_val.length; i++) {
			money_num[i] = val/ money_val[i];
			val = val% money_val[i];
		}
		
	    if(money_num[0] != 0)
	    	System.out.print("오만원 "+money_num[0]+"매 ");
	    if(money_num[1] != 0)
	    	System.out.print("만원 "+money_num[1]+"매 ");
	    if(money_num[2] != 0)
	    	System.out.print("오천원 "+money_num[2]+"매 ");
	    if(money_num[3] != 0)
	    	System.out.print("천원 "+money_num[3]+"매 ");
	    if(money_num[4] != 0)
	    	System.out.print("500원 "+money_num[4]+"매 ");
	    if(money_num[5] != 0)
	    	System.out.print("100원 "+money_num[5]+"매 ");
	    if(money_num[6] != 0)
	    	System.out.print("50원 "+money_num[6]+"매 ");
	    if(money_num[7] != 0)
	    	System.out.print("10원 "+money_num[7]+"매 ");
	    if(money_num[8] != 0)
	    	System.out.print("1원 "+money_num[8]+"매 ");
		
		
		//2
		String str_val =sc.nextLine();
		int dd_num =0;
    	for (int i = 0; i < str_val.length(); i++) {
			if((int)(str_val.charAt(i) -'0')%3 == 0)
				dd_num += 1;	
		}
    	if(dd_num == 1)
	    	System.out.print("박수짝");
    	else if(dd_num == 2)
	    	System.out.print("박수짝짝 ");
		
		
	    //3
	    int nval = 5;
	    for (int i = 0; i < nval; i++) {
	    	int st = nval-i;
	    	int ed = nval+i;
	    	for (int j = 0; j < nval*2; j++) {
	    		if(j>=st &&  j<=ed)
	    		{
	    			System.out.print("*");
	    		}
	    		else
	    		{
	    			System.out.print(" ");
	    		}
			}
	    	System.out.println("");
		}
		
		
		
	}
}
