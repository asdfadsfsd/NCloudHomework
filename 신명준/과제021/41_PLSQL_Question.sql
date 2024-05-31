--1) 과목번호, 과목이름, 과목별 평균 기말고사 성적을 갖는 레코드의 배열을 만들고
--   기본 LOOP문을 이용해서 모든 과목의 과목번호, 과목이름, 과목별 평균 기말고사 성적을 출력하세요.

DECLARE
 TYPE AVG_COURCE IS RECORD
 (
    CNO  COURSE.CNO%TYPE,
    CNAME  COURSE.CNAME%TYPE,
    AVG_COURCE  NUMBER
 );

 CURSOR AVG_COURCE_CURSOR IS
    SELECT  CNO,
            CNAME,
            AVG("RESULT") AS AVG_COURCE
    FROM  COURSE
    JOIN SCORE
    USING(CNO)
    GROUP BY CNO, CNAME;

 AVGCOURCE AVG_COURCE;

BEGIN
  LOOP
    FETCH AVG_COURCE_CURSOR INTO AVGCOURCE;
    EXIT WHEN AVG_COURCE_CURSOR%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(AVGCOURCE.CNO);
    DBMS_OUTPUT.PUT_LINE(AVGCOURCE.CNAME);
    DBMS_OUTPUT.PUT_LINE(AVGCOURCE.AVG_COURCE ); 
  END LOOP;
  CLOSE AVG_COURCE_CURSOR;
END;
/


--2) 학생번호, 학생이름과 학생별 평균 기말고사 성적을 갖는 테이블 T_STAVGSC를 만들고
--   커서를 이용하여 학생번호, 학생이름, 학생별 평균 기말고사 성적을 조회하고 
--   조회된 데이터를 생성한 테이블인 T_STAVGSC에 저장하세요.
CREATE TABLE  T_STAVGSC(
    SNO VARCHAR2(8),
    SNAME VARCHAR2(20),
    AVG_RES NUMBER(5,2)
);


 DECLARE
  CURSOR T_ST_SC1_CURSOR IS
    SELECT  SNO,
            SNAME,
            AVG("RESULT") AS "AVG"
    FROM  STUDENT
    JOIN SCORE
    USING(SNO)
    GROUP BY SNO, SNAME;
 BEGIN
  FOR T_ST_SC1_ROW IN T_ST_SC1_CURSOR LOOP
  
   INSERT INTO T_STAVGSC
           VALUES T_ST_SC1_ROW;
  END LOOP;
  
 END;
