package homework3;

public class MiddlePhoneInfo {
	String[] names = new String[100];
	String[] phoneNums = new String[100];

	int index = 0;

	public void insertPhoneInfo(String name, String phoneNum) {
	    //매개변수로 전달된 이름과 번호를 각각의 배열에 저장하는 기능 구현
		names[index] =name;
		phoneNums[index] = phoneNum;
		index+=1;
	} 

	public void printAllPhoneInfo() {
	    //배열에 저장된 모든 이름과 번호를 순서대로 출력하는 기능 구현 
		for(int i =0; i< index; i++)
			System.out.println(names[i] +" "+phoneNums[i]);
	}

	public void printPhoneInfo(int index) {
	    //매개변수로 전달된 인덱스에 해당하는 이름과 번호 출력하는 기능 구현
		if(this.index >index)
		{
		  System.out.println(names[index] +" "+phoneNums[index]);
		}
	}
}
