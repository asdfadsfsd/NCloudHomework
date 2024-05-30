--1) SCORE 테이블과 동일한 구조를 갖는 SCORE_CHK를 생성하고 RESULT 60이상 90이하만 입력 가능하도록 하세요.
DROP TABLE SCORE_CHK2;

CREATE TABLE SCORE_CHK
	AS SELECT * FROM SCORE;

DELETE FROM SCORE_CHK;
COMMIT;

ALTER TABLE SCORE_CHK
	ADD CONSTRAINT CHK_SCORE_CHK_RESULT CHECK(RESULT BETWEEN 60 AND 90);

-- 방법2
CREATE TABLE SCORE_CHK2(
	SNO VARCHAR2(8),
	CNO VARCHAR2(8),
	RESULT NUMBER(3,0),
	CONSTRAINT CHK_SCORE_CHK_RESULT2 CHECK(RESULT BETWEEN 60 AND 90)
);

--2) STUDENT 테이블과 동일한 구조를 갖는 STUDENT_COPY 테이블을 생성하면서 SNO은 PK로 
-- SNAME은 NOT NULL로 SYEAR의 DEFAULT는 1로 설정하세요.
CREATE TABLE STUDENT_COPY(
	SNO VARCHAR2(8) PRIMARY KEY,
	SNAME VARCHAR2(20) NOT NULL,
	SEX VARCHAR2(3),
	SYEAR NUMBER(1,0) DEFAULT 1,
	MAJOR VARCHAR2(20),
	AVR NUMBER(4,2)
);

--3) COURSE 테이블과 동일한 구조를 갖는 COURSE_CONTSRAINT 테이블을 생성하면서 
-- CNO, CNAME을 PK로 / PNO은 PROFESSOR_PK의 PNO을 참조하여
--   FK로 설정하고 ST_NUM은 DEFAULT 2로 설정하세요.
CREATE TABLE PROFESSOR_PK
	AS SELECT * FROM PROFESSOR;

ALTER TABLE PROFESSOR_PK
	ADD CONSTRAINT PK_PROFESSOR_PK_PNO PRIMARY KEY(PNO);

CREATE TABLE COURSE_CONSTRAINT(
	CNO VARCHAR2(8),
	CNAME VARCHAR2(20),
	ST_NUM NUMBER(1,0) DEFAULT 2,
	PNO VARCHAR2(8),
	CONSTRAINT PK_COURSE_CONSTRAINT_CNO_CNAME PRIMARY KEY(CNO, CNAME),
	CONSTRAINT FK_COURSE_CONSTRAINT_PNO FOREIGN KEY(PNO)
		REFERENCES PROFESSOR_PK(PNO)
);
------------------------------------------------------------------------------

--1) 다음 구조를 갖는 테이블을 생성하세요.
--PRODUCT 테이블 - PNO NUMBER PK              : 제품번호
--                PNMAE VARCHAR2(50)          : 제품이름
--                PRI NUMBER                  : 제품단가
--PAYMENT 테이블 - MNO NUMBER PK              : 전표번호
--               PDATE DATE NOT NULL         : 판매일자
--                CNAME VARCHAR2(50) NOT NULL : 고객명
--                TOTAL NUMBER TOTAL > 0      : 총액
--PAYMENT_DETAIL - MNO NUMBER PK FK           : 전표번호
--                PNO NUMBER PK FK            : 제품번호
--                AMOUNT NUMBER NOT NULL      : 수량
--                PRICE NUMBER NOT NULL       : 단가
--                TOTAL_PRICE NUMBER NOT NULL TOTAL_PRICE > 0 : 금액
CREATE TABLE PRODUCT(
	PNO NUMBER PRIMARY KEY,
	PNAME VARCHAR2(50),
	PRI NUMBER
);

CREATE TABLE PAYMENT(
	MNO NUMBER PRIMARY KEY,
	PDATE DATE NOT NULL,
	CNAME VARCHAR2(50) NOT NULL,
	TOTAL NUMBER DEFAULT 0 CHECK (TOTAL > 0)
);

CREATE TABLE PAYMENT_DETAIL(
	MNO NUMBER,
	PNO NUMBER,
	AMOUNT NUMBER NOT NULL,
	PRICE NUMBER NOT NULL,
	TOTAL_PRICE NUMBER DEFAULT 0 CHECK (TOTAL_PRICE > 0) NOT NULL,
	CONSTRAINT PK_PAYMENT_DETAIL_MNO_PNO PRIMARY KEY(MNO, PNO),
	CONSTRAINT FK_PAYMENT_DETAIL_MNO FOREIGN KEY(MNO)
		REFERENCES PAYMENT(MNO),
	CONSTRAINT FK_PAYMENT_DETAIL_PNO FOREIGN KEY(PNO)
		REFERENCES PRODUCT(PNO)
);
------------------------------------------------------------------------------
--1) 과목번호, 과목이름, 교수번호, 교수이름을 담을 수 있는 변수들을 선언하고 
--   유기화학 과목의 과목번호, 과목이름, 교수번호, 교수이름을 출력하세요.
DECLARE
	COURSE_CNO COURSE.CNO%TYPE;
	COURSE_CNAME COURSE.CNAME%TYPE;
	PROFESSOR_PNO PROFESSOR.PNO%TYPE;
	PROFESSOR_PNAME PROFESSOR.PNAME%TYPE;
BEGIN
	SELECT C.CNO, C.CNAME, P.PNO, P.PNAME INTO COURSE_CNO, COURSE_CNAME, PROFESSOR_PNO, PROFESSOR_PNAME
		FROM COURSE C
		JOIN PROFESSOR P
		  ON C.PNO = P.PNO
		WHERE CNAME = '유기화학';

	DBMS_OUTPUT.PUT_LINE(COURSE_CNO);
	DBMS_OUTPUT.PUT_LINE(COURSE_CNAME);
	DBMS_OUTPUT.PUT_LINE(PROFESSOR_PNO);
	DBMS_OUTPUT.PUT_LINE(PROFESSOR_PNAME);
EXCEPTION 
	WHEN NO_DATA_FOUND THEN 
		DBMS_OUTPUT.PUT_LINE('해당 데이터를 찾지 못했습니다.');
END;


--2) 위 데이터들을 레코드로 선언하고 출력하세요.
TYPE COU_PRO_REC IS RECORD(
	 COURSE_CNO COURSE.CNO%TYPE;
 	 COURSE_CNAME COURSE.CNAME%TYPE;
	 PROFESSOR_PNO PROFESSOR.PNO%TYPE;
	 PROFESSOR_PNAME PROFESSOR.PNAME%TYPE;
);































