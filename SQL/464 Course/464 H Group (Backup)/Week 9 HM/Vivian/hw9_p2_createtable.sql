drop table if exists january_sales;
create table january_sales (
	sale_date timestamp COMMENT '',
    store_id int not null COMMENT '',
    sale_id int not null COMMENT '',
    sale_total varchar(45) COMMENT '',
PRIMARY KEY (`sale_id`)  COMMENT '');

insert into january_sales (sale_date, store_id, sale_id, sale_total)
select sale_date, store_id, sale_id, ROUND((RAND() * (1000000-100000))+100000)
from sale
where month(sale_date) = 1;

select * from january_sales;