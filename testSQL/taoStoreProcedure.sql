create database sumofall;
use sumofall;
create table sumofall(amount int);
insert into sumofall values(100),(330),(450),(400);
select * from sumofall;

delimiter //
create procedure sp_CheckValue(in value1 int,out value2 int)
begin
set value2 = (select amount from sumofall where amount=value1);
end;
// delimiter ;

call sp_CheckValue(330,@exits);

select @exits;