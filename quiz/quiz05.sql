
SELECT * FROM student;
SELECT * FROM professor;

-- Quiz01
SELECT studno 번호, name 이름, id 아이디  FROM student
WHERE height >= 160 AND height <= 175 
UNION ALL
SELECT profno, name, id
FROM professor
WHERE deptno IN(101, 102, 103, 201) AND bonus IS NULL;

-- Quiz02
SELECT * FROM student;

--SELECT '이름:'||name 이름, '아이디:'||id 아이디, '주민번호:'||SUBSTR(jumin, 1, 6)||'-'||SUBSTR(jumin, 7, 7) 주민번호 FROM student;
SELECT 
    CONCAT('이름:', name) AS 이름, 
    CONCAT('아이디:',id) AS 아이디,
    '주민번호:'||SUBSTR(jumin, 1, 6)|| '-' || SUBSTR(jumin, 7) AS 주민번호
FROM student;
