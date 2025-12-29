SELECT * FROM emp;

-- Quiz01
SELECT * FROM emp
ORDER BY ename;

-- Quiz02
SELECT * FROM emp
ORDER BY deptno, sal DESC;

-- Quiz03
SELECT * FROM emp
WHERE sal > 2000
ORDER BY sal DESC;

-- Quiz04
SELECT * FROM student
WHERE grade NOT IN(1)
ORDER BY birthday DESC;