-- --------------------------------------------------------
-- Host:                         192.168.1.25
-- Versión del servidor:         5.7.22-0ubuntu0.16.04.1 - (Ubuntu)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla dm_db.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.categories: ~4 rows (aproximadamente)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `icon`) VALUES
	(1, 'announcement', NULL),
	(2, 'article', NULL),
	(3, 'announcement2', NULL),
	(4, 'announcement3', NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para vista dm_db.category_usage
DROP VIEW IF EXISTS `category_usage`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `category_usage` (
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`count` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla dm_db.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.comments: ~4 rows (aproximadamente)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `user_id`, `comment`) VALUES
	(1, 1, 'great'),
	(2, 2, 'fantastic'),
	(3, 1, 'thank you'),
	(4, 2, 'awesome');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.contributors
DROP TABLE IF EXISTS `contributors`;
CREATE TABLE IF NOT EXISTS `contributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_contributors_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.contributors: ~2 rows (aproximadamente)
DELETE FROM `contributors`;
/*!40000 ALTER TABLE `contributors` DISABLE KEYS */;
INSERT INTO `contributors` (`id`, `user_id`, `registration_date`) VALUES
	(1, 1, '2018-07-03 15:31:40'),
	(2, 2, '2018-07-03 15:31:40');
/*!40000 ALTER TABLE `contributors` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.likes
DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.likes: ~4 rows (aproximadamente)
DELETE FROM `likes`;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `user_id`, `create`) VALUES
	(1, 1, '2018-07-03 14:35:42'),
	(2, 2, '2018-07-03 14:35:42'),
	(3, 1, '2018-07-03 14:35:42'),
	(4, 2, '2018-07-03 14:35:42');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.pictures
DROP TABLE IF EXISTS `pictures`;
CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` mediumtext NOT NULL,
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.pictures: ~2 rows (aproximadamente)
DELETE FROM `pictures`;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` (`id`, `title`, `description`, `url`, `create`, `change`) VALUES
	(1, 'funny', '', 'http://digitalspyuk.cdnds.net/15/47/1600x800/landscape-1447754794-harrison-ford-blade-runner.jpg', '2018-07-02 19:08:33', '2018-07-02 19:53:06'),
	(2, 'important', '', 'http://www.blastr.com/sites/blastr/files/back-to-the-future-part-ii-original.jpg', '2018-07-02 19:08:33', '2018-07-02 19:53:14');
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `intro` varchar(400) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dm_db.posts: ~3 rows (aproximadamente)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `user_id`, `title`, `intro`, `content`) VALUES
	(1, 1, 'titulo', 'intrudccion', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi tempora, nulla nesciunt a laudantium adipisci labore veritatis rerum dolor iste aperiam, alias at dolorem nobis in facilis atque ipsa obcaecati. Natus voluptatem numquam cumque ullam harum pr'),
	(2, 2, 'It works!', '1', 'It works!'),
	(4, 1, 'It works!s', '1', 's');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_categories
DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE IF NOT EXISTS `post_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_categories_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_categories: ~4 rows (aproximadamente)
DELETE FROM `post_categories`;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` (`id`, `post_id`, `category_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 2, 2);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_comments
DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE IF NOT EXISTS `post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_comments: ~4 rows (aproximadamente)
DELETE FROM `post_comments`;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;
INSERT INTO `post_comments` (`id`, `post_id`, `comment_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 2, 2);
/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_contributors
DROP TABLE IF EXISTS `post_contributors`;
CREATE TABLE IF NOT EXISTS `post_contributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contributor_id` (`contributor_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_contributors_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_contributors_ibfk_2` FOREIGN KEY (`contributor_id`) REFERENCES `contributors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_contributors: ~4 rows (aproximadamente)
DELETE FROM `post_contributors`;
/*!40000 ALTER TABLE `post_contributors` DISABLE KEYS */;
INSERT INTO `post_contributors` (`id`, `post_id`, `contributor_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 4, 1);
/*!40000 ALTER TABLE `post_contributors` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_likes
DROP TABLE IF EXISTS `post_likes`;
CREATE TABLE IF NOT EXISTS `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `like_id` (`like_id`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`like_id`) REFERENCES `likes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_likes: ~4 rows (aproximadamente)
DELETE FROM `post_likes`;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` (`id`, `post_id`, `like_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 4, 1);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_pictures
DROP TABLE IF EXISTS `post_pictures`;
CREATE TABLE IF NOT EXISTS `post_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `picture_id` (`picture_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_pictures_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_pictures_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_pictures: ~4 rows (aproximadamente)
DELETE FROM `post_pictures`;
/*!40000 ALTER TABLE `post_pictures` DISABLE KEYS */;
INSERT INTO `post_pictures` (`id`, `post_id`, `picture_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 4, 1);
/*!40000 ALTER TABLE `post_pictures` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_tags
DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_tags: ~4 rows (aproximadamente)
DELETE FROM `post_tags`;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 2, 2);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.post_videos
DROP TABLE IF EXISTS `post_videos`;
CREATE TABLE IF NOT EXISTS `post_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_videos_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.post_videos: ~1 rows (aproximadamente)
DELETE FROM `post_videos`;
/*!40000 ALTER TABLE `post_videos` DISABLE KEYS */;
INSERT INTO `post_videos` (`id`, `post_id`, `video_id`) VALUES
	(5, 1, 3);
/*!40000 ALTER TABLE `post_videos` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.tags: ~2 rows (aproximadamente)
DELETE FROM `tags`;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`) VALUES
	(1, 'funny'),
	(2, 'important');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Volcando estructura para vista dm_db.tag_usage
DROP VIEW IF EXISTS `tag_usage`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `tag_usage` (
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`count` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla dm_db.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `location` point DEFAULT NULL,
  `mail` varchar(150) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla dm_db.users: ~2 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `location`, `mail`, `first_name`, `last_name`, `address`) VALUES
	(1, 'user1', 'pass1', NULL, '', '', '', ''),
	(2, 'user2', 'pass2', NULL, '', '', '', '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.user_comments
DROP TABLE IF EXISTS `user_comments`;
CREATE TABLE IF NOT EXISTS `user_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `user_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_comments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.user_comments: ~2 rows (aproximadamente)
DELETE FROM `user_comments`;
/*!40000 ALTER TABLE `user_comments` DISABLE KEYS */;
INSERT INTO `user_comments` (`id`, `user_id`, `comment_id`) VALUES
	(1, 1, 2),
	(2, 2, 1);
/*!40000 ALTER TABLE `user_comments` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.user_pictures
DROP TABLE IF EXISTS `user_pictures`;
CREATE TABLE IF NOT EXISTS `user_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `picture_id` (`picture_id`),
  CONSTRAINT `FK_user_pictures_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_pictures_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.user_pictures: ~2 rows (aproximadamente)
DELETE FROM `user_pictures`;
/*!40000 ALTER TABLE `user_pictures` DISABLE KEYS */;
INSERT INTO `user_pictures` (`id`, `user_id`, `picture_id`) VALUES
	(1, 1, 2),
	(2, 2, 1);
/*!40000 ALTER TABLE `user_pictures` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.user_posts
DROP TABLE IF EXISTS `user_posts`;
CREATE TABLE IF NOT EXISTS `user_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `user_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_posts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.user_posts: ~2 rows (aproximadamente)
DELETE FROM `user_posts`;
/*!40000 ALTER TABLE `user_posts` DISABLE KEYS */;
INSERT INTO `user_posts` (`id`, `user_id`, `post_id`) VALUES
	(1, 1, 2),
	(2, 2, 1);
/*!40000 ALTER TABLE `user_posts` ENABLE KEYS */;

-- Volcando estructura para tabla dm_db.videos
DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` mediumtext NOT NULL,
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla dm_db.videos: ~1 rows (aproximadamente)
DELETE FROM `videos`;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` (`id`, `title`, `description`, `url`, `create`, `change`) VALUES
	(3, 'Video1', 'Desc Video #1', '#', '2018-07-04 00:05:45', '2018-07-04 00:05:45');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

-- Volcando estructura para vista dm_db.category_usage
DROP VIEW IF EXISTS `category_usage`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `category_usage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dm_user`@`%` SQL SECURITY DEFINER VIEW `category_usage` AS select `categories`.`name` AS `name`,count(`categories`.`name`) AS `count` from (`categories` join `post_categories`) where (`categories`.`id` = `post_categories`.`category_id`) group by `categories`.`name` order by `count` desc,`categories`.`name`;

-- Volcando estructura para vista dm_db.tag_usage
DROP VIEW IF EXISTS `tag_usage`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `tag_usage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`dm_user`@`%` SQL SECURITY DEFINER VIEW `tag_usage` AS select `tags`.`name` AS `name`,count(`tags`.`name`) AS `count` from (`tags` join `post_tags`) where (`tags`.`id` = `post_tags`.`tag_id`) group by `tags`.`name` order by `count` desc,`tags`.`name`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
