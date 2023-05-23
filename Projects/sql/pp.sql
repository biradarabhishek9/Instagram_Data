create database project2;
use project2;
create table project2.emp
(emp_id int primary key,
emp_name varchar(34),
salary int,
dept_id int);
drop database project2;
insert into project2.emp
values
(1,"jim",9989,1),
(2,"kim",9770,2),
(3,"lim",4061,2),
(4,"tim",6053,3),
(5,"vim",2730,1),
(6,"jay",6354,1),
(7,'kay',6498,3),
(8,"raj",1702,3),
(9,"ram",5069,1),
(10,"sam",6244,2),
(11,"ali",4890,1),
(12,"joe",4813,3),
(13,"rim",8926,2),
(14,"doug",1595,2);

create table project2.dept
(dept_id int,
dept_name varchar(24),
foreign key(dept_id) references  emp(emp_id));

insert into project2.dept
values
(1,"it"),
(2,"fin"),
(3,"sales");
use project2;

select *from(select rank() over (partition by dept_id order by salary desc )as rn,
emp_name,dept_id as dept_name,salary
from project2.emp) as a where a.rn<4;
select *from project2.emp;
use project2;
SELECT emp.emp_id,emp.emp_name,emp.salary,dept.dept_name
FROM emp left JOIN dept  ON emp.emp_id = dept.dept_id
GROUP BY emp_id 
ORDER BY salary DESC
LIMIT 3;

with abc as 
(select emp.emp_id,emp.emp_name,emp.salary,dept.dept_name,
rank() over (partition by dept.dept_name order by emp.salary desc)as dp
from 
project2.emp a left join project2.dept b
on emp.dep_id=dept.dept_id)
select emp_id,emp_name,salary,dept_name from abc where dp <=3;



create database w3;
use w3;
CREATE TABLE If Not Exists salemast(sale_id int, employee_id int, sale_date date, sale_amt int);
TRUNCATE TABLE salemast;
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('1', '1000', '2012-03-08', 4500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('2', '1001', '2012-03-09', 5500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 3500); 
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 2500);
 SELECT  * FROM salemast;

select sale_amt from w3.salemast
order by sale_amt desc
limit 2,1;
select * from

(select  sale_amt,
rank() over 
(order by sale_amt desc) as sal
from salemast) as a where a.sal=3;

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

SELECT customer_name as customers
FROM customers
WHERE customer_id NOT IN
(
SELECT customer_id FROM orders
);


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

SELECT salesman_name, SUM(sale_amount) as total_sale
FROM salesman  a JOIN sales b ON a.salesman_id = b.salesman_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;





SELECT DISTINCT department_id, salary 
FROM (SELECT department_id,salary,dense_rank() 
    OVER(PARTITION BY department_id ORDER BY salary DESC) as top3
    from employees) t
WHERE top3<=3
ORDER BY department_id ASC,salary DESC;


-- to find 

/*SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary> m.salary;*/
use sticks;
create database sticks;
create table sticks.d
(S1 INT,
S2 INT,
S3 INT);

insert into sticks.d
(S1,S2,S3) values
(3,4,5);
insert into sticks.d
(S1,S2,S3) values
(5,5,5);
insert into sticks.d
(S1,S2,S3) values
(7,9,7);
insert into sticks.d
(S1,S2,S3) values
(5,5,3);
insert into sticks.d
(S1,S2,S3) values
(8,6,5);
insert into sticks.d
(S1,S2,S3) values
(5,5,5);
select *from sticks.d;

use sticks;
select s1,s2,s3
(case 
when s1=3 and s2=4 and s3=5 then "different len"
when s1=5 and s2=5 and s3=5 then "same len"
when s1=7 and s2=9 and s3=7 then "2 sticks have same len"
when s1=5 and s2=5 and s3=3 then "2 sticks have same len"
when s1=8 and s2=6 and s3=5 then "differnet len"
when s1=5 and s2=5 and s3=5 then "same len"
else none end) as stick_len from sticks.d; 
use project2;

select *,
(case 
when s1<>s2 and s1<>s3 then "different lengths"
when s1=s2 and s1=s3 then "same lengths"
when s1=s2 or s1=s3 or s2=s3 then "2 sticks have same length"
else 0 end) as stick_len
from project.k;

create table sticks.k
(s1 int,s2 int,s3 int);

insert into sticks.d(s1,s2,s3)
values
(3,4,5),
(5,5,5),
(7,9,7),
(5,5,3),
(8,6,5),
(5,5,5);

select s1,s2,s3
(case
when s1=s2 and s1=s3 and s2=s3 then "Same Len"
when s1=s2 or s1=s3 or s2=s3 then "2 sticks have same len"
else "Different len"
end) as stick_len
from sticks.k;









