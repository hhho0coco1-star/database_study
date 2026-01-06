-- Quiz01

SELECT * FROM student;
SELECT * FROM department;

SELECT deptno1
FROM student st
WHERE name = 'Anthony Hopkins';

SELECT
    st.name,
    st.deptno1,
    (SELECT dname FROM department WHERE deptno = st.deptno1) AS "DNAME"
FROM student st
WHERE st.deptno1 = (SELECT deptno1
                    FROM student
                    WHERE name = 'Anthony Hopkins');

-- Quiz02
SELECT * FROM professor;
SELECT * FROM department;

SELECT
    p.name,
    p.hiredate,
    (SELECT de.dname FROM department de WHERE de.deptno = p.deptno) AS "DNAME"
FROM professor p
WHERE hiredate > (SELECT
                    hiredate
                    FROM professor
                    WHERE name = 'Meg Ryan')
ORDER BY hiredate;

-- Quiz03
SELECT
    name,
    weight
FROM student
WHERE weight > (SELECT
                    AVG(weight) 
                FROM student
                WHERE deptno1 = 201);

-- Quiz04
SELECT * FROM emp2;
SELECT * FROM dept2;

SELECT
    empno,
    name,
    deptno
FROM emp2
WHERE deptno IN (SELECT
                    dcode
                FROM dept2
                WHERE area = 'Pohang Main Office');




