--1) 모든 학생의 정보를 검색해라
SELECT *
	FROM STUDENT;

--2) 모든 과목의 정보를 검색해라
SELECT *
	FROM COURSE;

--3) 기말고사 시험점수를 검색해라
SELECT "RESULT" 
	FROM SCORE;
	
--4) 학생들의 학과와 학년을 검색해라
SELECT MAJOR 
	, SYEAR 
	FROM STUDENT;

--5) 각 과목의 이름과 학점을 검색해라
SELECT CNAME 
	, ST_NUM 
	FROM COURSE;

--6) 모든 교수의 직위를 검색해라
SELECT ORDERS 
	FROM PROFESSOR;


--1) 각 학생의 평점을 검색하라(별칭을 사용)
SELECT SNO AS "학번"
	, SNAME AS "이름"
	, AVR AS "평점"
	FROM STUDENT;

--2) 각 과목의 학점를 검색하라(별칭을 사용)
SELECT CNO AS "과목코드"
	, CNAME AS "과목명"
	, ST_NUM AS "학점"
	FROM COURSE;

--3) 각 교수의 지위를 검색하라(별칭을 사용)
SELECT PNAME AS "이름"
	, ORDERS AS "지위"
	FROM PROFESSOR;

--4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별칭을 사용)
SELECT ENAME AS "이름"
	, sal * 1.1 AS "연봉"
	FROM emp;

--5) 현재 학생의 평균 평점은 4.0만점이다. 이를 4.5만점으로 환산해서 검색하라(별칭을 사용)
SELECT SNO AS "학번"
	, SNAME AS "이름"
	, AVR / 4.0 * 4.5 AS "평균평점"
	FROM STUDENT;

--1) '__학과인 __학생의 현재 평점은 __입니다' 형태로 학생의 정보를 출력하라
SELECT MAJOR || '학과인 ' || SNAME || '학생의 현재 평점은 ' || TO_CHAR(AVR, '0.00') || '입니다.' AS "안내문"
	FROM STUDENT;


--2) '__과목은 __학점 과목입니다.' 형태로 과목의 정보를 출력하라
SELECT CNAME  || '과목은 ' || ST_NUM || '학점 과목입니다.' AS "안내문"
	FROM COURSE;

--3) '__교수는 __학과 소속입니다.' 형태로 교수의 정보를 출력하라
SELECT PNAME ||'교수는 ' || "SECTION" || '학과 소속입니다.' AS "안내문"
	FROM PROFESSOR;

--4) 학교에는 어떤 학과가 있는지 검색한다(학생 테이블 기반으로 검색한다)
SELECT DISTINCT MAJOR 
	FROM STUDENT;

--5) 학교에는 어떤 학과가 있는지 검색한다(교수 테이블 기반으로 검색한다)
SELECT DISTINCT "SECTION" 
	FROM PROFESSOR;

--6) 교수의 지위는 어떤 것들이 있는지 검색한다
SELECT DISTINCT ORDERS 
	FROM PROFESSOR;

--1) 성적순으로 학생의 이름을 검색하라
SELECT SNAME
	FROM STUDENT
	ORDER BY AVR DESC;

--2) 학과별 성적순으로 학생의 정보를 검색하라
SELECT *
	FROM STUDENT
	ORDER BY MAJOR, AVR DESC;

--3) 학년별 성적순으로 학생의 정보를 검색하라
SELECT *
	FROM STUDENT
	ORDER BY SYEAR , AVR DESC;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
SELECT *
	FROM STUDENT
	ORDER BY MAJOR, SYEAR DESC , AVR DESC;

--5) 학점순으로 과목 이름을 검색하라
SELECT CNAME 
	FROM COURSE
	ORDER BY ST_NUM;

--6) 각 학과별로 교수의 정보를 검색하라
SELECT *
	FROM PROFESSOR
	ORDER BY "SECTION";

--7) 지위별로 교수의 정보를 검색하라
SELECT *
	FROM PROFESSOR
	ORDER BY ORDERS ;

--8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
SELECT *
	FROM PROFESSOR
	ORDER BY "SECTION", HIREDATE ;

--1) 화학과 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE MAJOR LIKE '화학';

--2) 평점이 2.0 미만인 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE AVR < 2.0;

--3) 관우 학생의 평점을 검색하라
SELECT AVR AS "관우의 성적"
	FROM STUDENT
	WHERE SNAME LIKE '관우';

--4) 정교수 명단을 검색하라
SELECT PNAME AS "정교수 명단"
	FROM PROFESSOR
	WHERE ORDERS  LIKE '정교수';

--5) 화학과 소속 교수의 명단을 검색하라
SELECT PNAME 
	FROM PROFESSOR
	WHERE "SECTION" LIKE '화학';

--6) 송강 교수의 정보를 검색하라
SELECT *
	FROM PROFESSOR
	WHERE PNAME LIKE '송강';

--7) 학년별로 화학과 학생의 성적을 검색하라
SELECT SNAME
	, SYEAR  
	, MAJOR 
	, AVR 
	FROM STUDENT
	WHERE MAJOR LIKE '화학'
	ORDER BY AVR DESC;

--8) 2000년 이전에 부임한 교수의 정보를 부임일순으로 검색하라
SELECT *
	FROM PROFESSOR
	WHERE HIREDATE < TO_DATE('2000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
	ORDER BY HIREDATE;

--9) 담당 교수가 없는 과목의 정보를 검색하라
SELECT *
	FROM COURSE
	WHERE COURSE.PNO IS NULL;

--1) 유공과와 생물과, 식영과 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE MAJOR IN ('유공', '생물', '식영');

--2) 화학과가 아닌 학생중에 1학년 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE MAJOR != '화학'
	  AND SYEAR = 1;

--3) 물리학과 3학년 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE MAJOR = '물리'
	  AND SYEAR = 3;

--4) 평점이 2.0에서 3.0사이인 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE AVR BETWEEN 2.0 AND 3.0
	ORDER BY AVR DESC ; 

--5) 교수가 지정되지 않은 과목중에 학점이 3학점인 과목을 검색하라
SELECT *
	FROM COURSE
	WHERE COURSE.PNO IS NULL
	  AND ST_NUM = 3;

--6) 화학과 관련된 과목중 학 점이 2학점 이하인 과목을 검색하라
SELECT *
	FROM COURSE
	WHERE CNAME LIKE '%화학%'
	  AND ST_NUM = 2;

--7) 화학과 정교수를 검색하라
SELECT *
	FROM PROFESSOR
	WHERE "SECTION" LIKE '화학'
	   AND ORDERS LIKE '정교수';

--8) 물리학과 학생중에 성이 사마씨인 학생을 검색하라
SELECT *
	FROM STUDENT
	WHERE MAJOR LIKE '물리'
	  AND SNAME LIKE '사마%';

--9) 성과 이름이 각각 1글자인 교수를 검색하라
SELECT *
	FROM PROFESSOR
	WHERE PNAME LIKE '__';

