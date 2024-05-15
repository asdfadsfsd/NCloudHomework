package homework;

public class NumberPrinterThread01 extends Thread {
	NumberPrinter  numPrinter;

	public NumberPrinter getNumPrinter() {
		return numPrinter;
	}

	public void setNumPrinter(NumberPrinter numPrinter) {
		this.numPrinter = numPrinter;
	}
	
	@Override
	public void run()
	{
		 numPrinter.numPrint1(10);
	}
}
