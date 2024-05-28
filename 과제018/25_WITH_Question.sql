--1) WITH 절을 이용하여 정교수만 모여있는 가상테이블 하나와 일반과목(과목명에 일반이 포함되는)들이 모여있는 가상테이블 하나를 생성하여 
--   일반과목들을 강의하는 교수의 정보 조회하세요.(과목번호, 과목명, 교수번호, 교수이름)
WITH PROPRO AS(
   SELECT *
   FROM PROFESSOR P
   WHERE ORDERS ='정교수'
)
SELECT CNO
      , CNAME
      ,PNO 
      ,PNAME
 FROM COURSE
 JOIN PROPRO
 USING(PNO)
 WHERE CNAME LIKE '%일반%'
 

--2) WITH 절을 이용하여 급여가 3000이상인 사원정보를 갖는 가상테이블 하나와 보너스가 500이상인 사원정보를 갖는 가상테이블 하나를 생성하여
--   두 테이블에 모두 속해있는 사원의 정보를 모두 조회하세요.
WITH EMP_SAL_3000 AS(
   SELECT *
   FROM EMP
   WHERE SAL >= 3000
),EMP_COMM_500 AS(
   SELECT *
   FROM EMP
   WHERE COMM >= 500
)
 SELECT *
 FROM EMP_SAL_3000
 JOIN EMP_COMM_500 
 USING(ENO)


--3) WITH 절을 이용하여 평점이 3.3이상인 학생의 목록을 갖는 가상테이블 하나와 학생별 기말고사 평균점수를 갖는 가상테이블 하나를 생성하여
--   평점이 3.3이상인 학생의 기말고사 평균 점수를 조회하세요.
WITH STUDENT_AVR_33 AS(
   SELECT *
   FROM STUDENT
   WHERE AVR >= 3.3
)
 SELECT   SNO  
       ,  AVG("RESULT")
 FROM  SCORE
 JOIN STUDENT_AVR_33 
 USING(SNO)
 GROUP BY SNO


--4) WITH 절을 이용하여 부임일자가 25년이상된 교수정보를 갖는 가상테이블 하나와 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 기말고사성적을
--   갖는 가상테이블 하나를 생성하여 기말고사 성적이 90이상인 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 교수이름, 기말고사성적을 조회하세요.
WITH PRO_25 AS(
   SELECT *
   FROM PROFESSOR
   WHERE MONTHS_BETWEEN(SYSDATE , HIREDATE) >= 300
),SCORE_INFO AS(
   SELECT CNO
         , CNAME
         ,SNO
         ,SNAME
         ,PNO
         ,"RESULT"
    FROM COURSE
    JOIN SCORE
    USING(CNO)
    JOIN STUDENT
    USING(SNO)
)

 SELECT   CNO
         ,CNAME
         ,SNO
         ,SNAME
         ,PNO
         ,PNAME
         ,"RESULT"
  FROM SCORE_INFO
  JOIN PRO_25
  USING(PNO)