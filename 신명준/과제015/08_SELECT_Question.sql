--1) 평점이 3.0에서 4.0사이의 학생을 검색하라(between and)
SELECT *
  FROM STUDENT S
  WHERE S.AVR  BETWEEN 3.0 AND 4.0  

--2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라(between and)
SELECT *
FROM PROFESSOR P
WHERE P.HIREDATE BETWEEN TO_DATE('19940101 00:00:01', 'YYYYMMDD HH24:MI:SS') 
                     AND TO_DATE('19951231 23:59:59', 'YYYYMMDD HH24:MI:SS');

--3) 화학과와 물리학과, 생물학과 학생을 검색하라(in)
SELECT *
FROM STUDENT S 
WHERE S.MAJOR in('화학','물리','생물')

--4) 정교수와 조교수를 검색하라(in)
SELECT *
FROM PROFESSOR P 
WHERE P.ORDERS  in('정교수','조교수')

--5) 학점수가 1학점, 2학점인 과목을 검색하라(in)
SELECT *
FROM COURSE C
WHERE C.ST_NUM  in(1,2)

--6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라(between and)
SELECT *
FROM STUDENT ST
WHERE ST.SYEAR IN (1,2)
AND ST.AVR  BETWEEN  2.0 AND 3.0


--7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라(in)
SELECT *
FROM STUDENT ST
WHERE ST.SYEAR IN (1,2)
AND ST.MAJOR  IN ('화학','물리')
ORDER BY ST.AVR 

--8) 부임일이 1995년 이전인 정교수를 검색하라(to_date)
SELECT *
FROM PROFESSOR P
WHERE P.HIREDATE < TO_DATE('19950101 00:00:00', 'YYYYMMDD HH24:MI:SS')
AND P.ORDERS = '정교수'