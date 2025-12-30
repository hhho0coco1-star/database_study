-- Quiz01
SELECT * FROM professor;

SELECT 
    deptno,
    name,
    CASE 
        WHEN deptno = 101 AND name = 'Audie Murphy' THEN 'BEST!'
        ELSE 'NULL'
    END DECODE
FROM professor;

-- Quiz02
SELECT * FROM professor;

SELECT 
    deptno,
    name,
    CASE 
        WHEN deptno = 101 AND name = 'Audie Murphy' THEN 'BEST!'
        WHEN deptno = 101 THEN 'GOOD!'
        ELSE 'NULL'
    END 비고
FROM professor;

-- Quiz03
SELECT * FROM professor;

SELECT 
    deptno,
    name,
    CASE 
        WHEN deptno = 101 AND name = 'Audie Murphy' THEN 'BEST!'
        WHEN deptno = 101 THEN 'GOOD!'
        ELSE 'N/A'
    END 비고
FROM professor;


-- Quiz04
SELECT * FROM student;

SELECT 
    name,
    jumin,
    DECODE(SUBSTR(jumin, 7, 1), 1, '남자', '여자') AS 성별
FROM student;

-- Quiz05
SELECT * FROM student;

SELECT 
    name,
    tel,
    INSTR(tel, ')'),
    SUBSTR(tel, 1, INSTR(tel, ')')-1),
    DECODE(SUBSTR(tel, 1, INSTR(tel, ')') - 1), 
    02, '서울', 031, '경기', 051, '부산', 052, '울산', 055, '경남', '그 외') AS 지역명
FROM student
WHERE deptno1 = 101;

