-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: synthworld
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Hyundai',NULL,NULL),(2,'Infiniti',NULL,NULL),(3,'MINI',NULL,NULL),(4,'Volkswagen',NULL,NULL),(5,'Audi',NULL,NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `product` (`product_id`),
  KEY `order` (`order_id`),
  CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Services',NULL,NULL),(2,'Accounting',NULL,NULL),(3,'Engineering',NULL,NULL),(4,'Human Resources',NULL,NULL),(5,'Marketing',NULL,NULL),(6,'Legal',NULL,NULL),(7,'Human Resources',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `checkout` tinyint DEFAULT '0',
  `checkout_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `productC` (`product_id`),
  KEY `category` (`category_id`),
  CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `productC` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,2,NULL,NULL),(5,5,2,NULL,NULL),(6,6,2,NULL,NULL),(7,6,3,NULL,NULL),(8,7,3,NULL,NULL),(9,7,2,NULL,NULL),(10,8,1,NULL,NULL),(11,8,4,NULL,NULL),(12,9,4,NULL,NULL),(13,10,5,NULL,NULL),(14,11,5,NULL,NULL),(15,12,3,NULL,NULL),(16,12,5,NULL,NULL),(17,13,1,NULL,NULL),(18,14,2,NULL,NULL),(19,15,4,NULL,NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(4,2) DEFAULT '0.00',
  `image` varchar(100) NOT NULL,
  `description` text,
  `extra_info` text,
  `is_active` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `brand` (`brand_id`),
  CONSTRAINT `brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Home Ing',1,1998.00,NULL,'http://dummyimage.com/107x100.png/ff4444/ffffff','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.','Laparoscopic removal of both ovaries and tubes at same operative episode',1,'2023-02-02 23:20:00',NULL),(2,'Alphazap',1,1996.00,NULL,'http://dummyimage.com/107x100.png/5fa2dd/ffffff','Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.','Complete glossectomy',0,'2023-02-02 23:20:00',NULL),(3,'Fixflex',1,1986.00,NULL,'http://dummyimage.com/160x100.png/5fa2dd/ffffff','Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.','Exploration of thymus field',1,'2023-02-02 23:20:00',NULL),(4,'Subin',2,2003.00,NULL,'http://dummyimage.com/137x100.png/5fa2dd/ffffff','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.','Arthrotomy for removal of prosthesis without replacement, ankle',0,'2023-02-02 23:20:00',NULL),(5,'Tin',2,1996.00,NULL,'http://dummyimage.com/177x100.png/cc0000/ffffff','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.','Excision of other minor lesion of eyelid',1,'2023-02-02 23:20:00',NULL),(6,'Bamity',2,2003.00,NULL,'http://dummyimage.com/197x100.png/dddddd/000000','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.','Thoracoscopic pleural biopsy',1,'2023-02-02 23:20:00',NULL),(7,'Tempsoft',3,2001.00,NULL,'http://dummyimage.com/141x100.png/5fa2dd/ffffff','Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.','Limb lengthening procedures, tibia and fibula',1,'2023-02-02 23:20:00',NULL),(8,'Duobam',3,2005.00,NULL,'http://dummyimage.com/128x100.png/dddddd/000000','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.','Other incision of lacrimal passages',1,'2023-02-02 23:20:00',NULL),(9,'Stringtough',3,2007.00,NULL,'http://dummyimage.com/215x100.png/dddddd/000000','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.','Obstetric tamponade of uterus or vagina',1,'2023-02-02 23:20:00',NULL),(10,'Domainer',4,1996.00,NULL,'http://dummyimage.com/172x100.png/dddddd/000000','Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.','Injection or infusion of platelet inhibitor',0,'2023-02-02 23:20:00',NULL),(11,'Trippledex',4,1992.00,NULL,'http://dummyimage.com/175x100.png/5fa2dd/ffffff','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.','Esophagogastroduodenoscopy [EGD] with closed biopsy',0,'2023-02-02 23:20:00',NULL),(12,'Bitchip',4,1995.00,NULL,'http://dummyimage.com/129x100.png/dddddd/000000','In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.','Other plastic repair of external ear',0,'2023-02-02 23:20:00',NULL),(13,'Trippledex',5,2009.00,NULL,'http://dummyimage.com/244x100.png/cc0000/ffffff','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.','Microscopic examination of specimen from skin and other integument, other microscopic examination',1,'2023-02-02 23:20:00',NULL),(14,'Span',5,2005.00,NULL,'http://dummyimage.com/220x100.png/5fa2dd/ffffff','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.','Laparoscopic repair of diaphragmatic hernia, with thoracic approach',0,'2023-02-02 23:20:00',NULL),(15,'Mat Lam Tam',5,1992.00,NULL,'http://dummyimage.com/138x100.png/cc0000/ffffff','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.','Thoracoscopic excision of lesion or tissue of lung',1,'2023-02-02 23:20:00',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT 'defaultAvatar.png',
  `is_admin` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT (curdate()),
  `updated_at` timestamp NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Stavros','Frodsam','sfrodsam0@vistaprint.com','HXbSOzXgWI0K','http://dummyimage.com/186x100.png/cc0000/ffffff',0,NULL,NULL),(2,'Thaddus','Blofield','tblofield1@theglobeandmail.com','s9YZEY16oYmI','http://dummyimage.com/136x100.png/cc0000/ffffff',1,NULL,NULL),(3,'Kimberli','Roggieri','kroggieri2@huffingtonpost.com','6ov3i3SRsW','http://dummyimage.com/140x100.png/ff4444/ffffff',0,NULL,NULL),(4,'Bernita','Hollidge','bhollidge3@issuu.com','SBpkEIpemXcY','http://dummyimage.com/161x100.png/cc0000/ffffff',1,NULL,NULL),(5,'Kinsley','Dosdell','kdosdell4@tmall.com','m8DF9YI4E5','http://dummyimage.com/246x100.png/dddddd/000000',1,NULL,NULL),(6,'Jordan','Corradetti','jcorradetti5@w3.org','yi9zft','http://dummyimage.com/157x100.png/ff4444/ffffff',0,NULL,NULL),(7,'Joelynn','Panketh','jpanketh6@google.cn','mfCsVLctz','http://dummyimage.com/166x100.png/ff4444/ffffff',0,NULL,NULL),(8,'Dennison','Wakeman','dwakeman7@cocolog-nifty.com','6OYb3xuxD','http://dummyimage.com/169x100.png/dddddd/000000',1,NULL,NULL),(9,'Steffi','Mumbray','smumbray8@infoseek.co.jp','U5eAV8ux4A','http://dummyimage.com/224x100.png/ff4444/ffffff',1,NULL,NULL),(10,'Eudora','Aimeric','eaimeric9@netscape.com','n0UWj48yfi7q','http://dummyimage.com/204x100.png/cc0000/ffffff',1,NULL,NULL),(11,'Matias','R','matias@hotmail.com','$2a$10$EwXJEUpkeHVnWsSzVdWvvOy8qHsAube0wmETi393n.zA4CabGPqT6','userAvatar-1675384876419.jpg',0,'2023-02-03 00:41:16','2023-02-03 00:41:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-03  1:54:50
