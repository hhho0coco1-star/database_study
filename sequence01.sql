
-- 시퀀스 (Sequence) : 순차적으로 값을 사용하는 용도(번호표)
PK(기본키) 용으로 사용하거나 순차적인 데이터를 표현하기 위해서 사용하는 숫자 값
호출 할 때마다 자동으로 증가

시퀀스 생성

CREATE SEQUENCE 시퀀스 이름
INCREMENT BY 1 -- 증가할 값
START WITH 1 -- 시작 값
MINVALUE 1 -- 최소 값
MAXVALUE 10 -- 최대 값
CYCLE | NOCYCLE -- 순환연부 default : NOCYCLE
CACHE 20(기본값) | NOCACHE -- 숫자 메모리에 미리 저장해둘 갯수
;

시퀀스 삭제
DROP SEQUENCE 시퀀스 이름

시퀀스 사용(호출)
시퀀스이름.nextval 다음값 호출(사용)
시퀀스이름.currval 현재값 확인
;
-- PK 설정 / PK에 활용

CREATE TABLE SEQ_TEST -- table 생성
(
    no NUMBER(6) PRIMARY KEY,
    name VARCHAR2(32)
);

SELECT * FROM seq_test; -- table 조회

-- 수동으로 no (pk) 값을 확인하고 처리
INSERT INTO seq_test values(1, '이름1');
INSERT INTO seq_test values(2, '이름2');
INSERT INTO seq_test values(3, '이름3');


-- 1. 서브쿼리로 no 순번 값을 계산 처리 ( COUNT 함수 사용 )
SELECT COUNT(*) FROM seq_test; -- 행에 대한 COUNT 갯수 확인

SELECT COUNT(*) + 1 FROM seq_test; -- 행에 대한 COUNT 갯수 확인

-- 서브쿼리 이용
INSERT INTO seq_test VALUES ( (SELECT COUNT(*) + 1 FROM seq_test), '이름3');

-- 사용자가 탈퇴할 경우 
-- 사용자 한명 탈퇴 3번 사용자 ? 
SELECT * 
-- DELETE
FROM seq_test WHERE no = 3;

-- 데이터 관리를 어떻게 하느냐? 삭제(탈퇴) 어떻게 관리? 사용자가 탈퇴하면?
    1) 데이터 행 삭제 (DELETE FROM ...)
    2) 삭제된 것 처럼 상태 값으로 관리 ('Y', 'N' ...) -- 상태를 나타내는 컬럼 추가 필요!

-- 2. 서브쿼리로 no 순번 값을 계산 처리 ( MAX 함수 사용)
INSERT INTO seq_test VALUES ( (SELECT MAX(no) + 1 FROM seq_test), '이름5');
SELECT * FROM seq_test; -- table 조회

-- MAX 값 사용 시, 데이터 초기 값이 없을 때 문제발생!
DELETE FROM seq_test;
SELECT NVL(MAX(no), 0) + 1 FROM seq_tset;
SELECT NVL(MAX(no) + 1, 1)FROM seq_tset;

-- 마지막 no 값 데이터가 지워졌을 때
SELECT *
-- delete
FROM seq_test
WHERE no = 3;

-- 3. 시퀀스로 no 순번 값을 처리

-- 시퀀스 생성
CREATE SEQUENCE 시퀀스 이름
INCREMENT BY 1 -- 증가할 값
START WITH 1 -- 시작 값
MINVALUE 1 -- 최소 값
MAXVALUE 10 -- 최대 값
CYCLE | NOCYCLE -- 순환연부 default : NOCYCLE
CACHE 20(기본값) | NOCACHE -- 숫자 메모리에 미리 저장해둘 갯수
;

-- T_테이블명, V_View명
-- 제약 dept3_id_nn
-- 3.1 시퀀스 생성
CREATE SEQUENCE seq_seq_test_pk 
INCREMENT BY 1 -- 증가
START WITH 1; -- 시작

SELECT seq_seq_test_pk.nextval FROM dual; -- nextval 다음 숫자
SELECT seq_seq_test_pk.currval FROM dual; -- currval 현재 값 확인

SELECT * FROM seq_test
ORDER BY no;

INSERT INTO seq_test VALUES (seq_seq_test_pk.nextval, '이름5');
INSERT INTO seq_test VALUES (seq_seq_test_pk.nextval, '이름6');
INSERT INTO seq_test VALUES (seq_seq_test_pk.nextval, '이름7');

SELECT *
--DELETE
FROM seq_test
WHERE no IN(2, 20);

-- PK 로 시퀀스 사용
CL1 CL2 CL3 ... 'CL' || swq.nextval
SH1 SH2 SH3 ... 'SH' || seq.nextval

-- 다음 시퀀스 값 조정 다시 1부터 시작

1) 삭제 후 재생성
DROP SEQUENCE seq_seq_test_pk;

CREATE SEQUENCE seq_seq_test_pk 
INCREMENT BY 1 -- 증가
START WITH 1; -- 시작

SELECT seq_seq_test_pk.nextval FROM dual; -- nextval 다음 숫자

2) 다음 시퀀스 값 조정(초기화)
SELECT seq_seq_test_pk.currval FROM dual;  -- 현재 값 확인
-- 다음에 1증가한 값 뽑을 때, 1이 나오게 만들기
-- 0으로 바꾸기

-- 값 조정되는 기준을 변경(@잘 쓰지는 않음@)
ALTER SEQUENCE seq_seq_test_pk INCREMENT BY -4;
ALTER SEQUENCE seq_seq_test_pk MINVALUE 0;
SELECT seq_seq_test_pk.nextval FROM dual; -- nextval 다음 숫자
ALTER SEQUENCE seq_seq_test_pk INCREMENT BY 1;
SELECT seq_seq_test_pk.nextval FROM dual; -- nextval 다음 숫자
SELECT seq1.currval FROM dual;

CREATE SEQUENCE seq1
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 5
NOCYCLE;

SELECT seq1.currval FROM dual;

CREATE SEQUENCE seq2
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 5
CYCLE
CACHE 3;

SELECT seq2.nextval FROM dual;

CREATE SEQUENCE seq3
START WITH 100
INCREMENT BY 5;

SELECT seq3.nextval FROM dual;



