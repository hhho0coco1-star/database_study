
SELECT * FROM emp2;
SELECT * FROM dept2;

SELECT
    empno,
    name,
    deptno,
    (SELECT dname FROM dept2 WHERE e.deptno = dcode) DNAME,
    (SELECT dname FROM dept2 WHERE e.deptno = dcode) AREA,
    pay
FROM emp2 e
WHERE pay >
(
SELECT
    AVG(pay)
FROM emp2 e, dept2 d
WHERE area = 
(SELECT
    d.area
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode AND e.name = 'AL Pacino')
GROUP BY area
);


SELECT
    *
FROM emp2
WHERE name = 'AL Pacino';

SELECT
    e.empno,
    e.name,
    e.deptno,
    d.dname,
    d.area,
    e.pay
FROM emp2 e, dept2 d
WHERE pay > (
SELECT
    AVG(pay)
FROM emp2
WHERE deptno IN (
SELECT
    dcode -- 해당 근무지역인 부서번호
FROM dept2
WHERE area = (
SELECT area -- 부서의 근무지역
FROM dept2
WHERE dcode = ( SELECT -- 알파치노 소속부서번호
                    deptno
                FROM emp2
                WHERE name = 'AL Pacino') ) ) )
AND e.deptno = d.dcode;