CREATE DATABASE  IF NOT EXISTS `towingdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `towingdb`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: towingdb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Phone_Alternative` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClient`,`Company_idCompany`),
  KEY `fk_Client_Company1_idx` (`Company_idCompany`),
  CONSTRAINT `fk_Client_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company` (
  `idCompany` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Phone_Alternative` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Web` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCompany`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Sprinter Towing',NULL,NULL,NULL,NULL,'998 Pacific av');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `driver` (
  `idDriver` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Register` varchar(45) DEFAULT NULL,
  `Police_Check` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Phone_Alternative` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDriver`,`Company_idCompany`),
  KEY `fk_Driver_Company1_idx` (`Company_idCompany`),
  CONSTRAINT `fk_Driver_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,1,'Max',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'Ale',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'Marty',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'Justin',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `idPayment` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Driver_idDriver` int(11) NOT NULL,
  `Payrate_idPayrate` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Start` datetime DEFAULT NULL,
  `End` datetime DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPayment`,`Company_idCompany`,`Driver_idDriver`,`Payrate_idPayrate`),
  KEY `fk_Payment_Company1_idx` (`Company_idCompany`),
  KEY `fk_Payment_Driver1_idx` (`Driver_idDriver`),
  KEY `fk_Payment_Payrate1_idx` (`Payrate_idPayrate`),
  CONSTRAINT `fk_Payment_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`),
  CONSTRAINT `fk_Payment_Driver1` FOREIGN KEY (`Driver_idDriver`) REFERENCES `driver` (`iddriver`),
  CONSTRAINT `fk_Payment_Payrate1` FOREIGN KEY (`Payrate_idPayrate`) REFERENCES `payrate` (`idpayrate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrate`
--

DROP TABLE IF EXISTS `payrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payrate` (
  `idPayrate` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Hours` float DEFAULT NULL,
  `Kms` float DEFAULT NULL,
  `Services` float DEFAULT NULL,
  `Bonus_Nigth` float DEFAULT NULL,
  PRIMARY KEY (`idPayrate`,`Company_idCompany`),
  KEY `fk_Payrate_Company1_idx` (`Company_idCompany`),
  CONSTRAINT `fk_Payrate_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrate`
--

LOCK TABLES `payrate` WRITE;
/*!40000 ALTER TABLE `payrate` DISABLE KEYS */;
INSERT INTO `payrate` VALUES (1,1,'2019-03-17 23:26:06',12,0.4,8,4);
/*!40000 ALTER TABLE `payrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `register` (
  `idRegister` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Shareholder_idShareholder` int(11) NOT NULL,
  `Service_idService` int(11) DEFAULT NULL,
  `Payment_idPayment` int(11) DEFAULT NULL,
  `Truck_idTruck` int(11) DEFAULT NULL,
  `Type` enum('Income_Service','Income_Sell','Income_Generic','Outcome_Invest','Outcome_Repair','Outcome_Supply','Outcome_Payment','Outcome_Generic') NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  PRIMARY KEY (`idRegister`,`Company_idCompany`,`Shareholder_idShareholder`),
  KEY `fk_Register_Company1_idx` (`Company_idCompany`),
  KEY `fk_Register_Shareholder1_idx` (`Shareholder_idShareholder`),
  KEY `fk_Register_Service1_idx` (`Service_idService`),
  KEY `fk_Register_Payment1_idx` (`Payment_idPayment`),
  KEY `fk_Register_Truck1_idx` (`Truck_idTruck`),
  CONSTRAINT `fk_Register_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`),
  CONSTRAINT `fk_Register_Payment1` FOREIGN KEY (`Payment_idPayment`) REFERENCES `payment` (`idpayment`),
  CONSTRAINT `fk_Register_Service1` FOREIGN KEY (`Service_idService`) REFERENCES `service` (`idservice`),
  CONSTRAINT `fk_Register_Shareholder1` FOREIGN KEY (`Shareholder_idShareholder`) REFERENCES `shareholder` (`idshareholder`),
  CONSTRAINT `fk_Register_Truck1` FOREIGN KEY (`Truck_idTruck`) REFERENCES `truck` (`idtruck`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,1,2,1,NULL,1,'Income_Service','2019-01-19 00:00:00','Kenora',60),(2,1,1,2,NULL,1,'Income_Service','2019-03-09 00:00:00','CAA 1490',128.84),(3,1,1,3,NULL,1,'Income_Service','2019-03-11 00:00:00','CAA 1728',39.9),(4,1,1,4,NULL,1,'Income_Service','2019-03-11 00:00:00','CAA 1925',84.74),(5,1,1,5,NULL,1,'Income_Service','2019-03-11 00:00:00','CAA 2417',39.9),(6,1,1,6,NULL,1,'Income_Service','2019-03-11 00:00:00','CAA 2650',49.56),(7,1,1,7,NULL,1,'Income_Service','2019-03-13 00:00:00','Tow shop Max',50),(8,1,1,8,NULL,1,'Income_Service','2019-03-13 00:00:00','Tow Headingley (1) incl taxes',96),(9,1,1,9,NULL,1,'Income_Service','2019-03-13 00:00:00','Tow Headingley (2) incl taxes',96),(10,1,1,10,NULL,1,'Income_Service','2019-03-14 00:00:00','Tow shop Juan (1) cobrar Lucas',50),(11,1,1,11,NULL,1,'Income_Service','2019-03-14 00:00:00','Tow shop Juan (2) cobrar Lucas',50),(12,1,1,12,NULL,1,'Income_Service','2019-03-14 00:00:00','Winch (1)',50),(13,1,1,13,NULL,1,'Income_Service','2019-03-14 00:00:00','Winch (2)',50),(14,1,1,NULL,NULL,1,'Outcome_Generic','2019-01-18 00:00:00','Fuel Sierra in Winnipeg',81.8),(15,1,1,NULL,NULL,1,'Outcome_Generic','2019-01-18 00:00:00','Food in PetroCanada Winnipeg',5.17),(16,1,1,NULL,NULL,1,'Outcome_Generic','2019-01-18 00:00:00','Fuel Sierra',66.51),(17,1,1,NULL,NULL,1,'Outcome_Generic','2019-01-18 00:00:00','Food in Seven Eleven',3),(18,1,2,NULL,NULL,1,'Outcome_Generic','2019-01-18 00:00:00','MPI CALL CENTRE WINNIPEG',77),(19,1,2,NULL,NULL,1,'Outcome_Invest','2019-01-18 00:00:00','Truck Internacional 4300 2002 (Cheque 13008.50)',12008.5),(20,1,1,NULL,NULL,1,'Outcome_Supply','2019-01-18 00:00:00','Fuel Thunder Bay',192.8),(21,1,1,NULL,NULL,1,'Outcome_Invest','2019-01-18 00:00:00','Tool_town (towing chains, Thunder Bay)',135.53),(22,1,1,NULL,NULL,1,'Outcome_Supply','2019-01-18 00:00:00','Fuel',114.28),(23,1,1,NULL,NULL,1,'Outcome_Generic','2019-01-18 00:00:00','Food Tim Horton Dryden',6.3),(24,1,1,NULL,NULL,1,'Outcome_Generic','2019-01-19 00:00:00','Comfort-INN Kenora',139.85),(25,1,1,NULL,NULL,1,'Outcome_Invest','2019-01-19 00:00:00','Battery Charger (Canadian Tire) Kenora',244.37),(26,1,1,NULL,NULL,1,'Outcome_Supply','2019-01-19 00:00:00','Coolant Extension Cord (Canadian Tire) Kenora',55.34),(27,1,2,NULL,NULL,1,'Outcome_Supply','2019-01-19 00:00:00','Fuel (Canadian Tire) Kenora',63.39),(28,1,2,NULL,NULL,1,'Outcome_Generic','2019-01-19 00:00:00','Fuel Sierra (Canadian Tire) Kenora',64.94),(29,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-03 00:00:00','Black Asphalt undercoating (x10)',38.03),(30,1,2,NULL,NULL,1,'Outcome_Repair','2019-02-04 00:00:00','Black Asphalt undercoating (x6)',22.82),(31,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-07 00:00:00','Manguera hidraulica cepillo (Princess Auto)',41.05),(32,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-08 00:00:00','Black Asphalt undercoating Thiner',42),(33,1,2,NULL,NULL,1,'Outcome_Repair','2019-02-08 00:00:00','Thiner x2',26.19),(34,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-10 00:00:00','Marty salary',210),(35,1,2,NULL,NULL,1,'Outcome_Repair','2019-02-10 00:00:00','Marty salary',267.5),(36,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-14 00:00:00','Cab corners (Sean)',200),(37,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-15 00:00:00','Flex tubing 10 ft (Piston Ring)',81.36),(38,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-16 00:00:00','Heater paint (Canadian Tire)',14.96),(39,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-19 00:00:00','Paint - Clamps - Bolts',54.07),(40,1,2,NULL,NULL,1,'Outcome_Generic','2019-02-19 00:00:00','Permit and Ownership',120),(41,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-20 00:00:00','Glass windshield',173.65),(42,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-20 00:00:00','Primer - Fast cure (Piston ring)',60),(43,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-23 00:00:00','Body work and windshield (Sean)',100),(44,1,1,NULL,NULL,1,'Outcome_Supply','2019-02-23 00:00:00','Fuel (Husky Winnipeg)',100),(45,1,1,NULL,NULL,1,'Outcome_Generic','2019-02-23 00:00:00','Food at Randy',50),(46,1,2,NULL,NULL,1,'Outcome_Generic','2019-02-23 00:00:00','Fuel (Acadia Huskey Winnipeg)',34),(47,1,1,NULL,NULL,1,'Outcome_Repair','2019-02-23 00:00:00','Marty salary. 6x22. exhaust',132),(48,1,1,NULL,NULL,1,'Outcome_Supply','2019-03-03 00:00:00','OIL Shel T4 DSL 15W40',201.51),(49,1,1,NULL,NULL,1,'Outcome_Supply','2019-03-03 00:00:00','OIL Filter (Piston Ring)',43.77),(50,1,1,NULL,NULL,1,'Outcome_Invest','2019-03-05 00:00:00','Payback International 4300',1000),(51,1,1,NULL,NULL,1,'Outcome_Generic','2019-03-05 00:00:00','Fuel Sierra',20),(52,1,1,NULL,NULL,1,'Outcome_Repair','2019-03-05 00:00:00','Safety and Brakes (Randy)',3136.12),(53,1,2,NULL,NULL,1,'Outcome_Generic','2019-03-05 00:00:00','Registration 1 of 12',89.39),(54,1,2,NULL,NULL,1,'Outcome_Supply','2019-03-05 00:00:00','MPI Insurance',118.5),(55,1,1,NULL,NULL,1,'Outcome_Invest','2019-03-11 00:00:00','CAA Skates - Strap - Tie down system',465.39),(56,1,1,NULL,NULL,1,'Outcome_Supply','2019-03-11 00:00:00','Fuel (Huskey Winnipeg)',130.74),(57,1,1,NULL,NULL,1,'Outcome_Repair','2019-03-15 00:00:00','Paint (Rona)',140.12),(58,1,1,NULL,NULL,1,'Outcome_Generic','2019-03-15 00:00:00','Truck wash',28),(59,1,1,NULL,NULL,1,'Outcome_Generic','2019-03-15 00:00:00','Food at shop',50);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `request` (
  `Client_idClient` int(11) NOT NULL AUTO_INCREMENT,
  `Client_Company_idCompany` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Acepted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Client_idClient`,`Client_Company_idCompany`),
  CONSTRAINT `fk_Request_Client1` FOREIGN KEY (`Client_idClient`, `Client_Company_idCompany`) REFERENCES `client` (`idclient`, `company_idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service` (
  `idService` int(11) NOT NULL AUTO_INCREMENT,
  `Driver_idDriver` int(11) NOT NULL,
  `Driver_Company_idCompany` int(11) NOT NULL,
  `Request_Client_idClient` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Tow` smallint(6) DEFAULT NULL,
  `Flat_Deck` smallint(6) DEFAULT NULL,
  `Dollies` smallint(6) DEFAULT NULL,
  `Km` float DEFAULT NULL,
  `Winch` smallint(6) DEFAULT NULL,
  `Jump_Start` smallint(6) DEFAULT NULL,
  `Flat_Tire` smallint(6) DEFAULT NULL,
  `Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idService`,`Driver_idDriver`,`Driver_Company_idCompany`),
  KEY `fk_Service_Driver1_idx` (`Driver_idDriver`,`Driver_Company_idCompany`),
  KEY `fk_Service_Request1_idx` (`Request_Client_idClient`),
  CONSTRAINT `fk_Service_Driver1` FOREIGN KEY (`Driver_idDriver`, `Driver_Company_idCompany`) REFERENCES `driver` (`iddriver`, `company_idcompany`),
  CONSTRAINT `fk_Service_Request1` FOREIGN KEY (`Request_Client_idClient`) REFERENCES `request` (`client_idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,1,1,NULL,'2019-01-19',0,1,0,0,0,0,0,'Kenora'),(2,1,1,NULL,'2019-03-09',1,0,0,30,0,0,0,'CAA 1490'),(3,2,1,NULL,'2019-03-11',0,0,0,0,0,1,0,'CAA 1728'),(4,2,1,NULL,'2019-03-11',0,0,1,10,0,0,0,'CAA 1925'),(5,2,1,NULL,'2019-03-11',0,0,0,0,0,1,0,'CAA 2417'),(6,2,1,NULL,'2019-03-11',1,0,0,5,0,0,0,'CAA 2650'),(7,1,1,NULL,'2019-03-13',1,0,0,0,0,0,0,'Tow Max'),(8,1,1,NULL,'2019-03-13',0,1,0,20,0,0,0,'Tow Headingley (1)'),(9,1,1,NULL,'2019-03-13',0,1,0,20,0,0,0,'Tow Headingley (2)'),(10,1,1,NULL,'2019-03-14',1,0,0,9,0,0,0,'Tow Juan (1)'),(11,1,1,NULL,'2019-03-14',1,0,0,9,0,0,0,'Tow Juan (2)'),(12,1,1,NULL,'2019-03-14',0,0,0,0,1,0,0,'Winch (1)'),(13,1,1,NULL,'2019-03-14',0,0,0,0,1,0,0,'Winch (2)');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shareholder`
--

DROP TABLE IF EXISTS `shareholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shareholder` (
  `idShareholder` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Phone_Alternative` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Share` float DEFAULT NULL,
  `User` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idShareholder`,`Company_idCompany`),
  KEY `fk_Shareholder_Company1_idx` (`Company_idCompany`),
  CONSTRAINT `fk_Shareholder_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shareholder`
--

LOCK TABLES `shareholder` WRITE;
/*!40000 ALTER TABLE `shareholder` DISABLE KEYS */;
INSERT INTO `shareholder` VALUES (1,1,'Max',NULL,NULL,NULL,NULL,50,NULL,NULL),(2,1,'Hector',NULL,NULL,NULL,NULL,50,NULL,NULL);
/*!40000 ALTER TABLE `shareholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `truck` (
  `idTruck` int(11) NOT NULL AUTO_INCREMENT,
  `Company_idCompany` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Register` varchar(45) DEFAULT NULL,
  `Flatdeck` tinyint(4) DEFAULT NULL,
  `Dollies` tinyint(4) DEFAULT NULL,
  `Winch` tinyint(4) DEFAULT NULL,
  `Flat_Tire` tinyint(4) DEFAULT NULL,
  `Jump_Start` tinyint(4) DEFAULT NULL,
  `Lift_Weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTruck`,`Company_idCompany`),
  KEY `fk_Truck_Company1_idx` (`Company_idCompany`),
  CONSTRAINT `fk_Truck_Company1` FOREIGN KEY (`Company_idCompany`) REFERENCES `company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,'International 4300',NULL,1,1,1,1,1,9000);
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workingday`
--

DROP TABLE IF EXISTS `workingday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `workingday` (
  `idWorkingDay` int(11) NOT NULL AUTO_INCREMENT,
  `Driver_idDriver` int(11) NOT NULL,
  `Truck_idTruck` int(11) NOT NULL,
  `Start` datetime DEFAULT NULL,
  `End` datetime DEFAULT NULL,
  `Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idWorkingDay`,`Driver_idDriver`,`Truck_idTruck`),
  KEY `fk_WorkingDay_Driver1_idx` (`Driver_idDriver`),
  KEY `fk_WorkingDay_Truck1_idx` (`Truck_idTruck`),
  CONSTRAINT `fk_WorkingDay_Driver1` FOREIGN KEY (`Driver_idDriver`) REFERENCES `driver` (`iddriver`),
  CONSTRAINT `fk_WorkingDay_Truck1` FOREIGN KEY (`Truck_idTruck`) REFERENCES `truck` (`idtruck`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workingday`
--

LOCK TABLES `workingday` WRITE;
/*!40000 ALTER TABLE `workingday` DISABLE KEYS */;
/*!40000 ALTER TABLE `workingday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'towingdb'
--

--
-- Dumping routines for database 'towingdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `db_get_service_driver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `db_get_service_driver`(IN id integer)
BEGIN
	select * from service inner join 
    (select * from driver where idDriver = id) as temp_driver 
	on Driver_idDriver = idDriver;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-20 21:23:19
