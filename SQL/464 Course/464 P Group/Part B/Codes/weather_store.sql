use db_shiqiz;

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


