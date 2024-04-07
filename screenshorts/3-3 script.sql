-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb-hw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb-hw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb-hw` DEFAULT CHARACTER SET utf8 ;
USE `mydb-hw` ;

-- -----------------------------------------------------
-- Table `mydb-hw`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb-hw`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(50) NOT NULL,
  `address_building` INT NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb-hw`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb-hw`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `address_idx` (`address_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `address_id_UNIQUE` (`address_id` ASC) VISIBLE,
  CONSTRAINT `address`
    FOREIGN KEY (`address_id`)
    REFERENCES `mydb-hw`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb-hw`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb-hw`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_number` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `id-client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id_idx` (`id-client_id` ASC) VISIBLE,
  UNIQUE INDEX `order_number_UNIQUE` (`order_number` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `id-client_id`
    FOREIGN KEY (`id-client_id`)
    REFERENCES `mydb-hw`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb-hw`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb-hw`.`goods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb-hw`.`orderItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb-hw`.`orderItems` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goods_id` INT NOT NULL,
  `goods_quantity` INT NOT NULL,
  `id-order` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `goods_id_idx` (`goods_id` ASC) VISIBLE,
  INDEX `order_id_idx` (`id-order` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `goods_id`
    FOREIGN KEY (`goods_id`)
    REFERENCES `mydb-hw`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_id`
    FOREIGN KEY (`id-order`)
    REFERENCES `mydb-hw`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
