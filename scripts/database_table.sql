-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  PRIMARY KEY (`bookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`delivery_status` (
  `deliveryID` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`deliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `menuID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`menuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staffID` INT NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(255) NOT NULL,
  `contact_number` VARCHAR(105) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `role` VARCHAR(105) NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customer` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(255) NOT NULL,
  `contact_number` VARCHAR(105) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`customerID`),
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`staff` (`staffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `quantiy` INT NOT NULL,
  `totalcost` DECIMAL NOT NULL,
  `date` DATE NOT NULL,
  `deliveryID` INT NOT NULL,
  `bookingID` INT NOT NULL,
  `menuID` INT NOT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `bookingID_idx` (`bookingID` ASC) VISIBLE,
  INDEX `menuID_idx` (`menuID` ASC) VISIBLE,
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `deliveryID`
    FOREIGN KEY (`orderID`)
    REFERENCES `LittleLemonDB`.`delivery_status` (`deliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `bookingID`
    FOREIGN KEY (`bookingID`)
    REFERENCES `LittleLemonDB`.`bookings` (`bookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menuID`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`menu` (`menuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customer` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
