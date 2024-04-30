package homework2;

import java.util.Random;
import java.util.Scanner;

public class RockScissPaper {
	private Scanner sc = new Scanner(System.in);

	private Random rd = new Random();

	

	private boolean isExit = false;

	

	private int gameCnt = 0;

	private int winCnt = 0;

	private int drawCnt = 0;

	private int loseCnt = 0;

	
	//게임을 시작하는 메소드
	public void start() {

      System.out.println("가위바위보 시작");
      while(true)
      {
    	  System.out.println("가위 0 바위 1 보 2  종료 3");
    	  int user =sc.nextInt();
    	  if(user == 3)
    		  break;
    	  int com =rd.nextInt(3);
    	  printCom(com);
    	  judgeWDL(user,com);
    	  
      }
      
      System.out.println("가위바위보 종료");
      System.out.print( this.gameCnt+ "전 ");
      System.out.print( this.winCnt+ "승 ");
      System.out.print( this.drawCnt+ "무 ");
      System.out.print( this.loseCnt+ "패 ");
      
	}

	

	//승무패 판단해주는 메소드

	public void judgeWDL(int user, int com) {
		
		this.gameCnt +=1;
        if(user == com) //같을때
        	this.drawCnt += 1;
        else if( (user+1)%3 == com) //가위-바위  ,바위-보, 보-가위
        	this.loseCnt +=1;
        else
        	this.winCnt +=1;
  
	}

	

	//컴퓨터 가위, 바위, 보 출력해주는 메소드

	public void printCom(int com) {
		if(com == 0)
		 System.out.println("가위");
		else if(com == 1)
			 System.out.println("바위");
		else if(com == 2)
			 System.out.println("보");
	}

}
