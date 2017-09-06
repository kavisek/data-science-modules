use db_vphan;

#Star Schema

#dim_weather: (weather_key (PK), event_id, tmax,tmin,tavg,depart,dewpoint,wetbulb,heat,cool,sunrise,sunset,codesum,snowfall,preciptotal,stnpressure,sealevel,resultspeed,resultdir,avgspeed,weather_station_id)

#dim_store: (store_key (PK), store_id, store_address, store_postal_code, store_city, store_station_id)

#dim_item: (item_key (PK), item_id, item_name, item_description, item_type, item_unit_price, item_store_id, item_inventory_id, item_inventory_quantity, item_department_id)

#dim_department: (department_key (PK), department_id, department_name)

#dim_date: (date_key (PK), date, date_year, date_month, date_day, date_year_week, date_week, date_quarter, date_weekday, date_month_name, date_day_name)

#fact_sale: (sale_key, store_key, weather_key, item_key, department_key, sale_date, sale_quantity, sale_total) ????
 
#create dim_weather table
drop table if exists dim_weather;
Create table dim_weather as
	select *, station_id as weather_station_id from `weather event`;

alter table dim_weather 
add `weather_key` int auto_increment primary key first;

select * from dim_weather;

#create dim_store table
drop table if exists dim_store; 
create table dim_store as
	select store_id,address,postal_code,city,station_id as store_station_id from store;
    
alter table dim_store add `store_key` int AUTO_INCREMENT PRIMARY KEY first;

#create dim_item table
drop table if exists dim_item;
create table dim_item as
select i.*, i.department_id as item_department_id, v.inventory_id as item_inventory_id, 
	   v.quantity as item_inventory_quantity, v.store_id as item_store_id
from item i, inventory v
where i.item_id=v.item_id;

Alter table dim_item
add column item_key int not null auto_increment first,
add primary key (`item_key`);

select * from dim_item;

#create dim_department table
drop table if exists dim_department;
create table dim_department as
select * from department;

Alter table dim_department
add column department_key int not null auto_increment first,
add primary key (`department_key`);

select * from dim_department;

#create dim_date time dimension

drop table if exists T;

create table T as select event_id from db_vphan.`weather event`;

#find time span
select min(date), max(date) from `weather event`;

SET @d0 = "2012-01-01";
SET @d1 = "2014-10-31";
 
SET @date = date_sub(@d0, interval 1 day);
 
#set up the dim_date time dimension table
DROP TABLE IF EXISTS dim_date;
CREATE TABLE `dim_date` (
  `date_key` int NOT NULL,
  `date` date DEFAULT NULL,
  `date_year` smallint DEFAULT NULL,
  `date_month` smallint DEFAULT NULL,
  `date_day` smallint DEFAULT NULL,
  `date_year_week` smallint DEFAULT NULL,
  `date_week` smallint DEFAULT NULL,
  `date_quarter` smallint DEFAULT NULL,
  `date_weekday` smallint DEFAULT NULL,
  `date_month_name`  char(10) DEFAULT NULL,
  `date_day_name` char(10) DEFAULT NULL,
  PRIMARY KEY (`date_key`)
);
 
#populate the table with dates
INSERT INTO dim_date
SELECT @date := date_add(@date, interval 1 day) as date,
    # integer ID that allows immediate understanding
    date_format(@date, "%Y%m%d") as date_key,
    year(@date) as date_year,
    month(@date) as date_month,
    day(@date) as date_day,
    date_format(@date, "%x") as date_year_week,
    week(@date, 3) as date_week,
    quarter(@date) as date_quarter,
    weekday(@date)+1 as date_weekday,
    monthname(@date) as date_month_name,
    dayname(@date) as date_day_name
FROM T
WHERE date_add(@date, interval 1 day) <= @d1
ORDER BY date;

select * from dim_date;

drop table T;

#create fact_sale table

create table fact_sale as
select event_id as weather_key, item_id as item_key,
department_id as department_key, store_id as store_key, sum(line_units) as sale_quantity,
sum(item_unit_price*line_units) as sale_total, date_month as sale_month, date_quarter as sale_quarter, date_year as sale_year
from `weather event`,  
