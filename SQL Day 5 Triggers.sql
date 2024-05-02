#subqueries
use sql_intro;
select *  from employees;
select emp_name, department, salary
from employees where salary > (select avg (salary) from employees);
select emp_name, gender,department, salary from employees where salary >
(select salary from employees where emp_name = 'johan');

use classicmodels;
select * from products;
select * from orderdetails;
select productcode, productname, MSRP from products 
where prouctcode in (select productcode from orderdetails where priceeach > 100);



#stored procedure
#use sql_iq;
#select * from players;
#delimiter $$
#create procedure top_players;
#begin select name




#Trigger in sql

create table student
(st_rll int, age int , name varchar(30), mark float); 
delimiter //
create trigger mark_verify_st
before insert on student
for each row
if new.mark < 0 then set new.mark = 50 ;
end if; // 

insert into student
values (501,10, 'Sanyy', 75.0),
(502,11, '	Ruth', -25.5),
(503,12, 'Mike', 95.0),
(504,13, 'Dev', 85.0),
(505,14, 'Jobs', 70.0),
(506,15, 'Devin' ,90.20);
select * from student;
 
 #drop trigger mark_verify_st;


#Views in sql
select * from customers;
create view cust_details
 as select customerName,phone,city
 from customers;
 select * from cust_details;
 
 
 #Views joins
 
 select * from products;

create view product_description as
select productName , quantityInStock,MSRP,textdescription  
from products as p 
inner join productlines as pl  
on p.productline = pl.productline;

select * from product_description;

# Rename description
rename table product_description
to veical_description;

#Display views
show full tables 
where table_type = 'View';
 
 #delete view
 drop view cust_details;
 
 
 #windows function
 
 use sql_intro;
 select * from employees;
 select Emp_Name,age,department
 sum(salary) over ( partition by department ) as total_salary
 from employees;
 #Row number
 
 select row_number () over(order by salary) as row_num, emp_name,
 salary from employees order by salary;
 
 create table demo (std_id int , std_name varchar (20));
 insert into demo
 values (101, 'Shane'),
 (102, 'Herat'),
  (103, 'Shary'),
   (104, 'Jony'),
    (101, 'Shane'),
    (105, 'Ne'),
      (103, 'Shary'),
     (106, 'Exi');
 select * from demo;
 
 select std_id,std_name,  row_number () over
 (partition by std_id, std_name order by std_id) as row_num from demo;
 
 #rank function
 
 create table demo1(var_a int);
 insert into demo1 
 value (101),(102),(103),(104),(105),(106),(107),(108),(109),(110);
 select * from demo1;
 select var_a,
 rank() over (order by var_a) as test_rank
 from demo1;
 
 #first value
 select emp_name, age ,salary, first_value (emp_name) 
 over (order by salary desc) 
 as highest_salary from employees;
 
 select emp_name, department, salary, first_value (emp_name) over
 (partition by department order by salary desc)
 as highest_salary from employees;
 
 
 