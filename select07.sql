-- 복수행 함수(집계)

-- COUNT : 갯수

SELECT COUNT(*) AS "EMP TABLE"
FROM emp;

-- COUNT(컬럼명) : NULL 을 제외한다
-- COUNT(*) : NULL 을 제외하지 않는다
SELECT 
    COUNT(empno),
    COUNT(mgr),
    COUNT(deptno)
FROM emp;

SELECT COUNT(*) AS "4학년 인원"
FROM student
WHERE grade = 4;

-- 집계함수 : SUM, AVG, MAX, MIN, STDDEV(표준편차), VARIANCE(분산) : 평균에서 얼마나 분산되어 있는지?, COUNT