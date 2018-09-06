### Applying Group By statement

use db_kulbeers;
drop table stockTrans;
create table stockTrans select * from text.stocktrans;

#####single entity - stockTrans ###########


use db_kulbeers;

# Using Group by on one entity database

#What is the output of the following? 
Select count(*) as NumofStocks, natname from stockTrans group by natname; #Counts number of stocks per nation
Select avg(stkpe), natname from stocktrans group by natname; #avearage of the values per nation
Select max(stkpe), natname from stocktrans group by natcode; #Max value in each vertical row


#### Two-entity --- Using Group By on Two entities 

use db_kulbeers;  #### HERE USE YOUR OWN db_yourSFUID
drop table stock;
drop table nation;  

CREATE TABLE nation ( natcode CHAR( 3), natname VARCHAR( 20), exchrate DECIMAL( 9,5), PRIMARY KEY( natcode));
CREATE TABLE stock 
(stkcode CHAR( 3), 
stkfirm VARCHAR( 20), 
stkprice DECIMAL( 6,2), 
stkqty DECIMAL( 8), 
stkdiv DECIMAL( 5,2), 
stkpe DECIMAL( 5), 
natcode CHAR( 3), 
PRIMARY KEY( stkcode), 
CONSTRAINT fk_has_nation FOREIGN KEY( natcode) 
REFERENCES nation( natcode) ON DELETE RESTRICT);


###   INSERT data  from TExtbook website
#  http://www.richardtwatson.com/dm6e/Reader/sql/text.txt 
select * from stock;
select * from nation; 


insert into nation values ('UK','United Kingdom',1);
insert into nation values ('USA','United States',0.67);
insert into nation values ('AUS','Australia',0.46);
insert into nation values ('IND','India',0.0228);
insert into stock values ('FC','Freedonia Copper',27.5,10529,1.84,16,'UK');
insert into stock values ('PT','Patagonian Tea',55.25,12635,2.5,10,'UK');
insert into stock values ('AR','Abyssinian Ruby',31.82,22010,1.32,13,'UK');
insert into stock values ('SLG','Sri Lankan Gold',50.37,32868,2.68,16,'UK');
insert into stock values ('ILZ','Indian Lead & Zinc',37.75,6390,3,12,'UK');
insert into stock values ('BE','Burmese Elephant',0.07,154713,0.01,3,'UK');
insert into stock values ('BS','Bolivian Sheep',12.75,231678,1.78,11,'UK');
insert into stock values ('NG','Nigerian Geese',35,12323,1.68,10,'UK');
insert into stock values ('CS','Canadian Sugar',52.78,4716,2.5,15,'UK');
insert into stock values ('ROF','Royal Ostrich Farms',33.75,1234923,3,6,'UK');
insert into stock values ('MG','Minnesota Gold',53.87,816122,1,25,'USA');
insert into stock values ('GP','Georgia Peach',2.35,387333,0.2,5,'USA');
insert into stock values ('NE','Narembeen Emu',12.34,45619,1,8,'AUS');
insert into stock values ('QD','Queensland Diamond',6.73,89251,0.5,7,'AUS');
insert into stock values ('IR','Indooroopilly Ruby',15.92,56147,0.5,20,'AUS');
insert into stock values ('BD','Bombay Duck',25.55,167382,1,12,'IND');

#### Group by on a 2-entity database

#Consider schemas stock and nation;

#a) What will be the output? 

select * from stock; 
select max(stkpe), natname from stock group by natcode; 

select max(stkpe), natname from nation, stock 
where nation.natcode = stock.natcode 
group by natname

select max(stkpe), natname from nation, stock 
where nation.natcode = stock.natcode 
group by nation.natcode

select max(stkpe), natname from nation, stock 
where nation.natcode = stock.natcode 
group by nation.natcode


# b) Suppose we Alter the Schema as follows. 

ALTER TABLE nation
ADD COLUMN `language` VARCHAR(45) NOT NULL COMMENT '' AFTER `exchrate`;
update nation set language = "Eng" where natcode = "AUS" or natcode = "IND";

Select * from nation; 

#What will be the output now? 

select max(stkpe), natname from nation, stock 
where nation.natcode = stock.natcode 
group by language;

#How is the result of a) different from that of b)