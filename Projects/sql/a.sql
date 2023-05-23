-- sql project 
drop database project;
create database Project;
create table  Project.swiggy
(id int,
cust_id varchar(20),
order_id int,
partner_code int,
outlet varchar(20),
bill_amount int,
order_date varchar(20),
comments varchar(30));

insert into Project.swiggy
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
use project;
select *from project.swiggy;
-- duplicate rows
select id,count(id)
from swiggy
group by id
having count(id)>1;

create table swiggy1 
as
select distinct * from swiggy;
drop table swiggy;
rename table swiggy1 to swiggy;
desc swiggy;
select *from swiggy;

with latest_order as 
(select cust_id,outlet,order_date,
row_number() over (partition by cust_id order by order_date desc) as latest_orderr
from swiggy) 
select cust_id,outlet,order_date from latest_order where latest_orderr>1;

select order_date,partner_code,order_date,
(case 
when comments is null then "no issues"
when comments is door_locked then "