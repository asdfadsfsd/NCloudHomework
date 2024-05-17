package homework13;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Stream;

public class middle {

	public static void main(String[] args) {
		 Scanner sc = new Scanner(System.in);
         //1
		 List<Student> studentList = new ArrayList<Student>();
		 studentList.add(new Student(1, "홍길동", 100));
		 studentList.add(new Student(2, "임꺽정", 75));
		 studentList.add(new Student(3, "장길산", 86));
		 studentList.add(new Student(4, "정도전", 97));
		 studentList.add(new Student(5, "이순신", 95));
		 Stream<Student> ststrema = studentList.stream().filter(student -> student.getScore() >= 95);
		 Stream<Student> ststrema2 =  ststrema.peek(var-> var.setGrade("A+"));
		 //3
		 List<Character> charList = new ArrayList<Character>();
		 for (int i = 0; i < 10; i++) {
			 charList.add(sc.nextLine().charAt(0));
		 }
		 charList.stream().map(var ->{
			 if('a' <= var && 'z' >= var)
			 {
			    	return (char)(var-32);
			 }
			 else if('A' <= var && 'Z' >= var)
			 {
				 return (char)(var+32);
			 }
			 else
				 return var;
		 }).forEach(var -> System.out.println(var));
		 
		 
		 
		 
	}

}
