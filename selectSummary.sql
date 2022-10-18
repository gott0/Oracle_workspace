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

-----------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------

-- �Լ�
-- �����Լ�: upper, lower, substr, instr, replace, rpad, lpad,concat
-- �����Լ�
-- ��¥�Լ�

--����==
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

select concat(empno,ename), empno||' '||ename from emp;-- ������ �� ���� �Լ�

-----------------------------------------------------------------------------------------------------------

--����==
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














