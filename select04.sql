-- 단일행 함수

SELECT * FROM dual;
dual : 더미 데이터 들어있는 임시 테이블

SELECT INITCAP('abc') -- 첫 문자 대문자 변환, 뒷 글자 소문자로 변환
FROM dept;

SELECT INITCAP(ename) FROM emp;

SELECT name, LOWER(name), UPPER(name)
FROM student;

SELECT name, LENGTH(name)
FROM student;

SELECT LENGTH('abcd') "길이" FROM dual;

SELECT LENGTHB('한글') "길이" FROM dual;
-- LENGTHB : bite

-- 이름이 알파벳 5글자 이상 조회
SELECT *
FROM emp
WHERE LENGTH(ename) >= 5;

SELECT 
'아침' || '점심' || '저녁', 
CONCAT(CONCAT('아침','점심'), '저녁')
FROM dual;

-- SUBSTR(대상값/컬럼명, 시작지점(1부터 시작), 자릿수)

SELECT SUBSTR('abcdefg', 1, 3),
SUBSTR('abcdefg', -3, 3)
FROM dual;

-- INSTR(대상값/컬럼명, 찾는값) : 인덱스 위치 반환
-- INSTR(대상값/컬럼명, 찾는값, 시작위치)
-- INSTR(대상값/컬럼명, 찾는값, 시작위치, 몇번째값)

SELECT 
    INSTR('2025-06-05 10:22:45', '-'),
    INSTR('2025-06-05 10:22:45', ':'),
    INSTR('2025-06-05 10:22:45', '-', 6),
    INSTR('2025-06-05 10:22:45', ':', 15),
    INSTR('2025-06-05 10:22:45', '-', 1, 2)
FROM dual;

SELECT
    -- 문자 채우기
    LPAD('문자', 10, '-'),
    RPAD('13kd', 8, '*')
FROM dual;

SELECT 
    LTRIM(' abcd '),
    RTRIM(' abcd '),
    TRIM(' abcd '),
    LTRIM('*** abcd %%%', '*')
FROM dual;

-- 문자 변환
SELECT 
    REPLACE('abcd', 'c', '/')
FROM dual;

-- 숫자
SELECT 
    ROUND(1.1),
    ROUND(1.5),
    ROUND(1.55, 1),
    ROUND(34341.5, -2),
    
    -- 버림
    TRUNC(1.3556),
    TRUNC(1.3556, 2),
    
    -- 나머지
    MOD(15, 4),
    
    CEIL(123.123), -- 인접한 큰 정수
    FLOOR(123.123), -- 인접한 작은 정수
    POWER(6, 3) -- 6의 3제곱
FROM dual;
    
SELECT rownum, empno, CEIL(rownum/3) 그룹, CEIL(rownum/4) 팀
FROM emp;
-- rownun 모든 테이블에 들어가 있는 기본 값

-- 날짜
SELECT 
    SYSDATE, -- 현재 날짜
    SYSTIMESTAMP, -- 현재 날짜시간
    MONTHS_BETWEEN('2024-01-05', '2024-03-05')
FROM dual;

SELECT 
    ADD_MONTHS(SYSDATE, 3),
    LAST_DAY(SYSDATE),
    NEXT_DAY(SYSDATE, '토')
FROM dual;

SELECT
    SYSDATE,
    ROUND(SYSDATE),
    TRUNC(SYSDATE, 'YY'),
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'DD'),
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3, -- 일 단위 계산
    
    LAST_DAY(SYSDATE) + 1,
    TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM'), -- 다음 달 첫 날
    TRUNC(SYSDATE, 'MM')-1
FROM dual;


