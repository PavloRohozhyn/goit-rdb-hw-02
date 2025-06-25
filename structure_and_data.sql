SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema goit_rdb_hw_02
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `goit_rdb_hw_02` ;
CREATE SCHEMA IF NOT EXISTS `goit_rdb_hw_02` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `goit_rdb_hw_02` ;
-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit_rdb_hw_02`.`Customers` ;
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`Customers` (
  `CID` INT NOT NULL,
  `CName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `CAddress` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  PRIMARY KEY (`CID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;
-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit_rdb_hw_02`.`Orders` ;
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`Orders` (
  `OID` INT NOT NULL,
  `CID` INT NOT NULL,
  `ONumber` INT NULL,
  `ODate` DATE NULL,
  PRIMARY KEY (`OID`),
  INDEX `CID_idx` (`CID` ASC) VISIBLE,
  CONSTRAINT `orders_to_customers_fk`
    FOREIGN KEY (`CID`)
    REFERENCES `goit_rdb_hw_02`.`Customers` (`CID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;
-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit_rdb_hw_02`.`Items` ;
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`Items` (
  `IID` INT NOT NULL,
  `ItemName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL,
  `ItemAmount` INT NULL,
  PRIMARY KEY (`IID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;
-- -----------------------------------------------------
-- Table `goit_rdb_hw_02`.`Orders2Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goit_rdb_hw_02`.`Orders2Items` ;
CREATE TABLE IF NOT EXISTS `goit_rdb_hw_02`.`Orders2Items` (
  `OID` INT NOT NULL,
  `IID` INT NOT NULL,
  INDEX `OID_idx` (`OID` ASC) VISIBLE,
  INDEX `IID_idx` (`IID` ASC) VISIBLE,
  CONSTRAINT `orders2Items_to_orders_fk`
    FOREIGN KEY (`OID`)
    REFERENCES `goit_rdb_hw_02`.`Orders` (`OID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders2Items_to_items_fk`
    FOREIGN KEY (`IID`)
    REFERENCES `goit_rdb_hw_02`.`Items` (`IID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Data for table `goit_rdb_hw_02`.`Customers`
-- -----------------------------------------------------
START TRANSACTION;
USE `goit_rdb_hw_02`;
INSERT INTO `goit_rdb_hw_02`.`Customers` (`CID`, `CName`, `CAddress`) VALUES (1, 'Мельник', 'Хрещатик 1');
INSERT INTO `goit_rdb_hw_02`.`Customers` (`CID`, `CName`, `CAddress`) VALUES (2, 'Шевченко', 'Басейна 2');
INSERT INTO `goit_rdb_hw_02`.`Customers` (`CID`, `CName`, `CAddress`) VALUES (3, 'Коваленко', 'Комп\'ютерна 3');
COMMIT;
-- -----------------------------------------------------
-- Data for table `goit_rdb_hw_02`.`Orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `goit_rdb_hw_02`;
INSERT INTO `goit_rdb_hw_02`.`Orders` (`OID`, `CID`, `ONumber`, `ODate`) VALUES (1, 1, 101, '2023-03-15');
INSERT INTO `goit_rdb_hw_02`.`Orders` (`OID`, `CID`, `ONumber`, `ODate`) VALUES (2, 1, 101, '2023-03-15');
INSERT INTO `goit_rdb_hw_02`.`Orders` (`OID`, `CID`, `ONumber`, `ODate`) VALUES (3, 2, 102, '2023-03-16');
INSERT INTO `goit_rdb_hw_02`.`Orders` (`OID`, `CID`, `ONumber`, `ODate`) VALUES (4, 3, 103, '2023-03-17');
COMMIT;
-- -----------------------------------------------------
-- Data for table `goit_rdb_hw_02`.`Items`
-- -----------------------------------------------------
START TRANSACTION;
USE `goit_rdb_hw_02`;
INSERT INTO `goit_rdb_hw_02`.`Items` (`IID`, `ItemName`, `ItemAmount`) VALUES (1, 'Лептоп', 3);
INSERT INTO `goit_rdb_hw_02`.`Items` (`IID`, `ItemName`, `ItemAmount`) VALUES (2, 'Мишка', 2);
INSERT INTO `goit_rdb_hw_02`.`Items` (`IID`, `ItemName`, `ItemAmount`) VALUES (3, 'Принтер', 1);
INSERT INTO `goit_rdb_hw_02`.`Items` (`IID`, `ItemName`, `ItemAmount`) VALUES (4, 'Мишка', 4);
COMMIT;
-- -----------------------------------------------------
-- Data for table `goit_rdb_hw_02`.`Orders2Items`
-- -----------------------------------------------------
START TRANSACTION;
USE `goit_rdb_hw_02`;
INSERT INTO `goit_rdb_hw_02`.`Orders2Items` (`OID`, `IID`) VALUES (1, 1);
INSERT INTO `goit_rdb_hw_02`.`Orders2Items` (`OID`, `IID`) VALUES (2, 2);
INSERT INTO `goit_rdb_hw_02`.`Orders2Items` (`OID`, `IID`) VALUES (3, 3);
INSERT INTO `goit_rdb_hw_02`.`Orders2Items` (`OID`, `IID`) VALUES (4, 4);
COMMIT;
