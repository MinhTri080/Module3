-- #INSERT INTO `classicmodels`.`customers` (`customerName`, `contactLastName`, `contactFirstName`, `phone`, 
-- `addressLine1`, `city`, `country`, `creditLimit`) VALUES 
-- ('Tri', 'Le', 'LEe', '123', 'Cho cong', 'London', 'Hue', '12');

delimiter //
create procedure insertCustomers(
	-- in cNumber integer,
	in cName varchar(50),
    in cLastName varchar(50),
    in cFirstName varchar(50),
    in cPhone varchar(50),
    in cAddressLine1 varchar(50),
    in cCity varchar(50),
    in cCountry varchar(50),
    in cCreditLimit decimal(10,2),
    out message varchar(50)
)
begin 
declare maxNumber integer;
declare flag boolean;
set maxNumber = (select max(customerNumber) from customers) + 1;
	if (exists(select phone from customers where phone = cPhone)) then 
    set  message = 'số điện thoại đã tồn tại';
    end if;
    if(cCountry not in(select country from customers where country = cCountry)) then
    set message ='Thành phố bạn nhập phải nằm trong danh sách';
    -- select country from customers 
-- 	group by country ;
    end if;
    if(not exists (select phone from customers where phone = cPhone) and cCountry  in (SELECT distinct country FROM classicmodels.customers)) then
		INSERT INTO `classicmodels`.`customers` (`customerNumber`, `customerName`, `contactLastName`, `contactFirstName`, 
        `phone`, `addressLine1`, `city`, `country`, `creditLimit`) VALUES 
        (maxNumber, cName, cLastName, cFirstName, cPhone, cAddressLine1, cCity, cCountry, cCreditLimit);
        set message = 'đã thêm thành công';
    end if;
end ;
//