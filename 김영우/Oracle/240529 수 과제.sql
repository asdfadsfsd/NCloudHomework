--1) 어제 만든 SCORE_STGR 테이블의 SNO 컬럼에 INDEX를 추가하세요.
CREATE INDEX SCORE_STGR_IDX
	ON SCORE_STGR(SNO);

--2) 어제 만든 ST_COURSEPF 테이블의 SNO, CNO, PNO 다중 컬럼에 INDEX를 추가하세요.
CREATE INDEX ST_COURSEPF_IDX
	ON ST_COURSEPF(SNO, CNO, PNO);
COMMIT;
------------------------------

--뷰 이름은 자유
--1) 학생의 평점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_AVR(
	ST_NUM,
	ST_NAME,
	ST_AVR
) AS (
	SELECT SNO
		 , SNAME
		 , AVR * 1.25
		FROM STUDENT
);

--2) 각 과목별 기말고사 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_AVG_RES(
	ST_MAJOR,
	SC_RES
) AS (
		SELECT ST.MAJOR
		 , AVG(SC.RESULT)
		FROM STUDENT ST
		JOIN SCORE SC
		  ON ST.SNO = SC.SNO
		GROUP BY ST.MAJOR
);

SELECT *
	FROM V_AVG_RES;

--3) 각 사원과 관리자(MGR)의 이름을 검색할 수 있는 뷰를 생성하세요. 
CREATE OR REPLACE VIEW V_MGR(
	E_ENAME,
	E_MGR,
	EM_ENAME
) AS (
		SELECT A.ENAME
			 , A.MGR
			 , B.ENAME
			FROM EMP A
			JOIN EMP B
			  ON A.MGR = B.ENO
)

SELECT *
	FROM V_MGR

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_ST_GRADE(
	ST_SNO,
	ST_SNAME,
	ST_MAJOR,
	SC_RESULT,
	SCG_GRADE
) AS(
	SELECT ST.SNO
		 , ST.SNAME
		 , ST.MAJOR
		 , SC.RESULT
		 , SCG.GRADE
		FROM STUDENT ST
		JOIN SCORE SC
		  ON ST.SNO = SC.SNO
		JOIN SCGRADE SCG
		  ON SC.RESULT BETWEEN SCG.LOSCORE AND SCG.HISCORE
) 

SELECT *
	FROM V_ST_GRADE
	

--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_ST_PRO(
	ST_SNO,
	ST_SNAME
) AS (
		SELECT ST.SNO
			 , ST.SNAME
			FROM STUDENT ST
			JOIN SCORE SC
			  ON ST.SNO = SC.SNO
			JOIN COURSE CO
			  ON CO.CNO = SC.CNO
			JOIN PROFESSOR P
			  ON CO.PNO = P.PNO
			WHERE P.SECTION = '물리'
)

SELECT *
	FROM V_ST_PRO
-------------------------

--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT ROWNUM
	 , A.SNO
	 , A.SNAME
	 , A.AVR45
	FROM (
		  SELECT SNO
			   , SNAME
			   , AVR * 1.125 AS AVR45
			  FROM STUDENT
			  WHERE AVR IS NOT NULL 
			  ORDER BY AVR DESC
	) A
	WHERE ROWNUM <= 3;

--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT ROWNUM
	 , A.CNO
	 , A.CNAME
	 , A.AVG_RE
	FROM (SELECT SC.CNO
		   	   , CO.CNAME 
			  , AVG(SC.RESULT) AS AVG_RE
			  FROM SCORE SC
			  JOIN COURSE CO
			    ON SC.CNO = CO.CNO
			  GROUP BY SC.CNO, CO.CNAME
			  ORDER BY AVG(SC.RESULT) DESC 
	) A
    WHERE ROWNUM <= 3;
			

--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT ROWNUM
	 , A.MAJOR
	 , A.SYEAR
	 , A.AVG_RE
	FROM (SELECT ST.MAJOR
		   	   , ST.SYEAR 
			   , AVG(SC.RESULT) AS AVG_RE
			  FROM STUDENT ST
			  JOIN SCORE SC
			    ON ST.SNO = SC.SNO
			  JOIN COURSE CO
			  	ON SC.CNO = CO.CNO
			  GROUP BY ST.MAJOR, ST.SYEAR
			  ORDER BY AVG(SC.RESULT) DESC 
	) A
    WHERE ROWNUM <= 3;

--4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM
	 , A.PNAME
	 , PR.SECTION
	 , A.AVG_RES
	FROM(
		SELECT P.PNAME
			 , ROUND(AVG(SC.RESULT), 2) AS AVG_RES
			FROM PROFESSOR P
			JOIN COURSE CO
			  ON CO.PNO = P.PNO
			JOIN SCORE SC
			  ON SC.CNO = CO.CNO
			GROUP BY P.PNAME
			ORDER BY ROUND(AVG(SC.RESULT), 2) DESC
	) A
	JOIN PROFESSOR PR
	  ON PR.PNAME = A.PNAME
	WHERE ROWNUM <= 3;
	  
--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.  --------------------??


	 

-----------------------------------------------

--1) CNO이 PK인 COURSE_PK 테이블을 생성하세요.(1번 방식으로)
CREATE TABLE COURSE_PK (
	CNO NUMBER(4) PRIMARY KEY
);

--2) PNO이 PK인 PROFESSOR_PK 테이블을 생성하세요.(2번 방식으로)
CREATE TABLE PROFESSOR_PK (
	PNO NUMBER(4),
	CONSTRAINT PK_PROFESSOR_PNO PRIMARY KEY(PNO)
);

--3) PF_TEMP 테이블에 PNO을 PK로 추가하세요.
ALTER TABLE PF_TEMP
	ADD CONSTRAINT PK_PF_TEMP_PNO PRIMARY KEY(PNO);

--4) COURSE_PROFESSOR 테이블에 CNO, PNO을 PK로 추가하세요.
CREATE TABLE COURSE_PROFESSOR(
	CNO NUMBER(4),
	PNO NUMBER(4)
);
COMMIT;

ALTER TABLE COURSE_PROFESSOR
	ADD CONSTRAINT PK_COURSE_PROFESSOR_CNO_PNO PRIMARY KEY(CNO, PNO);

--5) BOARD_NO(NUMBER)를 PK로 갖으면서 BOARD_TITLE(VARCHAR2(200)), BOARD_CONTENT(VARCHAR2(2000)), 
--   BOARD_WRITER(VARCHAR2(20)), BOARD_FRGT_DATE(DATE), BOARD_LMDF_DATE(DATE) 컬럼을 갖는 
-- T_BOARD 테이블을 생성하세요.
CREATE TABLE T_BOARD (
	BOARD_NO NUMBER(10),
	BOARD_TITLE VARCHAR2(200),
	BOARD_CONTENT VARCHAR2(2000),
	BOARD_WRITER VARCHAR2(20),
	BOARD_FRGT_DATE DATE,
	BOARD_LMDF_DATE DATE,
	CONSTRAINT PK_T_BOARD_NOARD_NO  PRIMARY KEY(BOARD_NO)
)

SELECT *
	FROM T_BOARD;

--6) BOARD_NO(NUMBER), BOARD_FILE_NO(NUMBER)를 PK로 갖으면서 BOARD_FILE_NM(VARCHAR2(200)), 
-- 	 BOARD_FILE_PATH(VARCHAR2(2000)),
--   ORIGIN_FILE_NM(VARCHAR2(200)) 컬럼을 갖는 T_BOARD_FILE 테이블을 생성하세요.
CREATE TABLE T_BOARD_FILE(
	BOARD_NO NUMBER(10),
	BOARD_FILE_NO NUMBER(10),
	BOARD_FILE_NM VARCHAR2(200),
	BOARD_FILE_PATH VARCHAR2(2000),
	ORIGIN_FILE_NM VARCHAR2(200),
	CONSTRAINT PK_T_BOARD_FILE_BOARD_NO_BOARD_FILE_NO PRIMARY KEY(BOARD_NO, BOARD_FILE_NO)
);

SELECT *
	FROM T_BOARD_FILE


--7) 다음 구조를 갖는 테이블을 생성하세요.
--   T_SNS                              T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트위터                  3               30000                  2                  1
--                                                                               2                  2
	
CREATE TABLE T_SNS (
	SNS_NO NUMBER(3),
	SNS_NM VARCHAR2(10),
	CONSTRAINT PK_T_SNS_SNS_NO PRIMARY KEY(SNS_NO)
);

INSERT INTO T_SNS
VALUES (1, '페북');
INSERT INTO T_SNS
VALUES (2, '인스타');
INSERT INTO T_SNS
VALUES (3, '트위터');
COMMIT;



CREATE TABLE T_SNS_DETAIL(
	SNS_NO NUMBER(3),
	SNS_BEN INT,
	CONSTRAINT PK_T_SNS_DETAIL_SNS_NO PRIMARY KEY(SNS_NO),
	CONSTRAINT FK_T_SNS_DETAIL_SNS_NO FOREIGN KEY(SNS_NO)
		REFERENCES T_SNS(SNS_NO)
);

INSERT INTO T_SNS_DETAIL
VALUES (1, '4000');
INSERT INTO T_SNS_DETAIL
VALUES (2, '10000');
INSERT INTO T_SNS_DETAIL
VALUES (3, '30000');
COMMIT;

CREATE TABLE T_SNS_UPLOADED(
	SNS_NO NUMBER(3),
	SNS_UPL_NO NUMBER(3),
	CONSTRAINT PK_T_SNS_UPLOADED_SNS_NO_SNS_UPL_NO PRIMARY KEY (SNS_NO, SNS_UPL_NO),
	CONSTRAINT FK_T_SNS_UPLOADED_SNS_NO FOREIGN KEY (SNS_NO)
		REFERENCES T_SNS(SNS_NO)
);

INSERT INTO T_SNS_UPLOADED
VALUES (1, 1);
INSERT INTO T_SNS_UPLOADED
VALUES (1, 2);
INSERT INTO T_SNS_UPLOADED
VALUES (2, 1);
INSERT INTO T_SNS_UPLOADED
VALUES (2, 2);
COMMIT;