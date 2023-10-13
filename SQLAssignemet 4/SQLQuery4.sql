declare @ToFactorial bigint = 10;
declare @Fac int = 0;
declare @To int = 1;
declare @x int = @ToFactorial;
declare @y int = @ToFactorial;
declare @i int = @x;
while(@i > 1)
begin
declare @j int =1;
while (@j<@i)
begin 
set @To = @y + @Fac;
set @Fac = @To;
set @j = @j+1;
end
set @y = @To;
set @Fac = 0;
set @i = @i-1;
end
select @To as 'Factorial'