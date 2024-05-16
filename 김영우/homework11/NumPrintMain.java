package review.homework11;

public class NumPrintMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NumberPrinter pnwn = new NumberPrinter();
		
		NumPrint1 numPrint1 = new NumPrint1();
		NumPrint2 numPrint2 = new NumPrint2();
		
		numPrint1.setPnwn(pnwn);
		numPrint2.setPnwn(pnwn);
		
		numPrint1.start();
		numPrint2.start();

	}

}
