use infiniteDB
create table empp
(
empno int primary key,
ename varchar(50),
ejob varchar(50),
mgrid int,
hiredate date,
salary float(7) check (salary>0),
deptno int,
);
insert into empp values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20);
insert into empp values(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,30);
insert into empp values(7521,'WAR','SALESMA',7698,'22-FEB-81',1250,30);
insert into empp values(7566,'JONES','MANAGER',7839,'02-APR-81',2975,20);
insert into empp values(7654,'MARTIN','SALESMAN',7698,'28-SEP-78',1250,30);
insert into empp values(7695,'BLAKE','MANAGER',7839,'01-MAY-81',2850,30);
insert into empp values(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,10);
insert into empp values(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,20);
insert into empp values(7839,'KING','PRESIDENT',7789,'17-NOV-81',5000,10);
insert into empp values(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,30);
insert into empp values(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,20);
insert into empp values(7900,'JAMES','CLERK',7698,'03-DEC-81',950,30);
insert into empp values(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,20);
insert into empp values(7934,'MILLER','CLERK',7782,'23-JAN-82',1300,10);

select * from empp

use infiniteDB
create table departmentt
(
deptno int primary key,
dname varchar(50),
loc varchar(50),
);
insert into departmentt values(10,'ACCOUNTING','NEW YORK');
insert into departmentt values(20,'RESEARCH','DALLS'); 
insert into departmentt values(30,'SALES','CHICAGO'); 
insert into departmentt values(40,'OPERATIONS','BOSTON'); 

select * from departmentt

--1 List all employes whose name belongs with 'A'
select*from empp where ename like 'A%';
--2Select all those employees who don't have a manager
select*from empp where mgrid  is null; 
--3List employee name, number and salary for those employees who earn in the range 1200 to 1400
select*from empp where salary between 1200 and 1400;
--4Find the number of CLERKS employed. Give it a descriptive heading.
select COUNT(*) as "number of CLERK" from empp where ejob='CLERK';
--5Find the average salary for each job type and the number of people employed in each job.
select ejob,AVG(salary) as"average salary",COUNT(*) as"number of employes" from empp group by ejob;
--6the employees with the lowest and highest salary
select * from empp where salary=(select MIN(salary) from empp)
select * from empp where salary=(select MAX(salary) from empp)
--List full details of departments that don't have any employe
select dname,deptno,loc from departmentt
--Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name
select ename,salary from empp where ejob='ANALYST' and salary>1200 and deptno=20 order by ename asc;
--Find out salary of both MILLER and SMITH.
select ename,salary from empp where ename in ('MILLER','SMITH');
--Find out the names of the employees whose name begin with ‘A’ or ‘M’.
select*from empp where ename like 'M%';
-- Compute yearly salary of SMITH.
select ename,salary*12 as "yearly salary" from empp where ename='SMITH';
--List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename,salary from empp where salary not between 1500 and 2850
--Find all managers who have more than 2 employees reporting to them
select e.ename, e.mgrid from empp e JOIN(select mgrid,COUNT(*) as numemploye from empp group by mgrid)
 m on e.empno=m.mgrid where m.numemploye>2;