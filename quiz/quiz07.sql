-- Quiz01
SELECT * FROM student;

SELECT 
    studno,
    name,
    TO_CHAR(birthday, 'YYYY-MM-DD') AS BIRTHDAY
FROM student
WHERE TO_CHAR(birthday, 'MM') = 01;

-- Quiz02
SELECT * FROM emp;

SELECT 
    empno,
    ename,
    hiredate
FROM emp
WHERE TO_CHAR(hiredate, 'MM') IN(01, 02, 03);

