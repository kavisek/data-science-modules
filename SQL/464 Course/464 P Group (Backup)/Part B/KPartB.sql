use db_kavi;

#Star Schema

#dim_weather: (weather_key (PK), event_id, tmax,tmin,tavg,depart,dewpoint,wetbulb,heat,cool,sunrise,sunset,codesum,snowfall,preciptotal,stnpressure,sealevel,resultspeed,resultdir,avgspeed,weather_station_id)

#dim_store: (store_key (PK), store_id, store_address, store_postal_code, store_city, store_station_id)

#dim_item: (item_key (PK), item_id, item_name, item_description, item_type, item_unit_price, item_store_id, item_inventory_id, item_inventory_quantity, item_department_id)

#dim_department: (department_key (PK), department_id, department_name)

#dim_date: (date_key (PK), date, date_year, date_month, date_day, date_year_week, date_week, date_quarter, date_weekday, date_month_name, date_day_name)

#fact_sale: (sale_key, store_key, weather_key, item_key, department_key, sale_date, sale_quantity, sale_total) ????
 

/*--------------------------------Dropping Tables--------------------------------*/


drop table if exists dim_weather;
drop table if exists dim_store;
drop table if exists dim_item_department;
drop table if exists dim_department;
drop table if exists T;
drop table if exists time_dimension;
drop table if exists dim_weather_time;
drop table if exists fact_sale;

/*-------Create Dim_Weather ---------*/


create table dim_weather as
  select *, station_id as weather_station_id
  from `weather event`;
alter table dim_weather
  add `weather key` int auto_increment primary key first;

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
select i.*, i.department_id as item_department_id, d.department_name as item_department_name, v.inventory_id as item_inventory_id, 
     v.quantity as item_inventory_quantity, v.store_id as item_store_id
from item i, inventory v, department d
where i.item_id=v.item_id
      and i.department_id = d.department_id;


/*-------Create Dim_Date Time Dimension---------*/

drop table if exists T;

create table T as #Temp Table 
   select 
      event_id 
from db_kavi.`weather event`;


/*-------Create Time Span---------*/


select 
   min(date), 
   max(date) 
from `weather event`;

SET @d0 = "2012-01-01";
SET @d1 = "2014-10-31";
 
SET @date = date_sub(@d0, interval 1 day);
 
/*-------Set up Dim_Date and Time Dimensions--------*/


drop table if exists T;

create table T as select event_id from db_kavi.`weather event`;
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

drop table T;


/*--------------------------------View Tables--------------------------------*/


create table dim_weather_time as
  select 
  dim_weather.*,
    id,
    y,
    m,
    d,
    yw,
    w, 
    q,
    wd,
    m_name,
    wd_name
  from dim_weather, time_dimension
  where dim_weather.date = time_dimension.date;

  drop table if exists dim_weather;
  drop table if exists time_dimension;

/*--------------------------------View Tables--------------------------------*/

drop table if exists fact_sale;
create table fact_sale as
  select 
    dim_weather_time.event_id as weather_id,
    dim_item_department.item_id as item_id,
    dim_store.store_key as store_id,
    dim_weather_time.id as id,
    dim_weather_time.y as y,
    dim_weather_time.m as m,
    dim_weather_time.d as d,
    dim_weather_time.yw as yw,
    dim_weather_time.w as w,
    dim_weather_time.q as q,
    dim_weather_time.wd as wd,
    dim_weather_time.m_name as m_name,
    dim_weather_time.wd_name as wd_name
    #sum(line_item.line_units) as sale_quantity,
    #sum(dim_item_department.item_unit_price*line_item.line_units) as sale_total
  from 
      dim_weather_time, 
      dim_store, 
      dim_item_department,
      line_item,
      sale
  where
      dim_weather_time.date = sale.sale_date
      and dim_item_department.item_store_id = sale.store_id
      and sale.sale_id = line_item.sale_id
      #and line_item.item_id = dim_item_department.item_id
  group by weather_id, item_id, store_id, m
  limit 10;



/*--------------------------------View Tables--------------------------------*/

select * from fact_sale;
select * from dim_item_department;
select * from dim_weather_time;



