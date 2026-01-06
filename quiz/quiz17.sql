-- 2026.01.05(월) 정답체크 Quiz

SELECT * FROM student;
SELECT * FROM department;

-- Quiz01
SELECT 
    st.name STU_NAME,
    st.deptno1,
    de.dname DEPT_NAME
FROM student st JOIN department de
ON st.deptno1 = de.deptno
ORDER BY st.deptno1;

-- Quiz02
SELECT * FROM emp2;
SELECT * FROM p_grade;

SELECT
    em.name,
    em.position,
    TO_CHAR(em.pay, '9,999,999,999') AS PAY,
    TO_CHAR(pg.s_pay, '9,999,999,999') AS "LOW PAY",
    TO_CHAR(pg.e_pay, '9,999,999,999') AS "HIGH PAY"
FROM emp2 em
LEFT OUTER JOIN p_grade pg 
             ON em.position = pg.position
WHERE em.position IS NOT NULL
ORDER BY em.pay;

-- Quiz03
SELECT * FROM emp2;
SELECT * FROM p_grade;

--SELECT 
--    em.name,
--    TRUNC(MONTHS_BETWEEN(TO_DATE('2010-05-30', 'YYYY-MM-DD'), em.birthday)/12) + 1 한국나이,
--    em.position 지금포지션,
--    CASE 
--    WHEN TRUNC(MONTHS_BETWEEN(TO_DATE('2010-05-30', 'YYYY-MM-DD'), em.birthday)/12) + 1 
--    BETWEEN pg.s_age AND pg.e_age THEN pg.position 
--    END 그나이에맞는포지션
--FROM emp2 em, p_grade pg
--WHERE TRUNC(MONTHS_BETWEEN(TO_DATE('2010-05-30', 'YYYY-MM-DD'), em.birthday)/12) + 1
--      BETWEEN pg.s_age(+) AND pg.e_age(+)
--ORDER BY em.birthday DESC;

SELECT 
    em.name NAME,
    2010 - TO_CHAR(em.birthday, 'YYYY') + 1 한국나이,
    em.position 지금포지션,
    pg.position 그나이에맞는포지션
FROM emp2 em, p_grade pg
WHERE 2010 - TO_CHAR(em.birthday, 'YYYY') + 1
    BETWEEN pg.s_age AND pg.e_age
ORDER BY em.birthday DESC;

-- Quiz04
SELECT * FROM customer;
SELECT * FROM gift;

SELECT
    c.gname,
    c.point,
    g.gname
FROM customer c, gift g
WHERE g.gname = 'Notebook' AND c.point >= g.g_start;

-- Quiz05
SELECT 
    p1.profno,
    p1.name,
    p1.hiredate,
    (SELECT COUNT(*)
    FROM professor p2
    WHERE p2.hiredate < p1.hiredate) COUNT
FROM professor p1
ORDER BY p1.hiredate, p1.profno;

-- Quiz06
SELECT * FROM emp;

SELECT
    e1.empno,
    e1.ename,
    e1.hiredate,
    (SELECT COUNT(*)
    FROM emp e2
    WHERE e2.hiredate < e1.hiredate) COUNT
FROM emp e1
ORDER BY e1.hiredate;
