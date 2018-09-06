


2. A bit of practice with manipulating datetime values. Consider the database expia (table ‘train). This table contains data about the internet searches for hotels by Expedia users. Copy 10000 records to your database space as follows:
###take special care to limit to 10000 records, not more since train is a large table. If you ignore this limit, the server might hang up.create table db_<your sfuemailid>.BUS464Assign as select * from train limit 10000;  
Next, work solely on the new table. Change the format of the dttime field to ‘datetime’ and answer the following questions by referring to the datetime functions at http://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html . Copy the answer here.


i. Which year(s) does the data pertain to?

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



ii. Extract the hour of the day for each search result and find which hour has the most number of searches?

use db_kulbeers;
select 
	EXTRACT(hour FROM dttime) as Hour_of_the_Day, 
    count(srch_id) as Number_of_Searches
from train
group by Hour_of_the_Day



iii. Which FIVE weeks of the year saw the highest number of searches?

use db_kulbeers;
select 
	EXTRACT(week FROM dttime) as Week, 
    count(srch_id) as Number_of_Searches
from train
group by Week
order by Number_of_Searches desc
limit 5



iiii. Which weekdays saw the lowest number of searches? Any guesses why? 

use db_kulbeers;
select 
	EXTRACT(day FROM dttime) as Day,
    weekday(dttime) as Type_of_Day,
    count(srch_id) as Number_of_Searches
from train
where weekday(dttime) <> 5 or 6
group by Days
order by Number_of_Searches;

#Guess: The visiting_location_country_id are in the same range of locations, probably meaning something was happening on those dates, in that country that restrict access or affectet the results.

