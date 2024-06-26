--1) CNO이 PK인 COURSE_PK 테이블을 생성하세요.(1번 방식으로)
CREATE TABLE COURSE_PK
(
   CNO VARCHAR2(6) PRIMARY KEY
) 

--2) PNO이 PK인 PROFESSOR_PK 테이블을 생성하세요.(2번 방식으로)
CREATE TABLE COURSE_PK
(
   CNO VARCHAR2(6)
   CONSTRAINT PK_COURSE_PK PRIMARY KEY(CNO)
) 

--3) PF_TEMP 테이블에 PNO을 PK로 추가하세요.
ALTER PF_TEMP ADD CONSTRAINT PK_PF_TEMP  PRIMARY KEY(PNO)

--4) COURSE_PROFESSOR 테이블에 CNO, PNO을 PK로 추가하세요.
ALTER COURSE_PROFESSOR ADD CONSTRAINT PK_COURSE_PROFESSOR  PRIMARY KEY(CNO, PNO)

--5) BOARD_NO(NUMBER)를 PK로 갖으면서 BOARD_TITLE(VARCHAR2(200)), BOARD_CONTENT(VARCHAR2(2000)), 
--   BOARD_WRITER(VARCHAR2(20)), BOARD_FRGT_DATE(DATE), BOARD_LMDF_DATE(DATE) 컬럼을 갖는 T_BOARD 테이블을 생성하세요.
CREATE TABLE T_BOARD(
BOARD_NO NUMBER(10) PRIMARY KEY,
BOARD_TITLE VARCHAR2(200), 
BOARD_CONTENT VARCHAR2(2000), 
BOARD_WRITER VARCHAR2(20), 
BOARD_FRGT_DATE DATE,
BOARD_LMDF_DATE DATE 
  
 )
  

--6) BOARD_NO(NUMBER), BOARD_FILE_NO(NUMBER)를 PK로 갖으면서 BOARD_FILE_NM(VARCHAR2(200)), BOARD_FILE_PATH(VARCHAR2(2000)),
--   ORIGIN_FILE_NM(VARCHAR2(200)) 컬럼을 갖는 T_BOARD_FILE 테이블을 생성하세요.


CREATE TABLE T_BOARD_FILE (
BOARD_NO NUMBER(10) P,
BOARD_FILE_NO NUMBER(10), 
OARD_FILE_NM VARCHAR2(200), 
BOARD_FILE_PATH VARCHAR2(2000),
ORIGIN_FILE_NM VARCHAR2(200)
CONSTRAINT PK_T_BOARD_FILE  PRIMARY KEY(BOARD_NO, BOARD_FILE_NO )
  
 )

--7) 다음 구조를 갖는 테이블을 생성하세요.
--   T_SNS                              T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트위터                  3               30000                  2                  1
--                                                                               2                  2
CREATE TABLE T_SNS  ( 
SNS_NO NUMBER(8)  PRIMARY KEY,
SNS_NM VARCHAR2(20)  
 )
 CREATE TABLE T_SNS_DETAIL  ( 
  SNS_NO NUMBER(8),
  SNS_BEN  NUMBER(8),
  CONSTRAINT PK_T_SNS_DETAIL  PRIMARY KEY(SNS_NO) ,                    
  CONSTRAINT FK_T_SNS_DETAIL  FOREIGN KEY(SNS_NO)
 )