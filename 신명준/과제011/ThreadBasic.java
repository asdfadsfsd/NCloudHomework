package homework;

import java.util.Iterator;

public class ThreadBasic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		//1. 메인스레드는 1~20까지 3과 4의 공배수를 출력하는 작업을 하고 1~20까지의 숫자중 30의 약수를 출력하는 서브 스레드를 하나 갖는다. 각각의 스레드를 실행하십시오.
		//2. 1번 문제에서 join()메소드를 이용해서 서브 스레드가 먼저 실행돼서 끝난 후에 메인 스레드가 실행되도록 구현하세요.

        Thread t = new Thread() {
        	public void run()
        	{
        		for (int i = 1; i <= 30; i++) {
					if(30%i ==0)
						System.out.println(i);
						
				}
        	}
        };
        
        
        for (int i = 1; i <= 20; i++) {
			if(i%3 ==0 && i%4 == 0 )
				System.out.println(i);
				
		}
        
        t.start();
        try {
        	t.join();
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        //3,4,5
        
        NumberPrinterThread01 t2 = new  NumberPrinterThread01();
        NumberPrinterThread02 t3  = new  NumberPrinterThread02();
        NumberPrinter nt = new  NumberPrinter();
        
        t2.setNumPrinter(nt);
        t3.setNumPrinter(nt);
        
        System.out.println("----");
        t2.start();
        t3.start();
        
        
        
        
	}

}
