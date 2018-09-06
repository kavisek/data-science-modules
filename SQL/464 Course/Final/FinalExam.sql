/*--------------------------------Criteria------------------------------*/


60 marks (30% weightage ) 2.5 hours

Question 1 (2 ERD) - 15 points
	- 1 big question, and 1 small question
		- One will be about extendeding a data model form textbook problems
		- Will include: Recursive Relationships, Specialization, Temporal and Spatial Data
		- No "exist/divides"


SQL - 30 points
	- (15 points) -- 4 to 5 SQL based questions on Chapters 3 to 11 (including  SQL Playbook and other textbook material)
	- 15 point - 2 Star Schemas, variationt froms of textbook problems + SQL creation of time dimesion and fact tables

Essay Questions - 10 points
	- 3 to 4 questions
	- Architecture, Types Database Application , SQL, R, etc.

Multiple Choice - 5 points



/*-------------------------Multiple Choice (1000,P,D,F,A)-------------------*/
 

1000 P D F D 

L7: Q: A large database can be characterised by haveing ________ entities?
A: 1000

L8: Q: The main data model in chapter 11 includes which entity?
A: Politcal unit


L9: Q:which step is not a step in creating a data warehouse?
A:Discovery


L10: Q: dataware
(variable data in a dataware)
A: Fact

L11 Q: A table in mySQL is called a ________ in R
A: Dataframe




/*-------------------------------ERD Notes---------------------------*/

Recursive Relationships
	- when someone has a department boss, and has an emloyee bost who is also an employee

Specialization
	- Top Down Appoach, Emloyees are seperated into different categories 
	- defines subtypes ant forms relationships between supertypes and subtypes

Temporal
	- 

Spatial Data
	- linestring
	- Points
	- polygon
	- R-tree


/*-----------------------Database Application Types----------------------*/


SQL:

R: 

Tableau:

Shiny (R-based Dashboard)

/*-----------------------Architectures----------------------*/



Lamba Architectures

Hadoop & Map Reduce

Tableau

Clouds (P,P,C,H)
	- Pubic
	- Private
	- Community
	- Hybrid




/*----------------------------Fact Table--------------------------------*/

Use db_kulbeers; 
drop table T;

create table T as select film_id from sakila.film;
# Use the below line of INSERT code repeatedly if you want to create a table with more rows. 
#insert into T select film_id from T;

# time span
SET @d0 = "2010-01-01";
SET @d1 = "2012-12-31";
 
SET @date = date_sub(@d0, interval 1 day);
 
# set up the time dimension table
DROP TABLE IF EXISTS time_dimension;
CREATE TABLE `time_dimension` (
  `date` date DEFAULT NULL,
  `id` int NOT NULL,
  `y` smallint DEFAULT NULL,
  `m` smallint DEFAULT NULL,
  `d` smallint DEFAULT NULL,
  `yw` smallint DEFAULT NULL,
  `w` smallint DEFAULT NULL,
  `q` smallint DEFAULT NULL,
  `wd` smallint DEFAULT NULL,
  `m_name`  char(10) DEFAULT NULL,
  `wd_name` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
 
# populate the table with dates
INSERT INTO time_dimension
SELECT @date := date_add(@date, interval 1 day) as date,
    # integer ID that allows immediate understanding
    date_format(@date, "%Y%m%d") as id,
    year(@date) as y,
    month(@date) as m,
    day(@date) as d,
    date_format(@date, "%x") as yw,
    week(@date, 3) as w,
    quarter(@date) as q,
    weekday(@date)+1 as wd,
    monthname(@date) as m_name,
    dayname(@date) as wd_name
FROM T
WHERE date_add(@date, interval 1 day) <= @d1
ORDER BY date
;

select * from time_dimension;

use db_kulbeers;

drop table if exists fact_order;
drop table if exists vendor;
drop table if exists productvendor;
drop table if exists product;
drop table if exists salesorderheader;
drop table if exists salesorderdetail;

create table vendor as 
	select * 
    from adventureworks.vendor;
    
create table product as
	select *
	from adventureworks.product;

create table productvendor as
	select * 
    from adventureworks.productvendor;

create table salesorderheader as
	select *
    from adventureworks.salesorderheader;

create table salesorderdetail as
	select *
    from adventureworks.salesorderdetail;
    
create index x1 on product(productid);
create index x2 on vendor(vendorid);
create index x3 on productvendor(productid);
create index x4 on salesorderheader(salesorderid);
create index x5 on salesorderheader(salesorderid);

create index x6 on productvendor (productid, vendorid);
create index x7 on salesorderdetail(productid, salesorderid);

create table fact_order as
	select
		v.vendorid as vendor, 
        p.productid as product, 
        w as week,
        sum(OrderQty * UnitPrice) as OrderRev
	from 
		vendor v,
        product p, 
        productvendor vp,
        salesorderdetail sd,
        salesorderheader so,
        time_dimension as td
	where
		v.vendorid = vp.vendorid
        and p.productid = vp.productid
        and p.productid = sd.productid
        and so.SalesOrderId = sd.SalesOrderID
        and td.date = so.Orderdate
	group by 
		v.vendorid, 
        p.productid,
        week
	order by p.productid;
    
select*from fact_order;
select*from vendor;
select*from product;
select*from salesorderdetail;
select*from salesorderheader;


select
	vendor, 
    product, 
    sum(OrderRev)
from
	fact_orders
group by
	product, 
    vendor with ROllUP;
        

/*-----------------------------Other Notes---------------------------------


- rollup add total to you search query amounts, based on what you rollup



*/