-- tính giá trị trung bình của 1 cột kiểu số :
-- select AVG(cAge) from customer;
-- SELECT 
--     AVG(cID)
-- FROM
--     customer;

-- trả về số lượng bản ghi thỏa mãn điều kiện (đếm số):
-- select count(cAge) from customer;
-- select count(pId) from orderdetail;

-- trả về giá trị lớn nhất trong 1 cột
-- select max(cAge) from customer;
-- select max(name) from customer;
-- select max(cID) from customer;

-- trả về giá trị nhỏ nhất trong 1 cột :
-- select min(cAge) from customer;
-- select min(cID) from customer;
-- select min(name) from customer;

-- trả về tổng giá trị của 1 cột kiểu số: 
-- select sum(cAge) from customer;
-- select sum(cID) from customer;

-- trả giá trị từ chữ thường sang viết hoa :
-- select ucase(name) from customer;
-- trả giá trị chữ hoa sang viết thường:
-- select lcase(name) from customer;

-- trả về độ dài của chuỗi (số lg kí tự) trong cột kiểu chuỗi :
-- select length(name) from customer;
-- as dùng để đặt tên cho cột
-- select now() as date from orders;

-- select pId,oId from orderdetail group by pId having pId >3;
-- select odQTY,count(*) as 'so luong QTY' from orderdetail group by odQty;

