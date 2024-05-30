--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT ROWNUM
      , ST.*
FROM(
   SELECT STUDENT.*
   FROM STUDENT
   ORDER BY AVR DESC
 ) ST
 WHERE ROWNUM <=3
  

--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요
SELECT ROWNUM
      , C_INFO.*
FROM(
   SELECT COURSE.*
         , AVR_INFO."AVG"
    FROM COURSE 
    JOIN (SELECT CNO
       	     , AVG("RESULT") AS "AVG"
  		  FROM COURSE
  		  JOIN SCORE
  		  USING(CNO)
  		  GROUP BY CNO
          ) AVR_INFO
      ON COURSE.CNO = AVR_INFO.CNO
      ORDER BY "AVG" DESC
 ) C_INFO
 WHERE ROWNUM <=3

--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)

SELECT ROWNUM
      , ST_INFO.*
FROM(
      SELECT MAJOR
            ,SYEAR
            ,AVG("RESULT") AS "AVG"
        FROM STUDENT  
        JOIN SCORE
        USING(SNO)
        GROUP BY  MAJOR,SYEAR
        ORDER BY "AVG" DESC
 ) ST_INFO
 WHERE ROWNUM <=3
  
  

--4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM
      , P_INFO.*
  FROM(
       SELECT PNAME
            , CNAME
            , "AVG"
       FROM PROFESSOR
       JOIN COURSE 
       USING(PNO)
       JOIN (SELECT  CNO
            		,AVG("RESULT") AS "AVG"
        		FROM COURSE 
        	 	JOIN SCORE
        		USING(CNO)
       		    GROUP BY CNO 
             ) AVG_INFO
         USING(CNO)
         ORDER BY AVG_INFO."AVG" DESC
 ) P_INFO
 WHERE ROWNUM <=3
  

--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.
SELECT ROWNUM
      , P_INFO.*
  FROM(
       SELECT PNO
            , PNAME
            , ST_COUNT
         FROM PROFESSOR
         JOIN( SELECT PNO
                    , COUNT(SNO) AS ST_COUNT
                 FROM PROFESSOR
                 JOIN COURSE
                 USING(PNO)
                 JOIN SCORE
                 USING(CNO)
                 GROUP BY PNO
             )
          USING(PNO)
          ORDER BY ST_COUNT DESC
           
 ) P_INFO
 WHERE ROWNUM <=3
 