CREATE DATABASE  IF NOT EXISTS `healthcare`
USE `healthcare`;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `empID` char(7) NOT NULL,
  `empName` varchar(45) NOT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES ('1019226','Inness Rozenzweig'),('3065518','Louella Burry'),('3906825','Donetta Heynen'),('5177318','Harland Lawling'),('9012207','Bucky Guildford');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callagent`
--

DROP TABLE IF EXISTS `callagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `callagent` (
  `datetime` datetime NOT NULL,
  `memberID` char(16) NOT NULL,
  `empID` char(7) NOT NULL,
  PRIMARY KEY (`datetime`,`memberID`,`empID`),
  KEY `agentcall2_idx` (`empID`),
  CONSTRAINT `agentcall1` FOREIGN KEY (`datetime`, `memberID`) REFERENCES `phonecall` (`datetime`, `memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `agentcall2` FOREIGN KEY (`empID`) REFERENCES `agent` (`empID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callagent`
--

LOCK TABLES `callagent` WRITE;
/*!40000 ALTER TABLE `callagent` DISABLE KEYS */;
INSERT INTO `callagent` VALUES ('2023-12-25 18:55:00','PLUL20KQ5BKSVRPR','1019226'),('2023-12-12 06:55:00','5KQKN97DRSX0NDNT','3065518'),('2023-12-02 22:41:00','OY1OYNGF2591BETZ','3906825'),('2023-12-05 17:14:00','OY1OYNGF2591BETZ','3906825'),('2023-12-02 22:41:00','OY1OYNGF2591BETZ','5177318'),('2023-12-27 10:59:00','NL7WUH9DS0YC7U2M','5177318'),('2023-12-02 22:41:00','OY1OYNGF2591BETZ','9012207'),('2023-12-27 10:59:00','NL7WUH9DS0YC7U2M','9012207');
/*!40000 ALTER TABLE `callagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthcareprocedure`
--

DROP TABLE IF EXISTS `healthcareprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthcareprocedure` (
  `procedureName` varchar(45) NOT NULL,
  `medicalCode` char(5) NOT NULL,
  PRIMARY KEY (`medicalCode`),
  UNIQUE KEY `procedureName_UNIQUE` (`procedureName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthcareprocedure`
--

LOCK TABLES `healthcareprocedure` WRITE;
/*!40000 ALTER TABLE `healthcareprocedure` DISABLE KEYS */;
INSERT INTO `healthcareprocedure` VALUES ('Administering a flu shot','90658'),('COVID-19 test','87635'),('Preventive exam for patients over 65','99397'),('Stitching a 1-inch cut','12002'),('Therapeutic exercises','97110');
/*!40000 ALTER TABLE `healthcareprocedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memberID` char(16) NOT NULL,
  `memberName` varchar(45) NOT NULL,
  `balance` decimal(7,2) NOT NULL,
  `workplaceID` char(5) NOT NULL,
  `planID` char(6) NOT NULL,
  PRIMARY KEY (`memberID`),
  KEY `memberWorkplace_idx` (`workplaceID`),
  KEY `memberPlan_idx` (`planID`),
  KEY `memberPlan_idx1` (`workplaceID`,`planID`),
  CONSTRAINT `memberPlan` FOREIGN KEY (`workplaceID`, `planID`) REFERENCES `workplaceplan` (`workplaceID`, `planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('050QDPI0WWKSQZOP','Larissa Saura',0.00,'31565','VC7FZA'),('0ZUA0MQQJ20IR3JU','Damiano Jackman',0.00,'46537','VC7FZA'),('52F1RQ40012LVPJK','Marina Worts',0.00,'31565','WH15EW'),('5G1AUQ6Y3I4HBWTV','Yolanda Pickerill',0.00,'31565','VC7FZA'),('5KQKN97DRSX0NDNT','Dolf Chritchlow',0.00,'31565','WH15EW'),('7OENC21ZOLF9EGTX','Justino Goodson',0.00,'31565','VC7FZA'),('8EVIBNKYXLHTPZ9A','Renato Pimblett',0.00,'46537','VC7FZA'),('8T2EFCI6QGPHO71E','Alex Pruce',0.00,'31565','WH15EW'),('A1BO8O5IYIKN1IRW','Jena Stockhill',0.00,'46537','VC7FZA'),('AGXH2CSZ4I5UX0AK','Nestor Gabbotts',0.00,'31565','VC7FZA'),('AI6JRMVYV09E5M8V','Crin Prinett',0.00,'31565','WH15EW'),('AOP3VP1LX0VEPBJN','Vincenty Dunston',0.00,'31565','WH15EW'),('E942Z4B7I8EH4EH9','Toby Willingam',0.00,'31565','VC7FZA'),('EGDN3XBREW2TJI1Z','Sam Straw',0.00,'31565','VC7FZA'),('GBFVNWR3N173Y37Y','Phillipp Westley',0.00,'46537','VC7FZA'),('GSQSCDZ18JWILF1D','Tandi Coop',0.00,'31565','WH15EW'),('HQKPS34V7ZFG7ZL4','Eldon Tandy',0.00,'46537','VC7FZA'),('HZI6HF4UAXCZ86UW','Issi Feldbau',0.00,'31565','VC7FZA'),('I4NM349OGSK86ADD','Alasdair Crocetti',0.00,'31565','WH15EW'),('I57UDHTD8XY8IB6C','Leilah Carpmile',0.00,'31565','VC7FZA'),('I9AJG3G3OP9S8G7J','Abra Balham',0.00,'31565','WH15EW'),('IUTC9A98ABAMFASM','Ranique Myrick',0.00,'31565','WH15EW'),('J1NXFQOJAQET6T8N','Ganny Chevers',0.00,'31565','WH15EW'),('J2ORE7XHSVZ6VHY3','Rudolf McAllen',0.00,'31565','WH15EW'),('J2Q1Z2NS5EM6NOME','Conney Quinane',0.00,'31565','WH15EW'),('K7X285PIDNQ4X3W4','Kinny Clara',0.00,'31565','WH15EW'),('KNDUHTSZMNE76MAR','Si Woodfield',0.00,'31565','WH15EW'),('L4J22S8L10N45ZLT','Inglis Sonnenschein',0.00,'31565','WH15EW'),('NJW16SGK9BDZJCV0','Ynez Bonniface',0.00,'31565','WH15EW'),('NL7WUH9DS0YC7U2M','Mirella Deme',-1.45,'31565','WH15EW'),('NP4Y433PURTR7FN4','Shanie Kalisz',0.00,'31565','VC7FZA'),('OHXSWFUQWKZD6A9A','Bailie Atton',0.00,'31565','WH15EW'),('OWFM439MUMR0OZ16','Hamid Kurt',0.00,'46537','VC7FZA'),('OY1OYNGF2591BETZ','Shadow Wong',100.00,'31565','WH15EW'),('P6V6JKUEO0FNJTE8','Taddeusz Duerden',0.00,'31565','WH15EW'),('PLUL20KQ5BKSVRPR','Weidar Venton',0.00,'31565','WH15EW'),('PYFGHRKDDHOJDA3V','Marybelle Guille',0.00,'46537','VC7FZA'),('Q3G9JZ7CDLT3RE8U','Wes Lyndon',0.00,'31565','VC7FZA'),('QALVR80VKAOTGTPT','Lavena Linskey',0.00,'31565','VC7FZA'),('SC0IMVSS86JM68XI','Sheryl Dabell',0.00,'46537','VC7FZA'),('UFN3PPOTWILYX9ZU','Cortney Perrinchief',0.00,'31565','WH15EW'),('UHZOIWB71VO4DJ3U','Elias Whisson',0.00,'31565','WH15EW'),('UX8P3JLNLV8FC2WC','Bevin Corsham',0.00,'46537','VC7FZA'),('W8C0JMMRP04LVB99','Josh Edwardson',0.00,'31565','VC7FZA'),('WAGAUQQU7PX1UMVW','Zorah Bone',0.00,'31565','WH15EW'),('XA7QB15QFO4BYF5R','Reynard Yakovitch',0.00,'31565','WH15EW'),('YP1GXPPX9TNTLY2C','Izak Rao',0.00,'46537','VC7FZA'),('YY5QCVPG0K9IW59H','Sumner Sleford',0.00,'31565','VC7FZA'),('ZAKH3Y4E0QSCLHJ6','Lyndel Booy',0.00,'46537','VC7FZA'),('ZZBEABJ5UZF5SB74','Gayelord Vignaux',0.00,'31565','WH15EW');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonecall`
--

DROP TABLE IF EXISTS `phonecall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phonecall` (
  `datetime` datetime NOT NULL,
  `memberID` char(16) NOT NULL,
  PRIMARY KEY (`datetime`,`memberID`),
  KEY `memberCall_idx` (`memberID`),
  CONSTRAINT `memberCall` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonecall`
--

LOCK TABLES `phonecall` WRITE;
/*!40000 ALTER TABLE `phonecall` DISABLE KEYS */;
INSERT INTO `phonecall` VALUES ('2023-12-12 06:55:00','5KQKN97DRSX0NDNT'),('2023-12-27 10:59:00','NL7WUH9DS0YC7U2M'),('2023-12-02 22:41:00','OY1OYNGF2591BETZ'),('2023-12-05 17:14:00','OY1OYNGF2591BETZ'),('2023-12-25 18:55:00','PLUL20KQ5BKSVRPR');
/*!40000 ALTER TABLE `phonecall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `planID` char(6) NOT NULL,
  `planName` varchar(45) NOT NULL,
  `premium` decimal(7,2) NOT NULL,
  `deductible` decimal(6,2) NOT NULL,
  PRIMARY KEY (`planID`),
  UNIQUE KEY `planName_UNIQUE` (`planName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES ('F21EBS','Bronze',1000.00,500.00),('NOJRNK','Platinum',10000.00,250.00),('RM4P9U','Gold',5000.00,500.00),('VC7FZA','Silver',2000.00,500.00),('WH15EW','Copper',100.00,1000.00);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planprocedure`
--

DROP TABLE IF EXISTS `planprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planprocedure` (
  `planID` char(6) NOT NULL,
  `medicalCode` char(5) NOT NULL,
  `copay` decimal(5,2) NOT NULL,
  `allowedAmt` decimal(6,2) NOT NULL,
  PRIMARY KEY (`planID`,`medicalCode`),
  KEY `procedureplancode_idx` (`medicalCode`),
  CONSTRAINT `procedureplan` FOREIGN KEY (`planID`) REFERENCES `plan` (`planID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `procedureplancode` FOREIGN KEY (`medicalCode`) REFERENCES `healthcareprocedure` (`medicalCode`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `copaylimit` CHECK (((`copay` >= 0) and (`COPAY` <= 250)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planprocedure`
--

LOCK TABLES `planprocedure` WRITE;
/*!40000 ALTER TABLE `planprocedure` DISABLE KEYS */;
INSERT INTO `planprocedure` VALUES ('VC7FZA','12002',50.00,250.00),('VC7FZA','87635',0.00,15.00),('VC7FZA','90658',0.00,25.00),('VC7FZA','97110',15.00,275.00),('VC7FZA','99397',0.00,150.00),('WH15EW','12002',100.00,200.00),('WH15EW','87635',0.00,15.00),('WH15EW','90658',0.00,25.00),('WH15EW','97110',50.00,250.00),('WH15EW','99397',0.00,150.00);
/*!40000 ALTER TABLE `planprocedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedureperformance`
--

DROP TABLE IF EXISTS `procedureperformance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedureperformance` (
  `date` date NOT NULL,
  `memberID` char(16) NOT NULL,
  `medicalCode` char(5) NOT NULL,
  PRIMARY KEY (`date`,`memberID`,`medicalCode`),
  KEY `memberProcedure_idx` (`memberID`),
  KEY `codeProcedure_idx` (`medicalCode`),
  CONSTRAINT `codeProcedure` FOREIGN KEY (`medicalCode`) REFERENCES `healthcareprocedure` (`medicalCode`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `memberProcedure` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedureperformance`
--

LOCK TABLES `procedureperformance` WRITE;
/*!40000 ALTER TABLE `procedureperformance` DISABLE KEYS */;
INSERT INTO `procedureperformance` VALUES ('2023-10-05','I4NM349OGSK86ADD','12002'),('2023-10-05','I4NM349OGSK86ADD','87635'),('2023-10-04','52F1RQ40012LVPJK','90658'),('2023-10-05','I4NM349OGSK86ADD','90658'),('2023-10-05','J2Q1Z2NS5EM6NOME','90658'),('2023-10-08','P6V6JKUEO0FNJTE8','90658'),('2023-10-08','YP1GXPPX9TNTLY2C','90658'),('2023-10-09','GBFVNWR3N173Y37Y','90658'),('2023-10-09','UFN3PPOTWILYX9ZU','90658'),('2023-10-10','SC0IMVSS86JM68XI','90658'),('2023-10-13','OHXSWFUQWKZD6A9A','90658'),('2023-10-14','PLUL20KQ5BKSVRPR','90658'),('2023-10-21','ZAKH3Y4E0QSCLHJ6','90658'),('2023-10-22','OWFM439MUMR0OZ16','90658'),('2023-10-22','UX8P3JLNLV8FC2WC','90658'),('2023-10-22','WAGAUQQU7PX1UMVW','90658'),('2023-10-25','I9AJG3G3OP9S8G7J','90658'),('2023-10-28','8T2EFCI6QGPHO71E','90658'),('2023-10-30','GSQSCDZ18JWILF1D','90658'),('2023-11-03','J1NXFQOJAQET6T8N','90658'),('2023-11-03','KNDUHTSZMNE76MAR','90658'),('2023-11-05','XA7QB15QFO4BYF5R','90658'),('2023-11-07','NJW16SGK9BDZJCV0','90658'),('2023-11-08','L4J22S8L10N45ZLT','90658'),('2023-11-08','PYFGHRKDDHOJDA3V','90658'),('2023-11-11','0ZUA0MQQJ20IR3JU','90658'),('2023-11-12','OY1OYNGF2591BETZ','90658'),('2023-11-16','IUTC9A98ABAMFASM','90658'),('2023-11-18','5KQKN97DRSX0NDNT','90658'),('2023-11-19','NL7WUH9DS0YC7U2M','90658'),('2023-11-21','ZZBEABJ5UZF5SB74','90658'),('2023-12-01','HQKPS34V7ZFG7ZL4','90658'),('2023-12-06','K7X285PIDNQ4X3W4','90658'),('2023-12-09','J2ORE7XHSVZ6VHY3','90658'),('2023-12-10','8EVIBNKYXLHTPZ9A','90658'),('2023-12-13','AOP3VP1LX0VEPBJN','90658'),('2023-12-13','UHZOIWB71VO4DJ3U','90658'),('2023-12-29','AI6JRMVYV09E5M8V','90658'),('2023-02-07','YP1GXPPX9TNTLY2C','97110'),('2023-02-14','YP1GXPPX9TNTLY2C','97110'),('2023-02-21','YP1GXPPX9TNTLY2C','97110'),('2023-02-28','YP1GXPPX9TNTLY2C','97110'),('2023-03-07','YP1GXPPX9TNTLY2C','97110'),('2023-03-14','YP1GXPPX9TNTLY2C','97110'),('2023-03-21','YP1GXPPX9TNTLY2C','97110'),('2023-03-28','YP1GXPPX9TNTLY2C','97110'),('2023-04-04','YP1GXPPX9TNTLY2C','97110'),('2023-04-11','YP1GXPPX9TNTLY2C','97110'),('2023-04-18','YP1GXPPX9TNTLY2C','97110'),('2023-04-25','YP1GXPPX9TNTLY2C','97110'),('2023-05-02','YP1GXPPX9TNTLY2C','97110'),('2023-05-09','YP1GXPPX9TNTLY2C','97110'),('2023-02-07','8EVIBNKYXLHTPZ9A','99397'),('2023-02-23','5G1AUQ6Y3I4HBWTV','99397'),('2023-03-02','A1BO8O5IYIKN1IRW','99397'),('2023-03-18','UHZOIWB71VO4DJ3U','99397'),('2023-04-21','KNDUHTSZMNE76MAR','99397'),('2023-05-24','YY5QCVPG0K9IW59H','99397'),('2023-05-30','GBFVNWR3N173Y37Y','99397'),('2023-06-16','YP1GXPPX9TNTLY2C','99397'),('2023-07-20','I57UDHTD8XY8IB6C','99397'),('2023-08-01','HQKPS34V7ZFG7ZL4','99397'),('2023-08-16','0ZUA0MQQJ20IR3JU','99397'),('2023-08-19','7OENC21ZOLF9EGTX','99397'),('2023-09-08','SC0IMVSS86JM68XI','99397'),('2023-09-16','OWFM439MUMR0OZ16','99397'),('2023-10-28','52F1RQ40012LVPJK','99397'),('2023-12-03','PYFGHRKDDHOJDA3V','99397'),('2023-12-13','NP4Y433PURTR7FN4','99397'),('2023-12-21','QALVR80VKAOTGTPT','99397'),('2023-12-26','ZAKH3Y4E0QSCLHJ6','99397'),('2023-12-30','UX8P3JLNLV8FC2WC','99397');
/*!40000 ALTER TABLE `procedureperformance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualifyingevent`
--

DROP TABLE IF EXISTS `qualifyingevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualifyingevent` (
  `date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `memberID` char(16) NOT NULL,
  PRIMARY KEY (`memberID`),
  CONSTRAINT `memberEvent` FOREIGN KEY (`memberID`) REFERENCES `member` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualifyingevent`
--

LOCK TABLES `qualifyingevent` WRITE;
/*!40000 ALTER TABLE `qualifyingevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualifyingevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace`
--

DROP TABLE IF EXISTS `workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workplace` (
  `workplaceID` char(5) NOT NULL,
  `workplaceName` varchar(45) NOT NULL,
  PRIMARY KEY (`workplaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace`
--

LOCK TABLES `workplace` WRITE;
/*!40000 ALTER TABLE `workplace` DISABLE KEYS */;
INSERT INTO `workplace` VALUES ('30953','Galectin Therapeutics Inc.'),('31565','The Rubicon Project, Inc.'),('46537','MVC Capital, Inc.'),('55990','New Residential Investment Corp.'),('62042','Capitala Finance Corp.');
/*!40000 ALTER TABLE `workplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplaceplan`
--

DROP TABLE IF EXISTS `workplaceplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workplaceplan` (
  `workplaceID` char(5) NOT NULL,
  `planID` char(6) NOT NULL,
  PRIMARY KEY (`workplaceID`,`planID`),
  KEY `plansforworkplace_idx` (`planID`),
  CONSTRAINT `plansforworkplace` FOREIGN KEY (`planID`) REFERENCES `plan` (`planID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `workplacesforplan` FOREIGN KEY (`workplaceID`) REFERENCES `workplace` (`workplaceID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplaceplan`
--

LOCK TABLES `workplaceplan` WRITE;
/*!40000 ALTER TABLE `workplaceplan` DISABLE KEYS */;
INSERT INTO `workplaceplan` VALUES ('30953','F21EBS'),('55990','F21EBS'),('62042','F21EBS'),('46537','NOJRNK'),('62042','NOJRNK'),('30953','RM4P9U'),('55990','RM4P9U'),('31565','VC7FZA'),('46537','VC7FZA'),('31565','WH15EW');
/*!40000 ALTER TABLE `workplaceplan` ENABLE KEYS */;
UNLOCK TABLES;