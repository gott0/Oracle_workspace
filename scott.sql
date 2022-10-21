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
select DISTINCT deptno from emp;

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
select * from emp order by sal; -- ���������� ���� �����ϴ�.(�⺻����)
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
--                                                 ���ڿ��� 4��° ���ں��� 3���� ���� ���� ��11��° ���ں��� �� ���� ��� ����
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

create table dept_temp -- �ش� �÷�(dept) ������ �����Ͽ� ���̺�(dept_temp) �����
as
select * from dept; 
 
select * from dept_temp;
 
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

delete from  emp_temp2
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
add address varchar(100); -- �÷� �߰�

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
ename varchar(10),
job varchar(9),
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
modify bigo varchar(30);
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

select owner,table_name
from all_tables;


-- index (�˻��ӵ��� ����ϱ� ���� ����ϴ� ��ü)
-- create , drop
-- select ������ �˻��ӵ��� ��� ��Ų��
-- ��ü ���ڵ��� 3%~5% �����϶�
-- index��ü�� �÷��� �����ؼ� ����Ѵ�.

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

-- ��������(���Ἲ) : �߸��� �����ͷ� ���Ǵ� ���� ���ϰ� �ϴ� �� 
-- not null : null �����͸� ������ �� ���� �Ѵ� 
-- unique : ���� �÷��� ���� �����͸� ���� �� ���� �Ѵ�. but. null�� �ߺ� ��� (ex-���, �ֹι�ȣ)
-- primary key(�⺻Ű) : = (not null + unique)
-- foreign key
-- check

-- emp,dept
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













