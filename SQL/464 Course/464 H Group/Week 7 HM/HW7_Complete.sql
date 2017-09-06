#Part 1: Sketch the star schema implemented by it by examining the dimension and fact tables created. 
#Comment on the similarities between the contents of the DW with the actual Sakila DB by runnning a few SQL queries


# Schema

#dim_customer (customer_key(PK), customer_id, customer_first_name, customer_last_name, customer_email, customer_active, customer_created, customer_address, customer_district , customer_postal_code, customer_phone_number, customer_city, customer_country, customer_version_number, customer_valid_from, customer_valid_through)

#dim_date (date_key (PK) , date_value, date_short, date_medium, date_long, date_full, day_in_week, day_in_year, day_in_month, is_first_day_in_month, is_last_day_in_month, day_abbreviation, day_name, week_in_year, week_in_month, s_first_day_in_week, is_last_day_in_week, is_weekend, month_number, month_abbreviation, month_name, year2, year4, quarter_name, quarter_number, year_quarter, year_month_number, year_month_abbreviation)
 
#dim_film (film_key (PK), film_title, film_description, film_release_year, film_language, film_original_language, rental_duration, rental_rate decimal, duration, replacement_cost, rating_code rating_text, has_trailers, has_commentaries, has_deleted_scenes, has_behind_the_scenes, is_category_action, is_category_animation, is_category_children, is_category_classics, is_category_comedy, is_category_documentary, is_category_drama, is_category_family, is_category_foreign, is_category_games, is_category_horror, is_category_music, is_category_new, is_category_scifi, is_category_sports is_category_travel)


#dim_geography (geography_key (PK) , country_name, country_code, region_name, region_code, city_name, ocal_city_name, longitude)

  
#dim_staff (staff_key ((PK), staff_first_name, staff_last_name, staff_id, staff_store_id, staff_version_number, staff_valid_from staff_valid_through, staff_active)


#dim_store (store_key (PK) , store_id, store_address, store_district, store_postal_code, store_phone_number, store_city, store_country, store_manager_staff_id, store_manager_first_name, store_manager_last_name, store_version_number, store_valid_from, store_valid_through)

#dim_time (time_key (PK) , time_value, time_hour, time_minute)


#fact_rental ( rental_id (PK), rental_date_key, rental_time_key, count_rentals, rental_duration, customer_key (FK), staff_key (FK), film_key (FK), store_key (FK))


# Comments on the similarities between DW and Sakila

# The contents of DW and Sakila are almost the same. The exception is that Sakila has more tables and they are linked using PKs and FKs.
# The tables in DW are sorted as dimensions which consolidate multiple tables from Sakila. For example: dim_store includes contents from 5 Sakila's tables: store, staff, address, city, country
# Some attributes in DW dimensions are different from Sakila tables'   

#Part 2: create a smaller DW with the following dimensions: store, film,
#staff. The fact would remain the same: rental count and rental duration (aver-
#age). Write SQL so that it takes all the data needed from the Sakila DB version
#on the MySQL server

#i) create dim_store dimension

use db_vphan;
drop table if exists dim_store;

create table store as select * from sakila.store;
create table staff as select * from sakila.staff;
create table address as select * from sakila.address;
create table city as select * from sakila.city;
create table country as select * from sakila.country;

create table dim_store as 
select s.store_id as store_id, address as store_address, district as store_district,
postal_code as store_postal_code, phone as store_phone_number, city as store_city, 
country as store_country, staff_id as store_manager_staff_id, first_name as store_manager_first_name,
last_name as store_manager_last_name
from store as s, address a, city ct, country co, staff sf
where s.address_id = a.address_id
and a.city_id = ct.city_id
and ct.country_id = co.country_id
and s.manager_staff_id = sf.staff_id;

ALTER TABLE dim_store
ADD COLUMN store_key INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (store_key);

select * from dim_store;

#ii) create dim_staff dimension

drop table if exists dim_staff;
create table dim_staff as
select first_name as staff_first_name, last_name as staff_last_name,
s.staff_id as staff_id, store_id as staff_store_id, active as staff_active
from staff s;

ALTER TABLE dim_staff
ADD COLUMN staff_key INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (staff_key);

select * from dim_staff;

#iii) create dim_film dimension

drop table if exists dim_film;
create table film as select * from sakila.film;
create table language as select * from sakila.language;
create table film_category as select * from sakila.film_category;
create table category as select * from sakila.category;

create table dim_film as
select f.film_id as film_id, title as film_title, description as film_desription, release_year as film_release_year,
l.name as film_language, original_language_id as film_original_language, rental_duration as rental_duration,
rental_rate as rental_rate, length as duration, replacement_cost as replacement_cost, rating as rating_code,
special_features as film_special_features, c.name as film_category
from film f, language l, film_category fc, category c
where f.language_id = l.language_id
and f.film_id = fc.film_id
and fc.category_id = c.category_id;

ALTER TABLE dim_film
ADD COLUMN film_key INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (film_key);

select * from dim_film;

#iv) create fact rental

drop table if exists fct_rental;
create table rental as select * from sakila.rental;
create table inventory as select * from sakila.inventory;

create table fct_rental as
select r.customer_id as customer_key, r.staff_id as staff_key, f.film_id as film_key, i.store_id as store_key,
r.rental_id as rental_id, count(r.rental_id) as count_rentals, avg(f.rental_duration) as rental_duration
from rental r, inventory i, film f
where r.inventory_id = i.inventory_id
and i.film_id = f.film_id
group by customer_key, rental_id
order by customer_key;

select * from fct_rental;



#Part 3: Modify your SQL code to implement a slightly different star schema with two
#dimensions: store & actor, and fact: payment

#i) create dim_actor dimension

use db_vphan;
drop table if exists dim_actor;

create table actor as select * from sakila.actor;
create table film_actor as select * from sakila.film_actor;

create table dim_actor as
select a.actor_id as actor_id, first_name as actor_first_name, last_name as actor_last_name,
f.film_id as film_id, title as film_title
from actor a, film_actor fa, film f
where a.actor_id = fa.actor_id
and fa.film_id = f.film_id;

ALTER TABLE dim_actor
ADD COLUMN actor_key INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (actor_key);

select * from dim_actor;

#ii) create dim_store dimension

drop table if exists dim_store;

create table dim_store as 
select s.store_id as store_id, address as store_address, district as store_district,
postal_code as store_postal_code, phone as store_phone_number, city as store_city, 
country as store_country, staff_id as store_manager_staff_id, first_name as store_manager_first_name,
last_name as store_manager_last_name
from store as s, address a, city ct, country co, staff sf
where s.address_id = a.address_id
and a.city_id = ct.city_id
and ct.country_id = co.country_id
and s.manager_staff_id = sf.staff_id;

ALTER TABLE dim_store
ADD COLUMN store_key INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (store_key);

select * from dim_store;

#iii) create fct_payment

drop table if exists fct_payment;
create table payment as select * from sakila.payment;

create table fct_payment as
select p.payment_id as payment_id, i.store_id as store_key, f.actor_id as actor_key, 
p.rental_id as rental_key, p.amount as payment_amount 
from payment p, rental r, inventory i, film_actor f
where p.rental_id = r.rental_id
and r.inventory_id = i.inventory_id
and i.film_id = f.film_id
group by payment_id, rental_key
order by payment_id;

select * from fct_payment;

#Part 4: List 2 verification questions and 2 discovery questions that are most interesting for you

# Verfication: Family movies with PG-rating are usually the most popular. Verify if PG-rated movies are the most rented movies.
# Verfication: Verify if movies with high replacement costs (new movies) are rented out more often than older/cheaper movies.
# Discovery: Which staff members have rented out the most movies in each film category?
# Discovery: What are the most rented movie categories for each day of the week?