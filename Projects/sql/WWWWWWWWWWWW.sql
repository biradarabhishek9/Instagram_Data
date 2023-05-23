#From the following tables write a query in SQL to 
#find the department where the highest salaried employee(s) are working.
# Return department name and highest salary to this department

CREATE DATABASE ZZ;
USE ZZ;
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
FROM employees
JOIN departments
ON employees.emp_department = departments.department_id
WHERE employees.emp_salary IN 
(SELECT MAX(employees.emp_salary) FROM employees);


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
emp_department int(3));



insert into employees values(100,'Steven     ','M','Production',24000,240,310,275,300,  90);
insert into employees values(101,'Neena      ','F','Production',17000,270,300,275,290,  90);
insert into employees values(102,'Lex        ','M','Audit',17000,300,290,285,310,  80);
insert into employees values(103,'Alexander  ','M','Marketing', 9000,25,270,260,280,  60);
insert into employees values(104,'Bruce      ','M','Marketing', 6000,300,280,275,290,  60);
insert into employees values(105,'David      ','M','Audit', 4800,200,220,250,270,  80);
insert into employees values(106,'Valli      ','F','Marketing', 4800,300,320,330,350,  60);
insert into employees values(107,'Diana      ','F','Marketing', 4200,280,270,310,320,  60);
insert into employees values(114,'Den        ','M','Sales',11000,280,290,300,320 ,  30);
insert into employees values(115,'Alexander  ','M','Sales', 3100,310,300,320,340,  30);
insert into employees values(116,'Shelli     ','F','Sales', 2900,245,260,280,300,  30);
insert into employees values(117,'Sigal      ','F','Sales', 2800,250,370,290,320,  30);
insert into employees values(108,'Nancy      ','M','Administration',12000,260,280,300,310, 100);
insert into employees values(109,'Daniel     ','F','Administration', 9000,220,210,240,260, 100);
insert into employees values(110,'John       ','M','Administration', 8200,300,290,280,320, 100);
insert into employees values(111,'Ismael     ','M','Administration', 7700,280,300,270,310, 100);
insert into employees values(112,'Jose Manuel','M','Administration', 7800,250,280,260,300, 100);
insert into employees values(113,'Luis       ','F','Administration', 6900,300,280,270,310, 100);
insert into employees values(133,'Jason      ','M','Export', 3300,280,270,300,290,  50);
insert into employees values(134,'Michael    ','F','Export', 2900,260,280,290,300,  50);
insert into employees values(135,'Ki         ','F','Export', 2400,240,260,270,290,  50);

SELECT emp_name, (qtr1+qtr2+qtr3+qtr4) AS "Target achieved in all Qtrs."
FROM employees e
WHERE (e.qtr1+e.qtr2+e.qtr3+e.qtr4) = (
SELECT MAX((qtr1+qtr2+qtr3+qtr4)) FROM employees e2
);

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
`TRANSACTION_ID` INTEGER(5) NOT NULL,
`SALESMAN_ID`   INTEGER(4) NOT NULL,
`SALE_AMOUNT`  decimal(8,2),
PRIMARY KEY (`TRANSACTION_ID`)
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

DROP TABLE IF EXISTS `salesman`;
CREATE TABLE `salesman` (
`SALESMAN_ID` 	            INTEGER(4) NOT NULL,
`SALESMAN_NAME`               varchar(30),
PRIMARY KEY (`SALESMAN_ID`)
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

SELECT * FROM salesman
WHERE salesman_id NOT IN(
SELECT DISTINCT salesman_id FROM sales
) ORDER BY salesman_id;

create table employees (
employee_id integer(4) not null unique,
emp_name varchar(25),
hire_date date,
job_id varchar(25),
salary decimal(10,2),
manager_id integer(4),
department_id integer(4)
);


insert into employees values( 100,'Steven     ','1987-06-17','AD_PRES   ',24000.00,         0,   90);
insert into employees values( 101,'Neena      ','1987-06-18','AD_VP     ',17000.00,       100,   90);
insert into employees values( 102,'Lex        ','1987-06-19','AD_VP     ',17000.00,       100,   90);
insert into employees values( 103,'Alexander  ','1987-06-20','IT_PROG   ', 9000.00,       102,   60);
insert into employees values( 104,'Bruce      ','1987-06-21','IT_PROG   ', 6000.00,       103,   60);
insert into employees values( 105,'David      ','1987-06-22','IT_PROG   ', 4800.00,       103,   60);
insert into employees values( 106,'Valli      ','1987-06-23','IT_PROG   ', 4800.00,       103,   60);
insert into employees values( 107,'Diana      ','1987-06-24','IT_PROG   ', 4200.00,       103,   60);
insert into employees values( 114,'Den        ','1987-07-01','PU_MAN    ',11000.00,       100,   30);
insert into employees values( 115,'Alexander  ','1987-07-02','PU_CLERK  ', 3100.00,       114,   30);
insert into employees values( 116,'Shelli     ','1987-07-03','PU_CLERK  ', 2900.00,       114,   30);
insert into employees values( 117,'Sigal      ','1987-07-04','PU_CLERK  ', 2800.00,       114,   30);
insert into employees values( 108,'Nancy      ','1987-06-25','FI_MGR    ',12000.00,       101,  100);
insert into employees values( 109,'Daniel     ','1987-06-26','FI_ACCOUNT', 9000.00,       108,  100);
insert into employees values( 110,'John       ','1987-06-27','FI_ACCOUNT', 8200.00,       108,  100);
insert into employees values( 111,'Ismael     ','1987-06-28','FI_ACCOUNT', 7700.00,       108,  100);
insert into employees values( 112,'Jose Manuel','1987-06-29','FI_ACCOUNT', 7800.00,       108,  100);
insert into employees values( 113,'Luis       ','1987-06-30','FI_ACCOUNT', 6900.00,       108,  100);
insert into employees values( 133,'Jason      ','1987-07-20','ST_CLERK  ', 3300.00,       122,   50);
insert into employees values( 134,'Michael    ','1987-07-21','ST_CLERK  ', 2900.00,       122,   50);
insert into employees values( 135,'Ki         ','1987-07-22','ST_CLERK  ', 2400.00,       122,   50);
insert into employees values( 136,'Hazel      ','1987-07-23','ST_CLERK  ', 2200.00,       122,   50);
insert into employees values( 137,'Renske     ','1987-07-24','ST_CLERK  ', 3600.00,       123,   50);
insert into employees values( 138,'Stephen    ','1987-07-25','ST_CLERK  ', 3200.00,       123,   50);
insert into employees values( 139,'John       ','1987-07-26','ST_CLERK  ', 2700.00,       123,   50);


SELECT DISTINCT department_id, salary 
FROM (SELECT department_id,salary,dense_rank() 
    OVER(PARTITION BY department_id ORDER BY salary DESC) as top3
    from employees) t
WHERE top3<=3
ORDER BY department_id ASC,salary DESC

create table customer(
cust_code		varchar(10) not null unique,	
cust_name		varchar(25),
cust_city		varchar(25),
cust_country	varchar(25),
grade			integer
);



insert into customer values('C00013','Holmes     ','London    ','UK       ', 2);
insert into customer values('C00001','Micheal    ','New York  ','USA      ', 2);
insert into customer values('C00020','Albert     ','New York  ','USA      ', 3);
insert into customer values('C00025','Ravindran  ','Bangalore ','India    ', 2);
insert into customer values('C00024','Cook       ','London    ','UK       ', 2);
insert into customer values('C00015','Stuart     ','London    ','UK       ', 1);
insert into customer values('C00002','Bolt       ','New York  ','USA      ', 3);
insert into customer values('C00018','Fleming    ','Brisban   ','Australia', 2);
insert into customer values('C00021','Jacks      ','Brisban   ','Australia', 1);
insert into customer values('C00019','Yearannaidu','Chennai   ','India    ', 1);
insert into customer values('C00005','Sasikant   ','Mumbai    ','India    ', 1);
insert into customer values('C00007','Ramanathan ','Chennai   ','India    ', 1);
insert into customer values('C00022','Avinash    ','Mumbai    ','India    ', 2);
insert into customer values('C00004','Winston    ','Brisban   ','Australia', 1);
insert into customer values('C00023','Karl       ','London    ','UK       ', 0);
insert into customer values('C00006','Shilton    ','Torento   ','Canada   ', 1);
insert into customer values('C00010','Charles    ','Hampshair ','UK       ', 3);
insert into customer values('C00017','Srinivas   ','Bangalore ','India    ', 2);
insert into customer values('C00012','Steven     ','San Jose  ','USA      ', 1);
insert into customer values('C00008','Karolina   ','Torento   ','Canada   ', 1);
insert into customer values('C00003','Martin     ','Torento   ','Canada   ', 2);
insert into customer values('C00009','Ramesh     ','Mumbai    ','India    ', 3);
insert into customer values('C00014','Rangarappa ','Bangalore ','India    ', 2);
insert into customer values('C00016','Venkatpati ','Bangalore ','India    ', 2);
insert into customer values('C00011','Sundariya  ','Chennai   ','India    ', 3);

	

create table orders(
ord_num		integer(10) not null unique,	
ord_amount		integer,
ord_date	date,
cust_code	varchar(10),
foreign key(cust_code) references customer(cust_code)
);



 insert into orders values(200114, 3500,'2008-08-15','C00002');
 insert into orders values(200122, 2500,'2008-09-16','C00003');
 insert into orders values(200118,  500,'2008-07-20','C00023');
 insert into orders values(200119, 4000,'2008-09-16','C00007');
 insert into orders values(200121, 1500,'2008-09-23','C00008');
 insert into orders values(200130, 2500,'2008-07-30','C00025');
 insert into orders values(200134, 4200,'2008-09-25','C00004');
 insert into orders values(200108, 4000,'2008-02-15','C00008');
 insert into orders values(200103, 1500,'2008-05-15','C00021');
 insert into orders values(200105, 2500,'2008-07-18','C00025');
 insert into orders values(200109, 3500,'2008-07-30','C00011');
 insert into orders values(200101, 3000,'2008-07-15','C00001');
 insert into orders values(200111, 1000,'2008-07-10','C00020');
 insert into orders values(200104, 1500,'2008-03-13','C00006');
 insert into orders values(200106, 2500,'2008-04-20','C00005');
 insert into orders values(200125, 2000,'2008-10-10','C00018');
 insert into orders values(200117,  800,'2008-10-20','C00014');
 insert into orders values(200123,  500,'2008-09-16','C00022');
 insert into orders values(200120,  500,'2008-07-20','C00009');
 insert into orders values(200116,  500,'2008-07-13','C00010');
 insert into orders values(200124,  500,'2008-06-20','C00017');
 insert into orders values(200126,  500,'2008-06-24','C00022');
 insert into orders values(200129, 2500,'2008-07-20','C00024');
 insert into orders values(200127, 2500,'2008-07-20','C00015');
 insert into orders values(200128, 3500,'2008-07-20','C00009');
 insert into orders values(200135, 2000,'2008-09-16','C00007');
 insert into orders values(200131,  900,'2008-08-26','C00012');
 insert into orders values(200133, 1200,'2008-06-29','C00009');
 insert into orders values(200100, 1000,'2008-01-08','C00015');
 insert into orders values(200110, 3000,'2008-04-15','C00019');
 insert into orders values(200107, 4500,'2008-08-30','C00007');
 insert into orders values(200112, 2000,'2008-05-30','C00016');
 insert into orders values(200113, 4000,'2008-06-10','C00022');
 insert into orders values(200102, 2000,'2008-05-25','C00012');


SELECT cust_city, COUNT(o.ord_num) as "Number of orders", 
COUNT(distinct c.cust_code) as "Number of Customer", 
SUM(ord_amount) as "Total order Amountt"
FROM customer c LEFT JOIN orders o
ON c.cust_code = o.cust_code
GROUP BY cust_city
HAVING COUNT(o.ord_num) >= 4

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



SELECT emp_name, (qtr1+qtr2+qtr3+qtr4) as "Case Resolved"
FROM employees
WHERE manager_id = 114 
AND qtr1+qtr2+qtr3+qtr4 IN 
(SELECT MAX(qtr1+qtr2+qtr3+qtr4) FROM employees 
WHERE manager_id = 114);
