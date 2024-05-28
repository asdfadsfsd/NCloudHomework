--1) STUDENT 테이블을 참조하여 ST_TEMP 테이블을 만들고 모든 학생의 성적을 4.5만점 기준으로 수정하세요
 CREATE TABLE ST_TEMP
   AS SELECT SNO
            ,SNAME
            ,SEX
            ,SYEAR
            ,MAJOR
            ,AVR/4 *4.5 AS "AVR"
        FROM STUDENT;
  COMMIT;   

--2) PROFESSOR 테이블을 참조하여 PF_TEMP 테이블을 만들고 모든 교수의 부임일자를 100일 앞으로 수정하세요
 CREATE TABLE PF_TEMP
   AS SELECT PNO
            , PNAME
            ,"SECTION"
            , ORDERS 
            ,HIREDATE +100 AS "HIREDATE"
        FROM PROFESSOR ;

--3) ST_TEMP 테이블에서 화학과 2학년 학생의 정보를 삭제하세요
 DELETE FROM ST_TEMP 
        WHERE MAJOR ='화학'
          AND  SYEAR =2;
 

--4) PF_TEMP 테이블에서 조교수의 정보를 삭제하세요
  DELETE FROM PF_TEMP
        WHERE ORDERS ='조교수'
 

--5) EMP 테이블을 참조하여 EMP2 테이블을 만들고 DNO = 30인 사원의 보너스를 15프로 상승시킨 값으로 변경하시고 
--   DNO = 20인 사원의 급여를 10프로 상승시킨 값으로 변경하세요.
CREATE TABLE EMP2 AS
  SELECT *FROM EMP
 COMMIT;

UPDATE EMP2
  SET 
    COMM = COMM *1.15
  WHERE DNO =30;
  COMMIT;
 UPDATE EMP2
  SET 
    SAL = SAL *1.1
  WHERE DNO =30;
 COMMIT;
--6) 화학과 2학년 학생중 기말고사 성적의 등급이 A, B인 정보를 갖는 테이블 SCORE_STGR을 생성하세요.(SNO, SNAME, MAJOR, SYEAR, RESULT, GRADE)
CREATE TABLE  SCORE_STGR AS 
  SELECT SNO
        , SNAME
        , MAJOR
        , SYEAR
        , "RESULT"
        , GRADE
  FROM STUDENT 
  JOIN SCORE
  USING(SNO)
  JOIN SCGRADE 
  ON "RESULT" BETWEEN LOSCORE AND HISCORE
  WHERE GRADE in('A','B')
   AND MAJOR = '화학'
   AND SYEAR =2
   
   COMMIT;

--7) 생물학과 학생중 평점이 2.7이상인 학생이 수강중인 과목의 정보를 갖는 테이블 ST_COURSEPF를 생성하세요. (SNO, SNAME, CNO, CNAME, PNO, PNAME, AVR)
CREATE TABLE ST_COURSEPF AS
  SELECT   SNO
        ,  SNAME
        ,  CNO
        , CNAME
        , ST_NUM
        , PNO
        , PNAME
        , AVR
   FROM COURSE 
   JOIN SCORE 
   USING(CNO)
   JOIN STUDENT
   USING(SNO)
   JOIN PROFESSOR
   USING(PNO)
   WHERE MAJOR ='생물'
     AND  AVR >=2.7
 
 