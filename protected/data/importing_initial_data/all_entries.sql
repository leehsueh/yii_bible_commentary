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


-- END TABLE CREATION --

INSERT INTO tbl_category (name) VALUES ('Form');
INSERT INTO tbl_category (name) VALUES ('Structure');
INSERT INTO tbl_category (name) VALUES ('Interpretation');
INSERT INTO tbl_category (name) VALUES ('cf');
INSERT INTO tbl_category (name) VALUES ('Style');
INSERT INTO tbl_category (name) VALUES ('Redaction');
INSERT INTO tbl_category (name) VALUES ('Semantics');
INSERT INTO tbl_category (name) VALUES ('Syntax');
INSERT INTO tbl_category (name) VALUES ('Text');
INSERT INTO tbl_category (name) VALUES ('Source');
INSERT INTO tbl_category (name) VALUES ('Word');
INSERT INTO tbl_category (name) VALUES ('Topic');
INSERT INTO tbl_category (name) VALUES ('Historical');

-- END CATEGORIES INSERTION --


-- BEGIN INSERTION FOR Deuteronomy --

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,1,'816404569','2010-06-07',25,'Attribution of utterances in Deuteronomy');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Attribution of utterances in Deuteronomy'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5,'816404569','2010-06-07',29,'Deuteronomy emphasizes a distinction between the word of Moses and the word of the narrator');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Deuteronomy emphasizes a distinction between the word of Moses and the word of the narrator'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,3,'816404569','2010-06-07',31,'The narrator\'s subtle but powerful claim to his audience to be the sole interpreter of Moses\' words');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The narrator\'s subtle but powerful claim to his audience to be the sole interpreter of Moses\' words'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (41,'Polzin',1,5,'816404569','2010-06-07',40,'Frame-breakers as author\'s device');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Frame-breakers as author\'s device'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Frame-breakers as author\'s device'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4899,5045,1,'816404569','2010-06-07',36,'The first address of Moses (1:6-4:40)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=4899 AND end_verse_id=5045 AND entry_text='The first address of Moses (1:6-4:40)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4894,5054,3,'816404569','2010-06-07',32,'Switching back and forth between \"that day\" and \"this day\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=4894 AND end_verse_id=5054 AND entry_text='Switching back and forth between \"that day\" and \"this day\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4894,5054,5,'816404569','2010-06-07',40,'The switch from direct to indirect speech in chapter 4');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=4894 AND end_verse_id=5054 AND entry_text='The switch from direct to indirect speech in chapter 4'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5006,5054,5,'816404569','2010-06-07',41,'Chapter 4 divides into two evaluative sections');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5006 AND end_verse_id=5054 AND entry_text='Chapter 4 divides into two evaluative sections'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,2,'816404569','2010-06-07',43,'The bracketing of utterances of mercy and grace with neutralizing statements of a retributive nature is a consistent pattern in the Book of Deuteronomy');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The bracketing of utterances of mercy and grace with neutralizing statements of a retributive nature is a consistent pattern in the Book of Deuteronomy'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5680,'816404569','2010-06-07',43,'The second address of Moses (5:1b-28:68)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5680 AND entry_text='The second address of Moses (5:1b-28:68)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5045,5054,4,'816404569','2010-06-07',43,'Two voices conjoined here in the final verse of Moses\' first address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5045 AND end_verse_id=5054 AND entry_text='Two voices conjoined here in the final verse of Moses\' first address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,'816404569','2010-06-07',43,'Interplay of two voices essential to the semantic authority that unifies Deuteronomy and the entire Deuteronomic History');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Interplay of two voices essential to the semantic authority that unifies Deuteronomy and the entire Deuteronomic History'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5046,5048,2,'816404569','2010-06-07',43,'4:41-43 provides a concluding frame to Moses\' first address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5046 AND end_verse_id=5048 AND entry_text='4:41-43 provides a concluding frame to Moses\' first address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5046 AND end_verse_id=5048 AND entry_text='4:41-43 provides a concluding frame to Moses\' first address'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5049,5055,2,'816404569','2010-06-07',43,'4:44-5:1a constitutes the introductory frame to Moses\' second, main address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5049 AND end_verse_id=5055 AND entry_text='4:44-5:1a constitutes the introductory frame to Moses\' second, main address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5049 AND end_verse_id=5055 AND entry_text='4:44-5:1a constitutes the introductory frame to Moses\' second, main address'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5242,5582,1,'816404569','2010-06-07',43,'12:1-26:15 is the so called Deuteronomic law-code');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5242 AND end_verse_id=5582 AND entry_text='12:1-26:15 is the so called Deuteronomic law-code'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5242 AND end_verse_id=5582 AND entry_text='12:1-26:15 is the so called Deuteronomic law-code'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5242,5582,5,'816404569','2010-06-07',57,'The lawcode of chapters 12-26 has Moses both reporting and interpreting God\'s words');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5242 AND end_verse_id=5582 AND entry_text='The lawcode of chapters 12-26 has Moses both reporting and interpreting God\'s words'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5059,5,'816404569','2010-06-07',45,'Alternation between \"I vs. you\" and \"our/us\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5059 AND entry_text='Alternation between \"I vs. you\" and \"our/us\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5241,5,'816404569','2010-06-07',47,'5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5241 AND entry_text='5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5583,5680,5,'816404569','2010-06-07',47,'5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5583 AND end_verse_id=5680 AND entry_text='5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5241,2,'816404569','2010-06-07',47,'5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5241 AND entry_text='5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5583,5680,2,'816404569','2010-06-07',47,'5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5583 AND end_verse_id=5680 AND entry_text='5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,3,'816404569','2010-06-07',48,'The over-all composition of Deuteronomy is one in which we read how Moses is described as declaring and interpreting the word of God as a panoramic preview of how the Deuteronomic narrator will describe and interpret the word of Moses in Joshua-2 Kings');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The over-all composition of Deuteronomy is one in which we read how Moses is described as declaring and interpreting the word of God as a panoramic preview of how the Deuteronomic narrator will describe and interpret the word of Moses in Joshua-2 Kings'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The over-all composition of Deuteronomy is one in which we read how Moses is described as declaring and interpreting the word of God as a panoramic preview of how the Deuteronomic narrator will describe and interpret the word of Moses in Joshua-2 Kings'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5241,2,'816404569','2010-06-07',49,'The lawcode overwhelmingly prfers the \"I vs. you\" form');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5241 AND entry_text='The lawcode overwhelmingly prfers the \"I vs. you\" form'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5680,4,'816404569','2010-06-07',49,'The predominant psychological viewpoint of the second address is set up by the content of chapter 5');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5680 AND entry_text='The predominant psychological viewpoint of the second address is set up by the content of chapter 5'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5680,4,'816404569','2010-06-07',49,'The second address\'s temporal composition is predominantly future-oriented');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5680 AND entry_text='The second address\'s temporal composition is predominantly future-oriented'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (52,'Polzin',1,5055,5680,5,'816404569','2010-06-07',50,'Paradox concerning Moses\' status in the second address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5680 AND entry_text='Paradox concerning Moses\' status in the second address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4894,5241,1,'816404569','2010-06-07',51,'Moses\' words before chapter 12 comprise what Moses said to prepare the people to hear the word of God contained within the lawcode');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=4894 AND end_verse_id=5241 AND entry_text='Moses\' words before chapter 12 comprise what Moses said to prepare the people to hear the word of God contained within the lawcode'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5587,5852,1,'816404569','2010-06-07',51,'Moses\' words after chapter 26 comprise what Moses said to spell out form them the implications of the word of God contained within the lawcode');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5587 AND end_verse_id=5852 AND entry_text='Moses\' words after chapter 26 comprise what Moses said to spell out form them the implications of the word of God contained within the lawcode'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5075,5085,1,'816404569','2010-06-07',51,'5:21-31 comprises Moses\' account of how God commissioned him to speak the central words of the book, the \"Mosaic\" lawcode of chapters 12-26');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5075 AND end_verse_id=5085 AND entry_text='5:21-31 comprises Moses\' account of how God commissioned him to speak the central words of the book, the \"Mosaic\" lawcode of chapters 12-26'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5082,5085,1,'816404569','2010-06-07',51,'5:28-31 are the authenticating words of God that show the basis for the unique teaching role Moses enjoys in the Book of Deuteronomy');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5082 AND end_verse_id=5085 AND entry_text='5:28-31 are the authenticating words of God that show the basis for the unique teaching role Moses enjoys in the Book of Deuteronomy'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5087,1,'816404569','2010-06-07',51,'Deuteronomy 5 contains Moses\' account of the vision that authenticates the central role he plays in the book');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5087 AND entry_text='Deuteronomy 5 contains Moses\' account of the vision that authenticates the central role he plays in the book'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5680,2,'816404569','2010-06-07',51,'Utterances advancing Israel\'s unique status are also abundantly present in the second address');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5055 AND end_verse_id=5680 AND entry_text='Utterances advancing Israel\'s unique status are also abundantly present in the second address'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5162,5163,3,'816404569','2010-06-07',52,'Challenge to the many utterances about Israel\'s unique status');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5162 AND end_verse_id=5163 AND entry_text='Challenge to the many utterances about Israel\'s unique status'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5402,5403,3,'816404569','2010-06-07',52,'Direct challenge to Moses\' unique stats as teacher of Israel');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5402 AND end_verse_id=5403 AND entry_text='Direct challenge to Moses\' unique stats as teacher of Israel'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5273,5273,5,'816404569','2010-06-07',59,'What Moses could do with God\'s word, man may not do with Moses\' word, which itself has become indistinguishable from God\'s word');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5273 AND end_verse_id=5273 AND entry_text='What Moses could do with God\'s word, man may not do with Moses\' word, which itself has become indistinguishable from God\'s word'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5273 AND end_verse_id=5273 AND entry_text='What Moses could do with God\'s word, man may not do with Moses\' word, which itself has become indistinguishable from God\'s word'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (61,'Polzin',1,5401,5404,4,'816404569','2010-06-07',60,'Compare with 5:23-31. Moses appeals to the same occasion and to the same divine utterance to authenticate both his own prophetic role and that of \"a prophet like him.\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5401 AND end_verse_id=5404 AND entry_text='Compare with 5:23-31. Moses appeals to the same occasion and to the same divine utterance to authenticate both his own prophetic role and that of \"a prophet like him.\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5401 AND end_verse_id=5404 AND entry_text='Compare with 5:23-31. Moses appeals to the same occasion and to the same divine utterance to authenticate both his own prophetic role and that of \"a prophet like him.\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (64,'Polzin',1,5273,5273,5,'816404569','2010-06-07',63,'The command of this verse is a hermeneutic anomaly within Deuteronomy');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5273 AND end_verse_id=5273 AND entry_text='The command of this verse is a hermeneutic anomaly within Deuteronomy'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5681,5735,1,'816404569','2010-06-07',69,'The third address of Moses (29:1-31:6)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5681 AND end_verse_id=5735 AND entry_text='The third address of Moses (29:1-31:6)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5730,5759,2,'816404569','2010-06-07',69,'Frame-breakers as author\'s device');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5730 AND end_verse_id=5759 AND entry_text='Frame-breakers as author\'s device'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5681,5735,3,'816404569','2010-06-07',69,'This third address concentrates on a far distant future that is explicitly exilic');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5681 AND end_verse_id=5735 AND entry_text='This third address concentrates on a far distant future that is explicitly exilic'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5681,5735,2,'816404569','2010-06-07',70,'It is extremely difficult to distinguish between the voice of Moses and the voice of the narrator');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5681 AND end_verse_id=5735 AND entry_text='It is extremely difficult to distinguish between the voice of Moses and the voice of the narrator'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5681,5735,2,'816404569','2010-06-07',70,'The emphasis is on what Israel has to do to regain the land (as opposed to remain in the land)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5681 AND end_verse_id=5735 AND entry_text='The emphasis is on what Israel has to do to regain the land (as opposed to remain in the land)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (71,'Polzin',1,5681,5735,2,'816404569','2010-06-07',70,'In the third address, \"your fathers\" refers to those Israelites who had lived in the land from the occupation to the fall of Jerusalem');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5681 AND end_verse_id=5735 AND entry_text='In the third address, \"your fathers\" refers to those Israelites who had lived in the land from the occupation to the fall of Jerusalem'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5736,5840,1,'816404569','2010-06-07',71,'The collection of Moses\' final sayings (31:7-33:29)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5736 AND end_verse_id=5840 AND entry_text='The collection of Moses\' final sayings (31:7-33:29)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5736,5840,3,'816404569','2010-06-07',71,'The distinction between the \"then\" of the hero and the \"now\" of the narrator, which had begun to dissolve in the last section, now undergoes additional dissolution');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5736 AND end_verse_id=5840 AND entry_text='The distinction between the \"then\" of the hero and the \"now\" of the narrator, which had begun to dissolve in the last section, now undergoes additional dissolution'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (72,'Polzin',1,5845,5852,3,'816404569','2010-06-07',71,'The final composition irony of the book is that the Deuteronmist uses the basic device of \"reported word of God → account of its precise fulfillment\" against Moses himself');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5845 AND end_verse_id=5852 AND entry_text='The final composition irony of the book is that the Deuteronmist uses the basic device of \"reported word of God → account of its precise fulfillment\" against Moses himself'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5684,5709,2,'816404569','2010-06-07',119,'Moses is referring to thhe lack of faith, mistrust, and disobedience of Israel already discussed in Deut 9-10');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5684 AND end_verse_id=5709 AND entry_text='Moses is referring to thhe lack of faith, mistrust, and disobedience of Israel already discussed in Deut 9-10'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5684 AND end_verse_id=5709 AND entry_text='Moses is referring to thhe lack of faith, mistrust, and disobedience of Israel already discussed in Deut 9-10'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);


-- END ENTRIES INSERTION FOR Deuteronomy--


-- BEGIN INSERTION FOR Joshua --

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,1,'816404569','2010-06-07',73,'Joshua and the remaining books of the Deuteronomic History are predominantly narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Joshua and the remaining books of the Deuteronomic History are predominantly narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,1,'816404569','2010-06-07',73,'3-part division of the text');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='3-part division of the text'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5853,5870,3,'816404569','2010-06-07',75,'Nothing happens except words in this chapter');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5853 AND end_verse_id=5870 AND entry_text='Nothing happens except words in this chapter'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5855,5857,5,'816404569','2010-06-07',75,'1:3-5a is almost a literal rendering of a part of Moses\' second address preceding the lawcode: Deut 11:24, 25');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5855 AND end_verse_id=5857 AND entry_text='1:3-5a is almost a literal rendering of a part of Moses\' second address preceding the lawcode: Deut 11:24, 25'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (76,'Polzin',1,5857,5859,5,'816404569','2010-06-07',75,'1:5c-7a is very close to Moses\' words to Joshua in Deut 31:7-8');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5857 AND end_verse_id=5859 AND entry_text='1:5c-7a is very close to Moses\' words to Joshua in Deut 31:7-8'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5865,5867,5,'816404569','2010-06-07',77,'Almost identical in content with Deut 3:18-20, but contains important phraseological differences that help us see the narrator\'s role more clearly');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5865 AND end_verse_id=5867 AND entry_text='Almost identical in content with Deut 3:18-20, but contains important phraseological differences that help us see the narrator\'s role more clearly'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5865 AND end_verse_id=5867 AND entry_text='Almost identical in content with Deut 3:18-20, but contains important phraseological differences that help us see the narrator\'s role more clearly'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (79,'Polzin',1,5865,5867,5,'816404569','2010-06-07',78,'The identity of the land-giver shifts twice from the LORD to Moses');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5865 AND end_verse_id=5867 AND entry_text='The identity of the land-giver shifts twice from the LORD to Moses'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5853,5870,2,'816404569','2010-06-07',79,'The theme of promise often repeats itself in this chapter');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5853 AND end_verse_id=5870 AND entry_text='The theme of promise often repeats itself in this chapter'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5853,6155,1,'816404569','2010-06-07',80,'The first section of Joshua (1-12): How Joshua and Israel fulfilled the commands of the LORD');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5853 AND end_verse_id=6155 AND entry_text='The first section of Joshua (1-12): How Joshua and Israel fulfilled the commands of the LORD'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5853 AND end_verse_id=6155 AND entry_text='The first section of Joshua (1-12): How Joshua and Israel fulfilled the commands of the LORD'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5944,5950,3,'816404569','2010-06-07',80,'First of three instances of divine utterances which interpret or apply an existing authoritative word');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5944 AND end_verse_id=5950 AND entry_text='First of three instances of divine utterances which interpret or apply an existing authoritative word'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5988,5989,3,'816404569','2010-06-07',81,'Second of three instances of divine utterances which interpret or apply an existing authoritative word');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5988 AND end_verse_id=5989 AND entry_text='Second of three instances of divine utterances which interpret or apply an existing authoritative word'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6005,6038,3,'816404569','2010-06-07',81,'Third of three instances of divine utterances which interpret or apply an existing authoritative word');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6005 AND end_verse_id=6038 AND entry_text='Third of three instances of divine utterances which interpret or apply an existing authoritative word'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (82,'Polzin',1,6005,6038,5,'816404569','2010-06-07',81,'God\'s words here are in direct conflict with the Mosaic rules for holy war found in Deut 20:15-18');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6005 AND end_verse_id=6038 AND entry_text='God\'s words here are in direct conflict with the Mosaic rules for holy war found in Deut 20:15-18'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6005 AND end_verse_id=6038 AND entry_text='God\'s words here are in direct conflict with the Mosaic rules for holy war found in Deut 20:15-18'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (89,'Polzin',1,5871,5894,5,'816404569','2010-06-07',88,'The Rahab story is the temporal preview of the significance of the Israelite occupation');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5871 AND end_verse_id=5894 AND entry_text='The Rahab story is the temporal preview of the significance of the Israelite occupation'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (93,'Polzin',1,5895,5936,5,'816404569','2010-06-07',92,'Josh 3:1-51 is the first occurrence of an especially important framing device in the book: the liturgical narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5895 AND end_verse_id=5936 AND entry_text='Josh 3:1-51 is the first occurrence of an especially important framing device in the book: the liturgical narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,3,'816404569','2010-06-07',93,'The literary structure of Joshua');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The literary structure of Joshua'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The literary structure of Joshua'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5951,5977,1,'816404569','2010-06-07',93,'6:1-27: A cultic narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5951 AND end_verse_id=5977 AND entry_text='6:1-27: A cultic narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6033,6038,1,'816404569','2010-06-07',93,'8:30-35: A cultic narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6033 AND end_verse_id=6038 AND entry_text='8:30-35: A cultic narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6156,6427,1,'816404569','2010-06-07',93,'Chapters 13-21: A cultic narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6156 AND end_verse_id=6427 AND entry_text='Chapters 13-21: A cultic narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6478,6505,1,'816404569','2010-06-07',94,'24:1-20: A cultic narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6478 AND end_verse_id=6505 AND entry_text='24:1-20: A cultic narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5895,5911,2,'816404569','2010-06-07',95,'Chapter 3 consists of the first episode in the story');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5895 AND end_verse_id=5911 AND entry_text='Chapter 3 consists of the first episode in the story'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5912,5919,2,'816404569','2010-06-07',95,'4:1-8 narrates the second episode in the story');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5912 AND end_verse_id=5919 AND entry_text='4:1-8 narrates the second episode in the story'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5905,5906,3,'816404569','2010-06-07',95,'3:11-12 provides a literary link between the two episodes');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5905 AND end_verse_id=5906 AND entry_text='3:11-12 provides a literary link between the two episodes'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5920,5925,4,'816404569','2010-06-07',95,'4:9-12 is the third episode in the story');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5920 AND end_verse_id=5925 AND entry_text='4:9-12 is the third episode in the story'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5926,5929,2,'816404569','2010-06-07',96,'4:15-18 comprises the fourth episode of the story');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5926 AND end_verse_id=5929 AND entry_text='4:15-18 comprises the fourth episode of the story'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5930,5936,2,'816404569','2010-06-07',96,'4:19-5:1 is the fifth episode in the story');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5930 AND end_verse_id=5936 AND entry_text='4:19-5:1 is the fifth episode in the story'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (98,'Polzin',1,5911,5911,5,'816404569','2010-06-07',97,'Significance of the sudden shift to a narratologically rare participal form');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5911 AND end_verse_id=5911 AND entry_text='Significance of the sudden shift to a narratologically rare participal form'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5921,5935,5,'816404569','2010-06-07',98,'The focus shifts from movement to the absence of movement, from change to immobility');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5921 AND end_verse_id=5935 AND entry_text='The focus shifts from movement to the absence of movement, from change to immobility'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5905,5906,2,'816404569','2010-06-07',98,'3:11-12, as the literary prefiguring of the next episode, emphasizes by the participle the immobility of the Ark and its priests');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5905 AND end_verse_id=5906 AND entry_text='3:11-12, as the literary prefiguring of the next episode, emphasizes by the participle the immobility of the Ark and its priests'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (100,'Polzin',1,5914,5935,5,'816404569','2010-06-07',99,'Joshua is to speak these words while in the middle of the Jordan');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5914 AND end_verse_id=5935 AND entry_text='Joshua is to speak these words while in the middle of the Jordan'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (101,'Polzin',1,5916,5935,5,'816404569','2010-06-07',99,'Shift in spatial perspective');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5916 AND end_verse_id=5935 AND entry_text='Shift in spatial perspective'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (100,'Polzin',1,5919,5935,4,'816404569','2010-06-07',99,'Here the narrative has switched back to the spatial position in the middle of the Jordan');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5919 AND end_verse_id=5935 AND entry_text='Here the narrative has switched back to the spatial position in the middle of the Jordan'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5895,5936,4,'816404569','2010-06-07',101,'Episodes 1 to 3 (3:1-4:14) are narrated from a vantage point outside of the promised land, whereas episodes 4 and 5 (4:15-5:1) are narrated from a vantage point inside of the promised land.');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5895 AND end_verse_id=5936 AND entry_text='Episodes 1 to 3 (3:1-4:14) are narrated from a vantage point outside of the promised land, whereas episodes 4 and 5 (4:15-5:1) are narrated from a vantage point inside of the promised land.'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (103,'Polzin',1,5925,5935,2,'816404569','2010-06-07',102,'4:14 is the observation of an omniscient observer who has penetrated the psychological consciousness of \"all Israel\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5925 AND end_verse_id=5935 AND entry_text='4:14 is the observation of an omniscient observer who has penetrated the psychological consciousness of \"all Israel\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5936,5950,2,'816404569','2010-06-07',103,'This time, the narrator reveals the inner consciousness of the invaded inhabitants of the land, and this verse turns out to be the logical conclusion of episodes 4 and 5');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5936 AND end_verse_id=5950 AND entry_text='This time, the narrator reveals the inner consciousness of the invaded inhabitants of the land, and this verse turns out to be the logical conclusion of episodes 4 and 5'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5918,5935,2,'816404569','2010-06-07',103,'The stones, on the one hand, testify to the impact of the miraculous crossing upon the inner consciousness of the Israelites themselves');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5918 AND end_verse_id=5935 AND entry_text='The stones, on the one hand, testify to the impact of the miraculous crossing upon the inner consciousness of the Israelites themselves'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (104,'Polzin',1,5935,5935,2,'816404569','2010-06-07',103,'The significance of the stones in this verse, in contrast to 4:7, is directed to non-Israelites');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5935 AND end_verse_id=5935 AND entry_text='The significance of the stones in this verse, in contrast to 4:7, is directed to non-Israelites'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5895,5936,2,'816404569','2010-06-07',104,'The phraseological pattern of 3:1-5:1 illustrates the basic \"promise/fulfillment\" structure of the entire Deuteronomic History');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5895 AND end_verse_id=5936 AND entry_text='The phraseological pattern of 3:1-5:1 illustrates the basic \"promise/fulfillment\" structure of the entire Deuteronomic History'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5925,5935,2,'816404569','2010-06-07',104,'The fulfillment of what the LORD predicted in 3:7');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5925 AND end_verse_id=5935 AND entry_text='The fulfillment of what the LORD predicted in 3:7'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5936,5950,1,'816404569','2010-06-07',110,'Together with Joshua 2, this chapter deals primarily with the theme of God\'s mercy and forgiveness in allowing Israel to occupy the land');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5936 AND end_verse_id=5950 AND entry_text='Together with Joshua 2, this chapter deals primarily with the theme of God\'s mercy and forgiveness in allowing Israel to occupy the land'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5936 AND end_verse_id=5950 AND entry_text='Together with Joshua 2, this chapter deals primarily with the theme of God\'s mercy and forgiveness in allowing Israel to occupy the land'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5944,5950,3,'816404569','2010-06-07',111,'This is a direct literary allusion to Deut 9:28');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5944 AND end_verse_id=5950 AND entry_text='This is a direct literary allusion to Deut 9:28'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5944 AND end_verse_id=5950 AND entry_text='This is a direct literary allusion to Deut 9:28'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (112,'Polzin',1,5946,5948,5,'816404569','2010-06-07',111,'The story in 5:13-15 is in actuality the Deuteronomist\'s final and complete statement of the meaning of the initial occupation');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5946 AND end_verse_id=5948 AND entry_text='The story in 5:13-15 is in actuality the Deuteronomist\'s final and complete statement of the meaning of the initial occupation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,6038,'Deut 11:29; 27:12',6036,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6036 AND end_verse_id=6038 AND entry_text='Deut 11:29; 27:12'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Polzin','15',6036,6038,4,'816404569',1,'2010-06-07',117,'Literary connection with the Gibeonite story; dramatic reversal of the native and the alien (cf. 8:35)','\"the stranger as well as he who was born among them\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6036 AND end_verse_id=6038 AND entry_text='Literary connection with the Gibeonite story; dramatic reversal of the native and the alien (cf. 8:35)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (119,'Polzin',1,6041,6065,5,'816404569','2010-06-07',117,'Josh 9:3-27 is a deliberate literary allusion to Deut 29:1-21');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6041 AND end_verse_id=6065 AND entry_text='Josh 9:3-27 is a deliberate literary allusion to Deut 29:1-21'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5968,5977,2,'816404569','2010-06-07',121,'The Deuteronomic History is a reminder to Israel that they were once under the ban, yet were saved because of God\'s promise to the fathers');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5968 AND end_verse_id=5977 AND entry_text='The Deuteronomic History is a reminder to Israel that they were once under the ban, yet were saved because of God\'s promise to the fathers'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=5968 AND end_verse_id=5977 AND entry_text='The Deuteronomic History is a reminder to Israel that they were once under the ban, yet were saved because of God\'s promise to the fathers'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (122,'Polzin',1,6071,6108,3,'816404569','2010-06-07',121,'וְהוֹשִׁיעָה לָּנוּ (\"and save us\") demands an answer that was in fact given by Moses in Deut 20:4: לְהוֹשִׁיעַ אֶתְכֶם׃ (\"to save you\")');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6071 AND end_verse_id=6108 AND entry_text='וְהוֹשִׁיעָה לָּנוּ (\"and save us\") demands an answer that was in fact given by Moses in Deut 20:4: לְהוֹשִׁיעַ אֶתְכֶם׃ (\"to save you\")'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6071 AND end_verse_id=6108 AND entry_text='וְהוֹשִׁיעָה לָּנוּ (\"and save us\") demands an answer that was in fact given by Moses in Deut 20:4: לְהוֹשִׁיעַ אֶתְכֶם׃ (\"to save you\")'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (123,'Polzin',1,6066,6108,5,'816404569','2010-06-07',122,'Five  episodes in chapter 10: 1) 10:1-11; 2) 10:12-15; 3) 10:16-27; 4) 10:28-39; 5) 10:40-43');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6066 AND end_verse_id=6108 AND entry_text='Five  episodes in chapter 10: 1) 10:1-11; 2) 10:12-15; 3) 10:16-27; 4) 10:28-39; 5) 10:40-43'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6066 AND end_verse_id=6108 AND entry_text='Five  episodes in chapter 10: 1) 10:1-11; 2) 10:12-15; 3) 10:16-27; 4) 10:28-39; 5) 10:40-43'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6131,6131,3,'816404569','2010-06-07',124,'The exploits narrated between Josh 1:7 and 11:23 are intended to explain how Joshua fulfilled all these divine commands');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6131 AND end_verse_id=6131 AND entry_text='The exploits narrated between Josh 1:7 and 11:23 are intended to explain how Joshua fulfilled all these divine commands'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6131 AND end_verse_id=6131 AND entry_text='The exploits narrated between Josh 1:7 and 11:23 are intended to explain how Joshua fulfilled all these divine commands'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,2,'816404569','2010-06-07',126,'Chapters 2-12 was a meditation on what the commands of the LORD mean; 13-21 is a meditation on how the word of the LORD is fulfilled');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Chapters 2-12 was a meditation on what the commands of the LORD mean; 13-21 is a meditation on how the word of the LORD is fulfilled'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Chapters 2-12 was a meditation on what the commands of the LORD mean; 13-21 is a meditation on how the word of the LORD is fulfilled'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,2,'816404569','2010-06-07',128,'The Mosaic lawcode of Deuteronomy 12-16 \"maps out the territory\" that constitutes the commands God gave to Moses just as Joshua\'s allocation of land in 14-21 \"promulgates the legal limits\" of the promised land');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The Mosaic lawcode of Deuteronomy 12-16 \"maps out the territory\" that constitutes the commands God gave to Moses just as Joshua\'s allocation of land in 14-21 \"promulgates the legal limits\" of the promised land'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6423,6425,4,'816404569','2010-06-07',132,'The basic point of view of the Book of Joshua ceases to have meaning for the reader if the evaluation expressed in 21:41-43 is literally rather than ironically construed');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6423 AND end_verse_id=6425 AND entry_text='The basic point of view of the Book of Joshua ceases to have meaning for the reader if the evaluation expressed in 21:41-43 is literally rather than ironically construed'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6428,6461,3,'816404569','2010-06-07',134,'The Book of Joshua\'s constant theme of the outsider in Israel now reaches its climax; first the outsiders inside the land, then the insiders outside the land');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6428 AND end_verse_id=6461 AND entry_text='The Book of Joshua\'s constant theme of the outsider in Israel now reaches its climax; first the outsiders inside the land, then the insiders outside the land'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6460,6461,4,'816404569','2010-06-07',139,'The imperfective form of ישׁב here indicates a shift to the synchoronic point of view on the part of the narrator, and is compositionally important');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6460 AND end_verse_id=6461 AND entry_text='The imperfective form of ישׁב here indicates a shift to the synchoronic point of view on the part of the narrator, and is compositionally important'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (142,'Polzin',1,6478,6505,2,'816404569','2010-06-07',141,'The Lord\'s words in 24:2-14 focuses on mercy; whereas the dialogue between Joshua and Israel in 24:15-24 concentrates on their retributive implications');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6478 AND end_verse_id=6505 AND entry_text='The Lord\'s words in 24:2-14 focuses on mercy; whereas the dialogue between Joshua and Israel in 24:15-24 concentrates on their retributive implications'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6478 AND end_verse_id=6505 AND entry_text='The Lord\'s words in 24:2-14 focuses on mercy; whereas the dialogue between Joshua and Israel in 24:15-24 concentrates on their retributive implications'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6479,6490,3,'816404569','2010-06-07',143,'24:2-13 is the only example of God\'s direct narrative explanation of the significant aspects of his past dealings with Israel');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6479 AND end_verse_id=6490 AND entry_text='24:2-13 is the only example of God\'s direct narrative explanation of the significant aspects of his past dealings with Israel'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6479,6490,2,'816404569','2010-06-07',143,'God\'s explanation gives no special status to law and covenant in the depiction of Israel\'s essential relationship to God');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6479 AND end_verse_id=6490 AND entry_text='God\'s explanation gives no special status to law and covenant in the depiction of Israel\'s essential relationship to God'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6479 AND end_verse_id=6490 AND entry_text='God\'s explanation gives no special status to law and covenant in the depiction of Israel\'s essential relationship to God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Polzin','1',6491,6510,2,'816404569',1,'2010-06-07',143,'Joshua is depicted as immediately interpreting God\'s words','\"Now therefore\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6491 AND end_verse_id=6510 AND entry_text='Joshua is depicted as immediately interpreting God\'s words'),
	(SELECT category_id from tbl_category WHERE name='Form')
);


-- END ENTRIES INSERTION FOR Joshua--


-- BEGIN INSERTION FOR Judges --

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4,'816404569','2010-06-07',148,'The Book of Judges, in its first chapters, turns to the problem of why Joshua was not able to drive out all the nations');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='The Book of Judges, in its first chapters, turns to the problem of why Joshua was not able to drive out all the nations'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6552,6569,5,'816404569','2010-06-07',151,'The narrative shifts back to the moment described in Josh 24:8 and beings a panoramic temporal overview of the entire period covered by the Book of Judges');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6552 AND end_verse_id=6569 AND entry_text='The narrative shifts back to the moment described in Josh 24:8 and beings a panoramic temporal overview of the entire period covered by the Book of Judges'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6569,6569,5,'816404569','2010-06-07',152,'The reference to Joshua\'s failure to complete the occupation is totally unexpected, and profoundly influences the significance of 1:1-2:22 on the one hand, and everything that follows on the other');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6569 AND end_verse_id=6569 AND entry_text='The reference to Joshua\'s failure to complete the occupation is totally unexpected, and profoundly influences the significance of 1:1-2:22 on the one hand, and everything that follows on the other'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6569,6569,3,'816404569','2010-06-07',153,'This verse reaches back and embraces the entire Book of Joshua even as it provides the evaluative background for the entire Book of Judges');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6569 AND end_verse_id=6569 AND entry_text='This verse reaches back and embraces the entire Book of Joshua even as it provides the evaluative background for the entire Book of Judges'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6588,6600,2,'816404569','2010-06-07',157,'Eglon\'s response is ironic');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6588 AND end_verse_id=6600 AND entry_text='Eglon\'s response is ironic'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6593,6600,2,'816404569','2010-06-07',157,'The contrast between the servants\' certainty and the obvious error of their judgment');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6593 AND end_verse_id=6600 AND entry_text='The contrast between the servants\' certainty and the obvious error of their judgment'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6593,6594,3,'816404569','2010-06-07',158,'The shifts to imperfective verb-forms place the reader in the very center of the scene');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6593 AND end_verse_id=6594 AND entry_text='The shifts to imperfective verb-forms place the reader in the very center of the scene'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (160,'Polzin',1,6568,6569,3,'816404569','2010-06-07',159,'This explanation only makes sense if one assumes that the retributive nature of the Mosaic covenant still allows the guilty to go unpunished an the innocent to endure unmerited suffering');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6568 AND end_verse_id=6569 AND entry_text='This explanation only makes sense if one assumes that the retributive nature of the Mosaic covenant still allows the guilty to go unpunished an the innocent to endure unmerited suffering'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6588,6600,2,'816404569','2010-06-07',160,'Ehud\'s decisive action begins when he turns away from the idols at Gilgal');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6588 AND end_verse_id=6600 AND entry_text='Ehud\'s decisive action begins when he turns away from the idols at Gilgal'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6595,6600,2,'816404569','2010-06-07',160,'Ehud\'s escape is successful when he passed the idols and fled to Seirah');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6595 AND end_verse_id=6600 AND entry_text='Ehud\'s escape is successful when he passed the idols and fled to Seirah'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6601,6624,5,'816404569','2010-06-07',161,'The eighty years of peace mentioned in 3:30 are not to be construed as dependent upon any supposed repentance of Israel');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6601 AND end_verse_id=6624 AND entry_text='The eighty years of peace mentioned in 3:30 are not to be construed as dependent upon any supposed repentance of Israel'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6601 AND end_verse_id=6624 AND entry_text='The eighty years of peace mentioned in 3:30 are not to be construed as dependent upon any supposed repentance of Israel'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (166,'Polzin',1,6601,6623,5,'816404569','2010-06-07',164,'Alternation between synchronic narration and panchronic narration');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6601 AND end_verse_id=6623 AND entry_text='Alternation between synchronic narration and panchronic narration'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (168,'Polzin',1,6625,6655,5,'816404569','2010-06-07',167,'The song (5:1-31) continues the preceding chapters\' role of engendering a feeling of confusion concerning the basic ideological positions of the preceding books');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6625 AND end_verse_id=6655 AND entry_text='The song (5:1-31) continues the preceding chapters\' role of engendering a feeling of confusion concerning the basic ideological positions of the preceding books'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6625 AND end_verse_id=6655 AND entry_text='The song (5:1-31) continues the preceding chapters\' role of engendering a feeling of confusion concerning the basic ideological positions of the preceding books'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6656,6812,5,'816404569','2010-06-07',168,'The Gideon story depicts the excessive concern men exhibit who seek by signs and tests to insure the success of their ventures');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6656 AND end_verse_id=6812 AND entry_text='The Gideon story depicts the excessive concern men exhibit who seek by signs and tests to insure the success of their ventures'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (171,'Polzin',1,6656,6812,5,'816404569','2010-06-07',169,'The story of Gideon portrays how Israel even in the very process of being delivered by Yahweh vacillates between allegiance to him and allegiance to another God');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6656 AND end_verse_id=6812 AND entry_text='The story of Gideon portrays how Israel even in the very process of being delivered by Yahweh vacillates between allegiance to him and allegiance to another God'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6656 AND end_verse_id=6812 AND entry_text='The story of Gideon portrays how Israel even in the very process of being delivered by Yahweh vacillates between allegiance to him and allegiance to another God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6709,6720,4,'816404569','2010-06-07',172,'To the Midianite here, \"God\" refers to a deity, from the point of the view of the speaker, is not Yahweh himself');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6709 AND end_verse_id=6720 AND entry_text='To the Midianite here, \"God\" refers to a deity, from the point of the view of the speaker, is not Yahweh himself'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6709 AND end_verse_id=6720 AND entry_text='To the Midianite here, \"God\" refers to a deity, from the point of the view of the speaker, is not Yahweh himself'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (173,'Polzin',1,6744,6747,3,'816404569','2010-06-07',172,'That Gideon and the Israelites continue to profess allegiance not only to Yahwah but to the worship of another is made clear by the incident of the golden ephod');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6744 AND end_verse_id=6747 AND entry_text='That Gideon and the Israelites continue to profess allegiance not only to Yahwah but to the worship of another is made clear by the incident of the golden ephod'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,6756,6812,3,'816404569','2010-06-07',173,'There are no references at all to Yahweh in a chapter which clearly functions as a climax to the Gideon story');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6756 AND end_verse_id=6812 AND entry_text='There are no references at all to Yahweh in a chapter which clearly functions as a climax to the Gideon story'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (175,'Polzin',1,6756,6812,4,'816404569','2010-06-07',174,'It is precisely here in the Abimelech story, where for the first time in the Book of Judges just retribution finally is accomplished, that both Israel and the narrator lose their distinctively Yahwistic identities');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6756 AND end_verse_id=6812 AND entry_text='It is precisely here in the Abimelech story, where for the first time in the Book of Judges just retribution finally is accomplished, that both Israel and the narrator lose their distinctively Yahwistic identities'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=6756 AND end_verse_id=6812 AND entry_text='It is precisely here in the Abimelech story, where for the first time in the Book of Judges just retribution finally is accomplished, that both Israel and the narrator lose their distinctively Yahwistic identities'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);


-- END ENTRIES INSERTION FOR Judges--


-- BEGIN INSERTION FOR John --

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (224,'Schnackenberg',1,26046,26063,5,'824503112','2010-06-07',221,'The links between the prologue and the rest of the Gospel');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='The links between the prologue and the rest of the Gospel'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26046,26063,5,'824503112','2010-06-07',224,'The prologue has the character of an \"opening narrative\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='The prologue has the character of an \"opening narrative\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (226,'Schnackenberg',1,26046,26063,5,'824503112','2010-06-07',225,'Reasons for identifying a Logos-Hymn','The Logos-Hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Reasons for identifying a Logos-Hymn'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Reasons for identifying a Logos-Hymn'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (227,'Schnackenberg',1,26046,26063,5,'824503112','2010-06-07',226,'Reconstructing the Logos-Hymn','The Logos-Hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Reconstructing the Logos-Hymn'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Reconstructing the Logos-Hymn'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26046,26063,2,'824503112','2010-06-07',228,'Special character of the hymn not found in other Christian primitive hymns','The Logos-Hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Special character of the hymn not found in other Christian primitive hymns'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (232,'Schnackenberg',1,26046,26063,'824503112','2010-06-07',229,'Origin and background to the Logos-Hymn','The Logos-Hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Origin and background to the Logos-Hymn'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26046,26063,1,'824503112','2010-06-07',232,'Other hymns and Christological affirmations: Phil 2:6; Col 1:15; Heb 1:3','The Logos-Hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26063 AND entry_text='Other hymns and Christological affirmations: Phil 2:6; Col 1:15; Heb 1:3'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26046,26096,2,'824503112',1,'2010-06-07',232,'Reference to Gen 1:1 but also means more than the account of creation; precedence overall all creation','\"In the beginning\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Reference to Gen 1:1 but also means more than the account of creation; precedence overall all creation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (233,'Schnackenberg','3',26046,26096,4,'824503112',1,'2010-06-07',232,'The logos was not created, but already existed absolutely, timeless and eternal','\"was\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='The logos was not created, but already existed absolutely, timeless and eternal'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`)
	VALUES ('3',26046,26096,1,'2010-06-07','Jn 8:58');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Jn 8:58'),
	(SELECT category_id from tbl_category WHERE name='Cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26046,26096,2,'824503112',1,'2010-06-07',233,'Personal character of the Logos','\"the Word was with God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Personal character of the Logos'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('6',26046,26096,1,'2010-06-07','Jn 10:30; 17:5, 10; 1Jn 1:2','\"the Word was with God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Jn 10:30; 17:5, 10; 1Jn 1:2'),
	(SELECT category_id from tbl_category WHERE name='Cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26046,26096,2,'824503112',1,'2010-06-07',233,'Personal union of the Logos with God','\"the Word was with God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Personal union of the Logos with God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26046,26096,4,'824503112',1,'2010-06-07',234,'Does not here mean movement, but is the equivalent of παρὰ τῷ θεῷ','\"with\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Does not here mean movement, but is the equivalent of παρὰ τῷ θεῷ'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26046,26096,1,'824503112',1,'2010-06-07',234,'The active partnership is also a personal union, and the proximity also implies reciprocal indwelling','\"with\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='The active partnership is also a personal union, and the proximity also implies reciprocal indwelling'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26046,26096,1,'824503112','2010-06-07',234,'The primordial eternal being of the Logos is an existence which proceeds from God and his love, and is filled with the life of God and shares in his glory');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='The primordial eternal being of the Logos is an existence which proceeds from God and his love, and is filled with the life of God and shares in his glory'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26046,26096,2,'824503112',1,'2010-06-07','Climactic statement about the Logos','\"the Word was God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Climactic statement about the Logos'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Climactic statement about the Logos'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','14',26046,26096,2,'824503112',1,'2010-06-07',234,'Not a genus, but signifies the nature proper to God and the Logos in common','\"God\" (θεός)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Not a genus, but signifies the nature proper to God and the Logos in common'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','14',26046,26096,1,'824503112',1,'2010-06-07',234,'Predicate','\"God\" (θεός)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Predicate'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26046,26096,5,'824503112',1,'2010-06-07',235,'Comparison with the meaning of Logos in Wisdom literature and Philo','\"Word\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Comparison with the meaning of Logos in Wisdom literature and Philo'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26047,26096,1,'824503112',1,'2010-06-07',236,'A mark of the evangelist\'s own style','οὗτος');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26047 AND end_verse_id=26096 AND entry_text='A mark of the evangelist\'s own style'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Jn 8:42; 13:3; 16:27, 28, 30; 17:8, 24; 1Jn 1:2',26047,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26047 AND end_verse_id=26096 AND entry_text='Jn 8:42; 13:3; 16:27, 28, 30; 17:8, 24; 1Jn 1:2'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (237,'Schnackenberg','2',26048,26096,5,'824503112',1,'2010-06-07',236,'Interpreting the Logo\'s creative activity as expressed by διά','\"through\" (διά)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='Interpreting the Logo\'s creative activity as expressed by διά'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Rom 11:36; Phil 2:6, 11; Col 1:16; Heb 1:2, 10',26048,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='Rom 11:36; Phil 2:6, 11; Col 1:16; Heb 1:2, 10'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26048,26096,2,'824503112',1,'2010-06-07',238,'Cannot be restricted to the world of man','\"all\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='Cannot be restricted to the world of man'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26048,26096,2,'824503112',1,'2010-06-07',238,'οὐδὲ ἕν (\"not one\") as its counterpart','\"all\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='οὐδὲ ἕν (\"not one\") as its counterpart'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (240,'Schnackenberg','11',26048,26096,5,'824503112',1,'2010-06-07',239,'Discussion on which sentence this should belong to','ὃ γέγονεν');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='Discussion on which sentence this should belong to'),
	(SELECT category_id from tbl_category WHERE name='Text')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='Discussion on which sentence this should belong to'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26048 AND end_verse_id=26096 AND entry_text='Discussion on which sentence this should belong to'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Jn 5:26; 8:12; 9:5; 12:35, 36; 46',26049,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26049 AND end_verse_id=26096 AND entry_text='Jn 5:26; 8:12; 9:5; 12:35, 36; 46'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (242,'Schnackenberg',1,26049,26096,5,'824503112','2010-06-07',241,'The Logos is to fill men with the divinely spiritual life, the life which distinguishes them from the rest of creation and consists both of their knowledge of their godlike nature and of a blessed union with God in holiness of conduct');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26049 AND end_verse_id=26096 AND entry_text='The Logos is to fill men with the divinely spiritual life, the life which distinguishes them from the rest of creation and consists both of their knowledge of their godlike nature and of a blessed union with God in holiness of conduct'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26049,26096,2,'824503112',1,'2010-06-07',242,'Just as divine life \"was\' in him without any restriction of time, so too he \"was\" in the divine plan always the light of men','\"was\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26049 AND end_verse_id=26096 AND entry_text='Just as divine life \"was\' in him without any restriction of time, so too he \"was\" in the divine plan always the light of men'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (244,'Schnackenberg',1,26049,26096,5,'824503112','2010-06-07',242,'Life and light in Hellenistic mysticism and Gnosis');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26049 AND end_verse_id=26096 AND entry_text='Life and light in Hellenistic mysticism and Gnosis'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26049,26096,3,'824503112','2010-06-07',244,'Light and eschatological salvation');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26049 AND end_verse_id=26096 AND entry_text='Light and eschatological salvation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26050,26096,4,'824503112','2010-06-07',245,'The evangelist\'s meditation in v. 5 extends to take in the present time');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='The evangelist\'s meditation in v. 5 extends to take in the present time'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='The evangelist\'s meditation in v. 5 extends to take in the present time'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (246,'Schnackenberg',1,26050,26096,2,'824503112','2010-06-07',245,'\"Darkness\" in John means primarily the world estranged from God','\"darkness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='\"Darkness\" in John means primarily the world estranged from God'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='\"Darkness\" in John means primarily the world estranged from God'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Jn 1:9; 3:19; 8:12; 9:39; 12:35, 36, 40, 46; 1Jn 1:6-7; 2:8-11',26050,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='Jn 1:9; 3:19; 8:12; 9:39; 12:35, 36, 40, 46; 1Jn 1:6-7; 2:8-11'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg','5',26050,26096,5,'824503112',1,'2010-06-07',246,'Comparison with the concept of \"darkness\" in the Qumran texts');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='Comparison with the concept of \"darkness\" in the Qumran texts'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (247,'Schnackenberg','13',26050,26096,5,'824503112',1,'2010-06-07',246,'\"grasp\" is preferred to \"master\"','\"comprehend\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='\"grasp\" is preferred to \"master\"'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='\"grasp\" is preferred to \"master\"'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='\"grasp\" is preferred to \"master\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26050,26096,4,'824503112','2010-06-07',247,'The tenses of the verbs are deliberate');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='The tenses of the verbs are deliberate'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='The tenses of the verbs are deliberate'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (249,'Schnackenberg',1,26050,26096,4,'824503112','2010-06-07',247,'The contrast of \"light\" in \"darkness\" in John as opposed to Gnostic and Jewish literature','\"light\" and \"darkness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26050 AND end_verse_id=26096 AND entry_text='The contrast of \"light\" in \"darkness\" in John as opposed to Gnostic and Jewish literature'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (251,'Schnackenberg',1,26051,26053,1,'824503112','2010-06-07',250,'1:6-8 is the evangelist\'s interpolation. It is also proved secondary by its rhythm and prosaic style');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26053 AND entry_text='1:6-8 is the evangelist\'s interpolation. It is also proved secondary by its rhythm and prosaic style'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26053 AND entry_text='1:6-8 is the evangelist\'s interpolation. It is also proved secondary by its rhythm and prosaic style'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26053 AND entry_text='1:6-8 is the evangelist\'s interpolation. It is also proved secondary by its rhythm and prosaic style'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26051,26096,1,'824503112',1,'2010-06-07',250,'In contrast with ἦν, implies an appearance at a given moment of history','Ἐγένετο');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26096 AND entry_text='In contrast with ἦν, implies an appearance at a given moment of history'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26096 AND entry_text='In contrast with ἦν, implies an appearance at a given moment of history'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26051,26096,2,'824503112',1,'2010-06-07',250,'The name of John is added solemnly and reverently','\"Whose name was John\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26096 AND entry_text='The name of John is added solemnly and reverently'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Jn 1:19-28, 31, 35, 36',26052,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='Jn 1:19-28, 31, 35, 36'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26052,26096,5,'824503112','2010-06-07',251,'The evangelist\'s purpose in his evaluation of the Baptist');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='The evangelist\'s purpose in his evaluation of the Baptist'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='The evangelist\'s purpose in his evaluation of the Baptist'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26052,26096,2,'824503112','2010-06-07',251,'The term stands out most strongly in the fourth Gospel, and there it occurs in the service of faith','\"witness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='The term stands out most strongly in the fourth Gospel, and there it occurs in the service of faith'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='The term stands out most strongly in the fourth Gospel, and there it occurs in the service of faith'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26051,26052,1,'824503112','2010-06-07',251,'The transition to historical narrative (v. 6) shows beyond doubt that the evangelist understands the \"light\" in v. 7 as the incarnate Logos');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26051 AND end_verse_id=26052 AND entry_text='The transition to historical narrative (v. 6) shows beyond doubt that the evangelist understands the \"light\" in v. 7 as the incarnate Logos'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','12',26052,26096,2,'824503112',1,'2010-06-07',252,'Where \"πιστεύειν\" is used absolutely, faith in Jesus is meant','\"believe\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='Where \"πιστεύειν\" is used absolutely, faith in Jesus is meant'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='Where \"πιστεύειν\" is used absolutely, faith in Jesus is meant'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26052,26096,1,'824503112',1,'2010-06-07',252,'πάντες is not emphasized, but it shows the universal salvific will of God (cf. 3:15-17)','\"all\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='πάντες is not emphasized, but it shows the universal salvific will of God (cf. 3:15-17)'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26052 AND end_verse_id=26096 AND entry_text='πάντες is not emphasized, but it shows the universal salvific will of God (cf. 3:15-17)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (253,'Schnackenberg',1,26053,26096,2,'824503112','2010-06-07',252,'This verse is directed against an over-estimation of the Baptist, but may also have been chosen merely on account of the context');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26053 AND end_verse_id=26096 AND entry_text='This verse is directed against an over-estimation of the Baptist, but may also have been chosen merely on account of the context'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26053 AND end_verse_id=26096 AND entry_text='This verse is directed against an over-estimation of the Baptist, but may also have been chosen merely on account of the context'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26054,26096,1,'824503112','2010-06-07',253,'\"He was the true light which enlightens every man,\" explicates the \"light of men\" in v. 4.','\"That was the true light\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='\"He was the true light which enlightens every man,\" explicates the \"light of men\" in v. 4.'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26054,26096,3,'824503112','2010-06-07',253,'The \"illumination\" given by the Logos must have primarily envisaged the knowledge and the choice of good conduct in keeping with man\'s situation and the will of God--\"walking in the light\", which leads finally to the full light and salvation of God','\"That was the true light\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='The \"illumination\" given by the Logos must have primarily envisaged the knowledge and the choice of good conduct in keeping with man\'s situation and the will of God--\"walking in the light\", which leads finally to the full light and salvation of God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26054,26096,2,'824503112','2010-06-07',253,'Logos possessed the power to illuminate before his earthly existence','\"That was the true light\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='Logos possessed the power to illuminate before his earthly existence'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (254,'Schnackenberg','5',26054,26096,'824503112',1,'2010-06-07',253,'\"Genuineness\"; fullness of being and reality in God','\"true\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='\"Genuineness\"; fullness of being and reality in God'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='\"Genuineness\"; fullness of being and reality in God'),
	(SELECT category_id from tbl_category WHERE name='Word')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26054,26096,2,'824503112',1,'2010-06-07',254,'The Logo\'s illumination has been bestowed in a special manner since the Incarnation on those who believe in him','\"coming\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='The Logo\'s illumination has been bestowed in a special manner since the Incarnation on those who believe in him'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (255,'Schnackenberg','10',26054,26096,5,'824503112',1,'2010-06-07',254,'Grammatical possibilities and their difficulties','ἐρχόμενον');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='Grammatical possibilities and their difficulties'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26054 AND end_verse_id=26096 AND entry_text='Grammatical possibilities and their difficulties'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26055,26056,2,'824503112','2010-06-07',255,'A new strophe in the original hymn; a new thought: the rejection of the Logos by the world');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26056 AND entry_text='A new strophe in the original hymn; a new thought: the rejection of the Logos by the world'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26055,26096,3,'824503112',1,'2010-06-07',255,'The world as the dwelling place of man; \"the world of man\"; \"humanity\"','\"world\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='The world as the dwelling place of man; \"the world of man\"; \"humanity\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26055,26096,1,'824503112',1,'2010-06-07',255,'The brutal and shattering fact which the hymn signals in a few words','\"and the world did not know Him\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='The brutal and shattering fact which the hymn signals in a few words'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26055,26096,5,'824503112',1,'2010-06-07',256,'v. 10b uses \"world\" in a different sense from 10a and 10c','\"world\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='v. 10b uses \"world\" in a different sense from 10a and 10c'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26055,26096,5,'824503112',1,'2010-06-07',256,'The hymn must have been thinking of the presence of the Logos in the world before the Incarnation, as indicated by ἦν','\"He was in the world\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='The hymn must have been thinking of the presence of the Logos in the world before the Incarnation, as indicated by ἦν'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='The hymn must have been thinking of the presence of the Logos in the world before the Incarnation, as indicated by ἦν'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26055,26096,5,'824503112',1,'2010-06-07',257,'Comparison with the same experience ascribed to Wisdom in Jewish writings','\"and the world did not know Him\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='Comparison with the same experience ascribed to Wisdom in Jewish writings'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26055,26096,3,'824503112','2010-06-07',258,'The evangelist undoubtedly referred the verse to the incarnate Logos');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='The evangelist undoubtedly referred the verse to the incarnate Logos'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26055,26096,4,'824503112',1,'2010-06-07',258,'Possible explanations for the evangelist\'s interjection of v. 10b','\"and the world was made through Him\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26055 AND end_verse_id=26096 AND entry_text='Possible explanations for the evangelist\'s interjection of v. 10b'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26056,26096,2,'824503112',1,'2010-06-07',258,'The aorist ἦλθεν reflects the fact that the encounter between the Logos and the world took place in the reality of history','\"He came\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='The aorist ἦλθεν reflects the fact that the encounter between the Logos and the world took place in the reality of history'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='The aorist ἦλθεν reflects the fact that the encounter between the Logos and the world took place in the reality of history'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26056,26096,5,'824503112','2010-06-07',259,'Comparison with Gnostic and Wisdom literature');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='Comparison with Gnostic and Wisdom literature'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26056,26096,4,'824503112','2010-06-07',259,'The whole train of thought transposed on the Christian level');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='The whole train of thought transposed on the Christian level'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26056,26096,2,'824503112',1,'2010-06-07',259,'Means to his domain or property; \"those belonging to someone\"','\"to His own\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='Means to his domain or property; \"those belonging to someone\"'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26056,26096,'824503112',1,'2010-06-07',259,'\"Domain\": Ezra 5:47 LXX; Lk 18:28; Jn 8:44','\"to His own\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='\"Domain\": Ezra 5:47 LXX; Lk 18:28; Jn 8:44'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='\"Domain\": Ezra 5:47 LXX; Lk 18:28; Jn 8:44'),
	(SELECT category_id from tbl_category WHERE name='Word')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26056,26096,3,'824503112','2010-06-07',259,'The world is the domain of the Logos; hence it is all the more saddening that \"his own\" did not accept him');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='The world is the domain of the Logos; hence it is all the more saddening that \"his own\" did not accept him'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26056,26096,4,'824503112',1,'2010-06-07',260,'All men are envisaged in ἴδιοι. The evangelist also uses the word in the strict sense (13:1...)','\"His own\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='All men are envisaged in ἴδιοι. The evangelist also uses the word in the strict sense (13:1...)'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='All men are envisaged in ἴδιοι. The evangelist also uses the word in the strict sense (13:1...)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26056,26096,1,'824503112',1,'2010-06-07',260,'Probably from the metaphor of welcoming to a house or has perhaps the more general sense of accepting as partner','\"receive\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='Probably from the metaphor of welcoming to a house or has perhaps the more general sense of accepting as partner'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='Probably from the metaphor of welcoming to a house or has perhaps the more general sense of accepting as partner'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (261,'Schnackenberg','6',26056,26096,4,'824503112',1,'2010-06-07',260,'It is quite possible that at τὰ ἴδια the evangelist thought of the people who were God\'s \"own possession\" and at οἱ ἴδιοι of the Jews of the day who as members of this people incomprehensibly rejected the eschatological saviour. He too could have thought of men in general as the ἴδιοι.','\"τὰ ἴδια\" and \"οἱ ἴδιοι\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26056 AND end_verse_id=26096 AND entry_text='It is quite possible that at τὰ ἴδια the evangelist thought of the people who were God\'s \"own possession\" and at οἱ ἴδιοι of the Jews of the day who as members of this people incomprehensibly rejected the eschatological saviour. He too could have thought of men in general as the ἴδιοι.'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26057,26096,2,'824503112','2010-06-07',261,'This is in keeping with the evangelist\'s way of seeing things black and white, and contrasting negative and positive statements (cf. 12:37-43; 3:32, 33)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='This is in keeping with the evangelist\'s way of seeing things black and white, and contrasting negative and positive statements (cf. 12:37-43; 3:32, 33)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26057,26096,2,'824503112','2010-06-07',261,'The expression λαμβάνειν τινά is a characteristic of Johannine style');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='The expression λαμβάνειν τινά is a characteristic of Johannine style'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26057,26096,3,'824503112','2010-06-07',261,'Contrast with Gnosticism');

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26057,26096,2,'824503112',1,'2010-06-07',262,'Lays stress on the power conferred by God. How this comes about is through baptism','\"authority\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='Lays stress on the power conferred by God. How this comes about is through baptism'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26057,26096,2,'824503112',1,'2010-06-07',262,'John never speaks of \"becoming\" in the moral sense','\"become\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='John never speaks of \"becoming\" in the moral sense'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26057,26096,1,'824503112',1,'2010-06-07',262,'The dative participle after αὐτοῖς. See a similar construction in 1Jn 5:13','\"to those who believe\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='The dative participle after αὐτοῖς. See a similar construction in 1Jn 5:13'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='The dative participle after αὐτοῖς. See a similar construction in 1Jn 5:13'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26057,26096,1,'824503112','2010-06-07',262,'Faith is the basic prerequisite for salvation, and in Johannine theology the one condition which contains all others');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='Faith is the basic prerequisite for salvation, and in Johannine theology the one condition which contains all others'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','12',26057,26096,2,'824503112',1,'2010-06-07',263,'This is expression is exclusively Johannine (cf. Jn 2:23; 3:18; 1Jn 3:23; 5:13), and implies the acceptance of Jesus to the full extent of his self-revelation','\"believe in His name\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='This is expression is exclusively Johannine (cf. Jn 2:23; 3:18; 1Jn 3:23; 5:13), and implies the acceptance of Jesus to the full extent of his self-revelation'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='This is expression is exclusively Johannine (cf. Jn 2:23; 3:18; 1Jn 3:23; 5:13), and implies the acceptance of Jesus to the full extent of his self-revelation'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26057 AND end_verse_id=26096 AND entry_text='This is expression is exclusively Johannine (cf. Jn 2:23; 3:18; 1Jn 3:23; 5:13), and implies the acceptance of Jesus to the full extent of his self-revelation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26058,26096,5,'824503112','2010-06-07',263,'Verse 13 explains how to become children of God');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='Verse 13 explains how to become children of God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26058,26096,2,'824503112','2010-06-07',263,'The three negatives exclude all natural factors');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The three negatives exclude all natural factors'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The three negatives exclude all natural factors'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26058,26096,1,'824503112',1,'2010-06-07',263,'Two MSS and many patristic quotations omit this phrase','\"nor of the will of man\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='Two MSS and many patristic quotations omit this phrase'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26058,26096,4,'824503112','2010-06-07',263,'Other variants on this verse');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='Other variants on this verse'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26058,26096,3,'824503112','2010-06-07',263,'Being born of God as being superior to the \"world\" (cf. 1Jn 4:4; 5:4)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='Being born of God as being superior to the \"world\" (cf. 1Jn 4:4; 5:4)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='Being born of God as being superior to the \"world\" (cf. 1Jn 4:4; 5:4)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26058,26096,1,'824503112','2010-06-07',264,'The birth from God is an act (note the aorist) of divine heavenly origin (cf. Jn 3:3, 6, 8)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The birth from God is an act (note the aorist) of divine heavenly origin (cf. Jn 3:3, 6, 8)'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The birth from God is an act (note the aorist) of divine heavenly origin (cf. Jn 3:3, 6, 8)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The birth from God is an act (note the aorist) of divine heavenly origin (cf. Jn 3:3, 6, 8)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26058,26096,1,'824503112','2010-06-07',264,'The Christian reader cannot but think of baptism (cf. 3:5)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The Christian reader cannot but think of baptism (cf. 3:5)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='The Christian reader cannot but think of baptism (cf. 3:5)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (265,'Schnackenberg','1',26058,26096,5,'824503112',1,'2010-06-07',264,'On the variant ὃς ... ἐγεννήθη');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26058 AND end_verse_id=26096 AND entry_text='On the variant ὃς ... ἐγεννήθη'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26059,26096,1,'824503112','2010-06-07',266,'This is the climax of the Logos-hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='This is the climax of the Logos-hymn'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26059,26096,2,'824503112',1,'2010-06-07',266,'καί indicates something new, a stage of historical progress','\"And\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='καί indicates something new, a stage of historical progress'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (267,'Schnackenberg','5',26059,26096,5,'824503112',1,'2010-06-07',266,'ἐγένετο indicates a real event. It announces a change in the mode of being of the Logos','\"became\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='ἐγένετο indicates a real event. It announces a change in the mode of being of the Logos'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='ἐγένετο indicates a real event. It announces a change in the mode of being of the Logos'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26059,26096,5,'824503112','2010-06-07',267,'The Logos \"becoming flesh\" marks a turning-point in the history of salvation ');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The Logos \"becoming flesh\" marks a turning-point in the history of salvation '),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (268,'Schnackenberg','4',26059,26096,'824503112',1,'2010-06-07',267,'σάρξ indicates full human reality','\"flesh\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='σάρξ indicates full human reality'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26059,26096,2,'824503112',1,'2010-06-07',268,'The anti-Gnostic tone is unmistakable','\"flesh\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The anti-Gnostic tone is unmistakable'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26059,26096,3,'824503112','2010-06-07',268,'The Christian teaching on the Son of God made man can only be understood as a protest against all other religions of redemption in Hellenism and Gnosticism');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The Christian teaching on the Son of God made man can only be understood as a protest against all other religions of redemption in Hellenism and Gnosticism'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26059,26096,2,'824503112',1,'2010-06-07',269,'This mode of presence surpasses everything that could have been said about Wisdom','\"dwelt among us\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='This mode of presence surpasses everything that could have been said about Wisdom'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (270,'Schnackenberg','7',26059,26096,5,'824503112',1,'2010-06-07',269,'Yahweh\'s dwelling in the sanctuary and the glory that filled the tabernable','\"dwelt among us\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='Yahweh\'s dwelling in the sanctuary and the glory that filled the tabernable'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26059,26096,3,'824503112',1,'2010-06-07',270,'The evangelist and his fellow-witnesses experienced the divine majesty of Jesus in his works, particularly the \"signs\"','\"and we beheld His glory\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The evangelist and his fellow-witnesses experienced the divine majesty of Jesus in his works, particularly the \"signs\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('10',26059,26096,1,'2010-06-07','Jn 1:50, 51; 2:11; 11:40; 1Jn 1:1-3','\"and we beheld His glory\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='Jn 1:50, 51; 2:11; 11:40; 1Jn 1:1-3'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','17',26059,26096,1,'824503112',1,'2010-06-07',270,'μονογενής as an epithet for Christ is also a term proper to the evangelist (1:18; 3:16, 18; 1Jn 4:9)','\"only begotten\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='μονογενής as an epithet for Christ is also a term proper to the evangelist (1:18; 3:16, 18; 1Jn 4:9)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='μονογενής as an epithet for Christ is also a term proper to the evangelist (1:18; 3:16, 18; 1Jn 4:9)'),
	(SELECT category_id from tbl_category WHERE name='Word')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','16',26059,26096,'824503112',1,'2010-06-07',270,'ὡς does not mark a restriction or make a comparison, but defines the glory precisely and indicates its exact nature','\"as\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='ὡς does not mark a restriction or make a comparison, but defines the glory precisely and indicates its exact nature'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='ὡς does not mark a restriction or make a comparison, but defines the glory precisely and indicates its exact nature'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (271,'Schnackenberg','17',26059,26096,1,'824503112',1,'2010-06-07',270,'μονογενής is probably based on the Hebrew יָחִיד, which can mean both \"unique, only-begotten\" and \"beloved\"','\"only begotten\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='μονογενής is probably based on the Hebrew יָחִיד, which can mean both \"unique, only-begotten\" and \"beloved\"'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26059,26096,5,'824503112',1,'2010-06-07',271,'παρά should be taken with μονογενοῦς rather than with the remoter word δόξαν','\"from\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='παρά should be taken with μονογενοῦς rather than with the remoter word δόξαν'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (272,'Schnackenberg','17',26059,26096,4,'824503112',1,'2010-06-07',271,'μονογενής in John undoubtedly goes back to the Hebrew','\"only begotten\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='μονογενής in John undoubtedly goes back to the Hebrew'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','20',26059,26096,2,'824503112',1,'2010-06-07',272,'It should be taken with the genitive μονογενοῦς, not with δόξαν','\"full of grace and truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='It should be taken with the genitive μονογενοῦς, not with δόξαν'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (273,'Schnackenberg','20',26059,26096,5,'824503112',1,'2010-06-07',272,'The association of χάριτος καὶ ἀληθείας is well rooted in the OT','\"full of grace and truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The association of χάριτος καὶ ἀληθείας is well rooted in the OT'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','21',26059,26096,'824503112',1,'2010-06-07',272,'Ex 34:6; 2Sam 2:6; Ps 25:10; 40:12; 61:8; 85:11; 89:15; 115:1; 138:2; Prov 3:3; 14:22','\"grace and truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='Ex 34:6; 2Sam 2:6; Ps 25:10; 40:12; 61:8; 85:11; 89:15; 115:1; 138:2; Prov 3:3; 14:22'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','23',26059,26096,3,'824503112',1,'2010-06-07',273,'The evangelist probably took ἀλήθεια to mean \"divine reality\" in a more strongly ontological sense, as he understands ἀλήθεια in Jn 4:23, 24; 8:44; 14:6; 17:17; 18:37','\"truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The evangelist probably took ἀλήθεια to mean \"divine reality\" in a more strongly ontological sense, as he understands ἀλήθεια in Jn 4:23, 24; 8:44; 14:6; 17:17; 18:37'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The evangelist probably took ἀλήθεια to mean \"divine reality\" in a more strongly ontological sense, as he understands ἀλήθεια in Jn 4:23, 24; 8:44; 14:6; 17:17; 18:37'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26059 AND end_verse_id=26096 AND entry_text='The evangelist probably took ἀλήθεια to mean \"divine reality\" in a more strongly ontological sense, as he understands ἀλήθεια in Jn 4:23, 24; 8:44; 14:6; 17:17; 18:37'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26060,26096,3,'824503112','2010-06-07',273,'The present μαρτυρεῖ and the perfect κέκραγεν make the voice of the precursor audible in the present time','\"bore witness\" and \"cried out\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26060 AND end_verse_id=26096 AND entry_text='The present μαρτυρεῖ and the perfect κέκραγεν make the voice of the precursor audible in the present time'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26060 AND end_verse_id=26096 AND entry_text='The present μαρτυρεῖ and the perfect κέκραγεν make the voice of the precursor audible in the present time'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (275,'Schnackenberg',1,26060,26096,5,'824503112','2010-06-07',274,'This interjection of the evangelist is determined by his polemic against disciples of John who were challenging Christianity in his day');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26060 AND end_verse_id=26096 AND entry_text='This interjection of the evangelist is determined by his polemic against disciples of John who were challenging Christianity in his day'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26061,26096,1,'824503112','2010-06-07',275,'This verse is not part of the Baptist\'s words');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='This verse is not part of the Baptist\'s words'),
	(SELECT category_id from tbl_category WHERE name='Text')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='This verse is not part of the Baptist\'s words'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg','1',26061,26096,2,'824503112',1,'2010-06-07',275,'ὅτι, instead of καί, is to be preferred');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='ὅτι, instead of καί, is to be preferred'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26061,26096,2,'824503112',1,'2010-06-07',275,'πλήρωμα has certainly nothing to do with Gnostic speculation on the pleroma','\"fullness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='πλήρωμα has certainly nothing to do with Gnostic speculation on the pleroma'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26061,26096,1,'824503112',1,'2010-06-07',275,'The Logos is the bearer of the fullness of divine salvation (cf. Jn 3:34; 5:26; 6:57; 7:38, 39)','\"fullness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='The Logos is the bearer of the fullness of divine salvation (cf. Jn 3:34; 5:26; 6:57; 7:38, 39)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='The Logos is the bearer of the fullness of divine salvation (cf. Jn 3:34; 5:26; 6:57; 7:38, 39)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26061,26096,1,'824503112',1,'2010-06-07',275,'One is reminded of the quite ordinary expression in the O.T., \"the fullness\"--of God\'s grace, Ps 5:8, of his graces, Ps 106:45, of his mercy, Ps 51:3; 69:17','\"fullness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='One is reminded of the quite ordinary expression in the O.T., \"the fullness\"--of God\'s grace, Ps 5:8, of his graces, Ps 106:45, of his mercy, Ps 51:3; 69:17'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26061,26096,1,'824503112',1,'2010-06-07',275,'John, however, is not thinking of the superabundant mercy of God. He also means the riches of divine life which the Logos receives from the Father (Jn 5:26) and from which he enriches his own (Jn 10:10)','\"fullness\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='John, however, is not thinking of the superabundant mercy of God. He also means the riches of divine life which the Logos receives from the Father (Jn 5:26) and from which he enriches his own (Jn 10:10)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='John, however, is not thinking of the superabundant mercy of God. He also means the riches of divine life which the Logos receives from the Father (Jn 5:26) and from which he enriches his own (Jn 10:10)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26061,26096,1,'824503112',1,'2010-06-07',275,'καί as an explanation: \"(that is to say) grace upon grace\"','\"and\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='καί as an explanation: \"(that is to say) grace upon grace\"'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='καί as an explanation: \"(that is to say) grace upon grace\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26061,26096,2,'824503112',1,'2010-06-07',276,'Perhaps ἀντί also indicates the correspondence between the grace possessed by the Logos and that of those who receive him','\"for\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='Perhaps ἀντί also indicates the correspondence between the grace possessed by the Logos and that of those who receive him'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='Perhaps ἀντί also indicates the correspondence between the grace possessed by the Logos and that of those who receive him'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26061,26096,2,'824503112',1,'2010-06-07',276,'This is the jubilant confession of all who have receive Christ in faith (cf. Jn 1:12)','\"we have all received\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='This is the jubilant confession of all who have receive Christ in faith (cf. Jn 1:12)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='This is the jubilant confession of all who have receive Christ in faith (cf. Jn 1:12)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26061,26096,3,'824503112','2010-06-07',276,'Contrast between the Gnostic way of salvation and the Christian faith');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26061 AND end_verse_id=26096 AND entry_text='Contrast between the Gnostic way of salvation and the Christian faith'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26062,26096,2,'824503112','2010-06-07',276,'The asyndeton is a characteristic of Johannine style');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='The asyndeton is a characteristic of Johannine style'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26062,26096,1,'824503112',1,'2010-06-07',276,'The mention of Jesus Christ without previous introduction is characteristic of Johannine style (Jn 17:3; 1Jn 1:3; 2:1; 3:23; 4:2, 15; 5:6, 20)','\"Jesus Christ\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='The mention of Jesus Christ without previous introduction is characteristic of Johannine style (Jn 17:3; 1Jn 1:3; 2:1; 3:23; 4:2, 15; 5:6, 20)'),
	(SELECT category_id from tbl_category WHERE name='Style')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='The mention of Jesus Christ without previous introduction is characteristic of Johannine style (Jn 17:3; 1Jn 1:3; 2:1; 3:23; 4:2, 15; 5:6, 20)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26062,26096,2,'824503112','2010-06-07',276,'V. 17 contains a new thought of which there was no hint throughout the hymn');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='V. 17 contains a new thought of which there was no hint throughout the hymn'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','15',26062,26096,1,'824503112',1,'2010-06-07',277,'ἐγένετο is characteristic of John','\"came\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='ἐγένετο is characteristic of John'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','2',26062,26096,5,'824503112',1,'2010-06-07',277,'The Johannine thought regarding the law and Moses','\"the law was given through Moses\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='The Johannine thought regarding the law and Moses'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26062,26096,3,'824503112','2010-06-07',277,'The law was only \"given\" by Moses, while grace and truth \"came\" through Jesus Christ');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='The law was only \"given\" by Moses, while grace and truth \"came\" through Jesus Christ'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26062 AND end_verse_id=26096 AND entry_text='The law was only \"given\" by Moses, while grace and truth \"came\" through Jesus Christ'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('1',26063,26096,1,'2010-06-07','Jn 5:37; 6:46; 1Jn 4:12, 20','\"No one has ever seen God at any time\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Jn 5:37; 6:46; 1Jn 4:12, 20'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26063,26096,1,'824503112',1,'2010-06-07',278,'μονογενής and the additional ἐκεῖνος are features of the evangelist\'s style','\"only begotten\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='μονογενής and the additional ἐκεῖνος are features of the evangelist\'s style'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26063,26096,3,'824503112','2010-06-07',278,'The only-begotten Son alone could speak of heavenly things from his own experience (cf. Jn 3:31, 32)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='The only-begotten Son alone could speak of heavenly things from his own experience (cf. Jn 3:31, 32)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26063,26096,4,'824503112',1,'2010-06-07',278,'Anti-Gnostic polemics','\"No one has ever seen God at any time\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Anti-Gnostic polemics'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Anti-Gnostic polemics'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','15',26063,26096,1,'824503112',1,'2010-06-07',279,'The term must mean speaking of things hidden in God, tidings of the divine glory','\"declared\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='The term must mean speaking of things hidden in God, tidings of the divine glory'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','15',26063,26096,1,'824503112',1,'2010-06-07',279,'It is concerned with salvific revelation','\"declared\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='It is concerned with salvific revelation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','15',26063,26096,3,'824503112',1,'2010-06-07',279,'ἐξηγεῖσθαι in pagan Hellenism and Josephus','\"declared\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='ἐξηγεῖσθαι in pagan Hellenism and Josephus'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='ἐξηγεῖσθαι in pagan Hellenism and Josephus'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26063,26096,4,'824503112','2010-06-07',279,'Boismard\'s textual criticism on this verse');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Boismard\'s textual criticism on this verse'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26063,26096,4,'824503112',1,'2010-06-07',279,'Textual criticism: θεός or ὑιός','\"Son\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Textual criticism: θεός or ὑιός'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26063,26096,1,'824503112','2010-06-07',280,'At the end of his prologue, the evangelist affirms once more the full divine dignity of the Son of God on earth, and also his unique capacity as revealer');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='At the end of his prologue, the evangelist affirms once more the full divine dignity of the Son of God on earth, and also his unique capacity as revealer'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26063,26096,1,'824503112','2010-06-07',280,'This verse forms a link between the hymn to the Logos and the presentation of the Gospel');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='This verse forms a link between the hymn to the Logos and the presentation of the Gospel'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`entry_text`,`date_added`)
	VALUES (1,'Jn 3:32','2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Jn 3:32'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (281,'Schnackenberg','7',26063,26096,5,'824503112',1,'2010-06-07',280,'Meaning of this metaphorical expression','\"who is in the bosom of the Father\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Meaning of this metaphorical expression'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Meaning of this metaphorical expression'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Meaning of this metaphorical expression'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Ecc 8:4; Heb 1:2',26046,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26046 AND end_verse_id=26096 AND entry_text='Ecc 8:4; Heb 1:2'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'ἀπέστειλαν is a first aorist liquid verb',26064,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='ἀπέστειλαν is a first aorist liquid verb'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26063,26096,4,'824503112','2010-06-07',285,'Structure of 1:18-51: 1. Testimony before official Judaism (1:18-28); 2. Testimony before Israel (1:29-34); winning of the first disciples to Jesus (1:35-51)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26063 AND end_verse_id=26096 AND entry_text='Structure of 1:18-51: 1. Testimony before official Judaism (1:18-28); 2. Testimony before Israel (1:29-34); winning of the first disciples to Jesus (1:35-51)'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26064,26073,2,'824503112','2010-06-07',286,'1:19-28 is divided into two parts: 1) the Baptist interrogated by the priests and Levites as to the Messianic significance of his person (vv. 19-23); 2) the question as to the meaning of his baptism, put by Pharisees (vv. 24-27)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26073 AND entry_text='1:19-28 is divided into two parts: 1) the Baptist interrogated by the priests and Levites as to the Messianic significance of his person (vv. 19-23); 2) the question as to the meaning of his baptism, put by Pharisees (vv. 24-27)'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26064,26096,4,'824503112',1,'2010-06-07',286,'\"Witnessing\" is indispensable in the Johannine notion of faith (Jn 5:31-37; 8:14, 17, 18)','\"And this is the testimony\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='\"Witnessing\" is indispensable in the Johannine notion of faith (Jn 5:31-37; 8:14, 17, 18)'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='\"Witnessing\" is indispensable in the Johannine notion of faith (Jn 5:31-37; 8:14, 17, 18)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='\"Witnessing\" is indispensable in the Johannine notion of faith (Jn 5:31-37; 8:14, 17, 18)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26064,26096,3,'824503112',1,'2010-06-07',286,'The envoys come from the central authority of the Jews, the Sanhedrin','\"the Jews sent priests and Levites from Jerusalem\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='The envoys come from the central authority of the Jews, the Sanhedrin'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26064,26096,5,'824503112',1,'2010-06-07',287,'Various connotations for \"the Jews\" in John','\"the Jews\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='Various connotations for \"the Jews\" in John'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='Various connotations for \"the Jews\" in John'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='Various connotations for \"the Jews\" in John'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='Various connotations for \"the Jews\" in John'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Mk 11:29-33',26064,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='Mk 11:29-33'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','22',26064,26096,2,'824503112',1,'2010-06-07',288,'Question as to his person (cf. Jn 8:25; 10:24)','\"Who are you?\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26064 AND end_verse_id=26096 AND entry_text='Question as to his person (cf. Jn 8:25; 10:24)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26065,26096,2,'824503112','2010-06-07',288,'Possible political motivations behind the envoys\' question (cf. Jn 11:48)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26065 AND end_verse_id=26096 AND entry_text='Possible political motivations behind the envoys\' question (cf. Jn 11:48)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26065 AND end_verse_id=26096 AND entry_text='Possible political motivations behind the envoys\' question (cf. Jn 11:48)'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`entry_text`,`date_added`)
	VALUES (1,'Lk 3:15','2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Lk 3:15'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26065,26096,2,'824503112',1,'2010-06-07',288,'The pleonastic and emphatic expression and its bearing on contemporary disciples of John (cf. Jn 1:8)','\"He confessed, and did not deny, but confessed\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26065 AND end_verse_id=26096 AND entry_text='The pleonastic and emphatic expression and its bearing on contemporary disciples of John (cf. Jn 1:8)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26065 AND end_verse_id=26096 AND entry_text='The pleonastic and emphatic expression and its bearing on contemporary disciples of John (cf. Jn 1:8)'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg','9',26065,26096,2,'824503112',1,'2010-06-07',288,'The meaning of the emphatic ἐγώ');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26065 AND end_verse_id=26096 AND entry_text='The meaning of the emphatic ἐγώ'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26065 AND end_verse_id=26096 AND entry_text='The meaning of the emphatic ἐγώ'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26066,26096,3,'824503112',1,'2010-06-07',289,'The contemporary expectation of Elijah\'s return','\"Elijah\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='The contemporary expectation of Elijah\'s return'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('7',26066,26096,1,'2010-06-07','Mal 3:1, 23','\"Elijah\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='Mal 3:1, 23'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26066,26096,4,'824503112',1,'2010-06-07',289,'Here John is closer to the Lukan tradition (cf. Mk 9:13; Mt 11:14; 17:12; Lk 1:17)','\"Elijah\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='Here John is closer to the Lukan tradition (cf. Mk 9:13; Mt 11:14; 17:12; Lk 1:17)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='Here John is closer to the Lukan tradition (cf. Mk 9:13; Mt 11:14; 17:12; Lk 1:17)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('13',26066,26096,1,'2010-06-07','Jn 1:25; 6:14; 7:40, 52; Mk 6:15; 8:28; Deut 18:15, 18','\"the Prophet\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='Jn 1:25; 6:14; 7:40, 52; Mk 6:15; 8:28; Deut 18:15, 18'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (290,'Schnackenberg','13',26066,26096,5,'824503112',1,'2010-06-07',289,'Tracing the expectation of \"the prophet\"','\"the Prophet\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='Tracing the expectation of \"the prophet\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26066 AND end_verse_id=26096 AND entry_text='Tracing the expectation of \"the prophet\"'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26067,26096,1,'824503112',1,'2010-06-07',291,'Another sign of the official character of the interrogation','\"That we may give an answer\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26067 AND end_verse_id=26096 AND entry_text='Another sign of the official character of the interrogation'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26067 AND end_verse_id=26096 AND entry_text='Another sign of the official character of the interrogation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26096,'Isa 43',26068,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26068 AND end_verse_id=26096 AND entry_text='Isa 43'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','8',26068,26096,3,'824503112',1,'2010-06-07',291,'John differs from the Synoptics by giving εὐθύνατε instead of ἑτοιμάσατε','\"Make straight\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26068 AND end_verse_id=26096 AND entry_text='John differs from the Synoptics by giving εὐθύνατε instead of ἑτοιμάσατε'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26068,26096,1,'824503112',1,'2010-06-07',291,'Goes with \"the voice of one calling,\" as in the Synoptics, Septuagint, Vulgate, Targum and Peshitta of Isa 40:3, and not with the next words of Isaiah, as in the Masoretes','\"in the desert\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26068 AND end_verse_id=26096 AND entry_text='Goes with \"the voice of one calling,\" as in the Synoptics, Septuagint, Vulgate, Targum and Peshitta of Isa 40:3, and not with the next words of Isaiah, as in the Masoretes'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26068,26096,1,'824503112',1,'2010-06-07',291,'The theological importance of the desert in the history of salvation','\"in the desert\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26068 AND end_verse_id=26096 AND entry_text='The theological importance of the desert in the history of salvation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26068,26096,3,'824503112',1,'2010-06-07',291,'In contrast with the understanding of the Essenes','\"in the desert\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26068 AND end_verse_id=26096 AND entry_text='In contrast with the understanding of the Essenes'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26068 AND end_verse_id=26096 AND entry_text='In contrast with the understanding of the Essenes'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26069,26096,2,'824503112',1,'2010-06-07',292,'The partitive ἐκ is part of the Johannine style','\"from\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26069 AND end_verse_id=26096 AND entry_text='The partitive ἐκ is part of the Johannine style'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (293,'Schnackenberg','5',26069,26096,4,'824503112',1,'2010-06-07',292,'Background on the Pharisees','\"the Pharisees\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26069 AND end_verse_id=26096 AND entry_text='Background on the Pharisees'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26070,26096,3,'824503112','2010-06-07',293,'To the mind of the Pharisees, the baptism administered by John must have a Messianic meaning');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26070 AND end_verse_id=26096 AND entry_text='To the mind of the Pharisees, the baptism administered by John must have a Messianic meaning'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26070,26096,3,'824503112','2010-06-07',293,'The distinctive features of John\'s baptism');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26070 AND end_verse_id=26096 AND entry_text='The distinctive features of John\'s baptism'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26071,26096,3,'824503112','2010-06-07',294,'John\'s baptism fades into insignificance beside his testimony');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26071 AND end_verse_id=26096 AND entry_text='John\'s baptism fades into insignificance beside his testimony'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26071,26096,2,'824503112','2010-06-07',294,'Contrast between ἐγώ and ὑμεῖς');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26071 AND end_verse_id=26096 AND entry_text='Contrast between ἐγώ and ὑμεῖς'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26071 AND end_verse_id=26096 AND entry_text='Contrast between ἐγώ and ὑμεῖς'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26071,26096,3,'824503112',1,'2010-06-07',294,'These words are heavy with foreboding','\"whom you do not know\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26071 AND end_verse_id=26096 AND entry_text='These words are heavy with foreboding'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (295,'Schnackenberg',1,26071,26096,4,'824503112','2010-06-07',294,'Estrangement from Jesus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26071 AND end_verse_id=26096 AND entry_text='Estrangement from Jesus'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26071 AND end_verse_id=26096 AND entry_text='Estrangement from Jesus'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26072,26096,2,'824503112','2010-06-07',295,'Immediate literary dependence on the Synoptics is excluded');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26072 AND end_verse_id=26096 AND entry_text='Immediate literary dependence on the Synoptics is excluded'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26073,26096,2,'824503112','2010-06-07',295,'The place name is trustworthy and is the original reading','\"Bethabara\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26073 AND end_verse_id=26096 AND entry_text='The place name is trustworthy and is the original reading'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26073 AND end_verse_id=26096 AND entry_text='The place name is trustworthy and is the original reading'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26073,26096,5,'824503112','2010-06-07',296,'The location of Bethany','\"Bethabara\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26073 AND end_verse_id=26096 AND entry_text='The location of Bethany'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','8',26073,26096,1,'824503112',1,'2010-06-07',296,'ἦν...βαπτίζων indicates a prolonged activity','\"where John was baptizing\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26073 AND end_verse_id=26096 AND entry_text='ἦν...βαπτίζων indicates a prolonged activity'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (297,'Schnackenberg','1',26074,26096,2,'824503112',1,'2010-06-07',296,'The evangelist gives a date merely to indicate a change of scene and at the same time that the testimony of the Baptist contines','\"The next day\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26074 AND end_verse_id=26096 AND entry_text='The evangelist gives a date merely to indicate a change of scene and at the same time that the testimony of the Baptist contines'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26074 AND end_verse_id=26096 AND entry_text='The evangelist gives a date merely to indicate a change of scene and at the same time that the testimony of the Baptist contines'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26074,26096,2,'824503112',1,'2010-06-07',297,'The enumeration of days begins here and runs to the marriage at Cana (cf. 1:35; 43; 2:1)','\"The next day\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26074 AND end_verse_id=26096 AND entry_text='The enumeration of days begins here and runs to the marriage at Cana (cf. 1:35; 43; 2:1)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','16',26074,26096,5,'824503112',1,'2010-06-07',298,'Expiation of Jesus\' death is meant (cf. 1Jn 1:7; 2:2; 3:5; 4:10; 5:6)','\"who takes away the sin of the world\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26074 AND end_verse_id=26096 AND entry_text='Expiation of Jesus\' death is meant (cf. 1Jn 1:7; 2:2; 3:5; 4:10; 5:6)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26074 AND end_verse_id=26096 AND entry_text='Expiation of Jesus\' death is meant (cf. 1Jn 1:7; 2:2; 3:5; 4:10; 5:6)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (301,'Schnackenberg','12',26074,26096,5,'824503112',1,'2010-06-07',298,'The roots of the expression \"the Lamb of God\"','\"the Lamb of God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26074 AND end_verse_id=26096 AND entry_text='The roots of the expression \"the Lamb of God\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (302,'Schnackenberg',1,26075,26096,3,'824503112','2010-06-07',301,'Refers to the statement about \"who comes after\" in v. 27');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26075 AND end_verse_id=26096 AND entry_text='Refers to the statement about \"who comes after\" in v. 27'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26075 AND end_verse_id=26096 AND entry_text='Refers to the statement about \"who comes after\" in v. 27'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26076,26096,'824503112',1,'2010-06-07',303,'\"Israel\" always has a good sense in John (cf. 1:50; 3:10; 12:13)','\"Israel\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26076 AND end_verse_id=26096 AND entry_text='\"Israel\" always has a good sense in John (cf. 1:50; 3:10; 12:13)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26076 AND end_verse_id=26096 AND entry_text='\"Israel\" always has a good sense in John (cf. 1:50; 3:10; 12:13)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (304,'Schnackenberg',1,26077,26096,1,'824503112','2010-06-07',303,'Full and permanent possession of the Spirit is the distinctive characteristic of the Messiah (cf. Isa 9:2; 61:1)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26077 AND end_verse_id=26096 AND entry_text='Full and permanent possession of the Spirit is the distinctive characteristic of the Messiah (cf. Isa 9:2; 61:1)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26077 AND end_verse_id=26096 AND entry_text='Full and permanent possession of the Spirit is the distinctive characteristic of the Messiah (cf. Isa 9:2; 61:1)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26077,26096,3,'824503112','2010-06-07',304,'Comparison with the Synoptics');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26077 AND end_verse_id=26096 AND entry_text='Comparison with the Synoptics'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26078,26096,2,'824503112','2010-06-07',304,'God himself is behind John\'s testimony in two ways');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26078 AND end_verse_id=26096 AND entry_text='God himself is behind John\'s testimony in two ways'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','28',26078,26096,4,'824503112',1,'2010-06-07',305,'John\'s understanding of this expression','\"He who baptizes with the Holy Spirit\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26078 AND end_verse_id=26096 AND entry_text='John\'s understanding of this expression'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','8',26079,26096,4,'824503112',1,'2010-06-07',305,'The reading ὁ ἐκλκτὸς (\"the elect\") is to be preferred','\"the Son of God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26079 AND end_verse_id=26096 AND entry_text='The reading ὁ ἐκλκτὸς (\"the elect\") is to be preferred'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('8',26079,26096,1,'2010-06-07','Mt 3:17; Mk 1:11; Lk 9:35; Isa 42:1','\"the Son of God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26079 AND end_verse_id=26096 AND entry_text='Mt 3:17; Mk 1:11; Lk 9:35; Isa 42:1'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26080,26096,1,'824503112',1,'2010-06-07',308,'The indication of the day is meant to link the following scene very closely with the testimony of the Baptist','\"the next day\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26080 AND end_verse_id=26096 AND entry_text='The indication of the day is meant to link the following scene very closely with the testimony of the Baptist'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26082,26096,1,'824503112',1,'2010-06-07',308,'ἀκολουθεῖν, here understood for the moment literally, is used metaphorically in John for the dedication of faith (cf. 8:12; 12:36; 10:4, 5, 27)','\"followed\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26082 AND end_verse_id=26096 AND entry_text='ἀκολουθεῖν, here understood for the moment literally, is used metaphorically in John for the dedication of faith (cf. 8:12; 12:36; 10:4, 5, 27)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26082 AND end_verse_id=26096 AND entry_text='ἀκολουθεῖν, here understood for the moment literally, is used metaphorically in John for the dedication of faith (cf. 8:12; 12:36; 10:4, 5, 27)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26082,26096,2,'824503112',1,'2010-06-07',308,'Their \"following\" leads to \"remaining\"','\"followed\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26082 AND end_verse_id=26096 AND entry_text='Their \"following\" leads to \"remaining\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26082 AND end_verse_id=26096 AND entry_text='Their \"following\" leads to \"remaining\"'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','22',26083,26096,1,'824503112',1,'2010-06-07',308,'This question implies a request for an undisturbed conversation','\"Where are you staying?\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26083 AND end_verse_id=26096 AND entry_text='This question implies a request for an undisturbed conversation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26084,26096,2,'824503112',1,'2010-06-07',309,'There is probably a deeper sense in ὄψεσθε','\"See\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26084 AND end_verse_id=26096 AND entry_text='There is probably a deeper sense in ὄψεσθε'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','19',26084,26096,2,'824503112',1,'2010-06-07',309,'The time mentioned indicates the length and fruitfulness of the conversation; it also suggests the importance of the hour for the disciples','\"It was about the tenth hour\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26084 AND end_verse_id=26096 AND entry_text='The time mentioned indicates the length and fruitfulness of the conversation; it also suggests the importance of the hour for the disciples'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26085,26096,3,'824503112','2010-06-07',310,'Problems surrounding the unnamed disciple');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26085 AND end_verse_id=26096 AND entry_text='Problems surrounding the unnamed disciple'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (311,'Schnackenberg','3',26086,26096,5,'824503112',1,'2010-06-07',310,'πρῶτον has given rise to a number of hypotheses','\"first\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26086 AND end_verse_id=26096 AND entry_text='πρῶτον has given rise to a number of hypotheses'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26087,26096,2,'824503112','2010-06-07',311,'Jesus is meant to be seen as the possessor of divine knowledge');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='Jesus is meant to be seen as the possessor of divine knowledge'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26087,26096,1,'824503112',1,'2010-06-07',311,'It is this urgent, personal address (σύ...σύ; cf. v. 49b) which wins Simon','\"you... you\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='It is this urgent, personal address (σύ...σύ; cf. v. 49b) which wins Simon'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='It is this urgent, personal address (σύ...σύ; cf. v. 49b) which wins Simon'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26087,26096,2,'824503112',1,'2010-06-07',311,'\"John\" suggests independent tradition','\"Son of John\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='\"John\" suggests independent tradition'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26087,26096,2,'824503112',1,'2010-06-07',311,'The future κληθήσῃ is a prophecy','\"you shall be called\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='The future κληθήσῃ is a prophecy'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='The future κληθήσῃ is a prophecy'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (312,'Schnackenberg','19',26087,26096,3,'824503112',1,'2010-06-07',311,'Κηφᾶς explains the name Peter','\"Cephas\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='Κηφᾶς explains the name Peter'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='Κηφᾶς explains the name Peter'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26087,26096,3,'824503112','2010-06-07',312,'We have here a clear example of Johannine narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='We have here a clear example of Johannine narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (313,'Schnackenberg',1,26087,26096,5,'824503112','2010-06-07',312,'The importance of Jesus\' words to Peter for the evangelist');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26087 AND end_verse_id=26096 AND entry_text='The importance of Jesus\' words to Peter for the evangelist'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg','14',26088,26096,4,'824503112',1,'2010-06-07',313,'This verse might have been an addition of the redaction');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26088 AND end_verse_id=26096 AND entry_text='This verse might have been an addition of the redaction'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (314,'Schnackenberg','6',26089,26096,3,'824503112',1,'2010-06-07',313,'Identity of Bethsaida','\"Bethsaida\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26089 AND end_verse_id=26096 AND entry_text='Identity of Bethsaida'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26090,26096,4,'824503112',1,'2010-06-07',314,'Identity of Nathanael must be left open','\"Nathanael\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26090 AND end_verse_id=26096 AND entry_text='Identity of Nathanael must be left open'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26090,26096,1,'824503112',1,'2010-06-07',315,'A formula which embraces the whole scripture of the O.T.','\"Moses in the law, and also the prophets, wrote\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26090 AND end_verse_id=26096 AND entry_text='A formula which embraces the whole scripture of the O.T.'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26091,26096,2,'824503112','2010-06-07',316,'The fourth Gospel attributes Jesus\' knowledge to His intimate union with His Father (cf. 3:35; 11:42; 13:3)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26091 AND end_verse_id=26096 AND entry_text='The fourth Gospel attributes Jesus\' knowledge to His intimate union with His Father (cf. 3:35; 11:42; 13:3)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26092,26096,'824503112','2010-06-07',316,'Jesus\' knowledge as presented in John');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26092 AND end_verse_id=26096 AND entry_text='Jesus\' knowledge as presented in John'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26092,26096,2,'824503112','2010-06-07',316,'Jesus\' verdict expresses a high esteem for Nathanael');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26092 AND end_verse_id=26096 AND entry_text='Jesus\' verdict expresses a high esteem for Nathanael'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26092,26096,3,'824503112',1,'2010-06-07',316,'Implications of δόλος in the OT','\"deceit\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26092 AND end_verse_id=26096 AND entry_text='Implications of δόλος in the OT'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26092 AND end_verse_id=26096 AND entry_text='Implications of δόλος in the OT'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26092 AND end_verse_id=26096 AND entry_text='Implications of δόλος in the OT'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26093,26096,3,'824503112','2010-06-07',317,'Various explanations for \"sitting under the fig tree\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26093 AND end_verse_id=26096 AND entry_text='Various explanations for \"sitting under the fig tree\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26094,26096,2,'824503112',1,'2010-06-07',317,'The two-fold σύ indicates a personal warmth of dedication','\"you...you\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='The two-fold σύ indicates a personal warmth of dedication'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26094,26096,3,'824503112',1,'2010-06-07',317,'on σὺ εἶ (\"you are\"), cf., Mt 11:3; 14:28; 16:16; Mk 3:11; Jn 4:19; 6:69; 8:53; 10:24; 11:27','\"you are\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='on σὺ εἶ (\"you are\"), cf., Mt 11:3; 14:28; 16:16; Mk 3:11; Jn 4:19; 6:69; 8:53; 10:24; 11:27'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='on σὺ εἶ (\"you are\"), cf., Mt 11:3; 14:28; 16:16; Mk 3:11; Jn 4:19; 6:69; 8:53; 10:24; 11:27'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','12',26094,26096,3,'824503112',1,'2010-06-07',318,'cf., Jn 12:13; In contrast to \"king of the Jews\"','\"King of Israel\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='cf., Jn 12:13; In contrast to \"king of the Jews\"'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='cf., Jn 12:13; In contrast to \"king of the Jews\"'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='cf., Jn 12:13; In contrast to \"king of the Jews\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (319,'Schnackenberg','7',26094,26096,5,'824503112',1,'2010-06-07',318,'Significance of this title as used by Nathanael','\"Son of God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26094 AND end_verse_id=26096 AND entry_text='Significance of this title as used by Nathanael'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26095,26096,3,'824503112','2010-06-07',319,'Jesus\' answer to Nathanael is not to be taken as skeptical');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26095 AND end_verse_id=26096 AND entry_text='Jesus\' answer to Nathanael is not to be taken as skeptical'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','16',26095,26096,3,'824503112',1,'2010-06-07',319,'Must refer to revelation through the \"signs\" and primarily to the miracle of Cana','\"greater things\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26095 AND end_verse_id=26096 AND entry_text='Must refer to revelation through the \"signs\" and primarily to the miracle of Cana'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26096,26096,2,'824503112',1,'2010-06-07',319,'The use of \"Amen\" is peculiar to Jesus; the doubling is typical of John','\"truly, truly i say to you\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='The use of \"Amen\" is peculiar to Jesus; the doubling is typical of John'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26096,26096,2,'824503112','2010-06-07',320,'Allusion to Gen 28:12');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='Allusion to Gen 28:12'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (321,'Schnackenberg',1,26096,26096,5,'824503112','2010-06-07',320,'The Son of Man is the \"place\" of the full revelation of God');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='The Son of Man is the \"place\" of the full revelation of God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26096,26096,4,'824503112',1,'2010-06-07',321,'The thought behind this expression','\"heaven open\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='The thought behind this expression'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='The thought behind this expression'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','8',26096,26096,2,'824503112',1,'2010-06-07',321,'The disciples will experience in all Jesus\' work the union with God which is his and his alone','\"you will see\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='The disciples will experience in all Jesus\' work the union with God which is his and his alone'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','21',26096,26096,5,'824503112',1,'2010-06-07',322,'cf., Mk 14:62; The vision of glory has been transposed into the present time','\"Son of Man\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='cf., Mk 14:62; The vision of glory has been transposed into the present time'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='cf., Mk 14:62; The vision of glory has been transposed into the present time'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26096 AND end_verse_id=26096 AND entry_text='cf., Mk 14:62; The vision of glory has been transposed into the present time'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26107,26121,2,'824503112','2010-06-07',323,'v. 11 points forward to other signs to come (11a) and rounds off the story of the winning of the first disciples (11c)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='v. 11 points forward to other signs to come (11a) and rounds off the story of the winning of the first disciples (11c)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (326,'Schnackenberg','2',26097,26121,4,'824503112',1,'2010-06-07',325,'the \"third day\" is probably a round number (cf. Lk 12:32) which links up with the foregoing but still points forward','\"On the third day\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26097 AND end_verse_id=26121 AND entry_text='the \"third day\" is probably a round number (cf. Lk 12:32) which links up with the foregoing but still points forward'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (327,'Schnackenberg',1,26099,26121,2,'824503112','2010-06-07',326,'Jewish wedding customs');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26099 AND end_verse_id=26121 AND entry_text='Jewish wedding customs'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26099,26121,2,'824503112','2010-06-07',327,'Comparing the request of Jesus\' mother and that of Mary (Jn 11:22)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26099 AND end_verse_id=26121 AND entry_text='Comparing the request of Jesus\' mother and that of Mary (Jn 11:22)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (329,'Schnackenberg','6',26100,26121,5,'824503112',1,'2010-06-07',328,'Connotes a certain aloofness, but not necessarily dissociation, rejection, or disrespect.','\"Woman, what does your concern have to do with me?\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='Connotes a certain aloofness, but not necessarily dissociation, rejection, or disrespect.'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='Connotes a certain aloofness, but not necessarily dissociation, rejection, or disrespect.'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26100,26121,4,'824503112',1,'2010-06-07',329,'Is this a question or a statement?','\"My hour has not yet come\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='Is this a question or a statement?'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='Is this a question or a statement?'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (330,'Schnackenberg','11',26100,26121,5,'824503112',1,'2010-06-07',329,'Not so much a point of time as a decree issued by the Father','\"My hour has not yet come\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='Not so much a point of time as a decree issued by the Father'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26100,26121,2,'824503112',1,'2010-06-07',329,'Style similar to 7:6-10','\"My hour has not yet come\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='Style similar to 7:6-10'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (331,'Schnackenberg','11',26100,26121,4,'824503112',1,'2010-06-07',330,'\"Hour\" is not necessarily referring to Jesus\' exaltation','\"My hour has not yet come\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26100 AND end_verse_id=26121 AND entry_text='\"Hour\" is not necessarily referring to Jesus\' exaltation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26101,26121,2,'824503112','2010-06-07',331,'A delicate touch in keeping with the biblical picture of Mary (cf. Lk 1:38, 39, 45, 56)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26101 AND end_verse_id=26121 AND entry_text='A delicate touch in keeping with the biblical picture of Mary (cf. Lk 1:38, 39, 45, 56)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26101 AND end_verse_id=26121 AND entry_text='A delicate touch in keeping with the biblical picture of Mary (cf. Lk 1:38, 39, 45, 56)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26102,26121,2,'824503112','2010-06-07',332,'waterpots of stone were prized for purification','\"Waterpots of stone\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26102 AND end_verse_id=26121 AND entry_text='waterpots of stone were prized for purification'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26103,26121,1,'824503112',1,'2010-06-07',332,'This is important to the evangelist, and it shows the greatness of the miracle, the lavishness of Jesus\' gift','\"they filled them up to the brim\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26103 AND end_verse_id=26121 AND entry_text='This is important to the evangelist, and it shows the greatness of the miracle, the lavishness of Jesus\' gift'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26105,26121,2,'824503112','2010-06-07',333,'The miracle was not described, but merely verified by the conduct of the master of the ceremonies (cf. 6:12, 13)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='The miracle was not described, but merely verified by the conduct of the master of the ceremonies (cf. 6:12, 13)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='The miracle was not described, but merely verified by the conduct of the master of the ceremonies (cf. 6:12, 13)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26105,26121,1,'824503112',1,'2010-06-07',333,'The words from καὶ οὐκ to τὸ ὕδωρ should be taken as a parenthesis','\"and did not know...\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='The words from καὶ οὐκ to τὸ ὕδωρ should be taken as a parenthesis'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26105,26121,3,'824503112',1,'2010-06-07',333,'πόθεν has a deeper meaning (cf. Jn 4:11; 7:27, 28; 8:14; 9:29, 30; 19:9)','\"where it came from\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='πόθεν has a deeper meaning (cf. Jn 4:11; 7:27, 28; 8:14; 9:29, 30; 19:9)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='πόθεν has a deeper meaning (cf. Jn 4:11; 7:27, 28; 8:14; 9:29, 30; 19:9)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='πόθεν has a deeper meaning (cf. Jn 4:11; 7:27, 28; 8:14; 9:29, 30; 19:9)'),
	(SELECT category_id from tbl_category WHERE name='word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26105 AND end_verse_id=26121 AND entry_text='πόθεν has a deeper meaning (cf. Jn 4:11; 7:27, 28; 8:14; 9:29, 30; 19:9)'),
	(SELECT category_id from tbl_category WHERE name='topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26097,26107,3,'824503112','2010-06-07',334,'The narrative is of masterly brevity; it falls into three scenes');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26097 AND end_verse_id=26107 AND entry_text='The narrative is of masterly brevity; it falls into three scenes'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26107,26121,2,'824503112','2010-06-07',334,'The three statements are closely linked');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The three statements are closely linked'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26107,26121,3,'824503112','2010-06-07',334,'This revelation of the glory of Jesus is not a timeless \"epiphany\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='This revelation of the glory of Jesus is not a timeless \"epiphany\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26107,26121,2,'824503112','2010-06-07',334,'The epiphany also has its importance for the historical path of Jesus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The epiphany also has its importance for the historical path of Jesus'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26107,26121,2,'824503112','2010-06-07',334,'The exigent character of the self-revelation of Jesus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The exigent character of the self-revelation of Jesus'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26107,26121,3,'824503112','2010-06-07',335,'The three clauses are a programmatic statement of what the \"signs\" essentially are and should be');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The three clauses are a programmatic statement of what the \"signs\" essentially are and should be'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26107,26121,2,'824503112',1,'2010-06-07',335,'The evangelist calls attention to the beginning of Jesus\' self-revelation','\"beginning of signs\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The evangelist calls attention to the beginning of Jesus\' self-revelation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (336,'Schnackenberg','14',26107,26121,5,'824503112',1,'2010-06-07',335,'The glory revealed here is primarily, but not restricted to, his divine and creative power','\"glory\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The glory revealed here is primarily, but not restricted to, his divine and creative power'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The glory revealed here is primarily, but not restricted to, his divine and creative power'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The glory revealed here is primarily, but not restricted to, his divine and creative power'),
	(SELECT category_id from tbl_category WHERE name='Word')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (337,'Schnackenberg','13',26107,26121,3,'824503112',1,'2010-06-07',336,'φανεροῦν is a manifestation visible to the spiritually open eyes of the believer','\"manifested\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='φανεροῦν is a manifestation visible to the spiritually open eyes of the believer'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='φανεροῦν is a manifestation visible to the spiritually open eyes of the believer'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='φανεροῦν is a manifestation visible to the spiritually open eyes of the believer'),
	(SELECT category_id from tbl_category WHERE name='Word')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26107,26121,2,'824503112',1,'2010-06-07',337,'The disciples\' faith had received an essential impulse from the sign','\"believed in Him\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The disciples\' faith had received an essential impulse from the sign'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26107 AND end_verse_id=26121 AND entry_text='The disciples\' faith had received an essential impulse from the sign'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26097,26107,5,'824503112','2010-06-07',337,'Revelation in John is the self-revelation of Jesus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26097 AND end_verse_id=26107 AND entry_text='Revelation in John is the self-revelation of Jesus'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (338,'Schnackenberg',1,26097,26107,4,'824503112','2010-06-07',337,'It is his origin from God and his union with the Father that must be believed and recognized');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26097 AND end_verse_id=26107 AND entry_text='It is his origin from God and his union with the Father that must be believed and recognized'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (339,'Schnackenberg',1,26097,26107,5,'824503112','2010-06-07',338,'Significance of the wine');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26097 AND end_verse_id=26107 AND entry_text='Significance of the wine'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26097 AND end_verse_id=26107 AND entry_text='Significance of the wine'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26108,26133,3,'824503112','2010-06-07',341,'A sharp contrast between the scene in Jerusalem (2:12-3:12) and the prior events in Galilee');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26133 AND entry_text='A sharp contrast between the scene in Jerusalem (2:12-3:12) and the prior events in Galilee'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26133 AND entry_text='A sharp contrast between the scene in Jerusalem (2:12-3:12) and the prior events in Galilee'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26108,26133,2,'824503112','2010-06-07',342,'The presentation need not be reserved for the work of the final redaction');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26133 AND entry_text='The presentation need not be reserved for the work of the final redaction'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26108,26121,2,'824503112','2010-06-07',342,'The statement about the short stay in Capernaum links the marriage feast of Cana with the cleansing of the temple');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26121 AND entry_text='The statement about the short stay in Capernaum links the marriage feast of Cana with the cleansing of the temple'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26121 AND entry_text='The statement about the short stay in Capernaum links the marriage feast of Cana with the cleansing of the temple'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26108,26121,1,'824503112','2010-06-07',343,'Capernaum as the place of Jesus\' residence and the center of his activity (Mt 4:13; 9:1; 17:24-27; Mk 1:29-38; 3:20; 9:33)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26121 AND entry_text='Capernaum as the place of Jesus\' residence and the center of his activity (Mt 4:13; 9:1; 17:24-27; Mk 1:29-38; 3:20; 9:33)'),
	(SELECT category_id from tbl_category WHERE name='Word')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26121 AND entry_text='Capernaum as the place of Jesus\' residence and the center of his activity (Mt 4:13; 9:1; 17:24-27; Mk 1:29-38; 3:20; 9:33)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26108,26121,2,'824503112','2010-06-07',343,'Jesus\' staying, leaving, and avoiding indicates a deliberate purpose');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26108 AND end_verse_id=26121 AND entry_text='Jesus\' staying, leaving, and avoiding indicates a deliberate purpose'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26109,26118,3,'824503112','2010-06-07',344,'A beginning that prefigures the end');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26118 AND entry_text='A beginning that prefigures the end'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26109,26118,4,'824503112','2010-06-07',344,'The construction is strikingly in the nature of a diptych');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26118 AND entry_text='The construction is strikingly in the nature of a diptych'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26118 AND entry_text='The construction is strikingly in the nature of a diptych'),
	(SELECT category_id from tbl_category WHERE name='Structure')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26109,26121,2,'824503112',1,'2010-06-07',345,'The first item in the Johannine \"Calendar of Feasts\" (cf. Jn 2:13, 23; 6:4; 11:55; 12:1)','\"the Passover of the Jews\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26121 AND entry_text='The first item in the Johannine \"Calendar of Feasts\" (cf. Jn 2:13, 23; 6:4; 11:55; 12:1)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26110,26121,2,'824503112','2010-06-07',346,'Jesus condemned the sellers and money changers because they were in the santuary');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26110 AND end_verse_id=26121 AND entry_text='Jesus condemned the sellers and money changers because they were in the santuary'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg','3',26111,26121,1,'824503112',1,'2010-06-07',346,'The Greek word for \"whip\" is from the Latin \"flagellum\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26111 AND end_verse_id=26121 AND entry_text='The Greek word for \"whip\" is from the Latin \"flagellum\"'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26112,26121,2,'824503112','2010-06-07',347,'Jesus\' consciousness of being the Son');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26112 AND end_verse_id=26121 AND entry_text='Jesus\' consciousness of being the Son'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',2,'824503112',1,'2010-06-07',347,'Jesus\' zeal would cost him his life (Ps 68:10 LXX)','\"Has eaten Me up\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Jesus\' zeal would cost him his life (Ps 68:10 LXX)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Jesus\' zeal would cost him his life (Ps 68:10 LXX)'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE entry_text='Jesus\' zeal would cost him his life (Ps 68:10 LXX)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26113,26121,3,'824503112',1,'2010-06-07',347,'The reason that κατέφαγεν is in the future','\"Has eaten Me up\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26113 AND end_verse_id=26121 AND entry_text='The reason that κατέφαγεν is in the future'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26113 AND end_verse_id=26121 AND entry_text='The reason that κατέφαγεν is in the future'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`start_word`,`start_verse_id`,`end_verse_id`,`entry_author_id`,`date_added`,`entry_text`,`heading`)
	VALUES ('1',26113,26121,1,'2010-06-07','His disciples remembering (cf. Jn 12:16)
','\"His disciples\' remembered\"');

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26113,26121,2,'824503112','2010-06-07',348,'The narrative style of the evangelist');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26113 AND end_verse_id=26121 AND entry_text='The narrative style of the evangelist'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26114,26121,2,'824503112',1,'2010-06-07',348,'The authorities involved would be the overseers of the temple','\"the Jews\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26114 AND end_verse_id=26121 AND entry_text='The authorities involved would be the overseers of the temple'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26114,26121,1,'824503112','2010-06-07',348,'ἀπεκρίθησαν καὶ εἶπαν without a previous question is a Hebrewism (cf. Jn 5:17)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26114 AND end_verse_id=26121 AND entry_text='ἀπεκρίθησαν καὶ εἶπαν without a previous question is a Hebrewism (cf. Jn 5:17)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26121,'The demand for a sign (cf. Jn 6:30; Mk 8:11, 12; Mt 12:38, 39; 16:1; Lk 11:16, 29, 30)',26114,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26114 AND end_verse_id=26121 AND entry_text='The demand for a sign (cf. Jn 6:30; Mk 8:11, 12; Mt 12:38, 39; 16:1; Lk 11:16, 29, 30)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26114,26121,2,'824503112','2010-06-07',348,'ὅτι-clause instead of ἵνα-clause');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26114 AND end_verse_id=26121 AND entry_text='ὅτι-clause instead of ἵνα-clause'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26114 AND end_verse_id=26121 AND entry_text='ὅτι-clause instead of ἵνα-clause'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (349,'Schnackenberg',1,26114,26121,3,'824503112','2010-06-07',348,'The intention to stigmatize \"the Jews\" as unbelievers, in contrast to the disciples');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26114 AND end_verse_id=26121 AND entry_text='The intention to stigmatize \"the Jews\" as unbelievers, in contrast to the disciples'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26115,26121,3,'824503112','2010-06-07',349,'The enigmatic saying resembles the procedure of the OT prophets and is in keeping with the procedure of the Johannine Christ');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='The enigmatic saying resembles the procedure of the OT prophets and is in keeping with the procedure of the Johannine Christ'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26115,26121,2,'824503112',1,'2010-06-07',349,'Reason for the use of λύειν and ἐγείρειν','\"Destroy\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='Reason for the use of λύειν and ἐγείρειν'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='Reason for the use of λύειν and ἐγείρειν'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26121,'\"saying on the temple\" (cf. Mt 26:61; 27:40; Mk 14:58; 15:29; Acts 6:14)',26115,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='\"saying on the temple\" (cf. Mt 26:61; 27:40; Mk 14:58; 15:29; Acts 6:14)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26115,26121,4,'824503112','2010-06-07',350,'Differences in the formulation of this saying');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='Differences in the formulation of this saying'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26115,26121,1,'824503112','2010-06-07',350,'Johannine \"misunderstandings\" (cf. Jn 3:3, 4; 4:15, 33; 6:34; 7:35; 8:52, 53, 57; 14:8, 22; 16:7, 8)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='Johannine \"misunderstandings\" (cf. Jn 3:3, 4; 4:15, 33; 6:34; 7:35; 8:52, 53, 57; 14:8, 22; 16:7, 8)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26115,26121,2,'824503112','2010-06-07',350,'Expectation of the eschatological temple (cf. Ezek 40-44; Hab 2:7ff.; Zech 2:5-9)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26115 AND end_verse_id=26121 AND entry_text='Expectation of the eschatological temple (cf. Ezek 40-44; Hab 2:7ff.; Zech 2:5-9)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26116,26121,3,'824503112','2010-06-07',351,'probable dates for the starting and completion of the temple','\"forty-six years\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26116 AND end_verse_id=26121 AND entry_text='probable dates for the starting and completion of the temple'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26117,26121,2,'824503112','2010-06-07',352,'Other similar explanatory remarks: Jn 2:25; 6:6, 64; 9:7; 11:51, 52');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26117 AND end_verse_id=26121 AND entry_text='Other similar explanatory remarks: Jn 2:25; 6:6, 64; 9:7; 11:51, 52'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26117,26121,2,'824503112','2010-06-07',352,'Unity of death and glorification in the \"exaltation\" (cf. Jn 3:14f.; 8:28; 12:23, 32 ff.; 13:31f.; 17:1f.)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26117 AND end_verse_id=26121 AND entry_text='Unity of death and glorification in the \"exaltation\" (cf. Jn 3:14f.; 8:28; 12:23, 32 ff.; 13:31f.; 17:1f.)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26117,26121,2,'824503112','2010-06-07',352,'The power of resurrection attributed to Jesus Himself (cf. Jn 10:18), in contrast to the rest of the NT');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26117 AND end_verse_id=26121 AND entry_text='The power of resurrection attributed to Jesus Himself (cf. Jn 10:18), in contrast to the rest of the NT'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26117,26121,4,'824503112','2010-06-07',352,'Jesus is the true \"house of God\" (cf. 1:51)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26117 AND end_verse_id=26121 AND entry_text='Jesus is the true \"house of God\" (cf. 1:51)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26117 AND end_verse_id=26121 AND entry_text='Jesus is the true \"house of God\" (cf. 1:51)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26118,26121,2,'824503112',1,'2010-06-07',353,'The disciples\' \"remembering\" links v. 22 to v. 17','\"remembered\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26118 AND end_verse_id=26121 AND entry_text='The disciples\' \"remembering\" links v. 22 to v. 17'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26118,26121,3,'824503112','2010-06-07',353,'Interpreting Jesus\' words and actions in terms of post-paschal experience');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26118 AND end_verse_id=26121 AND entry_text='Interpreting Jesus\' words and actions in terms of post-paschal experience'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26118,26121,3,'824503112','2010-06-07',353,'Ultimately, the cleansing of the temple becomes a revelation of his glory (cf. 2:11)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26118 AND end_verse_id=26121 AND entry_text='Ultimately, the cleansing of the temple becomes a revelation of his glory (cf. 2:11)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26118 AND end_verse_id=26121 AND entry_text='Ultimately, the cleansing of the temple becomes a revelation of his glory (cf. 2:11)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (355,'Schnackenberg',1,26109,26118,5,'824503112','2010-06-07',353,'The relationship of the Johannine account to the synoptic narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26118 AND entry_text='The relationship of the Johannine account to the synoptic narrative'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26109,26118,2,'824503112','2010-06-07',355,'The evangelist points to another incident as bring the conflict between Jesus and the authorities to a head--the raising of Lazarus (cf. 11:45-53, 57; 12:9 ff., 17 ff.)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26118 AND entry_text='The evangelist points to another incident as bring the conflict between Jesus and the authorities to a head--the raising of Lazarus (cf. 11:45-53, 57; 12:9 ff., 17 ff.)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (357,'Schnackenberg',1,26109,26118,5,'824503112','2010-06-07',356,'The extent of a deeper symbolism');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26109 AND end_verse_id=26118 AND entry_text='The extent of a deeper symbolism'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26119,26121,2,'824503112','2010-06-07',357,'This short section serves as a theological reflection');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='This short section serves as a theological reflection'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (358,'Schnackenberg',1,26119,26121,4,'824503112','2010-06-07',357,'Efforts to prove that this section is the work of a redactor remain unconvincing');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='Efforts to prove that this section is the work of a redactor remain unconvincing'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='Efforts to prove that this section is the work of a redactor remain unconvincing'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26119,26121,3,'824503112','2010-06-07',358,'The verses are a necessary presupposition or a preparation for the dialogue with Nicodemus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='The verses are a necessary presupposition or a preparation for the dialogue with Nicodemus'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='The verses are a necessary presupposition or a preparation for the dialogue with Nicodemus'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26120,26121,2,'824503112','2010-06-07',358,'The peculiar expression is to be explained by the effort to contrast (αὐτὸς δέ) to the \"faith\" of the crowds');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26120 AND end_verse_id=26121 AND entry_text='The peculiar expression is to be explained by the effort to contrast (αὐτὸς δέ) to the \"faith\" of the crowds'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26120 AND end_verse_id=26121 AND entry_text='The peculiar expression is to be explained by the effort to contrast (αὐτὸς δέ) to the \"faith\" of the crowds'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26119,26121,2,'824503112','2010-06-07',358,'Jesus\' miracles in Jerusalem are mentioned here as incidentally and as summarily as those in Galilee, Jn 6:2');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='Jesus\' miracles in Jerusalem are mentioned here as incidentally and as summarily as those in Galilee, Jn 6:2'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26119,26121,2,'824503112','2010-06-07',358,'The faith of the numerous believers remains, as in Galilee, over-attached to miracles (cf. Jn 4:45, 48)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26119 AND end_verse_id=26121 AND entry_text='The faith of the numerous believers remains, as in Galilee, over-attached to miracles (cf. Jn 4:45, 48)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26120,26121,2,'824503112',1,'2010-06-07',359,'During his whole stay in the city Jesus trust himself to nobody (hence the imperfect)','\"commit\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26120 AND end_verse_id=26121 AND entry_text='During his whole stay in the city Jesus trust himself to nobody (hence the imperfect)'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26120 AND end_verse_id=26121 AND entry_text='During his whole stay in the city Jesus trust himself to nobody (hence the imperfect)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26120,26121,2,'824503112',1,'2010-06-07',359,'The use of πιστεύειν with the reflexive pronoun is singular but well attested outside the NT','\"commit\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26120 AND end_verse_id=26121 AND entry_text='The use of πιστεύειν with the reflexive pronoun is singular but well attested outside the NT'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26120,26121,2,'824503112','2010-06-07',359,'Jesus sees into the hearts of all (cf. Jn 1:48; 5:42)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26120 AND end_verse_id=26121 AND entry_text='Jesus sees into the hearts of all (cf. Jn 1:48; 5:42)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','8',26121,26121,1,'824503112',1,'2010-06-07',359,'\"Man,\" in the singular in the Greek, envisages human inadequacy as such','\"testify of man\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26121 AND end_verse_id=26121 AND entry_text='\"Man,\" in the singular in the Greek, envisages human inadequacy as such'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26121,26121,2,'824503112','2010-06-07',359,'The evangelist\'s conviction of Jesus\' profound insight into the heart stems from his Christology');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26121 AND end_verse_id=26121 AND entry_text='The evangelist\'s conviction of Jesus\' profound insight into the heart stems from his Christology'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (361,'Schnackenberg',1,26134,26142,5,'824503112','2010-06-07',360,'3:13-21 come from a kerygmatic exposition that was not part of the Gospel narrative');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26142 AND entry_text='3:13-21 come from a kerygmatic exposition that was not part of the Gospel narrative'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26142 AND entry_text='3:13-21 come from a kerygmatic exposition that was not part of the Gospel narrative'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (361,'Schnackenberg',1,26152,26157,4,'824503112','2010-06-07',360,'3:31-36 is the first part of the \"kerygmatic discourse,\" followed by 3:13-21');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='3:31-36 is the first part of the \"kerygmatic discourse,\" followed by 3:13-21'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='3:31-36 is the first part of the \"kerygmatic discourse,\" followed by 3:13-21'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26152,26157,3,'824503112','2010-06-07',362,'The dialogue with Nicodemus probably occasioned the composition of the \"kerygmatic discourse\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='The dialogue with Nicodemus probably occasioned the composition of the \"kerygmatic discourse\"'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='The dialogue with Nicodemus probably occasioned the composition of the \"kerygmatic discourse\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26122,26157,3,'824503112','2010-06-07',362,'The procedure that led to the present arrangement');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26122 AND end_verse_id=26157 AND entry_text='The procedure that led to the present arrangement'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (363,'Schnackenberg',1,26122,26157,4,'824503112','2010-06-07',362,'Soundness of the \"kerygmatic discourse\" hypothesis');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26122 AND end_verse_id=26157 AND entry_text='Soundness of the \"kerygmatic discourse\" hypothesis'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26122,26133,2,'824503112','2010-06-07',364,'Jesus\' answer concerning being born from above was supremely important for primitive Christianity, since it explained why Christian baptism was the beginning of salvation');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26122 AND end_verse_id=26133 AND entry_text='Jesus\' answer concerning being born from above was supremely important for primitive Christianity, since it explained why Christian baptism was the beginning of salvation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26122,26157,1,'824503112',1,'2010-06-07',365,'A Greek name and a loan-word in Aramaic','\"Nicodemus\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26122 AND end_verse_id=26157 AND entry_text='A Greek name and a loan-word in Aramaic'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26122,26157,2,'824503112',1,'2010-06-07',365,'A member of the Sanhedrin (cf. Jn 7:50)','\"a ruler of the Jews\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26122 AND end_verse_id=26157 AND entry_text='A member of the Sanhedrin (cf. Jn 7:50)'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (366,'Schnackenberg','5',26123,26157,3,'824503112',1,'2010-06-07',365,'Possible significance of the night','\"by night\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26123 AND end_verse_id=26157 AND entry_text='Possible significance of the night'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26123,26157,3,'824503112',1,'2010-06-07',366,'A polite exaggeration but gives a more universal import','\"We know\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26123 AND end_verse_id=26157 AND entry_text='A polite exaggeration but gives a more universal import'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26124,26157,2,'824503112',1,'2010-06-07',366,'The heavenly realm on high (cf. Jn 14:3; 12:26; 17:24)','\"the kingdom of God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26124 AND end_verse_id=26157 AND entry_text='The heavenly realm on high (cf. Jn 14:3; 12:26; 17:24)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26124 AND end_verse_id=26157 AND entry_text='The heavenly realm on high (cf. Jn 14:3; 12:26; 17:24)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26124,26157,2,'824503112',1,'2010-06-07',367,'It derives from fixed oral tradition','\"the kingdom of God\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26124 AND end_verse_id=26157 AND entry_text='It derives from fixed oral tradition'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (368,'Schnackenberg','13',26124,26157,3,'824503112',1,'2010-06-07',367,'The only justifiable translation is \"born from above\"','\"born again\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26124 AND end_verse_id=26157 AND entry_text='The only justifiable translation is \"born from above\"'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26125,26157,2,'824503112','2010-06-07',368,'Jesus\' hearers reaching wrong and stupid conclusions (cf. Jn 4:15; 6:34, 52; 8:57; 14:8)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26125 AND end_verse_id=26157 AND entry_text='Jesus\' hearers reaching wrong and stupid conclusions (cf. Jn 4:15; 6:34, 52; 8:57; 14:8)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26125 AND end_verse_id=26157 AND entry_text='Jesus\' hearers reaching wrong and stupid conclusions (cf. Jn 4:15; 6:34, 52; 8:57; 14:8)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26124,26157,2,'824503112',1,'2010-06-07',368,'The rebirth here differs from the Hellenistic notion','\"born again\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26124 AND end_verse_id=26157 AND entry_text='The rebirth here differs from the Hellenistic notion'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','14',26124,26157,3,'824503112',1,'2010-06-07',368,'ἄνωθεν designates the divine and heavenly world','\"again\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26124 AND end_verse_id=26157 AND entry_text='ἄνωθεν designates the divine and heavenly world'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26125,26157,3,'824503112','2010-06-07',368,'Nicodemus\' questions are meant to bring out the senseless nature of the doctrine');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26125 AND end_verse_id=26157 AND entry_text='Nicodemus\' questions are meant to bring out the senseless nature of the doctrine'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (369,'Schnackenberg',1,26125,26157,3,'824503112','2010-06-07',368,'Nicodemus has only taken up and analyzed \"being born\" and ignored \"from above\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26125 AND end_verse_id=26157 AND entry_text='Nicodemus has only taken up and analyzed \"being born\" and ignored \"from above\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26125 AND end_verse_id=26157 AND entry_text='Nicodemus has only taken up and analyzed \"being born\" and ignored \"from above\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26126,26157,2,'824503112',1,'2010-06-07',369,'Introduces words of revelation','\"Most assuredly\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26126 AND end_verse_id=26157 AND entry_text='Introduces words of revelation'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26126 AND end_verse_id=26157 AND entry_text='Introduces words of revelation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26126,26157,5,'824503112',1,'2010-06-07',369,'Birth from the Spirit realized concretely in baptism','\"born of water and the Spirit\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26126 AND end_verse_id=26157 AND entry_text='Birth from the Spirit realized concretely in baptism'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26126,26157,'824503112
','2010-06-07',370,'Judaic thought on the Holy Spirit and his eschatological functions');

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26127,26157,3,'824503112','2010-06-07',371,'The impossibility of man\'s attaining the kingdom of God by his own powers comes from the essential difference between the two realms of being');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26127 AND end_verse_id=26157 AND entry_text='The impossibility of man\'s attaining the kingdom of God by his own powers comes from the essential difference between the two realms of being'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26127,26157,2,'824503112','2010-06-07',371,'The frequent εἶναι ἐκ affirms both origin and type of being');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26127 AND end_verse_id=26157 AND entry_text='The frequent εἶναι ἐκ affirms both origin and type of being'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26157,'Jn 1:13; Gen 6:3; Isa 31:3; Job 34:14, 15; Rom 1:3,4; 1Tim 3:16; 1Pet 3:18',26127,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26127 AND end_verse_id=26157 AND entry_text='Jn 1:13; Gen 6:3; Isa 31:3; Job 34:14, 15; Rom 1:3,4; 1Tim 3:16; 1Pet 3:18'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26127,26157,5,'824503112','2010-06-07',372,'Origin of the opposition between the realms of \"flesh\" and \"Spirit\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26127 AND end_verse_id=26157 AND entry_text='Origin of the opposition between the realms of \"flesh\" and \"Spirit\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26127 AND end_verse_id=26157 AND entry_text='Origin of the opposition between the realms of \"flesh\" and \"Spirit\"'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26128,26157,2,'824503112','2010-06-07',373,'Jesus returns to his thesis of v. 3 (inclusio)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26128 AND end_verse_id=26157 AND entry_text='Jesus returns to his thesis of v. 3 (inclusio)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26128,26157,2,'824503112',1,'2010-06-07',373,'A rhetorical phrase (cf. Jn 5:28; 1Jn 3:13)','\"Do not marvel\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26128 AND end_verse_id=26157 AND entry_text='A rhetorical phrase (cf. Jn 5:28; 1Jn 3:13)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','19',26129,26157,2,'824503112',1,'2010-06-07',373,'This is a short parable','\"so\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26129 AND end_verse_id=26157 AND entry_text='This is a short parable'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (374,'Schnackenberg',1,26129,26157,5,'824503112','2010-06-07',373,'The powers of the Spirit are divinely mysterious but recognizable through the effects which he produces in man');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26129 AND end_verse_id=26157 AND entry_text='The powers of the Spirit are divinely mysterious but recognizable through the effects which he produces in man'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26129,26157,2,'824503112','2010-06-07',374,'The phrase \"Pneuma blows where it wills\" is not to be interpreted in terms of the freedom of God\'s election and call to grace and salvation, but as depicting the supernatural process of salvation invisible to man which takes place at baptism and in which the Holy Spirit is at work');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26129 AND end_verse_id=26157 AND entry_text='The phrase \"Pneuma blows where it wills\" is not to be interpreted in terms of the freedom of God\'s election and call to grace and salvation, but as depicting the supernatural process of salvation invisible to man which takes place at baptism and in which the Holy Spirit is at work'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26129,26157,2,'824503112','2010-06-07',374,'Nicodemus should abandon his probings and believe');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26129 AND end_verse_id=26157 AND entry_text='Nicodemus should abandon his probings and believe'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26130,26157,2,'824503112','2010-06-07',374,'Nicodemus\' doubt and obtuseness');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26130 AND end_verse_id=26157 AND entry_text='Nicodemus\' doubt and obtuseness'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26131,26157,2,'824503112','2010-06-07',375,'The rabbinate was ineffective because it needed and lacked faith in the eschatological envoy of God');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26131 AND end_verse_id=26157 AND entry_text='The rabbinate was ineffective because it needed and lacked faith in the eschatological envoy of God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (376,'Schnackenberg',1,26132,26157,5,'824503112','2010-06-07',375,'\"We\" includes Jesus\' disciples (cf. Jn 13:20; 15:20)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26132 AND end_verse_id=26157 AND entry_text='\"We\" includes Jesus\' disciples (cf. Jn 13:20; 15:20)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26132 AND end_verse_id=26157 AND entry_text='\"We\" includes Jesus\' disciples (cf. Jn 13:20; 15:20)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26133,26157,2,'824503112','2010-06-07',377,'The real supposition of εἰ and the hypothetical ἐάν');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26133 AND end_verse_id=26157 AND entry_text='The real supposition of εἰ and the hypothetical ἐάν'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (379,'Schnackenberg','2',26133,26157,5,'824503112',1,'2010-06-07',377,'Meaning of \"earthly things\" and \"heavenly things','\"earthly things\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26133 AND end_verse_id=26157 AND entry_text='Meaning of \"earthly things\" and \"heavenly things'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (378,'Schnackenberg',1,26133,26157,4,'824503112','2010-06-07',377,'Degrees in the knowledge of salvation (cf. 1Cor 3:2; Heb 6:1, 2)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26133 AND end_verse_id=26157 AND entry_text='Degrees in the knowledge of salvation (cf. 1Cor 3:2; Heb 6:1, 2)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26133 AND end_verse_id=26157 AND entry_text='Degrees in the knowledge of salvation (cf. 1Cor 3:2; Heb 6:1, 2)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26134,26157,4,'824503112','2010-06-07',392,'The ascent and descent of the Son of Man is to accomplish God\'s universal salvific will');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='The ascent and descent of the Son of Man is to accomplish God\'s universal salvific will'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','13',26134,26157,3,'824503112',1,'2010-06-07',393,'The aorist καταβάς makes the context historical','\"come down\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='The aorist καταβάς makes the context historical'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='The aorist καταβάς makes the context historical'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26134,26157,2,'824503112',1,'2010-06-07',393,'The perfect ἀναβέβηκεν means that the Son of Man now dwells in the heavenly world continuously','\"has ascended\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='The perfect ἀναβέβηκεν means that the Son of Man now dwells in the heavenly world continuously'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='The perfect ἀναβέβηκεν means that the Son of Man now dwells in the heavenly world continuously'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','14',26134,26157,2,'824503112',1,'2010-06-07',393,'This Christological title is used in John in connection with the thought of ascent (Jn 6:62), \"exaltation\" (Jn 3:14; 12:34) and \"glorification\" (Jn 12:23; 13:31)','\"Son of Man\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='This Christological title is used in John in connection with the thought of ascent (Jn 6:62), \"exaltation\" (Jn 3:14; 12:34) and \"glorification\" (Jn 12:23; 13:31)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='This Christological title is used in John in connection with the thought of ascent (Jn 6:62), \"exaltation\" (Jn 3:14; 12:34) and \"glorification\" (Jn 12:23; 13:31)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','14',26134,26157,2,'824503112',1,'2010-06-07',393,'This title also designates Jesus during his stay on earth (Jn 1:51; 9:35; 12:34) but from the view of his heavenly origin and his return to heaven (cf., Jn 6:27; 13:31)','\"Son of Man\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='This title also designates Jesus during his stay on earth (Jn 1:51; 9:35; 12:34) but from the view of his heavenly origin and his return to heaven (cf., Jn 6:27; 13:31)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='This title also designates Jesus during his stay on earth (Jn 1:51; 9:35; 12:34) but from the view of his heavenly origin and his return to heaven (cf., Jn 6:27; 13:31)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (394,'Schnackenberg','14',26134,26157,4,'824503112',1,'2010-06-07',393,'The Johannine Son of Man concept represents the final and most mature development of the set of thoughts connected with this title','\"Son of Man\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='The Johannine Son of Man concept represents the final and most mature development of the set of thoughts connected with this title'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26134,26157,4,'824503112','2010-06-07',394,'Textual considerations and the difficulties the expression raises','\"who is in heaven\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='Textual considerations and the difficulties the expression raises'),
	(SELECT category_id from tbl_category WHERE name='Text')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26134 AND end_verse_id=26157 AND entry_text='Textual considerations and the difficulties the expression raises'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`entry_author_id`,`end_verse_id`,`entry_text`,`start_verse_id`,`date_added`)
	VALUES (1,26157,'Jn 12:32',26135,'2010-06-07');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26135 AND end_verse_id=26157 AND entry_text='Jn 12:32'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26135,26157,3,'824503112','2010-06-07',395,'A brief kerygmatic formula');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26135 AND end_verse_id=26157 AND entry_text='A brief kerygmatic formula'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (396,'Schnackenberg','2',26135,26157,2,'824503112',1,'2010-06-07',395,'Three points of connection in the typology','\"as\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26135 AND end_verse_id=26157 AND entry_text='Three points of connection in the typology'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (397,'Schnackenberg',1,26135,26157,5,'824503112','2010-06-07',396,'By considering the Crucifixion as a salvific \"exaltation,\" the evangelist takes a most important step in Christology (cf. Isa 52:13)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26135 AND end_verse_id=26157 AND entry_text='By considering the Crucifixion as a salvific \"exaltation,\" the evangelist takes a most important step in Christology (cf. Isa 52:13)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26135 AND end_verse_id=26157 AND entry_text='By considering the Crucifixion as a salvific \"exaltation,\" the evangelist takes a most important step in Christology (cf. Isa 52:13)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26136,26157,1,'824503112',1,'2010-06-07',397,'The goal of salvation (ἵνα) is the giving of life to believers','\"that\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='The goal of salvation (ἵνα) is the giving of life to believers'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='The goal of salvation (ἵνα) is the giving of life to believers'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','5',26136,26157,1,'824503112',1,'2010-06-07',397,' ἐν αὐτῷ does not depend on ὁ πιστεύων but on ἔχῃ, and are placed before it for emphasis','\"in Him\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text=' ἐν αὐτῷ does not depend on ὁ πιστεύων but on ἔχῃ, and are placed before it for emphasis'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (398,'Schnackenberg','5',26136,26157,4,'824503112',1,'2010-06-07',397,'The indication of the object of faith by ἐν: intrinsic union','\"in\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='The indication of the object of faith by ἐν: intrinsic union'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='The indication of the object of faith by ἐν: intrinsic union'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26136,26157,'824503112',1,'2010-06-07',398,'πιστεύειν by itself is used for preference to designate Johannine faith in the full sense','\"believes\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='πιστεύειν by itself is used for preference to designate Johannine faith in the full sense'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26136,26157,1,'824503112',1,'2010-06-07',398,'πιστεύειν in John without any object being expressed (Jn 1:7, 50; 3:12, 18; 4:41, 42, 53; 5:44; 6:36, 47, 64; 9:38; 10:25, 26; 11:15, 40; 12:39; 14:11, 29; 16:31; 19:35; 20:8, 25, 29, 31)','\"believes\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='πιστεύειν in John without any object being expressed (Jn 1:7, 50; 3:12, 18; 4:41, 42, 53; 5:44; 6:36, 47, 64; 9:38; 10:25, 26; 11:15, 40; 12:39; 14:11, 29; 16:31; 19:35; 20:8, 25, 29, 31)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='πιστεύειν in John without any object being expressed (Jn 1:7, 50; 3:12, 18; 4:41, 42, 53; 5:44; 6:36, 47, 64; 9:38; 10:25, 26; 11:15, 40; 12:39; 14:11, 29; 16:31; 19:35; 20:8, 25, 29, 31)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26136,26157,2,'824503112','2010-06-07',398,'The addition μὴ ἀπόληται ἀλλʼ is an intrusion from verse 16');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26136 AND end_verse_id=26157 AND entry_text='The addition μὴ ἀπόληται ἀλλʼ is an intrusion from verse 16'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','6',26137,26157,1,'824503112',1,'2010-06-07',398,'The world of men estranged from God, bereft of divine life and object of his anger (cf. Jn 3:36)','\"the World\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='The world of men estranged from God, bereft of divine life and object of his anger (cf. Jn 3:36)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (399,'Schnackenberg',1,26137,26157,2,'824503112','2010-06-07',398,'The best commentary is provided by 1Jn 4:9, 10');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='The best commentary is provided by 1Jn 4:9, 10'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26137,26157,4,'824503112','2010-06-07',399,'Indicates primarily God\'s sending of the Son into the world','\"He gave\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='Indicates primarily God\'s sending of the Son into the world'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26137,26157,1,'824503112','2010-06-07',399,'God has manifested His love in a historical act (ἠγάπησεν)','\"loved\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='God has manifested His love in a historical act (ἠγάπησεν)'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='God has manifested His love in a historical act (ἠγάπησεν)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (400,'Schnackenberg','8',26137,26157,1,'824503112',1,'2010-06-07',399,'The unusual indicative after ὥστε indicates that the mission of the Son and his delivery to death and immovable facts of history','\"that (ὥστε)\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='The unusual indicative after ὥστε indicates that the mission of the Son and his delivery to death and immovable facts of history'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='The unusual indicative after ὥστε indicates that the mission of the Son and his delivery to death and immovable facts of history'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26137,26157,2,'824503112','2010-06-07',400,'The sharply-contrasted dualistic categories');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='The sharply-contrasted dualistic categories'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='The sharply-contrasted dualistic categories'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','21',26137,26157,1,'824503112',1,'2010-06-07',400,'Jn 17:12; 10:10, 28; 12:25','\"perish\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='Jn 17:12; 10:10, 28; 12:25'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','21',26137,26157,1,'824503112',1,'2010-06-07',400,'John gives it a presential meaning','\"perish\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26137 AND end_verse_id=26157 AND entry_text='John gives it a presential meaning'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','2',26138,26157,2,'824503112',1,'2010-06-07',400,'Explains the emphasizes God\'s purpose','\"for\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26138 AND end_verse_id=26157 AND entry_text='Explains the emphasizes God\'s purpose'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26138 AND end_verse_id=26157 AND entry_text='Explains the emphasizes God\'s purpose'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (401,'Schnackenberg',1,26138,26157,2,'824503112','2010-06-07',400,'The typical Johannine antithesis brings out more strongly the saving love of God');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26138 AND end_verse_id=26157 AND entry_text='The typical Johannine antithesis brings out more strongly the saving love of God'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26138 AND end_verse_id=26157 AND entry_text='The typical Johannine antithesis brings out more strongly the saving love of God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg',1,26138,26157,2,'824503112','2010-06-07',401,'The universal salvific will of God','\"that the world through Him might be saved\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26138 AND end_verse_id=26157 AND entry_text='The universal salvific will of God'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (402,'Schnackenberg',1,26139,26157,4,'824503112','2010-06-07',401,'The \"realized eschatology\" is nowhere so palpable as here');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26139 AND end_verse_id=26157 AND entry_text='The \"realized eschatology\" is nowhere so palpable as here'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','14',26139,26157,1,'824503112',1,'2010-06-07',402,'The perfect tense indicates a persistent state','\"has not believed\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26139 AND end_verse_id=26157 AND entry_text='The perfect tense indicates a persistent state'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (402,'Schnackenberg',1,26139,26157,4,'824503112','2010-06-07',401,'The recurring theme of judgment and unbelief (cf. Jn 3:19ff., 5:39-47; 8:23f., 43-47; 9:39ff.; 10:25f.; 13:37-43; 15:22ff.)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26139 AND end_verse_id=26157 AND entry_text='The recurring theme of judgment and unbelief (cf. Jn 3:19ff., 5:39-47; 8:23f., 43-47; 9:39ff.; 10:25f.; 13:37-43; 15:22ff.)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26139 AND end_verse_id=26157 AND entry_text='The recurring theme of judgment and unbelief (cf. Jn 3:19ff., 5:39-47; 8:23f., 43-47; 9:39ff.; 10:25f.; 13:37-43; 15:22ff.)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26139,26157,4,'824503112','2010-06-07',403,'John\'s kerygmatic thinking does not exclude a future judgment, but helps to avoid too naive ideas of the \"last judgment\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26139 AND end_verse_id=26157 AND entry_text='John\'s kerygmatic thinking does not exclude a future judgment, but helps to avoid too naive ideas of the \"last judgment\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26140,26157,1,'824503112','2010-06-07',403,'The evangelist turns (δέ) once more to the historical process and recognizes that men in fact have preferred darkness to light (aorist)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26140 AND end_verse_id=26157 AND entry_text='The evangelist turns (δέ) once more to the historical process and recognizes that men in fact have preferred darkness to light (aorist)'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26140,26157,3,'824503112','2010-06-07',404,'A judgment, which unbelief brings about, is also brought about by Jesus\' revelation');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26140 AND end_verse_id=26157 AND entry_text='A judgment, which unbelief brings about, is also brought about by Jesus\' revelation'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26140,26157,1,'824503112','2010-06-07',404,'The purpose of the evangelist is to display the personal responsibility of unbelievers and the horror of their act in its true colours');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26140 AND end_verse_id=26157 AND entry_text='The purpose of the evangelist is to display the personal responsibility of unbelievers and the horror of their act in its true colours'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES (406,'Schnackenberg','23',26140,26157,5,'824503112',1,'2010-06-07',405,'Apparent contradiction with passages that affirm of the Father\'s working','\"because their deeds were evil\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26140 AND end_verse_id=26157 AND entry_text='Apparent contradiction with passages that affirm of the Father\'s working'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26141,26157,1,'824503112','2010-06-07',406,'The same idea of evil-doers hating the light is often found in the OT (cf., Job 24:13-17; 38:12f.; Isa 29:15; Jer 49:9; Ps 11:2; 91:5');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26141 AND end_verse_id=26157 AND entry_text='The same idea of evil-doers hating the light is often found in the OT (cf., Job 24:13-17; 38:12f.; Isa 29:15; Jer 49:9; Ps 11:2; 91:5'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26141 AND end_verse_id=26157 AND entry_text='The same idea of evil-doers hating the light is often found in the OT (cf., Job 24:13-17; 38:12f.; Isa 29:15; Jer 49:9; Ps 11:2; 91:5'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (407,'Schnackenberg',1,26141,26157,3,'824503112','2010-06-07',406,'Deeper explanation of the principles involved');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26141 AND end_verse_id=26157 AND entry_text='Deeper explanation of the principles involved'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26142,26157,1,'824503112',1,'2010-06-07',407,'This turn of phrase is Semitic','\"he who does the truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26142 AND end_verse_id=26157 AND entry_text='This turn of phrase is Semitic'),
	(SELECT category_id from tbl_category WHERE name='Source')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26142,26157,1,'824503112',1,'2010-06-07',407,'\"Truth\" is totally opposed to the \"lie,\" the falsehood and wickedness which comes from the devil (Jn 8:44; 1Jn 2:21; Rom 1:25; 2Thess 2:9f.)','\"truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26142 AND end_verse_id=26157 AND entry_text='\"Truth\" is totally opposed to the \"lie,\" the falsehood and wickedness which comes from the devil (Jn 8:44; 1Jn 2:21; Rom 1:25; 2Thess 2:9f.)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','1',26142,26157,2,'824503112',1,'2010-06-07',407,'Those who strive to do God\'s truth have the disposition to hear the truth in Christ','\"he who does the truth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26142 AND end_verse_id=26157 AND entry_text='Those who strive to do God\'s truth have the disposition to hear the truth in Christ'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','10',26142,26157,3,'824503112',1,'2010-06-07',408,'The point of the ἵνα-clause is not that the works of him who \"does the truth\" should be clearly seen, but that it should be clearly seen that they are \"done in God\"','\"that\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26142 AND end_verse_id=26157 AND entry_text='The point of the ἵνα-clause is not that the works of him who \"does the truth\" should be clearly seen, but that it should be clearly seen that they are \"done in God\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26142,26157,2,'824503112','2010-06-07',408,'Kinship between the children of God and the Son of God (cf., Jn 11:52); intrinsic relationship moral behavior and faith (1Jn 1:6f.; 2:3f., 9ff.; 3:14, 19; 5:2f.)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26142 AND end_verse_id=26157 AND entry_text='Kinship between the children of God and the Son of God (cf., Jn 11:52); intrinsic relationship moral behavior and faith (1Jn 1:6f.; 2:3f., 9ff.; 3:14, 19; 5:2f.)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26142 AND end_verse_id=26157 AND entry_text='Kinship between the children of God and the Son of God (cf., Jn 11:52); intrinsic relationship moral behavior and faith (1Jn 1:6f.; 2:3f., 9ff.; 3:14, 19; 5:2f.)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (412,'Schnackenberg',1,26143,26157,5,'824503112','2010-06-07',411,'Possibly some disciples of Jesus continued to baptize in the spirit of John in order to gain followers for Jesus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26143 AND end_verse_id=26157 AND entry_text='Possibly some disciples of Jesus continued to baptize in the spirit of John in order to gain followers for Jesus'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26143 AND end_verse_id=26157 AND entry_text='Possibly some disciples of Jesus continued to baptize in the spirit of John in order to gain followers for Jesus'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26144,26157,2,'824503112','2010-06-07',412,'The relationship between the Baptist to Jesus remains unexplained and inexplicable');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26144 AND end_verse_id=26157 AND entry_text='The relationship between the Baptist to Jesus remains unexplained and inexplicable'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26144 AND end_verse_id=26157 AND entry_text='The relationship between the Baptist to Jesus remains unexplained and inexplicable'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (413,'Schnackenberg',1,26144,26157,4,'824503112','2010-06-07',412,'Aenon\'s location');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26144 AND end_verse_id=26157 AND entry_text='Aenon\'s location'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26144,26157,1,'824503112','2010-06-07',413,'The place where John was baptizing was a good distance away from Jesus');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26144 AND end_verse_id=26157 AND entry_text='The place where John was baptizing was a good distance away from Jesus'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26145,26157,2,'824503112','2010-06-07',413,'This remark is important for the relationship with the Synoptics');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26145 AND end_verse_id=26157 AND entry_text='This remark is important for the relationship with the Synoptics'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26145 AND end_verse_id=26157 AND entry_text='This remark is important for the relationship with the Synoptics'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (414,'Schnackenberg',1,26146,26157,2,'824503112','2010-06-07',413,'In the context, the argument was on the comparative values of the baptism of Jesus and that of John');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26146 AND end_verse_id=26157 AND entry_text='In the context, the argument was on the comparative values of the baptism of Jesus and that of John'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26146,26157,3,'824503112',1,'2010-06-07',414,'The plural reading is secondary','\"the Jews\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26146 AND end_verse_id=26157 AND entry_text='The plural reading is secondary'),
	(SELECT category_id from tbl_category WHERE name='Text')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','11',26146,26157,3,'824503112',1,'2010-06-07',414,'Intrinsic purity and absolution of sins','\"purification\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26146 AND end_verse_id=26157 AND entry_text='Intrinsic purity and absolution of sins'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26146,26157,1,'824503112','2010-06-07',414,'We catch a glimpse of the conflict between the Church and the disciples of John');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26146 AND end_verse_id=26157 AND entry_text='We catch a glimpse of the conflict between the Church and the disciples of John'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26147,26157,1,'824503112','2010-06-07',414,'cf. the typical οὗτος as in Jn 1:7; 3:2');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26147 AND end_verse_id=26157 AND entry_text='cf. the typical οὗτος as in Jn 1:7; 3:2'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26147 AND end_verse_id=26157 AND entry_text='cf. the typical οὗτος as in Jn 1:7; 3:2'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (415,'Schnackenberg',1,26147,26157,2,'824503112','2010-06-07',414,'The small-minded jealousy of the disciples of John');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26147 AND end_verse_id=26157 AND entry_text='The small-minded jealousy of the disciples of John'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg','7',26148,26157,3,'824503112',1,'2010-06-07',415,'ἄνθρωπος is probably Semitism, used here in a vague sense for τις');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26148 AND end_verse_id=26157 AND entry_text='ἄνθρωπος is probably Semitism, used here in a vague sense for τις'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26148,26157,3,'824503112','2010-06-07',415,'The construction διδόναι with the infinitive is common; see the exact parallels in Jn 6:65; 19:11');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26148 AND end_verse_id=26157 AND entry_text='The construction διδόναι with the infinitive is common; see the exact parallels in Jn 6:65; 19:11'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','8',26148,26157,3,'824503112',1,'2010-06-07',415,'λαμβάνειν here must mean \"take\"','\"receive\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26148 AND end_verse_id=26157 AND entry_text='λαμβάνειν here must mean \"take\"'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','18',26149,26157,1,'824503112',1,'2010-06-07',416,'ἐκεῖνος is characteristic of the style of the evangelist','ἐκεῖνος');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26149 AND end_verse_id=26157 AND entry_text='ἐκεῖνος is characteristic of the style of the evangelist'),
	(SELECT category_id from tbl_category WHERE name='Style')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26150,26157,3,'824503112',1,'2010-06-07',416,'Background on the role of the friend of the bridegroom','\"the friend of the bridegroom\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26150 AND end_verse_id=26157 AND entry_text='Background on the role of the friend of the bridegroom'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','20',26150,26157,2,'824503112',1,'2010-06-07',416,'Possible meaning of the \"voice of the bridegroom\"','\"the bridegroom\'s voice\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26150 AND end_verse_id=26157 AND entry_text='Possible meaning of the \"voice of the bridegroom\"'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','3',26150,26157,2,'824503112',1,'2010-06-07',417,'The evangelist and his Christian readers must have interpreted the \"bride\" as the Messianic community','\"the bride\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26150 AND end_verse_id=26157 AND entry_text='The evangelist and his Christian readers must have interpreted the \"bride\" as the Messianic community'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26150,26157,3,'824503112','2010-06-07',417,'The parable has nothing to do with the Hellenistic or Gnostic notion of the \"sacred marriage\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26150 AND end_verse_id=26157 AND entry_text='The parable has nothing to do with the Hellenistic or Gnostic notion of the \"sacred marriage\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26150 AND end_verse_id=26157 AND entry_text='The parable has nothing to do with the Hellenistic or Gnostic notion of the \"sacred marriage\"'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26151,26157,2,'824503112','2010-06-07',417,'The growth and decrease do not refer directly to the number of followers, but to the power and influence which each exercises');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26151 AND end_verse_id=26157 AND entry_text='The growth and decrease do not refer directly to the number of followers, but to the power and influence which each exercises'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26152,26157,1,'824503112',1,'2010-06-07',381,'ἐπάνω keeps to the metaphor of ἄνωθεν','ἐπάνω');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='ἐπάνω keeps to the metaphor of ἄνωθεν'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','4',26152,26157,2,'824503112',1,'2010-06-07',381,'The spatial category implies a judgment of rank and value','ἐπάνω');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='The spatial category implies a judgment of rank and value'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','7',26152,26157,2,'824503112',1,'2010-06-07',381,'The singular means men in general','\"he who is of the earth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='The singular means men in general'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','9',26152,26157,2,'824503112',1,'2010-06-07',382,'Brings out the two meanings of ἐκ: origin and type','ἐκ...ἐκ');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='Brings out the two meanings of ἐκ: origin and type'),
	(SELECT category_id from tbl_category WHERE name='Semantics')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='Brings out the two meanings of ἐκ: origin and type'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26152,26157,3,'824503112','2010-06-07',382,'This \"dualism\" is very far from being Gnostic, and remains in the line of Jewish thought');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='This \"dualism\" is very far from being Gnostic, and remains in the line of Jewish thought'),
	(SELECT category_id from tbl_category WHERE name='Historical')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','17',26152,26157,3,'824503112',1,'2010-06-07',382,'Reminiscence of the interventions of Nicodemus (Jn 3:4, 9)','\"speaks of the earth\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='Reminiscence of the interventions of Nicodemus (Jn 3:4, 9)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26152,26157,3,'824503112','2010-06-07',383,'Probable intentions of the redactors');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26152 AND end_verse_id=26157 AND entry_text='Probable intentions of the redactors'),
	(SELECT category_id from tbl_category WHERE name='Redaction')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26153,26157,2,'824503112','2010-06-07',383,'Jesus\' direct knowledge and experience described by the analogy of human \"seeing\" and \"hearing\" (cf. Jn 1:18; 6:46; 8:26, 40; 15:15)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Jesus\' direct knowledge and experience described by the analogy of human \"seeing\" and \"hearing\" (cf. Jn 1:18; 6:46; 8:26, 40; 15:15)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Jesus\' direct knowledge and experience described by the analogy of human \"seeing\" and \"hearing\" (cf. Jn 1:18; 6:46; 8:26, 40; 15:15)'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Jesus\' direct knowledge and experience described by the analogy of human \"seeing\" and \"hearing\" (cf. Jn 1:18; 6:46; 8:26, 40; 15:15)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26153,26157,3,'824503112','2010-06-07',384,'Because of Jesus\' direct access to revelation, he can affirm that his doctrine is not his own (Jn 7:16; cf. 8:26, 28; 12:49; 14:24)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Because of Jesus\' direct access to revelation, he can affirm that his doctrine is not his own (Jn 7:16; cf. 8:26, 28; 12:49; 14:24)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Because of Jesus\' direct access to revelation, he can affirm that his doctrine is not his own (Jn 7:16; cf. 8:26, 28; 12:49; 14:24)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Because of Jesus\' direct access to revelation, he can affirm that his doctrine is not his own (Jn 7:16; cf. 8:26, 28; 12:49; 14:24)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26153,26157,2,'824503112','2010-06-07',384,'Since his revelation comes from immediate \"perception,\" his doctrine takes the form of a testimony (cf. Jn 8:14)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Since his revelation comes from immediate \"perception,\" his doctrine takes the form of a testimony (cf. Jn 8:14)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Since his revelation comes from immediate \"perception,\" his doctrine takes the form of a testimony (cf. Jn 8:14)'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Since his revelation comes from immediate \"perception,\" his doctrine takes the form of a testimony (cf. Jn 8:14)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26153,26157,1,'824503112','2010-06-07',384,'What this heavenly witness discloses is the divine truth itself (cf. Jn 8:32, 40, 45; 17:17; 18:37)');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='What this heavenly witness discloses is the divine truth itself (cf. Jn 8:32, 40, 45; 17:17; 18:37)'),
	(SELECT category_id from tbl_category WHERE name='cf')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='What this heavenly witness discloses is the divine truth itself (cf. Jn 8:32, 40, 45; 17:17; 18:37)'),
	(SELECT category_id from tbl_category WHERE name='Topic')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26154,26157,2,'824503112','2010-06-07',384,'The twofold sense of God\'s truthfulness: the truth of God\'s word and God\'s fidelity to his word');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26154 AND end_verse_id=26157 AND entry_text='The twofold sense of God\'s truthfulness: the truth of God\'s word and God\'s fidelity to his word'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,26153,26157,2,'824503112','2010-06-07',384,'Reason for placing \"seeing\" before \"hearing\"');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Reason for placing \"seeing\" before \"hearing\"'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='Reason for placing \"seeing\" before \"hearing\"'),
	(SELECT category_id from tbl_category WHERE name='Form')
);

INSERT INTO tbl_entry
	(`ref_author`,`start_word`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`entry_author_id`,`date_added`,`ref_start_page_num`,`entry_text`,`heading`)
	VALUES ('Schnackenberg','2',26153,26157,2,'824503112',1,'2010-06-07',384,'The difference of tenses is probably only to vary the style','ἑώρακεν καὶ ἤκουσεν ');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='The difference of tenses is probably only to vary the style'),
	(SELECT category_id from tbl_category WHERE name='Syntax')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=26153 AND end_verse_id=26157 AND entry_text='The difference of tenses is probably only to vary the style'),
	(SELECT category_id from tbl_category WHERE name='Style')
);


-- END ENTRIES INSERTION FOR John--


-- BEGIN INSERTION FOR 1 Timothy --

INSERT INTO tbl_entry
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Schnackenberg',1,29748,29748,1,'824503112','2010-06-07',268,'Contrast between the \"fleshly\" and \"pneumatic\" modes of Christ\'s being');
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=29748 AND end_verse_id=29748 AND entry_text='Contrast between the \"fleshly\" and \"pneumatic\" modes of Christ\'s being'),
	(SELECT category_id from tbl_category WHERE name='Form')
);
INSERT INTO tbl_entry_category
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry WHERE start_verse_id=29748 AND end_verse_id=29748 AND entry_text='Contrast between the \"fleshly\" and \"pneumatic\" modes of Christ\'s being'),
	(SELECT category_id from tbl_category WHERE name='Interpretation')
);


-- END ENTRIES INSERTION FOR 1 Timothy--

