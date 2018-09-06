SELECT shrfirm, shrpe FROM text.share;
SELECT * FROM share WHERE shrdiv = 2.5;

SELECT * FROM share WHERE shrcode IN ('FC','AR','SLG');
SELECT * FROM share WHERE shrcode NOT IN ('CS', 'PT');
SELECT shrfirm, shrpe FROM text.share WHERE shrpe = 10 ORDER BY SHRPE DESC;
SELECT shrfirm, shrprice, shrqty, shrdiv/shrprice*100 AS yield FROM share;
select shrfirm, shrqty * shrdiv as dividend_earned from share order by dividend_earned desc;
select avg(shrdiv) as avgdiv from share;
SELECT AVG(shrdiv/shrprice*100) AS avgyield FROM share;
SELECT shrfirm, shrpe FROM share WHERE shrpe >(SELECT AVG(shrpe)FROM share);
SELECT shrfirm FROM share WHERE shrfirm REGEXP 'Ruby';
select distinct shrpe from share;
SELECT COUNT(DISTINCT shrpe)AS 'Different PEs' 	FROM share;
select distinct(shrprice) from share; 
ALTER TABLE `text`.`share` 
CHANGE COLUMN `shrprice` `shrprice` DECIMAL(6,2) NOT NULL COMMENT '' ,
ADD PRIMARY KEY (`shrprice`)  COMMENT '';

ALTER TABLE `text`.`share` 
CHANGE COLUMN `shrpre` `shrpe` DECIMAL(6,2) NOT NULL COMMENT '' ,
ADD PRIMARY KEY (`shrprice`)  COMMENT '';

ALTER TABLE `text`.`share` 
CHANGE COLUMN `shrprice` `shrprice` DECIMAL(6,2) NOT NULL COMMENT '' ,
DROP PRIMARY KEY;

select distinct(shrprice) from share; 
	DELETE FROM share 
    WHERE shrfirm = 'Burmese Elephant';



use db_kulbeers;

DROP INDEX share.nation;

CREATE TABLE nation (
    natcode    CHAR(3),
    natname    VARCHAR(20),
    exchrate    DECIMAL(9,5),
       PRIMARY KEY (natcode));
       
CREATE TABLE stock (
    stkcode    CHAR(3),
    stkfirm    VARCHAR(20),
    stkprice    DECIMAL(6,2),
    stkqty    DECIMAL(8),
    stkdiv    DECIMAL(5,2),
    stkpe    DECIMAL(5),
    natcode    CHAR(3),
       PRIMARY KEY(stkcode),
       CONSTRAINT fk_has_nation FOREIGN KEY(natcode)
￼REFERENCES nation(natcode));

insert into nation
	values ('Ind''India-SouthAsia',55);

insert into stock
	values ('FC', 'Freedonia',27.5, 10529, 1.84, 16, 'India')
    
