-- MySQL dump 10.11
--
-- Host: kostner    Database: hhi
-- ------------------------------------------------------
-- Server version	5.1.52

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
-- Current Database: `hhi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hhi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hhi`;

--
-- Table structure for table `core_settings`
--

DROP TABLE IF EXISTS `core_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `core_settings`
--

LOCK TABLES `core_settings` WRITE;
/*!40000 ALTER TABLE `core_settings` DISABLE KEYS */;
INSERT INTO `core_settings` VALUES ('date_format','g:ia -- m/d/y','g:ia -- m/d/y'),('lang_direction','ltr','ltr'),('status_message','This site has been disabled by a super-administrator.','This site has been disabled by a super-administrator.');
/*!40000 ALTER TABLE `core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sites`
--

DROP TABLE IF EXISTS `core_sites`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `core_sites`
--

LOCK TABLES `core_sites` WRITE;
/*!40000 ALTER TABLE `core_sites` DISABLE KEYS */;
INSERT INTO `core_sites` VALUES (1,'Default Site','default','hhi.lab.daxiangroup.com',1,1335229292,0);
/*!40000 ALTER TABLE `core_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `core_users`
--

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` VALUES (1,'ts@daxiangroup.com','aefdfefb0ea8562154a93ca86e7b59f1c767814d','39bb7',1,'',1,'',1335229292,1335229292,'admin',NULL,NULL);
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog`
--

DROP TABLE IF EXISTS `default_blog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '1',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `category_id - normal` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Blog posts.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_blog`
--

LOCK TABLES `default_blog` WRITE;
/*!40000 ALTER TABLE `default_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog_categories`
--

DROP TABLE IF EXISTS `default_blog_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug - unique` (`slug`),
  UNIQUE KEY `title - unique` (`title`),
  KEY `slug - normal` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Blog Categories.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_blog_categories`
--

LOCK TABLES `default_blog_categories` WRITE;
/*!40000 ALTER TABLE `default_blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_ci_sessions`
--

DROP TABLE IF EXISTS `default_ci_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_ci_sessions`
--

LOCK TABLES `default_ci_sessions` WRITE;
/*!40000 ALTER TABLE `default_ci_sessions` DISABLE KEYS */;
INSERT INTO `default_ci_sessions` VALUES ('4b7c859f6736ccd9860104b6878ba302','99.230.242.218','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.163 Safari/535.19',1335253863,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:18:\"ts@daxiangroup.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9155b1f2c9858d27fd54b7a889317b83','207.61.175.9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.163 Safari/535.19',1335314946,''),('cc5fe831a68e1b0551af29f7c7cad93b','65.95.207.13','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1335315304,''),('9f1254fd4bc5bdb60c410613e7cd4dc9','99.230.242.218','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.163 Safari/535.19',1335415639,''),('3f14b3562501e931ae28161e42739f37','65.95.207.13','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1335482763,''),('150f6c39e677a2c7ae2f85dc7c1536f2','99.230.242.218','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.100 Safari/535.19',1335856289,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:18:\"ts@daxiangroup.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3be4af477ba00d8e3f92c82db942c271','207.61.175.9','Mozilla/5.0 (iPhone; CPU iPhone OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B176 Sa',1336082344,''),('22292d6735ca6845472b03891094379c','99.231.161.237','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.165 Safari/535.19',1336112592,''),('b6d5a0335d8b4933690b118d1a0367fc','99.231.161.237','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0',1336112594,''),('a54be4b36c3e534525ebf79f4375d858','70.29.23.173','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1336149477,''),('4d2cc61257845020455bb513e9b7d2d9','70.29.23.173','Apple-PubSub/65.28',1336149478,''),('790dca61e59057dc27ae139fec5dd77c','70.29.23.173','Apple-PubSub/65.28',1336151280,''),('f6989e680da127e7b302bb185f146340','70.29.23.173','Apple-PubSub/65.28',1336153081,''),('0c8b7227427e85d15a228d33032b1131','70.29.23.173','Apple-PubSub/65.28',1336154882,''),('969c7c02d938fd8d7625ec916a72a28f','70.29.23.173','Apple-PubSub/65.28',1336156684,''),('ef455edea1bf38193114a4d865e72ffb','70.29.23.173','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1336158102,''),('78f13b1c7149e9eb337917bdeb4619d6','70.29.23.173','Apple-PubSub/65.28',1336158485,''),('225736275ca0f928d23e22f13ce5993c','70.29.23.173','Apple-PubSub/65.28',1336160287,''),('6dff9b1d5bca5a2cdd770a92bb18ea75','70.29.23.173','Apple-PubSub/65.28',1336162088,''),('45c2ddf38f6422bfaa5b1cf023b837c3','70.29.23.173','Apple-PubSub/65.28',1336163890,''),('a7f89d7f6e06938de1bbcc5e3a5aff39','70.29.23.173','Apple-PubSub/65.28',1336165691,''),('5e2ab8c9e79671cac68fd29e2853a2c5','70.29.23.173','Apple-PubSub/65.28',1336167493,''),('2a667e1f50d177ffd6a44aabca13fcb3','70.29.23.173','Apple-PubSub/65.28',1336169294,''),('c2d2052c4865e05fd34c4398740f490b','70.29.23.173','Apple-PubSub/65.28',1336171096,''),('e042afafcce6604b46d61194123aad36','70.29.23.173','Apple-PubSub/65.28',1336172897,''),('652060888d3ed017c54927a522fbe560','70.29.23.173','Apple-PubSub/65.28',1336174698,''),('e85049ad3c075f589bfe7d7a7f201062','70.29.23.173','Apple-PubSub/65.28',1336176500,''),('494bad1347ef529121be361d369370ad','70.29.23.173','Apple-PubSub/65.28',1336178301,''),('5d2ad054f203d32afd1ccb53323fb547','70.29.23.173','Apple-PubSub/65.28',1336180103,''),('b8b27dfa3a34bfb6102dfc08464fc237','70.29.23.173','Apple-PubSub/65.28',1336181904,''),('8d192f594076eafcdf843bc02548ea4b','70.29.23.173','Apple-PubSub/65.28',1336183705,''),('72d1baf14771307fab40b1c54122ac27','70.29.23.173','Apple-PubSub/65.28',1336185507,''),('c109ef2680c33219b333020ac5eab4c3','70.29.23.173','Apple-PubSub/65.28',1336187309,''),('433c3aef9e093641cf8163e6e25ec3da','70.29.23.173','Apple-PubSub/65.28',1336189110,''),('38deaf77b4523fe63ad9cecb04409ce6','70.29.23.173','Apple-PubSub/65.28',1336190912,''),('e0065c94dad51324d9352d1c93710ee7','70.29.23.173','Apple-PubSub/65.28',1336192713,''),('9c85f8190b504f2139ae064e96cbf169','70.29.23.173','Apple-PubSub/65.28',1336194514,''),('ebe375fda9284a71a4d53e2d89510334','70.29.23.173','Apple-PubSub/65.28',1336196316,''),('05f367c684c1a8488403fe32c4dcb1dd','70.29.23.173','Apple-PubSub/65.28',1336198117,''),('5b4e97408ce13d47d11449ae2dc89d0b','70.29.23.173','Apple-PubSub/65.28',1336199918,''),('81b5720c003badfa0b1bae8538b7fba9','70.29.23.173','Apple-PubSub/65.28',1336201720,''),('f43c46e8e755a487c8c1707c7fb6b978','70.29.23.173','Apple-PubSub/65.28',1336203521,''),('47549643784d2c870d4e9c645b287c57','70.29.23.173','Apple-PubSub/65.28',1336205323,''),('e67e1a32c605a40b42c6c37057773750','70.29.23.173','Apple-PubSub/65.28',1336207124,''),('4b2671e0dbb2ff240795c840be3e4813','70.29.23.173','Apple-PubSub/65.28',1336208926,''),('db47bc809e44da7428da846103009ca4','70.29.23.173','Apple-PubSub/65.28',1336210727,''),('c2bf6e124ceca44157b487074a9bdf41','70.29.23.173','Apple-PubSub/65.28',1336212528,''),('c3b78b2ac7ac19f8a4d388b6ed5ca235','70.29.23.173','Apple-PubSub/65.28',1336214330,''),('1ccbfc91f95363315331e504768ecc8c','70.29.23.173','Apple-PubSub/65.28',1336216131,''),('e5a2823ba53035c92e0ad9b1aa7f5053','70.29.23.173','Apple-PubSub/65.28',1336217933,''),('83ecc993efa97bad0f795c52a5822996','70.29.23.173','Apple-PubSub/65.28',1336219734,''),('dfea595a1332ff4b7e4d0d3a78bed082','70.29.23.173','Apple-PubSub/65.28',1336221535,''),('e366cdd0a6273d37aef68f40b8056b5d','70.29.23.173','Apple-PubSub/65.28',1336223337,''),('8de8cafa9a65facf0581d4c247886c44','70.29.23.173','Apple-PubSub/65.28',1336225138,''),('78cdc83e195bc190069ca9cdd277963f','70.29.23.173','Apple-PubSub/65.28',1336226940,''),('10169591e52c065d0c918e8173576cf0','70.29.23.173','Apple-PubSub/65.28',1336228741,''),('59305f1be8af83a786825dd3921ca88e','70.29.23.173','Apple-PubSub/65.28',1336230542,''),('9812c50ab71c1818f25c56a86a261df3','70.29.23.173','Apple-PubSub/65.28',1336232344,''),('5c5f88d03378d70dc238d1e8a82ec1b7','70.29.23.173','Apple-PubSub/65.28',1336234145,''),('aa7fc94ecd445026539a44b988f6dc71','70.29.23.173','Apple-PubSub/65.28',1336235947,''),('6b9db4ca3acca3567db7e625117ab4d7','70.29.23.173','Apple-PubSub/65.28',1336237748,''),('e360f106e3828da77dc7b2add909aa7b','70.29.23.173','Apple-PubSub/65.28',1336239549,''),('3b0799e4dc8b3eb83caddbecfdb38e5c','70.29.23.173','Apple-PubSub/65.28',1336241351,''),('b588f1c6b5790cad17add886e47549d1','70.29.23.173','Apple-PubSub/65.28',1336243152,''),('364bbbbe36aad7746b75f287e20ba1b8','70.29.23.173','Apple-PubSub/65.28',1336244954,''),('23b413bea2edf1558dc676e18239a91c','70.29.23.173','Apple-PubSub/65.28',1336246755,''),('766ed59d063781a7802e60b1262f43d6','70.29.23.173','Apple-PubSub/65.28',1336248556,''),('b19ef041334e4ad3cb69adea5502f57b','70.29.23.173','Apple-PubSub/65.28',1336250358,''),('e7022b3a85032e1c48926801180a6a56','70.29.23.173','Apple-PubSub/65.28',1336252159,''),('371f759890e9aa6a239b22d475e17984','70.29.23.173','Apple-PubSub/65.28',1336253961,''),('0883627fba3b20a1e50c1888f0c4e435','70.29.23.173','Apple-PubSub/65.28',1336255762,''),('550253af736eb626b20fc6467a043dec','70.29.23.173','Apple-PubSub/65.28',1336257563,''),('b2939642d5adb8e08893ab96e51e1315','207.164.79.55','Mozilla/5.0 (iPhone; CPU iPhone OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B179 Sa',1336258271,''),('4860ba5602fb78d50d31f94d39499b7a','70.29.23.173','Apple-PubSub/65.28',1336259365,''),('f2256f3bacd4098dd6f8b8c4047cab70','70.29.23.173','Apple-PubSub/65.28',1336261166,''),('4106a9a7c8f09410b0a9a9a9407357b4','70.29.23.173','Apple-PubSub/65.28',1336262967,''),('8b3a2930fadca5cb32bda822f2bd8c21','70.29.23.173','Apple-PubSub/65.28',1336264769,''),('a0b4a6310469c45209b44ba6f8a5a3ab','70.29.23.173','Apple-PubSub/65.28',1336266570,''),('be2c72ff6d84d39ccac2e9d02613b801','70.29.23.173','Apple-PubSub/65.28',1336268372,''),('1fb4808d1f5f8ac73636a1512c884d97','70.29.23.173','Apple-PubSub/65.28',1336270173,''),('75f7f707458a88763ba07232befa12bf','70.29.23.173','Apple-PubSub/65.28',1336271975,''),('23c99499a60636ca108aafe4bb7cdecf','70.29.23.173','Apple-PubSub/65.28',1336273776,''),('2cd42c1791d80fbcdb7abf0cb19d8262','70.29.23.173','Apple-PubSub/65.28',1336275578,''),('321fbf85f65ebabc3d2ff9952d8c1c99','70.29.23.173','Apple-PubSub/65.28',1336277379,''),('11487df2db6db09662fa95f636121a11','70.29.23.173','Apple-PubSub/65.28',1336279181,''),('c997b6e47c7ab9e996c269587a7a4e02','70.29.23.173','Apple-PubSub/65.28',1336280982,''),('e7e8adf78db687755d255db59504f240','70.29.23.173','Apple-PubSub/65.28',1336282783,''),('0c8053e182c0c67c1753d801814815f6','70.29.23.173','Apple-PubSub/65.28',1336284584,''),('68c04e6478f0f58d43b41b46d8a150fc','70.29.23.173','Apple-PubSub/65.28',1336286386,''),('1049621103d512a357ca13f67af9c315','70.29.23.173','Apple-PubSub/65.28',1336288187,''),('8b2ffb353d30b79e5b916e58805a63ef','70.29.23.173','Apple-PubSub/65.28',1336289989,''),('c9f03b73981260414cb614f57e8b0d33','70.29.23.173','Apple-PubSub/65.28',1336291790,''),('a22f10d1f61b1fef1fe8056a2daebb51','70.29.23.173','Apple-PubSub/65.28',1336293591,''),('a0a3ed265cb74325f2eb91532b596985','70.29.23.173','Apple-PubSub/65.28',1336295393,''),('f474f0585ad1c5e7ff00d86594221463','70.29.23.173','Apple-PubSub/65.28',1336297194,''),('85cb8a2fcf16d6839baedcbce7446063','70.29.23.173','Apple-PubSub/65.28',1336298996,''),('d903b2f49bcef7f7face56693cc6f635','70.29.23.173','Apple-PubSub/65.28',1336300797,''),('b28a76d7e1de8705b98375c2a5b6b0e6','70.29.23.173','Apple-PubSub/65.28',1336302599,''),('3991715418a3a8adad579ae2b2f8d7c9','70.29.23.173','Apple-PubSub/65.28',1336304400,''),('11e82eb72f347b385592bd827422c3c7','70.29.23.173','Apple-PubSub/65.28',1336306201,''),('efb10900dfc152661a54e6b37463e597','70.29.23.173','Apple-PubSub/65.28',1336308003,''),('c3e183560eb97547bd184f5050e6a84b','70.29.23.173','Apple-PubSub/65.28',1336309804,''),('9533f3c4418830b69190c44acb319d77','70.29.23.173','Apple-PubSub/65.28',1336311606,''),('bcd80e8604a12f0122acac7089f90155','70.29.23.173','Apple-PubSub/65.28',1336313407,''),('c3968aefc8fa36c745117c2add9876a7','70.29.23.173','Apple-PubSub/65.28',1336315209,''),('66f7d308e6e5343e51478c3c6e262c29','70.29.23.173','Apple-PubSub/65.28',1336317010,''),('99271e3dda5cafcfb351c42bfa3ec2e5','70.29.23.173','Apple-PubSub/65.28',1336318811,''),('64bcd97c9c33f49764114c5ed9a6fa51','70.29.23.173','Apple-PubSub/65.28',1336320613,''),('8aafd6b17e7d44e2e6bba48e55298003','70.29.23.173','Apple-PubSub/65.28',1336322414,''),('cbe3af5459da8969b741f85fb719e337','70.29.23.173','Apple-PubSub/65.28',1336324216,''),('335faf94352e36b65220a808cdad62c0','70.29.23.173','Apple-PubSub/65.28',1336326017,''),('55482837199bb91ecfb7d197d8db53ea','70.29.23.173','Apple-PubSub/65.28',1336327819,''),('b5e264714bedfd9e3df91336215c04ed','70.29.23.173','Apple-PubSub/65.28',1336329620,''),('4f8089258ac8a73e10ec5356c7c93f38','70.29.23.173','Apple-PubSub/65.28',1336331422,''),('714deac83bfd976dc9ccc21f66b794f8','70.29.23.173','Apple-PubSub/65.28',1336333223,''),('b82ee18321601b2121752309ea7550ac','70.29.23.173','Apple-PubSub/65.28',1336335024,''),('ec847523bf45f12b1c9c78182875cf9b','70.29.23.173','Apple-PubSub/65.28',1336336826,''),('65f6543b7f1d79092c807567266100a7','70.29.23.173','Apple-PubSub/65.28',1336338627,''),('0dc856328462caf57fbc369c594d3cbd','70.29.23.173','Apple-PubSub/65.28',1336340429,''),('71bff4f9b5b382adfb38f14a39234657','70.29.23.173','Apple-PubSub/65.28',1336342230,''),('561f9f7ba5bf165e43d62c27fe4a64ef','70.29.23.173','Apple-PubSub/65.28',1336344031,''),('60605a95ebff30a4519893de984d2e29','70.29.23.173','Apple-PubSub/65.28',1336345833,''),('a3dc4ca1fc80dcdc2e2fa25867ab769e','70.29.23.173','Apple-PubSub/65.28',1336347634,''),('eefcb6c2677f68f270162c9e847f4c14','70.29.23.173','Apple-PubSub/65.28',1336349436,''),('5dfeeedbf021d73c9f828b962a402c78','70.29.23.173','Apple-PubSub/65.28',1336351238,''),('4a9705db1d0c1bc04f346a310f5e2055','70.29.23.173','Apple-PubSub/65.28',1336353039,''),('5669e19e90fba97934d53602a655b80f','70.29.23.173','Apple-PubSub/65.28',1336354841,''),('ff5f4b9a6c72eba0101f71cc44630e2f','70.29.23.173','Apple-PubSub/65.28',1336356642,''),('2da1dc56d385a4058c6abb8add31d748','70.29.23.173','Apple-PubSub/65.28',1336358444,''),('733b12d5336bfe5e18100fa56487a3cf','70.29.23.173','Apple-PubSub/65.28',1336360245,''),('e272303106753426592a1a294c75c11a','70.29.23.173','Apple-PubSub/65.28',1336362046,''),('38c3ad0c8105a3c5d804547fe7311432','70.29.23.173','Apple-PubSub/65.28',1336363848,''),('d9317b1ae4931c855e707c5c84969d6f','70.29.23.173','Apple-PubSub/65.28',1336365649,''),('b333d7aa1cf47c62b275ff384bfd947d','70.29.23.173','Apple-PubSub/65.28',1336367450,''),('2f146870b86d044096589a3c5c33334f','70.29.23.173','Apple-PubSub/65.28',1336369252,''),('001c6085200ed9d2cceed352f96f831f','70.29.23.173','Apple-PubSub/65.28',1336371053,''),('a4e7244d6c8e018692ed4857f9889527','70.29.23.173','Apple-PubSub/65.28',1336372855,''),('92310aede82872073c2e4fd8ee1da02a','70.29.23.173','Apple-PubSub/65.28',1336374656,''),('612ebc515134da6d091a5c8495754d43','70.29.23.173','Apple-PubSub/65.28',1336376457,''),('00860a9a218cf986c16691818ce9e2b2','70.29.23.173','Apple-PubSub/65.28',1336378259,''),('82875aa70f17eb3a7e2cc680b4c8092e','70.29.23.173','Apple-PubSub/65.28',1336380060,''),('ec7b96f2049443ac50dba75a4b980293','70.29.23.173','Apple-PubSub/65.28',1336381861,''),('7097e0fd00968544bcdb8a680ecd36b5','70.29.23.173','Apple-PubSub/65.28',1336383663,''),('0b868e4b39a10d70e89842e2e7928937','70.29.23.173','Apple-PubSub/65.28',1336385464,''),('490f6eee60130d3868f5f35ca656b154','70.29.23.173','Apple-PubSub/65.28',1336387266,''),('a227d5cc057328d749a78b2a915d20b0','70.29.23.173','Apple-PubSub/65.28',1336389067,''),('0938cb91fee4daeff44560eb72352e9c','70.29.23.173','Apple-PubSub/65.28',1336390869,''),('ea959c67cfc2d511cabe45553ac578d2','70.29.23.173','Apple-PubSub/65.28',1336392670,''),('14b3c143dc968d8fab0a7ecf627085f4','70.29.23.173','Apple-PubSub/65.28',1336394471,''),('1da9a8f16ced8f579f5f37178ac3bade','70.29.23.173','Apple-PubSub/65.28',1336396273,''),('318d94008d76941493f995e07530bd45','70.29.23.173','Apple-PubSub/65.28',1336398074,''),('d3a6063baa983bfe7506f48473175947','70.29.23.173','Apple-PubSub/65.28',1336399875,''),('7915f17cc2b3ead73224a40364f9c82b','70.29.23.173','Apple-PubSub/65.28',1336401677,''),('9e8ea2af54b102ff6494ef80503e4c4e','70.29.23.173','Apple-PubSub/65.28',1336403478,''),('60ddbfd0e84d3f867352bc2ab2522cbe','70.29.23.173','Apple-PubSub/65.28',1336405279,''),('ec55c711a786428404f801ee7950d1c6','70.29.23.173','Apple-PubSub/65.28',1336407081,''),('0221040a4b12c8021968c2ab8d7b3115','70.29.23.173','Apple-PubSub/65.28',1336408882,''),('1723071c72ad777ae4e4236f171dbb27','70.29.23.173','Apple-PubSub/65.28',1336410684,''),('dcafadf857418956a20e2da55660f065','70.29.23.173','Apple-PubSub/65.28',1336412485,''),('1b97ced1fc83563b040c4aae4f3c5ced','70.29.23.173','Apple-PubSub/65.28',1336414286,''),('3371c4193e14cbbb878b590a6f0c1ffd','70.29.23.173','Apple-PubSub/65.28',1336416088,''),('349d762d02a475395759a64a9f8e8e9b','70.29.23.173','Apple-PubSub/65.28',1336417889,''),('ce6d4933637c317cf0d662171514338a','70.29.23.173','Apple-PubSub/65.28',1336419691,''),('1eea9fb37727a7e65c8c33c776567fea','70.29.23.173','Apple-PubSub/65.28',1336421492,''),('53ee01a89b6a7ba0ca52edf9fdaa058f','70.29.23.173','Apple-PubSub/65.28',1336423294,''),('2858f18472317d318a7d42a71a7f094b','70.29.23.173','Apple-PubSub/65.28',1336425095,''),('68b8781b07a9fb53865627cd46dd5589','70.29.23.173','Apple-PubSub/65.28',1336426896,''),('93d7065dfe270bdda14648d2c6352114','70.29.23.173','Apple-PubSub/65.28',1336428698,''),('e78002335ac89eb8b68b8081ca7baee3','70.29.23.173','Apple-PubSub/65.28',1336430499,''),('85b5fb54f8c43261a9fce6898dd70167','70.29.23.173','Apple-PubSub/65.28',1336432300,''),('30b37fad0e6da5ceff7eba7198a11213','70.29.23.173','Apple-PubSub/65.28',1336434102,''),('c6b8695a61bad9d3b7311221809232c9','70.29.23.173','Apple-PubSub/65.28',1336435904,''),('e828832a07c4c969b1ae667ab20c820c','70.29.23.173','Apple-PubSub/65.28',1336437705,''),('b3f88f72b75b34ae307e876ee1914b68','70.29.23.173','Apple-PubSub/65.28',1336439506,''),('8dfa9d88d32385c6c0320a74120254b5','70.29.23.173','Apple-PubSub/65.28',1336441308,''),('b1d761d36511ce91dc00643e0e0feefd','70.29.23.173','Apple-PubSub/65.28',1336443109,''),('f618f283807f103b6b349a52ffd7dae8','70.29.23.173','Apple-PubSub/65.28',1336444911,''),('211c36f005e96872c0229966edb571c5','70.29.23.173','Apple-PubSub/65.28',1336446712,''),('ed8be879115aed559060c9eb4cf96b53','70.29.23.173','Apple-PubSub/65.28',1336448514,''),('120e5c3ab973afc74d896030e8dd20c9','70.29.23.173','Apple-PubSub/65.28',1336450315,''),('07bd8c357ada576d0c8c4842e457ef1b','70.29.23.173','Apple-PubSub/65.28',1336452116,''),('4d35ecdd8edd852e3ac8529ed772fb91','70.29.23.173','Apple-PubSub/65.28',1336453918,''),('2970108db801714c5277a31995877265','70.29.23.173','Apple-PubSub/65.28',1336455719,''),('1ab3f0dbe679e188e21468aaba85b82d','70.29.23.173','Apple-PubSub/65.28',1336457520,''),('615406b2b32f40920abf8cb0a175e4fc','99.231.161.237','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19',1336462944,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:18:\"ts@daxiangroup.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('93d4caeab3d3e02fab3e354b776ee22d','70.29.23.173','Apple-PubSub/65.28',1336459322,''),('4d2e56f03cc39a36ee8c60f05177f1bb','70.29.23.173','Apple-PubSub/65.28',1336461123,''),('54b5a43e4c8f02f3e6b28a2b530fc888','64.231.21.81','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1336573687,''),('4c96f3bd06f3780d0f56ae83918692b3','64.231.21.81','Apple-PubSub/65.28',1336617074,''),('1b7be78dc50b4dfd6337435a3f223b3e','64.231.21.81','Apple-PubSub/65.28',1336618875,''),('308d23923e351621f2fd2026f3a5415a','64.231.21.81','Apple-PubSub/65.28',1336630911,''),('edf21dfb89e5df183d1edb410cc20087','64.231.21.81','Apple-PubSub/65.28',1336632712,''),('593dc331760d51e23d94cd640b0f8c34','64.231.21.81','Apple-PubSub/65.28',1336847787,''),('de24b9f862e67efd4a36c8d23f386725','64.231.21.81','Apple-PubSub/65.28',1336850183,''),('5aa11536870d9dd931c548925b632e49','64.231.21.81','Apple-PubSub/65.28',1336851984,''),('f5d429f4f715d9b3768e09d4824118cc','64.231.21.81','Apple-PubSub/65.28',1337041289,''),('197f89acf96d53fba6c1e01867e23d14','64.231.21.81','Apple-PubSub/65.28',1337043089,''),('56f2ab6bc9617eeef72cc7d06cceb2e1','64.231.21.81','Apple-PubSub/65.28',1337044890,''),('bbe89edd47905d8fb5eb1d7dbac3772d','64.231.21.81','Apple-PubSub/65.28',1337046691,''),('f61b3028e684adcb6dae3dcfe0e59906','64.231.21.81','Apple-PubSub/65.28',1337048493,''),('6d6fc95ae29893384b242f5f64cc1461','64.231.21.81','Apple-PubSub/65.28',1337050294,''),('58263bc03297e931a1fcec3d9cca118d','64.231.21.81','Apple-PubSub/65.28',1337052096,''),('a13fe96fc615a55a08328c378af5ec14','64.231.21.81','Apple-PubSub/65.28',1337053898,''),('4f3ab2849d39b1c01145fbc76e8f2e12','64.231.21.81','Apple-PubSub/65.28',1337055701,''),('bb43f245c4c4d16552c170accea6e03e','64.231.21.81','Apple-PubSub/65.28',1337057502,''),('54e19a111fe127e82adc4b1c676e2036','64.231.21.81','Apple-PubSub/65.28',1337059304,''),('c5dc07390a8d2fd28e876e6f7ecd0d18','64.231.21.81','Apple-PubSub/65.28',1337061105,''),('502189ca5d92a18c4f6d3abd6ec2a450','64.231.21.81','Apple-PubSub/65.28',1337062907,''),('9f1493811e39558d295b7bb46ca87284','64.231.21.81','Apple-PubSub/65.28',1337064709,''),('b9616f9553538db225f172d90dc255bd','64.231.21.81','Apple-PubSub/65.28',1337066510,''),('ebfa8c48b2c6d120b0ad9b99200d9553','64.231.21.81','Apple-PubSub/65.28',1337068311,''),('c73ad3cf0e20351bab5913b4f9f86305','64.231.21.81','Apple-PubSub/65.28',1337070113,''),('21ef2456cc35b3cc10672e78fbbfd6d8','64.231.21.81','Apple-PubSub/65.28',1337071914,''),('c58dd4a1f3c8cc1d7d2563f9526cb0fe','64.231.21.81','Apple-PubSub/65.28',1337073715,''),('450c8dd3a10b82f782805962d8e95270','64.231.21.81','Apple-PubSub/65.28',1337075517,''),('c434ebe9a7cf941bfd7415bd5b25a7c7','64.231.21.81','Apple-PubSub/65.28',1337077318,''),('c37cff4eb09af06f8adbacedb13665a0','64.231.21.81','Apple-PubSub/65.28',1337079119,''),('a553b9169ec731258d77ad4c123eef6f','64.231.21.81','Apple-PubSub/65.28',1337080921,''),('df9b95518f0a4fd46b4321897681c147','64.231.21.81','Apple-PubSub/65.28',1337082722,''),('74183abde694db97df46ba6793be5143','64.231.21.81','Apple-PubSub/65.28',1337084523,''),('b1b4f829c492db4f1d38635f62ff7f0c','64.231.21.81','Apple-PubSub/65.28',1337086324,''),('f549d13e00241af5f6f8235d9873843f','64.231.21.81','Apple-PubSub/65.28',1337088126,''),('0323dba6758bee0cfb871e059d6b4e1f','64.231.21.81','Apple-PubSub/65.28',1337089927,''),('ab92d1207612ee0aa76ae10b389eae23','64.231.21.81','Apple-PubSub/65.28',1337091728,''),('99f07b0c6f4694740f6dd20a63a207ec','64.231.21.81','Apple-PubSub/65.28',1337093530,''),('cdbc92bbd2a2fab38473a63e250b4a37','64.231.21.81','Apple-PubSub/65.28',1337185531,''),('6e0cbe9450feac3f15acfb094b10faa8','64.231.21.81','Apple-PubSub/65.28',1337187332,''),('86b24732e7311eb86571131a1f84659f','64.231.21.81','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1337188047,''),('12a0712c65f055955bbd078b880b5aad','64.231.21.81','Apple-PubSub/65.28',1337189133,''),('00afd574569aba3baec013c7a8ea28b6','64.231.21.81','Apple-PubSub/65.28',1337190935,''),('7bb806e405dd881da9e3ea9cf730ebfa','64.231.21.81','Apple-PubSub/65.28',1337192736,''),('69cb928416b43e312b44dc3ddeba7e84','64.231.21.81','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.5 Safari/534.55.3',1337193071,''),('094d0e405b96e2092e7356316ecf333f','64.231.21.81','Apple-PubSub/65.28',1337194538,''),('5e657c682e56e35487d0936b7d5a0e3c','64.231.21.81','Apple-PubSub/65.28',1337196339,''),('c61bf709401ceea6656603c1ef7f59e8','64.231.21.81','Apple-PubSub/65.28',1337198141,''),('f7f6b5f4540ea45fb17e33c5978d8f86','64.231.21.81','Apple-PubSub/65.28',1337199942,''),('28aaa26f75a22d67561f2b142e21c6d1','64.231.21.81','Apple-PubSub/65.28',1337201744,''),('e94feb14e8a6af1f9f85ac0e9c45e238','64.231.21.81','Apple-PubSub/65.28',1337203545,''),('4148ae272eb7da7a3ff12341caecc3a1','64.231.21.81','Apple-PubSub/65.28',1337205347,''),('38cee41da37ad37f5ed9cd8c31b247a5','99.231.161.237','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19',1337459982,''),('76bcae50bc2811c49653f1cf0012d544','99.231.161.237','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.46 Safari/536.5',1337461511,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:18:\"ts@daxiangroup.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
/*!40000 ALTER TABLE `default_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_comments`
--

DROP TABLE IF EXISTS `default_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_comments` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_on` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Comments by users or guests';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_comments`
--

LOCK TABLES `default_comments` WRITE;
/*!40000 ALTER TABLE `default_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_contact_log`
--

DROP TABLE IF EXISTS `default_contact_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_contact_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contact log';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_contact_log`
--

LOCK TABLES `default_contact_log` WRITE;
/*!40000 ALTER TABLE `default_contact_log` DISABLE KEYS */;
INSERT INTO `default_contact_log` VALUES (1,'tester@ding.com','Harry\'s Home Improvements :: Support','This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: 99.231.161.237\n				OS Mac OS X\n				Agent Chrome 18.0.1025.168\n				<hr />\n				thsi si a test\n\n				tester,\n				tester@ding.com','Chrome 18.0.1025.168','99.231.161.237','Mac OS X',1336447935,'');
/*!40000 ALTER TABLE `default_contact_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_email_templates`
--

DROP TABLE IF EXISTS `default_email_templates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store dynamic email templates';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_email_templates`
--

LOCK TABLES `default_email_templates` WRITE;
/*!40000 ALTER TABLE `default_email_templates` DISABLE KEYS */;
INSERT INTO `default_email_templates` VALUES (1,'comments','Comment Notification','Email that is sent to admin when someone creates a comment','You have just received a comment from {{ name }}','<h3>You have received a comment from {{ name }}</h3><strong>IP Address: {{ sender_ip }}</strong>\n<strong>Operating System: {{ sender_os }}\n<strong>User Agent: {{ sender_agent }}</strong>\n<div>{{ comment }}</div>\n<div>View Comment:{{ redirect_url }}</div>','en',1),(2,'contact','Contact Notification','Template for the contact form','{{ settings:site_name }} :: {{ subject }}','This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n				{{ email }}','en',1),(3,'registered','New User Registered','The email sent to the site contact e-mail when a new user registers','{{ settings:site_name }} :: You have just received a registration from {{ name}','<h3>You have received a registration from {{ name}</h3><strong>IP Address: {{ sender_ip }}</strong>\n				<strong>Operating System: {{ sender_os }}\n				<strong>User Agent: {{ sender_agent }}</strong>','en',1),(4,'activation','Activation Email','The email which contains the activation code that is sent to a new user','{{ settings:site_name }} - Account Activation','<p>Hello {{ user:first_name }},</p>\n									<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n									<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n									<p>&nbsp;</p>\n									<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n									<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\n									<p><strong>Activation Code:</strong> {{ activation_code }}</p>','en',1),(5,'forgotten_password','Forgotten Password Email','The email that is sent containing a password reset code','{{ settings:site_name }} - Forgotten Password','<p>Hello {{ user:first_name }},</p>\n									<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n									<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>','en',1),(6,'new_password','New Password Email','After a password is reset this email is sent containing the new password','{{ settings:site_name }} - New Password','<p>Hello {{ user:first_name }},</p>\n									<p>Your new password is: {{ new_password }}</p>\n									<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>','en',1);
/*!40000 ALTER TABLE `default_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_file_folders`
--

DROP TABLE IF EXISTS `default_file_folders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_file_folders`
--

LOCK TABLES `default_file_folders` WRITE;
/*!40000 ALTER TABLE `default_file_folders` DISABLE KEYS */;
INSERT INTO `default_file_folders` VALUES (1,0,'image-uploads','image-uploads',1336459269,0);
/*!40000 ALTER TABLE `default_file_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_files`
--

DROP TABLE IF EXISTS `default_files`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_files`
--

LOCK TABLES `default_files` WRITE;
/*!40000 ALTER TABLE `default_files` DISABLE KEYS */;
INSERT INTO `default_files` VALUES (1,1,1,'i','Name','tile-installation.jpg','','.jpg','image/jpeg',424,283,199,1336444934,0),(2,1,1,'i','Name','exterior-siding-installation.jpg','','.jpg','image/jpeg',675,900,527,1336446197,0),(3,1,1,'i','Name','roofing-installation.jpg','','.jpg','image/jpeg',344,304,28,1336446799,0),(4,1,1,'i','Name','kitchen-cabinet-installation.jpg','','.jpg','image/jpeg',560,315,44,1336447744,0);
/*!40000 ALTER TABLE `default_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_groups`
--

DROP TABLE IF EXISTS `default_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Permission roles such as admins, moderators, staff, etc';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_groups`
--

LOCK TABLES `default_groups` WRITE;
/*!40000 ALTER TABLE `default_groups` DISABLE KEYS */;
INSERT INTO `default_groups` VALUES (1,'admin','Administrators'),(2,'user','Users');
/*!40000 ALTER TABLE `default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords`
--

DROP TABLE IF EXISTS `default_keywords`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_keywords`
--

LOCK TABLES `default_keywords` WRITE;
/*!40000 ALTER TABLE `default_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords_applied`
--

DROP TABLE IF EXISTS `default_keywords_applied`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_keywords_applied` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_keywords_applied`
--

LOCK TABLES `default_keywords_applied` WRITE;
/*!40000 ALTER TABLE `default_keywords_applied` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords_applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_migrations`
--

DROP TABLE IF EXISTS `default_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_migrations`
--

LOCK TABLES `default_migrations` WRITE;
/*!40000 ALTER TABLE `default_migrations` DISABLE KEYS */;
INSERT INTO `default_migrations` VALUES (70);
/*!40000 ALTER TABLE `default_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_modules`
--

DROP TABLE IF EXISTS `default_modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_modules`
--

LOCK TABLES `default_modules` WRITE;
/*!40000 ALTER TABLE `default_modules` DISABLE KEYS */;
INSERT INTO `default_modules` VALUES (1,'a:10:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"br\";s:4:\"Blog\";s:2:\"pl\";s:4:\"Blog\";s:2:\"he\";s:8:\"בלוג\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"ru\";s:8:\"Блог\";s:2:\"zh\";s:6:\"文章\";s:2:\"id\";s:4:\"Blog\";}','blog','2.0',NULL,'a:19:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fr\";s:46:\"Envoyez de nouveaux posts et messages de blog.\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"zh\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:50:\"Kirjoita uutisartikkeleita tai blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"id\";s:15:\"Post entri blog\";}',1,1,1,'content',1,1,1,0),(2,'a:19:{s:2:\"sl\";s:10:\"Komentarji\";s:2:\"en\";s:8:\"Comments\";s:2:\"br\";s:12:\"Comentários\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"zh\";s:6:\"回應\";s:2:\"it\";s:8:\"Commenti\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"he\";s:12:\"תגובות\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"id\";s:8:\"Komentar\";}','comments','1.0',NULL,'a:19:{s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"zh\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";}',0,0,1,'content',1,1,1,0),(3,'a:19:{s:2:\"sl\";s:7:\"Kontakt\";s:2:\"en\";s:7:\"Contact\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fr\";s:7:\"Contact\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"zh\";s:12:\"聯絡我們\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"id\";s:6:\"Kontak\";}','contact','0.9',NULL,'a:19:{s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"zh\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";}',0,0,0,'0',1,1,1,0),(4,'a:18:{s:2:\"sl\";s:8:\"Datoteke\";s:2:\"en\";s:5:\"Files\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"de\";s:7:\"Dateien\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"zh\";s:6:\"檔案\";s:2:\"it\";s:4:\"File\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"he\";s:10:\"קבצים\";s:2:\"lt\";s:6:\"Failai\";s:2:\"da\";s:5:\"Filer\";s:2:\"id\";s:4:\"File\";}','files','1.2',NULL,'a:18:{s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"zh\";s:33:\"管理網站中的檔案與目錄\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";}',0,0,1,'content',1,1,1,0),(5,'a:18:{s:2:\"sl\";s:7:\"Skupine\";s:2:\"en\";s:6:\"Groups\";s:2:\"br\";s:6:\"Grupos\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"zh\";s:6:\"群組\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"ru\";s:12:\"Группы\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"da\";s:7:\"Grupper\";s:2:\"id\";s:4:\"Grup\";}','groups','1.0',NULL,'a:18:{s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"zh\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"el\";s:159:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";}',0,0,1,'users',1,1,1,0),(6,'a:9:{s:2:\"en\";s:8:\"Keywords\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"zh\";s:6:\"鍵詞\";s:2:\"id\";s:10:\"Kata Kunci\";}','keywords','1.0',NULL,'a:9:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"zh\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";}',0,0,1,'content',1,1,1,0),(7,'a:6:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"zh\";s:6:\"維護\";s:2:\"id\";s:12:\"Pemeliharaan\";}','maintenance','1.0',NULL,'a:6:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"el\";s:140:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της σελίδας διαχείρισης.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"zh\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";}',0,0,1,'utilities',1,1,1,0),(8,'a:19:{s:2:\"sl\";s:6:\"Moduli\";s:2:\"en\";s:7:\"Modules\";s:2:\"nl\";s:7:\"Modules\";s:2:\"es\";s:8:\"Módulos\";s:2:\"fr\";s:7:\"Modules\";s:2:\"de\";s:6:\"Module\";s:2:\"pl\";s:7:\"Moduły\";s:2:\"br\";s:8:\"Módulos\";s:2:\"zh\";s:6:\"模組\";s:2:\"it\";s:6:\"Moduli\";s:2:\"ru\";s:12:\"Модули\";s:2:\"ar\";s:14:\"الوحدات\";s:2:\"cs\";s:6:\"Moduly\";s:2:\"fi\";s:8:\"Moduulit\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"he\";s:14:\"מודולים\";s:2:\"lt\";s:8:\"Moduliai\";s:2:\"da\";s:7:\"Moduler\";s:2:\"id\";s:5:\"Modul\";}','modules','1.0',NULL,'a:19:{s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"zh\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";}',0,0,1,'0',1,1,1,0),(9,'a:18:{s:2:\"sl\";s:10:\"Navigacija\";s:2:\"en\";s:10:\"Navigation\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"br\";s:11:\"Navegação\";s:2:\"zh\";s:12:\"導航選單\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"he\";s:10:\"ניווט\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"id\";s:8:\"Navigasi\";}','navigation','1.1',NULL,'a:19:{s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"zh\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";}',0,0,1,'design',1,1,1,0),(10,'a:19:{s:2:\"sl\";s:6:\"Strani\";s:2:\"en\";s:5:\"Pages\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fr\";s:5:\"Pages\";s:2:\"de\";s:6:\"Seiten\";s:2:\"pl\";s:6:\"Strony\";s:2:\"br\";s:8:\"Páginas\";s:2:\"zh\";s:6:\"頁面\";s:2:\"it\";s:6:\"Pagine\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"fi\";s:5:\"Sivut\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"he\";s:8:\"דפים\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"da\";s:5:\"Sider\";s:2:\"id\";s:7:\"Halaman\";}','pages','2.0',NULL,'a:19:{s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"zh\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"el\";s:134:\"Προσθέστε δικές σας σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";}',1,1,1,'content',1,1,1,0),(11,'a:19:{s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"en\";s:11:\"Permissions\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"br\";s:11:\"Permissões\";s:2:\"zh\";s:6:\"權限\";s:2:\"it\";s:8:\"Permessi\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"id\";s:9:\"Perizinan\";}','permissions','0.5',NULL,'a:19:{s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"zh\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"el\";s:142:\"Ελέγξτε οι χρήστες ποιας ομάδας μπορούν να δούν ποιες περιοχές του ιστοτόπου.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";}',0,0,1,'users',1,1,1,0),(12,'a:17:{s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"en\";s:9:\"Redirects\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"he\";s:12:\"הפניות\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"zh\";s:6:\"轉址\";s:2:\"id\";s:8:\"Redirect\";}','redirects','1.0',NULL,'a:17:{s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"zh\";s:33:\"將網址轉址、重新定向。\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";}',0,0,1,'utilities',1,1,1,0),(13,'a:19:{s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"en\";s:8:\"Settings\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"br\";s:15:\"Configurações\";s:2:\"zh\";s:12:\"網站設定\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"id\";s:10:\"Pengaturan\";}','settings','0.6',NULL,'a:19:{s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fr\";s:105:\"Permet aux admistrateurs et au personnel de modifier les paramètres du site : nom du site et description\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"zh\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";}',1,0,1,'0',1,1,1,0),(14,'a:14:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"zh\";s:12:\"網站地圖\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"id\";s:10:\"Peta Situs\";}','sitemap','1.2',NULL,'a:15:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"zh\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";}',0,1,0,'content',1,1,1,0),(15,'a:14:{s:2:\"sl\";s:14:\"Email predloge\";s:2:\"en\";s:15:\"Email Templates\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"he\";s:12:\"תבניות\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"zh\";s:12:\"郵件範本\";s:2:\"id\";s:14:\"Template Email\";}','templates','1.0',NULL,'a:14:{s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"zh\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";}',1,0,1,'design',1,1,1,0),(16,'a:19:{s:2:\"sl\";s:8:\"Predloge\";s:2:\"en\";s:6:\"Themes\";s:2:\"nl\";s:12:\"Thema&apos;s\";s:2:\"es\";s:5:\"Temas\";s:2:\"fr\";s:7:\"Thèmes\";s:2:\"de\";s:6:\"Themen\";s:2:\"pl\";s:6:\"Motywy\";s:2:\"br\";s:5:\"Temas\";s:2:\"zh\";s:12:\"佈景主題\";s:2:\"it\";s:4:\"Temi\";s:2:\"ru\";s:8:\"Темы\";s:2:\"ar\";s:14:\"السّمات\";s:2:\"cs\";s:14:\"Motivy vzhledu\";s:2:\"fi\";s:6:\"Teemat\";s:2:\"el\";s:31:\"Θέματα Εμφάνισης\";s:2:\"he\";s:23:\"ערכות נושאים\";s:2:\"lt\";s:5:\"Temos\";s:2:\"da\";s:6:\"Temaer\";s:2:\"id\";s:4:\"Tema\";}','themes','1.0',NULL,'a:19:{s:2:\"sl\";s:133:\"Dovoljuje adminom in osebju spremembo izgleda spletne strani, namestitev novega izgleda in urejanja le tega v bolj vizualnem pristopu\";s:2:\"en\";s:86:\"Allows admins and staff to switch themes, upload new themes, and manage theme options.\";s:2:\"nl\";s:153:\"Maakt het voor administratoren en medewerkers mogelijk om het thema van de website te wijzigen, nieuwe thema&apos;s te uploaden en ze visueel te beheren.\";s:2:\"es\";s:132:\"Permite a los administradores y miembros del personal cambiar el tema del sitio web, subir nuevos temas y manejar los ya existentes.\";s:2:\"fr\";s:144:\"Permet aux administrateurs et au personnel de modifier le thème du site, de charger de nouveaux thèmes et de le gérer de façon plus visuelle\";s:2:\"de\";s:121:\"Ermöglicht es dem Administrator das Seiten Thema auszuwählen, neue Themen hochzulanden oder diese visuell zu verwalten.\";s:2:\"pl\";s:100:\"Umożliwia administratorowi zmianę motywu strony, wgrywanie nowych motywów oraz zarządzanie nimi.\";s:2:\"br\";s:125:\"Permite aos administradores e membros da equipe fazer upload de novos temas e gerenciá-los através de uma interface visual.\";s:2:\"zh\";s:108:\"讓管理者可以更改網站顯示風貌，以視覺化的操作上傳並管理這些網站佈景主題。\";s:2:\"it\";s:120:\"Permette ad amministratori e staff di cambiare il tema del sito, carica nuovi temi e gestiscili in um modo più visuale.\";s:2:\"ru\";s:102:\"Управление темами оформления сайта, загрузка новых тем.\";s:2:\"ar\";s:170:\"تمكّن الإدارة وأعضاء الموقع تغيير سِمة الموقع، وتحميل سمات جديدة وإدارتها بطريقة مرئية سلسة.\";s:2:\"cs\";s:106:\"Umožňuje administrátorům a dalším osobám měnit vzhled webu, nahrávat nové motivy a spravovat je.\";s:2:\"fi\";s:129:\"Mahdollistaa sivuston teeman vaihtamisen, uusien teemojen lataamisen ja niiden hallinnoinnin visuaalisella käyttöliittymällä.\";s:2:\"el\";s:222:\"Επιτρέπει στους διαχειριστές να αλλάξουν το θέμα προβολής του ιστοτόπου να ανεβάσουν νέα θέματα και να τα διαχειριστούν.\";s:2:\"he\";s:63:\"ניהול של ערכות נושאים שונות - עיצוב\";s:2:\"lt\";s:105:\"Leidžiama administratoriams ir personalui keisti puslapio temą, įkraunant naują temą ir valdyti ją.\";s:2:\"da\";s:108:\"Lader administratore ændre websidens tema, uploade nye temaer og håndtére dem med en mere visual tilgang.\";s:2:\"id\";s:104:\"Memungkinkan admin dan staff untuk mengubah tema tampilan, mengupload tema baru, dan mengatur opsi tema.\";}',0,0,1,'design',1,1,1,0),(17,'a:19:{s:2:\"en\";s:5:\"Users\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"br\";s:9:\"Usuários\";s:2:\"zh\";s:6:\"用戶\";s:2:\"it\";s:6:\"Utenti\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"da\";s:7:\"Brugere\";s:2:\"id\";s:8:\"Pengguna\";}','users','0.8',NULL,'a:19:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"zh\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";}',0,0,1,'0',1,1,1,0),(18,'a:19:{s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"en\";s:9:\"Variables\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"es\";s:9:\"Variables\";s:2:\"fr\";s:9:\"Variables\";s:2:\"de\";s:9:\"Variablen\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"zh\";s:12:\"系統變數\";s:2:\"it\";s:9:\"Variabili\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"he\";s:12:\"משתנים\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"da\";s:8:\"Variable\";s:2:\"id\";s:8:\"Variabel\";}','variables','0.4',NULL,'a:19:{s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fr\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"zh\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";}',0,0,1,'content',1,1,1,0),(19,'a:15:{s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"en\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"zh\";s:9:\"小組件\";s:2:\"it\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"ar\";s:12:\"الودجت\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"fi\";s:8:\"Widgetit\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"id\";s:6:\"Widget\";}','widgets','1.1',NULL,'a:17:{s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"zh\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"ar\";s:138:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"وِدْجِتْ\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"fi\";s:83:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Widgettejä\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";}',0,0,1,'content',1,1,1,0);
/*!40000 ALTER TABLE `default_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_groups`
--

DROP TABLE IF EXISTS `default_navigation_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Navigation groupings. Eg, header, sidebar, footer, etc';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_navigation_groups`
--

LOCK TABLES `default_navigation_groups` WRITE;
/*!40000 ALTER TABLE `default_navigation_groups` DISABLE KEYS */;
INSERT INTO `default_navigation_groups` VALUES (1,'Header','header'),(2,'Sidebar','sidebar'),(3,'Footer','footer'),(5,'Homepage Image Nav','homepage-image-nav');
/*!40000 ALTER TABLE `default_navigation_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_links`
--

DROP TABLE IF EXISTS `default_navigation_links`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id - normal` (`navigation_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Links for site navigation';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_navigation_links`
--

LOCK TABLES `default_navigation_links` WRITE;
/*!40000 ALTER TABLE `default_navigation_links` DISABLE KEYS */;
INSERT INTO `default_navigation_links` VALUES (1,'Home',0,'page',1,'','','',1,1,NULL,NULL,''),(2,'Contact',0,'page',3,'','','',1,2,NULL,NULL,''),(4,'Roofing',0,'uri',0,'','','services-roofing-and-skylights',5,1,'','0','image i1'),(5,'Kitchens & Bathrooms',0,'uri',0,'','','services-kitchens-and-baths',5,2,'','0','image i2'),(6,'Exterior Siding',0,'uri',0,'','','services-exterior-siding',5,3,'','0','image i3'),(7,'Flooring',0,'uri',0,'','','services-flooring',5,4,'','0','image i4');
/*!40000 ALTER TABLE `default_navigation_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_page_chunks`
--

DROP TABLE IF EXISTS `default_page_chunks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_page_chunks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_page_chunks`
--

LOCK TABLES `default_page_chunks` WRITE;
/*!40000 ALTER TABLE `default_page_chunks` DISABLE KEYS */;
INSERT INTO `default_page_chunks` VALUES (2,'default',2,'<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>','','wysiwyg-advanced',0),(4,'default',1,'<p>\n	Welcome to our homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>\n','','wysiwyg-advanced',1),(5,'default',4,'<p>\n	&nbsp;</p>\n<div>\n	HHI is a fully insured and licensed company that has been working in the GTA for over 30 years, servicing both residential and commercial clients. &nbsp;We are a full service contractor with licensed and professional tradespersons. &nbsp;</div>\n<div>\n	&nbsp;</div>\n<div>\n	Customer satisfaction is a high priority for us. &nbsp;We believe every job should be completed in a timely manner, minimizing any disruption to you. &nbsp;Keeping an open line of client communication ensures project success, making sure timely and expensive errors are eliminated. &nbsp;Our many repeat customers have told us that it&rsquo;s our extensive experience, quality workmanship and no pressure approach that keep them calling us again&nbsp;</div>\n','','wysiwyg-advanced',1),(7,'default',6,'<p>\n	HHI is experienced in replacement windows and door installation.&nbsp;&nbsp; Available in vinyl, aluminum or hybrid, replacement windows add lasting durability and enhance your homes appearance for years to come. &nbsp;&nbsp;Replacing inefficient windows will reduce energy costs, diminish outside noise levels and increase the resale value of your home. &nbsp;</p>\n','','wysiwyg-advanced',1),(19,'content',5,'<p>\n	<img alt=\"Tile flooring installation\" class=\"pyro-image float-right\" src=\"{{ url:site }}files/thumb/1/400\" /></p>\n<p>\n	HHI will do it right. Whether you want hard wood, laminate, ceramic or carpet, we have you covered. &nbsp; Complete from tear out to installation, our flooring experts will ensure that your flooring project is completed with precision &ndash; satisfaction guaranteed. &nbsp;</p>\n<p>\n	Always wanted to have heated floors? &nbsp;We can provide you with in-floor radiant heating options that will have your feet doing a happy dance.</p>\n<p>\n	HHI knows that this is your home and even during a renovation, we understand that you want to come home to a tidy worksite. &nbsp;We make sure that the job site is cleaned up at the end of every work day so that dust and debris aren&#39;t tracked through your house. &nbsp;And do you know those baby blue boot covers that save your floors from the dirt on a workmen&#39;s boot - we wear them.</p>\n','','wysiwyg-advanced',1),(22,'default',7,'<p>\n	<img alt=\"Exterior siding installation\" class=\"pyro-image float-left\" src=\"{{ url:site }}files/thumb/2/300\" style=\"float: left; \" /></p>\n<p class=\"p1\">\n	Whether you&#39;re looking for a new siding exterior for a large or small home, HHI can install your aluminum to vinyl siding. &nbsp;This is a great way to put a new fresh look on an existing structure as well as provide you with years of reliable protection from the coldest winters and the hottest summers. &nbsp;We carry a wide variety of colors and styles from the Gentek product line.</p>\n<p class=\"p1\">\n	Soffits and fascia provide that finished look to a home&#39;s exterior, but they are also an important step in ensuring your home is protected from extreme weather like heavy rains, melting snow and ice. HHI will ensure that your roof is installed with consideration of proper ventilation to help repvent roof structure decay.</p>\n','','wysiwyg-advanced',1),(28,'default',8,'<p>\n	<img alt=\"Kitchen cabinet installation\" class=\"pyro-image float-left\" src=\"{{ url:site }}files/thumb/4/300\" /></p>\n<div>\n	Kitchens and baths are important rooms in any home. &nbsp;Any jobs to be done in these rooms have to be done right! &nbsp;HHI uses only experienced and licensed trades that we know personally - having licensed plumbers, HVAC professionals and electricians on call.</div>\n<div>\n	&nbsp;</div>\n<div>\n	We can work with you on every aspect of your renovation &ndash; from putting together the design through to project completion. Already have a design plan? &nbsp;Our professionals will turn it into a reality.</div>\n<div>\n	&nbsp;</div>\n<div>\n	Just need your kitchen or bath updated? &nbsp;A new shower, vanity, cabinet reface or countertop might be all you require. &nbsp;Sometimes it really is that simple. &nbsp;You don&rsquo;t always have to completely gut a room to get the job done right, and this keeps costs down.</div>\n<div>\n	&nbsp;</div>\n<div>\n	HHI has the experience to help you decide without trying to up sell on things you don&rsquo;t need. &nbsp;This is one reason why we have so many repeat customers.&nbsp;</div>\n','','wysiwyg-advanced',1),(29,'default',9,'<p>\n	<img alt=\"Roofing installation\" class=\"pyro-image float-right\" src=\"{{ url:site }}files/thumb/3/300\" />HHI is a fully insured and licensed company with over thirty years of experience. We stay current on new technology for the roofing trade to ensure that you receive up to date products and advanced installation techniques. Carrying a wide variety of products, our installations are completed with care and control. Sloped or flat roofs &ndash; HHI can install them all.</p>\n<p>\n	Want more natural light in your home? We offer skylight and sun tunnel installation. It&#39;s a great way to lighten up a stair well, a bathroom or any other room in your house. Velux is the brand name HHI recommends and we stand by their top quality products.</p>\n','','wysiwyg-advanced',1),(30,'default',3,'<p>\n	We&#39;ve made it easy for you to contact us, simply fill out the form below. Someone will get back to you as quick as possible.</p>\n<p>\n	{{ contact:form name=&quot;text|required&quot; email=&quot;text|required|valid_email&quot; subject=&quot;dropdown|General Question|Quote Request|Feedback|Other&quot; message=&quot;textarea&quot; }}</p>\n<div>\n	<label for=\"contact_name\">Name:</label>{{ name }}</div>\n<div>\n	<label for=\"contact_email\">Email:</label>{{ email }}</div>\n<div>\n	<label for=\"contact_subject\">Subject:</label>{{ subject }}</div>\n<div>\n	<label for=\"contact_message\">Message:</label>{{ message }}</div>\n<div>\n	{{ /contact:form }}</div>\n','','wysiwyg-advanced',1),(31,'default',10,'<p>\n	Details on the array of services offered by HHI.</p>\n','','wysiwyg-advanced',1);
/*!40000 ALTER TABLE `default_page_chunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_page_layouts`
--

DROP TABLE IF EXISTS `default_page_layouts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_page_layouts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store shared page layouts & CSS';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_page_layouts`
--

LOCK TABLES `default_page_layouts` WRITE;
/*!40000 ALTER TABLE `default_page_layouts` DISABLE KEYS */;
INSERT INTO `default_page_layouts` VALUES (1,'Default','<h2>{{ page:title }}</h2>\n\n\n{{ page:body }}','','','default',1335229294),(2,'Homepage','<h2>{{ page:title }}</h2>\n{{ page:body }}','','','homepage.html',1335245779);
/*!40000 ALTER TABLE `default_page_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pages`
--

DROP TABLE IF EXISTS `default_pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT '0',
  `revision_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `layout_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='User Editable Pages';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_pages`
--

LOCK TABLES `default_pages` WRITE;
/*!40000 ALTER TABLE `default_pages` DISABLE KEYS */;
INSERT INTO `default_pages` VALUES (1,'home','Home','home',0,'1','2','','','','','',0,0,'live',1335229294,1335245802,'0',1,0),(2,'404','Page missing','404',0,'2','1',NULL,NULL,'','',NULL,0,0,'live',1335229294,1335229294,'',0,0),(3,'contact','Contact','contact',0,'3','1','','','','','',0,0,'live',1335229294,1337461694,'0',0,0),(4,'who-we-are','Who We Are','who-we-are',0,'1','1','','','','','',0,0,'draft',1335849294,1335849294,'0',0,1335849294),(5,'services-flooring','Flooring','services-flooring',0,'1','1','','','','','',0,0,'live',1335854895,1336460315,'0',0,1335854895),(6,'services-windows-and-doors','Windows and Doors','services-windows-and-doors',0,'1','1','','','','','',0,0,'live',1335854964,1335854964,'0',0,1335854964),(7,'services-exterior-siding','Exterior Siding','services-exterior-siding',0,'1','1','','','','','',0,0,'live',1335855019,1336461078,'0',0,1335855019),(8,'services-kitchens-and-baths','Kitchens and Baths','services-kitchens-and-baths',0,'1','1','','','','','',0,0,'live',1335855077,1337461295,'0',0,1335855077),(9,'services-roofing-and-skylights','Roofing and Skylights','services-roofing-and-skylights',0,'1','1','','','','','',0,0,'live',1335855132,1337461462,'0',0,1335855132),(10,'services','Services','services',0,'1','1','','','','','',0,0,'live',1337461778,1337461778,'0',0,1337461778);
/*!40000 ALTER TABLE `default_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_permissions`
--

DROP TABLE IF EXISTS `default_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains a list of modules that a group can access.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_permissions`
--

LOCK TABLES `default_permissions` WRITE;
/*!40000 ALTER TABLE `default_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_profiles`
--

DROP TABLE IF EXISTS `default_profiles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_profiles`
--

LOCK TABLES `default_profiles` WRITE;
/*!40000 ALTER TABLE `default_profiles` DISABLE KEYS */;
INSERT INTO `default_profiles` VALUES (1,1,'Admin Istrator','Admin','Istrator','','en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `default_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_redirects`
--

DROP TABLE IF EXISTS `default_redirects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request` (`from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_redirects`
--

LOCK TABLES `default_redirects` WRITE;
/*!40000 ALTER TABLE `default_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_settings`
--

DROP TABLE IF EXISTS `default_settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_gui` tinyint(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all sorts of settings for the admin to change';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_settings`
--

LOCK TABLES `default_settings` WRITE;
/*!40000 ALTER TABLE `default_settings` DISABLE KEYS */;
INSERT INTO `default_settings` VALUES ('activation_email','Activation Email','Send out an e-mail when a user signs up with an activation link. Disable this to let only admins activate accounts.','radio','1','','1=Enabled|0=Disabled',0,1,'users',963),('addons_upload','Addons Upload Permissions','Keeps mere admins from uploading addons by default','text','0','1','',1,0,'',0),('admin_force_https','Force HTTPS for Control Panel?','Allow only the HTTPS protocol when using the Control Panel?','radio','0','','1=Yes|0=No',1,1,'',0),('admin_theme','Control Panel Theme','Select the theme for the control panel.','','pyrocms','','func:get_themes',1,0,'',0),('akismet_api_key','Akismet API Key','Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.','text','','','',0,1,'integration',984),('auto_username','Auto Username','Create the username automatically, meaning users can skip making one on registration.','radio','1','','1=Enabled|0=Disabled',0,1,'users',1),('comment_markdown','Allow Markdown','Do you want to allow visitors to post comments using Markdown?','select','0','0','0=Text Only|1=Allow Markdown',1,1,'comments',966),('comment_order','Comment Order','Sort order in which to display comments.','select','ASC','ASC','ASC=Oldest First|DESC=Newest First',1,1,'comments',966),('contact_email','Contact E-mail','All e-mails from users, guests and the site will go to this e-mail address.','text','ts@daxiangroup.com','','',1,1,'email',983),('currency','Currency','The currency symbol for use on products, services, etc.','text','&pound;','','',1,1,'',995),('dashboard_rss','Dashboard RSS Feed','Link to an RSS feed that will be displayed on the dashboard.','text','http://feeds.feedburner.com/pyrocms-installed','','',0,1,'',992),('dashboard_rss_count','Dashboard RSS Items','How many RSS items would you like to display on the dashboard ? ','text','5','5','',1,1,'',991),('date_format','Date Format','How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.','text','Y-m-d','','',1,1,'',996),('default_theme','Default Theme','Select the theme you want users to see by default.','','default','hhi','func:get_themes',1,0,'',0),('enable_comments','Enable Comments','Enable comments.','radio','1','1','1=Enabled|0=Disabled',0,1,'comments',968),('enable_profiles','Enable profiles','Allow users to add and edit profiles.','radio','1','','1=Enabled|0=Disabled',1,1,'users',965),('files_cache','Files Cache','When outputting an image via site.com/files what shall we set the cache expiration for?','select','480','480','0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days',1,1,'files',989),('frontend_enabled','Site Status','Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenence','radio','1','','1=Open|0=Closed',1,1,'',990),('ga_email','Google Analytic E-mail','E-mail address used for Google Analytics, we need this to show the graph on the dashboard.','text','','tyler.a.schwartz@gmail.com','',0,1,'integration',986),('ga_password','Google Analytic Password','Google Analytics password. This is also needed this to show the graph on the dashboard.','password','','v3ryg00d','',0,1,'integration',985),('ga_profile','Google Analytic Profile ID','Profile ID for this website in Google Analytics.','text','','59019637','',0,1,'integration',987),('ga_tracking','Google Tracking Code','Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6','text','','UA-31135635-1','',0,1,'integration',988),('mail_protocol','Mail Protocol','Select desired email protocol.','select','mail','mail','mail=Mail|sendmail=Sendmail|smtp=SMTP',1,1,'email',980),('mail_sendmail_path','Sendmail Path','Path to server sendmail binary.','text','','','',0,1,'email',975),('mail_smtp_host','SMTP Host Name','The host name of your smtp server.','text','','','',0,1,'email',979),('mail_smtp_pass','SMTP Password','SMTP password.','password','','','',0,1,'email',978),('mail_smtp_port','SMTP Port','SMTP port number.','text','','','',0,1,'email',977),('mail_smtp_user','SMTP User Name','SMTP user name.','text','','','',0,1,'email',976),('meta_topic','Meta Topic','Two or three words describing this type of company/website.','text','Content Management','Home Improvements','',0,1,'',998),('moderate_comments','Moderate Comments','Force comments to be approved before they appear on the site.','radio','1','1','1=Enabled|0=Disabled',0,1,'comments',967),('records_per_page','Records Per Page','How many records should we show per page in the admin section?','select','25','','10=10|25=25|50=50|100=100',1,1,'',994),('registered_email','User Registered Email','Send a notification email to the contact e-mail when someone registers.','radio','1','','1=Enabled|0=Disabled',0,1,'users',962),('require_lastname','Require last names?','For some situations, a last name may not be required. Do you want to force users to enter one or not?','radio','1','','1=Required|0=Optional',1,1,'users',964),('rss_feed_items','Feed item count','How many items should we show in RSS/blog feeds?','select','25','','10=10|25=25|50=50|100=100',1,1,'',993),('server_email','Server E-mail','All e-mails to users will come from this e-mail address.','text','admin@localhost','','',1,1,'email',981),('site_lang','Site Language','The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.','select','en','en','func:get_supported_lang',1,1,'',997),('site_name','Site Name','The name of the website for page titles and for use around the site.','text','Un-named Website','Harry\'s Home Improvements','',1,1,'',1000),('site_public_lang','Public Languages','Which are the languages really supported and offered on the front-end of your website?','checkbox','en','en','func:get_supported_lang',1,1,'',996),('site_slogan','Site Slogan','The slogan of the website for page titles and for use around the site.','text','','Everything from the roof down!','',0,1,'',999),('twitter_cache','Cache time','How many minutes should your Tweets be stored?','text','300','','',0,1,'twitter',969),('twitter_feed_count','Feed Count','How many tweets should be returned to the Twitter feed block?','text','5','','',0,1,'twitter',972),('twitter_username','Username','Twitter username.','text','','','',0,1,'twitter',973),('unavailable_message','Unavailable Message','When the site is turned off or there is a major problem, this message will show to users.','textarea','Sorry, this website is currently unavailable.','','',0,1,'',989),('version','Version','','text','1.0','2.0.3','',0,0,'',0);
/*!40000 ALTER TABLE `default_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_theme_options`
--

DROP TABLE IF EXISTS `default_theme_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_theme_options` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores theme options.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_theme_options`
--

LOCK TABLES `default_theme_options` WRITE;
/*!40000 ALTER TABLE `default_theme_options` DISABLE KEYS */;
INSERT INTO `default_theme_options` VALUES (1,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'default'),(2,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'default'),(3,'cufon_enabled','Use Cufon','Would you like to use Cufon for titles?','radio','yes','yes','yes=Yes|no=No',1,'default'),(4,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(5,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(6,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(7,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(8,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'hhi'),(9,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'hhi'),(10,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'hhi'),(11,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'hhi');
/*!40000 ALTER TABLE `default_theme_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_users`
--

DROP TABLE IF EXISTS `default_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_users`
--

LOCK TABLES `default_users` WRITE;
/*!40000 ALTER TABLE `default_users` DISABLE KEYS */;
INSERT INTO `default_users` VALUES (1,'ts@daxiangroup.com','aefdfefb0ea8562154a93ca86e7b59f1c767814d','39bb7',1,'',1,'',1335229292,1337461236,'admin',NULL,NULL);
/*!40000 ALTER TABLE `default_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_variables`
--

DROP TABLE IF EXISTS `default_variables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_variables`
--

LOCK TABLES `default_variables` WRITE;
/*!40000 ALTER TABLE `default_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_areas`
--

DROP TABLE IF EXISTS `default_widget_areas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_widget_areas`
--

LOCK TABLES `default_widget_areas` WRITE;
/*!40000 ALTER TABLE `default_widget_areas` DISABLE KEYS */;
INSERT INTO `default_widget_areas` VALUES (1,'sidebar','Sidebar');
/*!40000 ALTER TABLE `default_widget_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_instances`
--

DROP TABLE IF EXISTS `default_widget_instances`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_widget_instances`
--

LOCK TABLES `default_widget_instances` WRITE;
/*!40000 ALTER TABLE `default_widget_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widget_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widgets`
--

DROP TABLE IF EXISTS `default_widgets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(5) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `default_widgets`
--

LOCK TABLES `default_widgets` WRITE;
/*!40000 ALTER TABLE `default_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-19 17:19:06
