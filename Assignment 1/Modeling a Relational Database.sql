CREATE DATABASE  IF NOT EXISTS `assignment1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `assignment1`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: assignment1
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `clients_SIN` char(11) NOT NULL,
  `clients_Name` varchar(30) NOT NULL,
  `clients_Address` varchar(45) NOT NULL,
  `clients_Age` int(3) NOT NULL,
  PRIMARY KEY (`clients_SIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES ('584-254-752','Jen Black','20 Keel St.',42),('594-054-872','Dan Parker','180 Bloor St.',21),('597-124-312','Jeff Chu','12 Church St.',51);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contract` (
  `contract_Start_date` date NOT NULL,
  `contract_End_date` date NOT NULL,
  `contract_Text_contract` varchar(120) NOT NULL,
  `ex_Name` varchar(45) NOT NULL,
  `fsi_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ex_Name`,`fsi_Name`),
  KEY `fk_Contract_Financial_Security_Issuer1_idx` (`fsi_Name`),
  CONSTRAINT `fk_Contract_Exchange_market1` FOREIGN KEY (`ex_Name`) REFERENCES `Exchange_market` (`ex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contract_Financial_Security_Issuer1` FOREIGN KEY (`fsi_Name`) REFERENCES `Financial_Security_Issuer` (`fsi_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES ('1991-02-12','2021-02-12','CONFIDENTIAL','Nasdaq','IBM'),('1988-12-12','2024-12-12','CONFIDENTIAL','Nasdaq','Microsoft'),('1992-03-16','2021-03-16','CONFIDENTIAL','New York Stock Exchange','IBM');
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exchange_market`
--

DROP TABLE IF EXISTS `Exchange_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exchange_market` (
  `ex_Name` varchar(45) NOT NULL,
  `ex_Adress` varchar(45) DEFAULT NULL,
  `ex_Phone` char(12) DEFAULT NULL,
  PRIMARY KEY (`ex_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exchange_market`
--

LOCK TABLES `Exchange_market` WRITE;
/*!40000 ALTER TABLE `Exchange_market` DISABLE KEYS */;
INSERT INTO `Exchange_market` VALUES ('Nasdaq','469 King St W.','647-458-7452'),('New York Stock Exchange','11 Wall St.','212-656-3000'),('Toronto Stock Exchange','130 King St W.','416-947-4700');
/*!40000 ALTER TABLE `Exchange_market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exchange_securities`
--

DROP TABLE IF EXISTS `Exchange_securities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exchange_securities` (
  `es_Price` float NOT NULL,
  `es_Currency` varchar(3) NOT NULL,
  `ex_Name` varchar(45) NOT NULL,
  `fs_Trade_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ex_Name`,`fs_Trade_name`),
  UNIQUE KEY `fs_Trade_name_UNIQUE` (`fs_Trade_name`),
  KEY `fk_Exchange_securities_Financial_security1_idx` (`fs_Trade_name`),
  CONSTRAINT `fk_Exchange_securities_Exchange_market1` FOREIGN KEY (`ex_Name`) REFERENCES `Exchange_market` (`ex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exchange_securities_Financial_security1` FOREIGN KEY (`fs_Trade_name`) REFERENCES `Financial_security` (`fs_Trade_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exchange_securities`
--

LOCK TABLES `Exchange_securities` WRITE;
/*!40000 ALTER TABLE `Exchange_securities` DISABLE KEYS */;
INSERT INTO `Exchange_securities` VALUES (132.59,'USD','Nasdaq','IBM Common Stock'),(470.22,'USD','New York Stock Exchange','Microsoft Corporation'),(28,'CAD','Toronto Stock Exchange','TELUS Corporation');
/*!40000 ALTER TABLE `Exchange_securities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_Security_Issuer`
--

DROP TABLE IF EXISTS `Financial_Security_Issuer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_Security_Issuer` (
  `fsi_Name` varchar(45) NOT NULL,
  `fsi_Phone` char(12) DEFAULT NULL,
  PRIMARY KEY (`fsi_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_Security_Issuer`
--

LOCK TABLES `Financial_Security_Issuer` WRITE;
/*!40000 ALTER TABLE `Financial_Security_Issuer` DISABLE KEYS */;
INSERT INTO `Financial_Security_Issuer` VALUES ('IBM','647-024-2124'),('Microsoft','647-125-2122'),('TELUS','647-753-3124');
/*!40000 ALTER TABLE `Financial_Security_Issuer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_advisor`
--

DROP TABLE IF EXISTS `Financial_advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_advisor` (
  `fa_SIN` char(11) NOT NULL,
  `fa_Name` varchar(45) NOT NULL,
  `fa_Specialty` varchar(15) NOT NULL,
  `fa_Experience_yrs` int(2) NOT NULL,
  PRIMARY KEY (`fa_SIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_advisor`
--

LOCK TABLES `Financial_advisor` WRITE;
/*!40000 ALTER TABLE `Financial_advisor` DISABLE KEYS */;
INSERT INTO `Financial_advisor` VALUES ('584-215-421','Jimmy Cent','Insurance',21),('594-211-145','Helen Su','Retirement',1),('594-540-274','Ken Kim','Stocks',12);
/*!40000 ALTER TABLE `Financial_advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_advisor_Clients`
--

DROP TABLE IF EXISTS `Financial_advisor_Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_advisor_Clients` (
  `clients_SIN` char(11) NOT NULL,
  `fa_SIN` char(11) NOT NULL,
  PRIMARY KEY (`clients_SIN`,`fa_SIN`),
  KEY `fk_Financial_advisor_has_Clients_Clients1_idx` (`clients_SIN`),
  KEY `fk_Financial_advisor_Clients_Financial_advisor1_idx` (`fa_SIN`),
  CONSTRAINT `fk_Financial_advisor_Clients_Financial_advisor1` FOREIGN KEY (`fa_SIN`) REFERENCES `Financial_advisor` (`fa_SIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Financial_advisor_has_Clients_Clients1` FOREIGN KEY (`clients_SIN`) REFERENCES `Clients` (`clients_SIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_advisor_Clients`
--

LOCK TABLES `Financial_advisor_Clients` WRITE;
/*!40000 ALTER TABLE `Financial_advisor_Clients` DISABLE KEYS */;
INSERT INTO `Financial_advisor_Clients` VALUES ('584-254-752','594-540-274'),('594-054-872','594-540-274'),('597-124-312','584-215-421'),('597-124-312','594-211-145');
/*!40000 ALTER TABLE `Financial_advisor_Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Financial_security`
--

DROP TABLE IF EXISTS `Financial_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Financial_security` (
  `fs_Symbol` varchar(10) NOT NULL,
  `fs_Trade_name` varchar(45) NOT NULL,
  `fsi_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`fs_Trade_name`),
  UNIQUE KEY `fs_Trade_name_UNIQUE` (`fs_Trade_name`),
  KEY `fk_Financial_security_Financial_Security_Issuer1_idx` (`fsi_Name`),
  CONSTRAINT `fk_Financial_security_Financial_Security_Issuer1` FOREIGN KEY (`fsi_Name`) REFERENCES `Financial_Security_Issuer` (`fsi_Name`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Financial_security`
--

LOCK TABLES `Financial_security` WRITE;
/*!40000 ALTER TABLE `Financial_security` DISABLE KEYS */;
INSERT INTO `Financial_security` VALUES ('IBM','IBM Common Stock','IBM'),('MSFT','Microsoft Corporation','Microsoft'),('TU','TELUS Corporation','TELUS');
/*!40000 ALTER TABLE `Financial_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommendations`
--

DROP TABLE IF EXISTS `Recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recommendations` (
  `rec_Date` date NOT NULL,
  `rec_Quantity` int(11) NOT NULL,
  `ex_Name` varchar(45) NOT NULL,
  `fs_Trade_name` varchar(45) NOT NULL,
  `clients_SIN` char(11) NOT NULL,
  `fa_SIN` char(11) NOT NULL,
  PRIMARY KEY (`ex_Name`,`fs_Trade_name`,`clients_SIN`,`fa_SIN`),
  KEY `fk_Recommendations_Exchange_securities1_idx` (`ex_Name`,`fs_Trade_name`),
  KEY `fk_Recommendations_Financial_advisor_Clients1_idx` (`clients_SIN`,`fa_SIN`),
  CONSTRAINT `fk_Recommendations_Exchange_securities1` FOREIGN KEY (`ex_Name`, `fs_Trade_name`) REFERENCES `Exchange_securities` (`ex_Name`, `fs_Trade_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recommendations_Financial_advisor_Clients1` FOREIGN KEY (`clients_SIN`, `fa_SIN`) REFERENCES `Financial_advisor_Clients` (`clients_SIN`, `fa_SIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recommendations`
--

LOCK TABLES `Recommendations` WRITE;
/*!40000 ALTER TABLE `Recommendations` DISABLE KEYS */;
INSERT INTO `Recommendations` VALUES ('2015-05-03',1050,'New York Stock Exchange','Microsoft Corporation','584-254-752','594-540-274'),('2020-05-03',5,'New York Stock Exchange','Microsoft Corporation','594-054-872','594-540-274'),('1995-05-03',200000,'New York Stock Exchange','Microsoft Corporation','597-124-312','594-211-145');
/*!40000 ALTER TABLE `Recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'assignment1'
--

--
-- Dumping routines for database 'assignment1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-12 20:59:42
