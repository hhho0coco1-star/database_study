SELECT * FROM dept;
SELECT * FROM professor;

-- Quiz01
SELECT deptno AS "부서번호", dname AS "부서이름", loc 위치 
FROM dept;

-- Quiz02
SELECT name || '(' || id || ')' AS "교수정보", 
position, hiredate "입사일자", email "이메일"
FROM professor;
 