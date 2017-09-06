drop table if exists fact_sale;
create table fact_sale as
  select 
    dim_weather_time.event_id as weather_id,
    dim_item_department.item_id as item_id,
    dim_store.store_id as store_id,
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
      #DateIds
      dim_weather_time.date = sale.sale_date
      
      #store_ids
      and sale.store_id = dim_store.store_id
      and dim_item_department.item_store_id = dim_store.store_id
      and sale.store_id = dim_item_department.item_store_id
      
      #Sale Ids
      and sale.sale_id = line_item.sale_id
      
      #Items Ids
      and line_item.item_id = dim_item_department.item_id
      
      #Station Ids
      and dim_store.store_station_id = dim_weather_time.station_id
  #group by weather_id, item_id, store_id, m
  limit 1;

select * from fact_sale;
select * from dim_item_department;
select * from dim_weather_time;

#line_item
#sale
