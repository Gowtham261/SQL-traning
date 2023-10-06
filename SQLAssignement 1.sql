create table Clients
(
Clint_ID int primary key,
Cname varchar(40) NOT NULL,
Caddress varchar(30),
Email varchar(30) unique,
phonenumber int,
Business varchar(20) NOT NULL
)
insert into Clients(Clint_ID,Cname,Caddress,phonenumber,Business)
values(1001,'ACME Utilities',' Noida', 'contact@acmeutil.com', 9567880032, 'Manufacturing')
insert into Clients(Clint_ID,Cname,Caddress,phonenumber,Business)
values (1002,'Trackon Consultants',' Mumbai', 'consult@trackon.com ',8734210090, 'consultent')
insert into Clients(Clint_ID,Cname,Caddress,phonenumber,Business)
values (1002,'MoneySaver Distributors ',' Mumbai', 'save@moneysaver.com' ,7799886655 ,'Reseller') 
insert into Clients(Clint_ID,Cname,Caddress,phonenumber,Business)
values ('Lawful Corp', 'Chennai', 'justice@lawful.com' ,9210342219 ,'Professional') 

select * from Clients

--creating department table
Create table department
(
Deptno int primary key,
Dname varchar(15) Not Null,
Dloc varchar(20),
)
insert into department(Deptno,Dname,Dloc)
values(10, 'Design' ,'Pune')
insert into department(Deptno,Dname,Dloc)
values(20, 'Developement' ,'Pune')
insert into department(Deptno,Dname,Dloc)
values(30, 'Testing' ,'Mumbai')
insert into department(Deptno,Dname,Dloc)
values(30, 'Document' ,'Mumbai')

SELECT * FROM department

--creating employe table
create table Employe
(
Empho int primary key,
Ename varchar(40) Not Null,
Job varchar(15),
salary int check(salary>0),
Depno int Foreign key
);
insert into Employes values(empno,empname,empJob,salary,Depno)
(7001 ,'Sandeep' ,'Analyst' ,25000 ,10),
(7002 ,'Rajesh' ,'Designer',30000 ,10),
(7003 ,'madhav' ,'developer' ,40000 ,20),
(7004 ,'manoj' ,'developer' ,40000 ,20)
(7005 ,'abhay' ,'designer' ,35000 ,20)
(7006 ,'Uma' ,'tester' ,30000 ,10),
(7007 ,'getha' ,'tech writer' ,30000 ,40),
(7008 ,'priya' ,'tester' ,35000 ,10),
(7009 ,'nutan' ,'developer' ,45000 ,20),
(7010 ,'Smita' ,'Analyst' ,20000 ,10);

--salary check
alter table Employes 
add constraint Salcheck check(salary>0)

--forgainkey 
alter table Employes 
Depno int foreign key references Departments(Depno)

--creating table for projects
create table Project
(
Project_ID int primary key,
Descr varchar(20) Not Null,
start_date DATE,
Planned_date Date,
Actual_date Date,
Budget int,
)
insert into Project values(Project_ID,Descr,start_date,Planned_date,Actual_date,Budget)
(401,'Inventory' ,'01-Apr-11' ,'01-Oct-11', '31-Oct-11' ,150000),
(401,'Accounting' ,'01-Aug-11' ,'01-Jan-11' ,150000),
(401,'Payroll' ,'01-Oct-11' ,'31-DEC-11',150000),
(401,'ContentManager' ,'01-Nov-11' ,'31-dEC-11',150000);

select * from Project












