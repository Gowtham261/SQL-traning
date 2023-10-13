create Table Pongal(
holiday_date Date,
holiday_name NVARCHAR(100)
);
--Insert holiday details
Insert into Pongal(holiday_date, holiday_name)
values
('2023-12-25', 'Christmas'),
('2023-08-16', 'Vinayaka Chavithi'),
('2023-09-02', 'Gandhi jayanthi'),
('2023-04-11', 'Elections')

select * from Pongal

--Trigger
create or alter trigger prevent_holiday_manipulation
on holiday 
after insert, update, delete
as
begin
    declare @holiday_message varchar(100);
    declare @error_message varchar(100); 

    if exists (select 1 from Pongal where holiday_date in (select holiday_date from inserted)) begin
        select @holiday_message = holiday_name from Pongal where holiday_date in (select holiday_date from inserted);
        select @error_message = 'Due to ' + @holiday_message + 'cannot manipulate data';
        rollback;
        raiserror(@error_message, 16, 1);
    end;
end;
update Pongal set holiday_name = 'holiiiii' where holiday_date='2023-12-25';