-- Generation time: Sat, 08 Feb 2020 22:02:10 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_23
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

DROP TABLE IF EXISTS `cinemas`;
CREATE TABLE `cinemas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cinema_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Кинотеатр';

INSERT INTO `cinemas` VALUES ('1','Aut aut voluptas.','131 Volkman Manors','22'),
('2','Suscipit dolore.','91564 Bernier Track Suite 223','21'),
('3','Veritatis est perferendis sint ut.','3908 Dorothy Mountain Apt. 480','16'),
('4','Voluptates velit aspernatur.','93042 Monroe Ports','10'),
('5','Libero iste tempore ut.','862 Abernathy Mission','24'),
('6','Aut ab.','2994 Friesen Mills Suite 418','20'),
('7','Deserunt dolor illo et.','2519 Greenholt Keys','22'),
('8','Quos ipsum dolores.','890 Damaris Turnpike Suite 205','10'),
('9','Ut voluptatem non.','524 Mraz Streets','19'),
('10','Quis nostrum placeat.','52704 Crona Port Apt. 715','5'),
('11','Ab ad aperiam rerum.','70323 Ezekiel Points Suite 453','3'),
('12','Illum sapiente natus laudantium.','17209 Bednar Alley Suite 180','11'),
('13','Ut error possimus.','112 Toy Bridge','19'),
('14','Inventore quibusdam accusamus.','0340 Kessler Fields Suite 427','22'),
('15','Eligendi quaerat odio aliquid.','980 Ethel Locks Apt. 778','2'),
('16','Quo reprehenderit.','13143 Graham Ports Suite 624','1'),
('17','Aut iusto rerum sit.','5569 Myrl Club Suite 679','6'),
('18','Quae numquam omnis.','8948 Heathcote Greens Apt. 464','13'),
('19','Ipsa veritatis dignissimos.','948 Kuphal Alley Suite 574','3'),
('20','Quam voluptates aperiam.','278 Arden Causeway','22'),
('21','Dolorum accusamus eligendi nobis.','638 Brown Estate','15'),
('22','In assumenda labore.','94657 Hegmann Well Apt. 038','21'),
('23','Consectetur autem quae non.','688 Leannon Ranch','9'),
('24','Quasi omnis aut error.','862 Maeve Lakes','15'),
('25','Sequi illum est ut.','353 Gerhold Plaza Suite 523','5'),
('26','Suscipit atque sed.','69625 Javonte Grove','10'),
('27','Beatae molestiae recusandae.','3389 Smitham Fort','13'),
('28','Dicta reprehenderit commodi accusamus illum.','41064 Mayert Tunnel Apt. 844','24'),
('29','Deserunt commodi vel eaque.','4181 Shanahan Junction','15'),
('30','Reiciendis illo expedita.','50297 Wyman Crossing','6'),
('31','Dolore id ut unde.','65877 Kaleb Pass Suite 629','21'),
('32','Nisi magnam rerum.','777 Margaretta Port','22'),
('33','Totam illo alias quod.','61544 Genesis Trace Suite 421','1'),
('34','Nihil facilis quod et.','21109 Rachael Views Suite 016','2'),
('35','Perspiciatis id.','9984 Talia Cove','7'),
('36','Quo illum quidem facilis consequatur.','01442 Frami Trafficway Suite 215','23'),
('37','Iure distinctio earum aut.','01604 Gottlieb Walk','4'),
('38','Cupiditate odio similique illo et.','817 Steve Crossroad','14'),
('39','Eos iure magni.','207 Schmeler Curve Apt. 360','17'),
('40','Vero expedita quibusdam.','5152 Krajcik Road Suite 208','7'),
('41','Harum enim saepe explicabo.','05885 Tony Stream Apt. 538','11'),
('42','Id dicta.','641 Bechtelar Turnpike Suite 066','8'),
('43','Inventore cumque corrupti eligendi magni.','2168 Lourdes Isle Apt. 308','18'),
('44','Aut quidem repellat molestiae.','44909 Marlin Stream Suite 726','5'),
('45','Modi dignissimos eveniet commodi.','322 Dickinson Square Suite 236','24'),
('46','Omnis quo quidem excepturi.','3829 Shayne Locks Suite 008','21'),
('47','Enim explicabo.','296 Dolly Island','9'),
('48','Quo et neque qui.','3741 Gerlach Knoll Apt. 970','20'),
('49','Ad eius amet.','97369 Berge Via','25'),
('50','Et nihil quaerat tempora autem.','599 Raquel Highway','7'),
('51','Omnis quis qui.','6271 Bradley Mountain Suite 357','3'),
('52','Omnis mollitia vitae omnis est.','92967 Konopelski Highway Suite 641','1'),
('53','Ad deleniti enim voluptatem.','6751 Kaitlin Drive Suite 048','12'),
('54','Sunt autem corrupti.','74670 Alexandrine Park Suite 943','14'),
('55','Inventore omnis fugiat iure nesciunt.','861 Kathryn Tunnel','17'),
('56','Ea eveniet magnam enim.','991 Kuhlman Plaza','25'),
('57','Unde saepe sed quasi.','2130 Luz Orchard','14'),
('58','Consequatur quaerat voluptas enim.','9320 Aufderhar Mission','8'),
('59','Quo earum iure.','25630 Barry Wall Suite 407','19'),
('60','Sunt consequatur.','23804 Block Prairie Apt. 477','21'),
('61','In vitae ea.','3727 Quitzon Island','26'),
('62','Facilis omnis qui.','89296 Stroman Prairie','8'),
('63','Quidem rerum impedit voluptatibus consequatur.','1725 Cormier Plaza','16'),
('64','Quia rerum blanditiis.','449 Flatley Views','10'),
('65','Velit autem delectus.','670 Quitzon Ferry','10'),
('66','Repudiandae praesentium quae ex fugiat.','5789 Hagenes Common Suite 391','6'),
('67','Temporibus sint aut quia consequatur.','717 Jenkins Tunnel','17'),
('68','Provident odit aut dolores.','625 Dooley Fort','17'),
('69','Officiis labore qui rem.','7798 Dixie Branch','2'),
('70','Repellendus dolore cupiditate accusamus.','1011 Mayert Views','18'),
('71','Architecto nulla illo.','4267 Isaac Mountain Suite 697','18'),
('72','Eum soluta voluptas.','91876 Jenkins Glen','11'),
('73','Et non maiores.','655 Beahan Club','1'),
('74','Facere pariatur exercitationem inventore.','93811 Joannie Ports','21'),
('75','Qui expedita assumenda recusandae voluptas.','615 Schinner Hill','3'),
('76','Omnis assumenda ut.','57800 Trenton Turnpike Suite 620','18'),
('77','Id sapiente.','929 Cruickshank Center','24'),
('78','Quo aut libero.','288 Adeline Plaza','12'),
('79','Nam eos consequatur optio.','026 Jameson Dale Apt. 554','4'),
('80','Dicta temporibus provident iure.','71273 Runolfsson Islands Suite 549','19'),
('81','Modi architecto ducimus reiciendis.','617 Hegmann Hill Suite 735','26'),
('82','Assumenda at excepturi.','48479 Rolfson Loaf Apt. 893','25'),
('83','Enim debitis quas tempore.','282 Gottlieb Viaduct','10'),
('84','Id aut in dignissimos ut.','974 Nikolaus Roads','23'),
('85','Aut laudantium voluptas laborum ut.','337 Denesik Station','1'),
('86','Eaque ea.','486 Gutmann Vista','1'),
('87','Ea dolore dolore sit hic.','32011 Ryan Expressway Apt. 212','16'),
('88','Est voluptatem facilis.','9222 Cole Circle','25'),
('89','Placeat nam.','0904 Vickie Bridge','18'),
('90','Rerum soluta consectetur.','98593 Skiles Alley','3'),
('91','Eius nihil rerum.','258 Monte Stream Suite 044','21'),
('92','Velit qui odit tempora.','402 Beier Summit','9'),
('93','Et dolores nihil.','1821 Michaela Island Suite 340','25'),
('94','Dignissimos omnis occaecati.','1304 Roob Way','22'),
('95','Ad assumenda et et adipisci.','40546 Giovanna Village','10'),
('96','Voluptatum vitae ad.','42576 Margot Greens Apt. 025','19'),
('97','Ipsam delectus saepe.','559 Feest Route Apt. 375','18'),
('98','Autem ea.','92129 Wilfrid River Suite 310','16'),
('99','Fugit sed a.','388 Rossie Turnpike','3'),
('100','Quas sit sit est.','140 Emmanuelle Streets Apt. 062','8'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

