--1) 과목번호, 과목이름, 교수번호, 교수이름을 담을 수 있는 변수들을 선언하고 
--   유기화학 과목의 과목번호, 과목이름, 교수번호, 교수이름을 출력하세요.
DECLARE
  CNO VARCHAR2(8);
  CNAME VARCHAR2(20);
  PNO VARCHAR2(8);
  PNAME VARCHAR2(20);
BEGIN
  SELECT C_INFO.CNO, C_INFO.CNAME, C_INFO.PNO, C_INFO.PNAME INTO CNO, CNAME, PNO, PNAME
    FROM (
        SELECT COURSE.CNO, COURSE.CNAME, PROFESSOR.PNO, PROFESSOR.PNAME
        FROM COURSE
        JOIN PROFESSOR ON COURSE.PNO = PROFESSOR.PNO
        WHERE COURSE.CNAME = '유기화학'
    ) C_INFO;

  -- 결과 출력
  DBMS_OUTPUT.PUT_LINE('과목번호: ' || CNO);
  DBMS_OUTPUT.PUT_LINE('과목이름: ' || CNAME);
  DBMS_OUTPUT.PUT_LINE('교수번호: ' || PNO);
  DBMS_OUTPUT.PUT_LINE('교수이름: ' || PNAME);
END;
--2) 위 데이터들을 레코드로 선언하고 출력하세요.

DECLARE
  TYPE CINFO IS RECORD(
    CNO VARCHAR2(8),
    CNAME VARCHAR2(20),
    PNO VARCHAR2(8),
    PNAME VARCHAR2(20)
  );
  cinfo_rec CINFO; -- CINFO 타입의 변수를 선언
BEGIN
  SELECT C_INFO.CNO, C_INFO.CNAME, C_INFO.PNO, C_INFO.PNAME 
  INTO cinfo_rec.CNO, cinfo_rec.CNAME, cinfo_rec.PNO, cinfo_rec.PNAME
  FROM (
    SELECT COURSE.CNO, COURSE.CNAME, PROFESSOR.PNO, PROFESSOR.PNAME
    FROM COURSE
    JOIN PROFESSOR ON COURSE.PNO = PROFESSOR.PNO
    WHERE COURSE.CNAME = '유기화학'
  ) C_INFO;

  DBMS_OUTPUT.PUT_LINE('과목번호: ' || cinfo_rec.CNO);
  DBMS_OUTPUT.PUT_LINE('과목이름: ' || cinfo_rec.CNAME);
  DBMS_OUTPUT.PUT_LINE('교수번호: ' || cinfo_rec.PNO);
  DBMS_OUTPUT.PUT_LINE('교수이름: ' || cinfo_rec.PNAME);
END;
