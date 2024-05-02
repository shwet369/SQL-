create database triggers;
use triggers;
show tables;
#before insert trigger
create table customers
(cust_id int, age int, name varchar(30));

delimiter //
create trigger age_verify
before insert on customers
for each row
if new.age >0 then set new.age = 0 ;
end if ;  //
insert into customers
values (101,20,'Ammy'),
(102,30,'Jon'),
(103,40,'Marry'),
(104,30,'Sam'),
(105,37,'Roky'),
(106,40,'Xera');
select *  from customers;
