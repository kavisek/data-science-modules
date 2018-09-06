1.	Database: ‘bigpvfc’. Copy/paste your answers to the queries below after testing that they work.

a)	List each customer name, address and the number of orders each has placed. (use tables: customer_t, order_t)

select customer_t.CustomerName, customer_t.CustomerAddress, Count(orderid) as NumberOrdered
from order_t
inner join customer_t on Order_t.CustomerID=Customer_t.CustomerID
group By CustomerName;

b)	List only name and address of customers who have placed more than two orders.

select customer_t.CustomerName, customer_t.CustomerAddress, Count(orderid) as NumberOrdered
from order_t
inner join customer_t on Order_t.CustomerID=Customer_t.CustomerID
group by CustomerName
having count(orderid) >2;

c)	List the running total of the number of total number of orders placed till date as they come in (use table: order_t).

set @runningtotal :=0;
select ordernew.Orderdate,
(@runningtotal := @runningtotal + ordernew.count) as Running_Total
From
	(select count(orderid) as count, Orderdate
	from order_t group by orderdate) as ordernew
	order by orderdate;



2.	Database: ‘sakila’. Copy/paste your answers to the queries below after testing that they work.
While an employee at Sakila, you have been asked to integrate the ‘film’ table with an additional database 
of movies from http://www.hometheaterinfo.com/dvdlist.htm. The reason is that Sakila may expect a large 
shipment of additional movies and may add it to their catalog. Import the entire film file from the above 
URL (.csv format), store it as a separate table in your database. Then select a set of movies from the 
imported list based on an appropriate criteria and update the ‘film’ table with the additional movies. 
This is an open-ended question. The entire procedure should be saved as an SQL script – so that you can 
always re-use it in the future. This is messy. Do what you can. Write what you did and what you found. 
And make reasonable assumptions. 

1) Created a copy of the film table on my personal database

2) first thing we did was download and save the .txt file.

3) Create the table in the database & imported the data.

CREATE TABLE newFims(
DVD_Title VARCHAR( 255), 
Studio VARCHAR( 255), 
Released Timestamp,
Status VARCHAR( 255), 
Sound VARCHAR( 255), 
Version VARCHAR( 255), 
Price DECIMAL( 6,2),
Rating VARCHAR(255), 
Year  VARCHAR( 255), 
Genre VARCHAR( 255), 
Aspect VARCHAR( 255), 
UPC DECIMAL( 50,10),
DVD_ReleaseDate Timestamp
ID DECIMAL( 10,2),
Time Stamp Timestamp

PRIMARY KEY( UPC),;


LOAD DATA LOCAL INFILE 
'/Users/Kavi/desktop/dvd.txt'   INTO TABLE newFilm
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'" 
LINES TERMINATED BY '\r';



4) Select a set of movies from Table (newFims) the imported list based on an REGEXP 'furniture' and update the 
‘film’ table with the additional movies. 

insert into kulbeers.film #insert into another table
select DVD_Title from kulbeesr.newFilms
where DVD_Title REGEXP 'furniture'














