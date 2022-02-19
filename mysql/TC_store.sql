-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TC` DEFAULT CHARACTER SET utf8 ;
USE `TC` ;

-- -----------------------------------------------------
-- Table `TC`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TC`.`product` (
  `product_ID` INT NOT NULL AUTO_INCREMENT,
  `priduct_name` VARCHAR(45) NOT NULL,
  `product_price` INT NOT NULL,
  PRIMARY KEY (`product_ID`),
  UNIQUE INDEX `product_ID_UNIQUE` (`product_ID` ASC) VISIBLE,
  UNIQUE INDEX `priduct_name_UNIQUE` (`priduct_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TC`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TC`.`customer` (
  `customer_ID` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_place` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_ID`),
  UNIQUE INDEX `customer_ID_UNIQUE` (`customer_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TC`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TC`.`order` (
  `order_ID` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `order_price` INT NOT NULL,
  `customer_ID` INT NOT NULL,
  `product_product_ID` INT NOT NULL,
  UNIQUE INDEX `order_ID_UNIQUE` (`order_ID` ASC) VISIBLE,
  PRIMARY KEY (`order_ID`),
  INDEX `fk_order_product1_idx` (`product_product_ID` ASC) VISIBLE,
  CONSTRAINT `fk_order_product1`
    FOREIGN KEY (`product_product_ID`)
    REFERENCES `TC`.`product` (`product_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TC`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TC`.`order_details` (
  `order_ID` INT NOT NULL,
  `order_details_ID` INT NOT NULL AUTO_INCREMENT,
  `product_ID` INT NOT NULL,
  `order_details_numbers` INT NOT NULL,
  `order_details_price` INT NOT NULL,
  `order_order_ID` INT NOT NULL,
  `customer_customer_ID` INT NOT NULL,
  PRIMARY KEY (`order_ID`),
  UNIQUE INDEX `order_details_ID_UNIQUE` (`order_details_ID` ASC) VISIBLE,
  INDEX `fk_order_details_order_idx` (`order_order_ID` ASC) VISIBLE,
  INDEX `fk_order_details_customer1_idx` (`customer_customer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_order`
    FOREIGN KEY (`order_order_ID`)
    REFERENCES `TC`.`order` (`order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_customer1`
    FOREIGN KEY (`customer_customer_ID`)
    REFERENCES `TC`.`customer` (`customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
