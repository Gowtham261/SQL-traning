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
comn int,
);
insert into empp values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20);
insert into empp values(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,30,300);
insert into empp values(7521,'WAR','SALESMA',7698,'22-FEB-81',1250,30,500);
insert into empp values(7566,'JONES','MANAGER',7839,'02-APR-81',2975,20);
insert into empp values(7654,'MARTIN','SALESMAN',7698,'28-SEP-78',1250,30,1400);
insert into empp values(7695,'BLAKE','MANAGER',7839,'01-MAY-81',2850,30);
insert into empp values(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,10);
insert into empp values(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,20);
insert into empp values(7839,'KING','PRESIDENT',7789,'17-NOV-81',5000,10);
insert into empp values(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,30,0);
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


--assignement3 

--1.Retrieve a list of MANAGERS.
SELECT e.ename, e.empno, m.ename as manager, e.mgrid
FROM empp e, empp m WHERE e.mgrid = m.empno
--2.Find out the names and salaries of all employees earning more than 1000 per month.
SELECT ename FROM empp WHERE salary >1000
--3. Display the names and salaries of all employees except JAMES.
select ename from empp except select 'JAMES' from empp
--4.Find out the details of employees whose names begin with ‘S’. 
select ename from empp where ename like 'S%';
--5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from empp where ename like '%A%';
--6.Find out the names of all employees that have ‘L’ as their third character in their name. '___L%'
select ename from empp where ename like '___L%';
--7. Compute daily salary of JONES
select ename,(salary/30) as 'Daily salary' from empp where ename = 'JONES'
--8. Calculate the total monthly salary of all employees.
select ename,(salary/12) as 'Monthly salary' from empp
--9.Print the average annual salary
declare @avg float
select @avg=AVG(salary) from empp
Print 'average salary'+''+ cast(@avg as varchar(10))
--10.Select the name, job, salary, department number of all employees except SALESMAN from department number 30
select ejob from empp except select 'SALESMAN' from empp
--11.List unique departments of the EMP table.
select distinct deptno from empp
--12.List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename from  empp where (salary>1500)
select ename,(salary/12) as 'Monthly salary' from empp
--13.Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename,ejob,salary from empp where ejob='MANAGER' and salary!=(1000|2000|3000)
--14.Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%
select ename,salary,comn from empp where comn>any(select salary+(salary*0.1) as salary from empp)
--15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782
select ename from empp where ename like '%L%L%' and (deptno=30 or mgrid=77882)
--16. Display the names of employees with experience of over 30 years and under 40 yrs Count the total number of employees.
select ename,DATEDIFF(year,hiredate,GETDATE())as EmpAge from empp  where DATEDIFF(year,hiredate,GETDATE()) between 30 and 40
--17Retrieve the names of departments in ascending order and their employees in descending order
select d.dname ,e.ename from departmentt d join empp e on d.deptno=e.deptno order by d.dname asc,e.ename desc
--18Find out experience of MILLER 
select ename,hiredate, DATEDIFF(year,hiredate,GETDATE()) as ExprienceOfMILLER from empp where ename='MILLER'
