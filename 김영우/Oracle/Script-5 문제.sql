--1) 평점이 3.0에서 4.0사이의 학생을 검색하라(between and)
SELECT ST.SNO
	 , ST.SNAME
	 , SC.RESULT
	 , SCG.GRADE
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	JOIN SCGRADE SCG
	  ON RESULT BETWEEN LOSCORE AND HISCORE;

--2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라(between and)
SELECT PR.PNO
	 , PR.PNAME
	FROM PROFESSOR PR
	WHERE HIREDATE BETWEEN '1994-01-01' AND '1995-12-31';
	

--3) 화학과와 물리학과, 생물학과 학생을 검색하라(in)
SELECT SNO
	 , SNAME
	 , MAJOR
	FROM STUDENT
	WHERE MAJOR IN ('화학', '물리', '생물');

--4) 정교수와 조교수를 검색하라(in)
SELECT PNO
	 , PNAME
	 , ORDERS
	FROM PROFESSOR
	WHERE ORDERS IN ('정교수', '조교수');

--5) 학점수가 1학점, 2학점인 과목을 검색하라(in)
SELECT CNO
	 , CNAME
	 , ST_NUM
	FROM COURSE
	WHERE ST_NUM IN (1, 2);

--6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라(between and)
SELECT ST.SNO 
	 , ST.SNAME 
	 , ST.SYEAR
	 , ST.AVR
	FROM STUDENT ST
	WHERE AVR BETWEEN 2.0 AND 3.0

--7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라(in)
SELECT ST.SNO
	 , ST.SNAME
	 , ST.SYEAR
	 , ST.MAJOR
	 , SC.RESULT
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	WHERE MAJOR IN ('화학', '물리')
	  AND SYEAR IN (1, 2)
	ORDER BY RESULT DESC;

--8) 부임일이 1995년 이전인 정교수를 검색하라(to_date)
SELECT PNO
	 , PNAME
	 , ORDERS
	 , HIREDATE
	FROM PROFESSOR
	WHERE HIREDATE < TO_DATE('1995-01-01', 'YYYY-MM-DD')
	  AND ORDERS = '정교수';
-------------------------------------------

--1) 송강 교수가 강의하는 과목을 검색한다
SELECT PNAME
	 , SECTION
	FROM PROFESSOR
	WHERE PNAME = '송강';
	 

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT PNO
	 , PNAME
	 , SECTION 
	FROM PROFESSOR
	WHERE SECTION = '화학';


--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT CO.CNO
	 , CO.CNAME
	 , CO.ST_NUM
	 , P.PNAME
	FROM COURSE CO
	JOIN PROFESSOR P
	  ON CO.PNO = P.PNO 
	WHERE CO.ST_NUM = '2';


--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT P.PNO
	 , P.PNAME
	 , P.SECTION
	 , CO.CNAME
	FROM PROFESSOR P
	JOIN COURSE CO
	  ON P.PNO = CO.PNO
	WHERE SECTION = '화학';

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT ST.SNO
	 , ST.SNAME
	 , ST.SYEAR
	 , ST.MAJOR
	 , SC.RESULT 
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	WHERE MAJOR = '화학'
	  AND SYEAR = 1;

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT SC.CNO
	 , SC.RESULT
	 , CO.CNAME
	 , ST.SNO
	FROM SCORE SC
	JOIN COURSE CO
	  ON SC.CNO = CO.CNO
	JOIN STUDENT ST
	  ON ST.SNO = SC.SNO
	WHERE CNAME = '일반화학';

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT ST.SNO
	 , ST.SNAME
	 , ST.MAJOR
	 , ST.SYEAR
	 , SC.RESULT
	 , CO.CNAME
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	JOIN COURSE CO
	  ON CO.CNO = SC.CNO
	WHERE ST.MAJOR = '화학'
	  AND ST.SYEAR = 1
	  AND CNAME = '일반화학';

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT ST.SNO
	 , ST.SNAME
	 , ST.MAJOR
	 , ST.SYEAR
	 , CO.CNAME
	 , CO.CNO
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO 
	JOIN COURSE CO
	  ON CO.CNO = SC.CNO
	WHERE MAJOR = '화학'
	  AND SYEAR = 1;
	 

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT ST.SNO
	 , ST.SNAME
 	 , CO.CNAME
	 , SC.RESULT
	 , SCG.GRADE
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	JOIN COURSE CO
	  ON SC.CNO = CO.CNO
	JOIN SCGRADE SCG
	  ON SC.RESULT BETWEEN LOSCORE AND HISCORE
	WHERE CNAME = '유기화학'
	  AND SCG.GRADE = 'F';

-------------------------------------------
--1) 학생중에 동명이인을 검색한다
SELECT DISTINCT ST.SNAME
	FROM STUDENT ST
	JOIN STUDENT ST2
	  ON ST.SNAME = ST2.SNAME
	 AND ST.SNO != ST2.SNO;


--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT *
	FROM PROFESSOR
	ORDER BY SECTION;


--3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다 (COURSE)
SELECT DISTINCT CO.CNAME
	 , PR.PNAME
	 , CO.ST_NUM 
	FROM COURSE CO
	JOIN SCORE SC
	  ON SC.CNO = CO.CNO
	JOIN PROFESSOR PR
	  ON CO.PNO = PR.PNO
	ORDER BY ST_NUM DESC;
-----------------------------------------------------
--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT CO.CNAME
	 , PR.PNO
	 , PR.PNAME
	FROM COURSE CO
	JOIN PROFESSOR PR
	  ON CO.PNO = PR.PNO;

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT ST.SNO
	 , ST.SNAME
	 , SC.RESULT
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO;

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT ST.SNO
	 , ST.SNAME
	 , C.CNAME
	 , SC.RESULT
	FROM COURSE C
	JOIN SCORE SC
	  ON C.CNO = SC.CNO
	JOIN STUDENT ST
	  ON SC.SNO = ST.SNO
	WHERE C.CNAME = '유기화학';

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT ST.SNO
	 , ST.SNAME
	 , ST.MAJOR
	 , PR.PNO
	 , PR.PNAME
	FROM PROFESSOR PR
	JOIN STUDENT ST
	  ON ST.MAJOR = PR.SECTION
	WHERE MAJOR = '화학';

--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT *
	 FROM PROFESSOR;

--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT PR.PNO
	 , PR.PNAME 
	 , PR."SECTION"
 	 , CO.CNAME
	 , PR.ORDERS 
	 , PR.HIREDATE 
	 FROM PROFESSOR PR
	 JOIN COURSE CO
	   ON PR.PNO = CO.PNO;








