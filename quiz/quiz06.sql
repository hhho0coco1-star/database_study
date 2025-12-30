-- Quiz01

SELECT * FROM emp;
-- REPLACE('abcd', 'c', '/')

SELECT ename, REPLACE(ename, SUBSTR(ename, 3, 2), '--') AS "REPLACE" FROM emp
WHERE deptno = 20;

-- Quiz02
SELECT * FROM student;

SELECT name, REPLACE(jumin, SUBSTR(jumin, 7), '-/-/-/-') AS "주민뒷자리숨김" FROM student
WHERE deptno1 = 101;

-- Quiz03
SELECT * FROM student;

-- INSTR(대상값/컬럼명, 찾는값) : 인덱스 위치 반환
-- INSTR(대상값/컬럼명, 찾는값, 시작위치)
-- INSTR(대상값/컬럼명, 찾는값, 시작위치, 몇번째값)

SELECT name, tel, REPLACE(tel, SUBSTR(tel, (INSTR(tel, ')') + 1), 3),'***') AS "REPLACE" FROM student
WHERE deptno1 = 102;

SELECT 
    name, 
    tel, 
    REPLACE(tel, SUBSTR(tel, (INSTR(tel, ')') + 1), 3), '***') AS "REPLACE",
    SUBSTR(tel, (INSTR(tel, ')') + 1)),
    SUBSTR(tel, INSTR(tel, '-')), -- 8
    
    REPLACE(tel, SUBSTR(tel, (INSTR(tel, ')')+1))) || 
    RPAD('*', (INSTR(tel, '-')-1) - INSTR(tel, ')'), '*')||
    SUBSTR(tel, INSTR(tel, '-')) AS Ez
FROM student;


-- Quiz04
SELECT name, tel, REPLACE(tel, SUBSTR(tel, (INSTR(tel, '-') + 1), 4), '****') AS "REPLACE" FROM student
WHERE deptno1 = 101;