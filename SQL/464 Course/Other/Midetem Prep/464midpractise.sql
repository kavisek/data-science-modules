#Answers


#QQ: (somethinga about a 1toM relationship) A:All of the above
#QQ: A: Multiplicity of data sources
#QQ: What is MYSQL Workbench A:Client
#QQ: any m:m to relationship can be seen as A: 2 1;M relationship
#QQ: whicho foreign key A:  none of the above




#Notes

CREATE DATABASE dbname;



- Where can be used with in and not in
- referential integrity constraint (if F must P)
- associative entity is the one created for a many to many relationship
- exist -> one true row
- not exist -> all rows are a no true row
- forall???
- self-referential foreign key constrint: 
- self-join


- insert: cannot insert data about exchange rate 
- delete: deleting data about a stock transaction will also delete information about exchange rate
- update: since exchange rates vary, one cannot capture new exchange rate without first executing a stock transaction




---- Chapter  3



#3.1a Done
#3.1b Done
#3.1c Done 
#3.1d Done

#3.2a


select
	shrfirm,
	shrcode
from share


#3.2b


select
	* 
from share
where shrprice < 1

#3.2c

select
	* 
from share
where shrprice >= 10

#3.2d

select
	* , 
    (shrqty*shrprice) as Value
from share


#3.2e

select
	* , 
    (shrprice/shrdiv)/100 as yield
from share
where (shrprice/shrdiv)/100 >.05

#3.2f

select
	* , 
    (shrqty*shrdiv)
from share
where shrfirm = "Patagonian Tea"


#3.2g



#3.2h

select
	* , 
    min(shrprice/shrdiv)/100 as yield
from share

#3.2i


#3.2j

select
	*, 
	max(shrdiv*shrqty)
from share

#3.2k

select
	*, 
	(shrqty*shrprice) as Value
from share
where shrfirm = "Abyssinian Ruby" or shrfirm = "Sri Lankan Gold"

#3.2l

select
	*, 
	(shrqty*shrprice) as Value
from share
where not shrfirm = "Bolivian Sheep" and not shrfirm = "Canadian Sugar"

#3.2m
select
	sum(shrqty*shrprice) as Value
from share


#3.2n

select
	*,
    (shrqty*shrprice) as Value
from share
order by Value desc

#3.2o

select
	*
from share
where shrfirm REGEXP "Gold"

#3.2p

select
	*
from share
where shrcode REGEXP "^B"


#3.3a no little s
#3.3b no big S
#3.3c no little or big S|s
#3.3d no big S, in first part of the string
#3.3e no s at the end of a string

#3.4a

select
	avg(alheads)
from alien
	

#3.4b

select
	alnum,
	max(alheads)
from alien
	

#3.4c


select
	alnum,
    alname
from alien
where alname regexp 'oo';
	

#3.4d

select
	alnum,
    alname,
    alcolor
from alien
where alcolor = "chartreuse"

#3.4e

	alnum,
    alname,
    alcolor,
    alsmell
from alien
order by  alcolor, alsmell


#3.5a you shoud order your books by isbn of a book id
#3.5b orgnize them,book category, alphabetically then by isbn/bookid
#3.5c no 

#3.6 an entities primary key
#3.7 they are object of information that relate a real world application, containing theses own attributes 
#3.8 the entity integrity rule is that every foriegn key needs a primary key within an another table



---- Chapter  4




#4.2a

SELECT 
	* 
FROM stock
where natcode = "AUS"


#4.2b
#4.2c

use text;
Select 
	natname, SUM(stkqty*stkdiv)
from stock
inner join nation
	on nation.natcode = stock.natcode
group by natname


#4.2e

SELECT
	natname, 
    sum(stkdiv*stkqty*exchrate)
from stock
inner join nation
	on nation.natcode = stock.natcode
group by natname

#4.2g

SELECT
	natname, 
 	avg(stkdiv/stkprice*100) as Yield,
from stock
inner join nation
	on nation.natcode = stock.natcode
group by natname
having avg(stkdiv/stkprice*100) > (select avg(stkdiv/stkprice*100)from stock)


#4.3

# I would use the convert.exchrate clause within my select statement for all the values effected, of source the number for conversion in the statement

#4.4

#A foriegn key in a relation database serves the role of connect relating that different tables in a database together, showing the threads of relationshep together thought the database

#4.5 

#In other words, when a foreign key value is used it must reference a valid, existing primary key in the parent table.

#4.6 Done

#4.7 Done

#4.8a

use text;
select
	personid
from person
where 'person first' = 'Sheila'
and `person last` = "O'Hara"; 


#4.8b

use text;
select
	personid
from person
order by `person first` desc, `person last` desc


#4.8c

use text;
select
	cartype,
    carsell,
    carcost,
    car.personid
from car
inner join person
	on person.personid = car.personid
where `person first` = 'Bruce'
and `person last` = 'Bush'; 


#4.8d

use text;
select
	cartype,
    carsell,
    carcost,
    (carsell-carcost) as Gross_Profit,
    car.personid
from car


#4.8e

use text;
select
	cartype,
    count(carsell)
from car
group by cartype

#4.8f 

use text;
select
    car.personid,
    avg(carsell)
from car
inner join person
	on person.personid = car.personid
where `person first` = 'Sue'
and `person last` = 'Lim'; 


#4.8g

use text;
select
	carid,
    carsell,
    carcost,
    (carsell-carcost) as GrossProfit
from car
group by carid
having (carsell-carcost) < (select avg(carsell-carcost) from car)



#4.8h

use text;
select
	carid,
    cartype,
    max(carsell)
from car
group by cartype


#4.8i 

use text;
select
	sum(carsell) - sum(carcost) as Total_Profit
from car

#4.8j

use text;
select
	car.personid,
    sum(carsell-carcost) as GrossProfit,
    count(carsell) as Num
from car
where count(carsell) > 3
group by car.personid


#4.8k

use text;
select
	*,
    (carsell-carcost) as grossprofit
from car

#4.9

SELECT
	count(distinct(stkprice/stkdiv))
FROM stock







---- Chapter  5




#5.1a Done
#5.1b Done
#5.1c Done	
#5.1d Done
#5.1e Done 
#5.2  				#study this!!!!

CREATE TABLE player (
   playerno SMALLINT,
   pfname    VARCHAR(15),
   plname    VARCHAR(20),
   pdob      DATE,
     PRIMARY KEY (playerno));
CREATE TABLE competition (
   compno    SMALLINT,
   location  VARCHAR(20),
   comptitle VARCHAR(20),  
   datebegin DATE,  
      PRIMARY KEY (compno));
CREATE TABLE field (  
   playerno  SMALLINT,  
   compno    SMALLINT,  
     PRIMARY KEY (playerno, compno),  
     CONSTRAINT fkplayer1 FOREIGN KEY(playerno) REFERENCES player(playerno),  
     CONSTRAINT fkcomp1 FOREIGN KEY(compno) REFERENCES competition(compno)); 
CREATE TABLE golfround(  
   roundno   SMALLINT,  
   rounddate DATE,  
   compno    SMALLINT,  
     PRIMARY KEY (roundno, compno),  
     CONSTRAINT fkcomp2 FOREIGN KEY(compno) REFERENCES competition(compno));
CREATE TABLE hole ( 
   holeno    SMALLINT,  
   length    SMALLINT,  
   par       SMALLINT,  
   roundno   SMALLINT,  
   compno    SMALLINT,  
     PRIMARY KEY (holeno, roundno, compno),  
     CONSTRAINT fkround FOREIGN KEY(roundno, compno) REFERENCES golfround(roundno, compno));
CREATE TABLE score ( 
   strokes   SMALLINT,  
   holeno    SMALLINT,  
   roundno   SMALLINT,  
   compno    SMALLINT,  
   playerno  SMALLINT,  
     PRIMARY KEY (holeno, roundno, compno, playerno),  
     CONSTRAINT fkhole FOREIGN KEY(holeno, roundno, compno) REFERENCES hole(holeno, roundno, compno), 
     CONSTRAINT fkplayer2 FOREIGN KEY(playerno) REFERENCES player(playerno)); 



#5.3a

use text;
select
	item.itemno,
    itemname,
    lineqty
from item 
inner join lineitem
	on item.itemno = lineitem.itemno
where lineqty > 1


#5.3b

use text;
select
	lineno,
	item.itemno,
    itemname,
    (lineqty*lineprice) as value,
    saledate
from item 
inner join lineitem
	on item.itemno = lineitem.itemno
inner join sale
	on lineitem.saleno = sale.saleno
order by saledate

#5.3c

use text;
select
	lineno,
	item.itemno,
    itemname,
    itemtype,
    (lineqty*lineprice) as value,
    saledate
from item 
inner join lineitem
	on item.itemno = lineitem.itemno
inner join sale
	on lineitem.saleno = sale.saleno
where itemtype regexp "F"
order by saledate

#5.3d

use text;
select
	lineno,
	item.itemno,
    itemname,
    itemtype,
    (lineqty*lineprice) as value,
    saledate
from item 
inner join lineitem
	on item.itemno = lineitem.itemno
inner join sale
	on lineitem.saleno = sale.saleno
where itemtype not regexp "F"
order by saledate

#5.3e

use text;
select
	sale.saleno,
    (lineqty*lineprice) as value,
    saledate,
    saletext
from item 
inner join lineitem
	on item.itemno = lineitem.itemno
inner join sale
	on lineitem.saleno = sale.saleno
where itemtype not regexp "F"
group by sale.saleno
order by value desc

#5.4 you create a third entity to store facts abouth the relationship between the too entities


#5.5 the plus sigh means that the identifier from the one-end is part of the indentifies on the many end

#5.6 EXIST will check if a sub quir exist and will ruk the operateion as long as a result statement, it provides an condition option for our queries. Also less efficient

#5.7a

use text;
select
	donor#, 
	dlname, 
	dphone
from donor
where dlname = 'Hays' or dlname = 'Jefts'

#5.7b

use text;
select
	count(donor#)
from donor

#5.7c


use text;
select
	count(donor#)
from gift
where year = 1999

#5.7d

use text;
select
	donor#, 
	dlname
from donor
inner join gift
	on gift.donor# = gift.donor#
where gift.year = 1999


#5.7e

use text;
select
	sum (amount)
from gift 
where gift.year = 2000

#5.7f





#5.7g

use text;
select
	donor#, 
	dlname, 
	amount,
from donor
inner join gift
	on gift.donor# = gift.donor#
having amount > (avg(amount)*2)

#5.7h


use text;
select
	dononr#
	amount
from donor
inner join gift
	on gift.donor# = gift.donor#


#5.7i

use text;
select
	dstate
	amount
from donor
inner join gift
	on donor.donor# = gift.donor#
where year = '2001'
group by dstate

#5.7j

use text;
select
	year, 
	yeargoal, 
	amount
from year
inner join gift
	on year.year = gift.amount
where amount > yeargoal
group by year

#5.8 Not Doing this, stupid




------ CHapter 6

# Creating a Table

create table dept(
	deptname 	varchar(15),
	deptfloor 	smallint not null,
	deptphone	smallint not null,
	empno		smallint not null,
	primary key (deptname)
create table emp(
	empno 		smallint,
	empfname 	varchar(10),
	empsalary	decimal(7,0),
	deptname	varchar(15),
	bossno		smallint,
	primary key (empno)
constraint fk_belong_dept foriegn key (deptname)
	reference dept(deptname)
constraint fk_has_boss foriegn key (bossno)
	reference emp(empno)
)


# Inserting values

insert into emp(empno,empfname,empsalary,deptname,)
	values(1,"Alice",75000,"Management")
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);
insert into emp values (2,"Ned",45000,"Marketing",1);

)


#5.1a Done
#5.1b Done
#5.1c Done
#5.1d Done 
#5.1e Done 
#5.1f Done
#5.1g Done 
#5.1h Done

#5.2a

SELECT DISTINCT (deptname) FROM dept 
WHERE deptname NOT IN 
(SELECT wrk.deptname FROM emp AS wrk, emp AS boss 
WHERE wrk.bossno = boss.empno 
AND wrk.empsalary > boss.empsalary);
SELECT wrk.empfname FROM emp AS wrk, emp AS boss 
WHERE wrk.bossno = boss.empno
AND wrk.deptname = boss.deptname; 

#5.2b

select
	E.*
from emp as E, emp as B 
where
	E.bossno = B.empno
	and E.deptname = B.deptname

#5.2c

select
	*,
    avg(empsalary)
from emp
where avg(empsalary) > 25000
group by deptname


#5.2d???

select
	deptname,
    avg(E.empsalary)
from emp as E
group by deptname
having avg(E.empsalary)>25000

#5.2e

select
	E.empfname,
	B.empfname
from emp as E, emp as B
where E.deptname = 'Marketing' 
	and E.empsalary > 25000	
    and B.empno = E.bossno


#5.2f

select
	E.empfname
from emp as E
where E.empsalary > (select max(empsalary) from emp where deptname = 'Marketing')


#5.3a

select
	monname,
    monnum
from monarch
where premonname = "Victoria" and premonnum = "I"

#5.3b


select
	(P.rgnbeg - C.rgnbeg)
from monarch as C, monarch as P
where C.monnum = P.premonnum
	and C.monname = "Victoria" and C.monnum = "I"

#5.3c

select
	count(montype)
from monarch
where montype = "King"


#5.3d

select
	C.*,
	(P.rgnbeg - C.rgnbeg) as Days
from monarch as C, monarch as P
where C.monnum = P.premonnum
group by Days
having  datdiff 




#5.4a

select
	Sum(quantity)
from assembly
inner join product
	on assembly.prodid = product.prodid
where proddesc = "Animal photography kit"


#5.4b


#5.4c



#5.4d



---- Midterm Prep


# week 1
#- model a single entity - 							Done
#- define a single databases
#- write queries for a single-table database
#- aggergate functions - Done
#- group by, order by, having - 					Done
#- text fields 										Done

# week 2&3
#- model a one-to-many relationship between two entities
#- define a database with a one-to-many relationship
#- write queries for a database with a one-to-many relationship
#- Join, In
#- Inner/Outer Query
#- Correlated Subquery

# week 4
#- model a many-to-many relationship between two entities
#- define a datbase with a many-to-many relationship
#- write queries for a database with a many-to-many relationship
#- exist
#- MySQL server - forward/reverse engineering a DB
#- database schemas
#- importing/cleaning/merging external data


# week 5
#- model-one-to-one and recursive relationship
#- define a database with one-to-one and recursive relationship
#- write querie for a database with one-to-one and recursive relationship
#- affiliation (1;M)
#- monarchy (1:1)
#- BOM (M:M)
#- Social Network (M:M)

# Midterm Tips
#- hard questions in the back of the chapter
#- any problem solved in class

#Term
- Data 
- Database Management System
- Data Management
- Data Management System
- Data Mining
- Data Security
- Decision Making
- Decision Quality
- Decision Suppost System (DSS)
- Document
- Executive information System
- External Memory
- Geographical Information System (GIS)
- Graphics
- Hypertext
- Images
- Information
- Interanl Memory
- Knowledge
- Management information System (MIS)
- Metamemory
- Online analytical processing (OLAP)
- Organization culture
- Organization Memory
- Shareable data
- Social Networks
- Standard operating procedures
- Storage Devices
- Storage Medium
- Storage structure
- Tables
- Transaction Processing
- Transaction Processing System (TPS)
- Voice data




- advanced Skills (know how)
- benchmarking
- change Information
- cognitive Knowledge (know what)
- empowerment
- explicit knowledge
- gap information
- global Change
- goal-Setting Information
- information as a means of Change
- information delivery systems
- information hardness
- infromation intergrateion
- information organization
- infromation requirements
- information richness
- information satisficing
- information society
- knowledge
- managerial work
- organization change
- phase of civiliztion 
- self-motivating creativity (care why)
- social memory 
- system understanding (know why)
- tacit knowledge



- alias
- as
- attribute
- avg
- column
- count
- create
- data modeling
- data type
- database
- delete
- distinct
- entity
- entity integrity rule
- identifier
- in
- insert
- instance
- max
- min
- not in
- order by 
- primary key 
- project 
- relation database
- restrict
- row
- select
- sql 
- subquery 
- sum 
- table 
- update 
- where 



- constriant
- control break reporting
- correlated subquery
- delete anomalies
- equijoin
- foriegn key
- group by 
- having 
- insert anomalies
- join 
- one-to-many (1:m) relationship 
- referential integrity
- relationship
- theta-join
- update anomalies
- views
- virrtual table


- associative entity
- divide 
- existential quantifier
- exists
- intersect
- many-to-many (m:m) relationship
- not exist
- union 
- universal quantifier


- one-to-one (1:1) relationship
- recursive relationship
- recursive m:m relationship
- recursive 1:m relationship
- recursive 1:1 relationship
- relationship descriptor
- self-join
- self-referential foreign key
- datediff()


-------- Chapter 7














