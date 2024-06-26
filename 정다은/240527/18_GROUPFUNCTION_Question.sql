--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR
	, AVG(AVR)
	FROM STUDENT ST
	GROUP BY MAJOR
	HAVING MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR
	, AVG(AVR)
	FROM STUDENT ST
	GROUP BY MAJOR
	HAVING MAJOR != '화학'
	   AND AVG(AVR) >= 2.0;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT ST.SNO 
	, ST.SNAME
	, AVG(SC."RESULT")
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	GROUP BY ST.SNO, ST.SNAME
	HAVING AVG("RESULT") >= 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT P.PNAME 
	, SUM(C.ST_NUM)
	FROM COURSE C
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO 
	GROUP BY P.PNAME 
	HAVING SUM(C.ST_NUM) >= 3;

--5) 기말고사 평균 성적이 핵화학 과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT C.CNAME 
	, P.PNAME 
	, AVG(SC."RESULT")
	FROM COURSE C
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO 
	JOIN SCORE SC
	  ON SC.CNO = C.CNO
	GROUP BY C.CNAME , P.PNAME 
	HAVING AVG(SC."RESULT") > (
								SELECT AVG(S."RESULT")
									FROM COURSE CO
									JOIN SCORE S
									  ON S.CNO = CO.CNO
									 AND CO.CNAME LIKE '핵화학'
								);

--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요(부서번호, 부서명, 인원수)
SELECT D.DNO 
	, D.DNAME 
	, COUNT(E.ENO)
	FROM DEPT D
	JOIN EMP E
	  ON D.DNO = E.DNO
	GROUP BY D.DNO , D.DNAME 
	HAVING COUNT(E.ENO) >= 4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB 
	, AVG(SAL)
	FROM EMP
	GROUP BY JOB 
	HAVING AVG(SAL) >= 3000;

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT MAJOR 
	, SYEAR 
	FROM STUDENT
	GROUP BY MAJOR, SYEAR 
	HAVING COUNT(SNO) >= 5;