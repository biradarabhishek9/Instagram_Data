create database q;
drop database q;
use q;
CREATE TABLE IF NOT EXISTS salespersons(salesperson_id int, first_name varchar(255), last_name varchar(255));
CREATE TABLE IF NOT EXISTS address (address_id int, salesperson_id  int, city varchar(255), state varchar(255), country varchar(255));
TRUNCATE TABLE address;
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('1', 'Green', 'Wright');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('2', 'Jones', 'Collins');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('3', 'Bryant', 'Davis');

TRUNCATE TABLE address;
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('1', '2', 'Los Angeles','California', 'USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('2', '3', 'Denver', 'Colorado','USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('3', '4', 'Atlanta', 'Georgia','USA');

select * from address;
select * from salespersons;

SELECT first_name, last_name, city, state 
FROM salespersons left join address
ON salespersons.salesperson_id = address.salesperson_id
order by last_name asc;

drop table salemast;
CREATE TABLE If Not Exists salemast(sale_id int, employee_id int, sale_date date, sale_amt int);
TRUNCATE TABLE salemast;
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('1', '1000', '2012-03-08', 4500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('2', '1001', '2012-03-09', 5500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 3500); 
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 2500);

select sale_amt as second_highest_score
from salemast
order by sale_amt desc
limit 2,1;


SELECT DISTINCT sale_amt AS SecondHighestSale
FROM salemast
ORDER BY sale_amt DESC
LIMIT 1 OFFSET 1;

select max(sale_amt) as hige from salemast
where sale_amt <(select max(sale_amt) from salemast);

select sale_amt,
row_number() over (order by sale_mast) as rn
from salemast as  t 
 where t.rn=3;
     
select sale_amt from (select sale_amt,row_number() over (order by sale_amt desc)  pop
from salemast) a where a.pop<3;
select * from (select *, row_number() over(order by sale_amt desc) pop from salemast ) a where a.pop=1;

CREATE TABLE IF NOT EXISTS logs (student_id int, marks int);
TRUNCATE TABLE logs;
INSERT INTO logs (student_id, marks) VALUES ('101', '83');
INSERT INTO logs (student_id, marks) VALUES ('102', '79');
INSERT INTO logs (student_id, marks) VALUES ('103', '83');
INSERT INTO logs (student_id, marks) VALUES ('104', '83');
INSERT INTO logs (student_id, marks) VALUES ('105', '83');
INSERT INTO logs (student_id, marks) VALUES ('106', '79');
INSERT INTO logs (student_id, marks) VALUES ('107', '79');
INSERT INTO logs (student_id, marks) VALUES ('108', '83');
select * from logs;
SELECT DISTINCT L.marks AS  ConsecutiveNums
FROM (logs L JOIN logs L2 ON L.marks = L2.marks AND L.student_id = L2.student_id-1)
JOIN logs L3 ON L.marks = L3.marks AND L2.student_id = L3.student_id-1;

CREATE TABLE IF NOT EXISTS employees(employee_id int, employee_name varchar(255), email_id varchar(255));
TRUNCATE TABLE employees;
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');	
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
SELECT * FROM employees;

select email_id
from employees
group by email_id
having count(email_id)>1;

CREATE TABLE IF NOT EXISTS customers (customer_id int, customer_name varchar(255));
TRUNCATE TABLE customers;
INSERT INTO customers (customer_id, customer_name) VALUES ('101', 'Liam');
INSERT INTO customers (customer_id, customer_name) VALUES ('102', 'Josh');
INSERT INTO customers (customer_id, customer_name) VALUES ('103', 'Sean');
INSERT INTO customers (customer_id, customer_name) VALUES ('104', 'Evan');
INSERT INTO customers (customer_id, customer_name) VALUES ('105', 'Toby');	
CREATE TABLE IF NOT EXISTS orders (order_id int, customer_id int, order_date Date, order_amount int);
TRUNCATE TABLE orders;
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('401', '103','2012-03-08','4500');
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('402', '101','2012-09-15','3650');
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('403', '102','2012-06-27','4800');
SELECT * FROM customers;
SELECT * FROM orders;

select customer_name as customers
from customers where customer_id not in (select customer_id from orders );

select a.customer_name from customers a left join orders o
on a.customer_id= o.customer_id
where o.customer_id is null ;

CREATE TABLE IF NOT EXISTS employees(employee_id int, employee_name varchar(255), email_id varchar(255));
TRUNCATE TABLE employees;
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');	
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');

set sql_safe_updates=0;
DELETE e1 FROM employees e1,  employees e2
WHERE
    e1.email_id = e2.email_id AND e1.employee_id > e2.employee_id;
    
delete e1 from employees e1, employee e2 where e1.email_id = e2.email_id and e1.employee_id>e2.employee_id;

CREATE TABLE IF NOT EXISTS so2_pollution (city_id int, date date, so2_amt int);
TRUNCATE TABLE so2_pollution;
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('701', '2015-10-15', '5');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('702', '2015-10-16', '7');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('703', '2015-10-17', '9');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('704', '2018-10-18', '15');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('705', '2015-10-19', '14');
SELECT * FROM so2_pollution;

select p.city_id as "city id"
from so2_pollution p
join so2_pollution pp on datediff(p.date,pp.date)=1
and p.so2_amt >pp.so2_amt;
use q;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
TRANSACTION_ID INTEGER(5) NOT NULL,
SALESMAN_ID   INTEGER(4) NOT NULL,
SALE_AMOUNT  decimal(8,2),
PRIMARY KEY (TRANSACTION_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO sales VALUES(501,18,5200.00),(502,50,5566.00),(503,38,8400.00),(504,43,8400.00),(505,11,9000.00);
INSERT INTO sales VALUES (506,42,5900.00),(507,13,7000.00),(508,33,6000.00),(509,41,8200.00),(510,11,4500.00);
INSERT INTO sales VALUES (511,51,10000.00),(512,29,9500.00),(513,59,6500.00),(514,38,7800.00),(515,58,9800.00);
INSERT INTO sales VALUES (516,60,12000.00),(517,58,13900.00),(518,23,12200.00),(519,34,5480.00),(520,35,8129.00);
INSERT INTO sales VALUES (521,49,9323.00),(522,46,8200.00),(523,47,9990.00),(524,42,14000.00),(525,44,7890.00);
INSERT INTO sales VALUES (526,47,5990.00),(527,21,7770.00),(528,57,6645.00),(529,56,5125.00),(530,25,10990.00);
INSERT INTO sales VALUES (531,21,12600.00),(532,41,5514.00),(533,17,15600.00),(534,44,15000.00),(535,12,17550.00);
INSERT INTO sales VALUES (536,55,13000.00),(537,58,16800.00),(538,25,19900.00),(539,57,9990.00),(540,28,8900.00);
INSERT INTO sales VALUES (541,44,10200.00),(542,57,18000.00),(543,34,16200.00),(544,36,19998.00),(545,30,13500.00);
INSERT INTO sales VALUES (546,37,15520.00),(547,36,20000.00),(548,20,19800.00),(549,22,18530.00),(550,19,12523.00);
INSERT INTO sales VALUES (551,46,9885.00),(552,22,7100.00),(553,54,17500.00),(554,19,19600.00),(555,24,17500.00);
INSERT INTO sales VALUES (556,38,7926.00),(557,49,7548.00),(558,15,9778.00),(559,56,19330.00),(560,24,14400.00);
INSERT INTO sales VALUES (561,18,16700.00),(562,54,6420.00),(563,31,18720.00),(564,21,17220.00),(565,48,18880.00); 
INSERT INTO sales VALUES (566,33,8882.00),(567,44,19550.00),(568,22,14440.00),(569,53,19500.00),(570,30,5300.00);
INSERT INTO sales VALUES (571,30,10823.00),(572,35,13300.00),(573,35,19100.00),(574,18,17525.00),(575,60,8995.00);
INSERT INTO sales VALUES (576,53,9990.00),(577,21,7660.00),(578,27,18990.00),(579,11,18200.00),(580,30,12338.00);
INSERT INTO sales VALUES (581,37,11000.00),(582,27,11980.00),(583,18,12628.00),(584,52,11265.00),(585,53,19990.00);
INSERT INTO sales VALUES (586,27,8125.00),(587,25,7128.00),(588,57,6760.00),(589,19,5985.00),(590,52,17641.00);
INSERT INTO sales VALUES (591,53,11225.00),(592,22,12200.00),(593,59,16520.00),(594,35,19990.00),(595,42,19741.00);
INSERT INTO sales VALUES (596,19,15000.00),(597,57,19625.00),(598,53,9825.00),(599,24,16745.00),(600,12,14900.00);
DROP TABLE IF EXISTS salesman;
CREATE TABLE salesman (
SALESMAN_ID 	            INTEGER(4) NOT NULL,
SALESMAN_NAME               varchar(30),
PRIMARY KEY (SALESMAN_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO salesman VALUES(11	,'Jonathan Goodwin     ');
INSERT INTO salesman VALUES(12	,'Adam Hughes          ');
INSERT INTO salesman VALUES(13	,'Mark Davenport       ');
INSERT INTO salesman VALUES(14	,'Jamie Shelley        ');
INSERT INTO salesman VALUES(15	,'Ethan Birkenhead     ');
INSERT INTO salesman VALUES(16	,'Liam Alton           ');
INSERT INTO salesman VALUES(17	,'Josh Day             ');
INSERT INTO salesman VALUES(18	,'Sean Mann            ');
INSERT INTO salesman VALUES(19	,'Evan Blake           ');
INSERT INTO salesman VALUES(20	,'Rhys Emsworth        ');
INSERT INTO salesman VALUES(21	,'Kian Wordsworth      ');
INSERT INTO salesman VALUES(22	,'Frederick Kelsey     ');
INSERT INTO salesman VALUES(23	,'Noah Turner          ');
INSERT INTO salesman VALUES(24	,'Callum Bing          ');
INSERT INTO salesman VALUES(25	,'Harri Wilberforce    ');
INSERT INTO salesman VALUES(26	,'Gabriel Gibson       ');
INSERT INTO salesman VALUES(27	,'Richard York         ');
INSERT INTO salesman VALUES(28	,'Tobias Stratford     ');
INSERT INTO salesman VALUES(29	,'Will Kirby           ');
INSERT INTO salesman VALUES(30	,'Bradley Wright       ');
INSERT INTO salesman VALUES(31	,'Eli Willoughby       ');
INSERT INTO salesman VALUES(32	,'Patrick Riley        ');
INSERT INTO salesman VALUES(33	,'Kieran Freeman       ');
INSERT INTO salesman VALUES(34	,'Toby Scott           ');
INSERT INTO salesman VALUES(35	,'Elliot Clapham       ');
INSERT INTO salesman VALUES(36	,'Lewis Moss           ');
INSERT INTO salesman VALUES(37	,'Joshua Atterton      ');
INSERT INTO salesman VALUES(38	,'Jonathan Reynolds    ');
INSERT INTO salesman VALUES(39	,'David Hill           ');
INSERT INTO salesman VALUES(40	,'Aidan Yeardley       ');
INSERT INTO salesman VALUES(41	,'Dan Astley           ');
INSERT INTO salesman VALUES(42	,'Finlay Dalton        ');
INSERT INTO salesman VALUES(43	,'Toby Rodney          ');
INSERT INTO salesman VALUES(44	,'Ollie Wheatley       ');
INSERT INTO salesman VALUES(45	,'Sean Spalding        ');
INSERT INTO salesman VALUES(46	,'Jason Wilson         ');
INSERT INTO salesman VALUES(47	,'Christopher Wentworth');
INSERT INTO salesman VALUES(48	,'Cameron Ansley       ');
INSERT INTO salesman VALUES(49	,'Henry Porter         ');
INSERT INTO salesman VALUES(50	,'Ezra Winterbourne    ');
INSERT INTO salesman VALUES(51	,'Rufus Fleming        ');
INSERT INTO salesman VALUES(52	,'Wallace Dempsey      ');
INSERT INTO salesman VALUES(53	,'Dan McKee            ');
INSERT INTO salesman VALUES(54	,'Marion Caldwell      ');
INSERT INTO salesman VALUES(55	,'Morris Phillips      ');
INSERT INTO salesman VALUES(56	,'Chester Chandler     ');
INSERT INTO salesman VALUES(57	,'Cleveland Klein      ');
INSERT INTO salesman VALUES(58	,'Hubert Bean          ');
INSERT INTO salesman VALUES(59	,'Cleveland Hart       ');
INSERT INTO salesman VALUES(60	,'Marion Gregory       ');

SELECT s.salesman_name, SUM(sa.sale_amount) as total_sale
FROM salesman s JOIN sales sa ON s.salesman_id = sa.salesman_id
GROUP BY salesman_name 
ORDER BY total_sale DESC
LIMIT 10;

select a.salesman_name,sum(b.sale_amount)as total from salesman a join sales b
on a.salesman_id=b.salesman_id
group by salesman_name
order by total desc
limit 10;
create  database qq;
-- 10 question
use qq;
CREATE TABLE company_info (company_id int not null unique, company_name varchar(25));
INSERT INTO company_info VALUES(5001,'Intel');
INSERT INTO company_info VALUES(5002,'Kingston');
INSERT INTO company_info VALUES(5003,'Dell');
INSERT INTO company_info VALUES(5004,'Sony');
INSERT INTO company_info VALUES(5005,'Iball');
INSERT INTO company_info VALUES(5006,'Canon');


CREATE TABLE orders (order_id int, item_name varchar(25), company_id int);

INSERT INTO orders VALUES(101	,'mother board	',5001);
INSERT INTO orders VALUES(102	,'RAM			',5002);
INSERT INTO orders VALUES(103	,'printer		',5006);
INSERT INTO orders VALUES(104	,'keyboard		',5005);
INSERT INTO orders VALUES(105	,'mouse',6051);
INSERT INTO orders VALUES(106	,'speaker',6009);
INSERT INTO orders VALUES(107	,'web cam		',5005);
INSERT INTO orders VALUES(108	,'hard disk		',5002);
INSERT INTO orders VALUES(109	,'monitor		',5003);
INSERT INTO orders VALUES(110	,'scanner',7023);

SELECT orders.order_id, orders.item_name 
FROM orders 
Left Join company_info 
on orders.company_id = company_info.company_id 
WHERE company_info.company_name IS NULL;

create table departments (
department_id integer(4) not null unique,
department_name varchar(30));


 insert into departments values(30,'Sales');
 insert into departments values( 50,'Export        ');
 insert into departments values( 60,'Marketing     ');
 insert into departments values( 80,'Audit         ');
 insert into departments values( 90,'Production    ');
 insert into departments values(100,'Administration');



create table employees (
emp_id integer(4) not null unique,
emp_name varchar(30),
emp_sex varchar(1),
emp_salary int(6),
emp_department int(3),
foreign key(emp_department) references departments(department_id));



insert into employees values(100,'Steven     ','M',24000,  90);
insert into employees values(101,'Neena      ','F',17000,  90);
insert into employees values(102,'Lex        ','M',17000,  80);
insert into employees values(103,'Alexander  ','M',9000, 60);
insert into employees values(104,'Bruce      ','M',6000,  60);
insert into employees values(105,'David      ','M',4800,  80);
insert into employees values(106,'Valli      ','F',4800,  60);
insert into employees values(107,'Diana      ','F',4200,  60);
insert into employees values(114,'Den        ','M',11000,  30);
insert into employees values(115,'Alexander  ','M',3100,  30);
insert into employees values(116,'Shelli     ','F',2900,  30);
insert into employees values(117,'Sigal      ','F',2800,  30);
insert into employees values(108,'Nancy      ','M',12000, 100);
insert into employees values(109,'Daniel     ','F',9000, 100);
insert into employees values(110,'John       ','M',8200, 100);
insert into employees values(111,'Ismael     ','M',7700, 100);
insert into employees values(112,'Jose Manuel','M',7800, 100);
insert into employees values(113,'Luis       ','F',6900, 100);
insert into employees values(133,'Jason      ','M',3300,  50);
insert into employees values(134,'Michael    ','F',2900,  50);
insert into employees values(135,'Ki         ','F',2400,  50);



select d.department_name,e.emp_salary
from departments d left join employees e
on d.department_id=e.emp_department ;

SELECT departments.department_name,employees.emp_salary  
FROM employees
JOIN departments
ON employees.emp_department = departments.department_id
WHERE employees.emp_salary IN 
(SELECT MAX(employees.emp_salary) FROM employees);

create database dept;
use dept;
create table departments (
department_id integer(4) not null unique,
department_name varchar(30));


 insert into departments values(30,'Sales');
 insert into departments values( 50,'Export        ');
 insert into departments values( 60,'Marketing     ');
 insert into departments values( 80,'Audit         ');
 insert into departments values( 90,'Production    ');
 insert into departments values(100,'Administration');



create table employees (
emp_id integer(4) not null unique,
emp_name varchar(30),
emp_sex varchar(1),
emp_salary int(6),
emp_department int(3),
foreign key(emp_department) references departments(department_id));



insert into employees values(100,'Steven     ','M',24000,  90);
insert into employees values(101,'Neena      ','F',17000,  90);
insert into employees values(102,'Lex        ','M',17000,  80);
insert into employees values(103,'Alexander  ','M',9000, 60);
insert into employees values(104,'Bruce      ','M',6000,  60);
insert into employees values(105,'David      ','M',4800,  80);
insert into employees values(106,'Valli      ','F',4800,  60);
insert into employees values(107,'Diana      ','F',4200,  60);
insert into employees values(114,'Den        ','M',11000,  30);
insert into employees values(115,'Alexander  ','M',3100,  30);
insert into employees values(116,'Shelli     ','F',2900,  30);
insert into employees values(117,'Sigal      ','F',2800,  30);
insert into employees values(108,'Nancy      ','M',12000, 100);
insert into employees values(109,'Daniel     ','F',9000, 100);
insert into employees values(110,'John       ','M',8200, 100);
insert into employees values(111,'Ismael     ','M',7700, 100);
insert into employees values(112,'Jose Manuel','M',7800, 100);
insert into employees values(113,'Luis       ','F',6900, 100);
insert into employees values(133,'Jason      ','M',3300,  50);
insert into employees values(134,'Michael    ','F',2900,  50);
insert into employees values(135,'Ki         ','F',2400,  50);


SELECT departments.department_name,employees.emp_salary 
from departments
left join employees
on departments.department_id=employees.emp_department 
WHERE employees.emp_salary IN 
(SELECT MAX(employees.emp_salary) FROM employees);

create database dpp;
use dpp;
create table employees (
emp_id integer(4) not null unique,
emp_name varchar(30),
emp_sex varchar(1),
depart_name varchar(25),
emp_salary int(6),
qtr1 int(4),
qtr2 int(4),
qtr3 int(4),
qtr4 int(4),
emp_department int(3),
manager_id int(4)
);



insert into employees values(100,'Steven     ','M','Production',24000,240,310,275,300,  90,0);       
insert into employees values(101,'Neena      ','F','Production',17000,270,300,275,290,  90,100);     
insert into employees values(102,'Lex        ','M','Audit',17000,300,290,285,310,  80,100);          
insert into employees values(103,'Alexander  ','M','Marketing', 9000,25,270,260,280,  60,102);       
insert into employees values(104,'Bruce      ','M','Marketing', 6000,300,280,275,290,  60,103);      
insert into employees values(105,'David      ','M','Audit', 4800,200,220,250,270,  80,103);          
insert into employees values(106,'Valli      ','F','Marketing', 4800,300,320,330,350,  60,103);      
insert into employees values(107,'Diana      ','F','Marketing', 4200,280,270,310,320,  60,103);      
insert into employees values(114,'Den        ','M','Sales',11000,280,290,300,320 ,  30,101);         
insert into employees values(115,'Alexander  ','M','Sales', 3100,310,300,320,340,  30,108);          
insert into employees values(116,'Shelli     ','F','Sales', 2900,245,260,280,300,  30,108);          
insert into employees values(117,'Sigal      ','F','Sales', 2800,250,370,290,320,  30,108);          
insert into employees values(108,'Nancy      ','M','Administration',12000,260,280,300,310, 100,108); 
insert into employees values(109,'Daniel     ','F','Administration', 9000,220,210,240,260, 100,108); 
insert into employees values(110,'John       ','M','Administration', 8200,300,290,280,320, 100,100); 
insert into employees values(111,'Ismael     ','M','Administration', 7700,280,300,270,310, 100,114); 
insert into employees values(112,'Jose Manuel','M','Administration', 7800,250,280,260,300, 100,114); 
insert into employees values(113,'Luis       ','F','Administration', 6900,300,280,270,310, 100,114); 
insert into employees values(133,'Jason      ','M','Export', 3300,280,270,300,290,  50,122);         
insert into employees values(134,'Michael    ','F','Export', 2900,260,280,290,300,  50,122);         
insert into employees values(135,'Ki         ','F','Export', 2400,240,260,270,290,  50,122);         

select emp_name,(qtr1+qtr2+qtr3+qtr4) as "case resolved"
from employees
 where manager_id =114
and (qtr1+qtr2+qtr3+qtr4) in
 (select max(qtr1+qtr2+qtr3+qtr4) from employees
where manager_id = 114);


select emp_name,(qtr1+qtr2+qtr3+qtr4) as "case resolved"
from employees
where manager_id= 114
and (qtr1+qtr2+qtr3+qtr4) in (select max(qtr1+qtr2+qtr3+qtr4) from employees where manager_id= 114);




