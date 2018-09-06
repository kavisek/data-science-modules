### Understanding Referential Integrity Constraints #########

############  UPDATE ANOMALIES IN SINGLE ENTITY DATABASE ###########accessible

# Create a new table by copying an old one. 
use db_nsaraf;
drop table stockTrans;
create table stockTrans select * from text.stocktrans;

#Notice the following table
select * from stockTrans;  
describe stockTrans;

#Notice that in this schema NULL value for stkcode is not allowed. 

# the nation name, exchange rate and stock info is all in one table.
# this has UPDATE anomalies because:

#  1. INSERT Anomaly -- Inserting a new country without a stock transaction creates blanks
insert into stocktrans (natname, exchrate, stkcode) values ("Australia", 0.55, "NA");
select * from stocktrans; 
# This creates bad data with blanks. Can you change the StockTrans Schema to fix this? 

# 2. DELETE anomaly -- Deleting data about a country deletes all stock transactions 
delete from stocktrans where natname = "India";
select * from stocktrans; 


# 3. UPDATE anomaly -- exchange rates vary, one cannot capture new exchange 
#                      rates without first executing a stock transaction.
insert into stocktrans (natname, exchrate, stkcode) values ("Australia", 0.58, "NA");
select * from stocktrans; 


################   REFERENTIAL INTEGRITY in a TWO-ENTITY Database ######################

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

insert into stock values ("TEL", "Telus", 50, 1000000, 1.5, 16, "CAN");  #WILL GIVE an ERROR
# Why does this give an error? 

# To do: Remove the Referential Integrity from the schema 
# and try the above again. 
# This time it will work, but is a faulty way to 
# design a database.

#First insert in table nation, a nation with natcode = USA 
db
#### THIS ILLUSTRATES THAT NEW DATA IN A CHILD TABLE (MANY SIDE) CANNOT BE INSERTED UNLESS
# THE FOREIGN KEY FIELD HAS A VALUE THAT IS ALREADY PRESENT IN THE PARENT TABLE (ONE SIDE)

## This ensures that a NATION actually exists and its information captured accurately before
## data about stocks from that nation is captured.

### clean up
drop table nation;
drop table stock; 
#### Check if the two tables were indeed deleted. If not, why not? 


######################################################################################

