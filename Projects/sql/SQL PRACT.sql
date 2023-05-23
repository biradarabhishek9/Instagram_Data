
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
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
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
 
#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select *from worker where salary between 50000 and  100000;

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

select *from worker;
select *from title;
#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;
##############################################################################################################################################################
##############################################################################################################################################################

select *from worker;
select *from title;
#Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

select w.first_name,t.working_title
from worker w inner join title t 
on w.working_id=t.WORKER_REF_ID
and t.worker_title in ("manager");
 
#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

#Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

#Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

#Q-28. Write an SQL query to clone a new table from another table.
create table worker1
as 
select *from worker where 1=0;

#Q-29. Write an SQL query to fetch intersecting records of two tables.
/*(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM title);*/
 
#Q-30. Write an SQL query to show records from one table that another table does not have.
/*SELECT * FROM Worker
MINUS
#SELECT * FROM Title;*/
 

#Q-31. Write an SQL query to show the current date and time.


#Following MySQL query returns the current date:

/*SELECT CURDATE() fro
Following MySQL query returns the current date and time:

SELECT NOW();
Following SQL Server query returns the current date and time:

SELECT getdate();
Following Oracle query returns the current date and time:

SELECT SYSDATE FROM DUAL;*/
 

#Q-32. Write an SQL query to show the top n (say 10) records of a table.
select *from worker
order by salary desc
limit 10;

 
#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select salary from worker
order by salary desc
limit 4,1;


#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

#The following query is using the correlated subquery to return the 5th highest salary:

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
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
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);
 

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
SELECT DEPARTMENT, COUNT(WORKER_ID) 
as 'Number of Workers' FROM Worker 
GROUP BY DEPARTMENT
 HAVING COUNT(WORKER_ID) < 5;
 
#Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;
 select *from worker;
 
#Q-42. Write an SQL query to show the last record from a table.
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
 
#Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;
 
#Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 
#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
 

#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);
 
#TechBeamers


#Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;
#Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT MID(Address, 0, LOCATE('(',Address)) FROM EmployeeInfo;

SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address)) FROM EmployeeInfo;
# Write a query to create a new table which consists of data and structure copied from the other table.

SELECT * INTO NewTable FROM EmployeeInfo WHERE 1 = 0;



CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;
# Write q query to find all the employees whose salary is between 50000 to 100000.

SELECT * FROM EmployeePosition WHERE Salary BETWEEN '50000' AND '100000';
# Write a query to find the names of employees that begin with ‘S’

SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'S%';
# Write a query to fetch top N records.


SELECT * FROM EmpPosition ORDER BY Salary DESC LIMIT N;
# Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM EmployeeInfo;
#Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender

SELECT COUNT(*), Gender FROM EmployeeInfo WHERE DOB BETWEEN '02/05/1970 ' AND '31/12/1975' GROUP BY Gender;
#Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
#To order the records in ascending and descnding order, you have to use the ORDER BY statement in SQL.

SELECT * FROM EmployeeInfo ORDER BY EmpFname desc, Department asc;
# Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
#To fetch details mathcing a certain value, you have to use the LIKE operator in SQL.

SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';
#Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay','Sonia');

 

# Write a query to fetch details of employees with the address as “DELHI(DEL)”.
SELECT * FROM EmployeeInfo WHERE Address LIKE 'DELHI(DEL)%';
# Write a query to fetch all employees who also hold the managerial position.
SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');
# Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
SELECT Department, count(EmpID) AS EmpDeptCount 
FROM EmployeeInfo GROUP BY Department 
ORDER BY EmpDeptCount ASC;

# Write a query to calculate the even and odd records from a table.
#To retrieve the even records from a table, you have to use the MOD() function as follows:
SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=0;

SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=1;
# Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.

SELECT * FROM EmployeeInfo E 
WHERE EXISTS 
(SELECT * FROM EmployeePosition P WHERE E.EmpId = P.EmpId);
# Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
#To retrieve two minimum salaries, you can write a query as below:

/*SELECT DISTINCT Salary FROM EmployeePosition E1 
 WHERE 2 >= (SELECTCOUNT(DISTINCT Salary)FROM EmployeePosition E2 
  WHERE E1.Salary >= E2.Salary) ORDER BY E1.Salary DESC;*/
  
/*SELECT DISTINCT Salary FROM EmployeePosition E1 
 WHERE 2 >= (SELECTCOUNT(DISTINCT Salary) FROM EmployeePosition E2 
  WHERE E1.Salary <= E2.Salary) ORDER BY E1.Salary DESC;*/

# Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
SELECT Salary 
FROM EmployeePosition E1 
WHERE N-1 = ( 
      SELECT COUNT( DISTINCT ( E2.Salary ) ) 
      FROM EmployeePosition E2 
      WHERE E2.Salary >  E1.Salary );
# Write a query to retrieve duplicate records from a table.
SELECT EmpID, EmpFname, Department COUNT(*) 
FROM EmployeeInfo GROUP BY EmpID, EmpFname, Department 
HAVING COUNT(*) > 1;
# Write a query to retrieve the list of employees working in the same department.

Select DISTINCT E.EmpID, E.EmpFname, E.Department 
FROM EmployeeInfo E, Employee E1 
WHERE E.Department = E1.Department AND E.EmpID != E1.EmpID;
# Write a query to retrieve the last 3 records from the EmployeeInfo table.

SELECT * FROM EmployeeInfo WHERE
EmpID <=3 UNION SELECT * FROM
(SELECT * FROM EmployeeInfo E ORDER BY E.EmpID DESC) 
AS E1 WHERE E1.EmpID <=3;

# Write a query to find the third-highest salary from the EmpPosition table.

SELECT  salary
FROM(
SELECT salary
FROM employee_table
ORDER BY salary DESC) AS emp
ORDER BY salary ASC;
# Write a query to display the first and the last record from the EmployeeInfo table.
#To display the first record from the EmployeeInfo table, you can write a query as follows:


SELECT * FROM EmployeeInfo WHERE EmpID = (SELECT MIN(EmpID) FROM EmployeeInfo);
#To display the last record from the EmployeeInfo table, you can write a query as follows:


SELECT * FROM EmployeeInfo WHERE EmpID = (SELECT MAX(EmpID) FROM EmployeeInfo);
# Write a query to add email validation to your database


# Write a query to retrieve Departments who have less than 2 employees working in it.

SELECT DEPARTMENT, COUNT(EmpID) as 'EmpNo' FROM EmployeeInfo GROUP BY DEPARTMENT HAVING COUNT(EmpD) < 2;
# Write a query to retrieve EmpPostion along with total salaries paid for each of them.

SELECT EmpPosition, SUM(Salary) from EmployeePosition GROUP BY EmpPosition;
# Write a query to fetch 50% records from the EmployeeInfo table.

SELECT * 
FROM EmployeeInfo WHERE
EmpID <= (SELECT COUNT(EmpID)/2 from EmployeeInfo);



select salary from emp order by salary desc limit 1;
select max(salary) from emp where salary<(select max(salary) from emp);
select *from (select fname,salary, dense_rank() over (order by salary desc) as rn from emp) as t where rn=1;