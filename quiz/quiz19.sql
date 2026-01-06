-- Quiz01
SELECT
    *
FROM
    emp2;

SELECT
    name,
    position,
    pay
FROM
    emp2
WHERE
    pay > ANY (
        SELECT
            pay
        FROM
            emp2
        WHERE
            position = 'Section head'
    );

-- 풀이
SELECT
    name,
    position,
    pay
FROM
    emp2
WHERE
    pay > (
        SELECT
            MIN(pay)
        FROM
            emp2
        WHERE
            position = 'Section head'
    );

-- Quiz02
SELECT
    *
FROM
    student;

SELECT
    name,
    grade,
    weight
FROM
    student
WHERE
    weight < ALL (
        SELECT
            weight
        FROM
            student
        WHERE
            grade = 2
    )
ORDER BY
    grade DESC;

-- 풀이
SELECT
    name,
    grade,
    weight
FROM
    student
WHERE
    weight < (
        SELECT
            MIN(weight)
        FROM
            student
        WHERE
            grade = 2
    );

-- Quiz03
SELECT
    *
FROM
    emp2;

SELECT
    *
FROM
    dept2;

SELECT
    (
        SELECT
            dname
        FROM
            dept2 d
        WHERE
            d.dcode = e.deptno
    ) dname,
    name,
    pay
FROM
    emp2 e
WHERE
    pay < ALL (
        SELECT
            AVG(pay) pay
        FROM
            emp2
        GROUP BY
            deptno
    );

-- 풀이
SELECT
    d.dname,
    e.name,
    e.pay
FROM
    emp2  e,
    dept2 d
WHERE
        pay < (
            SELECT
                MIN(avg_pay)
            FROM
                (
                    SELECT
                        AVG(pay) avg_pay
                    FROM
                        emp2
                    GROUP BY
                        deptno
                )
        )
    AND e.deptno = d.dcode;

SELECT
    MIN(avg_pay)
FROM
    (
        SELECT
            AVG(pay) avg_pay
        FROM
            emp2
        GROUP BY
            deptno
    );

SELECT
    e.name,
    d.dname,
    e.pay
FROM
    emp2  e,
    dept2 d
WHERE
        e.deptno = d.dcode
    AND e.pay < ALL (
        SELECT
            AVG(pay)
        FROM
            emp2
        GROUP BY
            deptno
    );

-- Quiz04
SELECT
    *
FROM
    professor;

SELECT
    *
FROM
    department;

SELECT
    profno,
    name,
    (
        SELECT
            dname
        FROM
            department de
        WHERE
            de.deptno = p1.deptno
    ) dname
FROM
    professor p1
WHERE
    hiredate IN (
        SELECT
            MIN(hiredate)
        FROM
            professor p2
        GROUP BY
            p2.deptno
    )
ORDER BY
    hiredate;

SELECT
    COUNT(*),
    MAX(hiredate)
FROM
    professor
GROUP BY
    deptno;

-- 풀이
SELECT
    profno,
    name,
    d.dname
FROM
    professor  p,
    department d
WHERE
    ( p.deptno, p.hiredate ) IN (
        SELECT
            deptno, MIN(hiredate)
        FROM
            professor
        GROUP BY
            deptno
    )
    AND p.deptno = d.deptno;

-- RANK() OVER (PARTITION BY 컬럼명 ORDER BY 컬럼명) RANK

SELECT
    profno,
    name,
    (
        SELECT
            d.dname
        FROM
            department d
        WHERE
            d.deptno = p.deptno
    ) dname
FROM
    (
        SELECT
            profno,
            name,
            deptno,
            hiredate,
            RANK()
            OVER(PARTITION BY deptno
                 ORDER BY
                     hiredate
            ) rank
        FROM
            professor
    ) p
WHERE
    rank = 1;

-- Quiz05
SELECT
    *
FROM
    emp2;

SELECT
    name,
    position,
    pay
FROM
    emp2 e1
WHERE
    name = (
        SELECT
            MAX(name)
        FROM
            emp2 e2
        WHERE
                e2.position = e1.position
            AND e2.pay = (
                SELECT
                    MAX(pay)
                FROM
                    emp2 e3
                WHERE
                    e3.position = e1.position
            )
    )
ORDER BY
    pay;

-- 풀이
SELECT
    name,
    position,
    pay
FROM
    emp2
WHERE
    ( position, pay ) IN (
        SELECT
            position, MAX(pay)
        FROM
            emp2
        GROUP BY
            position
    )
ORDER BY
    pay;

-- Quiz06
SELECT
    *
FROM
    student;

SELECT
    *
FROM
    department;

SELECT
    (
        SELECT
            dname
        FROM
            department de
        WHERE
            de.deptno = st.deptno1
    )                          dname,
    MAX(height)
    OVER(PARTITION BY deptno1) AS max_height,
    name,
    height
FROM
    student st
WHERE
    ( deptno1, height ) IN (
        SELECT
            deptno1, MAX(height) max_height
        FROM
            student
        GROUP BY
            deptno1
    );

-- 풀이
SELECT
    d.dname,
    s.height,
    s.name,
    s.height
FROM
    student    s,
    department d
WHERE
    ( deptno1, height ) IN (
        SELECT
            deptno1, MAX(height)
        FROM
            student
        GROUP BY
            deptno1
    )
    AND s.deptno1 = d.deptno;

SELECT
    c.dname,
    a.max_height,
    b.name,
    b.height
FROM
    (
        SELECT
            deptno1,
            MAX(height) max_height
        FROM
            student
        GROUP BY
            deptno1
    )          a,
    student    b,
    department c
WHERE
        a.deptno1 = b.deptno1
    AND a.max_height = b.height
    AND a.deptno1 = c.deptno;

-- Quiz07
SELECT
    *
FROM
    student;

SELECT
    st1.grade,
    st1.name,
    st1.height,
    st2.avg_height
FROM
    (
        SELECT
            grade,
            AVG(height) avg_height
        FROM
            student
        GROUP BY
            grade
    )       st2,
    student st1
WHERE
        st1.grade = st2.grade
    AND st1.height > st2.avg_height
ORDER BY
    grade;
    
-- 풀이
SELECT s1.grade, s1.name, s1.height,
(SELECT AVG(s2.height) FROM student s2 WHERE s2.grade = s1.grade) 평균키
FROM student s1 WHERE s1.height >
(SELECT AVG(s2.height) FROM student s2 WHERE s2.grade = s1.grade);