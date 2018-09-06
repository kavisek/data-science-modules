use db_vphan;

/*--------------------------------Dropping Tables--------------------------------*/


drop table if exists fact_sale;
drop table if exists dim_store;
drop table if exists dim_item_department;
drop table if exists dim_weather;
drop table if exists T;
drop table if exists time_dimension;
drop table if exists dim_time;
drop table if exists temptime;

/*-------Create Dim_Store---------*/

create table dim_store as
  select 
      store_id,address,
      postal_code,city,
      station_id 
      as store_station_id 
      from store;
    
alter table dim_store 
   add `store_key` int AUTO_INCREMENT PRIMARY KEY first;
   
/*-------Create Dim_Item_Department---------*/

   
 #create dim_item_department table

create table dim_item_department as
select i.*, 
	   v.inventory_id as item_inventory_id, 
       v.quantity as item_inventory_quantity,
       i.department_id as item_department_id, 
       d.department_name as item_department_name,
	   v.store_id as item_store_id
from item i, inventory v, department d
	where i.item_id = v.item_id
	and i.department_id = d.department_id;

alter table dim_item_department 
   add `item_key` int AUTO_INCREMENT PRIMARY KEY first;

/*-------Create Dim_Weather ---------*/

create table dim_weather as
  select *, station_id as weather_station_id
  from `weather event`;

/*-------Create Time Dimension---------*/

drop table if exists T;

create table T as #Temp Table 
   select 
      event_id 
from db_vphan.`weather event`;


/*-------Create Time Span---------*/

select 
   min(date), 
   max(date) 
from `dim_weather`;

SET @d0 = "2012-01-01";
SET @d1 = "2014-10-31";
 
SET @date = date_sub(@d0, interval 1 day);
 
/*-------Set up Time Dimension--------*/

DROP TABLE IF EXISTS time_dimension;
CREATE TABLE `time_dimension` (
  `date_id` varchar(45) NOT NULL,
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
  PRIMARY KEY (`date_id`)
);
 
# populate the table with dates
INSERT INTO time_dimension
SELECT @date := date_add(@date, interval 1 day) as `date`,
    date_format(@date, "%Y%m%d") as date_id,
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

drop table T;

/*-------Create Dim_Time as a combination of dim_weather and time dimension ---------*/

create table dim_time as
  select 
    dim_weather.*,
    date_id, 
    date_year,
    date_month,
    date_day,
	date_year_week,
    date_week,
    date_quarter,
    date_weekday,
    date_month_name,
    date_day_name
from dim_weather, time_dimension
where dim_weather.date = time_dimension.date;

alter table dim_time 
   add `time_key` int AUTO_INCREMENT PRIMARY KEY first;

  drop table if exists dim_weather;
  drop table if exists time_dimension;
  
#Truncate the dim_time to the weekly level from the above daily level
drop table if exists temptime;
create table temptime as 
select tmax,tmin,tavg,depart,dewpoint,wetbulb,heat,cool,sunrise,sunset,codesum,snowfall,preciptotal,stnpressure,sealevel,resultspeed,resultdir,avgspeed,weather_station_id, date_id, min(date) as weekbegin, date_week, date_month, date_quarter, date_year
from dim_time 
group by date_year, date_quarter, date_month, date_week 
order by weekbegin;

select * from temptime;

/*--------------------------------Temp Tables--------------------------------*/

drop table if exists tempweather;
create table tempweather as
select * from `weather event`;

drop table if exists tempstation;
create table tempstation as
select * from station;

drop table if exists tempstore;
create table tempstore as
select * from store;

drop table if exists tempinventory;
create table tempinventory as
select * from inventory;

drop table if exists tempitem;
create table tempitem as
select * from item;

drop table if exists templineitem;
create table templineitem as
select * from line_item;

drop table if exists tempsale;
create table tempsale as
select * from sale
order by sale_date;

/*--------------------------------Fact Table--------------------------------*/

drop table if exists fact_sale;
create table fact_sale as
  select 
    dim_time.time_key as time_key,
    dim_item_department.item_key as item_key,
    dim_store.store_key as store_key,
    sum(l.line_units) as sale_quantity,
    sum(l.line_totals) as sale_total,
    dim_time.date_week as sale_week,
    dim_time.date_month_name as sale_month,
    dim_time.date_quarter as sale_quarter,
    dim_time.date_year as sale_year
  from
	  dim_time, dim_item_department, dim_store,
	  tempweather w, tempstation st, tempstore so, tempinventory v, tempitem i, templineitem l, tempsale sa,
      temptime tp
  where
      w.station_id = st.station_id
      and st.station_id = so.station_id
      and so.store_id = v.store_id
      and v.item_id = i.item_id
      and i.item_id = l.item_id
      and l.sale_id = sa.sale_id
      
      and dim_time.time_key = w.event_id
	  and dim_store.store_key = so.store_id
      and dim_item_department.item_key = i.item_id
      
      and tp.weekbegin <= date(sa.sale_date)
      and date_add(tp.weekbegin, interval 7 day) > date(sa.sale_date)
group by store_key, item_key, time_key, sale_year, sale_quarter, sale_month, sale_week
order by sale_year, sale_quarter, sale_month, sale_week;


/*--------------------------------Adjusted Foreign Keys--------------------------------*/

ALTER TABLE `db_vphan`.`fact_sale` 
CHANGE COLUMN `time_key` `time_key` INT(11) NOT NULL ,
CHANGE COLUMN `item_key` `item_key` INT(11) NOT NULL ,
CHANGE COLUMN `store_key` `store_key` INT(11) NOT NULL ,
ADD PRIMARY KEY (`time_key`, `item_key`, `store_key`),
ADD INDEX `Foriegn Item_idx` (`item_key` ASC),
ADD INDEX `Foriegn Store_idx` (`store_key` ASC);
ALTER TABLE `db_vphan`.`fact_sale` 
ADD CONSTRAINT `Foreign Time`
  FOREIGN KEY (`time_key`)
  REFERENCES `db_vphan`.`dim_time` (`time_key`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Foriegn Item`
  FOREIGN KEY (`item_key`)
  REFERENCES `db_vphan`.`dim_item_department` (`item_key`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Foriegn Store`
  FOREIGN KEY (`store_key`)
  REFERENCES `db_vphan`.`dim_store` (`store_key`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*--------------------------------Drop Tables--------------------------------*/

drop table if exists tempweather;
drop table if exists tempstation;
drop table if exists tempstore;
drop table if exists tempinventory;
drop table if exists tempitem;
drop table if exists templineitem;
drop table if exists tempsale;


/*--------------------------------View Tables--------------------------------*/

select * from fact_sale;
select * from dim_time;
select * from dim_item_department;
select * from dim_store;

