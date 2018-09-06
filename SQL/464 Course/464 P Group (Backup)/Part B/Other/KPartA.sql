
-- droppind tables 


drop table if exists `weather event`;
drop table if exists `line_item`;
drop table if exists `inventory`;
drop table if exists `item`;
drop table if exists `sale`;
drop table if exists `store`;
drop table if exists `department`;
drop table if exists `station`;
drop table if exists bigtrain;
drop table if exists department;
drop table if exists `weather event`;
drop table if exists station;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_sek
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_sek
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sek` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_sek` ;

-- -----------------------------------------------------
-- Table `db_sek`.`station`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`station` (
  `station_id` INT NOT NULL COMMENT '',
  `address` VARCHAR(45) NULL COMMENT '',
  `postal_code` VARCHAR(45) NULL COMMENT '',
  `city` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`station_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`store` (
  `store_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `address` VARCHAR(45) NULL COMMENT '',
  `postal_code` VARCHAR(45) NULL COMMENT '',
  `city` VARCHAR(45) NULL COMMENT '',
  `station_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`store_id`)  COMMENT '',
  INDEX `fk_Store_Station_idx` (`station_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Store_Station`
    FOREIGN KEY (`station_id`)
    REFERENCES `db_sek`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `department_name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`department_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`item` (
  `item_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `item_name` VARCHAR(45) NULL COMMENT '',
  `item_description` VARCHAR(45) NULL COMMENT '',
  `item_type` VARCHAR(45) NULL COMMENT '',
  `item_unit_price` VARCHAR(45) NULL COMMENT '',
  `department_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`item_id`)  COMMENT '',
  INDEX `fk_Item_Department1_idx` (`department_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Item_Department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `db_sek`.`Department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `item_id` INT NOT NULL COMMENT '',
  `store_id` INT NOT NULL COMMENT '',
  `last_update` TIMESTAMP NOT NULL COMMENT '',
  `quantity` INT NULL COMMENT '',
  PRIMARY KEY (`inventory_id`)  COMMENT '',
  INDEX `fk_Item_Store1_idx` (`store_id` ASC)  COMMENT '',
  INDEX `fk_Item_Product1_idx` (`item_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Item_Store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `db_sek`.`Store` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_Product1`
    FOREIGN KEY (`item_id`)
    REFERENCES `db_sek`.`Item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`sale` (
  `sale_id` INT NOT NULL COMMENT '',
  `sale_date` DATETIME NULL COMMENT '',
  `store_id` INT NOT NULL COMMENT '',
  INDEX `fk_Sale_Store1_idx` (`store_id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`weather event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`weather event` (
  `event_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `date` DATE NULL COMMENT '',
  `tmax` VARCHAR(45) NULL COMMENT '',
  `tmin` VARCHAR(45) NULL COMMENT '',
  `tavg` VARCHAR(45) NULL COMMENT '',
  `depart` VARCHAR(45) NULL COMMENT '',
  `dewpoint` VARCHAR(45) NULL COMMENT '',
  `wetbulb` VARCHAR(45) NULL COMMENT '',
  `heat` VARCHAR(45) NULL COMMENT '',
  `cool` VARCHAR(45) NULL COMMENT '',
  `sunrise` VARCHAR(45) NULL COMMENT '',
  `sunset` VARCHAR(45) NULL COMMENT '',
  `codesum` VARCHAR(45) NULL COMMENT '',
  `snowfall` VARCHAR(45) NULL COMMENT '',
  `preciptotal` VARCHAR(45) NULL COMMENT '',
  `stnpressure` VARCHAR(45) NULL COMMENT '',
  `sealevel` VARCHAR(45) NULL COMMENT '',
  `resultspeed` VARCHAR(45) NULL COMMENT '',
  `resultdir` VARCHAR(45) NULL COMMENT '',
  `avgspeed` VARCHAR(45) NULL COMMENT '',
  `station_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`event_id`)  COMMENT '',
  INDEX `fk_Weather_Station1_idx` (`station_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Weather_Station1`
    FOREIGN KEY (`station_id`)
    REFERENCES `db_sek`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sek`.`iine_Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sek`.`line_Item` (
  `line_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sale_id` INT NOT NULL COMMENT '',
  `item_id` INT NOT NULL COMMENT '',
  `line_units` INT NULL COMMENT '',
  `line_totals` VARCHAR(45) NULL COMMENT '',
  INDEX `fk_Item_has_Sale_Sale1_idx` (`sale_id` ASC)  COMMENT '',
  INDEX `fk_Order_Product1_idx` (`item_id` ASC)  COMMENT '',
  PRIMARY KEY (`line_id`)  COMMENT '',
  CONSTRAINT `fk_Order_Product1`
    FOREIGN KEY (`item_id`)
    REFERENCES `db_sek`.`Item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

#Insert given Walmart Data (Weather, key, train)

#Create and Load Key
create table if not exists `key` (
	store_nbr int(2),
	station_nbr int(2),
    primary key (store_nbr)
    );

LOAD DATA LOCAL INFILE "/Users/Kavi/desktop/key.csv"
into TABLE `key`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
ignore 1 lines;

#Create and load BigTrain
create table if not exists `train` (
  `date` DATE ,
  `store_nbr` INT,
  `item_nbr`INT,
  `units` INT);
  
LOAD DATA LOCAL INFILE "/Users/Kavi/desktop/train.csv"
into TABLE `train`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
ignore 1 lines;

select * from train;

#Create and load Weather
create table if not exists`Weatherimport` (
  `station_nbr` INT ,
  `Date` DATE,
  `tmax` VARCHAR(45) ,
  `tmin` VARCHAR(45) ,
  `tavg` VARCHAR(45) ,
  `depart` VARCHAR(45) ,
  `dewpoint` VARCHAR(45) ,
  `wetbulb` VARCHAR(45) ,
  `heat` VARCHAR(2) ,
  `cool` VARCHAR(2) ,
  `sunrise` VARCHAR(4) ,
  `sunset` VARCHAR(4) ,
  `codesum` VARCHAR(45),
  `snowfall` VARCHAR(45) ,
  `preciptotal` VARCHAR(45) ,
  `stnpressure` VARCHAR(45) ,
  `sealevel` VARCHAR(45) ,
  `resultspeed` VARCHAR(45) ,
  `resultdir` VARCHAR(45),
  `avgspeed` VARCHAR(45));
    

LOAD DATA LOCAL INFILE "/Users/Kavi/desktop/weather.csv"
into TABLE `weatherimport`
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

#Insert station
insert into station
(station_id)
select distinct(station_nbr)
from `key`;

#postal code, address, city generated from external data
create table Storetemp(
  `store_id` INT(11) NOT NULL COMMENT '',
  `address` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `postal_code` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `city` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `station_id` INT(11) NOT NULL COMMENT '');

LOAD DATA LOCAL INFILE "/Users/Kavi/desktop/store.csv"
into TABLE `Storetemp`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
ignore 1 lines;

insert into store
(address, postal_code, city, station_id)
select storetemp.address, storetemp.postal_code, storetemp.city, `key`.station_nbr
from storetemp, `key`
where `key`.store_nbr = storetemp.store_id AND `key`.station_nbr = storetemp.station_id;

select * from store;
#Insert weather table

drop table if exists storetemp;

select * from weatherimport;
#insert values into weather event
insert into `weather event`
(date,tmax,tmin,tavg,depart,dewpoint,wetbulb,heat,cool,sunrise,sunset,codesum,snowfall,preciptotal,stnpressure,sealevel,resultspeed,resultdir,avgspeed,station_id)
select date,tmax,tmin,tavg,depart,dewpoint,wetbulb,heat,cool,sunrise,sunset,codesum,snowfall,preciptotal,stnpressure,sealevel,resultspeed,resultdir,avgspeed,station_nbr
from `weatherimport`;

select * from `weather event`;
#delete table after insert
DROP TABLE IF EXISTS weatherimport;

#name, description, type of items and departments are extracted from external data
CREATE TABLE itemtemp (
  `item_id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `description` VARCHAR(45) NULL COMMENT '',
  `type` VARCHAR(45) NULL COMMENT '',
  `department_id` INT NOT NULL COMMENT '');

LOAD DATA LOCAL INFILE "/Users/Kavi/desktop/item.csv"
into TABLE `itemtemp`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
ignore 1 lines;


 CREATE TABLE departmenttemp(
  `department_id` INT NOT NULL COMMENT '',
  `department_name` VARCHAR(45) NULL COMMENT ''); 

LOAD DATA LOCAL INFILE "/Users/Kavi/desktop/department.csv"
into TABLE `departmenttemp`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
ignore 1 lines;

#load data into department table
insert into department (department_id, department_name)
select department_id, department_name
from departmenttemp;

drop table if exists departmenttemp;

#load data into item table
insert into item (item_name, item_description, item_type, item_unit_price, department_id)
select name, description, type, ROUND((RAND() * (50-1))+1), department_id
from itemtemp;

rename table train to bigtrain;
  
drop table if exists temptrain;
create table temptrain as
select *, (FLOOR(1 + RAND() * (111) )) as sale_id
from bigtrain
where units > 0;

drop table if exists train;
rename table temptrain to train;

drop table if exists saletemp;
#create temporary sale table
CREATE TABLE saletemp (
  `sale_id` INT COMMENT '',
  `sale_date` DATETIME NULL COMMENT '',
  `store_id` INT NOT NULL COMMENT '');
  
#transform data into saletemp table
insert into saletemp
select sale_id, date, store_nbr
from train t
group by t.date, store_nbr, sale_id
order by t.date, store_nbr;

#load data into sale
insert into sale
select * from saletemp
group by sale_date, store_id, sale_id
order by sale_date, store_id;

alter table sale
add primary key (`sale_id`, `sale_date`, `store_id`);

alter table sale
add FOREIGN KEY (`store_id`)
REFERENCES `db_sek`.`Store` (`store_id`);

drop table if exists lineitemtemp;
#create temporary line_item table
CREATE TABLE lineitemtemp (
  `line_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sale_id` INT NOT NULL COMMENT '',
  `item_id` INT NOT NULL COMMENT '',
  `line_units` INT NULL COMMENT '',
  `line_totals` VARCHAR(45) NULL COMMENT '',
 PRIMARY KEY (`line_id`)  COMMENT '');
 
#transform data into lineitemtemp table
insert into lineitemtemp (sale_id, item_id, line_units,line_totals)
select sale_id, item_nbr, units, (item_unit_price*units)
from train t, item i
where t.item_nbr = i.item_id;

#load data into line_item table
insert into line_item (sale_id, item_id, line_units,line_totals)
select sale_id, item_id, line_units,line_totals 
from lineitemtemp;

alter table `line_item`
add FOREIGN KEY (`sale_id`)
REFERENCES `db_sek`.`Sale` (`sale_id`);

drop table if exists saletemp;
drop table if exists itemtemp;
drop table if exists lineitemtemp;

#create temporary inventory table
Create table inventorytemp(
	`inventory_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
	`item_id` INT NOT NULL COMMENT '',
	`store_id` INT NOT NULL COMMENT '',
	`last_update` TIMESTAMP NOT NULL COMMENT '',
	`quantity` INT NULL COMMENT '',
PRIMARY KEY (`inventory_id`)  COMMENT '');    

#transform data in inventorytemp
insert into inventorytemp (item_id, store_id, quantity)
select item_nbr, store_nbr, ROUND((RAND() * (100-1))+1)
from bigtrain
limit 4884;

#load data into inventory table
insert into inventory (item_id, store_id, last_update, quantity)
select item_id, store_id, last_update, quantity
from inventorytemp;

drop table if exists inventorytemp;

drop table if exists `key`;
drop table if exists train;