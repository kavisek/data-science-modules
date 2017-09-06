CREATE TABLE IF NOT EXISTS `db_vphan`.`dim_store` (
  `store_key` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `store_id` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `address` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `postal_code` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `city` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `store_station_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`store_key`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_vphan`.`dim_time` (
  `time_key` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `event_id` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `date` DATE NULL DEFAULT NULL COMMENT '',
  `tmax` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `tmin` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `tavg` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `depart` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `dewpoint` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `wetbulb` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `heat` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `cool` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `sunrise` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `sunset` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `codesum` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `snowfall` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `preciptotal` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `stnpressure` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `sealevel` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `resultspeed` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `resultdir` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `avgspeed` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `station_id` INT(11) NOT NULL COMMENT '',
  `weather_station_id` INT(11) NOT NULL COMMENT '',
  `date_id` VARCHAR(45) NOT NULL COMMENT '',
  `date_year` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_month` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_day` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_year_week` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_week` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_quarter` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_weekday` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `date_month_name` CHAR(10) NULL DEFAULT NULL COMMENT '',
  `date_day_name` CHAR(10) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`time_key`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `db_vphan`.`dim_item_department` (
  `item_key` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `item_id` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `item_name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `item_description` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `item_type` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `item_unit_price` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `item_inventory_id` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `item_inventory_quantity` INT(11) NULL DEFAULT NULL COMMENT '',
  `item_department_id` INT(11) NOT NULL COMMENT '',
  `item_department_name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `item_store_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`item_key`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `db_keith`.`fact_sale` (
  `time_key` INT NOT NULL COMMENT 'weather_key,',
  `item_key` INT NOT NULL COMMENT ' item_key, ',
  `store_key` INT NOT NULL COMMENT 'store_key',
  `sale_quantity` INT NOT NULL COMMENT '',
  `sale_total` INT NOT NULL COMMENT '',
  `sale_week` INT NULL COMMENT '',
  `sale_month` INT NULL COMMENT 'sale_month, sale_quarter, sale_year',
  `sale_quarter` INT NULL COMMENT '',
  `sale_year` INT NULL COMMENT '',
  PRIMARY KEY (`time_key`, `item_key`, `store_key`)  COMMENT '',
  INDEX `fk_fact_sale_dim_item_idx` (`item_key` ASC)  COMMENT '',
  INDEX `fk_fact_sale_dim_weather_idx` (`time_key` ASC)  COMMENT '',
  INDEX `fk_fact_sale_dim_store_idx` (`store_key` ASC)  COMMENT '',
  CONSTRAINT `fk_fact_sale_dim_item`
    FOREIGN KEY (`item_key`)
    REFERENCES `db_keith`.`dim_item` (`item_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sale_dim_weather`
    FOREIGN KEY (`time_key`)
    REFERENCES `db_keith`.`dim_weather` (`weather_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sale_dim_store`
    FOREIGN KEY (`store_key`)
    REFERENCES `db_keith`.`dim_store` (`store_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sale_dim_store1`
    FOREIGN KEY (`store_key`)
    REFERENCES `db_vphan`.`dim_store` (`store_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sale_dim_time1`
    FOREIGN KEY (`time_key`)
    REFERENCES `db_vphan`.`dim_time` (`time_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sale_dim_item_department1`
    FOREIGN KEY (`item_key`)
    REFERENCES `db_vphan`.`dim_item_department` (`item_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;