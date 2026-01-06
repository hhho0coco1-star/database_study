-- DDL : 테이블 명령어

-- 테이블 생성
CREATE TABLE 테이블명
(
    컬러명 컬럼타입    기타속성/제약,
    컬러명 컬럼타입    기타속성/제약,
    컬러명 컬럼타입    기타속성/제약
);

CREATE TABLE new_table
(
    no NUMBER(3),       -- 숫자형 3자리수
    name VARCHAR(16),   -- 문자형 16bite 공간
    birth DATE          -- 날짜형
);

SELECT * FROM new_table;

CREATE TABLE new_table2
(
    no NUMBER(3),       -- 숫자형 3자리수
    name VARCHAR(16),   -- 문자형 16bite 공간
    birth DATE          -- 날짜형
);

SELECT * FROM new_table2;

-- 테이블 복사
SELECT * FROM dept2;

CREATE TABLE dept3
AS SELECT * FROM dept2;

SELECT * FROM dept3;

CREATE TABLE dept4
AS
SELECT * FROM dept2
WHERE 1 = 2; -- 데이터가 조회되지 않도록 거짓 조건 추가

SELECT * FROM dept4;

-- 테이블 변경 (수정)
ALTER TABLE dept4 
ADD (loc VARCHAR(32)); -- add : 컬럼 추가

ALTER TABLE dept4
ADD (lv NUMBER(3) DEFAULT 1); -- DEFAULT 기본 값 1로 설정

SELECT * FROM dept4;

ALTER TABLE dept4
DROP COLUMN lv; -- DROP 컬럼 삭제

-- 테이블 삭제
DROP TABLE dept3;

-- 테이블 내부 데이터 삭제
TRUNCATE TABLE dept3;
SELECT * FROM dept3;

-- rollback 불가 / 자동 commit