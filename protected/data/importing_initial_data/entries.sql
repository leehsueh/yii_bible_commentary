-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2010 at 12:14 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `bible_commentary`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_test`
--

DROP TABLE IF EXISTS `tbl_category_test`;
CREATE TABLE `tbl_category_test` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` tinytext,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_category_test`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_entry_category_test`
--

DROP TABLE IF EXISTS `tbl_entry_category_test`;
CREATE TABLE `tbl_entry_category_test` (
  `entry_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_entry_category_test`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_entry_test`
--

DROP TABLE IF EXISTS `tbl_entry_test`;
CREATE TABLE `tbl_entry_test` (
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
-- END TABLE CREATION --

INSERT INTO tbl_category_test (name) VALUES ('Form');
INSERT INTO tbl_category_test (name) VALUES ('Structure');

-- END CATEGORIES INSERTION --

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,1,'816404569','2010-05-25',25,'Attribution of utterances in Deuteronomy');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='Attribution of utterances in Deuteronomy'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5,'816404569','2010-05-25',29,'Deuteronomy emphasizes a distinction between the word of Moses and the word of the narrator');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='Deuteronomy emphasizes a distinction between the word of Moses and the word of the narrator'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,3,'816404569','2010-05-25',31,'The narrator\'s subtle but powerful claim to his audience to be the sole interpreter of Moses\' words');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='The narrator\'s subtle but powerful claim to his audience to be the sole interpreter of Moses\' words'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_end_page_num`,`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES (41,'Polzin',1,5,'816404569','2010-05-25',40,'Frame-breakers as author\'s device');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='Frame-breakers as author\'s device'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='Frame-breakers as author\'s device'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4899,5045,1,'816404569','2010-05-25',36,'The first address of Moses (1:6-4:40)');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=4899 AND end_verse_id=5045 AND entry_text='The first address of Moses (1:6-4:40)'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4894,5054,3,'816404569','2010-05-25',32,'Switching back and forth between \"that day\" and \"this day\"');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=4894 AND end_verse_id=5054 AND entry_text='Switching back and forth between \"that day\" and \"this day\"'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,4894,5054,5,'816404569','2010-05-25',40,'The switch from direct to indirect speech in chapter 4');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=4894 AND end_verse_id=5054 AND entry_text='The switch from direct to indirect speech in chapter 4'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5006,5054,5,'816404569','2010-05-25',41,'Chapter 4 divides into two evaluative sections');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5006 AND end_verse_id=5054 AND entry_text='Chapter 4 divides into two evaluative sections'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,2,'816404569','2010-05-25',43,'The bracketing of utterances of mercy and grace with neutralizing statements of a retributive nature is a consistent pattern in the Book of Deuteronomy');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='The bracketing of utterances of mercy and grace with neutralizing statements of a retributive nature is a consistent pattern in the Book of Deuteronomy'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5680,'816404569','2010-05-25',43,'The second address of Moses (5:1b-28:68)');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5055 AND end_verse_id=5680 AND entry_text='The second address of Moses (5:1b-28:68)'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5045,5054,4,'816404569','2010-05-25',43,'Two voices conjoined here in the final verse of Moses\' first address');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5045 AND end_verse_id=5054 AND entry_text='Two voices conjoined here in the final verse of Moses\' first address'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,'816404569','2010-05-25',43,'Interplay of two voices essential to the semantic authority that unifies Deuteronomy and the entire Deuteronomic History');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='Interplay of two voices essential to the semantic authority that unifies Deuteronomy and the entire Deuteronomic History'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5046,5048,2,'816404569','2010-05-25',43,'4:41-43 provides a concluding frame to Moses\' first address');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5046 AND end_verse_id=5048 AND entry_text='4:41-43 provides a concluding frame to Moses\' first address'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5046 AND end_verse_id=5048 AND entry_text='4:41-43 provides a concluding frame to Moses\' first address'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5049,5055,2,'816404569','2010-05-25',43,'4:44-5:1a constitutes the introductory frame to Moses\' second, main address');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5049 AND end_verse_id=5055 AND entry_text='4:44-5:1a constitutes the introductory frame to Moses\' second, main address'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5049 AND end_verse_id=5055 AND entry_text='4:44-5:1a constitutes the introductory frame to Moses\' second, main address'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5242,5582,1,'816404569','2010-05-25',43,'12:1-26:15 is the so called Deuteronomic law-code');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5242 AND end_verse_id=5582 AND entry_text='12:1-26:15 is the so called Deuteronomic law-code'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5242 AND end_verse_id=5582 AND entry_text='12:1-26:15 is the so called Deuteronomic law-code'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5242,5582,5,'816404569','2010-05-25',57,'The lawcode of chapters 12-26 has Moses both reporting and interpreting God\'s words');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5242 AND end_verse_id=5582 AND entry_text='The lawcode of chapters 12-26 has Moses both reporting and interpreting God\'s words'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5059,5,'816404569','2010-05-25',45,'Alternation between \"I vs. you\" and \"our/us\"');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5055 AND end_verse_id=5059 AND entry_text='Alternation between \"I vs. you\" and \"our/us\"'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5241,5,'816404569','2010-05-25',47,'5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5055 AND end_verse_id=5241 AND entry_text='5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5583,5680,5,'816404569','2010-05-25',47,'5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5583 AND end_verse_id=5680 AND entry_text='5:1-11:32 and 26:16-28:68 are Mosaic utterances that frame the lawcode'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5055,5241,2,'816404569','2010-05-25',47,'5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5055 AND end_verse_id=5241 AND entry_text='5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`start_verse_id`,`end_verse_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,5583,5680,2,'816404569','2010-05-25',47,'5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE start_verse_id=5583 AND end_verse_id=5680 AND entry_text='5:1-11:32 and 26:16-28:68 contain far fewer quotations of God in direct discourse than the first address'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);

INSERT INTO tbl_entry_test
	(`ref_author`,`entry_author_id`,`depth`,`ref_source`,`date_added`,`ref_start_page_num`,`entry_text`)
	VALUES ('Polzin',1,3,'816404569','2010-05-25',48,'The over-all composition of Deuteronomy is one in which we read how Moses is described as declaring and interpreting the word of God as a panoramic preview of how the Deuteronomic narrator will describe and interpret the word of Moses in Joshua-2 Kings');
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='The over-all composition of Deuteronomy is one in which we read how Moses is described as declaring and interpreting the word of God as a panoramic preview of how the Deuteronomic narrator will describe and interpret the word of Moses in Joshua-2 Kings'),
	(SELECT category_id from tbl_category_test WHERE name='Form')
);
INSERT INTO tbl_entry_category_test
	(`entry_id`,`category_id`)
VALUES (
	(SELECT entry_id from tbl_entry_test WHERE entry_text='The over-all composition of Deuteronomy is one in which we read how Moses is described as declaring and interpreting the word of God as a panoramic preview of how the Deuteronomic narrator will describe and interpret the word of Moses in Joshua-2 Kings'),
	(SELECT category_id from tbl_category_test WHERE name='Structure')
);


-- END ENTRIES INSERTION --

