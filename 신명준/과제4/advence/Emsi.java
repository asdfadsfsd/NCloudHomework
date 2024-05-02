package homework4.advence;

public class Emsi extends Employee{
    
	private  int hireYear;
	

	
	@Override
	public double getMonthPay() {
		return this.hireYear/12;
		
	}
	
	public void showEmployeeInfo() {
		System.out.println("Jungu [hireYear=" + hireYear + ", eno=" + eno + ", name=" + name + ", pay=" + pay + ", type=" + type + "]");
	}

}
