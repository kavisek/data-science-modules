
 1. sandbox SQL code for a sandbox datawarehouse (DW) is provided to you (see file sakila dwh.sql). Sketch the star schema implemented by it by examining the dimension and fact tables created. You can run it within your DBworkspace (db your sfu id). Feel free to modify the code to refer to your database account and run it. Study how the surrogate keys are created when creating the fact and dimension tables (feel free to refer to online sources to understand the role of surrogate keys in a DW). Comment on the similarities between the contents of the DW with the actual Sakila DB by runnning a few SQL queries.


# Shema

dim_customer (customer_key(PK), customer_id, customer_first_name, customer_last_name, customer_email, customer_active, customer_created, customer_address, customer_district , customer_postal_code, customer_phone_number, customer_city, customer_country, customer_version_number, customer_valid_from, customer_valid_through)

dim_date (date_key (PK) , date_value, date_short, date_medium, date_long, date_full, day_in_week, day_in_year, day_in_month, is_first_day_in_month, is_last_day_in_month, day_abbreviation, day_name, week_in_year, week_in_month, s_first_day_in_week, is_last_day_in_week, is_weekend, month_number, month_abbreviation, month_name, year2, year4, quarter_name, quarter_number, year_quarter, year_month_number, year_month_abbreviation)
 
dim_film (film_key (PK), film_title, film_description, film_release_year, film_language, film_original_language, rental_duration, rental_rate decimal, duration, replacement_cost, rating_code rating_text, has_trailers, has_commentaries, has_deleted_scenes, has_behind_the_scenes, is_category_action, is_category_animation, is_category_children, is_category_classics, is_category_comedy, is_category_documentary, is_category_drama, is_category_family, is_category_foreign, is_category_games, is_category_horror, is_category_music, is_category_new, is_category_scifi, is_category_sports is_category_travel)


dim_geography (geography_key (PK) , country_name, country_code, region_name, region_code, city_name, ocal_city_name, longitude)

  
dim_staff (staff_key ((PK), staff_first_name, staff_last_name, staff_id, staff_store_id, staff_version_number, staff_valid_from staff_valid_through, staff_active)


dim_store (store_key (PK) , store_id, store_address, store_district, store_postal_code, store_phone_number, store_city, store_country, store_manager_staff_id, store_manager_first_name, store_manager_last_name, store_version_number, store_valid_from, store_valid_through)

dim_time (time_key (PK) , time_value, time_hour, time_minute)


fact_rental ( rental_id (PK), rental_date_key, rental_time_key, count_rentals, rental_duration, customer_key (FK), staff_key (FK), film_key (FK), store_key (FK))


# Comments-----------------

# - The largest differnrenc is that DW is a star sequema and Sakila is a not, it more of a assoted structure 
# - DW has compessed some entties, taking the mulitle enttites such as customes info and address and consolidated that info in the same table, makeing access that information in quereries easier
# - Sakila is a few more enties that count more meta data on the film, that may not be relevent (actor table)



2. You will now create a smaller DW with the following dimensions: store, film, sta↵. The fact would remain the same: rental count and rental duration (aver- age). Write SQL so that it takes all the data needed from the Sakila DB version on the MySQL server. Thus, there should not be any INSERT statements to load fresh data into the DW

-- MySQL dump 10.13  Distrib 5.1.30, for Win32 (ia32)
--
-- Host: localhost    Database: sakila_dwh
-- ------------------------------------------------------
-- Server version	5.1.30-community-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



use db_kulbeers;

drop table if exists `dim_date` ;
drop table if exists `dim_customer`;
drop table if exists `dim_staff`;
drop table if exists `dim_store`;
drop table if exists `dim_time`;
drop table if exists `dim_rental`;
drop table if exists `dim_geography`;
drop table if exists `fact_rental`;

--
-- Table structure for table `dim_film`
--

DROP TABLE IF EXISTS `dim_film`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dim_film` (
  `film_key` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `film_title` varchar(255) NOT NULL,
  `film_description` text NOT NULL,
  `film_release_year` smallint(5) unsigned NOT NULL,
  `film_language` varchar(20) NOT NULL,
  `film_original_language` varchar(20) NOT NULL,
  `rental_duration` tinyint(3) unsigned DEFAULT NULL,
  `rental_rate` decimal(4,2) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating_code` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  `rating_text` varchar(30) DEFAULT NULL,
  `has_trailers` enum('Yes','No') DEFAULT NULL,
  `has_commentaries` enum('Yes','No') DEFAULT NULL,
  `has_deleted_scenes` enum('Yes','No') DEFAULT NULL,
  `has_behind_the_scenes` enum('Yes','No') DEFAULT NULL,
  `is_category_action` enum('Yes','No') DEFAULT NULL,
  `is_category_animation` enum('Yes','No') DEFAULT NULL,
  `is_category_children` enum('Yes','No') DEFAULT NULL,
  `is_category_classics` enum('Yes','No') DEFAULT NULL,
  `is_category_comedy` enum('Yes','No') DEFAULT NULL,
  `is_category_documentary` enum('Yes','No') DEFAULT NULL,
  `is_category_drama` enum('Yes','No') DEFAULT NULL,
  `is_category_family` enum('Yes','No') DEFAULT NULL,
  `is_category_foreign` enum('Yes','No') DEFAULT NULL,
  `is_category_games` enum('Yes','No') DEFAULT NULL,
  `is_category_horror` enum('Yes','No') DEFAULT NULL,
  `is_category_music` enum('Yes','No') DEFAULT NULL,
  `is_category_new` enum('Yes','No') DEFAULT NULL,
  `is_category_scifi` enum('Yes','No') DEFAULT NULL,
  `is_category_sports` enum('Yes','No') DEFAULT NULL,
  `is_category_travel` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`film_key`)
) ENGINE=InnoDB AUTO_INCREMENT=1290 DEFAULT CHARSET=latin1 as select * from sakila.payment;
SET character_set_client = @saved_cs_client;


--
-- Table structure for table `dim_staff`
--

DROP TABLE IF EXISTS `dim_staff`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dim_staff` (
  `staff_key` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_first_name` varchar(45) DEFAULT NULL,
  `staff_last_name` varchar(45) DEFAULT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `staff_store_id` int(10) unsigned DEFAULT NULL,
  `staff_version_number` smallint(5) unsigned DEFAULT NULL,
  `staff_valid_from` date DEFAULT NULL,
  `staff_valid_through` date DEFAULT NULL,
  `staff_active` char(3) DEFAULT NULL,
  PRIMARY KEY (`staff_key`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 as select * from sakila.staff;
SET character_set_client = @saved_cs_client;


--
-- Table structure for table `dim_store`
--

DROP TABLE IF EXISTS `dim_store`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dim_store` (
  `store_key` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned DEFAULT NULL,
  `store_address` varchar(100) DEFAULT NULL,
  `store_district` varchar(20) DEFAULT NULL,
  `store_postal_code` varchar(10) DEFAULT NULL,
  `store_phone_number` varchar(20) DEFAULT NULL,
  `store_city` varchar(50) DEFAULT NULL,
  `store_country` varchar(50) DEFAULT NULL,
  `store_manager_staff_id` int(10) unsigned DEFAULT NULL,
  `store_manager_first_name` varchar(45) DEFAULT NULL,
  `store_manager_last_name` varchar(45) DEFAULT NULL,
  `store_version_number` smallint(5) unsigned DEFAULT NULL,
  `store_valid_from` date DEFAULT NULL,
  `store_valid_through` date DEFAULT NULL,
  PRIMARY KEY (`store_key`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 as select * from sakila.store;
SET character_set_client = @saved_cs_client;



--
-- Table structure for table `fact_rental`
--

DROP TABLE IF EXISTS `fact_rental`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fact_rental` (
  `staff_key` int(10) unsigned NOT NULL,
  `film_key` int(10) unsigned NOT NULL,
  `store_key` int(10) unsigned NOT NULL,
  `rental_date_key` int(10) unsigned NOT NULL,
  `rental_time_key` int(10) unsigned DEFAULT NULL,
  `rental_id` int(10) unsigned NOT NULL,
  `count_rentals` int(10) unsigned NOT NULL,
  `rental_duration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`rental_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 as select * from sakila.rental;
SET character_set_client = @saved_cs_client;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-07-02 23:12:46


select * from fact_rental;
select * from dim_store;
select * from dim_staff;
select * from dim_film;



#3. Modify your SQL code to implement a slightly di↵erent star schema with two dimensions: store & actor, and fact: payment.


use db_kulbeers;

drop table if exists `dim_date` ;
drop table if exists `dim_customer`;
drop table if exists `dim_staff`;
drop table if exists `dim_store`;
drop table if exists `dim_time`;
drop table if exists `dim_rental`;
drop table if exists `dim_geography`;
drop table if exists `fact_rental`;

--
-- Table structure for table `payment`
--



DROP TABLE IF EXISTS `dim_store`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dim_store` (
		`store_id` TINYINT(3) NOT NULL AUTO_INCREMENT, 
		`manager_staff_id` TINYINT(3) unsigned NOT NULL Unique,
		`address_id`SMALLINT(5) unsigned NOT NULL, 
		`last_update` TIMESTAMP NOT NULL, 
  PRIMARY KEY (`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;



DROP TABLE IF EXISTS `fact_payment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fact_payment` (
  `payment_id` smallint(5) unsigned NOT NUll AUTO_INCREMENT,=
  `amount` decimal(5,2) NOT Null,
  `payment_date` datetime NOT NULL, 
  `last_update` TIMESTAMP NOT Null CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `store_id` TINYINT(3) NOT NULL
  `actor_id` smallint(5)
  PRIMARY KEY (`payment_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;



DROP TABLE IF EXISTS `dim_actor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `dim_actor` (
	`actor_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT, 
	`first_name` varchar(45) NOT NUll, 
	`last_name` varchar(45) NOT NULL, 
	`last_update` TIMESTAMP NOT NULL CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  PRIMARY KEY (`actor_id`),
  KEY `actor_id` (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;



#4. List 2 verification questions and 2 discovery questions that are most interesting for you

#- You can answer quertiont regarding the time dimensieon, manager will normally ask for descriptive anayltics with regards to specfic time periouds

# Verfication: Find out How Many rentals have been made between 3pm and 5pm in the last month? 
# Verfication: Find out the todays highest rented film?
# Discovery: Which staff members has rented out the most movie in each film category
# Discovery: What are the most rented movie categories for each day of the week?






