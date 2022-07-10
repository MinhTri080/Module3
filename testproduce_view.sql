create database student_info;
use student_info;
create table studentinfo(id int primary key auto_increment,name varchar(25),address varchar(50),subject varchar(250));
insert into studentinfo(name,address,subject) values 
('Trí Đào','Trên Cành','Bật lại vợ'),
('Anh Minh','Trên Lá','Chém chuối'),
('Ngọc Trung','Trên Cây','Trung Tình'),
('Đại Lộc','Trên Đất','Làm thế nào để bỏ nhậu'),
('Lượng','Trên mây','Lươn Lẹo'),
('Trí Lê','Trên Đường','Code dạo');
select * from studentinfo;
delimiter // 
create procedure allrecords()
begin
select * from studentinfo;
end //
delimiter ;
call allrecords();
create view view_student as 
select name,address,subject
from studentinfo;
select * from view_student;