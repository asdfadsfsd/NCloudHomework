--1) 각 학과별 학년별 학생 수를 ROLLUP함수로 검색하세요
SELECT MAJOR 
	, SYEAR 
	, COUNT(SNO)
	FROM STUDENT
	GROUP BY ROLLUP (MAJOR , SYEAR);

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하는 데 화학과 생물이 열로 만들어지도록 하세요.(PIVOT 사용)
SELECT 화학 / 4.0 * 4.5 AS "화학 4.5"
	, 생물 / 4.0 * 4.5 AS "생물 4.5"
	FROM (
			SELECT MAJOR
				, AVR
				FROM STUDENT
		 )
	PIVOT(
		AVG(AVR)
			FOR MAJOR IN (
							'화학' AS "화학"
							, '생물' AS "생물"
						 )
		 );

--3) 학과별 학생이름을 ,로 구분하여 성적순으로(내림차순) 조회하세요.(LISTAGG 사용)
SELECT MAJOR
	, LISTAGG(SNAME, ', ')
	WITHIN GROUP(ORDER BY AVR DESC)
	FROM STUDENT
	GROUP BY MAJOR;

--4) 부서별 업무별 연봉의 평균을 검색하세요(부서와 업무 컬럼의 그룹화 여부도 같이 검색, GROUPING 사용)
SELECT DNO
	, JOB
	, AVG(SAL)
	, GROUPING(DNO)
	, GROUPING(JOB)
	, GROUPING_ID(DNO, JOB) 
	FROM EMP
	GROUP BY CUBE(DNO, JOB);