-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


USE `db_nsaraf` ;

-- -----------------------------------------------------
-- Table `db_nsaraf`.`stakeholders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`stakeholders` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`stakeholders` (
  `stakeholder_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `first_name` VARCHAR(45) NULL COMMENT '',
  `last_name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`stakeholder_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`courses` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `acad_career` ENUM('UGRD','GRAD') NULL DEFAULT 'UGRD' COMMENT '',
  `subject` VARCHAR(45) NULL DEFAULT 'BUS' COMMENT '',
  `number` INT NULL COMMENT '',
  `unit` INT NULL DEFAULT 3 COMMENT '',
  PRIMARY KEY (`course_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`course_offerings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`course_offerings` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`course_offerings` (
  `course_offering_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `course_id` INT NOT NULL COMMENT '',
  `term` VARCHAR(45) NULL COMMENT '',
  `section` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`course_offering_id`)  COMMENT '',
  INDEX `fk_course_offerrings_courses1_idx` (`course_id` ASC)  COMMENT '',
  CONSTRAINT `fk_course_offerrings_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `db_nsaraf`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`course_offering_has_stakeholders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`course_offering_has_stakeholders` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`course_offering_has_stakeholders` (
  `cohs_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `stakeholder_id` INT NOT NULL COMMENT '',
  `course_offering_id` INT NOT NULL COMMENT '',
  `type` ENUM('Instructor','TA') NULL COMMENT '',
  INDEX `fk_course_offerrings_has_stakeholders_stakeholders1_idx` (`stakeholder_id` ASC)  COMMENT '',
  INDEX `fk_course_offerrings_has_stakeholders_course_offerrings1_idx` (`course_offering_id` ASC)  COMMENT '',
  PRIMARY KEY (`cohs_id`)  COMMENT '',
  CONSTRAINT `fk_course_offerrings_has_stakeholders_stakeholders1`
    FOREIGN KEY (`stakeholder_id`)
    REFERENCES `db_nsaraf`.`stakeholders` (`stakeholder_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_offerrings_has_stakeholders_course_offerrings1`
    FOREIGN KEY (`course_offering_id`)
    REFERENCES `db_nsaraf`.`course_offerings` (`course_offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`course_enrollments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`course_enrollments` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`course_enrollments` (
  `course_enrollment_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `stakeholder_id` INT NOT NULL COMMENT '',
  `course_offering_id` INT NOT NULL COMMENT '',
  `enrollment_status` VARCHAR(45) NULL COMMENT '',
  `grade` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`course_enrollment_id`)  COMMENT '',
  INDEX `fk_course_enrollments_stakeholders1_idx` (`stakeholder_id` ASC)  COMMENT '',
  INDEX `fk_course_enrollments_course_offerrings1_idx` (`course_offering_id` ASC)  COMMENT '',
  CONSTRAINT `fk_course_enrollments_stakeholders1`
    FOREIGN KEY (`stakeholder_id`)
    REFERENCES `db_nsaraf`.`stakeholders` (`stakeholder_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_enrollments_course_offerrings1`
    FOREIGN KEY (`course_offering_id`)
    REFERENCES `db_nsaraf`.`course_offerings` (`course_offering_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`intellectual_contributions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`intellectual_contributions` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`intellectual_contributions` (
  `ic_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`ic_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`ic_contributors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`ic_contributors` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`ic_contributors` (
  `stakeholder_id` INT NOT NULL COMMENT '',
  `ic_id` INT NOT NULL COMMENT '',
  INDEX `fk_ic_contributors_stakeholders1_idx` (`stakeholder_id` ASC)  COMMENT '',
  INDEX `fk_ic_contributors_intellectual_contributions1_idx` (`ic_id` ASC)  COMMENT '',
  CONSTRAINT `fk_ic_contributors_stakeholders1`
    FOREIGN KEY (`stakeholder_id`)
    REFERENCES `db_nsaraf`.`stakeholders` (`stakeholder_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ic_contributors_intellectual_contributions1`
    FOREIGN KEY (`ic_id`)
    REFERENCES `db_nsaraf`.`intellectual_contributions` (`ic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nsaraf`.`emails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nsaraf`.`emails` ;

CREATE TABLE IF NOT EXISTS `db_nsaraf`.`emails` (
  `email_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `stakeholder_id` INT NOT NULL COMMENT '',
  `email` VARCHAR(255) NULL COMMENT '',
  `type` ENUM('campus','personal') NULL DEFAULT 'campus' COMMENT '',
  `preferred` ENUM('Yes','No') NULL DEFAULT 'Yes' COMMENT '',
  `contact` ENUM('Yes','No') NULL DEFAULT 'No' COMMENT '',
  PRIMARY KEY (`email_id`)  COMMENT '',
  INDEX `fk_emails_stakeholders_idx` (`stakeholder_id` ASC)  COMMENT '',
  CONSTRAINT `fk_emails_stakeholders`
    FOREIGN KEY (`stakeholder_id`)
    REFERENCES `db_nsaraf`.`stakeholders` (`stakeholder_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`stakeholders`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (1, 'Rebecca', 'Barr');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (2, 'Aladdin', 'Franklin');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (3, 'Colby', 'Campbell');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (4, 'Brenden', 'Estes');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (5, 'Hedda', 'Peck');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (6, 'Shaeleigh', 'Chase');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (7, 'Fredericka', 'Carr');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (8, 'Grady', 'Smith');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (9, 'Tanisha', 'Stevens');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (10, 'Deborah', 'Bernard');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (11, 'Colton', 'Flores');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (12, 'Myra', 'Hampton');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (13, 'Slade', 'Whitehead');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (14, 'Miriam', 'Pruitt');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (15, 'Amir', 'Lee');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (16, 'Amery', 'Robbins');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (17, 'Noel', 'Richards');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (18, 'Dolan', 'Ware');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (19, 'Simone', 'Walter');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (20, 'Blossom', 'Cameron');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (21, 'Illana', 'Tillman');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (22, 'Lacy', 'Hewitt');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (23, 'Chelsea', 'Bryant');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (24, 'Leandra', 'English');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (25, 'Nilesh', 'Saraf');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (26, 'Dominique', 'Robertson');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (27, 'Jamal', 'Acosta');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (28, 'Keith', 'Hamilton');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (29, 'Wing', 'Cunningham');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (30, 'Veronica', 'Bowers');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (31, 'Ariel', 'Witt');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (32, 'Randall', 'Frazier');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (33, 'Marah', 'Haynes');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (34, 'Rae', 'Mcconnell');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (35, 'Beau', 'Santos');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (36, 'Kimberly', 'Mccoy');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (37, 'Brielle', 'Mayo');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (38, 'Acton', 'Riddle');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (39, 'Hedda', 'Blankenship');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (40, 'Hayfa', 'Horton');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (41, 'Quemby', 'Page');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (42, 'Martena', 'Juarez');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (43, 'Slade', 'Hess');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (44, 'Bernard', 'Roy');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (45, 'Ruth', 'Mays');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (46, 'Nina', 'Dotson');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (47, 'Hayfa', 'Burton');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (48, 'Leandra', 'Moreno');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (49, 'Inez', 'Calhoun');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (50, 'Daquan', 'Moon');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (51, 'Austin', 'Watts');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (52, 'Sawyer', 'Huffman');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (53, 'Dennis', 'Pruitt');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (54, 'Lysandra', 'Floyd');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (55, 'Blair', 'Cantrell');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (56, 'Dexter', 'Leonard');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (57, 'Holly', 'Hinton');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (58, 'Uta', 'Forbes');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (59, 'Clementine', 'Stevens');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (60, 'Liberty', 'Ross');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (61, 'Maia', 'Cannon');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (62, 'Farrah', 'Banks');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (63, 'August', 'Fitzpatrick');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (64, 'Quyn', 'Joyner');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (65, 'Iliana', 'Roy');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (66, 'Lucian', 'Whitaker');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (67, 'Sylvia', 'Anderson');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (68, 'Sage', 'Emerson');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (69, 'Mary', 'Chavez');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (70, 'Guinevere', 'Newton');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (71, 'Virginia', 'Le');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (72, 'Gisela', 'Day');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (73, 'Chantale', 'Saunders');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (74, 'Gwendolyn', 'Blackwell');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (75, 'Briar', 'Mcconnell');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (76, 'Price', 'Olson');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (77, 'Mariam', 'Riley');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (78, 'Maya', 'Burnett');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (79, 'Samantha', 'Roberson');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (80, 'Nomlanga', 'Santana');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (81, 'Colette', 'Baird');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (82, 'Thomas', 'Barry');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (83, 'Shelby', 'Brock');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (84, 'Orson', 'Bird');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (85, 'Hermione', 'Carrillo');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (86, 'Cassandra', 'Montgomery');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (87, 'Morgan', 'Bentley');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (88, 'Maggy', 'Hester');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (89, 'Grant', 'Banks');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (90, 'Karleigh', 'Schwartz');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (91, 'Tana', 'Duffy');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (92, 'Aubrey', 'Kerr');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (93, 'Heather', 'Cabrera');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (94, 'Felix', 'Cobb');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (95, 'Sasha', 'Ellis');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (96, 'Simon', 'Reid');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (97, 'Lysandra', 'Hines');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (98, 'Dora', 'Guthrie');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (99, 'Harding', 'Michael');
INSERT INTO `db_nsaraf`.`stakeholders` (`stakeholder_id`, `first_name`, `last_name`) VALUES (100, 'Hannah', 'Lowe');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`courses`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`courses` (`course_id`, `acad_career`, `subject`, `number`, `unit`) VALUES (1, 'UGRD', 'BUS', 464, 4);
INSERT INTO `db_nsaraf`.`courses` (`course_id`, `acad_career`, `subject`, `number`, `unit`) VALUES (2, 'UGRD', 'BUS', 360, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`course_offerings`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`course_offerings` (`course_offering_id`, `course_id`, `term`, `section`) VALUES (1, 1, '1157', 'D100');
INSERT INTO `db_nsaraf`.`course_offerings` (`course_offering_id`, `course_id`, `term`, `section`) VALUES (2, 1, '1154', 'D100');
INSERT INTO `db_nsaraf`.`course_offerings` (`course_offering_id`, `course_id`, `term`, `section`) VALUES (3, 1, '1154', 'D200');
INSERT INTO `db_nsaraf`.`course_offerings` (`course_offering_id`, `course_id`, `term`, `section`) VALUES (4, 2, '1157', 'D100');
INSERT INTO `db_nsaraf`.`course_offerings` (`course_offering_id`, `course_id`, `term`, `section`) VALUES (5, 2, '1157', 'D200');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`course_offering_has_stakeholders`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`course_offering_has_stakeholders` (`cohs_id`, `stakeholder_id`, `course_offering_id`, `type`) VALUES (1, 25, 1, 'Instructor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`course_enrollments`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (1, 1, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (2, 2, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (3, 3, 1, 'Dropped', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (4, 4, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (5, 5, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (6, 44, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (7, 7, 1, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (8, 8, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (9, 46, 1, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (10, 10, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (11, 11, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (12, 12, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (13, 13, 1, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (14, 37, 1, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (15, 15, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (16, 16, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (17, 47, 1, 'Dropped', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (18, 18, 1, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (19, 19, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (20, 20, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (21, 21, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (22, 22, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (23, 23, 1, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (24, 24, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (25, 28, 1, 'Dropped', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (26, 26, 1, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (27, 27, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (28, 28, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (29, 29, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (30, 30, 2, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (31, 31, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (32, 13, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (33, 33, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (34, 22, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (35, 35, 2, 'Waitlist', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (36, 36, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (37, 15, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (38, 38, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (39, 16, 2, 'Dropped', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (40, 40, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (41, 23, 2, 'Enrolled', '');
INSERT INTO `db_nsaraf`.`course_enrollments` (`course_enrollment_id`, `stakeholder_id`, `course_offering_id`, `enrollment_status`, `grade`) VALUES (42, 42, 2, 'Dropped', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`intellectual_contributions`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`intellectual_contributions` (`ic_id`, `title`) VALUES (1, 'Market positioning by IT Service Vendors through imitation');
INSERT INTO `db_nsaraf`.`intellectual_contributions` (`ic_id`, `title`) VALUES (2, 'How does organizational absorptive capacity matter in the assimilation of enterprise information systems?');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`ic_contributors`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`ic_contributors` (`stakeholder_id`, `ic_id`) VALUES (25, 1);
INSERT INTO `db_nsaraf`.`ic_contributors` (`stakeholder_id`, `ic_id`) VALUES (25, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_nsaraf`.`emails`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_nsaraf`;
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (1, 1, 'eget@estmollis.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (2, 2, 'nisl.Maecenas.malesuada@liberoatauctor.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (3, 3, 'lorem.vitae.odio@montesnasceturridiculus.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (4, 4, 'lorem.lorem@porttitorscelerisque.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (5, 5, 'Aliquam.auctor.velit@molestiesodales.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (6, 6, 'at.lacus@duiFuscediam.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (7, 7, 'Nullam@Fuscedolorquam.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (8, 8, 'ut.lacus@ante.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (9, 9, 'porttitor@ipsum.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (10, 10, 'feugiat.Sed.nec@ridiculus.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (11, 11, 'imperdiet.dictum@fringillaestMauris.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (12, 12, 'morbi@lorem.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (13, 13, 'lacus.Quisque.purus@pedePraesent.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (14, 14, 'et.magna.Praesent@etrutrumeu.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (15, 15, 'neque.Nullam.ut@ornaretortorat.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (16, 16, 'aliquet.nec@acfeugiat.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (17, 17, 'faucibus@tortordictum.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (19, 19, 'Sed@metusvitaevelit.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (20, 20, 'mollis.Integer.tincidunt@felisDonectempor.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (21, 21, 'dui.Cras@Fuscedolor.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (22, 22, 'lobortis.risus@ut.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (23, 23, 'quis.turpis.vitae@Sedauctor.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (24, 24, 'lobortis.mauris@molestie.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (25, 25, 'nsaraf@sfu.ca', 'campus', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (26, 26, 'metus.Aliquam.erat@egestasDuisac.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (27, 27, 'ut.lacus.Nulla@natoquepenatibus.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (28, 28, 'placerat.velit.Quisque@lobortis.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (29, 29, 'auctor.ullamcorper@afacilisisnon.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (30, 30, 'nec@lobortisquis.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (31, 31, 'in.sodales.elit@velnislQuisque.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (32, 32, 'faucibus.lectus@fermentum.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (33, 33, 'Cras.vulputate@vehicula.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (34, 34, 'Donec@ut.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (35, 35, 'sit.amet.ante@cursuspurus.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (36, 36, 'odio.auctor.vitae@justofaucibuslectus.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (38, 38, 'auctor.odio@maurisMorbinon.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (39, 39, 'eget.massa@rutrum.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (40, 40, 'non.magna.Nam@Suspendisse.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (41, 41, 'ut.aliquam@dolor.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (42, 42, 'Phasellus.fermentum.convallis@dignissimMaecenas.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (43, 43, 'amet@purusin.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (44, 44, 'Integer@Proinvelnisl.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (45, 45, 'lacinia@nislMaecenas.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (46, 46, 'Vivamus.rhoncus.Donec@purusin.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (47, 47, 'sed@odiosempercursus.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (48, 48, 'Nulla.interdum@diam.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (49, 49, 'ullamcorper.Duis.at@faucibusMorbi.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (50, 50, 'pede.blandit@cursusnon.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (51, 51, 'massa@sed.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (52, 52, 'tristique.aliquet.Phasellus@est.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (53, 53, 'tincidunt.congue@sedconsequat.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (54, 54, 'rhoncus.Donec.est@eleifendegestasSed.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (55, 55, 'Duis.mi.enim@laciniaorci.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (56, 56, 'volutpat.Nulla@Duismienim.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (57, 57, 'egestas@nibh.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (58, 58, 'Quisque.nonummy.ipsum@placerategetvenenatis.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (59, 59, 'Etiam.imperdiet@vitaealiquam.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (60, 60, 'ipsum@erategettincidunt.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (61, 61, 'molestie.tortor@malesuadafringillaest.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (62, 62, 'ut.quam.vel@Maecenas.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (64, 64, 'pede.blandit@eutelluseu.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (65, 65, 'morbi.tristique.senectus@dui.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (66, 66, 'vel.arcu@pedenonummy.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (67, 67, 'viverra@hendreritneque.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (68, 68, 'magnis@leo.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (69, 69, 'dignissim.lacus@rhoncusDonec.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (70, 70, 'mus.Proin.vel@Classaptenttaciti.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (71, 71, 'sed@sollicitudinadipiscing.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (72, 72, 'nibh@sed.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (73, 73, 'dolor.Fusce.mi@sitametante.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (75, 75, 'imperdiet.dictum.magna@egestas.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (76, 76, 'consequat.dolor.vitae@Maecenasornare.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (77, 77, 'diam.Pellentesque.habitant@idante.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (78, 77, 'est@lobortis.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (79, 79, 'consequat.dolor@etmalesuada.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (80, 77, 'libero.lacus@faucibus.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (82, 82, 'enim.non@egettincidunt.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (83, 83, 'in.hendrerit@necanteMaecenas.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (84, 84, 'velit@eu.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (85, 85, 'justo.faucibus.lectus@eumetus.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (86, 86, 'lorem.ac@Naminterdum.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (87, 87, 'Sed.malesuada.augue@ullamcorpereu.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (88, 88, 'orci.consectetuer.euismod@libero.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (89, 89, 'amet.diam.eu@pedeultricesa.co.uk', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (90, 90, 'ligula.tortor@ipsumdolor.edu', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (91, 91, 'dictum@purusmaurisa.org', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (92, 91, 'ac.arcu@aliquamerosturpis.ca', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (94, 94, 'mattis@ipsumacmi.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (95, 95, 'Quisque.tincidunt@tristique.net', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (99, 99, 'Mauris@Duisdignissim.com', 'personal', 'Yes', 'Yes');
INSERT INTO `db_nsaraf`.`emails` (`email_id`, `stakeholder_id`, `email`, `type`, `preferred`, `contact`) VALUES (100, 100, 'eu.lacus.Quisque@diamat.org', 'personal', 'Yes', 'Yes');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;