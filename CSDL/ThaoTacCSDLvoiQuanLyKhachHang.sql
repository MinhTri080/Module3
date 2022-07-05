-- create database CSDLQuanLyBanHang;
-- use CSDLQuanLyBanHang;
-- create table customer(cId int primary key auto_increment,name varchar(25),cAge tinyint);
-- insert into customer(name,cAge) values ('Minh Quan',10),('Ngoc Oanh',20),('Hong Oanh',50);
-- create table orders (cId int primary key auto_increment,oDate date,oTotalPrice int,cId int,foreign key (cId) references customer(cId));
-- insert into orders (oDate,oTotalPrice) values ('2022-07-06',null);
-- insert into orders (oDate,oTotalPrice) values ('2022-07-08',null);

-- create table product (pID int primary key auto_increment,pName varchar(25),pPrice int);
-- insert into product (pName,pPrice) values ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

-- create table OrderDetail (
-- odQTY int ,
-- oId int,
-- foreign key (oId) references orders(oID),
-- pId int,
-- foreign key (pId) references product(pID)
-- );
-- insert into orderdetail values (3,1,1),(7,1,3),(2,1,4),(1,2,1),(8,3,1),(4,5,2),(3,2,3);

-- hiển thị các thông tin gồm oID,oDate,oTotalPrice : 	
-- select orders.oID,orders.oDate,orders.oToTalPrice from orders;

-- hiển thị danh sách khách hàng đã mua hàng và danh sách sản phẩm được mua bởi các khách:
-- select customer.cId,customer.name,product.pName from orders 
-- join customer on orders.cID = customer.cID 
-- join orderdetail on orders.oID = orderdetail.oId
-- join product on orderdetail.pId = product.pID

-- hiển thị tên khách hàng ko mua sản phẩm nào :
-- select name,customer.cId from customer
--  left join orders on  orders.cID = customer.cID 
-- where orders.cID is null;

-- hiển thị mã hóa đơn,ngày bán và giá tiền của từng hóa đơn : 
select orders.oID,orders.oDate,orderdetail.odQTY* product.pPrice as TotalPrice
from orders
join orderdetail on orders.oID = orderdetail.oId
join product on orderdetail.pId = product.pID
