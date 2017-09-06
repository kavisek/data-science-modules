use db_testing;
show tables;



#Delete all tables from your database space
SET FOREIGN_KEY_CHECKS = 0; 
SET @tables = NULL;
SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables
  FROM information_schema.tables 
  WHERE table_schema = 'db_testing'; -- specify DB name here.
SET @tables = CONCAT('DROP TABLE ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET FOREIGN_KEY_CHECKS = 1;

drop table dim_prod;
create table dim_prod as 
select productid, x.name as prodName from adventureworks.product as x; 

ALTER TABLE `db_testing`.`dim_prod` 
ADD COLUMN `prod_key` INT NOT NULL AUTO_INCREMENT AFTER `prodName`,
ADD PRIMARY KEY (`prod_key`);
select * from dim_prod;

drop table dim_vendor;
create table dim_vendor as 
select VendorID, x.name as vendname from adventureworks.vendor as x;

ALTER TABLE `db_testing`.`dim_vendor` 
ADD COLUMN `vendor_key` INT NOT NULL AUTO_INCREMENT AFTER `vendname`,
ADD PRIMARY KEY (`vendor_key`);

############CREATING THE TIME DIMENSION##########

drop table T;
create table T as select film_id from sakila.film;
# Use the below line of INSERT code repeatedly if you want to create a table with more rows. 
#insert into T select film_id from T;
insert into T select film_id from sakila.film;
insert into T select film_id from sakila.film;

select count(*) from T;


# time span
SET @d0 = "2001-07-01";
SET @d1 = "2004-07-31";
 
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

##############   finally we create the FACT table #########
use db_testing;

create table vendor as select * from adventureworks.vendor;
create table product as select * from adventureworks.product;
create table productvendor as select * from adventureworks.productvendor;
create table salesorderheader as select * from adventureworks.salesorderheader;
create table salesorderdetail as select * from adventureworks.salesorderdetail;

create index x1 on product(productid);
create index x2 on vendor(vendorid);
create index x3 on productvendor(productid);
create index x4 on salesorderdetail(productid);
create index x5 on salesorderheader(salesorderid);

create index x6 on productvendor(productid, vendorid);
create index x7 on salesorderdetail(productid, salesorderid);

drop table fact_orders;
create table fact_orders as
select v.vendorid as Vendor, p.productid as Product, w as Week, sum(OrderQty * UnitPrice) as OrderRev
from vendor v, product p, 
productvendor vp, salesorderheader so,
salesorderdetail sd, time_dimension as td
where v.vendorid = vp.vendorid and p.productid = vp.productid
and p.productid = sd.productid and so.SalesOrderID = sd.SalesOrderID
and td.date = so.Orderdate
group by v.vendorid, p.productid, Week
order by p.productid;

select vendor, product, sum(OrderRev)
from fact_orders
group by product, vendor WITH ROLLUP;
