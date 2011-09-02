-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2010 at 10:16 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `bible_commentary_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--
-- Creation: Jun 04, 2010 at 07:19 PM
-- Last update: Jun 04, 2010 at 11:39 PM
--
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` tinytext,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entry`
--
-- Creation: Jun 04, 2010 at 07:07 PM
--
DROP TABLE IF EXISTS `tbl_entry`;
CREATE TABLE IF NOT EXISTS `tbl_entry` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_verse_id` int(10) unsigned DEFAULT NULL,
  `end_verse_id` int(10) unsigned DEFAULT NULL,
  `entry_author_id` int(11) NOT NULL,
  `heading` varchar(32) DEFAULT NULL,
  `entry_text` text NOT NULL,
  `start_word` varchar(32) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `ref_author` varchar(100) DEFAULT NULL,
  `ref_start_page_num` int(10) unsigned DEFAULT NULL,
  `ref_end_page_num` int(10) unsigned DEFAULT NULL,
  `ref_source` varchar(100) DEFAULT NULL,
  `date_added` date NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `tbl_entry`:
--   `end_verse_id`
--       `tbl_bible_verse` -> `verse_id`
--   `entry_author_id`
--       `tbl_users` -> `id`
--   `start_verse_id`
--       `tbl_bible_verse` -> `verse_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entry_category`
--
-- Creation: Jun 04, 2010 at 06:42 PM
--
DROP TABLE IF EXISTS `tbl_entry_category`;
CREATE TABLE IF NOT EXISTS `tbl_entry_category` (
  `entry_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
ALTER TABLE `tbl_entry_category` ADD UNIQUE (
`entry_id` ,
`category_id`
);
--
-- RELATIONS FOR TABLE `tbl_entry_category`:
--   `category_id`
--       `tbl_category` -> `category_id`
--   `entry_id`
--       `tbl_entry` -> `entry_id`
--

-- --------------------------------------------------------

