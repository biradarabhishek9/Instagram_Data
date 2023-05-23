-- sql project 
drop database project;
create database P;
create table  P.s
(id int,
cust_id varchar(20),
order_id int,
partner_code int,
outlet varchar(20),
bill_amount int,
order_date date,
comments varchar(30));

insert into P.s
values
(1,"SW1005",700,50,"KFC",753,"2021-10-10","DOOR_LOCKED"),
(2,"SW1006",710,59,"PIZZA_HUT",1496,"2021-09-01","IN-TIME-DELIVERY"),
(3,"SW1005",720,59,"DOMINOS",990,"2021-12-10",null),
(4,"SW1005",707,50,"PIZZA_HUT",2475,"2021-12-10",null),
(5,"SW1006",770,59,"KFC",1250,"2021-11-17",null),
(6,"SW1020",1000,119,"PIZZA_HUT",1400,"2021-11-18","IN-TIME-DELIVERY"),
(7,"SW2035",1079,135,"DOMINOS",1750,"2021-11-19",null),
(8,"SW1020",1083,59,"KFC",1250,"2021-11-20",null),
(11,'sw1020',1100,150,'PIZZA_HUT',1950,"2021-12-24",'LATE_DELIVERY'),
(9,'SW2035',1095,119,'PIZZA_HUT',1270,"2021-11-21",'LATE_DELIVERY'),
(10,'SW1005',729,135,'KFC',1000,"2021-09-10",'DELIVERED'),
(1,'SW1005',700,50,'KFC',753,"2021-10-10",'DOOR_LOCKED'),
(2,'SW1006',710,59,'PIZZA_HUT',1496,"2021-09-01",'IN-TIME-DELIVERY'),
(3,'SW1005',720,59,'DOMINOS',990,"2021-12-10",NULL),
(4,'SW1005',707,50,'PIZZA_HUT',2475,"2021-12-11",NULL);


select *from p.s;
select id,count(id) from p.s
group by id 
having count(id)>1;

select id,count(id) from p.s
group by id
having count(id)>1;

create table p.s1 
as
select distinct *from p.s;
drop table p.s;
rename table p.s1 to p.s;

select *from p.s
limit 3,6;

with cte 












-- duplicate rows in table 
select *from Project.swiggy;
select id,count(id) from project.swiggy
group by id
having count(id)>1;

-- duplicate in multiple columns 


/*-- wrng answer////////////////////*/

-- remove duplicates
create table project.swiggy1
as
select distinct* from project.swiggy ;
drop table project.swiggy;

rename table project.swiggy1 to project.swiggy;


-- print rec from row no 4 to 9
select *from project.swiggy
limit 3,6;

use project;
# latest orders placed by customers 
with lasest_order_dt as 
(
select cust_id,outlet,order_date,
row_number() over (partition by cust_id 
order by order_date desc) as lasest_order_dt from p.s)
select cust_id,outlet,order_date from p.s
where lasest_order_dt>1;



-- why we select outlet we can directly use id and order date 


-- why cant we use update here
# print no issues in place of null values
select *from project.swiggy;
select order_id,partner_code,order_date,
(case
when comments is null then "no issues"
else comments end) as comments
from project.swiggy;
 
-- cum count and sum
with cte as 
(
select outlet,count(outlet) as outlet_cnt,sum(bill_amount) as sum_bill from project.swiggy
group by outlet)
select outlet_cnt,sum(outlet_cnt) over (order by outlet_cnt),
sum_bill,sum(sum_bill) over (order by sum_bill) as cum_ab
from cte;

-- cust_id,outlet total no of orders 



select *from project.swiggy;
-- 
with cte as 
(
select cust_id,outlet,order_date,
row_number() over (partition by cust_id order by order_date desc) as
latest_orderdate from project.swiggy)
select cust_id,outlet,order_date from latest_order 
where latest_orderdate=1;
 
with cte as 
(
select outlet,count(outlet) as outlet_cnt,sum(bill_amount) as sum_bill from project.swiggy
group by outlet)
select outlet_cnt,sum(outlet_cnt) over (order by outlet_cnt)
sum_bill,sum(sum_bill) over (order by sum_bill) as cum_amt
from cte;

-- cust_id wise,outlet wise total no of orders

select cust_id,
sum(if(outlet='kfc',1,0))kfc,
sum(if(outlet='dominos',1,0))dominos,
sum(if(outlet='pizza_hut',1,0))pizza_hut
from project.swiggy 
group by 1;

select *from project.swiggy;
select cust_id,
sum(if(outlet='kfc',1,0))kfc,
sum(if(outlet='dominos',1,0))dominos,
sum(if(outlet='pizza_hut',1,0))pizza_hut
from project.swiggy
group by 1;

select cust_id,
sum(if(outlet='kfc',1,0))kfc,
sum(if(outlet='dominos',1,0))dominos,
sum(if(outlet='pizza_hut',1,0))pizza_hut
from project.swiggy
group by cust_id;

--
select cust_id,
sum(if(outlet='kfc',bill_amount,0))kfc,
sum(if(outlet='dominos',bill_amount,0))dominos,
sum(if(outlet='pizza_hut',bill_amount,0))pizza_hut
from project.swiggy;

select *from project.swiggy;
-- total sales 
select cust_id,
sum(if(outlet="kfc",bill_amount,0))kfc,
sum(if(outlet="dominos",bill_amount,0))dominos,
sum(if(outlet="pizza_hut",bill_amount,0))pizza_hut
from project.swiggy;



select cust_id,
sum(if(outlet="kfc",bill_amount,0))kfc,
sum(if(outlet="dominos",bill_amount,0))dominos,
sum(if(outlet="pizza_hut",bill_amount,0))pizza_hut
from project.swiggy;

select id,count(id) from project.swiggy
group by id
having count(id)>1;

create table project.swiggy1 
as 
select distinct* from project.swiggy;

drop table project.swiggy;
rename table project.swiggy1 to project.swiggy;

select *from project.swiggy
limit 4,8;

select *from project.swiggy;

with cte as 
(
select cust_id,outlet,order_date,
row_number() over (partition by cust_id order by order_date)
as latest_orderdt from project.swiggy)
select cust_id,outlet,order_date  from latest_orderdt
where latest_orderdt>1;

select order_id,partner_code,order_date,
(case
when comments is null then "no issues"
else comments end) as comments
from project.swiggy;

with cte as 
(
select outlet,count(outlet) as out_cnt,sum(bill_amount) as bill_amt from project.swiggy
group by outlet)
select outlet,out_cnt,sum(out_cnt) over (order by out_cnt),
 bill_amt,sum(bill_amt) over (order by bill_amt) as cum_amt
from cte ;

select cust_id,outlet, 
sum(if(outlet="kfc",1,0))kfc,
sum(if(outlet="dominos",1,0))dominos,
sum(if(outlet="pizza_hut",1,0))pizza_hut
from project.swiggy;
 
 select cust_id,bill_amount,
 sum(if(outlet="kfc",bill_amount,0))kfc,
 sum(if(outlet="dominos",bill_amount,0))dominos,
 sum(if(outlet="pizza_hut",bill_amount,0))pizza_hut
 from project.swiggy;
 
 
 
with cte as 
(
select outlet,count(outlet) as outlet_count,sum(bill_amount) as sum_bill_amt from project.swiggy
group by outlet)
select outlet,outlet_count,sum(outlet_count) over(order by outlet_count),
  sum_bill_amt,sum_bill_amt,sum(sum_bill_amt) over(order by sum_bill_amt)
 from cte;
 

with latest_order as
(select cust_id,outlet,order_date,
row_number() over (partition by cust_id 
order by order_date desc) as lasest_order_dt from p.s)
select cust_id,outlet,order_date from p.s
where lasest_order_dt=1;

with latest_order as 
(select cust_id,outlet,order_date,
row_number() over (partition by cust_id order by order_date desc) as lod
from p.s)select cust_id,outlet from latest_order where lod=1;


with latest_order as 
(select cust_id,outlet,order_date,
row_number() over (partition by cust_id order by order_date desc) as lod from p.s)
select cust_id,outlet,order_date from latest_order where lod=1;

with latest_order as 
(select cust_id,oultet,order_date,
row_number() over (partition by cust_id order by order_date desc) as lod from p.s)
select cust_id,outlet,order_date from latest_order where lod=1;

select order_id,partner_code,order_date
(case
when comments is null then "no issues"
else comments end) as comments1
from p.s;

select order_id,partner_code,order_date,
(case
when comments is null then "no issues"
else comments end) as comments
from p.s;
select *from p.s;
select cust_id,outlet,
sum(if(outlet="kfc",1,0))kfc,
sum(if(outlet="dominos",1,0))dominos,
sum(if(outlet="pizza_hut",1,0))pizza_hut
from p.s;

select cust_id,outlet,bill_amount,
sum(if(outlet="kfc",bill_amount,0))kfc,
sum(if(outlet="dominos",bill_amount,0))dominos,
sum(if(outlet="pizza_hut",bill_amount,0))pizza_hut
from p.s;








