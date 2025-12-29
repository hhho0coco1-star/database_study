-- 집합 연산자
UNION 합집합(중복 x)
UNION ALL 합집합(중복 O)
INTERSECT 교집합
MINUS 차집합

-- 조건(제약)
    1. 컬럼 갯수 동일
    2. 컬럼 데이터형(타입) 동일
    3. 컬럼명은 달라도 상관없음
    
-- student 101번학과 학생 + 102번학과 학생 정보 모아서 조회
SELECT * FROM student
WHERE deptno1 in(101, 102);

-- 각각의 조건을 줄 때 사용할 수 있다
SELECT * FROM student
WHERE deptno1 = 101
UNION ALL
SELECT * FROM student
WHERE deptno1 = 102;


SELECT studno, name, deptno1 FROM student
WHERE deptno1 = 101
UNION ALL
SELECT profno, name, deptno FROM professor
WHERE deptno = 101;