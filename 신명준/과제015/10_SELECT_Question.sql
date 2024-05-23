--1) 학생중에 동명이인을 검색한다
SELECT DISTINCT ST.SNAME 
               ,ST.SNO
  FROM STUDENT ST
  JOIN STUDENT STSUB
    ON ST.SNO != STSUB.SNO 
    AND ST.SNAME = STSUB.SNAME  

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
  SELECT  P.PNAME
        , P."SECTION" 
        , C.CNAME 
  FROM PROFESSOR P
  LEFT JOIN COURSE C
   ON  C.PNO =P.PNO 
  ORDER BY P."SECTION" 

--3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다
  SELECT C.CNAME
       , P.PNAME 
       , C.ST_NUM 
    FROM COURSE C
    LEFT JOIN PROFESSOR P
           ON C.PNO =P.PNO
    ORDER BY C.ST_NUM 
