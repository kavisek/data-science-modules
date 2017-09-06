use db_vphan;

create table payment
as select * from sakila.payment;

create table rental
as select * from sakila.rental;

create table customer
as select * from sakila.customer;

create table address
as select * from sakila.address;

create table city
as select * from sakila.city;

create table store
as select * from sakila.store;

select 	c.customer_id, 
		first_name,
        last_name,
        count(payment_id) as NumofTransactions
from customer c, payment p
where c.customer_id = p.customer_id
group by c.customer_id
order by NumofTransactions desc limit 10;

#top 5 with address
select 	c.customer_id, 
		first_name,
        last_name,
        count(payment_id) as NumofTransactions,
        a.address_id,
        address,
        district,
        postal_code,
        ct.city_id,
        city
from customer c, payment p, address a, city ct
where c.customer_id = p.customer_id
and c.address_id = a.address_id
and a.city_id = ct.city_id
group by c.customer_id
order by NumofTransactions desc limit 5;

ALTER TABLE `db_vphan`.`customer` 
ADD INDEX `coordinates_customer` (`customer_id` ASC)  COMMENT '';

ALTER TABLE `db_vphan`.`city` 
ADD INDEX `coordinates_city` (`city_id` ASC)  COMMENT '';


create table coordinates (
		customer_id	smallint(5) unsigned, 
        address_id	smallint(5) not null,
        city_id		smallint(5) unsigned,
        coordinates point not null,
		PRIMARY KEY (address_id),
        CONSTRAINT fk_coordinates_customer FOREIGN KEY(customer_id) 
			REFERENCES customer(customer_id),
		CONSTRAINT fk_coordinates_city FOREIGN KEY(city_id) 
			REFERENCES city(city_id)); 

#Assume x,y coordinates of each city of the top 5 customers are the actual x,y coordinates of their postal code

insert into coordinates values
		('148', '152', '442', geomfromtext('point(2.33 48.93)'));
insert into coordinates values
		('526', '532', '101', geomfromtext('point(-82.13 26.65)'));
insert into coordinates values
		('236', '240', '527', geomfromtext('point(120.76 14.34)'));
insert into coordinates values
		('144', '148', '340', geomfromtext('point(26.60 54.25)'));
insert into coordinates values
		('75', '79', '108', geomfromtext('point(120.53 24.07)'));

Alter table store
	Add store_coordinates point not null;
    
#Assume the store coordinates are the coordinates of the cities where the stores locate

update store set store_coordinates = geomfromtext('point(-112.99 49.69)')
				where store_id = 1 limit 1;

update store set store_coordinates = geomfromtext('point(153.09 -27.63)')
				where store_id = 2 limit 1;

#find distance
select 	orig.address_id as from_store_address,
		dest.address_id as to_customer_address, 
        GLength(LineString(orig.store_coordinates,dest.coordinates))*37.5  as distance_in_kims
from store orig, coordinates dest
where orig.address_id <> dest.address_id
order by orig.address_id asc;

