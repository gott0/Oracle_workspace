-- DQL (���Ǿ�) : ������ ��ȸ�Ҷ� ��� 

-- select �÷��� 
-- from ���̺��

-- ��ü ������ ��ȸ 
select empno,ename,job,mgr,hiredate,comm,sal,deptno from emp; 
select * from emp;   -- *: ��ü

-- �κ��÷� ������ ��ȸ
select empno,ename,sal from emp;
select deptno from emp;

-- �ߺ� ������ ���� (DISTINCT)
select distinct deptno from emp;

select job from emp;
select DISTINCT job from emp;

-- �÷��� ���� ���� ( + , - , * , /  : 4������ ���� ������ �����ڴ� ����) �÷��� ������� ���� 
-- null �����ʹ� ������ �� ����. -> null ���� ���� �����͸� �����ϰԵǸ� ���� �����͵� null�� ���� �����  
-- nvl (�÷��� , null���϶� ������ �� ) : null���� ����ִ� �÷��� 0���� �����ؼ� ���� 
-- �÷��� ��Ī�� ����� �� �ִ�.  as ��Ī
select ename as ����̸� ,sal as ���� ,sal * 12 + nvl(comm,0)as ���� ,comm as �󿩱� from emp;

-- ������ ����
-- order by �÷���(���ı����� �Ǵ� ��) asc(��������)/desc(��������);
select * from emp order by sal desc; -- ��������
select * from emp order by sal; -- ���������� asc ���� �����ϴ�.(�⺻����)
    --�������� ����: ���� (1~10), ��¥(���ų�¥~�ֱٳ�¥), ����(��������)

================================================================================================================

-- ���ǰ˻�
-- where ���ǽ�(�÷��� = ��);     
-- [  < , > , = , != / <>(�ٸ��ٴ� �ΰ��� ǥ���� ����) , <= , >=, and , or  ]

-- and : �ΰ��� �̻��� ������ ��� ���ΰ��
select * from emp where sal >= 3000; -- �޿�(sal)�� 3000 �̻��� ���
select * from emp where deptno = 30; -- 30���� �μ���ȣ(deptno)���� ���ϴ� ���
select * from emp where deptno = 30 and job = 'SALESMAN'; -- 30���� �μ���ȣ(deptno)���� ����(job)�� SALESMAN�� ���
          --���ڸ� ������ Ȭ����ǥ(')�� ���, ���ڷ� �� ������ ���� ��-�ҹ��� �����ϱ�!
            select * from emp where ename = 'ford'; -- �ҹ��� ford�� �����Ϳ� �������� �ʱ� ������ ��ȸ�� �� ��!
            select * from emp where ename = 'FORD';
            
--or : �ΰ��� �̻��� ���� �߿� �ϳ� �̻��� ���� ���
select * from emp where deptno = 10 or sal >= 2000; -- �μ���ȣ(deptno)�� 10�̰ų� �޿��� 2000�̻��� ���

 -- ��¥�� �������� ����� �� 
 -- (')���
 -- ��¥�� ũ�Ⱑ �ִ�
 -- 80/12/20 -> 1980 12 20 �ð� �� �� ����
select * from emp where hiredate < '1982/01/01'; -- 1982�� 01�� 01�� ������ �Ի��� ���

-- ���ڿ� ��� ��
select * from emp where ename >= 'F'; -- ENAME(ename) ��(������) ���� ù ���ڿ� �빮�� F�� ������ ��
                                      -- ���ĺ� ������ F�� ���ų� F���� �ڿ� �ִ� ���ڿ��� ����Ѵ�.
                                      
-- not ������ ������
SELECT * FROM emp where sal != 3000;
SELECT * FROM emp where not sal = 3000; -- �޿�(sal)�� 3000�� �ƴ� ���.(�� �� ����)

-- ���� ������ ǥ��
-- and , or , between and , in 
 SELECT * FROM emp where sal >= 1000 and sal <= 3000; 
 SELECT * FROM emp where sal <= 1000 or sal >=3000;

-- between and (and ���� ������ �� ����ȭ ����)
SELECT * FROM emp where sal >= 1000 and sal <= 3000;
SELECT * FROM emp where sal BETWEEN 1000 and 3000;

-- in (or ���� ������ �� ����ȭ ����)
SELECT * FROM emp WHERE sal = 800 or sal = 3000 or sal = 5000;
SELECT * FROM emp WHERE sal in(800,3000,5000);

================================================================================================================

-- like ������
-- ���� �Ϻθ� ������ �����͸� ��ȸ
-- ���̵� ī�带 ����Ѵ� ( % , _ )
-- % : ��� ���ڸ� ��ü�Ѵ�.
-- _ : �� ���ڸ� ��ü�Ѵ�.
select * from emp where ename like 'F%'; -- 'F'�� �����ϸ鼭 �ڿ� ���ڴ� �־ �ǰ� ��� �ȴ�.
select * from emp where ename like '%D'; -- 'D'�� ������ ������ ��, 'D' �տ� ���ڴ� �־ �ǰ� ��� �ȴ�.
select * from emp where ename like '%O%'; -- �̸� �߿� 'O'�� ���� ���� �ȴ�.

select * from emp where ename like '___D'; -- ('_'x3) 4���� �� �� �ڿ� ���ڰ� 'D'�� ��� ex) WARD,FORD
select * from emp where ename like '______'; -- ('_'x6) �̸��� 6������ ���

select * from emp where ename like 'M__%'; -- ('_'x2) ù���ڰ� 'M'�� �� 3���ڴ� �ݵ�� ����, �ڿ��� �ִ� ���� �������.(M���� �����ϴ� 3�����̻��� �̸�) 
     
     
-- null������     
-- is null / is not null
select * from emp where comm = null; -- null �����ʹ� �� �Ұ�!

select * from emp where comm is null; -- null�� Ưȭ�� ������ ����ؾߵ�!
select * from emp where comm is not null;     

================================================================================================================

-- ���� ������ 
-- �ΰ��� select ������ ����Ѵ�.
-- �÷��� ������ �����ؾ� �Ѵ�.
-- �÷��� Ÿ���� �����ؾ� �Ѵ�.
-- �÷��� �̸��� �������.
-- ������(union), ������(minus), ������(intersect)
select empno,ename,sal,deptno from emp where deptno = 10; -- 3��
select empno,ename,sal,deptno from emp where deptno = 20; -- 5��

--(1)
select empno,ename,sal,deptno from emp where deptno = 10 --�����ݷ� �����!
union -- (������ ������)
select empno,ename,sal,deptno from emp where deptno = 20; -- 8�� 

--(2)
select empno,ename,sal,deptno from emp where deptno = 10 union select empno,ename,sal,deptno from emp where deptno = 10; -- union ��� �� �ߺ��Ǵ� �ڷ��� ��� �ѹ��� ��ȸ
select empno,ename,sal,deptno from emp where deptno = 10 union all select empno,ename,sal,deptno from emp where deptno = 10; -- union all ��� �� �ߺ��Ǿ ��� �� ��ȸ

--(3)
select empno,ename,sal,deptno from emp -- 14��
minus -- (������ ������)
select empno,ename,sal,deptno from emp where deptno = 20; -- 5�� �ᱹ 14-5 = 9��

--(4)
select empno,ename,sal,deptno from emp -- 14��
intersect -- (������ ������)
select empno,ename,sal,deptno from emp where deptno = 20; -- 5�� �ᱹ �������� 5��


-- order by
-- where
-- �� ������, �� ������, ���� ������
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

================================================================================================================

-- �Լ�
-- �����Լ�: upper, lower, substr, instr, replace, rpad, lpad,concat,...
-- �����Լ�: round, trunc, ceil, floor, mod, ...
-- ��¥�Լ�: sysdate, round, trunc,...

--�����Լ�==
select 'Welcom',upper('Welcom') from dual;
select lower(ename),upper(ename) from emp;

SELECT * FROM emp where ename = 'FORD';
SELECT * FROM emp where lower(ename) = 'scott';

SELECT ename, length(ename) from emp; -- length() �ش� �÷� �������� ���ڿ��� ���̸� �˷���

--     -16     ~      -1  
--      1      ~      16 (����, ��ǥ� ����)    ��2��° ���ں��� 3���� ���� ����     ��11��° ���ں��� �� ���� ��� ����           
SELECT 'Welcom to Oracle',substr('Welcom to Oracle',2,3), substr('Welcom to Oracle',11) FROM dual;
SELECT 'Welcom to Oracle',substr('Welcom to Oracle',-4,3), substr('Welcom to Oracle',-16) FROM dual;
--                                                 ���ڿ��� 4��° ���ں��� 3���� ���� ���� ��-16��° ���ں��� �� ���� ��� ����
select instr('Welcom to Oracle','o') from dual;  -- ù��°�� ������ 'o'�� �ε��� ��ȣ = 5
select instr('Welcom to Oracle','o',6) from dual; -- 6��° ���� �����ؼ� ù��°�� ������ 'o'�� �ε��� ��ȣ = 9
select instr('Welcom to Oracle','e',1,2) from dual; -- 1��° ���� �����ؼ� �ι�°�� ������ 'o'�� �ε��� ��ȣ = 16

SELECT 'Welcom to Oracle', replace('Welcom to Oracle','to','of') from dual;-- to -> of
                   --  �� ����    �����鹮��
select 'oracle',lpad('oracle',10,'#'), rpad('oracle',10,'*'),lpad('oracle',10) from dual; 
                          --  ���� ���� ��(���� �ε��� �� + ���鹮��)
-- lpad: ���� ������� ���鹮��, rpad ������ ������� ���鹮��, ���鹮�� �̼��� �� �������� ����
select rpad('990103-',14,'*') from dual;

-- ������ �� ���� �Լ� & ������
-- concat() , ||   =  ���� ������ ����� ����(���⳪��)
select concat(empno,ename), empno||''||ename from emp;
select concat(empno,concat(' ',ename)), empno||' '||ename from emp;

================================================================================================================

--�����Լ�==
select
     --[ -3 -2 -1 0 1 2 3 ] = �����κ��� '-'�� ǥ��
        round(1234.5678),
        round(1234.5678,0), -- �Ҽ��� 0��° �ڸ����� �ݿø��Ͽ� ���
        round(1234.5678,1),
        round(1234.5678,2), -- �Ҽ��� 2��° �ڸ����� �ݿø��Ͽ� ���
        round(1234.5678,-1) -- ���� �κ��� �ݿø��Ͽ� ���
                             from dual;

select
        trunc(1234.5678),
        trunc(1234.5678,0), -- �Ҽ��� 0��° �ڸ������� �츮�� �������� �� ���� �� ���
        trunc(1234.5678,1),
        trunc(1234.5678,2), -- �Ҽ��� 2��° �ڸ������� �츮�� ���
        trunc(1234.5678,-1) 
                             from dual;

select
        ceil(3.14), -- �ڽź��� ū ���� �����  ���� = 4
        floor(3.14), -- �ڽź��� ���� ���� ����� ���� = 3
        ceil(-3.14), -- = -3
        floor(-3.14) -- = -4
                             from dual;                             
                             
select  -- (a,b)
        mod(5,2),   -- a�� b�� ���� ������ ���ϱ�! 
        mod(10,4) 
                from dual;    
-- mod()�Լ� Ȱ��                
select * from emp where mod(empno,2) = 1; -- ���(empno)�� Ȧ���� ���

================================================================================================================

--��¥�Լ�==
select sysdate from dual; --���� ��¥ ��ȸ

select sysdate -1 ����, select sysdate +1 ���� from dual;
    -- �����ó�¥  ���Ի糯¥
select sysdate - HIREDATE as �ٹ��ϼ� from emp; -- ���̰� �ϼ� ��ȯ 

--�ټӳ��
select trunc((sysdate - HIREDATE) / 365) as �ٹ��ϼ� from emp;
    --  �� ���� �κи� ����� ���� �Լ�(���� ���ǵǾ� ����)

select sysdate, -- (���� p.155 ����)
                round(sysdate, 'CC') as FORMAT_CC,
                round(sysdate, 'YYYY') as FORMAT_YYYY,
                round(sysdate, 'Q') as FORMAT_Q,
                round(sysdate, 'DDD') as FORMAT_DDD,
                round(sysdate, 'HH') as FORMAT_HH
        from dual;
        
 select sysdate, 
                trunc(sysdate, 'CC') as FORMAT_CC,
                trunc(sysdate, 'YYYY') as FORMAT_YYYY,
                trunc(sysdate, 'Q') as FORMAT_Q,
                trunc(sysdate, 'DDD') as FORMAT_DDD,
                trunc(sysdate, 'HH') as FORMAT_HH
        from dual;       
                
================================================================================================================

-- �ڷ�����ȯ �Լ�
--to_char() // ��¥-> ���� and ���� -> ����
--to_ number() // ���� -> ���� 
--to_date() // ���� -> ��¥

--    to_char()   to_date()
--  ��    ->    ��   ->   ��
--  ��    <-    ��   <-   ¥
--   to_number()  to_char()

--to_char( [��¥ ������] , [��µǱ� ���ϴ� ���� ����] ) // ��¥ -> ����
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')as ����ð� from dual;
select hiredate,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY')as �Ի����� from emp;

--to_char( [���� ������] , [��µǱ� ���ϴ� ���� ����] ) // ���� -> ����
select to_char(123456,'L999,999') from dual;
                   -- �� L�� ���� ������ ȭ�д����� ǥ����
select sal, to_char(sal,'L999,999')from emp;                   

--to_number( [���� ������] , [�νĵ� ���� ����] ) // ���� -> ���� // ���ڰ� ���� �������� �Ǿ��־�� ��ȯ����
select '20000' - 10000 from dual; -- �ڵ�����ȯ(�Ͻ�������ȯ)

select '20,000' - '5,000' from dual; -- to_number() ����ȯ�� �ؾ��Ѵ�.
      --  �� ���� ���̿� (,)�� ���� ���ڷ� �ڵ�����ȯ�� ���� �ʴ´�.
select to_number('20,000' , '999,999')- to_number('5,000' , '999,999')from dual; 

--to_date( [���� ������] , [�νĵ� ��¥ ����] ) // ���� -> ��¥  // ���ڰ� ��¥ �������� �Ǿ��־�� ��ȯ����
select to_date('20221019','YYYY/MM/DD') from dual;
select * from emp where hiredate < 19820101; -- �̷��� �ϸ� ���ڰ� ��¥������ �ƴ϶� ������
select * from emp where hiredate < to_date('19820101','YYYY-MM-DD');

================================================================================================================

-- null ������ ó��
-- nvl( null , �ٲٰ���� ������ )
-- nvl�� nill �������� Ÿ�԰� ���� Ÿ���� �����ؾ��Ѵ�.
-- nvl(����,����) , nvl(����,����)
select ename �����, sal, sal*12, + nvl(comm,0) as ����, comm from emp;

select * from emp where mgr is null;   -- mgr = null
select ename,job,mgr from emp where mgr is null;  -- mgr = null
select ename,job,nvl(to_char(mgr,'9999'),'CEO') from emp where mgr is null;
                           �� mgr�� �����ʹ� ���ڵ������̱� ������ ���ڵ����ͷ� ��ȯ�� ����ߵȴ�.
select comm, nvl2(comm,'O','X') from emp; -- null�� �� �ڿ� ����, nill�� �ƴ� �� �տ� ���� ���[nlv2()�� Ÿ�� �������]

================================================================================================================

-- ���ǹ� ǥ���ϴ� �Լ�
-- decode() -> switch   //�÷����� �νĵȴ� 
-- case -> if           //     "
select ename,job,deptno, decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ') as �μ��� from emp;
                      -- �� deptno �÷��� ���� 10�̸� AAA, 20�̸� BBB,..,�̵����� �ƴϸ� '��Ÿ'�� ǥ���ϰ� �ش� �÷����� '�μ���'���� ����

-- ������ ���ǽ����� ������ �� �ִ�
case 
     when ���ǽ�  then ���๮
     when ���ǽ�  then ���๮
     when ���ǽ�  then ���๮
     else ���๮
end as ��Ī   

select ename , job, deptno,
                          case when deptno = 10  then 'AAA'
                               when deptno = 20  then 'BBB'
                               when deptno = 30  then 'CCC'
                               else '��Ÿ'
                           end as �μ��� from emp;  
  
select ename , job, sal,
            case when sal between 3000 and 5000 then '�ӿ�'
                 when sal >= 2000 and sal < 3000 then '������'
                 when sal >= 500 and sal < 2000 then '���'
                 else '��Ÿ' end as ���� from emp;

================================================================================================================                

-- p.174
--Q1    
select empno,
            rpad(substr(empno,1,2),4,'*') as MASKING_EMPNO,
                         ename,
                              rpad(substr(ename,1,1),length(ename),'*') as MASKING_ENAME 
                                    from emp where length(ename) >= 5 and length(ename) < 6;  

--Q2 -- sal /21.5=�Ϸ��ϴ�
select empno,ename,sal,
trunc(sal /21.5,2) as Day_pay,
round(sal /21.5 / 8,1) as Time_pay
from emp; -- �ܴ�

--Q4
select empno,ename,mgr,
                 case when mgr is null then '0000'
                      when substr(mgr,1,2) = '75' then '5555'
                      when substr(mgr,1,2) = '76' then '6666'
                      when substr(mgr,1,2) = '77' then '7777'
                      when substr(mgr,1,2) = '78' then '8888'
                      else to_char(mgr) -- ������ ������� ����Ÿ���̱� ������ mgr(����Ÿ��)�� ����Ÿ������ �ٲ�����Ѵ�.
                      end as CHG_MGR from emp; 
                 
================================================================================================================
                
-- ������ �Լ� : �������� ���� ����� �ϳ��� ������ ��� 
select sum(sal) from emp;

select avg(sal) from emp;               
                 
select count(*), count(comm)
from emp; -- count()���̺� �����ϴ� ��ü ���ڵ�(�÷�)�� ����(but,�÷��� ������ ���� �� ���� �����Ͱ� �ִ� �÷��� �����ش�)  
 
select max(sal),min(sal) from emp; -- ���� �Լ��� ���ÿ� ������ �� �ִ�         
                 
select ename,max(sal) from emp; -- ������: �Ϲ� �÷��� ����ȭ �Լ��� ���� �� �� ����.
                                --[������(��)�� ������ �ϳ� �ۿ� ��� �������� ���� ��Ī�� �� �Ǳ� ����]
select min(hiredate), max(hiredate) from emp where deptno =20;                                               
    -- sum, avg, max, min, count
    -- �Ϲ� �÷��� ���� �� �� ����.
    -- ũ�� �񱳰� ����, ��� Ÿ�Կ� ��� ����
                 
================================================================================================================
--==�������!!!==

-- select �÷���
-- from ���̺��
-- where ���ǽ�(�׷��Լ� ��� �Ұ�!)(group by, having ���� ���� ����)
-- group by ���� �÷���
-- having ���ǽ�(�׷��Լ��� ����Ѵ�!)  = group by�� ¦�� (group by�� ���ؼ� ��ȸ�� ����� ������ �ش�)
-- order by �÷��� ���Ĺ�� => �� �������� �ۼ�

select avg(sal) from emp where deptno = 10     
union
select avg(sal) from emp where deptno = 20                      
union  -- ������ Ÿ�Ը� ��ġ�ϸ� ������ ������ ����
select avg(sal) from emp where deptno = 30;      

select avg(sal) from emp group by deptno; -- ���� 3��
select deptno from emp group by deptno;  -- ���� 3��

select deptno,avg(sal) from emp group by deptno; -- �÷��� ���ڵ�(��) ������ ������ ���� �� �� �ִ�.
                                                 -- �׷��⶧���� group by ���� �÷��� �Լ��� ���� �� �� �ִ�.
select deptno,avg(sal) 
from emp 
group by deptno
order by deptno;
                                                   
select deptno,job,avg(sal) 
from emp 
group by deptno,job    -- deptno�� �� �׷� �� �� ������ �׷� �ȿ��� job���� �ѹ� �� �׷�
order by deptno, job desc;  -- deptno�� �� ���� �� �� ������ ���� �ȿ��� job���� �ѹ� �� ����                                  
                                                 
select deptno,avg(sal) 
from emp 
group by deptno
having avg(sal) >= 2000; -- group by�� ���ؼ� ��ȸ�� ����� ������ �ش�.                                   
                         -- ���ǽ��� �ۼ��� �� �׷��Լ��� ����Ѵ�.                        
                                                 
select deptno,avg(sal) 
from emp 
where deptno != 10
group by deptno
having avg(sal) >= 2000;

================================================================================================================

-- ����(Join)
-- 2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�. 
-- where�� ���� ������ �ۼ��Ѵ�.
-- cross join (where �� ���� ����)
-- equi join (where �������: =)
-- non equi join (where ����������: and , or )
-- self join (where �ϳ��� ���̺��� ����Ѵ�)
-- outer join (where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ����: (+))

select ename, job, emp.deptno, dept.dname, loc -- ���� ���̺� ���� �̸��� �÷��� ���� �� �տ� (���̺��.)�� �ٿ� ������ ��
from emp,dept
where emp.deptno = dept.deptno; -- ���� ���Ǳ���(�����)

select ename, job, e.deptno, d.dname, loc
from emp e,dept d  -- ���̺� ��Ī �ο�(��Ī�� �ο��ϸ� ���� ���̺� �̸��� ����� �� ���� - �����߻�) , (as�� �÷��� ��Ī �ο� ȥ�� no)
where e.deptno = d.deptno
and sal >= 3000;

select ename, sal, grade, losal, hisal
from emp e, salgrade s
-- where e.sal >= s.losal and e.sal <= s.hisal;
where e.sal between s.losal and s.hisal;

-- ���, �̸�, �޿�, �μ���ȣ, �μ���, �޿����
-- �� emp ���̺� ��  ��dept ���̺�  �� salgrade ���̺� 
select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m -- �ݵ�� ��Ī �ο�(1���� ���̺��� 2���� ���̺�� ��������!!)
where e.mgr = m.empno;

--scott�� ���� �μ��� �ٹ��ϴ� ���
-- ename  ename
-- scott  smith
-- scott  jones
-- scott  adams
-- scott  ford

select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

-- �ܺ�����
-- � �� ������ �����͸� ���� ��ȸ�ϱ� ���ؼ� ���
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m 
where e.mgr = m.empno(+); -- �����Ͱ� ���� �ʿ� (+)�� ���δ�.
-- �ݴ����� �����Ͱ� �����Ǿ(�� = null) ��ȸ���ش�.

select ename, sal, d.deptno
from emp e, dept d
where e.deptno(+) = d.deptno;

================================================================================================================

-- ANSI-JOIN(������ ǥ�� ���� ���)
-- cross join
-- natural join
-- inner join(equi, non equi, self)
-- outer join( (+) ) // [left, right, full]out join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno); -- ���� ���̺��� �÷����� ������ ���(��, using ������ select������ �ش� Į���̸��տ� e��d�� ������ ��������.)

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno)
where ename = 'SCOTT'; -- �Ϲ� ������ where�� ����Ͽ� �߰�

select e.empno, e.ename, e.mgr, m.ename
from emp e inner join emp m
on e.mgr = m.empno; --self join

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m -- �����Ͱ� �ִ� ���� �����Ѵ�.
on e.mgr = m.empno;

select empno, ename, sal,d.deptno, dname, grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and hisal;


--select ename, sal, d.deptno
--from emp e, dept d
--where e.deptno(+) = d.deptno;  // �̰��� �Ƚ����� ������� �����غ���

--(1)
select ename, sal, deptno
from emp e right outer join dept d
using(deptno);
--(2)
select ename, sal, d.deptno
from emp e right outer join dept d
on e.deptno = d.deptno;

--p.239
--Q1
select d.deptno, dname, empno, ename, sal
from emp e inner join dept d
--using(deptno) -- ��Ī ��� �� ��� �Ұ� (e. d. s. ���)
on e.deptno = d.deptno
where e.sal > 2000
order by deptno;

--Q2
select d.deptno, 
               dname, 
                    trunc(avg(sal)) as AVG_SAL,
                              max(sal) as Max_SAL, 
                                  min(sal) as MIN_SAL,
                                     count(*) as CNT
from emp e inner join dept d
on e.deptno = d.deptno
--using(deptno) -- �ظ��ϸ� ������� ���� (�ٸ� DBMS���� �ν� ���Ҽ� ����)
group by d.deptno, d.dname; -- d�� �ٿ� ����� ���̺�� �׷��� ���� �����ؾߵ�.

--Q3 
select d.deptno, dname, ename, job, sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by deptno, ename;

--Q4
select d.deptno, d.dname, e.empno, e.ename, e.mgr, e.sal, e.deptno as deptno_1, s.losal, s.hisal, s.grade, m.empno as MGR_EMPNO, m.ename as MGR_ENAME
from emp e right outer join dept d
on e.deptno = d.deptno
  full outer join salgrade s
on e.sal between s.losal and s.hisal
   left outer join emp m 
on e.mgr = m.empno
   order by deptno,empno;

================================================================================================================

-- ��������
-- select ������ ��ø�ؼ� ����ϴ� ��(where)

select ename, max(sal)
form emp;

select deptno
from emp
where ename = 'SCOTT';   --  20
--    +   �ΰ��� ������ ��ġ�� ��
select dname
from dept
where deptno = 20;

select dname --����������                         
from dept                             
where deptno = (                            
                select deptno         
                from emp                      
                where ename = 'SCOTT'           
               ); -- ����������  (���������� ���� �����)         

select deptno,max(sal)
from emp
where ename = max(sal); -- where�������� �����Լ�(MAX,COUNT ��)�� �� ����

select deptno,sal
from emp
where sal = (
               select max(sal)
               from emp
               );   -- ���������� �̿��ؼ� max() ����


-- DALLAS ���� �ٹ��ϴ� �������
-- �̸�,�μ���ȣ �˾Ƴ���
select ename , deptno
from emp
where deptno = (
           select deptno
           from dept
           where loc = 'DALLAS'); -- ������ ����������(����� �ϳ��� ��������)

-- �ڽ��� ���ӻ���� KING�� ����� �̸��� �޿��� ��ȸ�ϼ���(��������)
select ename,sal
from emp
where mgr =(
select empno
from emp
where ename ='KING');

--������ �������� : ��� ���� �ϳ� �̻��� ���� ������ ��������
-- in : ���ǿ� ��ġ�ϴ� �͸� ��� (=)
-- any : ���ǿ� �ϳ��� �����ϸ� ��� (or)
-- all : ��� ������ �����ؾ� ���    (and)
-- exists : ����� �����ϸ� ��ü ��� 


--in (���� ���� ��� �� ���� ���� ���ԵǾ� ������ ��ȸ)
--not in (���� ���� ��� �� ���� ���� ���ԵǾ� ���� ������ ��ȸ)
select * 
from emp
where sal in ( -- 5000, 3000, 2850�� ��� ���
            select max(sal)
            from emp 
            group by deptno -- ��� = 5000,3000,2850
            );
 --any(some) (���ǽ��� �ϳ��� �����ϸ� ��ȸ)
select * 
from emp
where sal > any ( -- >5000 or >3000 or >2850 => 5000���� ũ�ų�, 3000���� ũ�ų�, 2850���� ū ��
             select max(sal)
             from emp 
             group by deptno -- ��� = 5000,3000,2850
             );
 --all (���ǽ��� ��� �����ϸ� ��ȸ)
SELECT ename,sal
FROM emp
where sal > all( --  > ����� ��� ����  =>  > 2850(����ū��) => 2850���� ū ��
           select sal
           from emp
           where deptno = 30); -- ��� = 1600,1250,1250,2850,1500,950
 
 
 select sal
           from emp
           where deptno = 30;
             
select * 
from emp
where (deptno,sal) in (
             select deptno,max(sal)
             from emp 
             group by deptno 
             );
             
================================================================================================================
             
-- DML(������ ���۾�) : insert, update, delete 

-- insert : ���̺� ������ ����
-- insert into ���̺�� (�÷���1,�÷���2,...)
-- values(��1, ��2,...)
-- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ��Ѵ�.
-- �ۼ� ������� 1:1 ��Ī�ȴ�.

create table dept_temp 
as
select * from dept; 
 
select * from dept_temp; -- �ش� �÷�(dept) ������ �����Ͽ� ���̺�(dept_temp) �����!!
 
--������ ���� ����
insert into dept_temp (deptno,dname,loc) 
values(50,'DATABASE','SEOUL');
 
insert into dept_temp(deptno,loc)-- ���� �÷� �κ��� �����ʹ� �ڵ����� null�����Ͱ� ���Եȴ�.(�Ͻ��� null ����)
values(60,'JJJ'); 

insert into dept_temp --(deptno,dname,loc) �÷����� -> �÷� ���� ����(��� �÷��� �����͸� �����Ѵٴ� ��)
values(70,'HTML','SEOUL');
 
insert into dept_temp 
values(80,NULL,'SEOUL'); -- �÷� ���� �ÿ��� �����Ͱ� ������ �κ��� NULL�� ����ߵ� (����� null ����)


create table emp_temp
as
select * from emp
where 1 != 1; -- ���� ���̺��� �÷��� ���������� ���� ������� ���̺��� ���� ������ �ʴ� ���(�÷� ������ �������� �����Ͱ� ����� ����)  -- != or <>

select * from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);
 
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'��û��','MANAGER',9999,sysdate,4000,null,10);


-- update : �÷��� �����͸� ����(����)
-- update ���̺��
-- set �÷��� = ��, �÷��� = ��, ....
-- where ���ǽ�
-- �������� ������� ������ �ش� �÷��� ��� ����ȴ�.

create table dept_temp2
as
select * from dept;

select * from dept_temp2;

update dept_temp2
set loc = 'SEOUL' -- loc �÷��� ��� �����Ͱ� 'SEOUL' �ٲ��!! (�Ǽ� ����!)

drop table dept_temp2; -- ���̺� �����(���������� X) ����!!!

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40; -- �μ���ȣ 40�� ���� �����͸� �����ϰڴٴ� ��(�������� �����Ͽ� ��� ������ ���� ����) 

-- delete(������ ����)
-- delete from ���̺��
-- where ���ǽ�
-- �������� ������� ������ ��� �����Ͱ� �����ȴ�. 

drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select * from emp_temp2;

delete from  emp_temp2;

delete from  emp_temp2 --(������ ����)
where ename = 'SCOTT';

================================================================================================================

-- TCL (�������� �������� �Ǵ� ���)
-- Ʈ�����
-- commit, rollback, savepoint
-- commit: ������ ���� ����(���̺��� ������ �ݿ�)
--         create������ ����ؼ� ��ü�����Ҷ�(�ڵ�)
-- rollback: ������ ���� ���(���̺��� ������ �� �ݿ�) ���󺹱�
--           õ������,����,����(�ڵ�)
             
drop table dept01;

create table dept01
as
select * from dept;

select * from dept01;

delete from dept01; -- �����͸� ����(������ ������ �ƴ�, rollback���� ���� ����)

-- commit; -- �����͸� ��������(����������)
rollback; -- commit ���� rollback�� �ؾ� ���� �� (commit �Ŀ� ���� �Ұ�)


--Ʈ����� ���� ���� ���� ����
delete from dept01; -- ���� (���������� �ƴ�)
--  ��rollback�� ����
truncate table dept01; -- delete + commit (��������)
--  ��rollback�� �Ұ���

================================================================================================================

-- DDL(������ ���Ǿ�): table(��� ��ü)�� ����, ����, �����ϴ� ��ɾ�
-- create(����), alter(����), drop(����)

-- (1)create(����)

create table ���̺��(  -- table(��ü)
    �÷���1 Ÿ��,       -- column(�Ӽ�)
    �÷���2 Ÿ��,
    �÷���3 Ÿ��
  );

create table emp_ddl( -- �������� ���̺��� ����
   --���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
    empno number(4), -- ()���� ���ڴ� �� ������ ������ �ڸ���
    ename varchar2(10), -- ũ��= byte
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2), -- �ڿ� ���ڴ� �Ҽ����ڸ��� ��Ÿ��
    comm number(7,2),
    deptno number(2)  -- ������ �÷� �ڿ��� , ������ ����!
);
select * from emp_ddl;

insert into emp_ddl
values (9999,'�̼���','MANAGER',1111,sysdate,1000,NULL,10);

create table dept_ddl -- ���̺��� ����
as
select * from dept;

create table dept_30
as
select * from dept
where deptno = 30;

create table dept_m
as
select dname,loc from dep;

create table dept_d
as
select * from dept
where 1 != 1;   --���̺��� ������ �����Ѵ�.
------------------------------------------------------------------------------------
-- (2)alter(����)

-- ���̺� ����(�÷��� ��������)
-- ���ο� �÷� �߰�, �÷��� �̸�����, �ڷ����� ����,�÷��� ����

create table emp_alter
as
select * from emp;

select * from emp_alter;

alter table emp_alter
add address varchar2(100); -- �÷� �߰�

alter table emp_alter
rename column address to addr; -- �÷��̸� ����
--rename emp_alter to emp_alter2; -- ���̺� �̸� ����

alter table emp_alter
modify empno number(10); -- ���� number(4) ->  number(10) ���� (������ ũ�⸦ �ñ�⸸ ����: ������ �����Ͱ� �ֱ� ����)
desc emp_alter;

alter table emp_alter
drop column addr;  -- �÷� ����
------------------------------------------------------------------------------------
-- (3)drop(����)

drop table emp_alter; -- ���̺� ����

select * from emp_alter;

================================================================================================================

--p.324
--Q1
create table emp_hw(
empno number(4),
ename varchar2(10),
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
dptno number(2)
);
SELECT * FROM emp_hw;

--Q2
alter table emp_hw
add bigo varchar2(20);   
SELECT * FROM emp_hw;

--Q3
alter table emp_hw
modify bigo varchar2(30);
desc emp_hw;

--Q4
alter table emp_hw
rename column bigo to remark;

--Q5
insert into emp_hw
--values emp;
select empno,ename,job,mgr,hiredate,sal,comm,deptno,NULL -- ��ġ�� �÷��� �� ���ְ� �� ��ġ�� �� NULL ����
from emp;
SELECT * FROM emp_hw;

--Q6
drop table emp_hw;

================================================================================================================

--������ ����
desc user_tables;

select table_name
from user_tables;

select owner,table_name   -- ���� ������ ���̺� Ȯ�ΰ���
from all_tables; 


-- index (�˻��ӵ��� ����ϱ� ���� ����ϴ� ��ü)
-- create , drop
-- select ������ �˻��ӵ��� ��� ��Ų��
-- ��ü ���ڵ��� 3%~5% �����϶�
-- index ��ü�� �÷��� �����ؼ� ����Ѵ�.

create index �ε�����
on ���̺��(�÷���);

create table emp01
as
select * from emp;

drop table emp01

select * from emp01;

insert into emp01
select * from emp01;

insert into emp01(empno,ename)
values (1111,'bts');

select empno,ename
from emp01
where ename = 'bts';
-- index ��ü ���� �� (0.036��)

create index idx_emp01_ename
on emp01(ename);

select empno,ename
from emp01
where ename = 'bts';
-- index ��ü ���� �� (0.005��)

drop index idx_emp01_ename;

================================================================================================================

-- ���̺� ���� �� ���� [���� - ���ʿ� ������ �޴� ����]
show recyclebin; --(�����뿡 ������ ���̺� ������ ����)

flashback table emp_alter --(�����뿡 ������ ���̺��� �ٽ� �츮�� ��ɾ�)
to before drop;   

purge recyclebin; -- (������ ���� ��ɾ�)

================================================================================================================

-- ��������(���Ἲ) : �߸��� �����ͷ� ���Ǵ� ���� ���ϰ� �ϴ� ��  (���̺��� �÷����� ����)

-- not null : null �����͸� ������ �� ���� �Ѵ� 
-- unique : ���� �÷��� ���� �����͸� ���� �� ���� �Ѵ�. but. null�� �ߺ� ��� (ex-���, �ֹι�ȣ)
-- primary key(�⺻Ű) : = (not null + unique)
-- foreign key (�ܷ�Ű / ����Ű) : �� ���̺��� �Բ� �� �� �����ϴ� Ű(�θ� ���̺��� ����)
--      1.�θ�� �ڽ��� ���踦 ������ �ڽ��� ���̺��� �÷��� �����Ѵ�.
--      2.�θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique�ؾ� �Ѵ�.
--      3.�ܷ�Ű ���� NULL�̰ų� �θ� ���̺��� �⺻Ű ���� �����ؾ��Ѵ�.(�θ��÷��� �ִ� ���븸 �ڽ��÷��� ���� �� �ִ�. BUT null�� ���)  
-- check : �÷� ���� ���ѹ����� �ο�
-- default : �⺻�� �ο�


-- not null, unique, primary key
insert into emp
values (1111,'aaa','MANAGER',9999,sysdate,1000,NULL,50);
--���Ἲ ��������(SCOTT.FK_DEPTNO)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

drop table emp02; -- �ش� ���̺� ����

delete from emp02; -- �ش� ���̺��� ������ ����

create table emp02(-- ���������Ǹ� �����ϴ� ���[ constraint (�������Ǹ�) (��������)]
   empno number(4) constraint emp04_empno_pk primary key, -- not null unique, -- ����� �����Ͽ� �ΰ� �̻��� �������ǵ� �����
   ename varchar2(10) constraint emp04_ename_nn not null,
   job varchar2(9),
   deptno number(2)
);
SELECT * FROM emp02;

insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (2222,'ȫ�浿','MANAGER',30); --����� �ٸ� ȫ�浿 �������� ��� 

insert into emp02
values (2222,'������','SALESMAN',10);

insert into emp02
values (null,'������','SALESMAN',20);

insert into emp02
values (null,null,'MANAGER',30);

--foreign key
create table dept07( -- �θ����̺�
        deptno number(2)constraint dept07_deptno_pk primary key, --�θ� ���̺� primary key(or unique)�� �����ؾߵ�
        dname varchar2(20)constraint dept07_dname_nn not null,
        loc varchar2(20)constraint dept07_loc_nn not null
);  -- �θ� ���̺� ���� ����
SELECT * FROM dept07;

create table emp07( -- �ڽ����̺� foreign key�� ��������
   empno number(4) constraint emp07_ename_pk primary key,
   ename varchar2(9)constraint emp07_ename_nn not null,
   job varchar2(9),                        -- �� �÷� ���������� foreign key ���� ��������(references�� ����)
   deptno number(2) constraint emp07_ename_fk references dept07(deptno)--������ �θ� ���̺�
); -- �ڽ� ���̺�(references)�� foreign key�� ����
SELECT * FROM emp07;

-- ������������ ����� ������ ����
insert into dept07
select * from dept; -- �θ� ���̺� ���� ����

insert into emp07
select empno,ename,job,deptno from emp;

insert into emp07
values (1111,'aaa','MANAGER',9999,sysdate,1000,null,50);

-- check
create table emp08( 
   empno number(4) constraint emp08_ename_pk primary key,
   ename varchar2(10)constraint emp08_ename_nn not null,
   sal number(7)constraint emp08_sal_ck check(sal between 500 and 5000),
   gender varchar2(2)constraint emp08_gender_ck check(gender in ('M' , 'F'))
); 
SELECT * FROM emp08;

insert into emp08
values (1111,'hong',1000,'M');

insert into emp08
values (2222,'hong',200,'M');

insert into emp08
values (3333,'hong',1000,'A');

-- default
create table dept08( 
   deptno number(2) primary key,
   dname varchar2(10) not null,
   loc varchar2(15) default 'SEOUL'
); 
SELECT * FROM dept08;

insert into dept08(deptno,dname)
values (10,'SALES');

insert into dept08(deptno,dname,loc) -- default 'SEOUL'�̶�� �⺻���� �ο��ߴ��� 
values (20,'SALES','BUSAN');         -- �ٸ� �� ���� �� ������ ������ ��ȯ�ȴ�.

-- �������� �������
 -- �÷� ������ ����(not null�� �÷� ���������� ����)
 -- ���̺� ������ ����(not null�� ������ �� ����) : ���̺��� ������ �� ���߿� ���������� ����
 
 create table emp09(
    empno number(4),
    ename varchar2(20)constraint emp09_ename_nn not null,
    job varchar2(20),
    deptno number(20), -- ������ �÷� �ڿ��� (,)�� ���ߵ�
    
    constraint emp09_empno_pk primary key(empno),
    constraint emp09_job_uk unique(job),
    constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
  --�� CONSTRAINT [CONSTRAINT_NAME] FOREIGN KEY (�ڽ� ���̺� �÷� ��) REFERENCES �������̺�(�θ� ���̺� �⺻Ű��)
 ); 
SELECT * FROM emp09;

insert into emp09
values (3333,'hong','PRESIDENT',80);

-- ����Ű (�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
-- ���̺� ���� ������θ� ���� ����
--   1.���̺� �ȿ��� �����ϴ� ���
--   2.Alter ��ɾ ����ϴ� ���

-- (1)
create table member(
   name varchar2(10),
   address varchar2(30),
   hphone varchar2(10),
   
   constraint member_name_address_pk primary key(name,address)
);
-- (2)   
create table emp10(
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(20)
);

alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_empno_fk foreign key(deptno)references dept(deptno);
  
-- not null�� ������ ����( null -> not null), (add x , modify o)
alter table emp10
modify job constraint emp10_job_nn not null;  
    -- �� not null�� ���������� �÷����� �տ� �д�
    
alter table emp10
modify empno constraint emp10_empno_nn not null;      
    
-- drop �������Ǹ�(constraint) �Ǵ� ��������(primary key)
--        ���ߺ� �ȵ�                ���ߺ� ��
alter table emp10    
drop constraint emp10_empno_pk;

drop table dept11;
create table dept11( 
   deptno number(2),
   dname varchar2(10),
   loc varchar2(15)
);
SELECT * FROM dept11;

alter table dept11    
add constraint dept11_deptno_pk primary key(deptno);

drop table emp11;
create table emp11(
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(20)
);
SELECT * FROM emp11;

alter table emp11    
add constraint emp11_empno_pk primary key(empno);

alter table emp11
add constraint emp11_empno_fk foreign key(deptno)references dept11(deptno);

insert into dept11
select * from dept;

insert into emp11
select empno,ename,job,deptno
from emp;

delete from dept11
where deptno = 10;  -- foreign key�� �����ǰ� �ִ� �ڽ� ���̺��� ���� ���
                    -- �θ� ���̺��� �����͸� ���� �� ����.
alter table dept11
disable primary key cascade;    -- primary key ��Ȱ��ȭ = ����� �ڽ����̺�(foreign key)�� ��Ȱ��ȭ 
--�� ��Ȱ��ȭ          ����������  -- ���������� ��Ȱ��ȭ�Ǿ����Ƿ� ������ ������ ��������. 

alter table dept11
drop primary key; -- ���� ���� �� �����͸� ���� ���� ������ �����Ǿ��ִ� ���������� ���� �� �� ����(��Ȱ��ȭ�� ��Ų ������)

alter table dept11
drop primary key cascade;  -- ������ ����� �������ǵ���(dept11 - primary key , emp11 - foreign key) ��� ������ ���������� ����

--p.395
--Q1
drop table DEPT_CONST;
create table DEPT_CONST(
      deptno number(2),
      dname varchar2(14),
      loc varchar2(13) constraint DEPTCONST_loc_nn not null,
      
     constraint DEPTCONST_deptno_pk primary key(deptno),
     constraint DEPTCONST_dname_unq unique(loc)
); 

drop table EMP_CONST;
create table EMP_CONST(
      empno number(4),
      ename varchar2(10),
      job varchar2(9),
      tel varchar2(20),
      hiredate date,
      sal number(7,2),
      comm number(7,2),
      deptno number(2)     
); 

alter table EMP_CONST
add constraint EMPCONST_empno_pk primary key(empno);

alter table EMP_CONST
modify ename constraint EMPCONST_ename_nn not null;

alter table EMP_CONST
add constraint EMPCONST_tel_unq unique(tel);

alter table EMP_CONST
add constraint EMPCONST_sal_ck check(sal between 1000 and 9999);

alter table EMP_CONST
add constraint EMPCONST_deptno_fk foreign key(deptno)references DEPT_CONST(deptno);

================================================================================================================

--CRUD (����:�������� ����)
-- C (create) = insert, DML
-- R (read) = select,  DQL
-- U (update), DML
-- D (delete), DML

-- ��ü: table, index, view = create ��ɾ ����Ͽ� ���� ���

--��(view) : ���� ���� ����(�÷��� �����Ͽ� ���� ����)
 --1.����
 --2.����(����Ұ�)

-- create or replace view �����̺��(alias)
-- as
-- ��������(select) �� �ܼ���(���̺�1��)
--                 �� ���պ�(ex-����,...)
-- [with check option] (�ʼ�x)
-- [with read only]    (�ʼ�x)

drop table detp_copy;
create table detp_copy
as
select * from dept;

drop table emp_copy;
create table emp_copy -- ����Ǿ� ������ ���̺��� ���������� �� �Ѿ�´�.
as
select * from emp;

create or replace view emp_view30
as
select empno, ename, sal, deptno from emp_copy
where deptno = 30;

grant create view -- [view ���̺��� ������ �� �ִ� ���Ѻο�(system �������� ����)]
to scott;

select * from emp_copy; -- 14
select * from emp_view30; -- 6

insert into emp_view30  -- �����̺� ������ ������ ���� �������̺� ���Ե�(������ �÷��� ���� null�� ���Ե�)
values(1111,'hong',1000,30); 

alter table emp_copy -- �������̺��� foreign key�� ���� �ɾ��ش�
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

insert into emp_view30( empno, ename, sal) -- foreign key�� ����Ǵ� �� 
values(2222,'hong',2000);  -- deptno�� �� = null, ���� ���� ����!
 
insert into emp_view30( empno, ename, sal, deptno) -- foreign key�� ����Ǵ� �� (deptno = 10,20,30 and null)
values(2222,'hong',2000,50); -- deptno�� �� = 50, ���� ���� ���̺��� ������ �ƴϱ� ������ ���࿡ ���� ������ �߻�!

 create or replace view emp_view(�����ȣ, �����, �޿�, �μ���ȣ) -- �� ���̺��� �÷��� ��Ī�ο�(alias)
 as
 select empno,ename,sal,deptno
 from emp_copy;
 
select * from emp_view
where �μ���ȣ = 20;
--where deptno = 20; -> error ��Ī �ο��ϸ� ������ �÷����� ����� �� ����.


create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

--Q �μ��� �ּұ޿��� �ִ�޿�
-- dname,min_sal,max_sal
create or replace view sal_view --(dname,min_sal,max_sal) ��Ī as�� �ᵵ��
as
select dname,min(sal)as min_sal,max(sal) as max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;
 
select * from sal_view;

drop view sal_view;

-- ��� ��ü�� �̸��� �ߺ��� �� ����.
-- but(or replace)�� ������ ���� �̸����� ��� �� �ִ�.(���� �߰� ����)
-- (or replace)�� ������ �����ϴ�.�׷��� ���� �� ����� �Ұ�
create or replace view sal_view 
as
select dname,min(sal)as min_sal,max(sal) as max_sal,avg(sal) as avg_sal -- avg(sal) as avg_sal�� �߰�
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;


-- /with check option/
drop view view_chk30;
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; -- �������� �÷��� �������� ���ϰ� �Ѵ�.(with check option)

update view_chk30 -- �䵵 ������Ʈ ����
set deptno = 10;  -- but, with check option�� ���� ������Ʈ �Ұ�
--// ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�. //

-- /with read only/
drop view view_read30;
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only; -- ��� �÷��� ���� C U D�� �Ұ� 
                                  -- R(read, ��ȸ)�� ����
update view_read30
set deptno = 10;
--//�б� ���� �信���� DML �۾��� ������ �� �����ϴ�.//(insert,update,delete)

================================================================================================================

-- ���� Ȱ��
-- TOP - N ��ȸ�ϱ�
-- ROWNUM(�ǻ� �÷�): ���� �������� �ʾ����� ��밡���� �÷�(��¥�÷�)
select * from emp; 

-- �Ի����� ���� ���� 5���� ��� ��ȸ
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01';

-- �Ի����� ���� ���� 7���� ��� ��ȸ
select rownum, empno,ename,hiredate
from emp
where rownum <= 7;  -- rownum���� ����(�Ի��Ϸ� ���ĵǾ������� ����)

select rownum, empno,ename,hiredate
from emp
where rownum <= 7
order by hiredate asc; -- ��¥��� ���ĵ����� rownum ������ ���� ��.

--(view & rownumȰ��)
create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc; -- �Ի��Ϸ� ���� �� view�� ���� ����

select * from view_hiredate;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum <= 7; -- view�� rownum�� ����

-- �Ի����� ���� ���� 2~5��° ����� ������� ��ȸ
select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5; -- rownum�� �������� ���� ��� �� �ݵ�� 1�� �����ϴ� ���ǽ��� �����ߵȴ�.
                              -- rownum�� 1�� �������� ���� ���� ��ȸ�� �ȵ�.
--(rownum�� ��Ī �ο�)
create or replace view view_hiredate_rm -- rownum�� ��Ī�� �ο��ϰ� ���ο� view�� ����
as                                      
select rownum rm,empno,ename,hiredate
from view_hiredate;

select rm,empno,ename,hiredate   -- ��Ī���δ� rm(rownum)�� �����ο� ����
from view_hiredate_rm
where rm >= 2 and rm <= 5;


-- ��ø

/*  select  (select) = �Ϲ�����
     from   (select) = �ζ��κ� : ��ȸ��
    wherer  (select) = ��������          */

-- �ζ��� ��
select rm , b.* --(empno,ename,hiredate)
from (  
        select rownum rm , a.* --(empno,ename,hiredate)   
        from(
               select empno,ename,hiredate 
               from emp
               order by hiredate asc
              ) a
       ) b
where rm >= 2 and rm <= 5; --or (where rm between 2 and 5;)

--�Ի����� ���� ���� 5�� ��ȸ(�ζ��κ�����) 
select rownum,empno,ename,hiredate
from( 
     select empno,ename,hiredate
     from emp
     order by hiredate asc
    )
where rownum <=5;          

================================================================================================================
/*
-- ������
-- �ڵ����� ��ȣ�� ������Ű�� ��ɼ���
-- create, drop 
-- nextval,currval

create sequence ��������
start with ���۰� => 1(�⺻��) 
increment by ����ġ => 1
maxvalue �ִ밪 => 10�� 1027��
minvalue �ּҰ� => 10�� -1027��
*/ 

create sequence dept_deptno_seq -- �����ϱ� ���� ������ �� �⺻������ �������
increment by 10
start with 10;

select dept_deptno_seq.nextval -- ������ ��ȸ
from dual;

select dept_deptno_seq.currval -- ���簪 ��ȸ
from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;
create table emp01
as
select empno,ename,hiredate from emp
where 1 != 1;

select * from emp01;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);

drop table product;
create table product(
   pid varchar(10),
   pname varchar2(10),
   price number(5)
   
   constraint product_pid_pk primary key
);

create sequence idx_product_id
start with 1000;

insert into product
values ('pid' ||IDX_PRODUCT_ID.nextval,'ġ��',3000);

select * from product;

drop sequence idx_product_id;

================================================================================================================

-- ����� ����(��ü) // (system ��������)  
-- create, alter, drop
-- create user ������ identified by �н����� (���������)
-- alter user ������ identified by �н����� (���� ����)
-- drop user ������ cascade (���� ����)

create user user01 identified by 1234;
--user USER01 lacks CREATE SESSION privilege; logon denied

-- DCL(�����) - 'Data Control Language'
-- grant(���Ѻο�), revoke(����ȸ��)
-- grant �ý��۱��� to ������
-- revoke �ý��۱��� from ������

grant CREATE SESSION -- �����ͺ��̽��� ������ �� �ִ� ����
to user01;

grant create table -- ���̺� ���� ���Ѻο�
to user01;

revoke create table -- ���̺� ���� ����ȸ��
from user01;

alter user user01 identified by tiger; -- ���� �н����� ����(1234 -> tiger)

drop user user01 CASCADE; --(CASCADE = ������ ������ ������հ� ���δ�)
----------------------------------------------------------------------

-- �ý��� ����(create ...) p.403 ����
-- ��ü ����(select,...) p.407 ����

================================================================================================================

/*
1. ������ ���̺� �����̽� ����
create tablespace [tablespace_name]
datafile '/home/oracle/oradata/DANBEE/[file_name].dbf' size 500m;

��)CREATE TABLESPACE ADMIN DATAFILE 'D:\ORACLE\ORADATA\XE\ADMIN.dbf' SIZE? 500M ;


2. ����Ŭ ���� �����
CREATE USER [user_name] 
IDENTIFIED BY [password]
DEFAULT TABLESPACE [tablespace_name]
TEMPORARY TABLESPACE TEMP;

��)CREATE USER nextree IDENTIFIED BY nextree DEFAULT TABLESPACE NEXTREE TEMPORARY TABLESPACE TEMP;


3. ������ USER�� �����ֱ�
GRANT connect, resource, dba TO [user_name];

��)grant connect, dba, resource to ������; (��� ���� �ֱ�)

GRANT CREATE SESSION TO ������  // �����ͺ��̽��� ������ �� �ִ� ����
GRANT CREATE DATABASE LINK TO ������
GRANT CREATE MATERIALIZED VIEW TO ������
GRANT CREATE PROCEDURE TO ������
GRANT CREATE PUBLIC SYNONYM TO ������
GRANT CREATE ROLE TO ������
GRANT CREATE SEQUENCE TO ������
GRANT CREATE SYNONYM TO ������
GRANT CREATE TABLE TO ������  // ���̺��� ������ �� �ִ� ����
GRANT DROP ANY TABLE TO ������? // ���̺��� ������ �� �ִ� ����
GRANT CREATE TRIGGER TO ������ 
GRANT CREATE TYPE TO ������ 
GRANT CREATE VIEW TO ������

GRANT
CREATE SESSION,
CREATE TABLE,
CREATE SEQUENCE,
CREATE VIEW
TO ������;


4. ������ USER�� ORACLE�� �����ϱ�
sqlplus nextree/nextree[@db_sid]


5. ���� �����ϱ�
drop user ����ڰ��� cascade;
-------------------------------------------------------------------------------

-- ���̺� �����̽� ũ�� Ȯ�����ִ� ������
alter database 
datafile 'D:\oracle\oradata\XE\ADMIN.DBF'? resize 900M;

--���̺� �����̽� ���� ���� ������
SELECT file_name, tablespace_name, bytes, status FROM? DBA_DATA_FILES;

--���̺� ����� �ε��� ����
--1��° ���
CREATE INDEX MSID_IDX1 ON TEST(MSID)
--2��° ���
create index test1_test on test1(test)
tablespace users
storage(
        initial 10k
        next 10k 
        pctincrease 0)
pctfree 10

--���̺� ���� ���� ����
select * from user_constraints-- where table_name = upper('test1');

--ORA-00054: �ڿ��� ������̰�, NOWAIT�� �����Ǿ� �ֽ��ϴ� �ذ� ���
select a.sid, a.serial#
from v$session a, v$lock b, dba_objects c
where a.sid=b.sid and b.id1=c.object_id and b.type='TM' and c.object_name='CAR_INFO'; 

alter system kill session '12, 27846'; 

-- CAR_INFO���� �ִ� ���� DASH_BOARD�� �ֱ�
INSERT INTO DASH_BOARD(CAR_LICEN_NUM)
SELECT CAR_LICEN_NUM 
FROM CAR_INFOMINUS
SELECT CAR_LICEN_NUM 
FROM DASH_BOARD

SYSTEM ���� �н����� �����ϱ�
����ڰ��� : /as sysdba

alter user system identified by "��ȣ";
�Ϲ� ��Ʈ���� ��������� Ư�����ڰ� ������� �ݵ�� "" ����ǥ�� �����ش�.  */
================================================================================================================

-- ��
create user user02 identified by 1234;

grant connect,resource
to user02;

-- ����� ���� ��
-- ������(system) ���������� ����
-- create role �Ѹ�
-- grant ���� to �Ѹ�

-- �ý��� ���� (������ ��������)
create role mrole; -- mrole�̶�� �� ����

grant create session, create table, create view -- ���� �ѿ� �����ͺ��̽��� ����,���̺� ����,������� ������ ���� ��
to mrole;

create user user04 identified by 1234; -- user04 ���� ����

grant mrole
to user04; -- user04�� ���ѵ��� ���� �� �ο� => user04�� �����ͺ��̽��� ����,���̺� ����,�����dl ����

-- �ý���(������) ���ѿ��� �� ����
create role mrole2; -- mrole2�̶�� �� ����(�ý��� ��������)

-- ��ü ������ �ش� ����� �������� ����
-- scott ����
grant select
on emp
to mrole2;  -- scott�� emp �÷� ��ȸ ������ mrole2�� �����ش�.(scott ��������)
 
-- �� ������ ������ ���������� ����
grant mrole2
to user04 -- mrole2�� ���� �� ������ user04�� �ο� (�ý��� ��������)

revoke role mrole2
from user04;  -- user04�� �ο� �� ���� ȸ��(�ý��� ��������)

================================================================================================================

-- PL/SQL(Ȯ��Ǿ��� SQL���)
-- ����, ���ǹ�, �ݺ���
/*
set serveroutput on;  -- ���� ����� ȭ�鿡 ���

declare
    ���� ����
begin  --������ �ʱ�ȭ�� begin�������� ���ش�
    SQL���� �ۼ�
    ��±��� �ۼ� -- �������� �������� �ݵ�� ����Լ��� ���ؼ� Ȯ���ؾ� �Ѵ�.
exception
    ����ó�� ���� �ۼ�
end;
/  -- (/) ������ ����!! , (;)�Ʒ��ʿ� �ֱ�
*/
-----------------------------------------------------
set serveroutput on; 

begin
    dbms_output.put_line('Hello World'); -- ����Լ�
end;
/
-----------------------------------------------------
declare
    -- vempno number(4);  -- ������ ����
    -- vename varchar(10);
    
    -- ����� �ʱ�ȭ �ѹ���
    vempno constant number(4) := 7777; -- ����� ����(constant)
    vename varchar(10) not null := 'SCOTT';  -- null ���� ������ ����� �� ����. 
begin 
   -- vempno := 7777;   -- ������ �ʱ�ȭ (:= ���Կ�����)
   -- vempno := 'SCOTT'; 
   
   dbms_output.put_line(' ��� / �̸� ');
   dbms_output.put_line(vempno||' '||vename);
   
end;
/
-----------------------------------------------------
declare
    -- ��Į�� ���
    -- vempno number(4);
    
    -- ���۷��� ���
       vempno emp.empno%type := 7777; -- ���� ���̺��� �÷� Ÿ���� �����Ѵ�.
begin  
    --vempno := 7777;
    dbms_output.put_line(vempno);
end;
/  
-----------------------------------------------------
declare
    -- ���۷��� ���
       vempno emp.empno%type;
       vename emp.ename%type;
begin  
    select empno, ename into vempno,vename -- ������ �ϳ� ���� �����ϱ� ���ؼ� �ݵ�� where���� ������� ��!
    from emp                               --(������ �ϳ��� ���� ���� �� ���� �׷��� ���۷��� ����� ��� ����
    where empno =7788;  -- �ʼ�             -- �÷��� ��� �����͸� �ҷ����� ������ �������� �ο��ؼ� ��������)
    
    dbms_output.put_line('��� / �̸�');       
    dbms_output.put_line(vempno||' '||vename);
end;
/  
------------------------- ����ó�� �ϱ�� -------------------------------
declare
    -- ���۷��� ���
       vempno emp.empno%type;
       vename emp.ename%type;
begin  
    select empno, ename into vempno,vename 
    from emp;                               
    -- where empno =7788; --�ʼ�           
    
    -- dbms_output.put_line('��� / �̸�');       
    -- dbms_output.put_line(vempno||' '||vename);
exception
    when Too_MANY_ROWS then dbms_output.put_line('���� ���� ������ �Դϴ�.');
    when OTHERS then dbms_output.put_line('��� ���ܿ� ���� ó��.');
end;
/   
-----------------------------------------------------
declare
   -- ���̺� type(����� ���� ������ Ÿ��)
   -- �迭�� ����
   -- vempno varchar(10)
   
   type ename_table_type is table of emp.ename%type
   index by binary_integer;
   
   type job_table_type is table of emp.job%type
   index by binary_integer;
   
   type empno_table_type is table of emp.empno%type
   index by binary_integer;
   
   type mgr_table_type is table of emp. mgr%type
   index by binary_integer;
   
   type hiredate_table_type is table of emp.hiredate%type
   index by binary_integer;
   
   type sal_table_type is table of emp.sal%type
   index by binary_integer;
   
   type comm_table_type is table of emp.comm%type
   index by binary_integer;
   
   type deptno_table_type is table of emp.deptno%type
   index by binary_integer;
    
   enameArr ename_table_type; -- �迭 ������ ���� ����
   jobArr job_table_type;
   empnoArr empno_table_type;
   mgrArr mgr_table_type;
   hiredateArr hiredate_table_type;
   salArr sal_table_type;
   commArr comm_table_type;
   deptnoArr deptno_table_type;
   
   i binary_integer := 0;
begin  
   for k in (select ename, job, empno, mgr, hiredate, sal, comm, deptno from emp) loop
   i := i+1;
   enameArr(i) := k.ename;
   jobArr(i) := k.job;
   empnoArr(i) := k.empno;
   mgrArr(i) := k.mgr;
   hiredateArr(i) := k.hiredate;
   salArr(i) := k.sal;
   commArr(i) := k.comm;
   deptnoArr(i) := k.deptno;
   end loop;
  
   for j in 1..i loop
     dbms_output.put_line(enameArr(j)||' / '||jobArr(j)||' / '
     ||empnoArr(i)||' / '||mgrArr(i)||' / '||hiredateArr(i)
     ||' / '||salArr(i)||' / '||commArr(i)||' / '||deptnoArr(i));       
   end loop;
end;
/   
-----------------------------------------------------
declare
   -- ���ڵ� type(�������� ������ ��� ����Ѵ�) => ����� ���� ���� Ÿ��
   -- Ŭ������ �����ϴ�.
   
   type emp_record_type is record(  -- Ÿ��
        v_empno emp.empno%type,
        v_ename emp.ename%type,
        v_job emp.job%type,
        v_deptno emp.deptno%type
   );
--  ��emp_record�� ������
   emp_record emp_record_type; -- ���ڵ� Ÿ���� ���� ����;
begin  
   select empno,ename,job,deptno
   into emp_record
   from emp
   where empno = 7788;
   
   dbms_output.put_line(emp_record.v_empno||' / '||emp_record.v_ename
                 ||' / '||emp_record.v_job||' / '||emp_record.v_deptno);
end;
/   
-----------------------------------------------------
create table dept_record
as
select * from dept;

select * from dept_record;

declare -- insert
    type rec_dept is record(  
        v_deptno dept_record.deptno%type,
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
   );

   dept_rec rec_dept; 
begin  
  dept_rec.v_deptno := 50;
  dept_rec.v_dname := 'DEV';
  dept_rec.v_loc := 'BUSAN';
  
  insert into dept_record
  values dept_rec;
end;
/   

select * from dept_record;

declare --update
    type rec_dept is record(
        v_deptno dept_record.deptno%type not null := 99, -- null �����͸� ���Ǽ��ڷ� �ʱ�ȭ
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
    );
    
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'INSA';
    dept_rec.v_loc :=  'SEOUL';
    
    update dept_record 
    set dname = dept_rec.v_dname , loc = dept_rec.v_loc
    where deptno = dept_rec.v_deptno;
end;
/

declare -- ��Į���� ����
    v_deptno dept_record.deptno%type := 50;
begin  
    delete from dept_record
    where deptno = v_deptno;
end;
/   
-----------------------------------------------------

--���ǹ�

declare 
    vempno number(4);
    vename varchar2(10);
    vdeptno number(10);
    vdname varchar2(10):= null;
begin  
    select empno,ename,deptno
    into vempno,vename,vdeptno
    from emp
    where empno = 7788;
    
   /* if(���ǽ�) then  -- ( )�� ���̸� ���๮ ����
            ���๮  
      end if;   */
    
    if(vdeptno = 10) then  
        vdname := 'AAA';   
    end if;       

    if(vdeptno = 20) then  
        vdname := 'BBB';  
    end if;        
    
    if(vdeptno = 30) then  
        vdname := 'CCC';  
    end if;
  
    if(vdeptno = 40) then  
        vdname := 'DDD';  
    end if;    
    
    dbms_output.put_line(vdname);
end;
/   


declare
   -- %ROWTYPE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
   -- �÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
   
   vemp emp%rowtype;
   
begin
   select *
   into vemp
   from emp
   where empno = 7788;
   
   dbms_output.put_line(vemp.empno);
   dbms_output.put_line(vemp.ename);
   dbms_output.put_line(vemp.deptno);
end;
/


declare
   vemp emp%rowtype;
   annsal number(7,2);
   
begin  
   dbms_output.put_line(' ��� / �̸� / ���� ');
   dbms_output.put_line('------------------');
   
   select*
   into vemp
   from emp
   where empno =7788;

   /*
   --�ش� ����� ������ ����ϼ���. �� Ŀ�̼��� null�� ��� 0���� ���ǰ� �ϼ���.
   --���� ������ ���� annsa�� �־ ����ϼ���.
   if(vemp.comm is null) then
        vemp.comm := 0;
   end if;
   
   annsal := vemp.sal * 12 + vemp.comm;
  */
  
  -- if - else �������� Ǯ��� ��
  if(vemp.comm is null) then
      annsal := vemp.sal *12;
  else
      annsal := vemp.sal *12 + vemp.comm;
  end if;
  dbms_output.put_line(vemp.empno||' / '||vemp.ename||' / '||annsal); 
  
end;
/


-- ���� elsif�� (����Ŭ������ 'else if'�� �ƴ� 'elsif'�� ����) 
declare
   vemp emp%rowtype;
   vdname varchar2(10);  
begin  
   select *
   into vemp
   from emp
   where empno = 7788;
   
   if(vemp.deptno = 10) then
        vdname := 'AAA';
   elsif(vemp.deptno = 20) then
        vdname := 'BBB';
   elsif(vemp.deptno = 30) then
        vdname := 'CCC'; 
   elsif(vemp.deptno = 40) then
        vdname := 'DDD';
   end if;
   
   dbms_output.put_line(vdname);
end;
/
-----------------------------------------------------

-- �ݺ���

/*   loop
     ���๮(���� �ݺ���)
     ���� �ݺ����� ����
      1.EXIT WHEN ���ǽ�;
      2.IF THEN END IF;
     end loop;            */

declare
  n number(10):= 1;
begin
  loop
       dbms_output.put_line(n);
       n := n+1;
       exit when n > 10; -- �ݺ����� ���߱� ���� ����
  end loop;            
end;
/

-- for���� ���
declare
  
begin                     -- n�� ����(in ���� ���� �޾ƿ´�)
                          -- in���� �ڿ� �ۼ��Ǵ� ���� �ݺ� Ƚ���� �����Ѵ�.
  /* for n in 1..10 loop  -- (in ���۰�..���ᰪ) 1�� ���� => in 1~10(10ȸ �ݺ�)
        dbms_output.put_line(n);
     end loop; */
  
  for n in reverse 1..10 loop -- in reverse ���� => 1�� ���� => in 10~1(10ȸ �ݺ�)
     dbms_output.put_line(n); -- ���ᰪ���� ���۰����� 1�� ���ҽ��� ��
  end loop;
  
end;
/


declare
    vdept dept%rowtype;
begin  
  for n in 1..4 loop 
    select*
    into vdept
    from dept
    where deptno = 10*n;
    dbms_output.put_line(vdept.deptno||' '||vdept.dname||' '||vdept.loc);
  end loop;
end;
/

-- while���� ���
declare
    n number := 1;
begin  
 /* while (���ǽ�) loop
        ���๮;
    end loop;       */
    
   while(n <= 10) loop
     dbms_output.put_line(n);
     n := n+1;
   end loop;  
end;
/

declare
    vdept dept%rowtype;
    n number := 1;
begin  
   while(n <= 4)loop
   select *
   into vdept
   from dept
   where deptno = 10*n;
   n := n+1;
   
   dbms_output.put_line(vdept.deptno||' '||vdept.dname||' '||vdept.loc);
   end loop;  
end;
/
-----------------------------------------------------

--��������

/*
select empno, ename,.... => [������ ������ �÷�(Ÿ��)]   �� ���� ���� Ÿ���� ���ƾ� ��
into vempno, vename,...  => [������(�̸��� �緮���� ����)]��
from emp                 => [������ �����ų �÷�(Ÿ��)�� ������ ���̺�]
  
--%ROWTYPE: ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
declare�� [vemp emp%rowtype;] - ������ ����

select *   => [��� �÷� ����]   
into vemp  => [�ش� ���̺��� ��� �÷� ������ ���� ����(�̸��� �緮���� ����)]
from emp   => [������ �����ų �÷��� ������ ���̺�] 
*/

-- ��Į�� ���
-- ���۷��� ���
--  1. emp.empno%type
--  2. emp%rowtype

-- ����� ���� ���� Ÿ��
--  1.���̺� type
--  2.���ڵ� type

-- ���ǹ�
-- if then end if;
-- if then else end if;
-- if then elsif then end if;

-- �ݺ���
-- loop end loop;
-- for in loop end loop;
-- while loop end loop;
