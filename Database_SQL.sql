-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: new_schema
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance_log`
--

DROP TABLE IF EXISTS `attendance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_log` (
  `attendance_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `attendee_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `space_id` int DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_in_time` time DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `attendance_log_ibfk_1` (`member_id`),
  KEY `attendance_log_ibfk_2` (`event_id`),
  KEY `attendance_log_ibfk_3` (`space_id`),
  CONSTRAINT `attendance_log_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `attendance_log_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `attendance_log_ibfk_3` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_log`
--

LOCK TABLES `attendance_log` WRITE;
/*!40000 ALTER TABLE `attendance_log` DISABLE KEYS */;
INSERT INTO `attendance_log` VALUES (1,1,'John Doe','john.doe@example.com',7,2,'2024-12-15','10:05:00'),(2,2,'Jane Smith','jane.smith@example.com',7,2,'2024-12-16','14:10:00'),(3,3,'Emily Johnson','emily.johnson@example.com',7,2,'2024-12-17','09:15:00'),(4,5,'Chris Davis','chris.davis@example.com',5,5,'2024-12-19','08:10:00'),(5,6,'Patricia Miller','patricia.miller@example.com',6,6,'2024-12-20','09:35:00'),(6,NULL,'Alex Carter','alex.carter@example.com',1,1,'2024-12-15','10:20:00'),(7,NULL,'Robin Lee','robin.lee@example.com',4,4,'2024-12-18','13:45:00'),(8,4,'Michael Brown','michael.brown@example.com',NULL,2,'2024-12-14','11:00:00'),(9,9,'James Taylor','james.taylor@example.com',NULL,3,'2024-12-13','16:00:00'),(10,NULL,'Charlie Evans','charlie.evans@example.com',NULL,5,'2024-12-12','17:30:00'),(11,NULL,'Taylor Green','taylor.green@example.com',NULL,6,'2024-12-11','09:45:00'),(12,8,'Linda Moore','linda.moore@example.com',2,2,'2024-12-16','14:30:00'),(13,NULL,'Jordan Blake','jordan.blake@example.com',NULL,1,'2024-12-10','10:00:00'),(14,10,'Susan Anderson','susan.anderson@example.com',NULL,4,'2024-12-09','13:00:00'),(15,7,'David Wilson','david.wilson@example.com',6,6,'2024-12-20','10:00:00');
/*!40000 ALTER TABLE `attendance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bookings_id` int NOT NULL,
  `payment_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`bookings_id`),
  KEY `bookings_ibfk_1` (`payment_id`),
  KEY `bookings_ibfk_2` (`member_id`),
  KEY `bookings_ibfk_3` (`event_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,6,1,1),(2,7,2,2),(3,8,3,3),(4,9,4,4),(5,10,5,5),(6,11,6,6);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_start_time` time DEFAULT NULL,
  `event_end_time` time DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_type_id` int DEFAULT NULL,
  `space_id` int DEFAULT NULL,
  `expected_attendance` int DEFAULT NULL,
  `space_hire_type` enum('Partial','Full') NOT NULL,
  `public_price` int DEFAULT NULL,
  `member_price` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_ibfk_1` (`event_type_id`),
  KEY `event_ibfk_2` (`space_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Community Health Talk','10:00:00','12:00:00','2024-12-15',2,1,100,'Full',25,15),(2,'Startup Networking Event','14:00:00','17:00:00','2024-12-16',3,2,50,'Partial',40,30),(3,'Advanced Coding Workshop','09:00:00','12:00:00','2024-12-17',4,3,25,'Full',20,10),(4,'Leadership Seminar','13:00:00','16:00:00','2024-12-18',5,4,20,'Partial',60,45),(5,'Wellness Retreat','08:00:00','11:00:00','2024-12-19',2,5,40,'Full',50,35),(6,'Team Training Session','09:30:00','12:30:00','2024-12-20',6,6,60,'Full',70,55),(7,'ABCEvent','10:00:00','14:00:00','2024-12-01',1,2,100,'Full',50,25),(8,'TechTalk','09:00:00','12:00:00','2024-12-02',2,2,50,'Partial',30,15),(9,'Gaming Tournament','16:00:00','20:00:00','2024-12-10',3,3,150,'Full',75,40);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_type` (
  `event_type_id` int NOT NULL,
  `event_type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Member-led'),(2,'Wellbeing'),(3,'Networking'),(4,'Workshop'),(5,'Conference'),(6,'Webinar');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `feedback_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_ibfk_1` (`member_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,'The event was well-organized and informative. I really enjoyed the health talk and will be attending future events.'),(2,2,'Great networking event! Met some interesting people and learned a lot. Would love to see more events like this.'),(3,3,'The workshop on coding was very useful. The instructors were knowledgeable, and I learned new skills. Highly recommend it!'),(4,4,'The leadership seminar was insightful. However, I think there could be more time allocated for Q&A sessions. Overall, great content.'),(5,5,'I appreciated the wellness retreat. It was relaxing and rejuvenating. The venue was perfect for such an event.'),(6,6,'The session was informative, but the space was a bit small for the number of attendees. It would be great to have larger venues for future events.'),(7,7,'I was expecting more practical advice from the seminar. The speakers were good, but I think the session could have been more hands-on.'),(8,8,'Excellent event overall. The content was useful, and the space was comfortable. I would definitely attend similar events in the future.'),(9,9,'I enjoyed the event, but there were some technical issues with the presentation. It was a bit distracting, but the overall experience was good.'),(10,10,'The event exceeded my expectations. The speakers were engaging, and the content was relevant to my interests. Would love to see more events like this!');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `founding_member`
--

DROP TABLE IF EXISTS `founding_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `founding_member` (
  `founding_member_id` int NOT NULL,
  `founder_first_name` varchar(100) DEFAULT NULL,
  `founder_last_name` varchar(100) DEFAULT NULL,
  `founder_email` varchar(150) DEFAULT NULL,
  `founder_phone_number` varchar(20) DEFAULT NULL,
  `founding_date` date DEFAULT NULL,
  `contribution` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`founding_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `founding_member`
--

LOCK TABLES `founding_member` WRITE;
/*!40000 ALTER TABLE `founding_member` DISABLE KEYS */;
INSERT INTO `founding_member` VALUES (1,'John','Doe','john.doe@example.com','1234567890','2023-01-15','Cash donation of $1000'),(2,'Jane','Smith','jane.smith@example.com','2345678901','2023-02-20','Equity stake of 5%'),(3,'Emily','Johnson','emily.johnson@example.com','3456789012','2023-03-10','Service contribution of 50 hours'),(4,'Michael','Brown','michael.brown@example.com','4567890123','2023-04-05','Product development contribution'),(5,'Chris','Davis','chris.davis@example.com','5678901234','2023-05-12','Fundraising of $1800');
/*!40000 ALTER TABLE `founding_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `founding_member_address`
--

DROP TABLE IF EXISTS `founding_member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `founding_member_address` (
  `founding_member_address_id` int NOT NULL,
  `house_no` int DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `founding_member_id` int NOT NULL,
  PRIMARY KEY (`founding_member_address_id`),
  KEY `fmadd_idx` (`founding_member_id`),
  CONSTRAINT `fmadd` FOREIGN KEY (`founding_member_id`) REFERENCES `founding_member` (`founding_member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `founding_member_address`
--

LOCK TABLES `founding_member_address` WRITE;
/*!40000 ALTER TABLE `founding_member_address` DISABLE KEYS */;
INSERT INTO `founding_member_address` VALUES (1,101,'Baker Street','London','England','NW1 6XE','United Kingdom',1),(2,250,'Park Lane','New York','New York','10001','United States',2),(3,15,'Elm Street','Los Angeles','California','90001','United States',3),(4,12,'Sunset Boulevard','Los Angeles','California','90028','United States',4),(5,5,'Queens Road','Manchester','England','M1 1AA','United Kingdom',5);
/*!40000 ALTER TABLE `founding_member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `inquiry_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `inquiry_type_id` int DEFAULT NULL,
  `inquiry_date` date DEFAULT NULL,
  `follow_up_count` int DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `user_type_id` int DEFAULT NULL,
  `inquiry_description` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`),
  KEY `fk_usertype` (`user_type_id`),
  KEY `inquiries_ibfk_1` (`member_id`),
  KEY `inquiries_ibfk_2` (`inquiry_type_id`),
  CONSTRAINT `fk_usertype` FOREIGN KEY (`user_type_id`) REFERENCES `inquiry_user_type` (`inquiry_user_type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `inquiries_ibfk_2` FOREIGN KEY (`inquiry_type_id`) REFERENCES `inquiry_type` (`inquiry_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,1,1,'2024-12-01',0,'Open',2,'I would like to know more about upgrading my membership.'),(2,2,3,'2024-12-02',1,'Closed',1,'Inquiry about cancelling my membership.'),(3,3,4,'2024-12-03',0,'Open',2,'General query regarding event booking process.'),(4,4,2,'2024-12-04',2,'Closed',1,'Inquiring about how to upgrade my membership.'),(5,5,1,'2024-12-05',0,'Open',2,'Question about renewing my current membership.'),(6,6,1,'2024-12-01',1,'Closed',1,'I am interested in knowing more about membership benefits and how to sign up.'),(7,7,2,'2024-12-02',2,'Open',1,'I want to upgrade my membership once I become a full member, can you help?'),(8,8,3,'2024-12-03',1,'Closed',1,'What happens if I want to cancel my membership after I join?'),(9,8,1,'2024-12-04',0,'Open',1,'Can you send me the details of the different membership options available?'),(10,9,4,'2024-12-05',3,'Closed',1,'I have some general questions about membership renewal and discounts.');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_type`
--

DROP TABLE IF EXISTS `inquiry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_type` (
  `inquiry_type_id` int NOT NULL,
  `inquiry_type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inquiry_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_type`
--

LOCK TABLES `inquiry_type` WRITE;
/*!40000 ALTER TABLE `inquiry_type` DISABLE KEYS */;
INSERT INTO `inquiry_type` VALUES (1,'Membership Query'),(2,'Upgrade Membership'),(3,'Cancel Membership'),(4,'General Query');
/*!40000 ALTER TABLE `inquiry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_user_type`
--

DROP TABLE IF EXISTS `inquiry_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_user_type` (
  `inquiry_user_type_id` int NOT NULL,
  `inquiry_user_type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inquiry_user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_user_type`
--

LOCK TABLES `inquiry_user_type` WRITE;
/*!40000 ALTER TABLE `inquiry_user_type` DISABLE KEYS */;
INSERT INTO `inquiry_user_type` VALUES (1,'Non-Member'),(2,'Member');
/*!40000 ALTER TABLE `inquiry_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interests` (
  `interest_id` int NOT NULL,
  `interest_name` char(25) DEFAULT NULL,
  PRIMARY KEY (`interest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (1,'Learning Department'),(2,'Happening Department'),(3,'Working Department'),(4,'Sharing Department'),(5,'Helping Department');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_in`
--

DROP TABLE IF EXISTS `log_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_in` (
  `log_in_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `log_in_time` time DEFAULT NULL,
  `log_in_date` date DEFAULT NULL,
  `log_in_device` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_in_id`),
  KEY `log_in_ibfk_1` (`member_id`),
  CONSTRAINT `log_in_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_in`
--

LOCK TABLES `log_in` WRITE;
/*!40000 ALTER TABLE `log_in` DISABLE KEYS */;
INSERT INTO `log_in` VALUES (1,1,'08:15:00','2024-12-01','iPhone 12'),(2,2,'09:00:00','2024-12-01','Samsung Galaxy S21'),(3,3,'10:30:00','2024-12-01','MacBook Pro'),(4,4,'11:00:00','2024-12-01','Windows PC'),(5,5,'12:00:00','2024-12-01','iPhone 11'),(6,6,'14:00:00','2024-12-01','Huawei P40'),(7,7,'15:30:00','2024-12-01','Dell XPS 13'),(8,8,'16:00:00','2024-12-01','iPad Air'),(9,9,'17:30:00','2024-12-01','Google Pixel 5'),(10,10,'18:00:00','2024-12-01','OnePlus 9');
/*!40000 ALTER TABLE `log_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `membership_id` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `subscribed_newsletter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `member_ibfk_1` (`membership_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `membership` (`membership_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'John','Doe','john.doe@example.com','1234567890','2023-01-15',1,'password123',1),(2,'Jane','Smith','jane.smith@example.com','2345678901','2023-02-20',2,'securepass',0),(3,'Emily','Johnson','emily.johnson@example.com','3456789012','2023-03-10',3,'mypassword',1),(4,'Michael','Brown','michael.brown@example.com','4567890123','2023-04-05',4,'pass456',0),(5,'Chris','Davis','chris.davis@example.com','5678901234','2023-05-12',1,'chrispass',1),(6,'Patricia','Miller','patricia.miller@example.com','6789012345','2023-06-25',2,'patricia123',0),(7,'David','Wilson','david.wilson@example.com','7890123456','2023-07-15',3,'davidpass',1),(8,'Linda','Moore','linda.moore@example.com','8901234567','2023-08-18',4,'lindapass',0),(9,'James','Taylor','james.taylor@example.com','9012345678','2023-09-05',1,'jamespass',1),(10,'Susan','Anderson','susan.anderson@example.com','0123456789','2023-10-22',2,'susanpass',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_address`
--

DROP TABLE IF EXISTS `member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_address` (
  `address_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `house_no` int DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `member_address_ibfk_1` (`member_id`),
  CONSTRAINT `member_address_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_address`
--

LOCK TABLES `member_address` WRITE;
/*!40000 ALTER TABLE `member_address` DISABLE KEYS */;
INSERT INTO `member_address` VALUES (1,1,123,'Huntingdon Road','Cambridge','Cambridgeshire','CB3 0DJ','United Kingdom'),(2,2,78,'Parkside','Cambridge','Cambridgeshire','CB1 1JF','United Kingdom'),(3,3,101,'Mill Road','Cambridge','Cambridgeshire','CB1 2AB','United Kingdom'),(4,4,12,'Madingley Road','Girton','Cambridgeshire','CB3 0QA','United Kingdom'),(5,5,56,'Bridge Street','St. Neots','Cambridgeshire','PE19 2AA','United Kingdom'),(6,6,87,'Ely Road','Cambridge','Cambridgeshire','CB25 9JN','United Kingdom'),(7,7,134,'Chesterton Road','Cambridge','Cambridgeshire','CB4 3AZ','United Kingdom'),(8,8,32,'High Street','Huntingdon','Cambridgeshire','PE29 3EY','United Kingdom'),(9,9,210,'Cambridge Road','St. Ives','Cambridgeshire','PE27 3HR','United Kingdom'),(10,10,14,'Victoria Avenue','Ely','Cambridgeshire','CB6 1EG','United Kingdom');
/*!40000 ALTER TABLE `member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_interest`
--

DROP TABLE IF EXISTS `member_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_interest` (
  `interest_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  KEY `member_interest_ibfk_1` (`member_id`),
  KEY `member_interest_ibfk_2` (`interest_id`),
  CONSTRAINT `member_interest_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_interest_ibfk_2` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`interest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_interest`
--

LOCK TABLES `member_interest` WRITE;
/*!40000 ALTER TABLE `member_interest` DISABLE KEYS */;
INSERT INTO `member_interest` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(1,6),(2,7),(3,8),(4,9),(5,10);
/*!40000 ALTER TABLE `member_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_tag`
--

DROP TABLE IF EXISTS `member_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_tag` (
  `member_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `member_tag_ibfk_1` (`member_id`),
  CONSTRAINT `member_tag_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_tag`
--

LOCK TABLES `member_tag` WRITE;
/*!40000 ALTER TABLE `member_tag` DISABLE KEYS */;
INSERT INTO `member_tag` VALUES (1,1),(1,2),(2,3),(2,5),(3,6),(3,7),(4,8),(4,9),(5,1),(5,10),(6,2),(6,6),(7,4),(7,9),(8,3),(8,5),(9,7),(9,8),(10,4),(2,1),(3,1);
/*!40000 ALTER TABLE `member_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `membership_id` int NOT NULL,
  `membership_type` varchar(50) DEFAULT NULL,
  `membership_price` int DEFAULT NULL,
  PRIMARY KEY (`membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,'Community Member',19),(2,'Community Member (Keys)',29),(3,'Workspace Member (Partial Access)',170),(4,'Workspace Member (Full Access)',200);
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `payment_reason_id` int DEFAULT NULL,
  `payment_method` enum('Cash','Card') DEFAULT NULL,
  `payment_amount` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `paymtnt_reasonfb` (`payment_reason_id`),
  CONSTRAINT `paymtnt_reasonfb` FOREIGN KEY (`payment_reason_id`) REFERENCES `payment_reason` (`payment_reason_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'Card',50,'2024-12-01'),(2,1,'Card',50,'2024-12-01'),(3,1,'Card',600,'2024-01-01'),(4,1,'Cash',50,'2024-12-02'),(5,1,'Card',300,'2024-06-01'),(6,2,'Card',20,'2024-12-15'),(7,2,'Card',30,'2024-12-16'),(8,2,'Card',40,'2024-12-17'),(9,2,'Cash',25,'2024-12-18'),(10,2,'Card',15,'2024-12-19'),(11,2,'Card',50,'2024-12-03'),(12,1,'Card',50,'2024-12-03');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_reason`
--

DROP TABLE IF EXISTS `payment_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_reason` (
  `payment_reason_id` int NOT NULL,
  `payment_reason_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payment_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_reason`
--

LOCK TABLES `payment_reason` WRITE;
/*!40000 ALTER TABLE `payment_reason` DISABLE KEYS */;
INSERT INTO `payment_reason` VALUES (1,'Membership Subscription'),(2,'Event Booking');
/*!40000 ALTER TABLE `payment_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces`
--

DROP TABLE IF EXISTS `spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces` (
  `space_id` int NOT NULL,
  `space_name` varchar(255) DEFAULT NULL,
  `space_capacity` int DEFAULT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces`
--

LOCK TABLES `spaces` WRITE;
/*!40000 ALTER TABLE `spaces` DISABLE KEYS */;
INSERT INTO `spaces` VALUES (1,'Together Hall',150),(2,'Conference Room A',50),(3,'Workshop Area',30),(4,'Meeting Room 1',20),(5,'Lounge Area',40),(6,'Training Room',60);
/*!40000 ALTER TABLE `spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `staff_first_name` varchar(100) DEFAULT NULL,
  `staff_last_name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `workplace_id` int DEFAULT NULL,
  `staff_clearance_id` int DEFAULT NULL,
  `staff_contract_id` int DEFAULT NULL,
  `staff_salary_type_id` int DEFAULT NULL,
  `notice_period` enum('Month','Week','Fortnight') DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `staff_ibfk_1` (`workplace_id`),
  KEY `staff_ibfk_2` (`staff_clearance_id`),
  KEY `staff_ibfk_3` (`staff_contract_id`),
  KEY `staff_ibfk_4` (`staff_salary_type_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`workplace_id`) REFERENCES `workplace` (`workplace_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`staff_clearance_id`) REFERENCES `staff_clearance` (`staff_clearance_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`staff_contract_id`) REFERENCES `staff_contract` (`staff_contract_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_4` FOREIGN KEY (`staff_salary_type_id`) REFERENCES `staff_salary_type` (`staff_salary_type_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'John','Doe','Software Engineer',20,1,3,2,1,'Month','2023-03-01'),(2,'Jane','Smith','HR Manager',5000,2,3,2,2,'Week','2021-05-15'),(3,'David','Johnson','Data Analyst',18,3,2,1,1,'Fortnight','2022-08-23'),(4,'Emily','Brown','Project Manager',55000,1,4,2,4,'Month','2020-11-10'),(5,'Michael','Davis','Sales Executive',2500,2,2,3,2,'Month','2019-07-14'),(6,'Sarah','Miller','Web Developer',15,3,5,1,1,'Week','2023-01-12'),(7,'Robert','Wilson','Marketing Specialist',24000,1,1,4,3,'Month','2022-06-05'),(8,'Linda','Taylor','Finance Manager',4500,2,6,2,3,'Fortnight','2021-02-20'),(9,'James','Anderson','Team Leader',22,1,3,3,1,'Week','2018-04-18'),(10,'Karen','Thomas','Chief Operating Officer',100000,2,7,2,4,'Month','2015-09-25');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_address`
--

DROP TABLE IF EXISTS `staff_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_address` (
  `staff_address_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `house_number` int DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_address_id`),
  KEY `staff_address_ibfk_1` (`staff_id`),
  CONSTRAINT `staff_address_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_address`
--

LOCK TABLES `staff_address` WRITE;
/*!40000 ALTER TABLE `staff_address` DISABLE KEYS */;
INSERT INTO `staff_address` VALUES (1,1,101,'High Street','Cambridge','Cambridgeshire','CB1 1AB','United Kingdom'),(2,2,202,'Market Road','Ely','Cambridgeshire','CB7 4YZ','United Kingdom'),(3,3,303,'Broad Street','Huntingdon','Cambridgeshire','PE29 3AA','United Kingdom'),(4,4,404,'Station Lane','St Neots','Cambridgeshire','PE19 1AJ','United Kingdom'),(5,5,505,'Church Street','Wisbech','Cambridgeshire','PE13 1DJ','United Kingdom'),(6,6,606,'Main Street','March','Cambridgeshire','PE15 8SN','United Kingdom'),(7,7,707,'Mill Road','Peterborough','Cambridgeshire','PE1 2ND','United Kingdom'),(8,8,808,'Bridge Street','Chatteris','Cambridgeshire','PE16 6RN','United Kingdom'),(9,9,909,'Park Road','Soham','Cambridgeshire','CB7 5DS','United Kingdom'),(10,10,1001,'Fen Road','Whittlesey','Cambridgeshire','PE7 1AR','United Kingdom');
/*!40000 ALTER TABLE `staff_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_attendance`
--

DROP TABLE IF EXISTS `staff_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_attendance` (
  `staff_attendance_id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `staff_check_in_time` time DEFAULT NULL,
  `staff_check_out_time` time DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  PRIMARY KEY (`staff_attendance_id`),
  KEY `staff_attendance_ibfk_1` (`staff_id`),
  CONSTRAINT `staff_attendance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_attendance`
--

LOCK TABLES `staff_attendance` WRITE;
/*!40000 ALTER TABLE `staff_attendance` DISABLE KEYS */;
INSERT INTO `staff_attendance` VALUES (1,1,'09:00:00','17:00:00','2024-12-11'),(2,2,'09:30:00','17:30:00','2024-12-11'),(3,3,'10:00:00','18:00:00','2024-12-11'),(4,4,'08:45:00','16:45:00','2024-12-11'),(5,5,'09:15:00','17:15:00','2024-12-11'),(6,6,'08:30:00','16:30:00','2024-12-11'),(7,7,'10:15:00','18:15:00','2024-12-11'),(8,8,'09:00:00','17:00:00','2024-12-11'),(9,9,'09:45:00','17:45:00','2024-12-11'),(10,10,'10:30:00','18:30:00','2024-12-11');
/*!40000 ALTER TABLE `staff_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_clearance`
--

DROP TABLE IF EXISTS `staff_clearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_clearance` (
  `staff_clearance_id` int NOT NULL,
  `clearance_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_clearance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_clearance`
--

LOCK TABLES `staff_clearance` WRITE;
/*!40000 ALTER TABLE `staff_clearance` DISABLE KEYS */;
INSERT INTO `staff_clearance` VALUES (1,'Employee'),(2,'Supervisor'),(3,'Manager'),(4,'Director'),(5,'Executive'),(6,'Administrator'),(7,'CEO');
/*!40000 ALTER TABLE `staff_clearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_contract`
--

DROP TABLE IF EXISTS `staff_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_contract` (
  `staff_contract_id` int NOT NULL,
  `contract_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_contract`
--

LOCK TABLES `staff_contract` WRITE;
/*!40000 ALTER TABLE `staff_contract` DISABLE KEYS */;
INSERT INTO `staff_contract` VALUES (1,'Part Time'),(2,'Full Time'),(3,'Flexible Hour'),(4,'Contracted Time'),(5,'Freelance Hire');
/*!40000 ALTER TABLE `staff_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_salary_type`
--

DROP TABLE IF EXISTS `staff_salary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_salary_type` (
  `staff_salary_type_id` int NOT NULL,
  `salary_type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_salary_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_salary_type`
--

LOCK TABLES `staff_salary_type` WRITE;
/*!40000 ALTER TABLE `staff_salary_type` DISABLE KEYS */;
INSERT INTO `staff_salary_type` VALUES (1,'Hourly'),(2,'Monthly'),(3,'Quarterly'),(4,'Yearly');
/*!40000 ALTER TABLE `staff_salary_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `subscription_id` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `subscription_start_date` date DEFAULT NULL,
  `subscription_end_date` date DEFAULT NULL,
  `membership_id` int DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `member_id` (`member_id`),
  KEY `payment_id` (`payment_id`),
  KEY `membership_id` (`membership_id`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `subscriptions_ibfk_3` FOREIGN KEY (`membership_id`) REFERENCES `membership` (`membership_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,1,'2024-12-01','2025-01-01',1),(2,2,2,'2024-12-01','2025-01-01',2),(3,3,3,'2024-01-01','2025-01-01',3),(4,5,4,'2024-12-02','2025-01-02',4),(5,6,5,'2024-06-01','2024-12-01',1),(6,7,12,'2024-12-03','2025-01-01',2),(7,7,7,'2024-07-01','2024-12-31',3),(8,8,8,'2024-08-01','2024-12-31',4),(9,9,9,'2024-09-01','2025-08-31',1),(10,10,10,'2024-10-01','2025-09-30',2);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Tech'),(2,'Space'),(3,'Healthcare'),(4,'Employment'),(5,'Education'),(6,'Finance'),(7,'Marketing'),(8,'Startup'),(9,'Innovation'),(10,'Networking');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace`
--

DROP TABLE IF EXISTS `workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workplace` (
  `workplace_id` int NOT NULL,
  `workplace_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workplace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace`
--

LOCK TABLES `workplace` WRITE;
/*!40000 ALTER TABLE `workplace` DISABLE KEYS */;
INSERT INTO `workplace` VALUES (1,'On Site'),(2,'Hybrid'),(3,'Remote');
/*!40000 ALTER TABLE `workplace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-13 13:22:07
