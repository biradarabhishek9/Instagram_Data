Customer Name	city		Salesman	city	commission
Graham Zusi	California	Nail Knite	Paris	0.13
Julian Green	London		Nail Knite	Paris	0.13
Jozy Altidor	Moscow		Paul Adam	Rome	0.13

select customer.cust_name as "customer name",
customer.city ,salesman.name as "salesman",
salesman.city ,salesman.commission
from customer inner join salesman 
on customer.id=salesman.salesman.id
where customer.city <> salesman.city
and commission>12

cust_name	city		grade	Salesman	city
Brad Guzan	London			Pit Alex	London
Nick Rimando	New York	100	James Hoog	New York
Jozy Altidor	Moscow		200	Paul Adam	Rome
Fabian Johnson	Paris		300	Mc Lyon		Paris
Graham Zusi	California	200	Nail Knite	Paris
Brad Davis	New York	200	James Hoog	New York
Julian Green	London		300	Nail Knite	Paris
Geoff Cameron	Berlin		100	Lauson Hen	San Jose

cust_name	city		ord_no	ord_date	Order Amount
Nick Rimando	New York	70013	2012-04-25	3045.60
Julian Green	London		70012	2012-06-27	250.45
Brad Davis	New York	70005	2012-07-27	2400.60
Jozy Altidor	Moscow		70011	2012-08-17	75.29

SELECT CUST_NAME,CITY,ORD_NO,PURCH_AMT AS "ORDER AMT"
FROM CUSTOMER RIGHT OUTER JOIN ORDERS ON 
CUST_ID ON SALES_ID
WHERE 
ORDER BY ORDER AMT


dpt_name
Finance
IT
HR
SELECT emp_department.dpt_name FROM emp_details
 INNER JOIN emp_department
 ON emp_dept =dpt_code 
GROUP BY emp_department.dpt_name
 HAVING COUNT(*) > 2;

select a.dpt_name 
from emp_department as a
 inner join emp_details as b
on a.dpt_code=b.emp_dept
group by dptname
having count(*)>2;

First Name	Last Name
Alan		Snappy
Maria		Foster
Michale		Robbin
Enric		Dosio
Joseph		Dosni
Zanifer		Emily
Kuleswar	Sitaraman
Henrey		Gabriel
Alex		Manuel
George		Mardy

select b.EMP_FNAME as First Name , b.EMP_LNAME as Last Name
  from emp_details b inner join emp_department a 
  on b.emp_dept=a.dpt_code 
  having a.dpt_allotment>50000
  group by first_name,last_name;
  
  SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name"
  FROM emp_details 
    INNER JOIN emp_department
        ON emp_details.emp_dept = emp_department.dpt_code
    AND emp_department.dpt_allotment > 50000;
    
First Name	Last Name	Department	Amount Allotted
Alan		Snappy		RD		55000
Maria		Foster		IT		65000
Michale		Robbin		IT		65000
Carlos		Snares	Finance		15000
    
select emp_details.emp_name as firstnaem ,emp_details.emp_lname as last name,
   emp_department.DPT_NAME,DPT_NAME.DPT_ALLOTMENT as sanction amt
from emp_details inner join emp_department
on emp_details.emp_dept =emp_department.DPT_CODE
    

emp_idno	First Name	Last Name	Department	emp_dept	dpt_code	dpt_allotment

          avg          | com_name 
-----------------------+----------
 5000.0000000000000000 | Samsung
  650.0000000000000000 | iBall
 1475.0000000000000000 | Epsion
  500.0000000000000000 | Frontech
 3200.0000000000000000 | Asus
(5 rows


select item_mast.avg(pro_name) as avg,company_mast.com_name
from item_mast inner join company_mast 
on item_mast.pro_com=company_mast.com_id
group by company_Mast.com_nmae
having avg(pro_price) >=350

pro_name	pro_price	com_nam

select pro_name,pro_price,com_nam 
from  item_mast inner join company_mast
on PRO_COM=COM_ID 
and pro_price
(select max(a.pro_price)
from item_mast a 
where a.pro_com=f.com_id); 






avg			com_name
5000.0000000000000000	Samsung
650.0000000000000000	iBall
1475.0000000000000000	Epsion


select *from salesman cross join customer 
where city is not null
and grade is not null
and a.city<> b.city


avg			com_name
5000.0000000000000000	Samsung
650.0000000000000000	iBall
1475.0000000000000000	Epsion
salesman_id	name	city		commission
	customer_id	cust_name	city		grade	salesman_id




ord_no	purch_amt	ord_date	customer_id	salesman_id
70011	75.29		2012-08-17	3003		5007



select *from orders where salesman_id= 
(select salesman_id  from salesman where name="paul adam");

ord_no	purch_amt	ord_date	customer_id	salesman_id
70009	270.65		2012-09-10	3001		5005

select * from orders
where salesman_id in(select salesman_id from salesman where city="london");


select *from orders where salesman_id in (select distinct salesman_id from salesman where 
customer_id=3007

select *from orders 
where purch_amt > (select avg(purch_amt from order whre ord_dat plmlnfdg) 
SELECT *
FROM orders
WHERE purch_amt >
    (SELECT  AVG(purch_amt) 
     FROM orders 
     WHERE ord_date ='10/10/2012')




























