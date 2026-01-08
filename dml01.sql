
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

CREATE TABLE new_table4
(
    no NUMBER(3) DEFAULT 0,
    name VARCHAR(16) DEFAULT 'NONAME',
    birth DATE DEFAULT SYSDATE
);

DEFAULT : 저장되는 값이 없을 때, 저장하는 기본값

INSERT INTO new_table3
VALUES (1, 'name1', TO_DATE('2020-01-05'));

SELECT * FROM new_table3;

INSERT INTO new_table3
VALUES (2, null, TO_DATE('2020-05-05'));

INSERT INTO new_table4(no, birth)
VALUES (1, TO_DATE('2020-05-05'));

SELECT * FROM new_table4;

INSERT INTO new_table4
VALUES (1, 'name1', TO_DATE('2020-01-05'));

NOT NULL : null 저장 불가
UNIQUE : 고유적인 값
CHECK : 저장 가능한 범위 설정

CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE,
    name VARCHAR(16) NOT NULL,
    birth DATE
);

INSERT INTO tt01
VALUES(1, 'name1', SYSDATE);

SELECT * FROM tt01;

INSERT INTO tt01
VALUES (2, 'name2', SYSDATE);

INSERT INTO tt01
VALUES (2, 'name3', SYSDATE); -- UNIQUE 값 오류 발생

INSERT INTO tt01 (no, birth)
VALUES (3, SYSDATE);

INSERT INTO tt01 (name, birth)
VALUES ('name3', SYSDATE); -- UNIQUE 값에 null은 삽입이 가능하다

-- UNIQUE NOT NULL 중복 특성 적용 가능

CREATE TABLE tt02
(
    no NUMBER(3)
        CONSTRAINT tt02_no_uq UNIQUE, -- CONSTRAINT 제약이름 제약속성
    name VARCHAR(16)
        CONSTRAINT tt02_name_nn NOT NULL,
    birth DATE,
    score NUMBER(3)
        CONSTRAINT tt03_score_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR(2)
        CONSTRAINT tt03_pass_ck CHECK (pass IN ('Y', 'N'))
);
