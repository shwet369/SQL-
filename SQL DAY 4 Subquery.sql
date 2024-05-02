#select statement
show databases;
use classicmodels;


show tables;
select * from employees;
select firstname,jobTitle,reportsTo from employees
where reportsTo > (select avg (reportsTo) from employees) ;
#update subquery
create table productss
(prod_id int, productss varchar (30) ,
sale_price float, product_type varchar (30));
insert into productss 
values(101, 'jwellery',1800, 'Luxary'),
(102, 'Teshirt', 1000, 'Luxary'),
(103, 'Laptop', 51000, 'Luxary'),
(104, 'Table', 500, 'non_Luxary');
select * from productss;

create table orderrs
(order_id int, product_sold varchar(30), selling_price float);


insert into orderss
select prod_id, item, sale_price from product where prod_in in
(select prod_id from product where sale_price >1000);
select * from orderss;
