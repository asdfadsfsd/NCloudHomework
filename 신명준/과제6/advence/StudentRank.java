package homwork6.advence;

import homework.basic.ComStudent;
import homework.basic.EngStudent;
import homework.basic.MathStuden;
import homework.basic.Student;

public class StudentRank {
   
	
	// 학과별 배열을 만들어주는 메소드
		public void makMajorArr(Student[] stArr, int index) {
			// 학과별로 새로운 배열 생성
			MathStuden[] mathStudentArr = new MathStuden[index] ;
			EngStudent[] engStudentArr = new EngStudent[index] ;
			ComStudent[] comStudentArr = new ComStudent[index] ;
			int m =0,e=0,c=0;
			
			for (int i = 0; i < index; i++) {
				if()
				    mathStudentArr[m++] = (MathStuden)stArr[i];
				else if()
					EngStuden[e++]  = (EngStudent)stArr[i];
				else if()
					ComStudent[c++]  = (ComStudent)stArr[i];
				
			}
			
			// 성적순으로 출력
			printRankArray(mathStudentArr,engStudentArr,comStudentArr);
		}
		
		// 학과별 배열을 성적순대로 정렬하고 출력하는 메소드
		public void majorRank(Student[] stArr, String major) {
			
			//버블 정렬
			for (int i = 0; i < stArr.length; i++) {
				for (int j = 0; j < stArr.length; j++) {
				   if (stArr[i].getAvg() < stArr[i].getAvg())
				   {
					   Student sub = stArr[i];
					   stArr[i] =stArr[j] ;
					   stArr[j] = stArr[i];
				   }
					
				}
			}
			
			
			//정렬
			System.out.println(major +"성적표");
			for (Student student : stArr) {
				student.printInfo()
			}
		}
		
		// 학과별 배열을 모두 받아서 majorRank로 전달하는 메소드
		public void printRankArray(MathStuden[] mathStudentArr, EngStudent[] engStudentArr,
				ComStudent[] comStudentArr) {
			majorRank(mathStudentArr, "수학");
			majorRank(engStudentArr, "영어");
			majorRank(comStudentArr, "컴공");
		}

}
