CREATE DATABASE `dbcompare_myisam`;

USE dbcompare_myisam;

CREATE TABLE `banners` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

LOAD DATA INFILE '/vagrant/dataset/banners.csv' INTO TABLE banners
    COLUMNS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES (`content`, `enabled`) ;

CREATE TABLE `keywords` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `banner_id` bigint(20) NOT NULL DEFAULT 0,
  `word` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `banner_id`(`banner_id`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

LOAD DATA INFILE '/vagrant/dataset/keywords.csv' INTO TABLE keywords
    COLUMNS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES (`banner_id`, `word`) ;

CREATE TABLE `adclicks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pageview_id` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `banner_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `timestamps`(`created_at`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

LOAD DATA INFILE '/vagrant/dataset/adclicks.csv' INTO TABLE adclicks
    COLUMNS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES (`pageview_id`, `user_id`, `banner_id`, `created_at`) ;

CREATE TABLE `pageviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `platform` varchar(10) NOT NULL DEFAULT '',
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

LOAD DATA INFILE '/vagrant/dataset/pageviews.csv' INTO TABLE pageviews
    COLUMNS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES (`user_id`, `platform`, `created_at`) ;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) NOT NULL DEFAULT '',
  `last_name` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(10) NOT NULL DEFAULT '',
  `location` varchar(10) NOT NULL DEFAULT '',
  `age` tinyint(2) NOT NULL DEFAULT 0,
  `register_date` datetime NULL DEFAULT NULL,
  `gender` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

LOAD DATA INFILE '/vagrant/dataset/users.csv' INTO TABLE users
    COLUMNS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES (`first_name`, `last_name`, `email`, `location`, `age`, `register_date`, `gender`) ;
