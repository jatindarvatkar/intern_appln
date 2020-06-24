SELECT * FROM test.emp;

select dept_id, count(*), count(case when gender ='m' then 1 end)as male,count(case when gender ='f' then 1 end)as female from emp
group by dept_id;

select count(eid)from emp
where hiredate in (2013);

select ename, length(ename) from emp
where ename like '%m';

select ename, salary, comission, salary+ comission as net_salary from emp;

select count(salary) , count(comission) from emp;