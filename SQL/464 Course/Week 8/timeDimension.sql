Use db_testing; 
drop table T;

create table T as select film_id from sakila.film;
# Use the below line of INSERT code repeatedly if you want to create a table with more rows. 
#insert into T select film_id from T;

# time span
SET @d0 = "2010-01-01";
SET @d1 = "2012-12-31";
 
SET @date = date_sub(@d0, interval 1 day);
 
# set up the time dimension table
DROP TABLE IF EXISTS time_dimension;
CREATE TABLE `time_dimension` (
  `date` date DEFAULT NULL,
  `id` int NOT NULL,
  `y` smallint DEFAULT NULL,
  `m` smallint DEFAULT NULL,
  `d` smallint DEFAULT NULL,
  `yw` smallint DEFAULT NULL,
  `w` smallint DEFAULT NULL,
  `q` smallint DEFAULT NULL,
  `wd` smallint DEFAULT NULL,
  `m_name`  char(10) DEFAULT NULL,
  `wd_name` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
 
# populate the table with dates
INSERT INTO time_dimension
SELECT @date := date_add(@date, interval 1 day) as date,
    # integer ID that allows immediate understanding
    date_format(@date, "%Y%m%d") as id,
    year(@date) as y,
    month(@date) as m,
    day(@date) as d,
    date_format(@date, "%x") as yw,
    week(@date, 3) as w,
    quarter(@date) as q,
    weekday(@date)+1 as wd,
    monthname(@date) as m_name,
    dayname(@date) as wd_name
FROM T
WHERE date_add(@date, interval 1 day) <= @d1
ORDER BY date
;

select * from time_dimension;