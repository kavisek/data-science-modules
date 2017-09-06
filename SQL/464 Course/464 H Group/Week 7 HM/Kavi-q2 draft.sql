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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client as select * from sakila.rental;




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-07-02 23:12:46