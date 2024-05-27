--1) 각 학과별 학생 수를 검색하세요
SELECT MAJOR
	 , COUNT(*)
	FROM STUDENT
	GROUP BY MAJOR;

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT MAJOR
	 , AVG(AVR) * (4.0/4.5)
	FROM STUDENT
	GROUP BY MAJOR
	HAVING MAJOR IN ('화학', '생물');

--3) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT ORDERS
	 , COUNT(*)
	FROM PROFESSOR
	WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) >= 120
	GROUP BY ORDERS;

--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT CNAME
	 , SUM(ST_NUM)
	FROM COURSE
	WHERE CNAME LIKE '%화학%'
	GROUP BY CNAME;

--5) 학과별 기말고사 평균을 성적순(성적 내림차순)으로 검색하세요
SELECT ST.MAJOR
	 , AVG(SC.RESULT)
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	GROUP BY ST.MAJOR
	ORDER BY AVG(SC.RESULT) DESC;

--6) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT D.DNO
	 , TRUNC(AVG(E.SAL), 2)
	FROM DEPT D
	JOIN EMP E
	  ON D.DNO = E.DNO
	 GROUP BY D.DNO
	 HAVING D.DNO = 30;

--7) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요(학과, 학년, 평점)
SELECT ST.MAJOR
	 , ST.SYEAR
	 , MAX(SC.RESULT)
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	GROUP BY ST.MAJOR, ST.SYEAR
	HAVING ST.MAJOR = '물리';
	
--------------------------------------------

--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY MAJOR
MINUS
SELECT MAJOR
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY MAJOR
	HAVING MAJOR = '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY MAJOR
	HAVING AVG(AVR) >= 2.0
MINUS
SELECT MAJOR
	 , AVG(AVR)
	FROM STUDENT
	GROUP BY MAJOR
	HAVING MAJOR = '화학'; 

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT ST.SNO
	 , ST.SNAME
	 , AVG(SC.RESULT)
	FROM STUDENT ST
	JOIN SCORE SC
	  ON ST.SNO = SC.SNO
	GROUP BY ST.SNO, ST.SNAME
	HAVING AVG(SC.RESULT) >= 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT P.PNO
	 , P.PNAME
	 , CO.ST_NUM
	FROM PROFESSOR P
	JOIN COURSE CO
	  ON P.PNO = CO.PNO
	GROUP BY P.PNO, P.PNAME, CO.ST_NUM 
	HAVING CO.ST_NUM >= 3;


--5) 기말고사 평균 성적이 핵화학 과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요 ---- PASS
SELECT C.CNAME
	 , P.PNO
	 , P.PNAME
	 , AVG(SC.RESULT)
	FROM COURSE C
	JOIN PROFESSOR P
	  ON C.PNO = P.PNO
	JOIN SCORE SC
	  ON SC.CNO = C.CNO
	GROUP BY C.CNAME, P.PNO, P.PNAME
	HAVING AVG(SC.RESULT)


--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요(부서번호, 부서명, 인원수)
SELECT D.DNO
	 , D.DNAME
	 , COUNT(E.ENO)
	FROM DEPT D
	JOIN EMP E
	  ON E.DNO = D.DNO
	GROUP BY D.DNO, D.DNAME
	HAVING COUNT(E.ENO) >= 4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB
	 , AVG(SAL)
	FROM EMP
	GROUP BY JOB
	HAVING AVG(SAL) >= 3000;

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT SYEAR
	 , MAJOR
	 , COUNT(*)
	FROM STUDENT
	GROUP BY SYEAR, MAJOR
	HAVING COUNT(*) >= 5
	ORDER BY MAJOR;
	 

--------------------------------------------

--1) 각 학과별 학년별 학생 수를 ROLLUP함수로 검색하세요
SELECT MAJOR
	 , SYEAR
	 , COUNT(*)
	FROM STUDENT
	GROUP BY ROLLUP(MAJOR, SYEAR);

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하는 데 화학과 생물이 열로 만들어지도록 하세요.(PIVOT 사용)
SELECT *
	FROM (
		SELECT MAJOR
			 , AVR
			FROM STUDENT
	)
	PIVOT(
		AVG(AVR * (4.0/4.5))
			FOR MAJOR IN(
				'화학' AS "화학",
				'생물' AS "생물"
			)
	);
	

--3) 학과별 학생이름을 ,로 구분하여 성적순으로(내림차순) 조회하세요.(LISTAGG 사용)
SELECT MAJOR
	 , COUNT(*)
	 , LISTAGG(SNAME, ', ')
	 WITHIN GROUP (ORDER BY AVR DESC)
	FROM STUDENT
	GROUP BY MAJOR;

--4) 부서별 업무별 연봉의 평균을 검색하세요(부서와 업무 컬럼의 그룹화 여부도 같이 검색, GROUPING 사용)
SELECT DNO
	 , JOB
	 , AVG(SAL)
	 , COUNT(*)
	 , GROUPING(DNO)
	 , GROUPING(JOB)
	 , GROUPING_ID(DNO, JOB)
	FROM EMP 
	GROUP BY CUBE(DNO, JOB);

----------------------------------------------

--1) 각 과목의 과목번호, 과목명, 담당 교수의 교수번호, 교수명을 검색하라(NATURAL JOIN 사용)
SELECT C.CNO
	 , C.CNAME
	 , PNO
	 , P.PNAME
	FROM COURSE C
	NATURAL JOIN PROFESSOR P;

--2) 화학과 학생의 기말고사 성적을 모두 검색하라(JOIN USING 사용)
SELECT SNO
	 , ST.MAJOR
	 , SC.RESULT
	FROM STUDENT ST
	JOIN SCORE SC
	USING(SNO)
	GROUP BY SNO, ST.MAJOR, SC."RESULT"
	HAVING ST.MAJOR = '화학';

--3) 화학 관련 과목을 강의하는 교수의 명단을 검색한다(NATURAL JOIN 사용) --- PASS
SELECT PNO
	 , P.PNAME
	 , PR.SECTION
	FROM PROFESSOR P
	NATURAL JOIN PROFESSOR PR
	WHERE PR.SECTION = '화학';

--4) 화학과 1학년 학생의 기말고사 성적을 검색한다(NATURAL JOIN 사용)
SELECT SNO
	 , ST.SYEAR
	 , ST.MAJOR
	 , SC.RESULT
	FROM STUDENT ST
	NATURAL JOIN SCORE SC
	WHERE ST.SYEAR = 1
	  AND ST.MAJOR = '화학';
	  

--5) 일반화학 과목의 기말고사 점수를 검색한다(JOIN USING 사용)
SELECT CNO
	 , CO.CNAME
	 , SC.RESULT
	FROM COURSE CO
	JOIN SCORE SC
	USING(CNO)
	WHERE CO.CNAME = '일반화학';

--6) 화학과 1학년 학생이 수강하는 과목을 검색한다(NATURAL JOIN 사용)
SELECT SNO
	 , CNO
	 , ST.MAJOR
	 , ST.SYEAR
	 , CO.CNAME
	FROM STUDENT ST
	NATURAL JOIN SCORE SC
	NATURAL JOIN COURSE CO
	WHERE MAJOR = '화학'
	  AND SYEAR = 1;
	
----------------------------------------------

--1) 다중 컬럼 IN절을 이용해서 기말고사 성적이 80점 이상인 과목번호, 학생번호, 기말고사 성적을 모두 조회하세요. ---- PASS
SELECT SC.SNO
	 , C.CNO
	 , SC.RESULT
	FROM SCORE SC
	JOIN COURSE C
	  ON C.CNO = SC.CNO 
	WHERE (SC.SNO, C.CNO) IN (
		SELECT SC.CNO
			 , C.CNO
			FROM SCORE SC
			JOIN COURSE C
			  ON C.CNO = SC.CNO
			WHERE SC.RESULT >= 80
	);

--2) 다중 컬럼 IN절을 이용해서 화학과나 물리학과면서 학년이 1, 2, 3학년인 학생의 정보를 모두 조회하세요.
SELECT SNO
	 , SNAME 
	 , MAJOR
	 , SYEAR
	FROM STUDENT
	WHERE (MAJOR, SYEAR) IN (('화학', 1), ('화학', 2), ('화학', 3), ('물리', 1), ('물리', 2), ('물리', 3));


--3) 다중 컬럼 IN절을 사용해서 부서가 10, 20, 30이면서 보너스가 1000이상인 사원의 사원번호, 사원이름, 부서번호, 부서이름, 업무, 급여, 보너스를 
--   조회하세요.(서브쿼리 사용)
SELECT E.ENO
	 , E.ENAME
	 , E.DNO
	 , D.DNAME
	 , E.JOB
	 , E.SAL
	 , E.COMM
	FROM EMP E
	JOIN DEPT D
	  ON E.DNO = D.DNO
	WHERE (E.ENO, D.DNO) IN (
		SELECT E.ENO
			 , D.DNO
			FROM EMP E
			JOIN DEPT D
			  ON E.DNO = D.DNO
		   WHERE E.COMM >= 1000  
	)
	  AND E.DNO IN (10, 20, 30);

--4) 다중 컬럼 IN절을 사용하여 기말고사 성적의 최고점이 100점인 과목의 과목번호, 과목이름, 학생번호, 학생이름, 기말고사 성적을 조회하세요.(서브쿼리 사용)
	 -- PASS