#Q1
#Where & HAVING
#where clause  : used for filter the record based on the specified condition
#where clause can'nt have agreegate funtion
#where clause in implimented on rows

#having clause  : having clause is used the filter the record from group based on specified condition
#having clause can  oprated on agreegate funtion
#having in implimented on columns

#Q2
#DROP & truncate
#drop
#removes table defination and its contents
#the view of the table does not exist
#integrity constraints will be removed


#truncet  delete all the row from the table 
#the view of the table is exist
#integrity constraints will be not removed


#Q3   Find the lowest salary for each department
use sql_intro;
select * from employees;
select department, min(salary) as lowest_salary from employees group by department ; 

#Q4  which query will help you fetch unique value from column in a table
#Ans  the DISTINCT columns_name  from table_name;


#Q5  Write the sql  query will help you fetch unique value from employees table

#Unique departments'

select distinct department from employees ; 

#Q6 unique (distinct function) departments and length
select distinct department ,  length(department) as dept_length from employees;

#Q 7 what is use of datediff function in sql
#the datediff function return the number of days datetime or date stamp values

#datediff functiom 
select datediff('2021-04-10', '2021-03-31')
as total_days;
select datediff(now(), '2021-04-20');
select datediff(now(),'1999-04-21');


#Q8  write on sql query to display the department that have more than department 

#department more thanm 2 employees 
select department , count(emp_id) as total_emp from employees
group by department having count(emp_id)> 1;

# Q9 display the details of the employees for the departmnt except marketing 
#details of apart from marketing 
select *  from employees
where department <> 'marketing';

select * from employees 
where department != 'marketing' ; 


#Q10 #employees join before april 2010 and after 03 - 2005
select * from employees 
where doj > '2005-05-31' and doj< '2010-03-31';


#Q11 find the employees with the 3 rd  highest salary 
 select * from (select * from employees
 order by salary desc limit 3) as T 
 order by salary limit 1;
 
 #Q12 print all the alternate records in the table 
 #print alternate records
 select * from employees
 where emp_id % 2=0;
 
 with CTE as
 (select * , row_number () over (order by emp_id) as rn from employees )
 select * from cte where   rn  % 2 = 1 ;
 
  
 with CTE as
 (select * , row_number () over (order by emp_id) as rn from employees )
 select * from cte where   rn  % 2 = 1 ;
 
 #Q 13 
 #duplicate records
select * from employees;
select emp_id, emp_name, age, count(*) as dup_count from employees
group by emp_id ,emp_name, age
having count(emp_id) > 1  and count(emp_name) > 1 and count(age) > 1;

#Q15 disply the employees exactly 2A's in their name.
select * from employees ;
select  length(replace(upper(emp_name),' A', '')) from employees;
 select * from employees where length(emp_name) - length(replace(upper(emp_name),' A', ' ')) =2;
 
 #Q16 extract string
 select substr("michal balack",2,4);
 