-- DQL (질의어) : 데이터 조회할때 사용 

-- select 컬럼명 
-- from 테이블명

-- 전체 데이터 조회 
select empno,ename,job,mgr,hiredate,comm,sal,deptno from emp; 
select * from emp;   -- *: 전체

-- 부분컬럼 데이터 조회
select empno,ename,sal from emp;
select deptno from emp;

-- 중복 데이터 제거 (DISTINCT)
select DISTINCT deptno from emp;

select job from emp;
select DISTINCT job from emp;

-- 컬럼에 연산 가능 ( + , - , * , /  : 4가지만 제공 나머지 연산자는 없음) 컬럼을 대상으로 연산 
-- null 데이터는 연산할 수 없다. -> null 값과 기존 데이터를 연산하게되면 기존 데이터도 null값 으로 변경됨  
-- nvl (컬럼명 , null값일때 변경할 값 ) : null값이 들어있는 컬럼을 0으로 변경해서 연산 
-- 컬럼에 별칭을 사용할 수 있다.  as 별칭
select ename as 사원이름 ,sal as 월급 ,sal * 12 + nvl(comm,0)as 연봉 ,comm as 상여금 from emp;


-- 데이터 정렬
-- order by 컬럼명(정렬기준이 되는 값) asc(오름차순)/desc(내림차순);
select * from emp order by sal desc; -- 내림차순
select * from emp order by sal; -- 오름차순은 생략 가능하다.(기본설정)
    --오름차순 기준: 숫자 (1~10), 날짜(과거날짜~최근날짜), 문자(사전순서)

-----------------------------------------------------------------------------------------------------------

-- 조건검색
-- where 조건식(컬럼명 = 값);     
-- [  < , > , = , != / <>(다르다는 두가지 표현이 있음) , <= , >=, and , or  ]

-- and : 두가지 이상의 조건이 모두 참인경우
select * from emp where sal >= 3000; -- 급여(sal)가 3000 이상인 사원
select * from emp where deptno = 30; -- 30번인 부서번호(deptno)에서 일하는 사람
select * from emp where deptno = 30 and job = 'SALESMAN'; -- 30번인 부서번호(deptno)에서 직업(job)이 SALESMAN인 사람
          --문자를 쓸때는 홑따옴표(')를 사용, 문자로 된 데이터 값은 대-소문자 구분하기!
            select * from emp where ename = 'ford'; -- 소문자 ford는 데이터에 존재하지 않기 때문에 조회가 안 됨!
            select * from emp where ename = 'FORD';
            
--or : 두가지 이상의 조건 중에 하나 이상이 참인 경우
select * from emp where deptno = 10 or sal >= 2000; -- 부서번호(deptno)가 10이거나 급여가 2000이상인 사람

 -- 날짜를 조건절에 사용할 때 
 -- (')사용
 -- 날짜도 크기가 있다
 -- 80/12/20 -> 1980 12 20 시간 분 초 요일
select * from emp where hiredate < '1982/01/01'; -- 1982년 01월 01일 이전에 입사한 사람

-- 문자열 대소 비교
select * from emp where ename >= 'F'; -- ENAME(ename) 열(데이터) 값의 첫 문자와 대문자 F를 비교했을 때
                                      -- 알파벳 순서상 F와 같거나 F보다 뒤에 있는 문자열을 출력한다.
                                      
-- not 논리부정 연산자
SELECT * FROM emp where sal != 3000;
SELECT * FROM emp where not sal = 3000; -- 급여(sal)가 3000이 아닌 사람.(둘 다 같음)

-- 범위 조건을 표현
-- and , or , between and , in 
 SELECT * FROM emp where sal >= 1000 and sal <= 3000; 
 SELECT * FROM emp where sal <= 1000 or sal >=3000;

-- between and (and 범위 조건을 더 간소화 가능)
SELECT * FROM emp where sal >= 1000 and sal <= 3000;
SELECT * FROM emp where sal BETWEEN 1000 and 3000;

-- in (or 범위 조건을 더 간소화 가능)
SELECT * FROM emp WHERE sal = 800 or sal = 3000 or sal = 5000;
SELECT * FROM emp WHERE sal in(800,3000,5000);

-----------------------------------------------------------------------------------------------------------

-- like 연산자
-- 값의 일부만 가지고 데이터를 조회
-- 와이드 카드를 사용한다 ( % , _ )
-- % : 모든 문자를 대체한다.
-- _ : 한 문자를 대체한다.
select * from emp where ename like 'F%'; -- 'F'로 시작하면서 뒤에 문자는 있어도 되고 없어도 된다.
select * from emp where ename like '%D'; -- 'D'로 끝나는 데이터 값, 'D' 앞에 문자는 있어도 되고 없어도 된다.
select * from emp where ename like '%O%'; -- 이름 중에 'O'가 어디든 들어가도 된다.

select * from emp where ename like '___D'; -- ('_'x3) 4글자 중 맨 뒤에 글자가 'D'인 사람 ex) WARD,FORD
select * from emp where ename like '______'; -- ('_'x6) 이름이 6글자인 사람

select * from emp where ename like 'M__%'; -- ('_'x2) 첫글자가 'M'인 앞 3글자는 반드시 들어가고, 뒤에는 있던 없던 상관없다.(M으로 시작하는 3글자이상의 이름) 
     
     
-- null연산자     
-- is null / is not null
select * from emp where comm = null; -- null 데이터는 비교 불가!

select * from emp where comm is null; -- null에 특화된 연산자 사용해야됨!
select * from emp where comm is not null;     

-----------------------------------------------------------------------------------------------------------

-- 집합 연산자 
-- 두개의 select 구문을 사용한다.
-- 컬럼의 갯수가 동일해야 한다.
-- 컬럼의 타입이 동일해야 한다.
-- 컬럼의 이름은 상관없다.
-- 합집합(union), 차집합(minus), 교집합(intersect)
select empno,ename,sal,deptno from emp where deptno = 10; -- 3명
select empno,ename,sal,deptno from emp where deptno = 20; -- 5명

--(1)
select empno,ename,sal,deptno from emp where deptno = 10 --세미콜론 지우기!
union -- (합집합 연산자)
select empno,ename,sal,deptno from emp where deptno = 20; -- 8명 

--(2)
select empno,ename,sal,deptno from emp where deptno = 10 union select empno,ename,sal,deptno from emp where deptno = 10; -- union 사용 시 중복되는 자료의 경우 한번만 조회
select empno,ename,sal,deptno from emp where deptno = 10 union all select empno,ename,sal,deptno from emp where deptno = 10; -- union all 사용 시 중복되어도 모든 값 조회

--(3)
select empno,ename,sal,deptno from emp -- 14명
minus -- (차집합 연산자)
select empno,ename,sal,deptno from emp where deptno = 20; -- 5명 결국 14-5 = 9명

--(4)
select empno,ename,sal,deptno from emp -- 14명
intersect -- (교집합 연산자)
select empno,ename,sal,deptno from emp where deptno = 20; -- 5명 결국 교집합은 5명


-- order by
-- where
-- 비교 연산자, 논리 연산자, 집합 연산자
-- < , > , <= , >= , = , != / <>
-- and, or, not, between and, in
-- like ( % , _ )
-- is null , is not null
-- UNION, UNION ALL, MINUS, INTERSECT


--p.125
--Q1
SELECT * FROM emp where ename like '%S';

--Q2
SELECT empno,ename,job,sal,deptno FROM emp where deptno = 30 and job = 'SALESMAN';

--Q3
SELECT empno,ename,job,sal,deptno FROM emp where deptno in (20, 30) and sal > 2000;

SELECT empno,ename,job,sal,deptno FROM emp where deptno = 20 and sal > 2000
union
SELECT empno,ename,job,sal,deptno FROM emp where deptno = 30 and sal > 2000;

--Q4
SELECT * FROM emp where not (sal >=2000 and sal <=3000);

SELECT * FROM emp where sal < 2000 or sal > 3000;
--Q5 
SELECT ename,empno,sal,deptno FROM emp where deptno = 30 and ename like '%E%' and sal not between 1000 and 2000;

SELECT ename,empno,sal,deptno FROM emp where deptno = 30 and ename like '%E%'
minus
SELECT ename,empno,sal,deptno FROM emp where sal between 1000 and 2000;

--Q6
SELECT * FROM emp where comm is NULL and job = 'MANAGER' or job ='CLERK'
intersect
SELECT * FROM emp where ename not like '_L%';

-----------------------------------------------------------------------------------------------------------

-- 함수
-- 문자함수: upper, lower, substr, instr, replace, rpad, lpad,concat
-- 숫자함수
-- 날짜함수

--문자==
select 'Welcom',upper('Welcom') from dual;
select lower(ename),upper(ename) from emp;

SELECT * FROM emp where ename = 'FORD';
SELECT * FROM emp where lower(ename) = 'scott';

SELECT ename, length(ename) from emp; -- length() 해당 컬럼 데이터의 문자열의 길이를 알려줌

--     -16     ~      -1  
--      1      ~      16 (띄어쓰기, 쉼표등도 포함)    ┌2번째 글자부터 3개의 글자 추출     ┌11번째 글자부터 뒷 글자 모두 추출           
SELECT 'Welcom to Oracle',substr('Welcom to Oracle',2,3), substr('Welcom to Oracle',11) FROM dual;
SELECT 'Welcom to Oracle',substr('Welcom to Oracle',-4,3), substr('Welcom to Oracle',-16) FROM dual;
--                                                 └뒤에서 4번째 글자부터 3개의 글자 추출 └11번째 글자부터 뒷 글자 모두 추출
select instr('Welcom to Oracle','o') from dual;  -- 첫번째로 나오는 'o'의 인덱스 번호 = 5
select instr('Welcom to Oracle','o',6) from dual; -- 6번째 부터 시작해서 첫번째로 나오는 'o'의 인덱스 번호 = 9
select instr('Welcom to Oracle','e',1,2) from dual; -- 1번째 부터 시작해서 두번째로 나오는 'o'의 인덱스 번호 = 16

SELECT 'Welcom to Oracle', replace('Welcom to Oracle','to','of') from dual;-- to -> of
                   --  ┌ 메인    ┌공백문자
select 'oracle',lpad('oracle',10,'#'), rpad('oracle',10,'*'),lpad('oracle',10) from dual; 
                          --  └총 공간 수(메인 인덱스 수 + 공백문자)
-- lpad: 왼쪽 빈공간에 공백문자, rpad 오른쪽 빈공간에 공백문자, 공백문자 미설정 시 공백으로 나옴
select rpad('990103-',14,'*') from dual;

select concat(empno,ename), empno||' '||ename from emp;-- 연결할 때 쓰는 함수

-----------------------------------------------------------------------------------------------------------

--숫자==
select
     --[ -3 -2 -1 0 1 2 3 ] = 정수부분은 '-'로 표시
        round(1234.5678),
        round(1234.5678,0), -- 소수점 0번째 자리까지 반올림하여 출력
        round(1234.5678,1),
        round(1234.5678,2), -- 소수점 2번째 자리까지 반올림하여 출력
        round(1234.5678,-1) -- 정수 부분을 반올림하여 출력
                             from dual;

select
        trunc(1234.5678),
        trunc(1234.5678,0), -- 소수점 0번째 자리까지만 살리고 나머지는 다 버린 뒤 출력
        trunc(1234.5678,1),
        trunc(1234.5678,2), -- 소수점 2번째 자리까지만 살리고 출력
        trunc(1234.5678,-1) 
                             from dual;

select
        ceil(3.14), -- 자신보다 큰 가장 가까운  정수 = 4
        floor(3.14), -- 자신보다 작은 가장 가까운 정수 = 3
        ceil(-3.14), -- = -3
        floor(-3.14) -- = -4
                             from dual;                             
                             
select  -- (a,b)
        mod(5,2),   -- a를 b로 나눈 나머지 구하기! 
        mod(10,4) 
                from dual;    
-- mod()함수 활용                
select * from emp where mod(empno,2) = 1; -- 사번(empno)이 홀수인 사람














