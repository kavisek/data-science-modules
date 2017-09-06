create table fct_sales as
select (line_units*item_unit_price) as `Line Total`,

so.store_id as store_key, we.`event_id` as weather_key, s.sale_id as sale_key, i.item_id as item_key, td.date ### dimension keys

### here keep the Sakila ERD in view to identify the tables you need and the joins
from `weather event` as we, station as sa, store as so, sale as s, line_item as li,item as i, time_dimension as td
where we.station_id=sa.station_id
and sa.station_id=so.store_id
and so.store_id=s.store_id
and s.saleorderid=li.saleorderid
and li.item_id=i.item_id
and we.date = td.date
group by store_key, weather_key, sale_key, item_key,td.date
order by td.date;

#This doesn't work ^



create table fct_sales as
select line_totals,so.store_id as store_key, we.`event_id` as weather_key, s.saleorderid as sale_key, i.item_id as item_key, td.date ### dimension keys

### here keep the Sakila ERD in view to identify the tables you need and the joins
from `weather event` as we, station as sa, store as so, sale as s, line_item as li,item as i, time_dimension as td
where we.station_id=sa.station_id
and sa.station_id=so.store_id
and so.store_id=s.store_id
and s.saleorderid=li.saleorderid
and li.item_id=i.item_id
and we.date = td.date
order by td.date;




create table fct_sales as;