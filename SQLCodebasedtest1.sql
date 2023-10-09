--1st table
create table book
(
bookid int primary key,
booktitle varchar(100),
Author varchar(100),
bookisbn varchar(100) unique,
published_date date,
);
insert into book values (1, 'My First SQL Book', 'Mary Parker', '981483029127', '2012-02-22 12:08:17');
insert into book values (2, 'My Second SQL Book', 'John Mayor', '857300923713', '1972-07-03 09:22:45');
insert into book values (3, 'My Third SQL Book', 'Cary Flint', '523120967812', '2015-10-18 14:05:44');
select * from book;
select * from book where Author like '%er';


--2nd table
create table reviewer
(
id int primary key,
book_id int,
reviewer_name varchar(100),
content varchar(100),
rating int,
published_date date,
);
insert into reviewer values(1,1,'John Smith', 'My First Review', 4, '2017-12-10 05:50:11');
insert into reviewer values(2,2,'John Smith', 'My Second Review', 5, '2017-10-13 15:05:12');
insert into reviewer values(3,2,'Alice Walker', 'Another Review', 1, '2017-10-22 23:47:10');
select * from reviewer;
select b.bookid, b.booktitle, r.reviewer_name
from book as b
inner join reviewer as r on b.bookid = r.book_id;
select reviewer_name from reviewer group by reviewer_name
having count(book_id)>1;



--3rd table
create table customer
(
ID int,
Name varchar(100),
Age int,
address varchar(100),
salary int,
);
insert into customer values(1,'ramesh',32,'ahamadabad',2000);
insert into customer values(2,'khilan',25,'Delhi',1500);
insert into customer values(3,'koushik',23,'Kolkata',2000);
insert into customer values(4,'chaitali',25,'mumbai',6500);
insert into customer values(5,'hardik',27,'bopal',8500);
insert into customer values(6,'komal',22,'madhya pradesh',45000);
insert into customer values(7,'muffy',24,'indore',10000);

select * from customer
select name from customer where address like '%o%';



--4th table 
create table orders
(
OIS int,
Date date,
customer_id int,
amount int,
);
insert into orders values(102,'2009-10-08',3,3000);
insert into orders values(100,'2009-10-08',3,1500);
insert into orders values(101,'2009-11-20',2,1560);
insert into orders values(103,'2008-5-20',4,2060);

select * from orders;
select Date, (select count(distinct customer_id)
from orders o2
where o1.Date = o2.Date) as total_customers
from orders o1
group by Date;


--5th table
create table customer
(
ID int,
Name varchar(100),
Age int,
address varchar(100),
salary int,
);
insert into customer values(1,'ramesh',32,'ahamadabad',2000);
insert into customer values(2,'khilan',25,'Delhi',1500);
insert into customer values(3,'koushik',23,'Kolkata',2000);
insert into customer values(4,'chaitali',25,'mumbai',6500);
insert into customer values(5,'hardik',27,'bopal',8500);
insert into customer values(6,'komal',22,'madhya pradesh',45000);
insert into customer values(7,'muffy',24,'indore',10000);

select * from customer;
SELECT * FROM customer
WHERE salary >= 1000 AND salary <= 3000;




 