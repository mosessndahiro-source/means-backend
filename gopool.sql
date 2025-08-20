-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: localhost    Database: qvid
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `appointee_id` int NOT NULL,
  `appointee_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointer_id` int DEFAULT NULL,
  `appointer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00',
  `amount_meta` json DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_meta` json DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `short_description` json DEFAULT NULL,
  `description` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `meta` json DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `blockable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blockable_id` bigint unsigned NOT NULL,
  `blocker_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocker_id` bigint unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blocks_blockable_type_blockable_id_index` (`blockable_type`,`blockable_id`),
  KEY `blocks_blocker_type_blocker_id_index` (`blocker_type`,`blocker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `meta` json DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `parent_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_preferences`
--

DROP TABLE IF EXISTS `category_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_preferences` (
  `category_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `category_preferences_category_id_foreign` (`category_id`),
  KEY `category_preferences_user_id_foreign` (`user_id`),
  CONSTRAINT `category_preferences_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_preferences`
--

LOCK TABLES `category_preferences` WRITE;
/*!40000 ALTER TABLE `category_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'ut quo','Magnam voluptas doloremque est facilis tempora.','Eveniet molestiae aliquid sit eos cumque. Est provident ducimus quo voluptates animi.',NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26'),(2,'tempora necessitatibus','Sit ad iste similique.','Molestias adipisci dolorum quia culpa labore non at. Aperiam earum dolor voluptas.',NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26'),(3,'consequatur accusantium','Eos enim iure quo in omnis dolor.','Ratione velit at aut. Suscipit voluptatibus in omnis sapiente. Et dolore omnis est.',NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26'),(4,'non veritatis','Architecto similique consequatur nobis.','Autem consectetur et sint. Et eligendi aut exercitationem enim officia. Eaque aut ad soluta molestiae. Quo rerum quo fugiat corrupti eum alias.',NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26'),(5,'ea similique','Sapiente corrupti eos aut amet.','Aut sunt fugit sint reiciendis voluptatem. Tempore a eos consequuntur error. Accusamus totam culpa voluptate numquam quae aliquam. Accusamus quod at dolor quis earum et.',NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int unsigned NOT NULL,
  `favoriteable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoriteable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`favoriteable_id`,`favoriteable_type`),
  KEY `favorites_favoriteable_type_favoriteable_id_index` (`favoriteable_type`,`favoriteable_id`),
  KEY `favorites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `likeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likeable_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`),
  KEY `likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `description` json DEFAULT NULL,
  `short_description` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `views_count` int NOT NULL DEFAULT '0',
  `shares_count` int NOT NULL DEFAULT '0',
  `length` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artists` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `maturity_rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('published','unpublished','draft') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `parent_media_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `media_category_id_foreign` (`category_id`),
  KEY `media_user_id_foreign` (`user_id`),
  KEY `media_parent_media_id_foreign` (`parent_media_id`),
  CONSTRAINT `media_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_parent_media_id_foreign` FOREIGN KEY (`parent_media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_authors`
--

DROP TABLE IF EXISTS `media_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_authors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int unsigned NOT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_authors_author_id_foreign` (`author_id`),
  KEY `media_authors_media_id_foreign` (`media_id`),
  CONSTRAINT `media_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_authors_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_authors`
--

LOCK TABLES `media_authors` WRITE;
/*!40000 ALTER TABLE `media_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_categories`
--

DROP TABLE IF EXISTS `media_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_categories` (
  `media_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `media_categories_media_id_foreign` (`media_id`),
  KEY `media_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `media_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_categories_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_categories`
--

LOCK TABLES `media_categories` WRITE;
/*!40000 ALTER TABLE `media_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_content`
--

DROP TABLE IF EXISTS `media_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta` json DEFAULT NULL,
  `original_source` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` json NOT NULL,
  `type` enum('clip','main') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main',
  `media_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_content_media_id_foreign` (`media_id`),
  CONSTRAINT `media_content_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_content`
--

LOCK TABLES `media_content` WRITE;
/*!40000 ALTER TABLE `media_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_episodes`
--

DROP TABLE IF EXISTS `media_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_episodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `season_number` int NOT NULL,
  `episode_number` int NOT NULL,
  `meta` json DEFAULT NULL,
  `media_id` int unsigned NOT NULL,
  `parent_media_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_episodes_media_id_foreign` (`media_id`),
  KEY `media_episodes_parent_media_id_foreign` (`parent_media_id`),
  CONSTRAINT `media_episodes_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_episodes_parent_media_id_foreign` FOREIGN KEY (`parent_media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_episodes`
--

LOCK TABLES `media_episodes` WRITE;
/*!40000 ALTER TABLE `media_episodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_libraries`
--

DROP TABLE IF EXISTS `media_libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_libraries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_libraries_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_libraries`
--

LOCK TABLES `media_libraries` WRITE;
/*!40000 ALTER TABLE `media_libraries` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_libraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_orders`
--

DROP TABLE IF EXISTS `media_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta` json DEFAULT NULL,
  `subtotal` double(8,2) NOT NULL,
  `taxes` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_orders_media_id_foreign` (`media_id`),
  KEY `media_orders_user_id_foreign` (`user_id`),
  CONSTRAINT `media_orders_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_orders`
--

LOCK TABLES `media_orders` WRITE;
/*!40000 ALTER TABLE `media_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_06_01_000001_create_oauth_auth_codes_table',1),(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(4,'2016_06_01_000004_create_oauth_clients_table',1),(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(6,'2018_06_07_123211_plans',1),(7,'2018_07_14_183253_create_table_appointments',1),(8,'2018_07_14_183253_payment_methods',1),(9,'2018_07_14_183253_payments',1),(10,'2018_07_14_183253_ratings',1),(11,'2018_07_14_183254_alter_payment_methods',1),(12,'2018_08_08_100000_create_telescope_entries_table',1),(13,'2018_12_14_000000_create_likes_table',1),(14,'2019_06_07_123211_plans_metadata',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2020_04_04_000000_create_user_follower_table',1),(17,'2020_06_30_140057_create_medialibrary_table',1),(18,'2020_06_30_140057_create_permission_tables',1),(19,'2020_07_01_164434_create_favorites_table',1),(20,'2020_07_09_150356_create_banners_table',1),(21,'2020_07_09_150356_create_blocks_table',1),(22,'2020_07_09_150356_create_faqs_table',1),(23,'2020_07_09_150356_create_reports_table',1),(24,'2020_07_09_150356_create_supports_table',1),(25,'2021_01_29_133042_create_comments_table',1),(26,'2021_04_12_232102_create_jobs_table',1),(27,'2050_01_01_000005_create_users_table',1),(28,'2050_01_01_000010_create_password_resets_table',1),(29,'2050_01_01_000015_create_settings_table',1),(30,'2050_01_01_000020_create_activity_logs_table',1),(31,'2050_01_01_000025_create_notifications_table',1),(32,'2051_01_01_000010_create_authors_table',1),(33,'2051_01_01_000010_create_seasons_table',1),(34,'2051_01_01_000020_create_categories_table',1),(35,'2051_01_01_000020_create_media_table',1),(36,'2051_01_01_000021_alter_media_table_add_price',1),(37,'2051_01_01_000040_create_media_authors_table',1),(38,'2051_01_01_000040_create_media_orders_table',1),(39,'2051_01_01_000050_create_user_author_preferences_table',1),(40,'2051_01_01_000200_create_category_preferences_table',1),(41,'2051_01_01_000200_create_mobile_languages_table',1),(42,'2055_02_20_113000_create_wallets_table',1),(43,'2055_02_20_113500_create_wallet_transactions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_languages`
--

DROP TABLE IF EXISTS `mobile_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobile_languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_languages`
--

LOCK TABLES `mobile_languages` WRITE;
/*!40000 ALTER TABLE `mobile_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'Vtlabs\\Core\\Models\\User\\User',1),(1,'Vtlabs\\Core\\Models\\User\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `from_user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  KEY `notifications_from_user_id_foreign` (`from_user_id`),
  CONSTRAINT `notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Qvid Personal Access Client','6uuYUiJtIyhO1GBnELZkCsUAX1XbqxAYUrJIAxCE','http://localhost',1,0,0,'2021-10-31 16:43:26','2021-10-31 16:43:26'),(2,NULL,'Qvid Password Grant Client','vTiOTduc5787rfenjyrItsMEiL7yIElJTlKfLSyq','http://localhost',0,1,0,'2021-10-31 16:43:26','2021-10-31 16:43:26');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-10-31 16:43:26','2021-10-31 16:43:26');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('prepaid','postpaid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payable_id` int NOT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` int DEFAULT NULL,
  `payer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL DEFAULT '30',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_features`
--

DROP TABLE IF EXISTS `plans_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_features` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('feature','limit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'feature',
  `limit` int NOT NULL DEFAULT '0',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_features`
--

LOCK TABLES `plans_features` WRITE;
/*!40000 ALTER TABLE `plans_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_subscriptions`
--

DROP TABLE IF EXISTS `plans_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `model_id` int NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('stripe') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `charging_price` double(8,2) DEFAULT NULL,
  `charging_currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1',
  `recurring_each_days` int NOT NULL DEFAULT '30',
  `starts_on` timestamp NULL DEFAULT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_subscriptions`
--

LOCK TABLES `plans_subscriptions` WRITE;
/*!40000 ALTER TABLE `plans_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_usages`
--

DROP TABLE IF EXISTS `plans_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_usages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` int NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` double(9,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_usages`
--

LOCK TABLES `plans_usages` WRITE;
/*!40000 ALTER TABLE `plans_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` int NOT NULL,
  `rateable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rater_id` int DEFAULT NULL,
  `rater_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reportable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportable_id` bigint unsigned NOT NULL,
  `reporter_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reporter_id` bigint unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_reportable_type_reportable_id_index` (`reportable_type`,`reportable_id`),
  KEY `reports_reporter_type_reporter_id_index` (`reporter_type`,`reporter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','api','2021-10-31 16:43:26','2021-10-31 16:43:26'),(2,'customer','api','2021-10-31 16:43:26','2021-10-31 16:43:26');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seasons_title_unique` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('string','text','json','numeric','boolean') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'currency_code','USD','string'),(2,'currency_icon','$','string'),(3,'support_email','admin@example.com','string'),(4,'support_phone','8181818118','string'),(5,'privacy_policy','Demo privacy policy','string'),(6,'about_us','Demo privacy policy','string'),(7,'terms','Demo Terms and Condition','string');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_customers`
--

DROP TABLE IF EXISTS `stripe_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stripe_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_customers`
--

LOCK TABLES `stripe_customers` WRITE;
/*!40000 ALTER TABLE `stripe_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` VALUES (1,'94c48972-fdc9-479c-8fd1-4b05cd001c9a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SHOW FULL TABLES WHERE table_type = \'BASE TABLE\'\",\"time\":\"2.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"6f829d6126b80ce8ebe0bf8bda994397\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(2,'94c48972-fe66-4374-9e4a-db486d89661f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SET FOREIGN_KEY_CHECKS=0;\",\"time\":\"0.18\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"9c5164ece4bf39898f83f37fb558d94e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(3,'94c48973-5bf5-4ad3-b7dc-754f92ffb478','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table `activity_logs`,`appointments`,`authors`,`banners`,`categories`,`category_preferences`,`comments`,`failed_jobs`,`faqs`,`favorites`,`jobs`,`likes`,`media`,`media_authors`,`media_categories`,`media_content`,`media_coupons`,`media_coupons_users`,`media_episodes`,`media_libraries`,`media_orders`,`migrations`,`mobile_languages`,`model_has_permissions`,`model_has_roles`,`notifications`,`oauth_access_tokens`,`oauth_auth_codes`,`oauth_clients`,`oauth_personal_access_clients`,`oauth_refresh_tokens`,`password_resets`,`payment_methods`,`payments`,`permissions`,`plans`,`plans_features`,`plans_subscriptions`,`plans_usages`,`ratings`,`reports`,`role_has_permissions`,`roles`,`seasons`,`settings`,`stripe_customers`,`supports`,`telescope_entries`,`telescope_entries_tags`,`telescope_monitoring`,`user_author_preferences`,`user_follower`,`users`,`wallet_transactions`,`wallets`\",\"time\":\"239.16\",\"slow\":true,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"e4c1d95f01667cbd17ab79636302110d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(4,'94c48973-5c1c-4b65-beb4-92e364eab40e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SET FOREIGN_KEY_CHECKS=1;\",\"time\":\"0.14\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"ff8d2195509c14c72a84fc4ea05c636c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(5,'94c48973-5cb9-4975-90a5-89d0a492ea61','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'qvid\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"1.02\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(6,'94c48973-5f03-4923-a27a-07db38d2b9b4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `migrations` (`id` int unsigned not null auto_increment primary key, `migration` varchar(255) not null, `batch` int not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.47\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"246242198a8fbc1beb167611385ac644\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(7,'94c48973-6206-4476-8f84-f8f953552871','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(8,'94c48973-64fc-4ffc-9acb-7d0e1e75016f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"0.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(9,'94c48973-676e-4fe8-9935-e4092720eeb3','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_auth_codes` (`id` varchar(100) not null, `user_id` bigint unsigned not null, `client_id` bigint unsigned not null, `scopes` text null, `revoked` tinyint(1) not null, `expires_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000001_create_oauth_auth_codes_table.php\",\"line\":23,\"hash\":\"6aa061f0fc61b1fd026b5d2bebdf3449\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(10,'94c48973-6b84-4ced-b846-0f85ff6524f8','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_auth_codes` add primary key `oauth_auth_codes_id_primary`(`id`)\",\"time\":\"10.23\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000001_create_oauth_auth_codes_table.php\",\"line\":23,\"hash\":\"1adb39f917be92744b1c913f3c50cc25\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(11,'94c48973-6d70-43eb-b56f-7145b0a34e82','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_auth_codes` add index `oauth_auth_codes_user_id_index`(`user_id`)\",\"time\":\"4.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000001_create_oauth_auth_codes_table.php\",\"line\":23,\"hash\":\"672329a8ecc84bf315ed3624dd041214\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(12,'94c48973-6de6-462a-91a2-6d074903aaac','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000001_create_oauth_auth_codes_table\', 1)\",\"time\":\"0.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(13,'94c48973-71ef-452b-8d5f-ca609d7c8f55','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_access_tokens` (`id` varchar(100) not null, `user_id` bigint unsigned null, `client_id` bigint unsigned not null, `name` varchar(255) null, `scopes` text null, `revoked` tinyint(1) not null, `created_at` timestamp null, `updated_at` timestamp null, `expires_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.73\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000002_create_oauth_access_tokens_table.php\",\"line\":25,\"hash\":\"11a61dc0471894d6334ebc5cebdfc955\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(14,'94c48973-75ca-4d7c-9adb-3902ce00de5f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_access_tokens` add primary key `oauth_access_tokens_id_primary`(`id`)\",\"time\":\"9.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000002_create_oauth_access_tokens_table.php\",\"line\":25,\"hash\":\"6b7c78e2920404ce91d36f8d8c8307ba\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(15,'94c48973-7816-4e68-a553-aa4c6de2ee62','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_access_tokens` add index `oauth_access_tokens_user_id_index`(`user_id`)\",\"time\":\"5.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000002_create_oauth_access_tokens_table.php\",\"line\":25,\"hash\":\"c1b15baef8790b12f521213dbe280686\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(16,'94c48973-7881-4f9b-b726-135ffc8f49fd','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000002_create_oauth_access_tokens_table\', 1)\",\"time\":\"0.68\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(17,'94c48973-7b04-4309-9f88-1cdf86df47fb','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_refresh_tokens` (`id` varchar(100) not null, `access_token_id` varchar(100) not null, `revoked` tinyint(1) not null, `expires_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.91\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000003_create_oauth_refresh_tokens_table.php\",\"line\":21,\"hash\":\"ac33fb223db31a26b02fb622cf82ca04\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(18,'94c48973-7e82-4c77-adc2-e58aa6137be5','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_refresh_tokens` add primary key `oauth_refresh_tokens_id_primary`(`id`)\",\"time\":\"8.66\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000003_create_oauth_refresh_tokens_table.php\",\"line\":21,\"hash\":\"ee33f1fe3e4cecba8aef8bd5cad6b706\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(19,'94c48973-7edf-4c65-93f0-24d564fd91d1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000003_create_oauth_refresh_tokens_table\', 1)\",\"time\":\"0.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(20,'94c48973-822e-493e-bb49-d4c8100c8641','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_clients` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned null, `name` varchar(255) not null, `secret` varchar(100) null, `redirect` text not null, `personal_access_client` tinyint(1) not null, `password_client` tinyint(1) not null, `revoked` tinyint(1) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000004_create_oauth_clients_table.php\",\"line\":26,\"hash\":\"2328aa1f9a51968626aa410715b21d56\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(21,'94c48973-84fd-4e0a-9511-b645b621d750','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `oauth_clients` add index `oauth_clients_user_id_index`(`user_id`)\",\"time\":\"6.91\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000004_create_oauth_clients_table.php\",\"line\":26,\"hash\":\"d80805c01983b9f1402e5c83cc8fca13\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(22,'94c48973-8558-4cd2-b56d-cbb9a9bd6031','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000004_create_oauth_clients_table\', 1)\",\"time\":\"0.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(23,'94c48973-87a0-483a-9d93-85927c243ef4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `oauth_personal_access_clients` (`id` bigint unsigned not null auto_increment primary key, `client_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.39\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2016_06_01_000005_create_oauth_personal_access_clients_table.php\",\"line\":20,\"hash\":\"e0d623a5cea9359b37b49a3525a26391\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(24,'94c48973-87fa-4452-8218-746905435f8a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2016_06_01_000005_create_oauth_personal_access_clients_table\', 1)\",\"time\":\"0.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(25,'94c48973-8aac-4ba8-8e6d-7e3483aafa25','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans` (`id` int unsigned not null auto_increment primary key, `name` varchar(255) not null, `description` text null, `price` double(8, 2) not null, `currency` varchar(255) not null, `duration` int not null default \'30\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.40\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":28,\"hash\":\"cdd1825f25520e8fedf2a80c33877991\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(26,'94c48973-8ce6-4edb-bc6c-824dc30d0564','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans_features` (`id` int unsigned not null auto_increment primary key, `plan_id` int not null, `name` varchar(255) not null, `code` varchar(255) not null, `description` text null, `type` enum(\'feature\', \'limit\') not null default \'feature\', `limit` int not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.20\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":42,\"hash\":\"f0808c7eef0d38ddcf25a7aea3e9228a\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(27,'94c48973-9061-41ed-9202-bfefc48ec613','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans_subscriptions` (`id` int unsigned not null auto_increment primary key, `plan_id` int not null, `model_id` int not null, `model_type` varchar(255) not null, `payment_method` enum(\'stripe\') null, `is_paid` tinyint(1) not null default \'0\', `charging_price` double(8, 2) null, `charging_currency` varchar(255) null, `is_recurring` tinyint(1) not null default \'1\', `recurring_each_days` int not null default \'30\', `starts_on` timestamp null, `expires_on` timestamp null, `cancelled_on` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":65,\"hash\":\"290179127b7d31b280e2d1dace7a5363\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(28,'94c48973-938c-4b6a-95e6-204bfc5cf455','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `plans_usages` (`id` int unsigned not null auto_increment primary key, `subscription_id` int not null, `code` varchar(255) not null, `used` double(9, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":75,\"hash\":\"106f0457966bb0ddcf7a0d2506def3ab\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(29,'94c48973-97bb-47ad-8e90-a1202ef89f2c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `stripe_customers` (`id` int unsigned not null auto_increment primary key, `model_id` int not null, `model_type` varchar(255) not null, `customer_id` varchar(255) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"10.01\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2018_06_07_123211_plans.php\",\"line\":86,\"hash\":\"6af061847f2c1aea31fd3aeed5bd43b8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(30,'94c48973-984a-4fb6-8a9e-0c30ce3a0f8c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_06_07_123211_plans\', 1)\",\"time\":\"0.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(31,'94c48973-9c44-473f-a732-846b4c6b0dc8','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `appointments` (`id` int unsigned not null auto_increment primary key, `appointee_id` int not null, `appointee_type` varchar(255) not null, `appointer_id` int null, `appointer_type` varchar(255) null, `meta` json null, `amount` decimal(9, 2) not null default \'0\', `amount_meta` json null, `address` varchar(255) null, `address_meta` json null, `longitude` decimal(15, 7) not null default \'0\', `latitude` decimal(15, 7) not null default \'0\', `date` date not null, `time_from` time not null, `time_to` time not null, `is_guest` tinyint(1) not null default \'0\', `customer_name` varchar(255) null, `customer_email` varchar(255) null, `customer_mobile` varchar(255) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"9.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"1681812c61453e70f94f61bc60e4b661\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(32,'94c48973-9cad-4051-bc57-5f6143a6de83','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_create_table_appointments\', 1)\",\"time\":\"0.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(33,'94c48973-9fc1-4614-a01d-5a2dac7bd62d','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `payment_methods` (`id` int unsigned not null auto_increment primary key, `slug` varchar(255) not null, `title` json not null, `enabled` tinyint(1) not null default \'1\', `type` enum(\'prepaid\', \'postpaid\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.17\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"47f883af01b4ca99a3f0e4ffc25b58c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(34,'94c48973-a247-4be2-ba3f-fac20ad121d1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `payment_methods` add unique `payment_methods_slug_unique`(`slug`)\",\"time\":\"6.14\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"683e74b74429c21834d0db32d95d5750\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(35,'94c48973-a2a5-4cb6-b025-2d713144e8df','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_payment_methods\', 1)\",\"time\":\"0.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(36,'94c48973-a57c-475f-a76f-440f8a3a8a92','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `payments` (`id` int unsigned not null auto_increment primary key, `payable_id` int not null, `payable_type` varchar(255) not null, `payer_id` int null, `payer_type` varchar(255) null, `amount` decimal(9, 2) not null, `payment_method_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"887d2e898f89dad62ea68e81b7fd60c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(37,'94c48973-ace7-48e5-8b5a-bde2c6822c2a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `payments` add constraint `payments_payment_method_id_foreign` foreign key (`payment_method_id`) references `payment_methods` (`id`) on delete set null\",\"time\":\"18.63\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"ea4a6e83722f4ba5ef63b8dacf07eb9c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(38,'94c48973-ad4c-4742-996c-8e7e4d073b3f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_payments\', 1)\",\"time\":\"0.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(39,'94c48973-b086-4a97-b353-39479dcd6c43','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `ratings` (`id` int unsigned not null auto_increment primary key, `review` text not null, `rateable_id` int not null, `rateable_type` varchar(255) not null, `rater_id` int null, `rater_type` varchar(255) null, `rating` double(9, 2) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.70\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2018_07_14_183253_ratings.php\",\"line\":30,\"hash\":\"b7e52acff30cd3a96f1c6b2901f75431\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(40,'94c48973-b0da-44fd-af74-a67e14d80b5c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183253_ratings\', 1)\",\"time\":\"0.50\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(41,'94c48973-b44f-45bc-8297-88d16c2a7081','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `payment_methods` add `meta` json null\",\"time\":\"8.35\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"99c85767e528efd6949c2418a12fcc6b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(42,'94c48973-b4af-40da-be88-f2d5ce74f13d','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_07_14_183254_alter_payment_methods\', 1)\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(43,'94c48973-b77b-4b40-9fb2-c91dc1023a45','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(255) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"d9429550f8856c1af1c89f24a6440cb5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(44,'94c48973-ba2f-4097-b291-919b6d3ad445','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"6.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(45,'94c48973-bc96-4eba-af42-424f60099100','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"5.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(46,'94c48973-bfad-4b65-9687-f7101b941f18','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"7.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(47,'94c48973-c1f9-4599-8d47-331402176bf1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"5.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(48,'94c48973-c4db-498d-9c2e-72c6af3465ff','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"7.10\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(49,'94c48973-c716-469e-93ee-7b8fa50c686a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"5ed47d3cfcd3051674e3cb7b613f0fba\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(50,'94c48973-c920-4f3d-a84c-3f9f9033936b','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"4.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"d77cdf5585b51f60954d40e76786e20f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(51,'94c48973-cb3a-493c-b4eb-791eb8c74342','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"5.10\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(52,'94c48973-d2a9-4404-9a0f-8ea66bc2b742','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"18.73\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(53,'94c48973-d4af-496f-bc6a-6df561a1d7b4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.79\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"8cddf327ba1b3bd52637b409200a4c1f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(54,'94c48973-d505-4a89-b1cb-a89990943491','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(55,'94c48973-d6eb-4cba-ba4b-7c4af6e0843a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `likes` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null comment \'user_id\', `likeable_type` varchar(255) not null, `likeable_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"8d78628cb0f7693a7b2b71b79ef07cd4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(56,'94c48973-d920-4fea-a2b7-2b3f91dff451','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `likes` add index `likes_likeable_type_likeable_id_index`(`likeable_type`, `likeable_id`)\",\"time\":\"5.38\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"328443a41d311ae3484041ff982dd46f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(57,'94c48973-daf8-4a3c-80db-fef4cb987ad3','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `likes` add index `likes_user_id_index`(`user_id`)\",\"time\":\"4.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"abe28084c4952e7d9a5aebf215ed8307\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(58,'94c48973-db51-4082-80ed-4108a886a85f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_12_14_000000_create_likes_table\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(59,'94c48973-df60-4e3b-b42d-ba4913a73acb','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `plans` add `metadata` mediumtext null after `duration`\",\"time\":\"9.97\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2019_06_07_123211_plans_metadata.php\",\"line\":18,\"hash\":\"6d85f09f6ccb2e515282e827533da796\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(60,'94c48973-e59b-4007-9c4c-848683358484','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `plans_features` add `metadata` mediumtext null after `limit`\",\"time\":\"15.58\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2019_06_07_123211_plans_metadata.php\",\"line\":22,\"hash\":\"ebe5bfed4e2826b2bcdbe7c4c0953a58\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(61,'94c48973-e605-42ee-a198-a1047364e844','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_06_07_123211_plans_metadata\', 1)\",\"time\":\"0.70\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(62,'94c48973-e8da-4894-aa8c-2f004d7e5136','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `failed_jobs` (`id` bigint unsigned not null auto_increment primary key, `connection` text not null, `queue` text not null, `payload` longtext not null, `exception` longtext not null, `failed_at` timestamp default CURRENT_TIMESTAMP not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2019_08_19_000000_create_failed_jobs_table.php\",\"line\":23,\"hash\":\"fae1ec3edafa895343ae718d06e992c7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(63,'94c48973-e93b-42cb-b591-110c8d1cc148','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_08_19_000000_create_failed_jobs_table\', 1)\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(64,'94c48973-eb84-4ec6-b6f6-2cf06a6dc553','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `user_follower` (`id` int unsigned not null auto_increment primary key, `following_id` bigint unsigned not null, `follower_id` bigint unsigned not null, `accepted_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"9079a00a5ecf955e531e75dd4c0a4ff8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(65,'94c48973-edd7-4a0e-8c19-cba70f338884','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_follower` add index `user_follower_following_id_index`(`following_id`)\",\"time\":\"5.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"ecfe502d2f5796fcede2410d93199838\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(66,'94c48973-efca-416c-b147-a88b7a1bb6ff','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_follower` add index `user_follower_follower_id_index`(`follower_id`)\",\"time\":\"4.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"44117eede74b2d4792654ec9a1a4837e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(67,'94c48973-f217-42a8-8dfa-8c88df2524ed','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_follower` add index `user_follower_accepted_at_index`(`accepted_at`)\",\"time\":\"5.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_04_04_000000_create_user_follower_table.php\",\"line\":29,\"hash\":\"17ad061ab277ccdc9a7e9e9d25f3e0c8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(68,'94c48973-f26b-46d2-9f5f-2ebf39b537c7','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_04_04_000000_create_user_follower_table\', 1)\",\"time\":\"0.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(69,'94c48973-f5da-476a-a159-fea36af9736e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media_libraries` (`id` bigint unsigned not null auto_increment primary key, `model_type` varchar(255) not null, `model_id` bigint unsigned not null, `collection_name` varchar(255) not null, `name` varchar(255) not null, `file_name` varchar(255) not null, `mime_type` varchar(255) null, `disk` varchar(255) not null, `size` bigint unsigned not null, `manipulations` json not null, `custom_properties` json not null, `responsive_images` json not null, `order_column` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.13\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_medialibrary_table.php\",\"line\":28,\"hash\":\"0032d61f2f1083074c4f8724387334e6\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(70,'94c48973-f8c5-4adf-9e5b-be8160b9d85e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_libraries` add index `media_libraries_model_type_model_id_index`(`model_type`, `model_id`)\",\"time\":\"7.19\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_medialibrary_table.php\",\"line\":28,\"hash\":\"9699f32395d4e0a515b8e49484fb7540\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(71,'94c48973-f925-441b-ba75-72e7b524672c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_06_30_140057_create_medialibrary_table\', 1)\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(72,'94c48973-fb8e-424e-a26c-27ae6cbcb1ba','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `permissions` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(255) not null, `guard_name` varchar(255) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.68\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":28,\"hash\":\"eb63c3583de582a709a51b49c078ca03\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(73,'94c48973-fde2-42c3-8649-b7e36fa45031','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `roles` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(255) not null, `guard_name` varchar(255) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":35,\"hash\":\"c8fbd6ab203ec575e47ce2d7e4f07910\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(74,'94c48974-002c-4cbb-9147-f77722b7962d','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `model_has_permissions` (`permission_id` bigint unsigned not null, `model_type` varchar(255) not null, `model_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.44\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":51,\"hash\":\"cd4bb19870bbad5f42d0365e2de3bc04\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(75,'94c48974-0241-4f50-9de3-70bd2211886a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add index `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`)\",\"time\":\"5.11\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":51,\"hash\":\"799c3262f33663c6bf50078fe1c8ce02\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(76,'94c48974-083a-4bea-af95-f350c2d1a580','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add constraint `model_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade\",\"time\":\"15.03\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":51,\"hash\":\"2c922be382fed48d8023537e84ccdd66\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(77,'94c48974-0d42-4246-91fb-5958e428fcbc','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add primary key `model_has_permissions_permission_model_type_primary`(`permission_id`, `model_id`, `model_type`)\",\"time\":\"12.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":51,\"hash\":\"49037d8660ba17245bd921fd2a2cc676\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(78,'94c48974-0f86-4ba3-81e7-7e03719ac694','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `model_has_roles` (`role_id` bigint unsigned not null, `model_type` varchar(255) not null, `model_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.31\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":67,\"hash\":\"c9a120d767a3b3e6bf85a2674f748477\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(79,'94c48974-11a6-4b1e-9713-8d39fe2f30fb','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add index `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`)\",\"time\":\"5.19\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":67,\"hash\":\"b5fc483eb06997eadd0a189cdb6820fd\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(80,'94c48974-16f5-403e-865c-58df36f9365e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add constraint `model_has_roles_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade\",\"time\":\"13.32\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":67,\"hash\":\"13a9f5419fe9cfd65c84f44a9af8aebe\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(81,'94c48974-1be7-402d-9f9e-f1f726ace807','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add primary key `model_has_roles_role_model_type_primary`(`role_id`, `model_id`, `model_type`)\",\"time\":\"12.39\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":67,\"hash\":\"1f469fb7744bab9d57e2a117ea8e85e9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(82,'94c48974-1e44-4580-8bd8-c6e45d5aabe4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `role_has_permissions` (`permission_id` bigint unsigned not null, `role_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.60\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":84,\"hash\":\"6d68419d82530d4983920098d7b350e2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(83,'94c48974-23c3-4d7d-a70f-efd474de3e01','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add constraint `role_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade\",\"time\":\"13.81\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":84,\"hash\":\"09327a2ff7df4421191b9fdf2a1cce9e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(84,'94c48974-2853-42c4-8914-969a9841c1a2','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add constraint `role_has_permissions_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade\",\"time\":\"11.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":84,\"hash\":\"4ad12bf8366b7b214265d1ff60544e17\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(85,'94c48974-2c26-4900-8d5d-154c08ca570e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add primary key `role_has_permissions_permission_id_role_id_primary`(`permission_id`, `role_id`)\",\"time\":\"9.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_06_30_140057_create_permission_tables.php\",\"line\":84,\"hash\":\"81edd4146b829a569e123fa43e8c9f01\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(86,'94c48974-2c84-43ee-9c67-489e62193e86','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_06_30_140057_create_permission_tables\', 1)\",\"time\":\"0.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(87,'94c48974-2e94-4ca8-bfa9-dfafd217a4f4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `favorites` (`user_id` int unsigned not null, `favoriteable_type` varchar(255) not null, `favoriteable_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.81\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_07_01_164434_create_favorites_table.php\",\"line\":22,\"hash\":\"4e5b700d4f4a5e4b9283b4a18ca13b5f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(88,'94c48974-3445-47cd-9c5f-d0007ea62fd1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favorites` add index `favorites_favoriteable_type_favoriteable_id_index`(`favoriteable_type`, `favoriteable_id`)\",\"time\":\"14.31\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_07_01_164434_create_favorites_table.php\",\"line\":22,\"hash\":\"44db824ac82c2875e9eabec08509828c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(89,'94c48974-3904-462d-ad3a-b0317a2e89d9','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favorites` add primary key `favorites_user_id_favoriteable_id_favoriteable_type_primary`(`user_id`, `favoriteable_id`, `favoriteable_type`)\",\"time\":\"11.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_07_01_164434_create_favorites_table.php\",\"line\":22,\"hash\":\"3d0702e4e3e85b42840a6189be0e90a8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(90,'94c48974-3b11-4e81-96a3-edecd6c4fed9','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favorites` add index `favorites_user_id_index`(`user_id`)\",\"time\":\"4.93\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2020_07_01_164434_create_favorites_table.php\",\"line\":22,\"hash\":\"7d9933a185b1e8004be01cab3cafb4bf\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(91,'94c48974-3b7f-4bd5-883f-12a3c2b60d98','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_01_164434_create_favorites_table\', 1)\",\"time\":\"0.69\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(92,'94c48974-3ee6-4c4c-8dd8-2fd956e69b58','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `banners` (`id` int unsigned not null auto_increment primary key, `title` json not null, `meta` json null, `sort_order` int not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.06\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"b14cbd781a39c03372a7a35c01c48608\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(93,'94c48974-3f48-4c95-a065-a5cd971b4554','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_banners_table\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(94,'94c48974-4278-4dd3-964f-4c5350745e1f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `blocks` (`id` int unsigned not null auto_increment primary key, `blockable_type` varchar(255) not null, `blockable_id` bigint unsigned not null, `blocker_type` varchar(255) not null, `blocker_id` bigint unsigned not null, `reason` text null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"3c27b23d02130d5a136e130a5da36266\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(95,'94c48974-454d-4549-8cef-4533f1090543','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `blocks` add index `blocks_blockable_type_blockable_id_index`(`blockable_type`, `blockable_id`)\",\"time\":\"6.87\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"63e81d01647829cafd30ce785fdab9eb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:25'),(96,'94c48974-48e8-4793-b9de-2808c321d374','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `blocks` add index `blocks_blocker_type_blocker_id_index`(`blocker_type`, `blocker_id`)\",\"time\":\"8.84\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"052c7935d57bf1ad95cbf62d68aa2d9f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(97,'94c48974-495e-454e-8f95-550c04068e85','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_blocks_table\', 1)\",\"time\":\"0.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(98,'94c48974-4bd6-4cfb-91eb-13c638cfd6d3','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `faqs` (`id` int unsigned not null auto_increment primary key, `title` varchar(255) not null, `short_description` varchar(255) not null, `description` varchar(255) not null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.65\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"40819c033d53df04280dd60adfb2e995\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(99,'94c48974-4c35-4413-8f8b-81a5501f48f1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_faqs_table\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(100,'94c48974-4ece-499a-a6e4-6abe185fc9ad','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `reports` (`id` int unsigned not null auto_increment primary key, `reportable_type` varchar(255) not null, `reportable_id` bigint unsigned not null, `reporter_type` varchar(255) not null, `reporter_id` bigint unsigned not null, `reason` text null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.96\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"882a40eb8a2f1bb44000b09932ee42b1\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(101,'94c48974-512e-46e4-b3fa-7b9b964cd6be','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `reports` add index `reports_reportable_type_reportable_id_index`(`reportable_type`, `reportable_id`)\",\"time\":\"5.73\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"7a4ad10bc4e387222fb9020948aaa2ea\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(102,'94c48974-537e-45ef-9d67-3f526f3e1fe8','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `reports` add index `reports_reporter_type_reporter_id_index`(`reporter_type`, `reporter_id`)\",\"time\":\"5.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"df0b30031d935bf0659d96c57f4f3014\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(103,'94c48974-53e2-4646-8d5b-bdd2c975c846','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_reports_table\', 1)\",\"time\":\"0.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(104,'94c48974-56e9-4f25-a8fa-9255debe46e4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `supports` (`id` int unsigned not null auto_increment primary key, `name` varchar(255) not null, `email` varchar(255) not null, `message` text not null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.10\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"33c81fb2c65fb1bf993dfab093572bb4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(105,'94c48974-5758-4ce8-a8cb-f4bb4d15ddad','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2020_07_09_150356_create_supports_table\', 1)\",\"time\":\"0.73\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(106,'94c48974-5a1b-4084-9f36-1541e9751e37','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `comments` (`id` int unsigned not null auto_increment primary key, `commentable_type` varchar(255) not null, `commentable_id` bigint unsigned not null, `comment` text not null, `is_approved` tinyint(1) not null default \'0\', `user_id` bigint unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2021_01_29_133042_create_comments_table.php\",\"line\":21,\"hash\":\"4bcfdb4702b0755051a50ea0540c9e83\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(107,'94c48974-5cf1-4e46-991b-ce50848fe16b','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `comments` add index `comments_commentable_type_commentable_id_index`(`commentable_type`, `commentable_id`)\",\"time\":\"6.96\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2021_01_29_133042_create_comments_table.php\",\"line\":21,\"hash\":\"ba12a0d73c89f81fc7777318cf146485\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(108,'94c48974-5d59-49fa-afac-f5d9652e7a6f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_01_29_133042_create_comments_table\', 1)\",\"time\":\"0.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(109,'94c48974-60e6-4885-84e6-75c763f3aca5','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `jobs` (`id` bigint unsigned not null auto_increment primary key, `queue` varchar(255) not null, `payload` longtext not null, `attempts` tinyint unsigned not null, `reserved_at` int unsigned null, `available_at` int unsigned not null, `created_at` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"8.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2021_04_12_232102_create_jobs_table.php\",\"line\":24,\"hash\":\"87d7e48163c279f619932f5e34922b35\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(110,'94c48974-63c5-4061-90bb-205c60b68a31','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `jobs` add index `jobs_queue_index`(`queue`)\",\"time\":\"7.09\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2021_04_12_232102_create_jobs_table.php\",\"line\":24,\"hash\":\"0cfaf07533bec3024be637314b74804b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(111,'94c48974-6424-4c42-a3b6-509cafed29bf','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_04_12_232102_create_jobs_table\', 1)\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(112,'94c48974-6733-49e8-8b4a-02c13fc4920f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` int unsigned not null auto_increment primary key, `name` varchar(255) not null, `email` varchar(255) not null, `username` varchar(255) null, `password` varchar(255) not null, `mobile_number` varchar(255) not null, `mobile_verified` tinyint(1) not null default \'0\', `is_verified` tinyint(1) not null default \'0\', `active` tinyint unsigned not null default \'1\', `language` varchar(255) not null default \'en\', `notification` json null, `meta` json null, `remember_token` varchar(100) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.10\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"5bc43c58cfa4fb4e9d173bc7e54ee0fe\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(113,'94c48974-6a33-4e52-a898-6d7913bfdf31','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_email_unique`(`email`)\",\"time\":\"7.34\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"0648806a3d18c0f5b81e2257de64675e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(114,'94c48974-6d10-49f2-bc01-ca9a6b9806dc','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_username_unique`(`username`)\",\"time\":\"7.00\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"d9d8675342e514e22d4b25a58193a2f1\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(115,'94c48974-6f77-44b4-b0f8-c05e8f09dc05','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_mobile_number_unique`(`mobile_number`)\",\"time\":\"5.84\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"ede267dad99cb97da27e7cf8f9d98449\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(116,'94c48974-6fce-4e7c-a9e6-acaf132f634b','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000005_create_users_table\', 1)\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(117,'94c48974-71d8-4907-a5f7-3cba7a51563b','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `password_resets` (`email` varchar(255) not null, `token` varchar(255) not null, `created_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"6a64d07661eabf9849c9a4281ec344ad\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(118,'94c48974-7396-4d10-b390-91494e1db687','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `password_resets` add index `password_resets_email_index`(`email`)\",\"time\":\"4.22\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"e47bfd004ad9142afc1b2460960fbe08\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(119,'94c48974-73ea-41e0-a4e8-aa83e5026971','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000010_create_password_resets_table\', 1)\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(120,'94c48974-75b9-4965-ba21-73f3c5f54a64','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `settings` (`id` int unsigned not null auto_increment primary key, `key` varchar(255) not null, `value` text not null, `type` enum(\'string\', \'text\', \'json\', \'numeric\', \'boolean\') not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.16\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"155d442612b0ed80947c16fb0a48743e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(121,'94c48974-7763-42e9-a108-584b048c463c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `settings` add unique `settings_key_unique`(`key`)\",\"time\":\"4.01\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"341c887377abf0b07bc393a8c80d128b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(122,'94c48974-77a8-4a31-a5eb-379f97ad8606','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000015_create_settings_table\', 1)\",\"time\":\"0.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(123,'94c48974-79cc-46f0-a4da-65a37c2d5203','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `activity_logs` (`id` int unsigned not null auto_increment primary key, `device_id` varchar(255) null, `device_type` varchar(255) not null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.03\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"e0ae8cd87e0b9848c1abf653a3a6507b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(124,'94c48974-7feb-4c66-bc16-b1a17118b1d8','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `activity_logs` add constraint `activity_logs_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"15.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"b7479993ef8c45e5d19047f88776c925\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(125,'94c48974-8064-4fdd-ac4b-77295d13b27e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000020_create_activity_logs_table\', 1)\",\"time\":\"0.83\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(126,'94c48974-82d4-4b8a-a158-94eb043f5400','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notifications` (`id` int unsigned not null auto_increment primary key, `text` text null, `meta` json null, `type` varchar(255) null, `user_id` int unsigned null, `from_user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.72\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"1c099238429a4e7cf30d7e6c05fb3885\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(127,'94c48974-878c-43a6-899b-8c8a809c365c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notifications` add constraint `notifications_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"11.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"9f4b08e0dd33de422fc8d11ceaba636e\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(128,'94c48974-8d20-465d-8d9a-20b59486ad20','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notifications` add constraint `notifications_from_user_id_foreign` foreign key (`from_user_id`) references `users` (`id`) on delete cascade\",\"time\":\"14.01\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"4dcf5127e54835653b873d8ccfaff4f2\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(129,'94c48974-8d6f-4d97-b7cc-133b18c5236a','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2050_01_01_000025_create_notifications_table\', 1)\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(130,'94c48974-8f7d-4cf9-9cb4-79e16374e6c4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `authors` (`id` int unsigned not null auto_increment primary key, `title` json not null, `short_description` json null, `description` json null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"37c0400a14eee59fb06ec10d48fe8bb8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(131,'94c48974-8fbe-4f4e-a096-129f0e1313a2','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000010_create_authors_table\', 1)\",\"time\":\"0.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(132,'94c48974-922d-4f86-ad82-e6adace0b511','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `seasons` (`id` int unsigned not null auto_increment primary key, `title` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.82\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"38d04ea535898235b5b4c83eb55ebd08\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(133,'94c48974-93f8-4ae4-9a0e-1297b5982be7','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `seasons` add unique `seasons_title_unique`(`title`)\",\"time\":\"4.33\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"a5d5876372b0205e9c80089c32191e06\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(134,'94c48974-9461-416f-9096-53fbf3d265a1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000010_create_seasons_table\', 1)\",\"time\":\"0.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(135,'94c48974-96db-41dd-b61b-348ad0380010','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `categories` (`id` int unsigned not null auto_increment primary key, `slug` varchar(255) not null, `title` json not null, `meta` json null, `sort_order` int not null default \'1\', `parent_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"dc90efba68867f4de2f4f6b5c3ccae0d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(136,'94c48974-9c53-43bc-a579-1f42570263bd','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `categories` add constraint `categories_parent_id_foreign` foreign key (`parent_id`) references `categories` (`id`) on delete cascade\",\"time\":\"13.75\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"4ccd04b5322d6536aa53f3c1d80ed757\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(137,'94c48974-9c9c-41c8-b9c2-9e9f6a37ac19','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000020_create_categories_table\', 1)\",\"time\":\"0.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(138,'94c48974-9f7b-4270-afc7-927fd62b4152','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media` (`id` int unsigned not null auto_increment primary key, `title` json null, `description` json null, `short_description` json null, `meta` json null, `views_count` int not null default \'0\', `shares_count` int not null default \'0\', `length` varchar(255) null, `language` varchar(255) null, `artists` varchar(255) null, `release_date` date null, `maturity_rating` varchar(255) null, `status` enum(\'published\', \'unpublished\', \'draft\') not null, `category_id` int unsigned null, `user_id` int unsigned null, `parent_media_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.71\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"40aba959777e30da0320859e33c072e1\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(139,'94c48974-a4d5-428b-bb08-68ba31d3aba4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media` add constraint `media_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"13.44\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"16d188617ef843081508b030113a7f04\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(140,'94c48974-ac16-4060-9c44-de3e761b28d7','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media` add constraint `media_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"18.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"6d8e9ccf732529a31c83d264e6fa8281\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(141,'94c48974-b32f-4ca8-84a3-b980c39e1fb4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media` add constraint `media_parent_media_id_foreign` foreign key (`parent_media_id`) references `media` (`id`) on delete cascade\",\"time\":\"17.90\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"978764427a2cf2ca3d187c214610e5d5\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(142,'94c48974-b4fc-41f5-a38a-7271528d76f9','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media_categories` (`media_id` int unsigned not null, `category_id` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.24\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"4a41d14ae0f23eeed7aa438ec649e2d0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(143,'94c48974-b9ab-4e0a-94b0-1bf1e224b0d1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_categories` add constraint `media_categories_media_id_foreign` foreign key (`media_id`) references `media` (`id`) on delete cascade\",\"time\":\"11.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"fe2107f4db962b953bd404cd165191ad\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(144,'94c48974-bfb8-46c1-a95f-6d4bf62f2cfb','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_categories` add constraint `media_categories_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"15.20\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"0dcc810e6e5f30e8767959c91e466a4b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(145,'94c48974-c18c-46e6-b62d-3f0418b357ff','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media_content` (`id` int unsigned not null auto_increment primary key, `meta` json null, `original_source` varchar(500) not null, `source` json not null, `type` enum(\'clip\', \'main\') not null default \'main\', `media_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"4250c9200b06b09899bd4901c93621df\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(146,'94c48974-c67c-4f02-806d-6c715fbb4fcc','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_content` add constraint `media_content_media_id_foreign` foreign key (`media_id`) references `media` (`id`) on delete cascade\",\"time\":\"12.40\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"5cb57278c90f4c992e3591fbca57a710\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(147,'94c48974-c940-479f-81a5-8d4b8554860e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media_episodes` (`id` int unsigned not null auto_increment primary key, `season_number` int not null, `episode_number` int not null, `meta` json null, `media_id` int unsigned not null, `parent_media_id` int unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"b355dff357eb056a5aaaa4fa764b040d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(148,'94c48974-cef6-4db5-a6f7-3707d905b493','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_episodes` add constraint `media_episodes_media_id_foreign` foreign key (`media_id`) references `media` (`id`) on delete cascade\",\"time\":\"14.35\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"a27f9b990fd37168b48feb48a2bb513f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(149,'94c48974-d604-492f-8476-7cc9d0e2c71f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_episodes` add constraint `media_episodes_parent_media_id_foreign` foreign key (`parent_media_id`) references `media` (`id`) on delete cascade\",\"time\":\"17.77\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"2b5dc7b0576ba7f4db481d0a0877ded6\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(150,'94c48974-d650-411a-b7ab-f224f84a2769','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000020_create_media_table\', 1)\",\"time\":\"0.48\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(151,'94c48974-daf1-4702-a398-e4f21c39a057','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media` add `price` decimal(8, 2) not null default \'0\'\",\"time\":\"11.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"27ee381329d56713fe95827128452239\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(152,'94c48974-db4b-4ba9-a8c5-845697e9b4f7','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000021_alter_media_table_add_price\', 1)\",\"time\":\"0.62\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(153,'94c48974-de53-4376-870e-38b5ab41e2e5','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media_authors` (`id` int unsigned not null auto_increment primary key, `author_id` int unsigned not null, `media_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"7.30\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f6e5ef554a10cce95e77b26c0256f2c4\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(154,'94c48974-e506-44b8-935f-4df1eb2bd0e2','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_authors` add constraint `media_authors_author_id_foreign` foreign key (`author_id`) references `authors` (`id`) on delete cascade\",\"time\":\"16.89\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"5cbf9b03cdeb9c8b0ee1161862864cb9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(155,'94c48974-eaed-42f1-a467-e962ea142bdc','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_authors` add constraint `media_authors_media_id_foreign` foreign key (`media_id`) references `media` (`id`) on delete cascade\",\"time\":\"14.83\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"465e71132eab1aa36121408d17b09faa\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(156,'94c48974-eb36-4944-bae3-cfa84ebf741b','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000040_create_media_authors_table\', 1)\",\"time\":\"0.44\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(157,'94c48974-ed55-453e-aaa5-1777663853f5','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `media_orders` (`id` int unsigned not null auto_increment primary key, `meta` json null, `subtotal` double(8, 2) not null, `taxes` double(8, 2) not null, `total` double(8, 2) not null, `discount` double(8, 2) not null, `media_id` int unsigned null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.92\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"6b8381adccff72c8ba1892e2a23b9c05\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(158,'94c48974-f348-409d-b09c-70d7da0c3e03','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_orders` add constraint `media_orders_media_id_foreign` foreign key (`media_id`) references `media` (`id`) on delete cascade\",\"time\":\"14.96\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"13080c318a8cbe32e72dc769b9de676a\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(159,'94c48974-f9fe-46db-8311-a83f6d093157','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `media_orders` add constraint `media_orders_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"16.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"3eb7f19b61c57296c28ffaecbcc54977\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(160,'94c48974-fa55-40aa-a7de-b5bbf7c718f7','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000040_create_media_orders_table\', 1)\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(161,'94c48974-fc58-453c-a1df-6a8ed05addd5','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `user_author_preferences` (`id` int unsigned not null auto_increment primary key, `author_id` int unsigned null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.70\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"c4afcad3f2002b5c6677359b0158f5ca\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(162,'94c48975-00f7-4e4a-8790-ebf7e062cab2','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_author_preferences` add constraint `user_author_preferences_author_id_foreign` foreign key (`author_id`) references `authors` (`id`) on delete cascade\",\"time\":\"11.61\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"116ab1de105a3dac36492c309f23f822\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(163,'94c48975-06aa-462b-aaaa-b640890168f6','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_author_preferences` add constraint `user_author_preferences_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"14.30\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"c65e3d9149f5d292e15011630a699761\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(164,'94c48975-0708-425f-bf79-3f2c7ff4f7a0','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000050_create_user_author_preferences_table\', 1)\",\"time\":\"0.63\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(165,'94c48975-0943-4e86-8ae0-3bfb104f326c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `category_preferences` (`category_id` int unsigned null, `user_id` int unsigned null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.16\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"70a3667ee6676c92bd5b805d08be7312\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(166,'94c48975-0e2f-4abc-99b0-e81983fdc16d','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `category_preferences` add constraint `category_preferences_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete cascade\",\"time\":\"12.33\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"79a6401245cff7b84aca5745f5dca665\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(167,'94c48975-13a5-425f-893f-b4343af0d337','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `category_preferences` add constraint `category_preferences_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete cascade\",\"time\":\"13.72\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"79629ca78a168c0c3971e40ec8cd4d37\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(168,'94c48975-13f4-4053-a2ab-ea00939f050c','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000200_create_category_preferences_table\', 1)\",\"time\":\"0.49\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(169,'94c48975-1638-4f9a-a9b8-256185fe99dc','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `mobile_languages` (`id` int unsigned not null auto_increment primary key, `language_code` varchar(255) not null, `language_title` varchar(255) not null, `content` json not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.32\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"fc10b782299c294befbc778e52c3bf61\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(170,'94c48975-1682-45cc-a998-a64aa2d80042','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2051_01_01_000200_create_mobile_languages_table\', 1)\",\"time\":\"0.47\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(171,'94c48975-19fc-4b96-bbbf-ce8760a2e39e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `wallets` (`id` int unsigned not null auto_increment primary key, `user_id` int unsigned null, `balance` bigint not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.42\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2055_02_20_113000_create_wallets_table.php\",\"line\":30,\"hash\":\"cff46513f16ee90983764d7f84a9b55c\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(172,'94c48975-2024-4a57-800f-e2b467a0eab1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `wallets` add constraint `wallets_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete set null\",\"time\":\"15.53\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2055_02_20_113000_create_wallets_table.php\",\"line\":30,\"hash\":\"2f9da7e4d06ecd8aaa1642043f062fb7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(173,'94c48975-206f-4c4b-862a-ae500bee38f9','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2055_02_20_113000_create_wallets_table\', 1)\",\"time\":\"0.45\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(174,'94c48975-2325-4c44-bf21-2d172a8a515d','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `wallet_transactions` (`id` int unsigned not null auto_increment primary key, `wallet_id` int unsigned not null, `amount` int not null, `hash` varchar(60) not null, `type` varchar(30) not null, `accepted` tinyint(1) not null, `meta` json null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.46\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2055_02_20_113500_create_wallet_transactions_table.php\",\"line\":29,\"hash\":\"60357801ce99be07bf0fff18a00dcbf8\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(175,'94c48975-29df-4bde-b5c0-3e7c507c33bd','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `wallet_transactions` add constraint `wallet_transactions_wallet_id_foreign` foreign key (`wallet_id`) references `wallets` (`id`) on delete cascade\",\"time\":\"16.93\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/migrations\\/2055_02_20_113500_create_wallet_transactions_table.php\",\"line\":29,\"hash\":\"b0299888ca646c5db65fe7b2b50b5ee9\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(176,'94c48975-2a44-4022-89d3-a4921555f69e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2055_02_20_113500_create_wallet_transactions_table\', 1)\",\"time\":\"0.63\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(177,'94c48975-5585-4202-adff-bff7db576ae1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `users` (`active`, `created_at`, `email`, `mobile_number`, `mobile_verified`, `name`, `password`, `updated_at`) values (1, \'2021-10-31 22:13:26\', \'admin@example.com\', \'8888888888\', 1, \'Admin\', \'y$ckMbhE5ITEOEw4fCHOe.kuPSmrA6xF7GN3oRNvWnOqfzmD6sYKyPm\', \'2021-10-31 22:13:26\'), (1, \'2021-10-31 22:13:26\', \'admin@opuslabs.in\', \'1819121314\', 1, \'Opus Admin\', \'y$t.ajHFHoAiYLNgsj0Twbhurml35chmXM8KhLnuebBABz2K5t3fndW\', \'2021-10-31 22:13:26\')\",\"time\":\"1.86\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":43,\"hash\":\"4ec1cf3ef5779be7be80cd28623d9002\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(178,'94c48975-571a-40d7-9d61-af88a46ef477','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.88\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":46,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(179,'94c48975-57fb-49a9-954f-5483847068c1','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'admin\', \'api\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.78\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":46,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(180,'94c48975-5848-4d0d-ae15-d249a7587ea0','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'customer\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.33\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":47,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(181,'94c48975-58a4-4473-a0f6-14f57a8703f6','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `roles` (`name`, `guard_name`, `updated_at`, `created_at`) values (\'customer\', \'api\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":47,\"hash\":\"2ff04aa60d5cad24fd0a1fad61c9656d\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(182,'94c48975-58e7-43a8-9c43-049c425a4483','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'admin@example.com\' limit 1\",\"time\":\"0.31\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":56,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(183,'94c48975-593b-4c09-8664-dbc492b45560','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.26\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(184,'94c48975-5a34-4888-8049-acfaac490555','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `model_has_roles` where `model_has_roles`.`model_id` = 1 and `model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"0.31\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"71574635b55b4486e52de86ec188b5a7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(185,'94c48975-5a81-4fab-88ce-74855c0dd2ee','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `model_has_roles` (`model_id`, `model_type`, `role_id`) values (1, \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\', 1)\",\"time\":\"0.56\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"b40636c8a9886b7fb107e3eb7dd2c0eb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(186,'94c48975-5acf-4411-812a-42594ae21ea6','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, `model_has_roles`.`model_id` as `pivot_model_id`, `model_has_roles`.`role_id` as `pivot_role_id`, `model_has_roles`.`model_type` as `pivot_model_type` from `roles` inner join `model_has_roles` on `roles`.`id` = `model_has_roles`.`role_id` where `model_has_roles`.`model_id` in (1) and `model_has_roles`.`model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"0.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"30e651e0e2d06e58b62d2416b9bec300\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(187,'94c48975-5b46-4ae5-8480-c04983626327','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `users` where `email` = \'admin@opuslabs.in\' limit 1\",\"time\":\"0.24\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":56,\"hash\":\"747ef04de752900539e8a3a1aee036ac\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(188,'94c48975-5b7c-49c9-9756-baf6b1fa3ffd','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `roles` where `name` = \'admin\' and `guard_name` = \'api\' limit 1\",\"time\":\"0.21\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"de1bc7a62331e87ecc91f3ab3855091f\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(189,'94c48975-5bc1-4094-a7b1-cca3a3541b0e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `model_has_roles` where `model_has_roles`.`model_id` = 2 and `model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"0.28\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"71574635b55b4486e52de86ec188b5a7\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(190,'94c48975-5c09-4e1b-b228-0c1641d7fda4','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `model_has_roles` (`model_id`, `model_type`, `role_id`) values (2, \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\', 1)\",\"time\":\"0.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"b40636c8a9886b7fb107e3eb7dd2c0eb\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(191,'94c48975-5c4d-44f7-9ff1-ee2808e11fdc','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `roles`.*, `model_has_roles`.`model_id` as `pivot_model_id`, `model_has_roles`.`role_id` as `pivot_role_id`, `model_has_roles`.`model_type` as `pivot_model_type` from `roles` inner join `model_has_roles` on `roles`.`id` = `model_has_roles`.`role_id` where `model_has_roles`.`model_id` in (2) and `model_has_roles`.`model_type` = \'Vtlabs\\\\Core\\\\Models\\\\User\\\\User\'\",\"time\":\"0.27\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/UsersTableSeeder.php\",\"line\":62,\"hash\":\"90c0167c230352f7217dd0a9761021b0\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(192,'94c48975-612a-48fd-b3d9-8a9f7342b003','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'ut quo\', \'Magnam voluptas doloremque est facilis tempora.\', \'Eveniet molestiae aliquid sit eos cumque. Est provident ducimus quo voluptates animi.\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"1.76\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":10,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(193,'94c48975-6196-40ce-a3b5-57a2db3abbfa','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'tempora necessitatibus\', \'Sit ad iste similique.\', \'Molestias adipisci dolorum quia culpa labore non at. Aperiam earum dolor voluptas.\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.57\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":10,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(194,'94c48975-61f2-4fdd-afa2-eab87aa565ff','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'consequatur accusantium\', \'Eos enim iure quo in omnis dolor.\', \'Ratione velit at aut. Suscipit voluptatibus in omnis sapiente. Et dolore omnis est.\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.55\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":10,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(195,'94c48975-6254-45b7-881e-dda44cc3c67f','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'non veritatis\', \'Architecto similique consequatur nobis.\', \'Autem consectetur et sint. Et eligendi aut exercitationem enim officia. Eaque aut ad soluta molestiae. Quo rerum quo fugiat corrupti eum alias.\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.59\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":10,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(196,'94c48975-62ae-4ad9-aa24-c03988a5db5b','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `faqs` (`title`, `short_description`, `description`, `updated_at`, `created_at`) values (\'ea similique\', \'Sapiente corrupti eos aut amet.\', \'Aut sunt fugit sint reiciendis voluptatem. Tempore a eos consequuntur error. Accusamus totam culpa voluptate numquam quae aliquam. Accusamus quod at dolor quis earum et.\', \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.51\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/FaqTableSeeder.php\",\"line\":10,\"hash\":\"1155d5a654286fcedefebe1653aa3c98\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(197,'94c48975-6334-49e4-9b04-1ad9d009f89e','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `settings` (`key`, `value`) values (\'currency_code\', \'USD\'), (\'currency_icon\', \'$\'), (\'support_email\', \'admin@example.com\'), (\'support_phone\', \'8181818118\'), (\'privacy_policy\', \'Demo privacy policy\'), (\'about_us\', \'Demo privacy policy\'), (\'terms\', \'Demo Terms and Condition\')\",\"time\":\"0.74\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/database\\/seeds\\/SettingTableSeeder.php\",\"line\":17,\"hash\":\"4688a7af17214d826d2df1dd64ef17f6\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(198,'94c48975-6769-48a5-acb8-998c85871500','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (null, \'Qvid Personal Access Client\', \'6uuYUiJtIyhO1GBnELZkCsUAX1XbqxAYUrJIAxCE\', \'http:\\/\\/localhost\', 1, 0, 0, \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"1.09\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"bc77ccc261b03668020fd7c60ae5eebc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(199,'94c48975-6b7a-4e93-8365-c132679761ae','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_personal_access_clients` (`client_id`, `updated_at`, `created_at`) values (1, \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"9.64\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"ebe2f9b5834a09d9cc954abb8c72b92b\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26'),(200,'94c48975-6c0b-47de-8e55-0e136f582dbd','94c48975-6c50-4bc8-b145-6453f1dcbd98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (null, \'Qvid Password Grant Client\', \'vTiOTduc5787rfenjyrItsMEiL7yIElJTlKfLSyq\', \'http:\\/\\/localhost\', 0, 1, 0, \'2021-10-31 22:13:26\', \'2021-10-31 22:13:26\')\",\"time\":\"0.54\",\"slow\":false,\"file\":\"\\/Applications\\/XAMPP\\/xamppfiles\\/htdocs\\/qvid\\/qvid\\/artisan\",\"line\":37,\"hash\":\"bc77ccc261b03668020fd7c60ae5eebc\",\"hostname\":\"ujjwals-MacBook-Pro.local\"}','2021-10-31 22:13:26');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
INSERT INTO `telescope_entries_tags` VALUES ('94c48973-5bf5-4ad3-b7dc-754f92ffb478','slow');
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_author_preferences`
--

DROP TABLE IF EXISTS `user_author_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_author_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_author_preferences_author_id_foreign` (`author_id`),
  KEY `user_author_preferences_user_id_foreign` (`user_id`),
  CONSTRAINT `user_author_preferences_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_author_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_author_preferences`
--

LOCK TABLES `user_author_preferences` WRITE;
/*!40000 ALTER TABLE `user_author_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_author_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follower`
--

DROP TABLE IF EXISTS `user_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follower` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `following_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_follower_following_id_index` (`following_id`),
  KEY `user_follower_follower_id_index` (`follower_id`),
  KEY `user_follower_accepted_at_index` (`accepted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follower`
--

LOCK TABLES `user_follower` WRITE;
/*!40000 ALTER TABLE `user_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `notification` json DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_number_unique` (`mobile_number`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@example.com',NULL,'$2y$10$ckMbhE5ITEOEw4fCHOe.kuPSmrA6xF7GN3oRNvWnOqfzmD6sYKyPm','8888888888',1,0,1,'en',NULL,NULL,NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26'),(2,'Opus Admin','admin@opuslabs.in',NULL,'$2y$10$t.ajHFHoAiYLNgsj0Twbhurml35chmXM8KhLnuebBABz2K5t3fndW','1819121314',1,0,1,'en',NULL,NULL,NULL,'2021-10-31 16:43:26','2021-10-31 16:43:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `balance` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01  3:44:10
