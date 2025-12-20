-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: javaweb32db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_user_idx` (`create_by`),
  KEY `fk_category_user_update_idx` (`update_by`),
  CONSTRAINT `fk_category_user_create` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_category_user_update` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (27,NULL,'Quần áo thể thao',1,8,NULL,NULL,1,''),(28,NULL,'Đồ ngủ',1,1,'2025-10-13 17:00:00',NULL,1,''),(29,NULL,'Đồ dã ngoại',1,7,'2025-10-07 17:00:00','2025-10-17 17:00:00',1,'Các sản phẩm quần áo chuyên phục vụ nhu cầu dã ngoại và thám hiểm'),(31,NULL,'Công sở',1,1,'2025-10-18 17:00:00',NULL,1,''),(32,NULL,'Quần áo thường ngày',1,1,NULL,NULL,1,'');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `is_hot` tinyint DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `short_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`category_id`),
  KEY `fk_product_user_idx` (`create_by`),
  KEY `fk_product_user_update_idx` (`update_by`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_user_create` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_user_update` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (12,28,'Si12313','Product/Avatar/',25000000.00,23000000.00,5,0,1,1,'2025-08-14 17:00:00','2025-09-10 17:00:00',0,'iPhone đời mới nhất','iPhone 15 Pro Max với chip A17, camera 48MP',NULL),(13,27,'Samsung Galaxy S24 Ultra','s24ultra.jpg',32000000.00,30000000.00,6,1,1,NULL,'2025-08-14 19:45:25',NULL,0,'Flagship Samsung 2024','Galaxy S24 Ultra với màn hình 6.8 inch, Snapdragon 8 Gen 3','samsung-galaxy-s24-ultra'),(14,27,'MacBook Pro M3','macbookm3.jpg',52000000.00,50000000.00,12,1,1,NULL,'2025-08-14 19:45:25',NULL,0,'Laptop Apple chip M3','MacBook Pro M3 hiệu năng vượt trội','macbook-pro-m3'),(15,27,'Dell XPS 15','dellxps15.jpg',45000000.00,43000000.00,11,0,1,NULL,'2025-08-14 19:45:25',NULL,0,'Laptop cao cấp Dell','Dell XPS 15 với màn OLED và CPU i9','dell-xps-15'),(16,27,'Tai nghe AirPods Pro 2','airpodspro2.jpg',6000000.00,5500000.00,8,1,1,NULL,'2025-08-14 19:45:25',NULL,1,'Tai nghe không dây Apple','AirPods Pro 2 chống ồn chủ động, Spatial Audio','airpods-pro-2'),(17,27,'iPhone 15 Pro Max','iphone15.jpg',35000000.00,33000000.00,9,1,1,NULL,'2025-08-21 12:21:59',NULL,1,'iPhone đời mới nhất','iPhone 15 Pro Max với chip A17, camera 48MP','iphone-15-pro-max'),(18,27,'Samsung Galaxy S24 Ultra','s24ultra.jpg',32000000.00,30000000.00,23,1,1,NULL,'2025-08-21 12:21:59',NULL,1,'Flagship Samsung 2024','Galaxy S24 Ultra với màn hình 6.8 inch, Snapdragon 8 Gen 3','samsung-galaxy-s24-ultra'),(19,27,'MacBook Pro M3','macbookm3.jpg',52000000.00,50000000.00,4,1,1,NULL,'2025-08-21 12:21:59',NULL,1,'Laptop Apple chip M3','MacBook Pro M3 hiệu năng vượt trội','macbook-pro-m3'),(20,27,'Dell XPS 15','dellxps15.jpg',45000000.00,43000000.00,12,0,1,NULL,'2025-08-21 12:21:59',NULL,1,'Laptop cao cấp Dell','Dell XPS 15 với màn OLED và CPU i9','dell-xps-15'),(21,27,'Tai nghe AirPods Pro 2','airpodspro2.jpg',6000000.00,5500000.00,12,1,1,NULL,'2025-08-21 12:21:59',NULL,1,'Tai nghe không dây Apple','AirPods Pro 2 chống ồn chủ động, Spatial Audio','airpods-pro-2'),(22,27,'iPhone 15 Pro Max','iphone15.jpg',35000000.00,33000000.00,12,1,1,NULL,'2025-08-21 12:23:08',NULL,1,'iPhone đời mới nhất','iPhone 15 Pro Max với chip A17, camera 48MP','iphone-15-pro-max'),(23,27,'Samsung Galaxy S24 Ultra','s24ultra.jpg',32000000.00,30000000.00,12,1,1,NULL,'2025-08-21 12:23:08',NULL,1,'Flagship Samsung 2024','Galaxy S24 Ultra với màn hình 6.8 inch, Snapdragon 8 Gen 3','samsung-galaxy-s24-ultra'),(24,27,'MacBook Pro M3','macbookm3.jpg',52000000.00,50000000.00,12,1,1,NULL,'2025-08-21 12:23:08',NULL,1,'Laptop Apple chip M3','MacBook Pro M3 hiệu năng vượt trội','macbook-pro-m3'),(25,27,'Dell XPS 15','dellxps15.jpg',45000000.00,43000000.00,12,0,1,NULL,'2025-08-21 12:23:08',NULL,1,'Laptop cao cấp Dell','Dell XPS 15 với màn OLED và CPU i9','dell-xps-15'),(26,27,'Tai nghe AirPods Pro 2','airpodspro2.jpg',6000000.00,5500000.00,12,1,1,NULL,'2025-08-21 12:23:08',NULL,1,'Tai nghe không dây Apple','AirPods Pro 2 chống ồn chủ động, Spatial Audio','airpods-pro-2'),(27,27,'iPhone 15 Pro Max','iphone15.jpg',35000000.00,33000000.00,12,1,1,NULL,'2025-08-21 12:23:29',NULL,1,'iPhone đời mới nhất','iPhone 15 Pro Max với chip A17, camera 48MP','iphone-15-pro-max'),(28,27,'Samsung Galaxy S24 Ultra','s24ultra.jpg',32000000.00,30000000.00,12,1,1,NULL,'2025-08-21 12:23:29',NULL,1,'Flagship Samsung 2024','Galaxy S24 Ultra với màn hình 6.8 inch, Snapdragon 8 Gen 3','samsung-galaxy-s24-ultra'),(29,27,'MacBook Pro M3','macbookm3.jpg',52000000.00,50000000.00,12,1,1,NULL,'2025-08-21 12:23:29',NULL,1,'Laptop Apple chip M3','MacBook Pro M3 hiệu năng vượt trội','macbook-pro-m3'),(30,27,'Dell XPS 15','dellxps15.jpg',45000000.00,43000000.00,12,0,1,NULL,'2025-08-21 12:23:29',NULL,1,'Laptop cao cấp Dell','Dell XPS 15 với màn OLED và CPU i9','dell-xps-15'),(31,27,'Tai nghe AirPods Pro 2','airpodspro2.jpg',6000000.00,5500000.00,12,1,1,NULL,'2025-08-21 12:23:29',NULL,1,'Tai nghe không dây Apple','AirPods Pro 2 chống ồn chủ động, Spatial Audio','airpods-pro-2'),(32,27,'iPhone 15 Pro Max','Product/Avatar/',35000000.00,33000000.00,12,0,1,1,'2025-08-21 17:00:00','2025-09-10 17:00:00',0,'iPhone đời mới nhất','iPhone 15 Pro Max với chip A17, camera 48MP',NULL),(33,27,'Samsung Galaxy S24 Ultra','s24ultra.jpg',32000000.00,30000000.00,12,1,1,NULL,'2025-08-21 19:07:22',NULL,1,'Flagship Samsung 2024','Galaxy S24 Ultra với màn hình 6.8 inch, Snapdragon 8 Gen 3','samsung-galaxy-s24-ultra'),(34,27,'MacBook Pro M3','macbookm3.jpg',52000000.00,50000000.00,12,1,1,NULL,'2025-08-21 19:07:22',NULL,1,'Laptop Apple chip M3','MacBook Pro M3 hiệu năng vượt trội','macbook-pro-m3'),(35,28,'Dell XPS 15','Product/Avatar/',45000000.00,43000000.00,12,0,1,1,'2025-08-21 17:00:00','2025-09-10 17:00:00',0,'Laptop cao cấp Dell','Dell XPS 15 với màn OLED và CPU i9',NULL),(36,28,'Tai nghe AirPods Pro 2','Product/Avatar/',6000000.00,5500000.00,12,0,1,1,'2025-08-21 17:00:00','2025-09-10 17:00:00',0,'Tai nghe không dây Apple','AirPods Pro 2 chống ồn chủ động, Spatial Audio',NULL),(37,28,'Sanh','Product/Avatar/',7000000.00,5500000.00,12,1,1,1,'2025-09-08 17:00:00','2025-09-10 17:00:00',0,'','',NULL),(38,28,'Khế cảnh','Product/Avatar/RQM_4639111730-Original-1893-Boer-War-Era-Lee-Metford-Rifle-with-Saddle-Holster-1-scaled.jpg',2000000.00,1800000.00,12,0,1,1,'2025-09-08 17:00:00',NULL,1,'','',NULL),(39,28,'xanh lam','Product/Avatar/298px-Москва_wows_main.jpg',5.00,3.00,12,0,1,1,'2025-09-10 17:00:00',NULL,0,'','',NULL),(40,28,'Sanh111','Product/Avatar/',0.00,0.00,12,0,1,1,'2025-09-10 17:00:00','2025-09-10 17:00:00',0,'','',NULL),(41,27,'Thể thao','Product/Avatar/',1500000.00,1000000.00,12,0,1,1,'2025-09-10 17:00:00','2025-10-08 17:00:00',1,'Như tên gọi','',NULL),(42,28,'xanh lam','Product/Avatar/Capture001.png',12200000.00,1500000.00,12,0,1,1,'2025-10-06 17:00:00',NULL,1,'','',NULL),(43,27,'Sanh','Product/Avatar/4-success-kid-3596018b-1458201719100-1458267903230.webp',2131321.00,11222.00,12,0,1,1,'2025-10-08 17:00:00',NULL,1,'cvbnm,','sdfghjkl',NULL),(44,27,'dffsfs','Product/Avatar/298px-Москва_wows_main.jpg',131313.00,12131.00,12,0,1,1,'2025-10-08 17:00:00',NULL,0,'gdgdg','dgdgdg',NULL),(45,28,'eqeqeqdâdada','Product/Avatar/800px-Москва_wows_main.jpg',1200000.00,1100000.00,12,0,1,1,'2025-10-08 17:00:00','2025-10-08 17:00:00',0,'adadad','adadadada',NULL),(46,28,'Đồ ngủ nữ','Product/Avatar/product-2.png',2500000.00,1800000.00,35,0,7,7,'2025-10-18 17:00:00',NULL,1,'Đồ ngủ dành cho nữ với chất liệu vải dễ chịu','',NULL),(47,27,'Đồ thể thao Adidas','Product/Avatar/adi.jpg',2500000.00,1800000.00,10,0,8,8,'2025-10-18 17:00:00',NULL,1,'Quần áo thể thao Adidas','Quần áo thể thao Adidas với chất liệu dễ chịu và độ bền đảm bảo',NULL),(48,27,'Áo thể thao Adidas','Product/Avatar/adi2.jpg',520000.00,400000.00,6,0,1,1,'2025-10-18 17:00:00',NULL,1,'đồ thể thao ','đồ thể thao ',NULL),(49,28,'Quần áo ngủ cho em bé','Product/Avatar/SuccessKid.jpg',250000.00,200000.00,5,0,1,1,'2025-10-18 17:00:00',NULL,0,'Quần áo ngủ cho em bé','Quần áo ngủ cho em bé',NULL);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_image`
--

DROP TABLE IF EXISTS `tbl_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_img_product_idx` (`product_id`),
  CONSTRAINT `fk_product_img_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_image`
--

LOCK TABLES `tbl_product_image` WRITE;
/*!40000 ALTER TABLE `tbl_product_image` DISABLE KEYS */;
INSERT INTO `tbl_product_image` VALUES (119,37,'4-success-kid-3596018b-1458201719100-1458267903230.webp','Product/Image/4-success-kid-3596018b-1458201719100-1458267903230.webp',NULL,NULL,'2025-09-09 08:56:50',NULL,1),(120,37,'4-success-kid-3596018b-1458201719100-1458267903230.webp','Product/Image/4-success-kid-3596018b-1458201719100-1458267903230.webp',NULL,NULL,'2025-09-09 08:56:50',NULL,1),(121,37,'4-success-kid-3596018b-1458201719100-1458267903230.webp','Product/Image/4-success-kid-3596018b-1458201719100-1458267903230.webp',NULL,NULL,'2025-09-09 08:56:50',NULL,1),(122,37,'4-success-kid-3596018b-1458201719100-1458267903230.webp','Product/Image/4-success-kid-3596018b-1458201719100-1458267903230.webp',NULL,NULL,'2025-09-09 08:56:50',NULL,1),(123,38,'dg98qha-af682a7f-a8bc-4d24-bb6a-36a028e34ec0.jpg','Product/Image/dg98qha-af682a7f-a8bc-4d24-bb6a-36a028e34ec0.jpg',NULL,NULL,'2025-09-09 09:16:40',NULL,1),(124,38,'3resmybc0af41.jpg','Product/Image/3resmybc0af41.jpg',NULL,NULL,'2025-09-09 09:16:40',NULL,1),(125,38,'Kreiser_komsomolec.jpg','Product/Image/Kreiser_komsomolec.jpg',NULL,NULL,'2025-09-09 09:16:40',NULL,1),(126,38,'800px-Измаил_wows_main.jpg','Product/Image/800px-Измаил_wows_main.jpg',NULL,NULL,'2025-09-09 09:16:40',NULL,1),(127,12,'3resmybc0af41.jpg','Product/Image/3resmybc0af41.jpg',NULL,NULL,'2025-09-09 10:19:47',NULL,1),(128,12,'dg98qha-af682a7f-a8bc-4d24-bb6a-36a028e34ec0.jpg','Product/Image/dg98qha-af682a7f-a8bc-4d24-bb6a-36a028e34ec0.jpg',NULL,NULL,'2025-09-09 10:19:47',NULL,1),(129,12,'800px-Москва_wows_main.jpg','Product/Image/800px-Москва_wows_main.jpg',NULL,NULL,'2025-09-09 10:19:47',NULL,1),(130,12,'800px-Измаил_wows_main.jpg','Product/Image/800px-Измаил_wows_main.jpg',NULL,NULL,'2025-09-09 10:19:47',NULL,1),(131,42,'4-success-kid-3596018b-1458201719100-1458267903230.webp','Product/Image/4-success-kid-3596018b-1458201719100-1458267903230.webp',NULL,NULL,'2025-10-07 12:55:45',NULL,1),(132,43,'298px-Москва_wows_main.jpg','Product/Image/298px-Москва_wows_main.jpg',NULL,NULL,'2025-10-09 10:59:37',NULL,1),(133,44,'800px-Измаил_wows_main.jpg','Product/Image/800px-Измаил_wows_main.jpg',NULL,NULL,'2025-10-09 11:14:37',NULL,1),(134,45,'dg98qha-af682a7f-a8bc-4d24-bb6a-36a028e34ec0.jpg','Product/Image/dg98qha-af682a7f-a8bc-4d24-bb6a-36a028e34ec0.jpg',NULL,NULL,'2025-10-09 12:21:29',NULL,1),(135,46,'product-1.png','Product/Image/product-1.png',NULL,NULL,'2025-10-19 05:45:16',NULL,1),(136,46,'product-1.png','Product/Image/product-1.png',NULL,NULL,'2025-10-19 05:45:16',NULL,1),(137,47,'adi.jpg','Product/Image/adi.jpg',NULL,NULL,'2025-10-19 07:39:47',NULL,1),(143,48,'adi1.jpg','Product/Image/adi1.jpg',NULL,NULL,'2025-10-19 08:34:35',NULL,1),(144,48,'adi4.jpg','Product/Image/adi4.jpg',NULL,NULL,'2025-10-19 08:34:35',NULL,1),(153,49,'SuccessKid.jpg','Product/Image/SuccessKid.jpg',NULL,NULL,'2025-10-19 09:42:28',NULL,1);
/*!40000 ALTER TABLE `tbl_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (4,'ADMIN',NULL,NULL,NULL,NULL,1,NULL),(5,'CUSTOMER',NULL,NULL,NULL,NULL,1,NULL),(6,'STAFF',7,1,'2025-10-18 17:00:00','2025-10-18 17:00:00',0,'');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_order`
--

DROP TABLE IF EXISTS `tbl_sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `code` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `customer_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_mobile` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `order_status` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_order_user_idx` (`user_id`),
  CONSTRAINT `fk_sale_order_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order`
--

LOCK TABLES `tbl_sale_order` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order` DISABLE KEYS */;
INSERT INTO `tbl_sale_order` VALUES (22,11,NULL,3311222.00,'Đức lê','0968689656','tnam64368@gmail.com',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL),(23,11,NULL,43000000.00,'Đức lê','0968689656','tnam64368@gmail.com',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL),(24,11,NULL,30000000.00,'Đức lê','0968689656','tnam64368@gmail.com',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL),(25,12,NULL,18000000.00,'Đức lê','0968689656','tnam64369@gmail.com',NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_order_product`
--

DROP TABLE IF EXISTS `tbl_sale_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_order_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sale_order_product_product_idx` (`product_id`),
  KEY `fk_sale_order_product_sale_order_idx` (`sale_order_id`),
  CONSTRAINT `fk_sale_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_order_product_sale_order` FOREIGN KEY (`sale_order_id`) REFERENCES `tbl_sale_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order_product`
--

LOCK TABLES `tbl_sale_order_product` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order_product` DISABLE KEYS */;
INSERT INTO `tbl_sale_order_product` VALUES (65,22,43,1,11222.00,NULL,NULL,NULL,NULL,1,'Đặt hàng từ giỏ hàng','Sanh'),(66,22,42,1,1500000.00,NULL,NULL,NULL,NULL,1,'Đặt hàng từ giỏ hàng','xanh lam'),(67,22,38,1,1800000.00,NULL,NULL,NULL,NULL,1,'Đặt hàng từ giỏ hàng','Khế cảnh'),(68,23,30,1,43000000.00,NULL,NULL,NULL,NULL,1,'Đặt hàng từ giỏ hàng','Dell XPS 15'),(69,24,18,1,30000000.00,NULL,NULL,NULL,NULL,1,'Đặt hàng từ giỏ hàng','Samsung Galaxy S24 Ultra'),(70,25,47,10,1800000.00,NULL,NULL,NULL,NULL,1,'Đặt hàng từ giỏ hàng','Đồ thể thao Adidas');
/*!40000 ALTER TABLE `tbl_sale_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Admin','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'Client','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(7,'Admin1','$2a$10$hXvU1u8lVNjcYO5o8yLu0.6GdE5ac3Wwzgh1wQx2I/XlfY7diyxyK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(8,'Admin2','$2a$04$VaqjKrieE7m5A3h191jTOu6Y4LANMulrBdpi3nAZQt/yGT0cIGg3W',NULL,'0968689651','tnam64367@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(9,'Guest1','$2a$04$hWcJIdLSrG4WoBEycjZqQOzXv.nMo6gpdApq48tJoiE1Y8jiyOwXi',NULL,'0968689652','tnam643671@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(10,'Guest2','$2a$04$QV15./mvR6mm87/31NrBhuyHjC45.Zkx1l/PDhCU8MUztX1JnKai.',NULL,'0968689653','tnam64361@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(11,'Guest3','$2a$04$eh6OIkshOwV4ytwcAV9uzefeU23WVZkL/3GMVNlyRFQNvsFRW3Jca','Đức lê','0968689656','tnam64368@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(12,'Guest5','$2a$04$BeDT9LekYtPRNYFJ5L9m3uEZvnzWZh.3UAbG8ikA2XV0vHU8RyvwG','Đức lê','0968689656','tnam64369@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_idx` (`role_id`),
  KEY `fk_role_user_idx` (`user_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_role`
--

LOCK TABLES `tbl_user_role` WRITE;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` VALUES (8,1,4),(10,7,4),(12,8,4),(13,8,4),(29,2,5),(30,9,5),(31,9,5),(32,10,5),(33,10,5),(34,11,5),(35,11,5),(36,12,5),(37,12,5);
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-20 17:09:10
