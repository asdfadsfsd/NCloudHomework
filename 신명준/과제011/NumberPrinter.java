package homework;

public class NumberPrinter {
   private  int num;

   public int getNum() {
	   return num;
   }

   public void setNum(int num) {
	   this.num = num;
   }
   
   public synchronized void numPrint1(int num)
   {
	   setNum(num);
	   for (int i = num; i <= 50; i++) {
		  if(i%3 == 0 && i != 0)
		  {
		   System.out.println(i);
		   notify();
		   try {
			  wait();
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		  }
	   }
   }
   
   public synchronized void numPrint2(int num)
   {
	   setNum(num);
	   for (int i = num; i <= 100; i++) {
		  if(i%5 == 0 && i%7 == 0)
		  {
		   System.out.println(i);
		   notify();
		   try {
			  wait();
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		  }
	   }
   }
   
}
