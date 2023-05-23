drop database st;
create database st;
use st;
CREATE TABLE IF NOT EXISTS employees(employee_id int, employee_name varchar(255), email_id varchar(255));
TRUNCATE TABLE employees;
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');	
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
SELECT * FROM employees;

select * from employees
where email_id in (select distinct email from employee );

select email_id from employees
group by email_id
having count(email_id)>1;

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
INSERT INTO salesman VALUES(20	,'Rhys 
Emsworth        ');
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
FROM salesman a JOIN sales b ON a.salesman_id = b.salesman_id
GROUP BY salesman_name 
ORDER BY total_sale DESC
LIMIT 10;

DROP TABLE IF EXISTS tablefortest; 
CREATE TABLE tablefortest(srno int,  pos_neg_val int);
INSERT INTO tablefortest VALUES (1, 56);
INSERT INTO tablefortest VALUES (2, -74);
INSERT INTO tablefortest VALUES (3, 15);
INSERT INTO tablefortest VALUES (4, -51);
INSERT INTO tablefortest VALUES (5, -9);
INSERT INTO tablefortest VALUES (6, 32);
select * from tablefortest;

SELECT srno,pos_neg_val,-1 *(pos_neg_val) AS converted_signed_value 
FROM tablefortest;
drop database re;
create database re;
use re;
DROP TABLE IF EXISTS tablefortest; 
CREATE TABLE tablefortest(id int, value int);
INSERT INTO tablefortest VALUES (1, 56);
INSERT INTO tablefortest VALUES (2, -74);
INSERT INTO tablefortest VALUES (3, 15);
INSERT INTO tablefortest VALUES (4, -51);
INSERT INTO tablefortest VALUES (5, -9);
INSERT INTO tablefortest VALUES (6, 32);
select * from tablefortest;
SELECT id,value,-1 *(value) AS converted_signed_value 
FROM tablefortest;

select id,value,-1*(value) 
from tablefortest;

DROP TABLE IF EXISTS tablefortest;
CREATE TABLE tablefortest(ID int,  date_of_birth date);
INSERT INTO tablefortest VALUES (1, '1907-08-15');
INSERT INTO tablefortest VALUES (2, '1883-06-27');
INSERT INTO tablefortest VALUES (3, '1900-01-01');
INSERT INTO tablefortest VALUES (4, '1901-01-01');
INSERT INTO tablefortest VALUES (5, '2005-09-01');
INSERT INTO tablefortest VALUES (6, '1775-11-23');
INSERT INTO tablefortest VALUES (7, '1800-01-01');
SELECT * FROM tablefortest;
SELECT id, date_of_birth, (SUBSTRING((EXTRACT(YEAR FROM(date_of_birth))-1),1,2))+1 AS Century 
FROM tablefortest;
select id,date_of_birth,(substring(extract(year from (date_of_birth))-1,1,2))+1 as century
from tablefortest;

DROP TABLE IF EXISTS tablefortest;
CREATE TABLE tablefortest(srno int,  col_val int);
INSERT INTO tablefortest VALUES (1, 56);
INSERT INTO tablefortest VALUES (2, 74);
INSERT INTO tablefortest VALUES (3, 15);
INSERT INTO tablefortest VALUES (4, 51);
INSERT INTO tablefortest VALUES (5, 9);
INSERT INTO tablefortest VALUES (6, 32);
SELECT * FROM tablefortest;

select *,
(case when col_val%2=0 then "even"
else"odd"
 end) as even_odd
from tablefortest;

DROP TABLE IF EXISTS student_test;
CREATE TABLE student_test(student_id int,  marks_achieved int);
INSERT INTO student_test VALUES (1, 56);
INSERT INTO student_test VALUES (2, 74);
INSERT INTO student_test VALUES (3, 15);
INSERT INTO student_test VALUES (4, 74);
INSERT INTO student_test VALUES (5, 89);
INSERT INTO student_test VALUES (6, 56);
INSERT INTO student_test VALUES (7, 93);
SELECT * FROM student_test;
SELECT DISTINCT(marks_achieved) AS  'Unique Marks' FROM student_test;

CREATE TABLE IF NOT EXISTS students (student_id INT,student_name VARCHAR(25),teacher_id INT);
TRUNCATE TABLE students;

CREATE TABLE IF NOT EXISTS students (student_id INT,student_name VARCHAR(25),teacher_id INT);
INSERT INTO students (student_id, student_name, teacher_id) values ('1001', 'Alex', '601');
INSERT INTO students (student_id, student_name, teacher_id) values ('1002', 'Jhon', NULL);
INSERT INTO students (student_id, student_name, teacher_id) values ('1003', 'Peter', NULL);
INSERT INTO students (student_id, student_name, teacher_id) values ('1004', 'Minto', '604');
INSERT INTO students (student_id, student_name, teacher_id) values ('1005', 'Crage', NULL);
INSERT INTO students (student_id, student_name, teacher_id) values ('1006', 'Chang', '601');
INSERT INTO students (student_id, student_name, teacher_id) values ('1007', 'Philip', '602');

select student_name from students 
where not student_id<>teacher_id ;

SELECT student_name 
FROM students WHERE teacher_id <> 602 
 or teacher_id is null;
use re;
DROP TABLE  IF EXISTS salemast;
CREATE TABLE salemast(salesperson_id int,  order_id int);
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5001', '1001');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5002', '1002');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5003', '1002');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5004', '1002');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5005', '1003');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5006', '1004');

select order_id,order_id
from salemast
group by order_id
order by count(order_id) desc
limit 1;

CREATE TABLE cities_test (city_name varchar(255), country varchar(255), city_population int, city_area int );

INSERT INTO cities_test VALUES ('Tokyo	 		','Japan		',	13515271,	2191	);	
INSERT INTO cities_test VALUES ('Delhi	 		','India		',	16753235,	1484	);	
INSERT INTO cities_test VALUES ('Shanghai	 	','China		',	24870895,	6341	);	
INSERT INTO cities_test VALUES ('Sao Paulo	 	','Brazil		',	12252023,	1521	);	
INSERT INTO cities_test VALUES ('Mexico City	','Mexico		',	9209944,	1485	);	
INSERT INTO cities_test VALUES ('Cairo	 		','Egypt		',	9500000,	3085	);	
INSERT INTO cities_test VALUES ('Mumbai	 		','India		',	12478447,	603		);	
INSERT INTO cities_test VALUES ('Beijing	 	','China		',	21893095,	16411	);	
INSERT INTO cities_test VALUES ('Osaka	 		','Japan		',	2725006,	225		);	
INSERT INTO cities_test VALUES ('New York	 	','United States',	8398748,	786		);	
INSERT INTO cities_test VALUES ('Buenos Aires	','Argentina	',	3054300,	203		);	
INSERT INTO cities_test VALUES ('Chongqing	 	','China		',	32054159,	82403	);	
INSERT INTO cities_test VALUES ('Istanbul	 	','Turkey		',	15519267,	5196	);	
INSERT INTO cities_test VALUES ('Kolkata	 	','India		',	4496694,	205		);	
INSERT INTO cities_test VALUES ('Manila	 		','Philippines	',	1780148,	43		);	
SELECT * FROM cities_test;
SELECT * FROM  cities_test WHERE city_population>=15000000 OR city_area>50000;
drop database ab;
create database ab;
use ab;
DROP TABLE  IF EXISTS  orders;
CREATE TABLE orders ( ORDER_ID INTEGER(5) NOT NULL, CUSTOMER_ID INTEGER(4) NOT NULL, ITEM_DESC varchar(30) NOT NULL);

INSERT INTO orders VALUES(101,2109,'juice');
INSERT INTO orders VALUES(102,2139,'chocolate');
INSERT INTO orders VALUES(103,2120,'juice');
INSERT INTO orders VALUES(104,2108,'cookies');
INSERT INTO orders VALUES(105,2130,'juice');
INSERT INTO orders VALUES(106,2103,'cake');
INSERT INTO orders VALUES(107,2122,'cookies');
INSERT INTO orders VALUES(108,2125,'cake');
INSERT INTO orders VALUES(109,2139,'cake');
INSERT INTO orders VALUES(110,2141,'cookies');
INSERT INTO orders VALUES(111,2116,'cake');
INSERT INTO orders VALUES(112,2128,'cake');
INSERT INTO orders VALUES(113,2146,'chocolate');
INSERT INTO orders VALUES(114,2119,'cookies');
INSERT INTO orders VALUES(115,2142,'cake');
SELECT * FROM  orders;

select ITEM_DESC,count(ITEM_DESC) as "number of orders"
from orders
group by item_desc
having count(item_desc)>5;
create database ee;
use ee;
CREATE TABLE dr_clinic (visiting_date date primary key, availability bool);

INSERT INTO dr_clinic VALUES ('2016-06-11','1');
INSERT INTO dr_clinic VALUES ('2016-06-12','1');
INSERT INTO dr_clinic VALUES ('2016-06-13','0');
INSERT INTO dr_clinic VALUES ('2016-06-14','1');
INSERT INTO dr_clinic VALUES ('2016-06-15','0');
INSERT INTO dr_clinic VALUES ('2016-06-16','0');
INSERT INTO dr_clinic VALUES ('2016-06-17','1');
INSERT INTO dr_clinic VALUES ('2016-06-18','1');
INSERT INTO dr_clinic VALUES ('2016-06-19','1');
INSERT INTO dr_clinic VALUES ('2016-06-20','1');	   
INSERT INTO dr_clinic VALUES ('2016-06-21','1');

SELECT DISTINCT a.visiting_date
FROM dr_clinic a JOIN dr_clinic b
  ON ABS(a.visiting_date - b.visiting_date) = 1
  AND a.availability = true AND b.availability = true
ORDER BY a.visiting_date;

DROP TABLE if exists customers;
CREATE TABLE customers (customer_id int, customer_name varchar(255), customer_city varchar(255), avg_profit int);
INSERT INTO customers  VALUES ('101', 'Liam','New York',25000);
INSERT INTO customers  VALUES ('102', 'Josh','Atlanta',22000);
INSERT INTO customers  VALUES ('103', 'Sean','New York',27000);
INSERT INTO customers  VALUES ('104', 'Evan','Toronto',15000);
INSERT INTO customers  VALUES ('105', 'Toby','Dallas',20000);

CREATE TABLE supplier (supplier_id int, supplier_name varchar(255), supplier_city varchar(255));
INSERT INTO supplier  VALUES ('501', 'ABC INC','Dallas');
INSERT INTO supplier  VALUES ('502', 'DCX LTD','Atlanta');
INSERT INTO supplier  VALUES ('503', 'PUC ENT','New York');
INSERT INTO supplier  VALUES ('504', 'JCR INC','Toronto');
	
CREATE TABLE orders (order_id int, customer_id int, supplier_id int, order_date Date, order_amount int);
INSERT INTO orders  VALUES (401, 103,501,'2012-03-08','4500');
INSERT INTO orders  VALUES (402, 101,503,'2012-09-15','3650');
INSERT INTO orders  VALUES (403, 102,503,'2012-06-27','4800');
INSERT INTO orders  VALUES (404, 104,502,'2012-06-17','5600');
INSERT INTO orders  VALUES (405, 104,504,'2012-06-22','6000');
INSERT INTO orders  VALUES (406, 105,502,'2012-06-25','5600');

select customer_name from customers c join orders o on 
c.customer_id=o.customer_id join supplier s on 
o.supplier_id=s.supplier_id 
where c.customer_id<>s.supplier_id
limit 3;

 


SELECT c.customer_name
FROM customers c
WHERE c.customer_id 
NOT IN (SELECT ord.customer_id
FROM orders ord
LEFT JOIN supplier sup 
ON ord.supplier_id = sup.supplier_id
WHERE sup.supplier_name = 'DCX LTD');

CREATE TABLE students(student_id int, student_name varchar(255), marks_achieved int);

INSERT INTO students VALUES(1, 'Alex',87);
INSERT INTO students VALUES(2, 'Jhon',92);
INSERT INTO students VALUES(3, 'Pain',83);
INSERT INTO students VALUES(4, 'Danny',87);
INSERT INTO students VALUES(5, 'Paul',92);
INSERT INTO students VALUES(6, 'Rex',89);
INSERT INTO students VALUES(7, 'Philip',87);
INSERT INTO students VALUES(8, 'Josh',83);
INSERT INTO students VALUES(9, 'Evan',92);
INSERT INTO students VALUES(10, 'Larry',87);

select distinct max(marks_achieved) from students;
SELECT * FROM students;
SELECT MAX(marks_achieved) as marks
FROM (SELECT marks_achieved FROM students GROUP BY marks_achieved HAVING COUNT(*) = 1) z;


DROP TABLE IF EXISTS bank_trans;
CREATE TABLE bank_trans(trans_id int, customer_id int, login_date date);
INSERT INTO bank_trans VALUES (101, 3002, '2019-09-01');
INSERT INTO bank_trans VALUES (101, 3002, '2019-08-01');
INSERT INTO bank_trans VALUES (102, 3003, '2018-09-13');
INSERT INTO bank_trans VALUES (102, 3002, '2018-07-24');
INSERT INTO bank_trans VALUES (103, 3001, '2019-09-25');
INSERT INTO bank_trans VALUES (102, 3004, '2017-09-05');
SELECT * FROM bank_trans;

SELECT customer_id, MIN(login_date) first_login
FROM bank_trans
GROUP BY customer_id;

select customer_id,min(login_date) first_login 
from bank_trans 
group by customer_id
order by customer_id ;

CREATE TABLE items (item_code int not null unique, item_name varchar(255));
INSERT INTO items VALUES (10091,'juice');
INSERT INTO items VALUES (10092,'chocolate');
INSERT INTO items VALUES (10093,'cookies');
INSERT INTO items VALUES (10094,'cake');

CREATE TABLE orders (order_id int, distributor_id int, item_ordered int, item_quantity int,
foreign key(item_ordered) references items(item_code));
INSERT INTO orders VALUES (1,501,10091,250);
INSERT INTO orders VALUES (2,502,10093,100);
INSERT INTO orders VALUES (3,503,10091,200);
INSERT INTO orders VALUES (4,502,10091,150);
INSERT INTO orders VALUES (5,502,10092,300);
INSERT INTO orders VALUES (6,504,10094,200);
INSERT INTO orders VALUES (7,503,10093,250);
INSERT INTO orders VALUES (8,503,10092,250);
INSERT INTO orders VALUES (9,501,10094,180);
INSERT INTO orders VALUES (10,503,10094,350);

SELECT distributor_id
FROM (SELECT t.distributor_id, COUNT(*) AS item_count FROM (
SELECT DISTINCT distributor_id, item_ordered FROM orders
WHERE item_ordered IN (SELECT item_code FROM items) ORDER BY distributor_id ) AS t
GROUP BY t.distributor_id) AS u
WHERE u.item_count = (SELECT COUNT(item_code) FROM items);

CREATE TABLE managing_body (manager_id int NOT NULL UNIQUE, manager_name varchar(255), running_years int);

INSERT INTO managing_body VALUES(51,'James',5);
INSERT INTO managing_body VALUES(52,'Cork',3);
INSERT INTO managing_body VALUES(53,'Paul',4);
INSERT INTO managing_body VALUES(54,'Adam',3);
INSERT INTO managing_body VALUES(55,'Hense',4);
INSERT INTO managing_body VALUES(56,'Peter',2);

CREATE TABLE scheme (scheme_code int NOT NULL , scheme_manager_id int NOT NULL, 
PRIMARY KEY(scheme_code,scheme_manager_id));
INSERT INTO scheme VALUES(1001,	51);
INSERT INTO scheme VALUES(1001,	53);
INSERT INTO scheme VALUES(1001,	54);
INSERT INTO scheme VALUES(1001,	56);
INSERT INTO scheme VALUES(1002,	51);
INSERT INTO scheme VALUES(1002,	55);
INSERT INTO scheme VALUES(1003,	51);
INSERT INTO scheme VALUES(1004,	52);

select distinct * from scheme;            


-- 35 questions


