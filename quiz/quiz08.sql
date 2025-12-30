-- Quiz01
SELECT * FROM emp;

SELECT 
    empno,
    ename,
    TO_CHAR((sal*12) + comm, '00,000') AS "SALARY"
FROM emp
WHERE ename = 'ALLEN';

-- Quiz02
SELECT * FROM emp;

SELECT 
    empno,
    ename,
    TO_CHAR(hiredate, 'YYYY-MM-DD') AS "HIREDATE",
    TO_CHAR((sal*12) + comm, '$999,999') AS "SAL",
    TO_CHAR(((sal*12) + comm) * 1.15, '$999,999') AS "15%인상"
FROM emp
WHERE comm IS NOT NULL;
