




#DECIMAL (p, s)
#DECIMAL (precision, scale)
DECIMAL (9,2)
# =1234567.89




# My SQL Floating Pint Numbers
FLOAT
DOUBLE

---- 4. Time Stamp ---

DROP TABLE IF EXIST
CREATE TABLE test (
	id SERIAL
	stamp TIMESTAMP
	note VARCHR(255));

INSERT INTO test (note) VALUES 'Pablo Pibcassa'
INSERT INTO test (note) VALUES 'Henari Matisse'
INSERT INTO test (note) VALUES 'Vincent Van Gogh'
DESCRIBE test;
SHOW CREATE TABLE test;
SELECT * FROM test

);

--- Looking at an updated stamp -- 

UPDATE test SET note =m 'Jackson Pollock' WHERE id = 2;
SELECT * FROM test;


--- Finding Timezone and Changing Timezone --


SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW ();

SET time_zone = "US/Eastern";
SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW ();


-- Bet Type --


DROP TABLE IF EXIST
CREATE TABLE test (
	id SERIAL
	a BIT(3), 
	b BIT(4)
);
INSERT INTO test (note) VALUES (5, 29)
INSERT INTO test (note) VALUES (6, 30)
INSERT INTO test (note) VALUES (7,31)
INSERT INTO test (note) VALUES (8,32)
INSERT INTO test (note) VALUES (199,199)


--- Boolean ---- 


DROP TABLE IF EXIST testi;
CREATE TABLE test (a BOOLEAN, b BOOLEAN);
INSERT INTO test VALUES (TRUE, FALSE);
SELECT * FROM test;
DESCRIBE test;
SELECT * FROM test;
SELECT a AND b FROM test;


--- Enumerations Types ---


DROP TABLE IF EXIST
CREATE TABLE test (
	id SERIAL
	a ENUM('Pablo', 'Henari', 'Jackson')
); 


#enum is a index of the potetial options, bu t does not limit the number of answers within the index






-- Class 1 -- 

use db_kulbeers
CREATE TABLE share (
shrcode CHAR(3), 
    shrfirm VARCHAR (20) NOT NULL, 
    shrprice DECIMAL (6,2), 
    shrqty DECIMAL (8), 
    shrdiv DECIMAL (5,2), 
    shrpe DECIMAL (2), 
    PRIMARY KEY (shrode));
    