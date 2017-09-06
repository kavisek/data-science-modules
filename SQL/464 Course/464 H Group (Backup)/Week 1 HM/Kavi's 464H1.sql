


------------


#1.	Database: ‘bigpvfc’. Copy/paste your SQL queries below after testing that they work. 
#a)	Examine the schema for employee_t. What are the problems with that schema?

use bigpvfc;
SELECT * FROM bigpvfc.employee_t;

#Problems
1) 

# EmployeeCity and EmployeeSupervisor should NOT BE A Character datatype
# Unique insfx value should be selected for EmployeeID
# Em 


#b)	Using three separate queries find the number of orders placed by customers with id = 2, 3 & 4. (use tables: order_t)

use bigpvfc;
SELECT COUNT(*) as order_number FROM bigpvfc.order_t WHERE CustomerID = 2;

use bigpvfc;
SELECT COUNT(*) as order_number FROM bigpvfc.order_t WHERE CustomerID = 3;

use bigpvfc;
SELECT COUNT(*) as order_number FROM bigpvfc.order_t WHERE CustomerID = 4;

#c)	Find all customers who have “furniture” as a part of their name. 

use bigpvfc;
SELECT * FROM bigpvfc.customer_t WHERE CustomerName REGEXP 'furniture';

#d)	Find customers for which there is no postal code recorded.

use bigpvfc;
SELECT * FROM bigpvfc.customer_t WHERE CustomerPostalCode IS NULL;

------------


#2.	Database: ‘sakila’. Copy/paste your SQL queries below after testing that they work.

#a)	List the unique types of ratings given to films? (use table ‘film’)

use sakila;
SELECT DISTINCT rating FROM sakila.film;

#b)	Find the first and last rental dates in the table ‘rental’. 

use sakila;
SELECT MAX(rental_date) as max_date, MIN(rental_date) as min_date FROM sakila.rental

#c)	What is the average amount in a rental transaction? Use the Payment table. 

use sakila;
SELECT AVG(amount) AS avr_amount FROM sakila.payment;




------------

#3.	Converting a spreadsheet to INSERT statements

#a)	Follow the instructions at http://www.richardtwatson.com/dm6e/Reader/labs/insert.html . You only need to upload the Excel file you generate for the shr table. 

Please Look at Attached Excel Document Q3A shr (completed)

#b)	Use the LOAD DATA INFILE (look on the Internet) command to accomplish the same outcome – that is, loading an external (.txt format) dataset into a MySQL table.

LOAD DATA LOCAL INFILE 
'/Users/rtw/desktop/share.txt'   INTO TABLE SHARE 
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'" 
LINES TERMINATED BY '\r’

FC,'Freedonia Copper',27.5,10529,1.84,16
PT,'Patagonian Tea',55.25,12635,2.5,10
AR,'Abyssinian Ruby',31.82,22010,1.32,13
SLG,'Sri Lankan Gold',50.37,32868,2.68,16
ILZ,'Indian Lead & Zinc',37.75,6390,3,12
BE,'Burmese Elephant',0.07,154713,0.01,3
BS,'Bolivian Sheep',12.75,231678,1.78,11
NG,'Nigerian Geese',35,12323,1.68,10
CS,'Canadian Sugar',52.78,4716,2.5,15
ROF,'Royal Ostrich Farms',33.75,1234923,3,6


