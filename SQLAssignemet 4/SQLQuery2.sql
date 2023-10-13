create procedure MultiplicationTTable @table int
as 
begin
declare @M int
declare @P int
if @table <= 0
begin
print 'Please Input A Positive Integer'
return
end
set @M = 7
while @M <= @table 
begin 
print 'Multiplication Table For ' + cast(@i as varchar(10)) + ':'
set @P = 1
while @P<=10
begin
print cast(@i as varchar(10)) + ' * ' + cast(@j as varchar(10)) + ' = ' + cast(@i * @j as varchar(10))
set @P = @P+1
end
print ''
set @M = @P + 1
end
end
exec MultiplicationTTable @table = 10;