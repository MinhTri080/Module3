-- create database student_management;
-- create table student(id int not null primary key auto_increment,name varchar(45) not null ,age int not null,country varchar (45));
-- thêm trường id tự tăng vào bảng

-- CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;
-- ALTER TABLE `student_management`.`student` -- 
-- alter table student_management.student
-- change column id id int not null auto_increment;

-- thêm nhiều thông tin vào bảng 
-- insert into student(name,age,country) values ("tri dao",22,"Hue"),("minh rinh rap",23,"Hue"),("luon em",18,"Hue"),("bo dien",22,"Hue");

-- select * from student;
-- lấy tất cả từ student ở nơi có id =4
-- select * from student where id =4; 
-- xóa 1 dòng tại vị trí id = 3
-- delete from student where id =3;

-- cập nhập thông tin tại nơi id =4
-- update  student set country = "Phú Đa" where id =4;

-- cập nhập thông tin tại nhiều nơi với id
-- update student set country = case when id =6 then "Quảng Trị"
-- 									when id =5 then "Quảng Ninh"
--                                     when id = 1 then "Hà Lội"
--                                     else ""
--                                     end
-- 
								-- where id in (6,5,1);
                        
-- thêm cột email vào bảng
-- alter table student
-- add email varchar(50);

-- lấy id,tên và tuổi với tuổi >20
-- select id,name,age from student where age> 20;
-- select id,name,age from student where name = "tri dao";
-- select id,name,age from student where age >= 18 and age <=22;
-- select id,name,age from student where age =18 or age =22;
-- tìm kiếm giá trị 
-- select * from student
-- where age like "2%1";

-- sử dụng limit để giới hạn trả về trong 1 bảng
-- select * from student
-- limit 2;
-- lấy ra 2 giá trị lớn nhất hoặc nhỏ nhất trong bảng 
-- select * from student
-- order by  age DESC

-- select * from student
-- order by age ASC;

-- nhóm các tập hợp các cột muốn hiển thị
-- select name,country from student
-- loại bỏ các mục trùng lặp trong bảng
-- select distinct age from student order by age;
-- group by name;

-- UPDATE `student_management`.`student` SET `email` = 'sinhcute@gmai.com' WHERE (`id` = '1');
-- UPDATE `student_management`.`student` SET `email` = 'tridaosovo@gmail.com' WHERE (`id` = '2');
-- update student_management.student set email = "sinhcute@gmai.com" where id = "1";
-- update student_management.student set email = "tridaosovo@gmail.com" where id = "2";
-- update student_management.student set email = "minhrinhrap@gmail.com" where id = "4";

-- insert into student_management.student (id,name,age,country,email) values (3,"Lộc",24,"Huế","loclongla@gmail.com")

-- select id,name,age,country from student
-- select id,name,age,country,email from student where email is not null;

-- truy vấn tìm tên bắt đầu với bao
-- select name from student where name regexp '^bao';
-- select name from student where name regexp 'inh$';
select name from student where name regexp 'b';