-- 데이터 딕셔너리 : 오라클 DB에 관련된 각종 정보를 확인할 수 있는 사전

-- 접근 자료 구분
USER_   : 현재 로그인한 사용자가 소유한 객체 정보 조회
ALL_    : 현재 로그인한 사용자가 볼 수 있는 모든 객체 정보 조회
DBA_    : DB 관리자 계정에서 DB 모든 객체 정보 조회

SELECT * FROM USER_TABLES;

SELECT * FROM ALL_TABLES;

--SELECT * FROM DBA_TABLES; -- 현재 관리자 계정이 아님으로 볼 수 없다!

SELECT * FROM USER_VIEWS;
SELECT * FROM USER_SEQUENCES; -- 기준이 되는 번호표
SELECT * FROM USER_OBJECTS; -- 객체 정보
SELECT * FROM USER_CONSTRAINTS; -- 테이블에 걸려있는제 제약정보
SELECT * FROM USER_CONS_COLUMNS; -- 열에 대한 제약정보
SELECT * FROM USER_INDEXES; -- 인덱스 정보
SELECT * FROM USER_IND_COLUMNS; -- 인덱스 열 정보

SELECT * FROM ALL_USERS; -- 사용자 정보
SELECT * FROM USER_ROLE_PRIVS; -- 권한 정보

-- 테이블 정보 이름 조회시 사용
SELECT * FROM TAB;

SELECT * FROM TAB
WHERE TNAME LIKE '%DEPT%';

SELECT * FROM dept3;









