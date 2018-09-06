# Joins 1

describe text.stocks; 
describe text.nation ; 
select * from stock, nation

select * from stock, nation where stock.nation = nation.natcode;
select count(*) from stock;
select count(*) from nation;

#Joins 2

select natname, stkfirm, stkprice, stkqty, exchrate,
	stkprice*stkqty*exchrate as stkvalue
		from stock,nation
			where stock.natcode = nation.natcode
				order by natname, stkfirm;


# Group By 1

select count(*),from stock
	group by natcode;

# Group By 2

select count(*) as NumOfStocks, natcode. from stock
	group by natcode;
	group by NumOfStocks;


select * from stock;

# Group By 3 + Labeling

select SUM(stkprice*stkqty*exchrate), n.natname. from stock
	from stock s, nation n
	where s.natcode = n.natcode
	group by n.natcode
	order by n.natcode

# Having 


select SUM(stkprice*stkqty*exchrate), n.natname. from stock
	from stock s, nation n
	where s.natcode = n.natcode
	group by n.natcode
	having NumOfStocks > 2
	order by n.natcode;





select natcode; sum(stkqty * stkdiv), count(*) as NumOfStocks
	from stock
	group by natcode
	having NumOfStocks >= 3;



###Lecture 3

#Data Abnomalities

use db_kulbeers;  ####HERE USE YOUR OWN db_yourSFUID
drop table stock;
drop table nation;  

CREATE TABLE nation 
( natcode CHAR( 3), 
natname VARCHAR( 20), 
exchrate DECIMAL( 9,5), PRIMARY KEY( natcode));

CREATE TABLE stock 
(stkcode CHAR( 3), 
stkfirm VARCHAR( 20), 
stkprice DECIMAL( 6,2), 
stkqty DECIMAL( 8), 
stkdiv DECIMAL( 5,2), 
stkpe DECIMAL( 5), 
natcodex CHAR( 3), 
PRIMARY KEY( stkcode), 
CONSTRAINT fk_has_nation FOREIGN KEY( natcodex) 
REFERENCES nation( natcode) ON DELETE RESTRICT);

select * from stock; select * from nation;


insert into nation values ('UK','United Kingdom',1);
insert into nation values ('USA','United States',0.67);
insert into nation values ('AUS','Australia',0.46);
insert into nation values ('IND','India',0.0228);

insert into nation values ("CAN", "Canada", 0.78); #Need to enter the foriegn key first
insert into stock values ("TEL", "Telus", 50, 1000000, 1.5, 16, "CAN");  #WILL NOT GIVE an ERROR



# Correlated Subquery 

select * from stock
where stkqty = (select max(stkqty from s1.natcode = s2.natcode = 'UK'))



#Creating Model and importing 

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_kulbeers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_kulbeers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_kulbeers` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_kulbeers` ;

-- -----------------------------------------------------
-- Table `db_kulbeers`.`nation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_kulbeers`.`nation` (
  `natcode` INT NOT NULL COMMENT '',
  `natname` VARCHAR(45) NULL COMMENT '',
  `exchangeRate` VARCHAR(3) NULL COMMENT '',
  PRIMARY KEY (`natcode`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_kulbeers`.``
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_kulbeers`.`` (
  `stkcode` INT NOT NULL COMMENT '',
  `stkname` VARCHAR(45) NOT NULL COMMENT '',
  `stockdiv` DECIMAL(3) NULL COMMENT '',
  `stockpe` DECIMAL(3) NULL COMMENT '',
  `stkqty` INT NULL COMMENT '',
  `nation_natcode` INT NOT NULL COMMENT '',
  PRIMARY KEY (`stkcode`, `nation_natcode`)  COMMENT '',
  INDEX `fk__nation_idx` (`nation_natcode` ASC)  COMMENT '',
  CONSTRAINT `fk__nation`
    FOREIGN KEY (`nation_natcode`)
    REFERENCES `db_kulbeers`.`nation` (`natcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


#using this table 

use db_kulbeers
select * from stock;
select * from nation;

drop table stock;
drop table nation; # delete stocks table before nation 

#-------- Homework Answers Add-on 1


use bigpvfc;
select bigpvfc.customerid, count(*)
from bigpvfc.order_t
where bigpvfc.customerid >= 2 and customerid <=4 or customerid = 3
group by customerid;


select * 
from bigpvfc.customerid
where bigpvfc.customeName like "&furniture" #using the wildcard character %;


select count(*)
from bigpvfc.customer_t
where bigpvfc.customerpostalcode is NULL;


select bigpvfc.customerpostalcode as pc #quick check
from bigpvfc.customer_t
order by pc;


select rating, count(*)
from sakila.film
group by rating;

select count(*), rental_date as DateRented
from sakila.rental
group by rental_date;
order by RentalVolmue desc;



#-------- Homework Answers Add-on 2

#c)

use bigpvfc;
select orderid, orderdate, 
(select count(*) from order_t as o1 
where o1.orderdate <= o2.orderdate) as RunningTotal
from order_t o2
order by orderdate;

#2)Merging dirty external data with clean data
# -temporary table with all varchar fields in the database have minimal constraints 
# - import load data in infile
# - use sql to clean and delete dirty data 
# - transfer data to destination
# - google extract transfer load (ETL)
# - create table as (select * from the database)



use text;
select * from sale,


Q3, Q7, Q8: for the exam!

identify for bigpvfc!!!??

Midterm Notes

- 15-20: from the back of the chapters 3-6
- some extension of those questions
- chaptes 7 content
- 5 muiltiple choice


Lecture 5

use adventureworks;
show table
select count(*) from customer:
describe customer;
select distinct customertype from customer;
select distinct territoryid from customer;

# how many combinations of customers and territoryid
# selcet distinct combinations of field 1 and field 2 and field 3

select distinct customertype, territoryid from customer;
order by territoryid;

select customertype, territoryid from customer;
group by customertype, territoryid;

select customertype, territoryid, count(*) countofCust
from customer
group by customertype, territoryid;

# Compute thes total value of sales for each item by date


# total value, date , itemname, 



use text;
select sum (lineqty*lineprice), salesdate , i.item, itemname, count(*), sum(lineqty)
from sales as s, linetime as lt, item as i
where s.saleno = lt.salerno and lt.itemno = i.itemno
group by itemno, saledate
order by itemname;




select distinct i.itemno, salesdate
from sales as s, linetime as lt, item as i
where s.saleno = lt.salerno and lt.itemno = i.itemno
;

select *
from sales as s, linetime as lt, item as i
where s.saleno = lt.salerno and lt.itemno = i.itemno

# List all the type of F that have not been sold

describe item; 
select * from item;
# step 1 - craete a list all items of type that have been sold
## F has been sold

select *
from lineitemar lt, item as i
where llt.itemno = i.itemno
and itemtype = "F";


# step 2 - Query 2: find whcich ones intable ITEM

			#step 2 find which ones in table item do not appear in Query 1

			#select * from item
			#where itemno not in (select itemno from query1)

			select * from item
			where itemno not in (select distinct lt.itemno
			from lineitem lt, item i
			where lt.itemno = i.itemno
			and itemtype = 'F') and itemtype = 'F';


#that means all items type F has been sold been sold at least once



#C5Q7 b, d, f, h, j, 

#b how many donors are in the donor table 

use text:
select count(donorno)
from gift

#c how many people made donations in 1999?

use text;
select count(donorno)
from gift
where year = 1999
order by donorno;

#d what is the name of the person who made the largest donation in 1999 


use text;
select donorno, dlname, dfname year, Max(amount)
from gift, donor
where 
	gift.donorno = donor.donorno
	and year = 1999 
order by donorno;

# e What was the total amount donated in 2000?

use text;
select year, sum(amount)
from gift
where year = 2000 
group by year

# f List the donors who have made a donation every year


use text;
select donorno, dlname, dfname year, Max(amount)
from gift, donor
where 
	gift.donorno = donor.donorno
	and year = 
order by donorno;


# g list the donors who give more than twice the average

use text;
select donorno, dlname, dfname year, Max(amount)
from gift, donor
where 
	gift.donorno = donor.donorno
	and (amount>avg(amount))
order by donorno;

# h list the total amount given by each person across all years; sort the report by the donors's name 

# i Report the total donations in 2001 by state

# j in which years did the total donated exceed thee goal for the years


#58



use text;
select * from dept;
select * from emp;

#Lectures
#step 1 


select deptname, avg(empsalary)
from emp, dept, 
where dept.deptname = emp.deptname
group by dept.deptname


select *
from emp as e , 
			(select deptname, avg(empsalary) as avgsal
			from emp, dept, 
			where dept.deptname = emp.deptname
			group by dept.deptname) as x
where 
	x.deptname = e.deptname
	and e.empsalary >= x.avgsal;

selet * from monarch 

select pre.monnname, day(cur.rgnbeg - pre.rgnbeg


	exclude last two subject on the last slide 
	

#Lecture 8 (missed via sickness)

Q: The main data model in chapter 11 includes which entsy?
A: Politcal unit

#Lecture 9 

Q:which step is not a step in creating a data warehouse?
A:Discovery




#Lecture 10

Q: dataware
A: Fact

Notes

- Samia
- Microstrategy Website
- Term Project 
- 

You are looking at the data ware 
Next: the outcome of that dataware

Exam Question

- given and erd diagram, ant create a star schema to anrswer the following questions 
- write a query to the new tables
- 

- indexing 



#Lecture 11 (Missed)

Q: A table in mySQL is called a ________ in R
A: Dataframe

- 



#Lecture 12






















































