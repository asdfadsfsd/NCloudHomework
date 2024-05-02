package homework4.advence;

public class Jungu extends Employee{
	
	private int bonus;
	
	@Override
	public double getMonthPay() {
		// TODO Auto-generated method stub
		return (bonus +this.pay)/12;
	}
	
	public void showEmployeeInfo() {
		System.out.println("Jungu [bonus=" + bonus + ", eno=" + eno + ", name=" + name + ", pay=" + pay + ", type=" + type + "]");
	}

	
	
}
