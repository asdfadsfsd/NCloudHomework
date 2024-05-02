package homework4.advence;

public class Gayak extends Employee {
    
	int workDay;
	
	@Override
	public double getMonthPay() {
		// TODO Auto-generated method stub
		return workDay *pay;
	}
	
	public void showEmployeeInfo() {
		System.out.println("Jungu [workDay=" + workDay + ", eno=" + eno + ", name=" + name + ", pay=" + pay + ", type=" + type + "]");
	}

}
