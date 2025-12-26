-- Quiz01
select (name||q'['s ]')||
    (q'[ID : ]'||id)||
    ('WEIGHT is '||weight||'Kg') 
    as "ID AND WEIGHT" 
from student;

-- test

select name || q'['s ID : ]' 
    || id || ' WEIGHT is ' 
    || weight || 'Kg' 
AS "ID AND WEIGHT" FROM student;

-- Quiz02
select (ename||'('||job||'), ')||
    (ename||''''||job||'''') "NAME AND JOB" from emp;

-- test
SELECT ename || '(' || job || '), ' ||
    ename || '''' || job || '''' "NAME AND JOB" from emp;

-- Quiz03
select (ename||q'['s sal is $]'||sal) as "Name and Sal" from emp;

-- test
select ename || q'['s sal is $]' || sal AS "Name and Sal" from emp;

SELECT ename
    || q'[s sal is $]'
    || sal AS "Name and Sal"
FROM emp;