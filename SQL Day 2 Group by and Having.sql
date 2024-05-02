show databases;
use sql_intro;
show tables;

create table employees (Emp_Id  int primary key, Emp_Name varchar(25), age int, gender char(1), 
 doj  date, department varchar (20), city varchar (15), salary float);
 describe employees;
 insert into employees  values
 (112,"Jimmy", 35, "M", "2005-03-17","Sales", "Chicago", 70000),
(113,"Shan", 30, "M", "2002-03-12","Marketing", "New York", 40000),
(114,"Marry", 28, "F", "1999-04-17","Product", "Settle", 80000),
(115,"Can", 37, "M", "1998-05-16","Tech", "Bosten", 60000),
(116,"Sanem", 32, "F", "2006-03-19","Sales", "Austin", 50000),
(117,"Sara", 22, "M", "2000-06-22","IT", "Chicago", 98000),
(118,"Amy", 25, "F","1997-01-28","Finance", "Settle", 79000);
select * from employees;
select distinct city from employees;
select distinct department from employees;
select avg(age) from employees;
#avg in each department 
select department, round(avg(age),1) as average_age from employees group by department;
select department, sum(salary) as Total_salary from employees group by department;
select count(Emp_Id) , city from employees group by city 
order by count(Emp_Id) desc; #desc means desending order
select year(doj) as year, count(Emp_Id)  from employees group by doj;
create table sales (product_id int, sale_price float, quntity int, sales varchar (20)); 
insert into sales value
(121, 320.0, 3 , 'Califonia'),
(132, 290.0, 6 , 'NewYork'),
(211, 320.0, 4 , 'Washington'),
(221, 290.0, 2 , 'Colorodo'),
(334, 290.0, 5 , 'Alaska'),
(287, 320.0, 7 , 'Taxes'),
(111, 288.0, 9 , 'Ohio'),
(126, 320.0, 8 , 'Arizona');
select * from  employees;
select * from  sales;
 select product_id, sum(sale_price * quntity) as revenue from sales group by product_id;
 create table c_product (product_id int, cost_price float);
 insert into c_product
 values 
 (121, 170.0),
 (128,188.0),
 (123,250.0);
 select c.product_id, sum((s.sale_price-c.cost_price)* s.quntity ) as profit 
 from sales as s inner join c_product as c
 where s.product_id =c.product_id group by c.product_id;
 select * from employees;
 select department, avg(salary) as avg_salary
 from employees group by department having avg(salary) > 75000;
 
 select city, sum(salary) as total 
 from employees
 group by city having sum(salary) > 20000;
 select department, count(*) as emp_count 
 from employees
 group by department having count(*) > 1;
 select city, count(*) as emp_count 
 from employees 
 where city != 'Washington'
 group by city
 having count(*) > 1;
 
 
 