-- 형 변환 함수(타입변환)

SELECT 2+2 FROM dual;
SELECT 2 || 2 FROM dual; -- 이어 붙이기
SELECT 2+'2' FROM dual; -- 자동 형 변환(묵시적 형 변환)
SELECT 2+ TO_NUMBER('2') FROM dual; -- 명시적 형 변환

TO_CHAR
TO_DATE
TO_NUMBER

SELECT
    TO_CHAR(123)
FROM dual;

SELECT
    TO_CHAR(123),
    TO_CHAR(123.45),
    SYSDATE,
    TO_CHAR(SYSDATE),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD')
FROM dual;

SELECT
    jumin,
    birthday,
    TO_CHAR(birthday, 'YY') 년,
    TO_CHAR(birthday, 'MM') 월,
    TO_CHAR(birthday, 'DD') 일,
    TO_CHAR(birthday, 'YYYY-MM/DD')
 
FROM student;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    SYSTIMESTAMP,
    TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
FROM dual;

SELECT 
    TO_CHAR(1234, '99999'),
    TO_CHAR(1234, '09999'),
    TO_CHAR(1234, '$9999')
FROM dual;

SELECT 
    '2025-12-29' || 3,
    TO_DATE('2025-12-29') + 3,
    TO_CHAR(TO_DATE('2025-12-29'), 'MM'),
    LAST_DAY('2025-02-01')
FROM dual;