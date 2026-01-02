-- JOIN

SELECT * FROM department; -- 학과 정보
SELECT * FROM student;
SELECT * FROM professor;

SELECT *
FROM student s, department d
WHERE s.deptno1 = d.deptno;

SELECT s.name, s.deptno1, d.dname
FROM student s, department d
WHERE s.deptno1 = d.deptno;

SELECT s.name, p.name, d.dname
FROM student s, professor p, department d
WHERE s.profno = p.profno
AND s.deptno1 = d.deptno;

SELECT s.name, p.name, d.dname
FROM 
    student s INNER JOIN professor p ON s.profno = p.profno
        INNER JOIN department d ON s.deptno1 = d.deptno
        WHERE s.deptno1 = 101;
        
1) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호
SELECT s.name, s.deptno1, d.dname, p.name, p.deptno
FROM student s INNER JOIN professor p ON  s.profno = p.profno
INNER JOIN department d ON s.deptno1 = d.deptno;

2) 학생명, 학생학과번호, 교수의 학과명, 교수명, 교수학과번호
SELECT s.name, s.deptno1, d.dname, p.name, p.deptno
FROM student s INNER JOIN professor p ON  s.profno = p.profno
INNER JOIN department d ON p.deptno = d.deptno;

2) 학생명, 학생학과번호, 학생의학과명, 교수명, 교수학과번호, 교수의 학과명
SELECT s.name, s.deptno1, d.dname, p.name, p.deptno, dp.dname
FROM student s INNER JOIN professor p ON s.profno = p.profno
INNER JOIN department d ON s.deptno1 = d.deptno
INNER JOIN department dp ON p.deptno = dp.deptno;

SELECT *
FROM customer c, gift g
WHERE c.point BETWEEN g.g_start AND g.g_end;

SELECT *
FROM customer c INNER JOIN gift g
ON c.point BETWEEN g.g_start AND g.g_end;

SELECT * FROM hakjum;

-- SELF JOIN

SELECT * FROM emp;

SELECT e1.ename 사원이름, e2.ename 상사이름, e1.mgr, e2.empno, e2.ename 상사이름
FROM emp e1 JOIN emp e2
ON e1.mgr = e2.empno;

SELECT a.empno, a.name, a.pempno, b.empno, b.name
FROM emp2 a, emp2 b
WHERE a.pempno = b.empno;