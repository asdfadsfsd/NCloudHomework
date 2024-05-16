package homeWork10.basic;

//1. 12달을 상수로 만들어서 enum을 선언하고 첫 번째 값은 평년일 때 그 달의 일수 두 번째 값은 윤년일 때 그 달의 일수로 설정하고 사용자가 년도를 입력하면 해당 년도의 1, 2, 3, 4, 5월의 일수의 총합을 출력하는 메소드를 구현하세요. sumDays(int year)
public enum Advence {

	MON1(31,31),
	MON2(28,29),
	MON3(31,31),
	MON4(30,30),
	MON5(31,31),
	MON6(30,30),
	MON7(31,31),
	MON8(31,31),
	MON9(30,30),
	MON10(31,31),
	MON11(30,30),
	MON12(31,31);
	
	private int normalYearDay;
	private int leafYearDay;
	
	private Advence(int normalYearDay, int leafYearDay) {
		this.normalYearDay = normalYearDay;
		this.leafYearDay = leafYearDay;
	}
	
	
	public int getNormalYearDay() {
		return normalYearDay;
	}


	public void setNormalYearDay(int normalYearDay) {
		this.normalYearDay = normalYearDay;
	}


	public int getLeafYearDay() {
		return leafYearDay;
	}


	public void setLeafYearDay(int leafYearDay) {
		this.leafYearDay = leafYearDay;
	}


	public void sumDays(int year)
	{
		int sum =0;
		if(year %400 == 0  || year %100 != 0 && year %4 == 0)
		{
		 sum += Advence.MON1.getNormalYearDay();
		 sum += Advence.MON2.getNormalYearDay();
		 sum += Advence.MON3.getNormalYearDay();
		 sum += Advence.MON4.getNormalYearDay();
		 sum += Advence.MON5.getNormalYearDay();
		}
		else {
		 sum += Advence.MON1.getLeafYearDay();
		 sum += Advence.MON2.getLeafYearDay();
		 sum += Advence.MON3.getLeafYearDay();
		 sum += Advence.MON4.getLeafYearDay();
		 sum += Advence.MON5.getLeafYearDay();
		}
		System.out.println(sum);
	}
	
}
