
drop database tech;
create database tech;
use tech;
create table tech.work
(WORKER_ID int,
FIRST_NAME varchar(255),
LAST_NAME varchar(23),
SALARY int,
JOINING_DATE timestamp,
DEPARTMENT varchar(34));

insert into tech.work
values

(001,"Monika","Arora",100000,"2014-02-20 09:00:00","HR"),
(002,"Niharika","Verma",80000,"2014-06-11 09:00:00","Admin"),
(003,"Vishal","Singhal",300000,"2014-02-20 09:00:00","HR"),
(004,"Amitabh","Singh",500000,"2014-02-20 09:00:00","Admin"),
(005,"Vivek","Bhati",500000,"2014-06-11 09:00:00","Admin"),
(006,"Vipul","Diwan",200000,"2014-06-11 09:00:00","Account"),
(007,"Satish","Kumar",75000,"2014-01-20 09:00:00","Account"),
(008,"Geetika","Chauhan",90000,"2014-04-11 09:00:00","Admin");

create table tech.bonus
(WORKER_REF_ID int,BONUS_DATE timestamp,BONUS_AMOUNT int);
insert into tech.bonus 
values
(1,"2016-02-20 00:00:00",5000),
(2,"2016-06-11 00:00:00",3000),
(3,"2016-02-20 00:00:00",4000),
(1,"2016-02-20 00:00:00",4500),
(2,"2016-06-11 00:00:00",3500);

create table tech.title
(
WORKER_REF_ID int,WORKER_TITLE varchar(34),	AFFECTED_FROM timestamp);
insert into tech.title
values
(1,"Manager","2016-02-20 00:00:00"),
(2,"Executive","2016-06-11 00:00:00"),
(8,"Executive","2016-06-11 00:00:00"),
(5,"Manager","2016-06-11 00:00:00"),
(4,"Asst. Manager","2016-06-11 00:00:00"),
(7,"Executive","2016-06-11 00:00:00"),
(6,"Lead","2016-06-11 00:00:00"),
(3,"Lead","2016-06-11 00:00:00");

#To prepare the sample data,
# you can run the following queries in your database
# query executor or on the SQL command line. 
#We’ve tested them with MySQL Server 5.7 and MySQL Workbench 6.3.8 query browser.
# You can also download these Softwares and install them to carry on the SQL exercise.

#SQL Script to Seed Sample Data.
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25));

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
#Once above SQL would run, you’ll see a result similar to the one attached below.


#50 SQL Query Questions and Answers for Practice.
#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 select first_name as worker_name from worker 
 group by first_name;
 
select first_name as worker_name from worker;

#Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
Select upper(FIRST_NAME) from Worker;

#Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(department)from worker;

#Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
Select substring(FIRST_NAME,1,3) from Worker;

#Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';
select instr(first_name,"a") from worker where first_name="amitabh";

/*Notes.
The INSTR method is in case-sensitive by default.
Using Binary operator will make INSTR work as the case-sensitive function.*/
 
#Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from Worker;

#Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
Select LTRIM(DEPARTMENT) from Worker;


#Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
Select distinct length(DEPARTMENT) from Worker;

#Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
Select REPLACE(FIRST_NAME,'a','A') from Worker;

#Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT *FROM WORKER
ORDER BY FIRST_NAME ASC;

#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;
 
#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
Select * from Worker where FIRST_NAME in ('Vipul','Satish');

#Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
Select * from Worker where FIRST_NAME not in ('Vipul','Satish');
 
#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select *from worker where department like "%admin%";

#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select * from Worker where FIRST_NAME like '%a%';
 
#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select * from Worker where FIRST_NAME like '%a';
 
#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
Select * from Worker where FIRST_NAME like '_____h';

#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
Select * from Worker where SALARY between 100000 and 500000;
 
#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select *from worker where joining_date like "%2014-02-%";

#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';
 select count(*) from worker where id =3;
 select count(*) from worker where name="esh";
 select count(*) from worker where game="cric";

#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select *from worker where salary between 50000 and  100000;

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);
select *from worker;

#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;
select *from org.title;
#Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');
 

/*Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
Ans.

The required query is:*/

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

/*Q-26. Write an SQL query to show only odd rows from a table.*/
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) != 0;

/*Q-27. Write an SQL query to show only even rows from a table.*/
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

/*Q-28. Write an SQL query to clone a new table from another table.
Ans.
The general query to clone a table with data is:*/

SELECT * INTO WorkerClone FROM Worker;
/*The general way to clone a table without information is:*/

SELECT * INTO WorkerClone FROM Worker WHERE 1 = 0;
-- An alternate way to clone a table (for MySQL) without is:

CREATE TABLE WorkerClone LIKE Worker;

/*Q-29. Write an SQL query to fetch intersecting records of two tables.
Ans.
y using the TOP command in SQL Server:


The required query is:*/

/*(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);*/
 
/*Q-30. Write an SQL query to show records from one table that another table does not have.
Ans.*/


/*SELECT * FROM Worker
MINUS
SELECT * FROM Title;
 

Q-31. Write an SQL query to show the current date and time.
Ans.

Following MySQL query returns the current date:

SELECT CURDATE();
Following MySQL query returns the current date and time:

SELECT NOW();
Following SQL Server query returns the current date and time:

SELECT getdate();
Following Oracle query returns the current date and time:

SELECT SYSDATE FROM DUAL;*/
 
-- Q-32. Write an SQL query to show the top n (say 10) records of a table.

-- Following MySQL query will return the top n records using the LIMIT method:

SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10;
#Following SQL Server query will return the top n records using the TOP command:

#SELECT TOP 10 * FROM Worker ORDER BY Salary DESC;
#Following Oracle query will return the top n records with the help of ROWNUM:

SELECT * FROM (SELECT * FROM Worker ORDER BY Salary DESC)
WHERE ROWNUM <= 10;
 

#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.


#The following MySQL query returns the nth highest salary:

#SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT n-1,1;
#The following SQL Server query returns the nth highest salary:

SELECT TOP  Salary  
FROM (
 SELECT DISTINCT TOP  Salary
 FROM Worker 
 ORDER BY Salary DESC
 )
ORDER BY Salary ASC;
 

#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.


#The following query is using the correlated subquery to return the 5th highest salary:

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
 
 select *from org.worker;
 
 select salary from worker
 order by salary desc
 limit 3,1;
#Use the following generic method to find nth highest salary without using TOP or limit.

SELECT Salary
FROM Worker W1
WHERE n-1 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
 

#Q-35. Write an SQL query to fetch the list of employees with the same salary.


Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;
 

#Q-36. Write an SQL query to show the second highest salary from a table.

#The required query is:

Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);
 select *from org.worker;

select distinct salary from worker
order by salary desc
limit 3,1;

#Q-37. Write an SQL query to show one row twice in results from a table.

select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';
 

#Q-38. Write an SQL query to fetch intersecting records of two tables.


/*(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);*/
 

#Q-39. Write an SQL query to fetch the first 50% records from a table.


SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

#Q-40. Write an SQL query to fetch the departments that have less than five people in it.

SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;
 
#Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;
 
#Q-42. Write an SQL query to show the last record from a table.

#The following query will return the last record from the Worker table:

Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

#Q-43. Write an SQL query to fetch the first row of a table.

Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);
 

#Q-44. Write an SQL query to fetch the last five records from a table.


SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;
 

#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.


SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;
 

#Q-46. Write an SQL query to fetch three max salaries from a table.

SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
select distinct salary from worker 
order by salary desc
limit 1,3;
 

#Q-47. Write an SQL query to fetch three min salaries from a table.

SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;
 

#Q-48. Write an SQL query to fetch nth max salaries from a table.


SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 

#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.


 SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
 
#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);
 

Summary – 50 SQL Query Questions and Answers for Practice.
Let us take a pause here. But we’ll come back with more challenging questions on SQL queries in our next post.

Hope, you’d fun learning through the SQL exercises.

If you find something new to learn today, then do share it with others. And, follow us on our social media (Facebook/Twitter) accounts to see more of this.

Best,

TechBeamers

Read more articles
Previous Post
Top 30 PL SQL Interview Questions and Answers for Freshers
Next Post
25 SQL Performance Interview Questions and Answers
YOU MIGHT ALSO LIKE
SQL Exercises – Complex Queries
SQL Exercises – Complex Queries
May 10, 2020
Top SQL Interview Questions One Should Know Beforehand
Top SQL Interview Questions One Should Know Beforehand
September 23, 2016
25 SQL Performance Interview Questions and Answers
25 SQL Performance Interview Questions and Answers
December 10, 2016


1
SELECT TOP N * FROM EmployeePosition ORDER BY Salary DESC;

1
SELECT SYSTDATE();
Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
1
SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;
Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
Using the MID function in MySQL

1
SELECT MID(Address, 0, LOCATE('(',Address)) FROM EmployeeInfo;
Using SUBSTRING
1
SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address)) FROM EmployeeInfo;
Q6. Write a query to create a new table which consists of data and structure copied from the other table.
Using the SELECT INTO command:

1
SELECT * INTO NewTable FROM EmployeeInfo WHERE 1 = 0;
Using the CREATE command in MySQL:

Course Curriculum
MySQL DBA Certification Training
Weekday / Weekend Batches
1
CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;
Q7. Write q query to find all the employees whose salary is between 50000 to 100000.
1
SELECT * FROM EmployeePosition WHERE Salary BETWEEN '50000' AND '100000';
Q8. Write a query to find the names of employees that begin with ‘S’
1
SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'S%';
Q9. Write a query to fetch top N records.
By using the TOP command in SQL Server:

1
SELECT TOP N * FROM EmployeePosition ORDER BY Salary DESC;
By using the LIMIT command in MySQL:

1
SELECT * FROM EmpPosition ORDER BY Salary DESC LIMIT N;
Q10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
1
SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM EmployeeInfo;
Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
1
SELECT COUNT(*), Gender FROM EmployeeInfo WHERE DOB BETWEEN '02/05/1970 ' AND '31/12/1975' GROUP BY Gender;
Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
To order the records in ascending and descnding order, you have to use the ORDER BY statement in SQL.

1
SELECT * FROM EmployeeInfo ORDER BY EmpFname desc, Department asc;
Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
To fetch details mathcing a certain value, you have to use the LIKE operator in SQL.

1
SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';
Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
1
SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay','Sonia');
Want to upskill yourself to get ahead in your career? Check out this video
 

Top 10 Technologies to Learn in 2022 | Edureka

 

Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
1
SELECT * FROM EmployeeInfo WHERE Address LIKE 'DELHI(DEL)%';
Q16. Write a query to fetch all employees who also hold the managerial position.
1
2
3
SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');
Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
1
2
3
SELECT Department, count(EmpID) AS EmpDeptCount 
FROM EmployeeInfo GROUP BY Department 
ORDER BY EmpDeptCount ASC;
Q18. Write a query to calculate the even and odd records from a table.
To retrieve the even records from a table, you have to use the MOD() function as follows:

1
SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=0;
Similarly, to retrieve the odd records from a table, you can write a query as follows:

1
SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=1;
Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
1
2
3
SELECT * FROM EmployeeInfo E 
WHERE EXISTS 
(SELECT * FROM EmployeePosition P WHERE E.EmpId = P.EmpId);
Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
To retrieve two minimum salaries, you can write a query as below:

1
2
3
SELECT DISTINCT Salary FROM EmployeePosition E1 
 WHERE 2 >= (SELECTCOUNT(DISTINCT Salary)FROM EmployeePosition E2 
  WHERE E1.Salary >= E2.Salary) ORDER BY E1.Salary DESC;
To retrieve two maximum salaries, you can write a query as below: 
1
2
3
SELECT DISTINCT Salary FROM EmployeePosition E1 
 WHERE 2 >= (SELECTCOUNT(DISTINCT Salary) FROM EmployeePosition E2 
  WHERE E1.Salary <= E2.Salary) ORDER BY E1.Salary DESC;

Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
1
2
3
4
5
6
SELECT Salary 
FROM EmployeePosition E1 
WHERE N-1 = ( 
      SELECT COUNT( DISTINCT ( E2.Salary ) ) 
      FROM EmployeePosition E2 
      WHERE E2.Salary >  E1.Salary );
Q22. Write a query to retrieve duplicate records from a table.
1
2
3
SELECT EmpID, EmpFname, Department COUNT(*) 
FROM EmployeeInfo GROUP BY EmpID, EmpFname, Department 
HAVING COUNT(*) > 1;
Q23. Write a query to retrieve the list of employees working in the same department.
1
2
3
Select DISTINCT E.EmpID, E.EmpFname, E.Department 
FROM EmployeeInfo E, Employee E1 
WHERE E.Department = E1.Department AND E.EmpID != E1.EmpID;
Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
1
2
3
4
SELECT * FROM EmployeeInfo WHERE
EmpID <=3 UNION SELECT * FROM
(SELECT * FROM EmployeeInfo E ORDER BY E.EmpID DESC) 
AS E1 WHERE E1.EmpID <=3;
Q25. Write a query to find the third-highest salary from the EmpPosition table.
1
2
3
4
5
6
SELECT TOP 1 salary
FROM(
SELECT TOP 3 salary
FROM employee_table
ORDER BY salary DESC) AS emp
ORDER BY salary ASC;
Q26. Write a query to display the first and the last record from the EmployeeInfo table.
To display the first record from the EmployeeInfo table, you can write a query as follows:

1
SELECT * FROM EmployeeInfo WHERE EmpID = (SELECT MIN(EmpID) FROM EmployeeInfo);
To display the last record from the EmployeeInfo table, you can write a query as follows:

1
SELECT * FROM EmployeeInfo WHERE EmpID = (SELECT MAX(EmpID) FROM EmployeeInfo);
Q27. Write a query to add email validation to your database
1
SELECT Email FROM EmployeeInfo WHERE NOT REGEXP_LIKE(Email, ‘[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}’, ‘i’);
Q28. Write a query to retrieve Departments who have less than 2 employees working in it.
1
SELECT DEPARTMENT, COUNT(EmpID) as 'EmpNo' FROM EmployeeInfo GROUP BY DEPARTMENT HAVING COUNT(EmpD) < 2;
Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them.
1
SELECT EmpPosition, SUM(Salary) from EmployeePosition GROUP BY EmpPosition;
Q30. Write a query to fetch 50% records from the EmployeeInfo table.
1
2
3
SELECT * 
FROM EmployeeInfo WHERE
EmpID <= (SELECT COUNT(EmpID)/2 from EmployeeInfo);



select salary from emp order by salalry desc limit 1;
select max(salary) from emp where salary<(select max(salary) from emp);
select *from (select fname,salary, dense_rank() over (order by salary desc) as rn from emp) as t where rn=1;