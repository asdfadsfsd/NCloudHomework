package review.homework11;

public class Basic {
//	1. 메인스레드는 1~20까지 3과 4의 공배수를 출력하는 작업을 하고 1~20까지의 숫자중 30의 약수를 출력하는 서브 스레드를 하나 갖는다. 각각의 스레드를 실행하십시오.


	public static void main (String[] args) {
		Thread thread = new Thread(new Runnable() {
			public void run() {
				
				for(int i = 1 ; i <= 20 ; i++) {
					if(30 % i == 0) {
						System.out.println("30의 약수: " + i + ", ");
					}
					
				}
			}
		});
		
		thread.start();

//		2. 1번 문제에서 join()메소드를 이용해서 서브 스레드가 먼저 실행돼서 끝난 후에 메인 스레드가 실행되도록 구현하세요.
		try {
			thread.join();
		} catch(InterruptedException ie) {
			System.out.println(ie.getMessage()); 
		}
		
		for(int i = 1 ; i <= 20 ; i++) {
			if(i % 3 == 0 && i % 4 == 0) {
				System.out.println(i);
			}
			
			try {
				Thread.sleep(500);
			} catch(InterruptedException ie) {
				System.out.println(ie.getMessage()); 
			}
		}
	}
	

	
	
	


	
	
	

	
	
	
	
//	5. 3, 4번 문제에서 wait와 notify를 이용하여 스레드 두개가 각각 한 번씩 출력하도록 수정하세요.
	
	
	
	
	
	
	
}
