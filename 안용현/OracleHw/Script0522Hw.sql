--1) 평점이 3.0에서 4.0사이의 학생을 검색하라(between and)
SELECT s.SNAME , s.AVR 
FROM STUDENT s 
WHERE s.AVR BETWEEN '3.0' AND '4.0';

--2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라(between and)
SELECT PNAME 
FROM PROFESSOR p 
WHERE HIREDATE BETWEEN To_DATE('1994-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
AND TO_DATE('1995-12-30 23:59:00', 'YYYY-MM-DD HH24:MI:SS');

--3) 화학과와 물리학과, 생물학과 학생을 검색하라(in)
SELECT s.SNAME 
FROM STUDENT s 
WHERE s.MAJOR IN ('화학', '물리학', '생물학');

--4) 정교수와 조교수를 검색하라(in)
SELECT *
FROM PROFESSOR p 
WHERE p.ORDERS in('정교수','조교수');

--5) 학점수가 1학점, 2학점인 과목을 검색하라(in)
SELECT *
FROM COURSE c 
WHERE c.ST_NUM in('1','2');

--6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라(between and)
SELECT *
FROM STUDENT s 
WHERE s.SYEAR IN ('1','2') AND s.AVR BETWEEN '2.0' AND '3.0' ORDER BY SYEAR ;

--7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라(in)
SELECT *
FROM STUDENT s 
WHERE s.MAJOR IN ('화학', '물리') AND SYEAR IN ('1','2') ORDER BY s.AVR DESC;

--8) 부임일이 1995년 이전인 정교수를 검색하라(to_date)
SELECT *
FROM PROFESSOR p 
WHERE p.HIREDATE < TO_DATE('1995-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
AND p.ORDERS = '정교수';
--**********************************************************************************
--1) 송강 교수가 강의하는 과목을 검색한다
SELECT *
FROM PROFESSOR p
JOIN COURSE c 
ON p.PNO = c.PNO 
WHERE p.PNAME = '송강';

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT *
FROM PROFESSOR p
JOIN COURSE c 
ON p.PNO = c.PNO 
WHERE p."SECTION" = '화학';

--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT *
FROM COURSE c 
JOIN PROFESSOR p 
ON c.PNO = p.PNO
WHERE c.ST_NUM ='2';

--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT *
FROM PROFESSOR p
JOIN COURSE c 
ON c.PNO = p.PNO 
WHERE p."SECTION" ='화학';

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT s.SNAME , s2."RESULT" 
FROM STUDENT s
JOIN SCORE s2 
ON s.SNO  = s2.SNO 
WHERE s.MAJOR = '화학' AND s.SYEAR = '1';

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT s.SNO , s."RESULT" 
FROM COURSE c  
JOIN SCORE s 
ON c.CNO = s.CNO 
WHERE c.CNAME = '일반화학';

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT *
FROM STUDENT s
JOIN SCORE s2 
ON s.SNO = s2.SNO
WHERE s.MAJOR = '화학' AND s.SYEAR = '1';

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT s.MAJOR , s.SYEAR , c.CNAME 
FROM STUDENT s
JOIN SCORE s2  
ON s.SNO = s2.SNO 
JOIN COURSE c 
ON s2.CNO = c.CNO 
WHERE s.MAJOR = '화학' AND s.SYEAR = '1';

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT c.CNAME , s."RESULT" , sg.GRADE , s2.SNAME 
FROM COURSE c 
JOIN SCORE s 
ON c.CNO = s.CNO
JOIN SCGRADE SG
ON s."RESULT" BETWEEN sg.LOSCORE AND sg.HISCORE 
JOIN STUDENT s2 
ON s.SNO = s2.SNO
WHERE c.CNAME ='유기화학' AND sg.GRADE = 'F';


--**********************************************************************************

--1) 학생중에 동명이인을 검색한다
SELECT s.SNAME 
FROM STUDENT s
INNER JOIN STUDENT s2 
ON s.sname = s2.sname
WHERE s.sno <> s2.SNo ;

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT *
FROM PROFESSOR p
LEFT JOIN COURSE c 
ON p.PNO = c.PNO
ORDER BY c.CNAME ;

--3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다
SELECT *
FROM COURSE c
LEFT JOIN PROFESSOR p
ON p.PNO = c.PNO
ORDER BY c.ST_NUM ;

--**********************************************************************************
--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT c.CNAME , p.PNAME 
FROM COURSE c 
JOIN PROFESSOR p 
ON c.PNO = p.PNO ;

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT s.SNAME , s2."RESULT" 
FROM STUDENT s 
JOIN SCORE s2 
ON s.SNO = s2.SNO ;

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT s.SNO , s."RESULT"  
FROM COURSE c 
JOIN SCORE s
ON c.CNO = s.CNO  
WHERE c.CNAME  = '유기화학';

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT *
FROM COURSE c 
JOIN PROFESSOR p 
on c.PNO = p.PNO 
WHERE p."SECTION" ='화학';

--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT *
FROM PROFESSOR p 
LEFT JOIN COURSE c 
ON p.PNO = c.PNO ;

--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT *
FROM PROFESSOR p 
full JOIN COURSE c 
ON p.PNO = c.PNO ;

