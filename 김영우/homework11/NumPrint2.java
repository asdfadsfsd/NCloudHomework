package review.homework11;

public class NumPrint2 extends Thread {
		private NumberPrinter pnwn;
		
		public NumberPrinter getPnwn() {
			return this.pnwn;
		}
		
		public void setPnwn(NumberPrinter pnwn) {
			this.pnwn = pnwn;
		}
		
		@Override
		public void run() {
			this.pnwn.numPrint1(20);
		}
}


