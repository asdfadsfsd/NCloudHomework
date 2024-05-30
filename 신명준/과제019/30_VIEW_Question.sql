--뷰 이름은 자유
--1) 학생의 평점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW  V1 ( AVR )AS(SELECT AVR*1.125 FROM STUDENT)

--2) 각 과목별 기말고사 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW V2("AVG") 
AS( SELECT AVG("RESULT")
     FROM  SCORE
     GROUP BY(CNO) 
  )

--3) 각 사원과 관리자(MGR)의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW V3(MGNAME,NAME) 
AS( SELECT MG.MGNAME
          , ENAME
     FROM EMP
     JOIN  ( SELECT E.ENAME AS MGNAME,
           		    E.ENO
     		FROM  EMP E
     		JOIN  EMP EE
     		  ON EE.MGR = E.ENO) MG
       ON MG.ENO = EMP.MGR 
  )

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW V4(CNO,CNAME,GRADE,SNO,SNAME) 
AS(
    SELECT CNO,
           CNAME,
           GRADE,
           SNO,
           SNAME
     FROM STUDENT
     JOIN SCORE SC
     USING(SNO)
     JOIN COURSE
     USING(CNO)
     JOIN SCGRADE 
       ON  "RESULT" BETWEEN LOSCORE AND HISCORE
  )

--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
CREATE VIEW V6(SNO,SNAME) 
AS(
    SELECT 
          DISTINCT  SNO
          , SNAME
     FROM STUDENT
     JOIN SCORE SC
     USING(SNO)
     JOIN COURSE
     USING(CNO)
     JOIN PROFESSOR 
     USING(PNO)
     WHERE "SECTION" LIKE '%물리%'
  )