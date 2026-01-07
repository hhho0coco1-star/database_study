
DML 테이블 내부의 데이터 조작

INSERT 저장 인인벨
수정 UPDATE 업셋웨
DELETE 삭제 델프웨
병합 MERGE

INSERT INTO  테이블명 (컬럼명, 컬럼명 ...) -- 컬럼명은 생략가능
VALUES (데이터값, 데이터값, ...);

SELECT * FROM new_table;

INSERT INTO new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE); -- SYSDATE 현재날짜 삽입

INSERT INTO new_table 
VALUES (2, '이름2', TO_DATE('2026-01-01')); -- SYSDATE 현재날짜 삽입

INSERT ALL -- 여러개의 값
INTO ;

SELECT * FROM new_table2;

INSERT INTO new_table2
SELECT no, name, birth FROM new_table;

-- UPDATE
UPDATE 테이블명
SET 컬럼명 = 값,
    컬럼명 = 값
WHERE 조건;

CREATE TABLE dept3
AS
SELECT * FROM dept2;

UPDATE dept3
SET area = 'Incheon Branch Office'
--SELECT * FROM dept3
WHERE area = 'Seoul Branch Office';

SELECT * FROM dept3;
--WHERE area = 'Seoul Branch Office';

UPDATE dept3
SET dname = 'Sales First Team'
WHERE dcode = '1008';

CREATE TABLE professor2
AS
SELECT * FROM professor;

SELECT * FROM professor;
SELECT * FROM professor2;

UPDATE professor2
SET bonus = bonus + 100 -- 수정 후, 저장!
WHERE bonus IS NOT NULL;

Transaction
commit -- 확정
rollback -- 되돌리기

-- 삭제

DELETE FROM 테이블명
WHERE 조건;

SELECT * FROM dept3;

DELETE FROM dept3
WHERE dcode = '0001';