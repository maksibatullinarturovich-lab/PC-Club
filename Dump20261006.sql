-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel_db_single
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'b656ccce-b9b7-11f0-8041-0250c3e4d462:1-802';

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `room_number` int NOT NULL,
  `booking_date` date NOT NULL DEFAULT (curdate()),
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` enum('Ожидает оплаты','Оплачено','Отменено') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ожидает оплаты',
  PRIMARY KEY (`booking_id`),
  KEY `fk_bookings_guest` (`guest_id`),
  KEY `fk_bookings_room` (`room_number`),
  CONSTRAINT `fk_bookings_guest` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `fk_bookings_room` FOREIGN KEY (`room_number`) REFERENCES `rooms` (`room_number`),
  CONSTRAINT `bookings_chk_1` CHECK ((`check_out` > `check_in`))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (2,2,201,'2026-05-18','2026-05-18','2026-05-22','Отменено'),(3,3,301,'2026-05-18','2026-05-19','2026-05-21','Отменено'),(17,2,102,'2026-05-26','2026-05-26','2026-05-27','Отменено'),(18,2,101,'2026-05-26','2026-05-26','2026-05-27','Отменено'),(19,1,101,'2026-05-29','2026-05-29','2026-05-30','Отменено'),(20,2,102,'2026-05-29','2026-05-29','2026-05-30','Отменено'),(21,2,201,'2026-05-29','2026-05-29','2026-05-30','Отменено'),(22,1,101,'2026-05-29','2026-05-29','2026-05-30','Отменено'),(23,2,101,'2026-05-29','2026-05-29','2026-05-30','Отменено'),(24,3,101,'2026-09-04','2026-09-04','2026-09-05','Отменено'),(25,3,101,'2026-09-16','2026-09-16','2026-09-17','Отменено'),(26,3,101,'2026-09-16','2026-09-16','2026-09-17','Отменено'),(27,3,102,'2026-09-16','2026-09-16','2026-09-17','Отменено'),(28,1,101,'2026-09-16','2026-09-16','2026-09-17','Ожидает оплаты'),(29,3,102,'2026-09-16','2026-09-16','2026-09-17','Ожидает оплаты'),(30,3,201,'2026-09-16','2026-09-16','2026-09-17','Ожидает оплаты'),(31,3,101,'2026-09-16','2026-09-23','2026-09-27','Ожидает оплаты');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `idcategories` int NOT NULL,
  `categoriename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Игровой набор'),(2,'Конструктор'),(3,'Детский музыкальный инструмент'),(4,'Машинка');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creaters`
--

DROP TABLE IF EXISTS `creaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creaters` (
  `idcreaters` int NOT NULL,
  `createrscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcreaters`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creaters`
--

LOCK TABLES `creaters` WRITE;
/*!40000 ALTER TABLE `creaters` DISABLE KEYS */;
INSERT INTO `creaters` VALUES (1,'ABSпластик'),(2,'BambiniFelici'),(3,'Junion');
/*!40000 ALTER TABLE `creaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `passport_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'guest',
  PRIMARY KEY (`guest_id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `uk_passport` (`passport_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'AA1111111','Иванов','Иван','Иванович','1','1','admin'),(2,'BB2222222','Петрова','Анна','Сергеевна','222','2222','guest'),(3,'CC3333333','Сидоров','Дмитрий','Олегович','3','3','guest'),(4,'1231123123','Пробоин','Вася','Анатолиевич','123','123123','guest');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `idorder` int NOT NULL,
  `idorder_items` int DEFAULT NULL,
  `articool` varchar(45) DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`idorder`),
  KEY `shfgfj_idx` (`idorder_items`),
  KEY `erytertutu_idx` (`articool`),
  CONSTRAINT `erytertutu` FOREIGN KEY (`articool`) REFERENCES `products` (`articul`),
  CONSTRAINT `sadgdfhgjf` FOREIGN KEY (`idorder_items`) REFERENCES `orders` (`idorders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'PMEZMH',2),(2,2,'JVL42J',1),(3,3,'3XBOTN',10),(4,4,'S72AM3',5),(5,5,'MIO8YV',2),(6,6,'PMEZMH',2),(7,7,'JVL42J',1),(8,8,'3XBOTN',10),(9,9,'S72AM3',5),(10,10,'MIO8YV',2),(11,1,'BPV4MM',2),(12,2,'F895RB',1),(13,3,'3L7RCZ',10),(14,4,'2G3280',4),(15,5,'UER2QD',2),(16,6,'BPV4MM',2),(17,7,'F895RB',1),(18,8,'3L7RCZ',10),(19,9,'2G3280',4),(20,10,'UER2QD',2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idorders` int NOT NULL,
  `datezakaz` datetime DEFAULT NULL,
  `datepublish` datetime DEFAULT NULL,
  `adress` int DEFAULT NULL,
  `idclient` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`idorders`),
  KEY `affdsgdh_idx` (`adress`),
  KEY `vsdfhghfgj_idx` (`idclient`),
  KEY `status_idx` (`status`),
  CONSTRAINT `affdsgdh` FOREIGN KEY (`adress`) REFERENCES `pvz` (`idpvz`),
  CONSTRAINT `status` FOREIGN KEY (`status`) REFERENCES `statuses` (`idstatuses`),
  CONSTRAINT `vsdfhghfgj` FOREIGN KEY (`idclient`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27 00:00:00','2025-04-20 00:00:00',1,1,901,1),(2,'2024-09-28 00:00:00','2025-04-21 00:00:00',11,2,902,1),(3,'2025-03-21 00:00:00','2025-04-22 00:00:00',2,3,903,1),(4,'2025-02-20 00:00:00','2025-04-23 00:00:00',11,4,904,1),(5,'2025-03-17 00:00:00','2025-04-24 00:00:00',2,1,905,1),(6,'2025-03-01 00:00:00','2025-04-25 00:00:00',15,2,906,1),(7,'2025-02-28 00:00:00','2025-04-26 00:00:00',3,3,907,1),(8,'2025-03-31 00:00:00','2025-04-27 00:00:00',19,4,908,2),(9,'2025-04-02 00:00:00','2025-04-28 00:00:00',5,3,909,2),(10,'2025-04-03 00:00:00','2025-04-29 00:00:00',19,4,910,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `articul` varchar(45) NOT NULL,
  `name` varchar(400) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `publisher` int DEFAULT NULL,
  `creater` int DEFAULT NULL,
  `categorie` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `discription` varchar(400) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`articul`),
  KEY `qrerehtrhj_idx` (`categorie`),
  KEY `afdgfhgj_idx` (`creater`),
  KEY `dfhdtklk_idx` (`publisher`),
  CONSTRAINT `afdgfhgj` FOREIGN KEY (`creater`) REFERENCES `creaters` (`idcreaters`),
  CONSTRAINT `dfhdtklk` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`idpublishers`),
  CONSTRAINT `qrerehtrhj` FOREIGN KEY (`categorie`) REFERENCES `categories` (`idcategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('2G3280','Деревянный игровой набор JUNION Стройплощадка \"Кран-Паркс\" с подъёмным, строительным краном и машинками, 18 предметов, подвижные элементы',1414,4,3,1,9,20,'Игровой набор «Стройплощадка Кран-Паркс Junion» — это большая игрушечная парковка с деревянными машинками и настоящим подъёмным краном, придуманная в Яндексе настоящими родителями.','8.jpg'),('3L7RCZ','Игровой набор с деревянными машинками Стройплощадка Кран-Паркс, Junion',7400,5,3,1,15,0,'Игровой набор «Стройплощадка Кран-Паркс Junion» — это большая игрушечная парковка с деревянными машинками и настоящим подъёмным краном, придуманная в Яндексе настоящими родителями.','6.jpg'),('3XBOTN','Игровой набор Hot Wheels Action Loop Cyclone Challenge Track, с машинкой и удобным хранением, HTK16',3426,5,2,1,10,21,'Игровой набор Hot Wheels Action Loop Cyclone Challenge Track - это уникальная игра, которая позволит вам испытать себя и своих друзей в скорости и ловкости. Этот набор состоит из металлической дорожки с циклоном, которая создает потрясающий эффект и добавляет дополнительную сложность в игру.','5.jpg'),('BPV4MM','Конструктор Гарри Поттер Сова Букля 630 деталей совместим с lego harry potter, лего совместимый)',771,2,1,2,15,26,'Коллекционная модель Букля состоит из множества потрясающих элементов, а также специального механизма внутри. С его помощью можно плавно поднимать-опускать крылья птицы.','2.jpg'),('F895RB','Машинка игрушка диско шар светящаяся музыкальная',368,5,1,4,6,7,'Светящаяся музыкальная машина с диско шаром переливается разными цветами, играет ритмичные мелодии, объезжает препятствия и крутится, поэтому с ней точно не будет скучно.','4.jpg'),('JVL42J','Музыкальные инструменты для детей, ксилофон, барабаны, развивающие игрушки, игрушки для детей',2750,2,2,3,15,0,'Откройте мир музыки для вашего ребенка с этой уникальной игрушкой! Это многофункциональное музыкальное чудо объединяет в себе всё, что нужно для творческого развития.','3.jpg'),('MIO8YV','Музыкальная игрушка интерактивная Пульт, детский прорезыватель для малышей',305,4,2,3,9,31,'Музыкальная игрушка интерактивная Пульт, детский прорезыватель для малышей','9.jpg'),('PMEZMH','Детский игровой набор машинок Щенячий патруль / Dogs mini . 9 героев + 9 инерфионных машинок',1414,1,1,1,22,50,'Детский набор машинок с героями мультсериала «Щенячий патруль» подойдет как для мальчиков, так и для девочек. В детский набор входит 9 фигурок щенков спасателей.','1.jpg'),('S72AM3','Синтезатор детский с микрофоном 61 клавиша',1749,3,3,3,10,35,'Откройте для ребенка дверь в мир музыки с детским синтезатором! Этот компактный инструмент с микрофоном станет верным другом для юных музыкантов, помогая им развивать творческий потенциал и получать удовольствие от игры.','7.jpg'),('UER2QD','Большой набор опытов и экспериментов для детей 14 в 1',2506,4,2,1,8,27,'Большой набор опытов и экспериментов для детей 14 в 1','10.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `idpublishers` int NOT NULL,
  `publisherscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpublishers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Pikeshop'),(2,'Playbig'),(3,'CHILITOY'),(4,'Vinylon'),(5,'Knauf');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvz`
--

DROP TABLE IF EXISTS `pvz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pvz` (
  `idpvz` int NOT NULL,
  `mail_index` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `building` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpvz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvz`
--

LOCK TABLES `pvz` WRITE;
/*!40000 ALTER TABLE `pvz` DISABLE KEYS */;
INSERT INTO `pvz` VALUES (1,'420151','г. Лесной','ул. Вишневая','32'),(2,'125061','г. Лесной','ул. Подгорная','8'),(3,'630370','г. Лесной','ул. Шоссейная','24'),(4,'400562','г. Лесной','ул. Зеленая','32'),(5,'614510','г. Лесной','ул. Маяковского','47'),(6,'410542','г. Лесной','ул. Светлая','46'),(7,'620839','г. Лесной','ул. Цветочная','8'),(8,'443890','г. Лесной','ул. Коммунистическая','1'),(9,'603379','г. Лесной','ул. Спортивная','46'),(10,'603721','г. Лесной','ул. Гоголя','41'),(11,'410172','г. Лесной','ул. Северная','13'),(12,'614611','г. Лесной','ул. Молодежная','50'),(13,'454311','г.Лесной','ул. Новая','19'),(14,'660007','г.Лесной','ул. Октябрьская','19'),(15,'603036','г. Лесной','ул. Садовая','4'),(16,'394060','г.Лесной','ул. Фрунзе','43'),(17,'410661','г. Лесной','ул. Школьная','50'),(18,'625590','г. Лесной','ул. Коммунистическая','20'),(19,'625683','г. Лесной','ул. 8 Марта','1'),(20,'450983','г.Лесной','ул. Комсомольская','26'),(21,'394782','г. Лесной','ул. Чехова','3'),(22,'603002','г. Лесной','ул. Дзержинского','28'),(23,'450558','г. Лесной','ул. Набережная','30'),(24,'344288','г. Лесной','ул. Чехова','1'),(25,'614164','г.Лесной','ул. Степная','30'),(26,'394242','г. Лесной','ул. Коммунистическая','43'),(27,'660540','г. Лесной','ул. Солнечная','25'),(28,'125837','г. Лесной','ул. Шоссейная','40'),(29,'125703','г. Лесной','ул. Партизанская','49'),(30,'625283','г. Лесной','ул. Победы','46'),(31,'614753','г. Лесной','ул. Полевая','35'),(32,'426030','г. Лесной','ул. Маяковского','44'),(33,'450375','г. Лесной','ул. Клубная','44'),(34,'625560','г. Лесной','ул. Некрасова','12'),(35,'630201','г. Лесной','ул. Комсомольская','17'),(36,'190949','г. Лесной','ул. Мичурина','26');
/*!40000 ALTER TABLE `pvz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idroles` int NOT NULL,
  `rolename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Авторизированный клиент');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_categories`
--

DROP TABLE IF EXISTS `room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_price_per_night` decimal(10,2) NOT NULL DEFAULT '0.00',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uk_category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_categories`
--

LOCK TABLES `room_categories` WRITE;
/*!40000 ALTER TABLE `room_categories` DISABLE KEYS */;
INSERT INTO `room_categories` VALUES (1,'Стандарт','Эконом',3000.00,'стандарт'),(2,'Комфорт','Средний',5000.00,'комфорт'),(3,'Люкс','Премиум',8000.00,'люкс'),(4,'Семейный','Средний',6000.00,'семейный');
/*!40000 ALTER TABLE `room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_services`
--

DROP TABLE IF EXISTS `room_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_services` (
  `booking_id` int NOT NULL,
  `service_id` int NOT NULL,
  `service_date` date DEFAULT NULL,
  `recorded_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`booking_id`,`service_id`),
  KEY `fk_rs_service` (`service_id`),
  CONSTRAINT `fk_rs_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rs_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_services`
--

LOCK TABLES `room_services` WRITE;
/*!40000 ALTER TABLE `room_services` DISABLE KEYS */;
INSERT INTO `room_services` VALUES (2,1,'2026-05-18',600.00),(2,2,'2026-05-18',1500.00),(2,3,'2026-05-18',1800.00),(2,4,'2026-05-18',400.00),(2,5,'2026-05-18',2500.00),(18,1,'2026-05-26',600.00),(21,1,'2026-05-29',600.00),(22,1,'2026-05-29',600.00),(23,1,'2026-05-29',600.00),(24,1,'2026-09-04',600.00),(25,1,'2026-09-16',600.00),(31,1,'2026-09-16',600.00);
/*!40000 ALTER TABLE `room_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_number` int NOT NULL,
  `category_id` int NOT NULL,
  `floor` int DEFAULT NULL,
  `capacity` int DEFAULT '1',
  PRIMARY KEY (`room_number`),
  KEY `fk_rooms_category` (`category_id`),
  CONSTRAINT `fk_rooms_category` FOREIGN KEY (`category_id`) REFERENCES `room_categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (101,1,1,2),(102,1,1,1),(201,2,2,3),(202,4,1,4),(301,3,3,2),(303,2,3,2);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `uk_service_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Завтрак в номер','Питание','Основная',600.00),(2,'Сауна','Развлечения','Доп',1500.00),(3,'Трансфер','Транспорт','Доп',1800.00),(4,'Парковка','Общая','Доп',400.00),(5,'Спа-салон','Здоровье','Доп',2500.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `idstatuses` int NOT NULL,
  `statusescol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idstatuses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Завершен'),(2,'Новый');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL,
  `role` int DEFAULT NULL,
  `sname` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `tname` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusers`),
  KEY `adsafdsg_idx` (`role`),
  CONSTRAINT `adsafdsg` FOREIGN KEY (`role`) REFERENCES `roles` (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Ворсин','Петр','Евгеньевич','94d5ous@gmail.com','uzWC67'),(2,1,'Старикова','Елена','Павловна','uth4iz@mail.com','2L6KZG'),(3,1,'Одинцов','Серафим','Артёмович','yzls62@outlook.com','JlFRCZ'),(4,2,'Михайлюк','Анна','Вячеславовна','1diph5e@tutanota.com','8ntwUp'),(5,2,'Ситдикова','Елена','Анатольевна','tjde7c@yahoo.com','YOyhfR'),(6,2,'Никифорова','Весения','Николаевна','wpmrc3do@tutanota.com','RSbvHv'),(7,3,'Степанов','Михаил','Артёмович','5d4zbu@tutanota.com','rwVDh9'),(8,3,'Ворсин','Петр','Евгеньевич','ptec8ym@yahoo.com','LdNyos'),(9,3,'Старикова','Елена','Павловна','1qz4kw@mail.com','gynQMT'),(10,3,'Сазонов','Руслан','Германович','4np6se@mail.com','AtnDjr');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_currentguests`
--

DROP TABLE IF EXISTS `v_currentguests`;
/*!50001 DROP VIEW IF EXISTS `v_currentguests`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_currentguests` AS SELECT 
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Номер_комнаты`,
 1 AS `Дата_заезда`,
 1 AS `Дата_выезда`,
 1 AS `Гостиница`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_finalinvoice`
--

DROP TABLE IF EXISTS `v_finalinvoice`;
/*!50001 DROP VIEW IF EXISTS `v_finalinvoice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_finalinvoice` AS SELECT 
 1 AS `Номер_брони`,
 1 AS `Фамилия`,
 1 AS `Стоимость_проживания`,
 1 AS `Стоимость_услуг`,
 1 AS `Итого`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_freerooms`
--

DROP TABLE IF EXISTS `v_freerooms`;
/*!50001 DROP VIEW IF EXISTS `v_freerooms`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_freerooms` AS SELECT 
 1 AS `Класс`,
 1 AS `Общее_кол_во_номеров`,
 1 AS `Свободно`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_freeseats`
--

DROP TABLE IF EXISTS `v_freeseats`;
/*!50001 DROP VIEW IF EXISTS `v_freeseats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_freeseats` AS SELECT 
 1 AS `Класс_номера`,
 1 AS `Номер_комнаты`,
 1 AS `Общее_мест`,
 1 AS `Занято_мест`,
 1 AS `Свободно_мест`,
 1 AS `Цена_за_ночь`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_guestcheck`
--

DROP TABLE IF EXISTS `v_guestcheck`;
/*!50001 DROP VIEW IF EXISTS `v_guestcheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_guestcheck` AS SELECT 
 1 AS `Номер_брони`,
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Гостиница`,
 1 AS `Номер_комнаты`,
 1 AS `Название_услуги`,
 1 AS `Количество`,
 1 AS `Цена`,
 1 AS `Итого_за_услугу`,
 1 AS `Статус_оплаты`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'hotel_db_single'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddServiceToBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `AddServiceToBooking`(
    IN p_BookingID INT, IN p_ServiceID INT, IN p_Quantity INT, IN p_ServiceDate DATE)
BEGIN
    DECLARE v_Price DECIMAL(10,2);
    SELECT price INTO v_Price FROM services WHERE service_id = p_ServiceID;
    IF v_Price IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Услуга не найдена.';
    ELSE
        INSERT INTO room_services (booking_id, service_id, quantity, service_date, recorded_price)
        VALUES (p_BookingID, p_ServiceID, p_Quantity, p_ServiceDate, v_Price);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `RegisterBooking`(
    IN p_GuestID INT, IN p_RoomNumber INT,
    IN p_StartDate DATE, IN p_EndDate DATE)
BEGIN
    DECLARE room_busy INT;
    SELECT COUNT(*) INTO room_busy FROM bookings
    WHERE room_number = p_RoomNumber
      AND status != 'Отменено' AND p_StartDate < check_out AND p_EndDate > check_in;
    IF room_busy = 0 THEN
        INSERT INTO bookings (guest_id, room_number, check_in, check_out)
        VALUES (p_GuestID, p_RoomNumber, p_StartDate, p_EndDate);
        SELECT 'Успех: Номер забронирован!' AS Status;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Этот номер уже занят на выбранные даты.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_currentguests`
--

/*!50001 DROP VIEW IF EXISTS `v_currentguests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_currentguests` AS select `g`.`last_name` AS `Фамилия`,`g`.`first_name` AS `Имя`,`b`.`room_number` AS `Номер_комнаты`,`b`.`check_in` AS `Дата_заезда`,`b`.`check_out` AS `Дата_выезда`,'Гранд Отель' AS `Гостиница` from (`bookings` `b` join `guests` `g` on((`b`.`guest_id` = `g`.`guest_id`))) where ((curdate() between `b`.`check_in` and `b`.`check_out`) and (`b`.`status` <> 'Отменено')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_finalinvoice`
--

/*!50001 DROP VIEW IF EXISTS `v_finalinvoice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_finalinvoice` AS select `b`.`booking_id` AS `Номер_брони`,`g`.`last_name` AS `Фамилия`,((to_days(`b`.`check_out`) - to_days(`b`.`check_in`)) * `rc`.`base_price_per_night`) AS `Стоимость_проживания`,ifnull(sum(`rs`.`recorded_price`),0) AS `Стоимость_услуг`,(((to_days(`b`.`check_out`) - to_days(`b`.`check_in`)) * `rc`.`base_price_per_night`) + ifnull(sum(`rs`.`recorded_price`),0)) AS `Итого` from ((((`bookings` `b` join `guests` `g` on((`b`.`guest_id` = `g`.`guest_id`))) join `rooms` `r` on((`b`.`room_number` = `r`.`room_number`))) join `room_categories` `rc` on((`r`.`category_id` = `rc`.`category_id`))) left join `room_services` `rs` on((`b`.`booking_id` = `rs`.`booking_id`))) group by `b`.`booking_id`,`g`.`last_name`,`rc`.`base_price_per_night`,`b`.`check_in`,`b`.`check_out` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_freerooms`
--

/*!50001 DROP VIEW IF EXISTS `v_freerooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_freerooms` AS select `rc`.`category_name` AS `Класс`,count(0) AS `Общее_кол_во_номеров`,sum((case when (not exists(select 1 from `bookings` `b2` where ((`b2`.`room_number` = `r`.`room_number`) and (`b2`.`status` <> 'Отменено') and (curdate() between `b2`.`check_in` and `b2`.`check_out`)))) then 1 else 0 end)) AS `Свободно` from (`rooms` `r` join `room_categories` `rc` on((`r`.`category_id` = `rc`.`category_id`))) group by `rc`.`category_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_freeseats`
--

/*!50001 DROP VIEW IF EXISTS `v_freeseats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp866 */;
/*!50001 SET character_set_results     = cp866 */;
/*!50001 SET collation_connection      = cp866_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_freeseats` AS select `rc`.`category_name` AS `�����_�����`,`r`.`room_number` AS `�����_�������`,`r`.`capacity` AS `��饥_����`,(select count(0) from `bookings` `b2` where ((`b2`.`room_number` = `r`.`room_number`) and (`b2`.`status` <> '�⬥����') and (curdate() between `b2`.`check_in` and `b2`.`check_out`))) AS `�����_����`,(`r`.`capacity` - (select count(0) from `bookings` `b2` where ((`b2`.`room_number` = `r`.`room_number`) and (`b2`.`status` <> '�⬥����') and (curdate() between `b2`.`check_in` and `b2`.`check_out`)))) AS `��������_����`,`rc`.`base_price_per_night` AS `����_��_����` from (`rooms` `r` join `room_categories` `rc` on((`r`.`category_id` = `rc`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_guestcheck`
--

/*!50001 DROP VIEW IF EXISTS `v_guestcheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_guestcheck` AS select `b`.`booking_id` AS `Номер_брони`,`g`.`last_name` AS `Фамилия`,`g`.`first_name` AS `Имя`,'Гранд Отель' AS `Гостиница`,`b`.`room_number` AS `Номер_комнаты`,`s`.`name` AS `Название_услуги`,1 AS `Количество`,`rs`.`recorded_price` AS `Цена`,`rs`.`recorded_price` AS `Итого_за_услугу`,`b`.`status` AS `Статус_оплаты` from (((`bookings` `b` join `guests` `g` on((`b`.`guest_id` = `g`.`guest_id`))) left join `room_services` `rs` on((`b`.`booking_id` = `rs`.`booking_id`))) left join `services` `s` on((`rs`.`service_id` = `s`.`service_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-06 12:16:51
