
SELECT *
FROM emp;

NVL
NVL2 (대상값, 있, 없)

SELECT 
    NVL(null, 10),
    NVL(20, 10),
    NVL2(null, 0, 1)
FROM dual;

***DECODE

DECODE(대상, 비교값, '같다', '다르다');

SELECT
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    -- '다르다' or null 생략 가능
    DECODE(30, 20, '20이다', 30, '30이다', 40, '40이다', '아니다')
FROM dual;

SELECT *
FROM professor;

-- CASE 문
-- 1~4(1 ~ 2 저 , 3 ~ 4 고)

SELECT 
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년', 'who?') AS "구분",
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
        ELSE '그 외'
    END 구분2,
    
    CASE
        WHEN grade IN (1, 2) THEN '저'
        WHEN grade IN (3, 4) THEN '고'
    END 구분3
FROM student;