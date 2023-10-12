create table PropertyNo
(Clientno varchar(50),
Clientname varchar(50),
Propertyno varchar(50))
insert into PropertyNo values
('CR76','John Kay','PG4'),('CR76','John Kay','PG16'),
('CR56','Aline Stewart','PG4'),('CR56','Aline Stewart','PG36'),('CR56','Aline Stewart','PG16')
select * from PropertyNo

 

create table PAddress
(Clientno varchar(50),
Clientname varchar(50),
paddress varchar(50),
)
insert into PAddress values
('CR76','John Kay','6 Lawrence St,Glasgow'),('CR76','John Kay','5 Novar Dr,Glasgow'),
('CR56','Aline Stewart','6 Lawrence St,Glasgow'),('CR56','Aline Stewart','2 Manor Rd,Glasgow'),('CR56','Aline Stewart','5 Novar Dr,Glasgow')
select * from PAddress

 

create table RentStart
(Clientno varchar(50),
Clientname varchar(50),
RentStart date)
insert into RentStart values
('CR76','John Kay','1-Jul-00'),('CR76','John Kay','1-Sep-02'),
('CR56','Aline Stewart','1-Sep-99'),('CR56','Aline Stewart','10-Oct-00'),('CR56','Aline Stewart','1-Nov-02')
select * from RentStart

 

create table RentFinish
(Clientno varchar(50),
Clientname varchar(50),
RentFinish date)
insert into RentFinish values
('CR76','John Kay','31-Aug-01'),('CR76','John Kay','1-Sep-02'),
('CR56','Aline Stewart','10-Jun-00'),('CR56','Aline Stewart','1-Dec-01'),('CR56','Aline Stewart','1-Aug-03')
select * from RentFinish


create table Rent
(Clientno varchar(50),
Clientname varchar(50),
Rent int,
)
insert into Rent values
('CR76','John Kay',350),('CR76','John Kay',450),
('CR56','Aline Stewart',350),('CR56','Aline Stewart',370),('CR56','Aline Stewart',450)
select * from Rent

 

create table OwnerNo
(Clientno varchar(50),
Clientname varchar(50),
OwnerNo varchar(50))
insert into OwnerNo values
('CR76','John Kay','CO40'),('CR76','John Kay','CO93'),
('CR56','Aline Stewart','CO40'),('CR56','Aline Stewart','CO93'),('CR56','Aline Stewart','CO93')
select * from OwnerNo

 

create table OwnerName
(Clientno varchar(50),
Clientname varchar(50),
OwnerName varchar(50))
insert into OwnerName values
('CR76','John Kay','Tina Murphy'),('CR76','John Kay','Tony Shaw'),
('CR56','Aline Stewart','Tina Murphy'),('CR56','Aline Stewart','Tony Shaw'),('CR56','Aline Stewart','Tony Shaw')
select * from OwnerName