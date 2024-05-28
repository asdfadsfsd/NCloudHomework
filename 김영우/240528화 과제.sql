--1) WITH 절을 이용하여 정교수만 모여있는 가상테이블 하나와 일반과목(과목명에 일반이 포함되는)들이 모여있는 가상테이블 하나를 생성하여 
--   일반과목들을 강의하는 교수의 정보 조회하세요.(과목번호, 과목명, 교수번호, 교수이름)
WITH PROJUNG AS (
					SELECT PNO
						 , PNAME
						 , ORDERS
						FROM PROFESSOR
						WHERE SUBSTR(ORDERS, 0, 1) = '정'
	), 
	COGE AS (
					SELECT CNO
						 , CNAME
						 , PNO
						FROM COURSE
						WHERE CNAME LIKE '%일반%'
	)
SELECT COGE.CNO
	 , COGE.CNAME
	 , PROJUNG.PNO
	 , PROJUNG.PNAME
	FROM PROJUNG
	JOIN COGE
	  ON PROJUNG.PNO = COGE.PNO;
	


--2) WITH 절을 이용하여 급여가 3000이상인 사원정보를 갖는 가상테이블 하나와 보너스가 500이상인 사원정보를 갖는 가상테이블 하나를 생성하여
--   두 테이블에 모두 속해있는 사원의 정보를 모두 조회하세요.
WITH SAL3000 AS (
					SELECT *
						FROM EMP
						WHERE SAL >= 3000
	 ),
	 COMM500 AS ( 
	 				SELECT *
	 					FROM EMP
	 					WHERE COMM >= 500
	 )
SELECT *
	FROM SAL3000
	JOIN COMM500
	  ON SAL3000.ENO = COMM500.ENO;


--3) WITH 절을 이용하여 평점이 3.3이상인 학생의 목록을 갖는 가상테이블 하나와 
-- 학생별 기말고사 평균점수를 갖는 가상테이블 하나를 생성하여
--   평점이 3.3이상인 학생의 기말고사 평균 점수를 조회하세요.

WITH AVR33 AS (
	 	 		 SELECT SNO
	 	 		 	  , SNAME
	 	 		 	 FROM STUDENT
	 	 		 	 WHERE AVR >= 3.3
	 ),
	 RESULT_AVG AS (
	 			 SELECT SNO
	 			  	  , AVG(RESULT) AS AVG_RES
	 			  	 FROM SCORE
	 			  	 GROUP BY SNO
	 )
SELECT AVR33.SNO
	 , AVR33.SNAME
	 , RESULT_AVG.AVG_RES
	FROM RESULT_AVG
	JOIN AVR33
	  ON AVR33.SNO = RESULT_AVG.SNO;

--4) WITH 절을 이용하여 부임일자가 25년이상된 교수정보를 갖는 가상테이블 하나와 
-- 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 기말고사성적을 갖는 가상테이블 하나를 생성하여 
-- 기말고사 성적이 90이상인 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 교수이름, 기말고사성적을 조회하세요.
WITH HIR25 AS (
	 			SELECT *
	 				FROM PROFESSOR
	 				WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) >= 300 
	 ),	 
	 TOTAL2 AS (
	 			SELECT CO.CNO
	 				 , CO.CNAME
	 				 , ST.SNO
	 				 , ST.SNAME
	 				 , P.PNO
	 				 , P.PNAME
	 				 , SC.RESULT
	 				FROM COURSE CO
	 				JOIN PROFESSOR P
	 				  ON P.PNO = CO.PNO
	 				JOIN SCORE SC
	 				  ON SC.CNO = CO.CNO
	 				JOIN STUDENT ST
	 				  ON SC.SNO = ST.SNO
	 )
 SELECT TOTAL2.CNO
 	  , TOTAL2.CNAME
 	  , TOTAL2.SNO
 	  , TOTAL2.SNAME
 	  , HIR25.PNO
 	  , HIR25.PNAME
 	  , TOTAL2.RESULT
 	 FROM TOTAL2
 	 JOIN HIR25
 	   ON HIR25.PNO = TOTAL2.PNO
 	  



----------------------------------------------------------------------------------------
--1) STUDENT 테이블을 참조하여 ST_TEMP 테이블을 만들고 모든 학생의 성적을 4.5만점 기준으로 수정하세요
CREATE TABLE ST_TEMP
	AS SELECT * FROM STUDENT;

UPDATE ST_TEMP 
	SET
		AVR = AVR * (4.5/4.0);

--2) PROFESSOR 테이블을 참조하여 PF_TEMP 테이블을 만들고 모든 교수의 부임일자를 100일 앞으로 수정하세요
CREATE TABLE PF_TEMP
	AS SELECT * FROM PROFESSOR;

UPDATE PF_TEMP
	SET HIREDATE = HIREDATE - 100;


--3) ST_TEMP 테이블에서 화학과 2학년 학생의 정보를 삭제하세요
DELETE FROM ST_TEMP
	WHERE MAJOR = '화학'
	  AND SYEAR = 2;
COMMIT;

--4) PF_TEMP 테이블에서 조교수의 정보를 삭제하세요
DELETE FROM PF_TEMP
	WHERE ORDERS = '조교수';
COMMIT;


--5) EMP 테이블을 참조하여 EMP2 테이블을 만들고 DNO = 30인 사원의 보너스를 15프로 상승시킨 값으로 변경하시고 
--	 DNO = 30인 사원의 보너스를 15프로 상승시킨 값으로 변경하시고
--   DNO = 10인 사원의 보너스를 5프로 상승시킨 값으로 변경,
--   DNO = 20인 사원의 급여를 10프로 상승시킨 값으로 변경하세요.
DROP TABLE EMP2;

CREATE TABLE EMP2
	AS SELECT * FROM EMP;

UPDATE EMP2
	SET COMM = COMM * 1.15
  WHERE DNO = 30;
COMMIT;

UPDATE EMP2
	SET SAL = SAL * 1.10
	WHERE DNO = 20;
COMMIT;

UPDATE EMP2
	SET SAL = SAL * 1.05
	WHERE DNO = 10;
COMMIT;

--6) 화학과 2학년 학생중 기말고사 성적의 등급이 A, B인 정보를 갖는 
-- 테이블 SCORE_STGR을 생성하세요.(SNO, SNAME, MAJOR, SYEAR, CNO, CNAME, RESULT, GRADE)
DROP TABLE SCORE_STGR;

CREATE TABLE SCORE_STGR (SNO, SNAME, MAJOR, SYEAR, CNO, CNAME, RESULT, GRADE)
	AS SELECT ST.SNO
		    , ST.SNAME
		    , ST.MAJOR
		    , ST.SYEAR
		    , CO.CNO
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
		   WHERE ST.MAJOR = '화학'
		     AND ST.SYEAR = 2
		     AND SCG.GRADE IN ('A', 'B')
		     
--7) 생물학과 학생중 평점이 2.7이상인 학생이 수강중인 과목의 정보를 갖는 
-- 테이블 ST_COURSEPF를 생성하세요. (SNO, SNAME, CNO, CNAME, PNO, PNAME, AVR)
CREATE TABLE ST_COURSEPF(SNO, SNAME, CNO, CNAME, PNO, PNAME, AVR)
	AS SELECT ST.SNO
		    , ST.SNAME
		    , CO.CNO
		    , CO.CNAME
		    , P.PNO
		    , P.PNAME
		    , ST.AVR
		   FROM STUDENT ST
		   JOIN SCORE SC
		     ON ST.SNO = SC.SNO
		   JOIN COURSE CO
		     ON CO.CNO = SC.CNO
		   JOIN PROFESSOR P
		     ON CO.PNO = P.PNO
		   WHERE ST.MAJOR = '생물'
		     AND ST.AVR >= 2.7
		     
		     
		     
		     
		     