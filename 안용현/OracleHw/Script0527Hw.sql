--1) 각 학과별 학생 수를 검색하세요
SELECT COUNT(*)
FROM STUDENT s 
GROUP BY MAJOR ;

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT MAJOR , AVG(AVR / 4 * 4.5) 
FROM STUDENT s 
GROUP BY MAJOR 
HAVING MAJOR IN('화학','생물');

--3) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT p.ORDERS , COUNT(ORDERS) 
FROM PROFESSOR p
WHERE TRUNC(SYSDATE, 'YYYY') - TRUNC(HIREDATE , 'YYYY') >= 10
GROUP BY p.ORDERS;

--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요***********************
SELECT cs.ST_NUM , SUM(ST_NUM) 
FROM COURSE cs
WHERE cs.CNAME LIKE '%화학%'
GROUP by cs.ST_NUM ;

--SELECT SUM(ST_NUM) 
--FROM COURSE c 
--GROUP BY (SELECT cs.ST_NUM
--			FROM COURSE cs
--			WHERE cs.CNAME LIKE '%화학%');
		
--5) 학과별 기말고사 평균을 성적순(성적 내림차순)으로 검색하세요
SELECT major , AVG(avr) 
FROM STUDENT s
GROUP BY s.MAJOR
ORDER BY avg(avr) DESC ;

--6) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT ROUND( AVG(e.SAL) , 2)
FROM EMP e 
GROUP BY e.DNO 
HAVING e.DNO = '30';

--7) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요(학과, 학년, 평점)
SELECT s.MAJOR , s.SYEAR , MAX( s.AVR )
FROM STUDENT s 
GROUP BY s.SYEAR , s.MAJOR 
HAVING s.MAJOR = '물리';

--****************************

--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT s.MAJOR , AVG(AVR) 
FROM STUDENT s 
GROUP BY s.MAJOR 
HAVING s.MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT s.MAJOR , AVG(AVR)
FROM STUDENT s 
GROUP BY s.MAJOR 
HAVING s.MAJOR != '화학'
AND AVG(AVR) >= 2.0 ;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT s.sno , s.SNAME , AVG("RESULT") 
FROM SCORE sc  
JOIN STUDENT s 
ON sc.SNO = s.SNO 
GROUP BY s.SNO , s.SNAME
HAVING AVG(sc.result) >= 60; 
	

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT c.ST_NUM , p.PNO , p.PNAME 
FROM COURSE c 
JOIN PROFESSOR p 
ON c.PNO = p.PNO 
GROUP BY c.ST_NUM , p.PNO , p.PNAME
HAVING c.ST_NUM >= 3;

--5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT c.CNAME , p.PNAME , AVG(s."RESULT")
FROM SCORE s 
JOIN COURSE c
ON s.CNO = c.CNO
JOIN PROFESSOR p
ON c.PNO = p.PNO
GROUP BY CNAME , pname
HAVING AVG( s."RESULT" ) > '50.49';

--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요(부서번호, 부서명, 인원수)
SELECT d.DNO , d.DNAME , COUNT(e.ENAME) 
FROM DEPT d 
JOIN EMP e 
ON d.DNO = e.DNO 
GROUP BY d.dno, d.DNAME 
HAVING COUNT(e.ENAME) >= 4 ;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT e.JOB 
FROM EMP e 
GROUP BY e.JOB 
HAVING AVG(SAL) >= '3000';

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT s.SYEAR 
FROM STUDENT s 
GROUP BY s.SYEAR 
HAVING COUNT(SNO) >= 5; 

--****************************

--1) 각 학과별 학년별 학생 수를 ROLLUP함수로 검색하세요
SELECT s.MAJOR , s.SYEAR , COUNT(s.SNO) 
FROM STUDENT s 
GROUP BY ROLLUP (s.MAJOR , s.SYEAR );

SELECT s.MAJOR , AVG(AVR/4*4.5)
FROM STUDENT s 
GROUP BY MAJOR
HAVING s.MAJOR in('화학', '생물');
--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하는 데 화학과 생물이 열로 만들어지도록 하세요.(PIVOT 사용)
SELECT *
from( 	SELECT s.major, s.avr
		FROM STUDENT s
	)
	pivot(
	AVG(AVR/4*4.5)
	FOR MAJOR IN ('화학' AS "화학", '생물' AS "생물") 
);

--3) 학과별 학생이름을 ,로 구분하여 성적순으로(내림차순) 조회하세요.(LISTAGG 사용)
SELECT s.MAJOR , LISTAGG(s.SNAME, ', ') WITHIN GROUP (ORDER BY avr DESC)
FROM STUDENT s 
GROUP BY s.MAJOR

--4) 부서별 업무별 연봉의 평균을 검색하세요(부서와 업무 컬럼의 그룹화 여부도 같이 검색, GROUPING 사용)
SELECT e.dNO , e.JOB , AVG(sal) , GROUPING (DNO) , GROUPING (JOB)
FROM EMP e 
GROUP BY e.DNO , e.JOB 

--****************************

--1) 각 과목의 과목번호, 과목명, 담당 교수의 교수번호, 교수명을 검색하라(NATURAL JOIN 사용)
SELECT CNO, CNAME , PNO , PNAME 
FROM COURSE  
NATURAL JOIN PROFESSOR 

--2) 화학과 학생의 기말고사 성적을 모두 검색하라(JOIN USING 사용)
SELECT *
FROM STUDENT s 
JOIN SCORE s2 
USING (sno)
WHERE s.MAJOR = '화학'
ORDER BY sno;

--3) 화학 관련 과목을 강의하는 교수의 명단을 검색한다(NATURAL JOIN 사용)
SELECT cname , PNO , pname
FROM COURSE c 
NATURAL JOIN PROFESSOR p 
WHERE c.CNAME like '%화학%';

--4) 화학과 1학년 학생의 기말고사 성적을 검색한다(NATURAL JOIN 사용)
SELECT sno, sname, syear, major, cno, result
FROM STUDENT s 
NATURAL JOIN SCORE s2 
WHERE s.SYEAR = 1 AND s.MAJOR = '화학'
ORDER BY SNO ;

--5) 일반화학 과목의 기말고사 점수를 검색한다(JOIN USING 사용)
SELECT cname, sno, result
FROM COURSE c
JOIN SCORE s
USING (cno)
WHERE c.CNAME = '일반화학';

--6) 화학과 1학년 학생이 수강하는 과목을 검색한다(NATURAL JOIN 사용)
SELECT sname, major, syear, cname
FROM STUDENT s 
NATURAL JOIN COURSE c 
WHERE s.MAJOR = '화학' AND s.SYEAR = 1;