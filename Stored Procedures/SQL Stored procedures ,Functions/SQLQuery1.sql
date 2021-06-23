use sample
select * from emp
create procedure sp1
as
begin
select * from emp
end
execute sp1
----exec sp1
create table emp5 (eid int , ename varchar(40) , salary money)
select * from emp5
create procedure spinput(@eid int , @ename varchar(40),@sal money)
as
begin 
insert into emp5 values (@eid,@ename,@sal)
end
select * from emp5
execute spinput 101 ,'venky',26000


create procedure sp3 (@empid int ,@pf int out , @pt int out)
as
begin
declare @sal money
select @sal=salary from employee1 where empid = @empid
set @pf = @sal * 0.1
set @pt = @sal * 0.2
end
----exec sp2(102)
declare @bpf int , @bpt int
execute sp3 102,@bpf out, @bpt out
print 'provident fund is:'+cast ( @bpf as varchar)
print 'professional tax is:'+cast ( @bpt as varchar)
select * from employee1


create function f_grasal(@empid int)
returns money
as
begin
declare @basic money,@hra money ,@da money ,@pf money ,@gross money
select @basic = salary from employee1 where empid = @empid
set @hra = @basic * 0.1
set @da = @basic * 0.2
set @pf = @basic * 0.1
set @gross = @basic + @hra + @da+ @pf
return @gross
end
select * from employee1
select dbo.f_grasal(102)
select * from Employee2
sp_rename 'Employee2.dept','deptname'

create function tvf1(@deptname varchar(40))
returns table
as 
return(select * from employee2 where deptname=@deptname)

select * from tvf1('HR')
select * from tvf1('IT')
