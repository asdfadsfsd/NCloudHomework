--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT  ADD_MONTHS(HIREDATE,1)- HIREDATE
FROM PROFESSOR
--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT ROUND(ROUND( (SYSDATE) - P.HIREDATE ) /7,0)  
FROM PROFESSOR P 

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT *
FROM PROFESSOR 
WHERE HIREDATE BETWEEN  TO_DATE('19910101 00:00:00' ,'YYYYMMDD HH24:MI:SS')
AND TO_DATE('19951231 23:59:59' ,'YYYYMMDD HH24:MI:SS') 

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT ROUND( AVR/4 *4.5,2)
 FROM  STUDENT s 

--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요
SELECT    FLOOR( MONTHS_BETWEEN(SYSDATE ,  HDATE)/12) AS y
        , FLOOR( MOD( MONTHS_BETWEEN(SYSDATE ,  HDATE) , 12 ) )  AS m
        , FLOOR( MOD(SYSDATE - HDATE ,31))
      
FROM EMP
