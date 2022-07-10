delimiter //
drop procedure if exists`checkphone` //
create procedure checkphone(in cusPhone varchar(50))
begin
select * from customers where phone  = cusPhone;
end // 
delimiter ;
call checkphone('7025551838');