-- Quiz01
SELECT * FROM student;
SELECT * FROM score;
SELECT * FROM hakjum;

SELECT s.studno 학번, s.name 이름, sc.total 점수, h.grade AS "학점"
FROM student s, score sc, hakjum h
WHERE s.studno = sc.studno AND sc.total BETWEEN h.min_point AND h.max_point
ORDER BY sc.total DESC;

-- Quiz02
SELECT s.studno 학번, s.name 이름, sc.total 점수, h.grade AS "학점"
FROM student s, score sc, hakjum h
WHERE s.studno = sc.studno AND sc.total BETWEEN h.min_point AND h.max_point
AND s.deptno1 IN(101, 102)
ORDER BY sc.total DESC;

-- Quiz03
SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM professor;

SELECT st.name, st.grade, p.name, p.deptno, de.dname
FROM student st, department de, professor p
WHERE st.profno  = p.profno AND  p.deptno = de.deptno
AND p.deptno != 301
ORDER BY grade DESC;
