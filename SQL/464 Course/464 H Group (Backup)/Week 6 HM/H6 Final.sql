#1.	Spatial data: You will extend the Sakila database with your own randomly created geospatial data as follows. 

#Copy the necessary tables from Sakila to your space on the SQL server

use db_vphan;

create table payment
as select * from sakila.payment;

create table customer
as select * from sakila.customer;

create table address
as select * from sakila.address;

create table city
as select * from sakila.city;

create table store
as select * from sakila.store;

#Find 10 customers who have the most number of transactions

select 	c.customer_id, 
		first_name,
        last_name,
        count(payment_id) as NumofTransactions
from customer c, payment p
where c.customer_id = p.customer_id
group by c.customer_id
order by NumofTransactions desc limit 10;


# Top 5 with address

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



#Extend or add the Sakila database so as to accommodate the point coordinates of the cities/zip codes that the five customers live in (based on the zip code)

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

# Assume x,y coordinates of each city of the top 5 customers are the actual x,y coordinates of their postal code

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



#Alter the Store table so that it can capture the coordinates of each store

Alter table store
	Add store_coordinates point not null;
  
# Assume the store coordinates are the coordinates of the cities where the stores locate

update store set store_coordinates = geomfromtext('point(-112.99 49.69)')
				where store_id = 1 limit 1;

update store set store_coordinates = geomfromtext('point(153.09 -27.63)')
				where store_id = 2 limit 1;



#Query that calculates the distance of each of the top customers from each of the stores

select 	orig.address_id as from_store_address,
		dest.address_id as to_customer_address, 
        Round(GLength(LineString(orig.store_coordinates,dest.coordinates)))*37.5 as distance_in_kms
from store orig, coordinates dest
where orig.address_id <> dest.address_id
order by orig.address_id asc;


#2. A bit of practice with manipulating datetime values. Consider the database expia (table ‘train). This table contains data about the internet searches for hotels by Expedia users. Copy 10000 records to your database space as follows:
###take special care to limit to 10000 records, not more since train is a large table. If you ignore this limit, the server might hang up. create table db_<your sfuemailid>.BUS464Assign as select * from train limit 10000;  Next, work solely on the new table. Change the format of the dttime field to ‘datetime’ and answer the following questions by referring to the datetime functions at http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html . Copy the answer here.


#i. Which year(s) does the data pertain to?

use db_kulbeers;
drop table train;
create table train
as select * from expia.train
limit 10000;

ALTER TABLE `db_kulbeers`.`train` 
CHANGE COLUMN `dttime` `dttime` DATETIME NULL DEFAULT NULL COMMENT '' ;

use db_kulbeers;
select
    EXTRACT(year FROM dttime) as Years_of_Data
from train
group by EXTRACT(year FROM dttime)
order by EXTRACT(year FROM dttime);


#ii. Extract the hour of the day for each search result and find which hour has the most number of searches?

use db_kulbeers;
select 
	EXTRACT(hour FROM dttime) as Hour_of_the_Day, 
    count(srch_id) as Number_of_Searches
from train
group by Hour_of_the_Day;


#iii. Which FIVE weeks of the year saw the highest number of searches?

use db_kulbeers;
select 
	EXTRACT(week FROM dttime) as Week, 
    count(srch_id) as Number_of_Searches
from train
group by Week
order by Number_of_Searches desc
limit 5;


#iiii. Which weekdays saw the lowest number of searches? Any guesses why? 

use db_kulbeers;
select 
    EXTRACT(day FROM dttime) as Day,
    weekday(dttime) as Type_of_Day,
    count(srch_id) as Number_of_Searches
from train
where weekday(dttime) < 5
group by Day
order by Number_of_Searches;

#Guess: The visiting_location_country_id are in the same range of locations, probably meaning something was happening on those dates, in that country that restrict access or affectet the results.


#3.  The following questions pertain to the data model discussed by the Industry Speaker and provided with this assignment. (Eric Leung, Beedie School of Business)

#i.  Find the all students and their email address (if available) who are currently on the waitlist for BUS464 in Fall 2015 (1157). Note: You should notice some students do not have an email address -- Use LEFT, RIGHT JOINS. 

use db_chunkinl;
select ce.stakeholder_id stdid, first_name, last_name, email
from stakeholders s join course_enrollments ce 
right join emails e on ce.stakeholder_id = e.stakeholder_id 
and s.stakeholder_id = ce.stakeholder_id 
where (course_offering_id = 1) and (enrollment_status = 'Waitlist');


#ii. Find the name of students who are enrolled in a course taught by a professor who wrote an article called "Market positioning by IT Service Vendors through imitation".

use db_chunkinl;
select first_name, last_name
from stakeholders as s, course_enrollments as ce
where s.stakeholder_id=ce.stakeholder_id
and course_offering_id = 1;


#iii. Find a list of stakeholders without an email address

use db_chunkinl;
select s.stakeholder_id, last_name, first_name
from stakeholders s
left join emails e
on s.stakeholder_id = e.stakeholder_id
where e.stakeholder_id is null;


#iv. Find a list of stakeholders with more than one email addresses

use db_chunkinl;
select e.stakeholder_id, last_name, first_name, count(email) as NumofEmails
from stakeholders s
inner join emails e
on s.stakeholder_id = e.stakeholder_id
group by e.stakeholder_id having NumofEmails > 1 
order by NumofEmails desc;

