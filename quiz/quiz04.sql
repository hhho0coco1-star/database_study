-- Quiz01
SELECT * FROM student;

SELECT name AS "이름", 
    SUBSTR(birthday, 1, 2) AS "년도", 
    SUBSTR(birthday, 4, 2) AS "월",
    SUBSTR(birthday, 7, 2) AS "일"
FROM student;

-- Quiz02
SELECT * FROM student;

SELECT name, tel, INSTR(tel, ')') AS 괄호위치 FROM student
WHERE deptno1 = 201;

-- Quiz03
SELECT name, tel, INSTR(tel, 3) AS 첫3위치 FROM student
WHERE deptno1 = 101;

-- Quiz04
SELECT * FROM student;

SELECT name, tel, SUBSTR(tel, 1, INSTR(tel, ')') - 1) AS 지역번호 FROM student
WHERE deptno1 IN(201);
