
1. 조회하기 SELECT

SELECT 조회대상(컬럼명) FROM 테이블명;

테이블 구조 확인 (Describe)
DESC 테이블명;
DESC emp;
-- DESC / ASC : 오름차순 / 내림차순 과는 다름

* : 전체 ALL
select * from dept;
SELECT * FROM DEPT;
-- 컨트롤 + 엔터 : 명령문 실행
-- 대소문자 구분 없음

select * from fruit;
select * from LOAN;
select * from product; -- product 테이블에 있는 모든 컬럼 데이터 조회

select * from emp;
select job from emp;
select job, hiredate, mgr from emp;

-- 가독성
select
    job,
    hiredate,
    mgr
from emp;

select *
from emp;

-- 컬럼명 별도 지정(별칭)
select 컬럼명
from 테이블명;

select 컬럼명 as "컬럼별칭",
       or 컬럼명 "컬럼명칭",
       or 컬럼명 컬럼칭
from 테이블명;

SELECT 
    empno AS "사원번호",
    ename "사원이름",
    job 부서,
    sal 급여
FROM EMP;
-- 띄어쓰기 중요

select empno,
        ename AS "COPY_NAME", 
        ename "COPY_NAME2", 
        job "부서"
from emp;
-- 컬럼명은 변수처럼 여러 번 사용 가능하다

-- 조회데이터 리터럴 값 활용
select '문자', 123 from emp;
-- 테이블에 있는 행의 값만큼 반복(emp : 12번)

select * from dept;
select '문자', 123 from dept;

select '문자', 123 from dual;
-- dual 임시 테이블

select '문자확인' as "문자컬럼별칭",
        123 + 333 + 444 연산결과
from dual;

select dname, loc, '안녕', 12345 from dept;
select '문자''작은따옴표' from dual;
select q'[문자'문자]' from dual;

-- 문자 이어 붙이기 ||
select '오늘' || '너무춥다' from dual;

select
    '부서번호' || deptno 부서번호,
    deptno,
    '500+' ||(deptno+500)
from dept;


