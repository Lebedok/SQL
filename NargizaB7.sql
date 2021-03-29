select * from employees;

select min_salary , max_salary from jobs;

--This is single line comment
/*
This is multiple line comment in sql
*/
select *from employees
where department_id=50;

-- 

select department_name from departments
where department_id=50;

select department_name from departments
where department_id=30;

select department_name from departments
where department_id=10 or department_id=30 or department_id=50;

select department_id from departments;

select department_name from departments
where department_id=10 or department_id=20 or department_id=30 or department_id=40 or department_id=50;

select department_name from departments
where department_id in (10,30,50,70,100);

select department_name from departments
where department_id between 10 and 100;

select * from employees
where department_id=50 and job_id='ST_MAN';

select * from employees
where department_id=50 or job_id='ST_MAN';

select * from employees
where department_id=60 or job_id='ST_CLERK';

/*
Print all the employees who has department id is 70 or selery more than 5000
*/

select *from employees
where department_id=70 or salary > 5000 and  employee_id>180;

select *from employees
where department_id=70 and  salary > 5000;

/*
write query to find the employees who is not displayed after preious query
*/

select * from employees
where department_id!=70 or salary < 5000 and employee_id >180;


select * from employees
where department_id!=70 and salary > 5000 and employee_id>180;

select * from employees
WHERE department_id is null;

select * from employees
where department_id is not null;

select * from employees
where not department_id=70;

-- print all the employees whom salary is between 60000 to 100000 and hire date is after June 7, 1997

select * from employees
where salary between 6000 and 100000 and hire_date>'07-JUN-97';


--concatination
select first_name ||  ' ' || last_name as fullname from employees;


--print all lastnames and add them to tem @gmail.com to generate gmail for everyone 
select last_name || '@gmail.com'  as gmailaccount FROM employees;

-- print data by ascending and descending order 

select * from employees
order by first_name DESC;

select * from employees
order by first_name ASC;

-- print all the employees who is earning more than 5000 and order the result by the hire date descending order 
select * from employees
WHERE salary > 5000 
order by hire_date desc , first_name asc; 

select first_name , commission_pct from employees
order by commission_pct asc, first_name desc;


-- Starts with capital 'A' 
select * from employees
where first_name like 'A%'
order by first_name;

-- ends with a
select * from employees
where first_name like '%a'
order by first_name;

-- find data which contains tt 
select * from employees
where first_name like '%tt%'
order by first_name;

select * from employees
where first_name like '%t_p%'
order by first_name;


-- list all empl who startted working in FEB, MAR ,APR 
select * from employees
where hire_date like '%FEB%' or hire_date like'%MAR%' or hire_date like'%APR%'
order by hire_date;


-- list all employees whose last name contains two lower case a; 
select * from employees 
where last_name like '%a%a%';

select first_name from employees
where employee_id=154;

select * from employees
where commission_pct is not null
order by commission_pct asc;


-- print all the first names who has third and forth letter is ll. Like Sally 

select * from employees 
where first_name like '__ll%';


-------------------SINGLE EROW FUNCTIONS---------------------
--UPPER, LOWER , INITCAP

select UPPER(last_name) from employees;
select last_name from employees;

select lower(first_name) from employees;

select initcap (lower(email)) from employees;

select initcap(email)from employees;  

select upper(department_id) from employees;


----CONCAT------
select concat('Techtorial - ' , first_name) as TECHTORIAL from employees;
select 'Techtorial - ' || first_name as Techtorial from employees;  -- same as concat

---- LENGTH---
select length(region_name) from regions;
select length (region_id)from regions;

----SUBSTR--- in SQL substring will count from 1 NOT 0. 
select substr(first_name,3,2) as substring from employees --3 starting char , 1 how many char after 3 you want see
order by substring;

---------instr-------
select city from locations;
select instr(city,'a') from locations;

select length(city)from locations
where instr (city , 'a')>0;


--  return first name and last name combined as lower case with the space 
--- and find the index number of 'ka'  from combined firstname and lastname 
select instr(lower(first_name ||' '|| last_name ),'ka') as full_name from employees
where instr(lower(first_name ||' '|| last_name ),'ka')>0 ;

----ROUND-----
select * from employees
where commission_pct is not null;


select round(commission_pct,1)from employees
where commission_pct is not null;

select round(3.1265,2)from employees; --- result: 3.13 

select round(3.1265)from employees;   ---- result: 3


---------TRUNC-----------
select trunc(3.1254,2) from employees;  --- 3.12
select trunc(3.1254) from employees; -------3 

----------MOD --------- it gives remainder
select mod(salary,2)from employees;

select mod (5,2) from locations;
select mod(13,3) from regions;


-- print all employee name is odd number 

SELECT first_name, employee_id FROM employees 
WHERE mod(employee_id,2) = 1;

-----------REPLACE-------------
select replace(first_name,'e','TT') from employees;

-- replace all the 'a' with "***" from last name if the last name lenght is even number and print last name  
select  replace( last_name,'a','***') from employees
where mod(length(last_name),2)=0;

--- MULTIPLE ROW FUNCTIONS------
--AVG, COUNT, MAX, MIN , SUM

select round(avg(salary),2)from employees;

select count(*)from employees;

select count(location_id)from locations;

-- print count of employees if the employee name has more than 4 character 
select count (*) from employees
where length (first_name)>7;

--MAX and MIN 
select first_name, salary from employees
order by salary;

select max(salary) from employees;

------ MAX salary---------
select first_name from employees
where salary=(select max(salary)from employees);

---------second MAX salary---------
select first_name from employees
where salary=(select max(salary)from employees where salary!=(select max(salary)from employees));


select max(first_name) from employees; -- it will give last first_name sorted by alphabetical order 
SELECT max (hire_date) from employees; -- it will give latest date. In this example last person who is hired 

-- print last name of the employee who is hired last to the company 
select last_name from employees
where hire_date=(select max(hire_date) from employees);


-----MIN----
select min(salary)from employees;
SELECT min(hire_date) from employees;


-- print job id  of the employee who is hired first 
select job_id from employees
where hire_date=(select min(hire_date) from employees);

---- SUM----
select sum(salary)from employees;


---Print all first_name and last_name from employee table
-- who has at least 3 'a' in their first name or 2 'a' in their last name 

select first_name,last_name from employees
where first_name like '%a%a%'or  last_name like '%a%a%';



--- DISTINCT keyword -----
/* we use distinct to get unique value from the table*/

select distinct (first_name) from employees;

-- print count of all unique region IDs under countries table
select count (distinct(region_id)) from countries;


----  GROUP BY----
/*Group by is used to group the result in query. Group by mostly used with multi row functions.
If you have where keyword it will com brfore the group by */

select count(country_name)  from countries 
group by region_id;

-- Print number of employees under same manager
select manager_id, count(first_name) from employees
group by manager_id;

select first_name from employees
where employee_id=100;

select first_name from employees
where manager_id=100;


-- print max salary for each department 
select department_id, max (salary) from employees
group by department_id; 


select department_name from departments
where department_id=100;

select * from jobs;


-- display min salary for each department_id who has min salary more than 5000
select department_id, min (salary) from employees
where salary > 5000
group by department_id;


-- find out sum of all salaries for each job;
select job_id, sum(salary) from employees
group by job_id;

 select max(sum) from (select job_id, sum(salary) as sum from employees
 group by job_id);
 
 
 -- GROUP EMPLOYEES BY THEIR FIRST_NAME'S FIRST LETTER AND FIND OUT NUMBER OF EMPLOYEES FOR EACH GROUP;
 
 select count (first_name) from employees
 group by substr(first_name,1,1);
 
 
 
 
 ---HAVING KEYWORD----
 /* We can use having keyword when we try to use the multi - row functions the conditional statement
 Where keyword will not work with multi - row functions.  WHERE keyword not working in multi-row function in conditional statements, HAVING is working */
 
 select round(avg (salary)) from employees
 group by department_id
 having avg(salary) > 7000;
 
 
 -- find out count of employees under same manager and exclude the manager with null values
 
 select count (employee_id) from employees
 group by manager_id
 having manager_id is not null;
 
 -- display the manager ID and salary of lowest paid employees for each manager,
 -- exclude anyone with manager_id is null and exclude any group where the min salary is less $6000
 select manager_id, min (salary) from employees
 group by manager_id
 having manager_id is not null and min(salary)>6000
 order by manager_id;
 
 
 
 -- find out name of person with max salary 
 
 select first_name from employees
 where salary=(select max(salary) from employees);
 
 
 -- find out employees first_name and salary who makes more than employee who has employee_id 121
 select first_name, salary from employees
 where salary > (select salary from employees
 where employee_id=121);
 
 --find out employees first_name, department_id who works in same department
 --with employee who has employee_id 150;
 
 select department_id from employees
 where employee_id=150;
 
 select first_name, department_id from employees
 where department_id= (select department_id from employees
 where employee_id=150); 
 
 
 --- How do you find second largest salary?
 
 select * from employees order by salary;
 
 select max (salary) from employees
 where salary < (select max(salary) from employees);
 
 
 --  how do you find the name of the employee who is making second largest salary?
 select first_name from employees
 where salary=(select max(salary) from employees
 where salary<(select max(salary) from employees));
               
               
   --- GROUP BY: Find out number of postal code under same country from locations table
 select country_id,  count (postal_code) from locations
 group by country_id;
 
 
 -- HAVING: display number of postal code under same countries from locations table
 --if their count is more than 2 
 
 select country_id, count (postal_code) from locations
 group by country_id
 having count (postal_code)>2;
 
 
 ---SUBQUARY ---
 -- dispaly all the employees who is making more than avarage salary
 select first_name, salary from employees
 where salary >  (select avg (salary)from employees)
 order by salary;
 
 --- display all the cities that has same state with Siettle
select city from locations
where state_province = (select state_province from locations where city ='Seattle');
 
 
 
 ---  Dispaly the employee name who is making second lowest salary
 select * from employees order by salary;
 
 
 select min (salary) from employees
 where salary >(select min (salary) from employees);
 
 
 ---  ROWNUM --- 
 -- we can use rownum with where clause in the query. It will be used with bigger than (>) or less than symbol (<). 
 
 -- find out 5th lowest salary  
 select max(salary) from (select distinct (salary) from employees
 order by salary)
 where rownum < 11;

               
select * from employees
where salary =  (select max(salary) from (select distinct (salary) from employees
 order by salary)
 where rownum < 6);
 
 
 --find out 5th largest salary 
 select * from employees order by salary desc;
 
 select * from employees
 where salary =( select min (salary) from (select distinct(salary) from employees 
 order  by salary desc)
 where rownum < 6);
          
               
 
 --- find out department name for Neena
 select department_name from departments 
 where department_id = (select department_id from employees
 where first_name = 'Neena');
 
 
 
  select* from departments 
 where department_id = (select department_id from employees
 where first_name = 'Neena');
               
               
 
 -------- JOINS-------
select e.first_name, e.department_id, d.department_name 
from employees e join departments d
on e.department_id = d.department_id;

select first_name from employees
where department_id is null;

select department_name from departments
where department_id is null;

-- Print country name, country_id and  region name for each country 
select country_name, country_id, region_name 
from countries c join regions r
on c.region_id = r.region_id;


-- Print last_name, email, job title for each employee 
--INNER JOIN - it givesonly  matching data from both tables
select last_name, email, job_title
from jobs j inner join employees e
on e.job_id =  j.job_id;


--RIGHT JOIN. matching data from both table and non matching data from rigth side of the table 
select last_name, email, job_title
from jobs j  right join employees e
on e.job_id =  j.job_id;


select first_name, email, department_name 
from departments d right outer join employees e
on d.department_id = e.department_id; 


--- FULL OUTER JOIN, It gives matching data and non matching data from both table 
select first_name, email, department_name 
from departments d full outer join employees e
on d.department_id = e.department_id; 
 
 
 --- LEFT JOIN matching data from both table and non matching date from left side of the table 
select first_name, email, department_name 
from departments d left outer join employees e
on d.department_id = e.department_id; 


---NATUTRAL JOIN 
select country_name, country_id, region_name 
from countries c natural join regions r;
               
               
 
 --- Print all the department name and where they are located 
select department_name,manager_id, d.location_id, city, state_province
from locations l join departments d
on d.location_id = l.location_id;


select department_name,manager_id, d.location_id, city, state_province
from departments d join locations l
on d.location_id = l.location_id;

select department_name,manager_id, d.location_id, city, state_province
from locations l left outer join departments d
on d.location_id = l.location_id
where d.location_id is null;

select department_name,manager_id, d.location_id, city, state_province
from locations l RIGHT outer join departments d
on d.location_id = l.location_id
where l.location_id is null;

--- Version #2
select department_name,manager_id, d.location_id, city, state_province
from locations l,  departments d
where d.location_id = l.location_id;

-- Version#3
select department_name,manager_id, location_id, city, state_province
from locations natural join  departments; 

-- Version #4

select department_name,manager_id,location_id, city, state_province
from locations join   departments 
using(location_id);


--- INDIRECT JOIN ---
select first_name , department_name, city, state_province
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

select state_province, count(*) from 
(select first_name , department_name, city, state_province
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id)
group by state_province;


-- Print last_name, department_name, city, country, country_name, region name for each employee
select last_name, department_name, city, country_name,region_name
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
join countries c
on l.country_id=c.country_id
join regions r
on r.region_id=c.region_id;



---- SELF JOIN ----
select * from employees;

-- manager_id of the employee should be equals to employee_id of manager
select e.first_name as employee_firstname, m.first_name as manager_firstname
from employees e join employees m
on e.manager_id = m.employee_id;


-- How to get count of employees of manager 
select manager_firstname, COUNT(*) as countemp from
(select e.first_name as employee_firstname, m.first_name as manager_firstname
from employees e join employees m
on e.manager_id = m.employee_id)
group by manager_firstname
order by countemp asc;



-------------- SET OPERATORS-----------------
--- UNION --
select first_name, last_name, department_id
from employees
where department_id in (10,20,50)
UNION
select first_name, last_name, department_id
from employees
where department_id in (20, 30, 50)
order by department_id;


select first_name, last_name, department_id
from employees
where department_id in (10,20)
UNION All
select first_name, last_name, department_id
from employees
where department_id in (10, 20, 30)
order by department_id;


--- print employee first_name, hire_date and salary where salary range is 4000 to 7000 and 6000 to 9000
select first_name, hire_date, salary
from employees
WHERE salary between 4000 and 7000
UNION 
select first_name, hire_date, salary
from employees
WHERE salary between 6000 and 9000
order by salary;

----- MINUS - It will give the result from first query which is not exists in second query 

select first_name, hire_date, salary
from employees
WHERE salary between 4000 and 7000
MINUS
select first_name, hire_date, salary
from employees
WHERE salary between 6000 and 9000
order by salary;

----INTERSECT --will give the data which is exist in both query. 6000 - 7000
select first_name, hire_date, salary
from employees
WHERE salary between 4000 and 7000
INTERSECT
select first_name, hire_date, salary
from employees
WHERE salary between 6000 and 9000
order by salary;


---- CREATE STUDENT TABLE----
create table students(student_id  number(5), full_name varchar(20), class_id number(3));

create table class (class_id number(3), class_name varchar(10));

insert into students values(12345, 'Chopa',55);

select *from students; 
                                                           
                                                           
 select * from students; 
insert into students values(12346, 'Ridvan', 55);
insert into students values(12347, 'Zhazira', 55);
insert into students values(12348, 5444, 55);
insert into students values(12348, 'Ramis', 57);
insert into class values(55, 'selenium'); 
insert into class values(56, 'java'); 
insert into class values(57, 'sql'); 
select * from students; 
select * from class; 
--- TASK: print full name and class name for each student. 
select full_name, class_name
from students natural join class; 
select * from students;
update students set student_id=12346, full_name='Joe'
where student_id=12345; 
delete students where student_id=12348;
insert into students values(12346, 'Ridvan', 55);
insert into students values(12348, 'Ilker', 55);
insert into students values(12349, 'Chopa', 56);
insert into students values(12350, 'Joe', 56);
delete students where student_id=12348;
select full_name, class_name
from students natural join class;
-- count of students for each class.


 
 
--- Create table: NUMBER, INT, DECIMAL
create table customers(
ID int not null, 
FIRST_NAME VARCHAR (20),
LAST_NAME VARCHAR(10),
ADDRESS CHAR(15),
PRIMARY KEY(ID)
);

create table orders(
ORDER_ID number (5) not null,
CUSTOMER_ID int not null,
PRODUCT_ID number (3) not null,
quantity number(1),
primary key (order_id));


create table PRODUCTS(
product_id number (3)not null,
product_name varchar (10),
price decimal (4,2),
primary key (product_id)
);

insert into customers values (123, 'David' , 'Hunt','2000 E Devon');
insert into customers values (124, 'Kushal', 'Jain' , '2100 W Randolf');

select * from customers;
commit;

insert into orders values(1,123,450,3);
insert into orders values(2,124,450,5);
insert into orders values(3,123,451,2);
insert into orders values(4,123,450,1);
select*from orders;


insert into products values(450, 'Pen', 4.5);
insert into products values(451,'Mug', 2.9);
insert into products values(452, 'Book',19.99);

select * from customers;
select * from orders;
select *from products;


 
 
