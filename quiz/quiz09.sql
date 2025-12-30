-- Quiz01
SELECT *
FROM professor;

SELECT
    profno,
    name,
    pay,
    bonus,
    TO_CHAR(
    NVL2(bonus, (pay * 12)+ bonus, (pay * 12)), '9,999,999') AS TOTAL
FROM professor
WHERE deptno = 201;

-- Quiz02
SELECT 
    empno,
    ename,
    comm,
    NVL2(comm, 'Exist', 'NUll') AS NVL2
FROM emp
WHERE deptno = 30;
