use db_shiqiz;
 
drop table if exists dim_department;
create table dim_department as 
select department_id,department_name from department;
alter table dim_department add `department_key` int not null auto_increment primary key;

drop table if exists dim_item;
create table dim_item as
select item.*,department_name
from item, department
where item.department_id=department.department_id;

Alter table dim_item
add column item_key int not null auto_increment,
add primary key (`item_key`);

select * from dim_item;

drop table if exists db_shiqiz.dim_store; 
create table db_shiqiz.dim_store as
	select store_id,s.address,s.postal_code,s.city,st.station_id from db_shiqiz.store as s, station as st
    where s.station_id=st.station_id
    group by store_id;
alter table dim_store add `store_key` int AUTO_INCREMENT PRIMARY KEY;


drop table if exists db_shiqiz.dim_weather;
Create table db_shiqiz.dim_weather as
	select event_id,station_id,date,tmax,tmin,tavg,sunrise,sunset,codesum,snowfall
    from `weather event`;
alter table dim_weather add `weather_key` int auto_increment primary key;


drop table if exists T;

create table T as select event_id from db_shiqiz.`weather event`;
# Use the below line of INSERT code repeatedly if you want to create a table with more rows. 
#insert into T select event_id from T;

# time span
select min(date), max(date) from `weather event`;

SET @d0 = "2012-01-01";
SET @d1 = "2014-10-31";
 
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

drop table if exists db_shiqiz.fact_sales;
create table db_shiqiz.fact_sales as
	select item_key,weather_key,store_key,item_name,line_totals,line_units,d.department_name
    date #
    from dim_department as d,dim_store as s,dim_item as i,dim_weather as w,time_dimension as t, line_item as l,sale
    where d.department_id=i.department_id
    and i.item_id=l.item_id
    and s.station_id=w.station_id
    and l.sale_id = sale.sale_id
    and sale.sale_date=t.date
group by store_key,item_key,weather_key,date;

