CREATE DATABASE  IF NOT EXISTS `hospital_project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital_project`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: hospital_project
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Temporary view structure for view `Available_Rooms`
--

DROP TABLE IF EXISTS `Available_Rooms`;
/*!50001 DROP VIEW IF EXISTS `Available_Rooms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Available_Rooms` AS SELECT 
 1 AS `Rno`,
 1 AS `RName`,
 1 AS `Dno`,
 1 AS `RStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Deparment_Senior`
--

DROP TABLE IF EXISTS `Deparment_Senior`;
/*!50001 DROP VIEW IF EXISTS `Deparment_Senior`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Deparment_Senior` AS SELECT 
 1 AS `DoctorName`,
 1 AS `asTtimeWorked`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Good_staff_by_dept`
--

DROP TABLE IF EXISTS `Good_staff_by_dept`;
/*!50001 DROP VIEW IF EXISTS `Good_staff_by_dept`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Good_staff_by_dept` AS SELECT 
 1 AS `DoctorName`,
 1 AS `Telephone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Large_Salary_Positions`
--

DROP TABLE IF EXISTS `Large_Salary_Positions`;
/*!50001 DROP VIEW IF EXISTS `Large_Salary_Positions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Large_Salary_Positions` AS SELECT 
 1 AS `Sposition`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Patients_In_Rooms`
--

DROP TABLE IF EXISTS `Patients_In_Rooms`;
/*!50001 DROP VIEW IF EXISTS `Patients_In_Rooms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Patients_In_Rooms` AS SELECT 
 1 AS `Hcn`,
 1 AS `PName`,
 1 AS `Address`,
 1 AS `Telephone`,
 1 AS `Gender`,
 1 AS `BirthDate`,
 1 AS `Dno`,
 1 AS `DName`,
 1 AS `Hno`,
 1 AS `rno`,
 1 AS `RName`,
 1 AS `RStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `assigned`
--

DROP TABLE IF EXISTS `assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned` (
  `Rno` int(11) NOT NULL,
  `PHcn` int(11) NOT NULL,
  `Checkin` datetime NOT NULL,
  PRIMARY KEY (`PHcn`,`Checkin`),
  KEY `fk_Assigned_2_idx` (`PHcn`),
  KEY `fk_Assigned_1` (`Rno`),
  CONSTRAINT `fk_Assigned_1` FOREIGN KEY (`Rno`) REFERENCES `rooms` (`Rno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Assigned_2` FOREIGN KEY (`PHcn`) REFERENCES `patient` (`Hcn`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned`
--

LOCK TABLES `assigned` WRITE;
/*!40000 ALTER TABLE `assigned` DISABLE KEYS */;
INSERT INTO `assigned` VALUES (11,1211122,'2015-01-20 10:10:10'),(12,1211122,'2014-01-20 10:10:10'),(13,1211122,'2013-02-20 11:10:10'),(14,1211122,'2015-11-20 12:10:10'),(21,1211122,'2015-03-25 13:10:10'),(22,1211122,'2015-09-20 14:10:10'),(23,2111122,'2016-02-21 15:21:23'),(24,1215122,'2017-03-22 18:22:59'),(31,1211332,'2011-04-02 22:21:10'),(32,1211332,'2011-07-02 22:21:10'),(33,5211122,'2005-07-08 05:05:05'),(34,5217122,'2017-03-08 09:08:02'),(41,5216666,'2017-01-01 06:06:01'),(42,9821381,'2000-02-03 00:00:59');
/*!40000 ALTER TABLE `assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caresfor`
--

DROP TABLE IF EXISTS `caresfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caresfor` (
  `DSsn` int(11) NOT NULL,
  `PHcn` int(11) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`DSsn`,`PHcn`),
  KEY `fk_CaresFor_2_idx` (`PHcn`),
  CONSTRAINT `fk_CaresFor_1` FOREIGN KEY (`DSsn`) REFERENCES `doctors` (`Ssn`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_CaresFor_2` FOREIGN KEY (`PHcn`) REFERENCES `patient` (`Hcn`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caresfor`
--

LOCK TABLES `caresfor` WRITE;
/*!40000 ALTER TABLE `caresfor` DISABLE KEYS */;
INSERT INTO `caresfor` VALUES (4321,1211122,'2001-05-30 00:00:00','0000-00-00 00:00:00'),(4321,5211122,'2004-05-30 00:00:00','0000-00-00 00:00:00'),(4322,1261122,'2005-05-30 00:00:00','0000-00-00 00:00:00'),(4322,2111122,'2004-05-30 00:00:00','0000-00-00 00:00:00'),(4323,1215122,'2005-05-30 00:00:00','0000-00-00 00:00:00'),(4325,1211422,'2005-05-30 00:00:00','0000-00-00 00:00:00'),(4326,1211332,'2006-05-30 00:00:00','0000-00-00 00:00:00'),(4327,5217122,'2006-05-30 00:00:00','0000-00-00 00:00:00'),(4328,5288882,'2006-05-30 00:00:00','0000-00-00 00:00:00'),(4330,9821384,'2010-05-30 00:00:00','0000-00-00 00:00:00'),(4331,5213332,'2007-05-30 00:00:00','0000-00-00 00:00:00'),(4332,5216666,'2007-05-30 00:00:00','0000-00-00 00:00:00'),(4333,1111111,'2008-05-30 00:00:00','0000-00-00 00:00:00'),(4337,9821383,'2009-05-30 00:00:00','0000-00-00 00:00:00'),(4339,9821388,'2012-05-30 00:00:00','0000-00-00 00:00:00'),(4340,9821382,'2009-05-30 00:00:00','0000-00-00 00:00:00'),(4341,9821381,'2008-05-30 00:00:00','0000-00-00 00:00:00'),(4343,9821387,'2011-05-30 00:00:00','0000-00-00 00:00:00'),(4344,9821386,'2011-05-30 00:00:00','0000-00-00 00:00:00'),(4345,9821385,'2010-05-30 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `caresfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dno` int(11) NOT NULL,
  `DName` varchar(45) NOT NULL,
  `Hno` int(11) NOT NULL,
  PRIMARY KEY (`Dno`,`Hno`),
  KEY `fk_Department_1_idx` (`Hno`),
  CONSTRAINT `fk_Department_1` FOREIGN KEY (`Hno`) REFERENCES `hospital` (`Hno`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,' Accident and Emergency',1),(2,' Anaesthetics',1),(3,' Diagnostic imaging',1),(4,' Discharge lounge',1),(5,' Ear nose and throat',1),(6,' Gastroenterology',1),(7,' General surgery',1),(8,' Gynaecology',1),(9,' Haematology',1),(10,' Maternity departments',1),(11,' Microbiologyy',1),(12,' Neonatal unit',1),(13,' Nephrology',1),(14,' Neurology',1),(15,' Nutrition and dietetics',1),(16,' Obstetrics',1),(17,' Oncology',1),(18,' Ophthalmology',1),(19,' Orthopaedics',1),(20,' Pharmacy',1),(21,' Physiotherapy',1),(22,' Radiotherapy',1),(23,' Renal unit',1),(24,' Rheumatology',1),(25,' Urology',1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `Ssn` int(11) NOT NULL,
  `DoctorName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_Doctors_1_idx` (`Dno`),
  CONSTRAINT `fk_Doctors_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (4321,' Bob Barker',' 422 pront St',' 123-1234',' M','1978-05-06 00:00:00','1998-05-06 00:00:00',1),(4322,' Sob Sarker',' 421 furont St',' 432-7097',' F','1978-05-07 00:00:00','1998-05-07 00:00:00',2),(4323,' job jarker',' 424 friont St',' 246-3245',' M','1978-05-08 00:00:00','1998-05-07 00:00:00',3),(4324,' Lob Larker',' 423 froint St',' 543-6463',' F','1978-05-09 00:00:00','1998-05-09 00:00:00',4),(4325,' Rob Rarker',' 425 fronty St',' 546-9680',' M','1978-05-10 00:00:00','1998-05-10 00:00:00',5),(4326,' Snob snarker',' 426 fronts St',' 345-7987',' F','1978-05-11 00:00:00','1998-05-11 00:00:00',6),(4327,' grob grarker',' 427 pront St',' 234-9685',' M','1978-05-12 00:00:00','1998-05-12 00:00:00',7),(4328,' tob tarker',' 428 bront St',' 059-4905',' F','1978-05-13 00:00:00','1998-05-13 00:00:00',8),(4329,' glob glarker',' 429 tront St',' 090-3456',' M','1978-05-14 00:00:00','1998-05-14 00:00:00',9),(4330,' Ding Dongly',' 430 wront St',' 948-9689',' F','1978-05-15 00:00:00','1998-05-15 00:00:00',10),(4331,' Frong frigly',' 431 aront St',' 393-9585',' M','1978-05-16 00:00:00','1998-05-16 00:00:00',11),(4332,' bill newark',' 432 xront St',' 214-4984',' F','1978-05-17 00:00:00','1998-05-17 00:00:00',12),(4333,' Joe Shmoesly',' 4241 front St','123-9090',' M','1978-05-18 00:00:00','1998-05-18 00:00:00',13),(4334,' Phill lanthropist',' 42231 front St','546-8675',' M','1978-05-19 00:00:00','1998-05-19 00:00:00',14),(4335,' Patrick Mcsorely',' 422341 front St','345-6786',' F','1978-05-20 00:00:00','1998-05-20 00:00:00',15),(4336,' Auston Matthews',' 426231 front St','989-9989',' M','1978-05-21 00:00:00','1998-05-21 00:00:00',16),(4337,' Zach Hyman',' 42361 front St',' 889-0093',' M','1978-05-22 00:00:00','1998-05-22 00:00:00',17),(4338,' William Nylander',' 434521 front St','887-3442',' M','1978-05-23 00:00:00','1998-05-23 00:00:00',18),(4339,' Patrick Marleau',' 45421 front St',' 909-0988',' M','1978-05-24 00:00:00','1998-05-24 00:00:00',19),(4340,' Nazem Kadri',' 3456421 front St','884-8857',' M','1978-05-25 00:00:00','1998-05-25 00:00:00',20),(4341,' Leo Komorav',' 34421 front St','466-8857',' M','1978-05-26 00:00:00','1998-05-26 00:00:00',21),(4342,' James Van Riemsdyk',' 34421 front St','775-9978',' M','1978-05-27 00:00:00','1998-05-27 00:00:00',22),(4343,' Tyler Bozak',' 45621 front St',' 847-9984',' M','1978-05-28 00:00:00','1998-05-28 00:00:00',23),(4344,' Connor Brown',' 34421 front St','880-3421',' M','1978-05-29 00:00:00','1998-05-29 00:00:00',24),(4345,' Mitch Marner',' 465621 front St','345-1289',' M','1980-05-02 00:00:00','1999-06-03 00:00:00',25),(4346,' Snidely nogoodnik',' 23422 back alley',' 666-6666',' M ','1990-05-30 00:00:00','2015-05-01 00:00:00',1),(4347,' Snidely McEvilPants',' 23422 back alley',' 666-6666',' M','1990-05-30 00:00:00','2015-05-01 00:00:00',2);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `find_patient`
--

DROP TABLE IF EXISTS `find_patient`;
/*!50001 DROP VIEW IF EXISTS `find_patient`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `find_patient` AS SELECT 
 1 AS `Hcn`,
 1 AS `PName`,
 1 AS `Dno`,
 1 AS `DName`,
 1 AS `Rno`,
 1 AS `RName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Hno` int(11) NOT NULL,
  `HName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Hno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,' Hospital of Ontario Institute of Technology',' 2000 Simcoe St Oshawa ON',' 905-721-8668'),(2,' Carleton Hospital',' 1125 Colonel By Dr Ottawa ON',' 613-520-2600'),(3,' Hospital of Waterloo',' 200 Hospital AVE W Waterloo ON',' 519-888-4567'),(4,' McMaster Hospital',' 1280 Main St W Hamilton ON',' 905-525-9140'),(5,' Hospital of Toronto',' 27 Kings College Cir Toronto ON',' 416-978-2011'),(6,' Queens Hospital',' 99 Hospital AVE Kingston ON',' 613-533-2000');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `num_patients_department`
--

DROP TABLE IF EXISTS `num_patients_department`;
/*!50001 DROP VIEW IF EXISTS `num_patients_department`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `num_patients_department` AS SELECT 
 1 AS `Dno`,
 1 AS `DName`,
 1 AS `numPatients`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `Hcn` int(11) NOT NULL,
  `PName` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Hcn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1111111,' Winnie Pooh',' 106 Jump St.',' 934-211-3121',' F','2005-05-23 00:00:00'),(1211122,' Bobby Baker',' 223 fake st.',' 111-222-3333',' M','1990-02-01 00:00:00'),(1211332,' Bobert Baker',' 123 zahe dr.',' 112-222-3933',' F','1990-02-06 00:00:00'),(1211422,' Donna Smith',' 553 ake Dr.',' 111-222-3833',' F','1980-04-03 00:00:00'),(1215122,' Toby Baker',' 423 take st.',' 111-222-3733',' M','1970-07-02 00:00:00'),(1261122,' Sara Baker',' 723 sake st.',' 111-222-3633',' F','1960-08-11 00:00:00'),(2111122,' Ryan Guy',' 523 fabe st.',' 111-222-3533',' M','1930-01-24 00:00:00'),(5211122,' Bob Baker',' 323 fab st.',' 111-222-3433',' M','1950-02-01 00:00:00'),(5213332,' Jimmy Go',' 223 Baker St.',' 534-311-3126',' M','2002-05-23 00:00:00'),(5216666,' Limmy Go',' 211 Jimmy Dr.',' 534-231-3123',' M','2001-05-23 00:00:00'),(5217122,' Timmy Bro',' 226 Electric Ave.',' 534-311-3123',' M','2004-05-23 00:00:00'),(5288882,' Timmy To',' 221 Jaunt Ave.',' 534-212-3129',' M','2003-05-23 00:00:00'),(9821381,' Slimmy Jimmy',' 999 Jump Ave.',' 594-230-3126',' M','2006-05-23 00:00:00'),(9821382,' Rimmy Jammy',' 999 Route Ave.',' 539-230-3126',' M','2006-05-23 00:00:00'),(9821383,' Ay Jimmy',' 999 October Ave.',' 534-230-9126',' M','2006-05-23 00:00:00'),(9821384,' AJ Philips',' 999 April Ave.',' 534-990-3126',' M','2006-05-23 00:00:00'),(9821385,' Abaz Labaz',' 112 Electric Ave.',' 534-290-3126',' M','2006-05-23 00:00:00'),(9821386,' Remi Doglas',' 990 Electric Ave.',' 534-135-3126',' M','2006-05-23 00:00:00'),(9821387,' Kim Lim',' 999 Ele Ave.',' 555-230-3126',' F','2006-05-23 00:00:00'),(9821388,' Slimmy Jimmy',' 999 Elec Ave.',' 534-555-3126',' M','2006-05-23 00:00:00');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientrecords`
--

DROP TABLE IF EXISTS `patientrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientrecords` (
  `PHcn` int(11) NOT NULL,
  `Illness` varchar(45) NOT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `Medication` varchar(45) DEFAULT NULL,
  `Physician` varchar(45) DEFAULT NULL,
  `Symptoms` varchar(45) DEFAULT NULL,
  `CaseN` int(11) NOT NULL,
  PRIMARY KEY (`CaseN`),
  KEY `fk_PatientRecords_1` (`PHcn`),
  CONSTRAINT `fk_PatientRecords_1` FOREIGN KEY (`PHcn`) REFERENCES `patient` (`Hcn`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientrecords`
--

LOCK TABLES `patientrecords` WRITE;
/*!40000 ALTER TABLE `patientrecords` DISABLE KEYS */;
INSERT INTO `patientrecords` VALUES (1211332,' Stomach Flu','2011-07-02 22:21:10','0000-00-00 00:00:00',' Kim Possible',' Vomit','9',0),(1211122,' Flu','2015-01-20 10:10:10','0000-00-00 00:00:00',' Antibiotics',' Jim Bob',' Sore Throat',1),(1211122,' Broken Arm','2014-01-20 10:10:10','0000-00-00 00:00:00',' Painkillers',' Jim Bob',' Arm pain',2),(1211122,' Broken Leg','2013-02-20 11:10:10','0000-00-00 00:00:00','Painkillers',' Jim Bob',' Leg pain',3),(1211122,' Heart Attack','2015-11-20 12:10:10','0000-00-00 00:00:00',' Blood Thinners',' Jim Bob',' Chest pain',4),(1211122,' Ischemic Stroke','2015-03-25 13:10:10','0000-00-00 00:00:00',' Blood Thinners',' Jim Bob',' Disoriented',5),(1211122,' Broken Hip','2015-09-20 14:10:10','0000-00-00 00:00:00','Painkillers',' Jim Bob',' Hip pain',6),(1211332,' Cold','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics',' Kim Possible',' Cough',7),(1211332,' Cold','2011-07-02 22:21:10','0000-00-00 00:00:00','Antibiotics',' Kim Possible',' Cough',8),(5213332,' Leukemia','2011-04-02 22:21:10','0000-00-00 00:00:00','Chemo',' Ryan Jacobs',' Fatigue',10),(5216666,' Allergic Reaction','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',11),(1111111,' Heat Stroke','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',12),(1111111,' Dislocated Shoulder','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',13),(9821382,' Cut Arm','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',14),(9821383,' Burns','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',15),(9821384,' Concussion','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',16),(9821385,' Cold','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',17),(9821386,' Flu','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',18),(9821387,' Flu','2011-04-02 22:21:10','0000-00-00 00:00:00','Antibiotics','Jim Bob','Sore Throat',19);
/*!40000 ALTER TABLE `patientrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patients_per_doctor`
--

DROP TABLE IF EXISTS `patients_per_doctor`;
/*!50001 DROP VIEW IF EXISTS `patients_per_doctor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `patients_per_doctor` AS SELECT 
 1 AS `DoctorName`,
 1 AS `PName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pay_Roll`
--

DROP TABLE IF EXISTS `pay_Roll`;
/*!50001 DROP VIEW IF EXISTS `pay_Roll`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pay_Roll` AS SELECT 
 1 AS `Sum(Salary)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `roomInfo`
--

DROP TABLE IF EXISTS `roomInfo`;
/*!50001 DROP VIEW IF EXISTS `roomInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `roomInfo` AS SELECT 
 1 AS `Dno`,
 1 AS `Rno`,
 1 AS `RName`,
 1 AS `Hcn`,
 1 AS `PName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `Rno` int(11) NOT NULL,
  `RName` varchar(45) NOT NULL,
  `Dno` int(11) DEFAULT NULL,
  `RStatus` varchar(45) DEFAULT 'Availible',
  PRIMARY KEY (`Rno`),
  KEY `fk_Rooms_1_idx` (`Dno`),
  CONSTRAINT `fk_Rooms_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (11,' Accident and Emergency Room',1,' Availible'),(12,' Anaesthetics Room',2,' occupied'),(13,' Diagnostic imaging Room',3,' Availible'),(14,' Discharge lounge',4,' occupied'),(15,' Ear nose and throat Room',5,' Availible'),(21,' Gastroenterology Room',6,' occupied'),(22,' General surgery Room',7,' Availible'),(23,' Gynaecology Room',8,' occupied'),(24,' Haematology Room',9,' occupied'),(25,' Maternity department',10,'Availible'),(31,' Microbiology Room',11,' occupied'),(32,' Neonatal unit',12,' Availible'),(33,' Nephrology Room',13,'Availible'),(34,' Neurology Room',14,'Availible'),(35,' Nutrition and dietetics Room',15,''),(41,' Obstetrics Room',16,' occupied'),(42,' Oncology Room',17,'Availible'),(43,' Ophthalmology Room',18,'Availible'),(44,' Orthopaedics Room',19,' occupied'),(45,' Pharmacy Room',20,'Availible'),(51,' Physiotherapy Room',21,' Availible'),(52,' Radiotherapy Room',22,' occupied'),(53,' Renal unit Room',23,' Availible'),(54,' Rheumatology Room',24,' Availible'),(55,' Urology Room',25,' occupied');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Ssn` int(11) NOT NULL,
  `SName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  `SPosition` varchar(45) NOT NULL,
  `Salary` int(10) DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_Staff_1_idx` (`Dno`),
  CONSTRAINT `fk_Staff_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1134,' Jason Dill',' 128 avenue ln',' 999-0993',' M','1981-03-02 00:00:00',7,'Nurse',80000),(1234,' John Smith',' 123 road st',' 999-0123',' M','1981-01-01 00:00:00',1,' Nurse ',80000),(1235,' Maggie Smith',' 124 road st',' 999-0124',' F','1981-02-02 00:00:00',2,' Nurse',80000),(1255,' Isaiah Thomas',' 126 street rd',' 999-9123',' M','1989-02-07 00:00:00',5,' Point Guard',1000000),(1264,' Randy Savage',' 125 road st',' 999-4123',' M','1981-02-03 00:00:00',3,' Nurse',80000),(1277,' Bill Laimbeer',' 127 street rd',' 999-4423',' M','1957-05-19 00:00:00',6,' Center',2000000),(1284,' Harriet Tubman',' 126 road st',' 999-4123',' F','1981-03-01 00:00:00',4,' Nurse',80000),(2134,' rason Dill',' 228 avenue ln',' 899-0993',' M','1981-03-02 00:00:00',17,'Nurse',80000),(2234,' Rick James',' 129 avenue ln',' 999-0148',' M','1981-03-04 00:00:00',8,'Nurse',80000),(2235,' raggie Smith',' 224 road st',' 899-0124',' F','1981-02-02 00:00:00',12,' Nurse',80000),(2255,' rsaiah Thomas',' 226 street rd',' 899-9123',' M','1989-02-07 00:00:00',15,' Point Guard',1000000),(2264,' bandy Savage',' 225 road st',' 899-4123',' M','1981-02-03 00:00:00',13,' Nurse',80000),(2277,' rill Laimbeer',' 227 street rd',' 899-4423',' M','1957-05-19 00:00:00',16,' Center',2000000),(2284,' rarriet Tubman',' 226 road st',' 899-4123',' F','1981-03-01 00:00:00',14,' Nurse',80000),(2444,' rave McCain',' 231 canal cres',' 899-0567',' M','1981-06-06 00:00:00',20,' Nurse',81000),(2684,' rlay Davis',' 230 lane ave',' 899-016',' M','1981-03-05 00:00:00',19,'Nurse',80000),(3234,' bick James',' 229 avenue ln',' 899-0148',' M','1981-03-04 00:00:00',18,'Nurse',80000),(5684,' Clay Davis',' 130 lane ave',' 999-016',' M','1981-03-05 00:00:00',9,'Nurse',80000),(8444,' Dave McCain',' 131 canal cres',' 999-0567',' M','1981-06-06 00:00:00',10,' Nurse',80000);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Available_Rooms`
--

/*!50001 DROP VIEW IF EXISTS `Available_Rooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Available_Rooms` AS select `rooms`.`Rno` AS `Rno`,`rooms`.`RName` AS `RName`,`rooms`.`Dno` AS `Dno`,`rooms`.`RStatus` AS `RStatus` from `rooms` where (`rooms`.`RStatus` like '%Availible%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Deparment_Senior`
--

/*!50001 DROP VIEW IF EXISTS `Deparment_Senior`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Deparment_Senior` AS select `D1`.`DoctorName` AS `DoctorName`,((to_days(now()) - to_days(`D1`.`StartDate`)) / 365) AS `asTtimeWorked` from `doctors` `D1` where (((to_days(now()) - to_days(`D1`.`StartDate`)) / 365) > (select avg(((to_days(now()) - to_days(`D2`.`StartDate`)) / 365)) from `doctors` `D2` where (`D1`.`Dno` = `D2`.`Dno`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Good_staff_by_dept`
--

/*!50001 DROP VIEW IF EXISTS `Good_staff_by_dept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Good_staff_by_dept` AS select `doctors`.`DoctorName` AS `DoctorName`,`doctors`.`Telephone` AS `Telephone` from `doctors` where ((`doctors`.`Dno` = 1) and `doctors`.`DoctorName` in (select `doctors`.`DoctorName` from `doctors` where (not((`doctors`.`DoctorName` like '%Snidely%'))))) union select `doctors`.`DoctorName` AS `DoctorName`,`doctors`.`Telephone` AS `Telephone` from `doctors` where ((`doctors`.`Dno` = 2) and `doctors`.`DoctorName` in (select `doctors`.`DoctorName` from `doctors` where (not((`doctors`.`DoctorName` like '%Snidely%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Large_Salary_Positions`
--

/*!50001 DROP VIEW IF EXISTS `Large_Salary_Positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Large_Salary_Positions` AS select `staff`.`SPosition` AS `Sposition` from `staff` where `staff`.`Salary` > all (select `staff`.`Salary` from `staff` where (`staff`.`SPosition` like '%Nurse%')) group by `staff`.`SPosition` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Patients_In_Rooms`
--

/*!50001 DROP VIEW IF EXISTS `Patients_In_Rooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Patients_In_Rooms` AS select `p`.`Hcn` AS `Hcn`,`p`.`PName` AS `PName`,`p`.`Address` AS `Address`,`p`.`Telephone` AS `Telephone`,`p`.`Gender` AS `Gender`,`p`.`BirthDate` AS `BirthDate`,`d`.`Dno` AS `Dno`,`d`.`DName` AS `DName`,`d`.`Hno` AS `Hno`,`r`.`Rno` AS `rno`,`r`.`RName` AS `RName`,`r`.`RStatus` AS `RStatus` from (((`department` `d` join `assigned` `a`) join `patient` `p` on((`a`.`PHcn` = `p`.`Hcn`))) join `rooms` `r` on((`r`.`RStatus` <> 'Available'))) where ((`r`.`Dno` = `d`.`Dno`) and (`a`.`Rno` = `r`.`Rno`)) order by `p`.`PName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `find_patient`
--

/*!50001 DROP VIEW IF EXISTS `find_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `find_patient` AS select `P`.`Hcn` AS `Hcn`,`P`.`PName` AS `PName`,`D`.`Dno` AS `Dno`,`D`.`DName` AS `DName`,`R`.`Rno` AS `Rno`,`R`.`RName` AS `RName` from (((`patient` `P` join `rooms` `R`) join `assigned` `A`) join `department` `D`) where ((`P`.`Hcn` = `A`.`PHcn`) and (`A`.`Rno` = `R`.`Rno`) and (`R`.`Dno` = `D`.`Dno`) and `A`.`Checkin` in (select max(`A2`.`Checkin`) from `assigned` `A2` where (`A2`.`PHcn` = `P`.`Hcn`) group by `P`.`Hcn`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `num_patients_department`
--

/*!50001 DROP VIEW IF EXISTS `num_patients_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `num_patients_department` AS select `D`.`Dno` AS `Dno`,`D`.`DName` AS `DName`,count(0) AS `numPatients` from (((`department` `D` join `rooms` `R`) join `assigned` `A`) join `patient` `P`) where ((`D`.`Dno` = `R`.`Dno`) and (`R`.`Rno` = `A`.`Rno`) and (`A`.`PHcn` = `P`.`Hcn`)) group by `D`.`Dno`,`D`.`DName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patients_per_doctor`
--

/*!50001 DROP VIEW IF EXISTS `patients_per_doctor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patients_per_doctor` AS select `D`.`DoctorName` AS `DoctorName`,`P`.`PName` AS `PName` from ((`doctors` `D` left join `caresfor` `C` on((`D`.`Ssn` = `C`.`DSsn`))) left join `patient` `P` on((`C`.`PHcn` = `P`.`Hcn`))) order by `D`.`DoctorName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pay_Roll`
--

/*!50001 DROP VIEW IF EXISTS `pay_Roll`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pay_Roll` AS select sum(`staff`.`Salary`) AS `Sum(Salary)` from `staff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `roomInfo`
--

/*!50001 DROP VIEW IF EXISTS `roomInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roomInfo` AS select `R`.`Dno` AS `Dno`,`R`.`Rno` AS `Rno`,`R`.`RName` AS `RName`,`P`.`Hcn` AS `Hcn`,`P`.`PName` AS `PName` from ((`rooms` `R` left join `assigned` `A` on((`R`.`Rno` = `A`.`Rno`))) left join `patient` `P` on((`A`.`PHcn` = `P`.`Hcn`))) union select `R`.`Dno` AS `Dno`,`R`.`Rno` AS `Rno`,`R`.`RName` AS `RName`,`P`.`Hcn` AS `Hcn`,`P`.`PName` AS `PName` from (`patient` `P` left join (`assigned` `A` left join `rooms` `R` on((`R`.`Rno` = `A`.`Rno`))) on((`A`.`PHcn` = `P`.`Hcn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 14:18:28
