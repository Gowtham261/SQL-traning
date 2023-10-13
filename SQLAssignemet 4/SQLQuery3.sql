create Table Holiday
(
holiday_date Date,
holiday_name VARCHAR(100)
);
--Insert holiday details
Insert into Holiday(holiday_date, holiday_name)
values
('2023-09-18', 'Ganesh Chaturthi'),
('2023-10-02', 'Gandhi Jayanthi'),
('2023-10-24', 'Vijaya Dashami'),
('2023-11-13', 'Diwali'),
('2023-12-25', 'Christmas')
select * from Holiday
--Trigger
create or alter trigger prevent_holiday_manipulation
on holiday
after insert, update, delete
as
begin
    declare @holiday_message varchar(100);
    declare @error_message varchar(200); 

    if exists (select 1 from holiday where holiday_date in (select holiday_date from inserted)) begin
        select @holiday_message = holiday_name from holiday where holiday_date in (select holiday_date from inserted);
        select @error_message = 'Due to ' + @holiday_message + ' you cannot manipulate data';
        rollback;
        raiserror(@error_message, 16, 1);
    end;
end;
update Holiday set holiday_name = 'Elections Holiday' where holiday_date='2023-12-25';