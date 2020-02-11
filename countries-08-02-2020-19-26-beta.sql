-- Generation time: Sat, 08 Feb 2020 19:26:03 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_25
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Страны';

INSERT INTO `countries` VALUES ('1','Macedonia'),
('2','Martinique'),
('3','Gabon'),
('4','Micronesia'),
('5','Lithuania'),
('6','Equatorial Guinea'),
('7','Morocco'),
('8','Djibouti'),
('9','Mauritius'),
('10','Switzerland'),
('11','Dominican Republic'),
('12','Liberia'),
('13','Panama'),
('14','Tokelau'),
('15','Qatar'),
('16','Albania'),
('17','Haiti'),
('18','Tokelau'),
('19','Papua New Guinea'),
('20','Japan'),
('21','Moldova'),
('22','Seychelles'),
('23','Senegal'),
('24','Saudi Arabia'),
('25','Jersey'),
('26','Marshall Islands'),
('27','Trinidad and Tobago'),
('28','Guam'),
('29','Heard Island and McDonald Islands'),
('30','Sao Tome and Principe'),
('31','Russian Federation'),
('32','Albania'),
('33','Mozambique'),
('34','Somalia'),
('35','Czech Republic'),
('36','Peru'),
('37','Netherlands Antilles'),
('38','Rwanda'),
('39','Egypt'),
('40','Estonia'),
('41','Greece'),
('42','Andorra'),
('43','Samoa'),
('44','Samoa'),
('45','Liberia'),
('46','Kuwait'),
('47','Saint Martin'),
('48','Saint Barthelemy'),
('49','Burkina Faso'),
('50','Kyrgyz Republic'),
('51','Bolivia'),
('52','Svalbard & Jan Mayen Islands'),
('53','Hungary'),
('54','Kazakhstan'),
('55','Korea'),
('56','Georgia'),
('57','South Georgia and the South Sandwich Islands'),
('58','Eritrea'),
('59','Libyan Arab Jamahiriya'),
('60','Uzbekistan'),
('61','Micronesia'),
('62','Angola'),
('63','Bolivia'),
('64','Burkina Faso'),
('65','Greece'),
('66','Samoa'),
('67','Israel'),
('68','Syrian Arab Republic'),
('69','Barbados'),
('70','Madagascar'),
('71','Jamaica'),
('72','Philippines'),
('73','Moldova'),
('74','Saint Lucia'),
('75','Saint Helena'),
('76','Swaziland'),
('77','Congo'),
('78','Afghanistan'),
('79','Wallis and Futuna'),
('80','Senegal'),
('81','Heard Island and McDonald Islands'),
('82','Lebanon'),
('83','Sweden'),
('84','Isle of Man'),
('85','Martinique'),
('86','Dominican Republic'),
('87','Tokelau'),
('88','Sierra Leone'),
('89','Djibouti'),
('90','Czech Republic'),
('91','Lebanon'),
('92','Afghanistan'),
('93','Argentina'),
('94','Samoa'),
('95','Ghana'),
('96','Falkland Islands (Malvinas)'),
('97','Cyprus'),
('98','British Virgin Islands'),
('99','Libyan Arab Jamahiriya'),
('100','Montserrat'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

