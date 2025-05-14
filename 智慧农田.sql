/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.17 : Database - smart-agriculture
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart-agriculture` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart-agriculture`;

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `produce` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品',
  `warehouse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存储区',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `keeper` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库管理员',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `inventory` */

insert  into `inventory`(`id`,`produce`,`warehouse`,`region`,`number`,`keeper`,`remark`) values 
(1,'小麦','1号仓','产品区',1000,'小明','无'),
(2,'农业无人机','1号仓','设备区',2,'小明','无'),
(5,'除草剂','2号仓','农资区',50,'小明','无');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发布时间',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发布人',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `notice` */

insert  into `notice`(`id`,`name`,`content`,`time`,`user`,`img`) values 
(8,'公告','预防农作物病害的方法\n预防农作物病害是确保作物健康生长和提高产量的关键步骤。以下是一些具体的预防方法：\n\n降低病原基数：通过清理田间残株、杂草和病叶，减少病原体的生存和繁殖机会。例如，对于多年生作物，应在冬季进行清园，减少来年病害的发生1。\n\n提升作物抗病能力：选择抗病品种进行种植，合理负载和科学用肥，特别是避免单一大量施用化肥，应增施有机肥，配合使用中微量元素，以提升作物的营养水平和抗病能力1。\n\n加强田间管理：通过合理的田间管理措施，如轮作、套种、修剪、整形修剪等，创造不利于病害繁殖和生长的环境条件1。\n\n适期用药：在病害发生前进行预防或在病害初期及时用药控制，以减少病害的蔓延。选择低毒、无残留、无污染的生物农药，这些农药能够长时间抑制病害发生，对作物、人体和环境都更加安全1。\n\n生态控制技术：改造蝗虫孳生地，压减适生地面积，改造生态环境，抑制蝗虫发生。例如，在飞蝗常发区，可以采取蓄水育苇和种植非喜食植物等措施2。\n\n生物防治技术：在中低密度发生区和生态敏感区，优先使用微生物农药和植物源农药进行防治，如蝗虫微孢子虫、金龟子绿僵菌等2。\n\n化学药剂防治技术：在高密度发生区采取化学应急防治，选择合适的农药进行喷洒，如高氯·马、高效氯氰菊酯等2。\n\n注意事项：在使用化学防治时，应考虑条带间隔施药，留出合理的天敌避难区域，避免使用烟雾机喷施微生物农药2。','2024-06-15 18:15:59','管理员','http://localhost:9090/file/056319a354b9496b91eba75a70a7f06e.jpeg');

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格（元）',
  `number` int(11) DEFAULT NULL COMMENT '采购数量',
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `purchaser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '采购人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `purchase` */

insert  into `purchase`(`id`,`product`,`price`,`number`,`provider`,`address`,`phone`,`purchaser`,`remark`) values 
(1,'尿素',200.00,50,'河南尿素厂','河南省南阳市','15938877193','王五五','无'),
(2,'除草剂',15.00,50,'河北农资厂','河北保定','15830097645','王五五','无');

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格（元）',
  `number` int(11) DEFAULT NULL COMMENT '采购数量',
  `buyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '采购商',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `shipper` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出货人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sales` */

insert  into `sales`(`id`,`product`,`price`,`number`,`buyer`,`address`,`phone`,`shipper`,`remark`) values 
(1,'小麦',20.00,1000,'想念公司','河南省南阳市','12538760772','小明','无'),
(2,'玉米',3.45,3000,'浙江食品厂','河南南阳','15938876154','小明','无'),
(3,'大豆',10.45,1500,'上海豆腐厂','上海','17839445','小明','无');

/*Table structure for table `statistic` */

DROP TABLE IF EXISTS `statistic`;

CREATE TABLE `statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `farm` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '农田名称',
  `area` int(11) DEFAULT NULL COMMENT '面积',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `crop` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作物名称',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生长状态',
  `temperature` decimal(11,1) DEFAULT NULL COMMENT '温度（℃）',
  `airhumidity` int(11) DEFAULT NULL COMMENT '空气湿度（%）',
  `soilhumidity` int(11) DEFAULT NULL COMMENT '土壤湿度（%）',
  `carbon` int(11) DEFAULT NULL COMMENT 'CO2含量ppm',
  `ph` decimal(11,2) DEFAULT NULL COMMENT '土壤PH值',
  `light` int(11) DEFAULT NULL COMMENT '光照强度(lux)',
  `filllight` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '补光灯状态',
  `monitor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '摄像头状态',
  `pump` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '水泵状态',
  `keeper` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '农田负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `statistic` */

insert  into `statistic`(`id`,`farm`,`area`,`address`,`crop`,`number`,`state`,`temperature`,`airhumidity`,`soilhumidity`,`carbon`,`ph`,`light`,`filllight`,`monitor`,`pump`,`keeper`) values 
(1,'A1号田',3,'产业园A1区','小麦',2000,'正常',26.0,40,70,1000,8.20,2000,'关闭','开启','关闭','小明'),
(2,'A2号田',5,'产业园A2区','玉米',3500,'正常',27.0,76,56,980,7.40,1000,'开启','开启','关闭','小明'),
(3,'A3号田',3,'产业园A3区','大豆',4000,'正常',30.0,69,45,789,7.50,2000,'关闭','开启','关闭','小明');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`name`,`value`,`type`) values 
(1,'user','el-icon-user','icon'),
(2,'house','el-icon-house','icon'),
(3,'menu','el-icon-menu','icon'),
(4,'s-custom','el-icon-s-custom','icon'),
(5,'s-grid','el-icon-s-grid','icon'),
(6,'document','el-icon-document','icon'),
(7,'coffee','el-icon-coffee\r\n','icon'),
(8,'s-marketing','el-icon-s-marketing','icon'),
(9,'phone-outline','el-icon-phone-outline','icon'),
(10,'platform-eleme','el-icon-platform-eleme','icon'),
(11,'eleme','el-icon-eleme','icon'),
(12,'delete-solid','el-icon-delete-solid','icon'),
(13,'delete','el-icon-delete','icon'),
(14,'s-tools','el-icon-s-tools','icon'),
(15,'setting','el-icon-setting','icon'),
(16,'user-solid','el-icon-user-solid','icon'),
(17,'phone','el-icon-phone','icon'),
(18,'more','el-icon-more','icon'),
(19,'more-outline','el-icon-more-outline','icon'),
(20,'star-on','el-icon-star-on','icon'),
(21,'star-off','el-icon-star-off','icon'),
(22,'s-goods','el-icon-s-goods','icon'),
(23,'goods','el-icon-goods','icon'),
(24,'warning','el-icon-warning','icon'),
(25,'warning-outline','el-icon-warning-outline','icon'),
(26,'question','el-icon-question','icon'),
(27,'info','el-icon-info','icon'),
(28,'remove','el-icon-remove','icon'),
(29,'circle-plus','el-icon-circle-plus','icon'),
(30,'success','el-icon-success','icon'),
(31,'error','el-icon-error','icon'),
(32,'zoom-in','el-icon-zoom-in','icon'),
(33,'zoom-out','el-icon-zoom-out','icon'),
(34,'remove-outline','el-icon-remove-outline','icon'),
(35,'circle-plus-outline','el-icon-circle-plus-outline','icon'),
(36,'circle-check','el-icon-circle-check','icon'),
(37,'circle-close','el-icon-circle-close','icon'),
(38,'s-help','el-icon-s-help','icon'),
(39,'help','el-icon-help','icon'),
(40,'minus','el-icon-minus','icon'),
(41,'plus','el-icon-plus','icon'),
(42,'check','el-icon-check','icon'),
(43,'close','el-icon-close','icon'),
(44,'picture','el-icon-picture','icon'),
(45,'picture-outline','el-icon-picture-outline','icon'),
(46,'picture-outline-round','el-icon-picture-outline-round','icon'),
(47,'upload','el-icon-upload','icon'),
(48,'upload2','el-icon-upload2','icon'),
(49,'download','el-icon-download','icon'),
(50,'camera-solid','el-icon-camera-solid','icon'),
(51,'camera','el-icon-camera','icon'),
(52,'video-camera-solid','el-icon-video-camera-solid','icon'),
(53,'video-camera','el-icon-video-camera','icon'),
(54,'message-solid','el-icon-message-solid','icon'),
(55,'bell','el-icon-bell','icon'),
(56,'s-cooperation','el-icon-s-cooperation','icon'),
(57,'s-order','el-icon-s-order','icon'),
(58,'s-platform','el-icon-s-platform','icon'),
(59,'s-fold','el-icon-s-fold','icon'),
(60,'s-unfold','el-icon-s-unfold','icon'),
(61,'s-operation','el-icon-s-operation','icon'),
(62,'s-promotion','el-icon-s-promotion','icon'),
(63,'s-home','el-icon-s-home','icon'),
(64,'s-release','el-icon-s-release','icon'),
(65,'s-ticket','el-icon-s-ticket','icon'),
(66,'s-management','el-icon-s-management','icon'),
(67,'s-open','el-icon-s-open','icon'),
(68,'s-shop','el-icon-s-shop','icon'),
(69,'s-flag','el-icon-s-flag','icon'),
(70,'s-comment','el-icon-s-comment','icon'),
(71,'s-finance','el-icon-s-finance','icon'),
(72,'s-claim','el-icon-s-claim','icon'),
(73,'s-opportunity','el-icon-s-opportunity','icon'),
(74,'s-data','el-icon-s-data','icon'),
(75,'s-check','el-icon-s-check','icon'),
(76,'share','el-icon-share','icon'),
(77,'d-caret','el-icon-d-caret','icon'),
(78,'caret-left','el-icon-caret-left','icon'),
(79,'caret-right','el-icon-caret-right','icon'),
(80,'caret-bottom','el-icon-caret-bottom','icon'),
(81,'caret-top','el-icon-caret-top','icon'),
(82,'bottom-left','el-icon-bottom-left','icon'),
(83,'bottom-right','el-icon-bottom-right','icon'),
(84,'back','el-icon-back','icon'),
(85,'right','el-icon-right','icon'),
(86,'bottom','el-icon-bottom','icon'),
(87,'top','el-icon-top','icon'),
(88,'top-left','el-icon-top-left','icon'),
(89,'top-right','el-icon-top-right','icon'),
(90,'arrow-left','el-icon-arrow-left','icon'),
(91,'arrow-right','el-icon-arrow-right','icon'),
(92,'arrow-down','el-icon-arrow-down','icon'),
(93,'arrow-up','el-icon-arrow-up','icon'),
(94,'d-arrow-left','el-icon-d-arrow-left','icon'),
(95,'d-arrow-right','el-icon-d-arrow-right','icon'),
(96,'video-pause','el-icon-video-pause','icon'),
(97,'video-play','el-icon-video-play','icon'),
(98,'refresh','el-icon-refresh','icon'),
(99,'refresh-right','el-icon-refresh-right','icon'),
(100,'refresh-left','el-icon-refresh-left','icon'),
(101,'finished','el-icon-finished','icon'),
(102,'sort','el-icon-sort','icon'),
(103,'sort-up','el-icon-sort-up','icon'),
(104,'sort-down','el-icon-sort-down','icon'),
(105,'rank','el-icon-rank','icon'),
(106,'loading','el-icon-loading','icon'),
(107,'view','el-icon-view','icon'),
(108,'c-scale-to-original','el-icon-c-scale-to-original','icon'),
(109,'date','el-icon-date','icon'),
(110,'edit','el-icon-edit','icon'),
(111,'edit-outline','el-icon-edit-outline','icon'),
(112,'folder','el-icon-folder','icon'),
(113,'folder-opened','el-icon-folder-opened','icon'),
(114,'folder-add','el-icon-folder-add','icon'),
(115,'folder-remove','el-icon-folder-remove','icon'),
(116,'folder-delete','el-icon-folder-delete','icon'),
(117,'folder-checked','el-icon-folder-checked','icon'),
(118,'tickets','el-icon-tickets','icon'),
(119,'document-remove','el-icon-document-remove','icon'),
(120,'document-delete','el-icon-document-delete','icon'),
(121,'document-copy','el-icon-document-copy','icon'),
(122,'document-checked','el-icon-document-checked','icon'),
(123,'document-add','el-icon-document-add','icon'),
(124,'printer','el-icon-printer','icon'),
(125,'paperclip','el-icon-paperclip','icon'),
(126,'takeaway-box','el-icon-takeaway-box','icon'),
(127,'search','el-icon-search','icon'),
(128,'monitor','el-icon-monitor','icon'),
(129,'attract','el-icon-attract','icon'),
(130,'mobile','el-icon-mobile','icon'),
(131,'scissors','el-icon-scissors','icon'),
(132,'umbrella','el-icon-umbrella','icon'),
(133,'headset','el-icon-headset','icon'),
(134,'brush','el-icon-brush','icon'),
(135,'mouse','el-icon-mouse','icon'),
(136,'coordinate','el-icon-coordinate','icon'),
(137,'magic-stick','el-icon-magic-stick','icon'),
(138,'reading','el-icon-reading','icon'),
(139,'data-line','el-icon-data-line','icon'),
(140,'data-board','el-icon-data-board','icon'),
(141,'pie-chart','el-icon-pie-chart','icon'),
(142,'data-analysis','el-icon-data-analysis','icon'),
(143,'collection-tag','el-icon-collection-tag','icon'),
(144,'film','el-icon-film','icon'),
(145,'suitcase','el-icon-suitcase','icon'),
(146,'suitcase-1','el-icon-suitcase-1','icon'),
(147,'receiving','el-icon-receiving','icon'),
(148,'collection','el-icon-collection','icon'),
(149,'files','el-icon-files','icon'),
(150,'notebook-1','el-icon-notebook-1','icon'),
(151,'notebook-2','el-icon-notebook-2','icon'),
(152,'toilet-paper','el-icon-toilet-paper','icon'),
(153,'office-building','el-icon-office-building','icon'),
(154,'school','el-icon-school','icon'),
(155,'table-lamp','el-icon-table-lamp','icon'),
(156,'no-smoking','el-icon-no-smoking','icon'),
(157,'smoking','el-icon-smoking','icon'),
(158,'shopping-cart-full','el-icon-shopping-cart-full','icon'),
(159,'shopping-cart-1','el-icon-shopping-cart-1','icon'),
(160,'shopping-cart-2','el-icon-shopping-cart-2','icon'),
(161,'shopping-bag-1','el-icon-shopping-bag-1','icon'),
(162,'shopping-bag-2','el-icon-shopping-bag-2','icon'),
(163,'sold-out','el-icon-sold-out','icon'),
(164,'sell','el-icon-sell','icon'),
(165,'present','el-icon-present','icon'),
(166,'box','el-icon-box','icon'),
(167,'bank-card','el-icon-bank-card','icon'),
(168,'money','el-icon-money','icon'),
(169,'coin','el-icon-coin','icon'),
(170,'wallet','el-icon-wallet','icon'),
(171,'discount','el-icon-discount','icon'),
(172,'price-tag','el-icon-price-tag','icon'),
(173,'news','el-icon-news','icon'),
(174,'guide','el-icon-guide','icon'),
(175,'male','el-icon-male','icon'),
(176,'female','el-icon-female','icon'),
(177,'thumb','el-icon-thumb','icon'),
(178,'cpu','el-icon-cpu','icon'),
(179,'link','el-icon-link','icon'),
(180,'connection','el-icon-connection','icon'),
(181,'open','el-icon-open','icon'),
(182,'turn-off','el-icon-turn-off','icon'),
(183,'set-up','el-icon-set-up','icon'),
(184,'chat-round','el-icon-chat-round','icon'),
(185,'chat-line-round','el-icon-chat-line-round','icon'),
(186,'chat-square','el-icon-chat-square','icon'),
(187,'chat-dot-round','el-icon-chat-dot-round','icon'),
(188,'chat-dot-square','el-icon-chat-dot-square','icon'),
(189,'chat-line-square','el-icon-chat-line-square','icon'),
(190,'message','el-icon-message','icon'),
(191,'postcard','el-icon-postcard','icon'),
(192,'position','el-icon-position','icon'),
(193,'turn-off-microphone','el-icon-turn-off-microphone','icon'),
(194,'microphone','el-icon-microphone','icon'),
(195,'close-notification','el-icon-close-notification','icon'),
(196,'bangzhu','el-icon-bangzhu','icon'),
(197,'time','el-icon-time','icon'),
(198,'odometer','el-icon-odometer','icon'),
(199,'crop','el-icon-crop','icon'),
(200,'aim','el-icon-aim','icon'),
(201,'switch-button','el-icon-switch-button','icon'),
(202,'full-screen','el-icon-full-screen','icon'),
(203,'copy-document','el-icon-copy-document','icon'),
(204,'mic','el-icon-mic','icon'),
(205,'stopwatch','el-icon-stopwatch','icon'),
(206,'medal-1','el-icon-medal-1','icon'),
(207,'medal','el-icon-medal','icon'),
(208,'trophy','el-icon-trophy','icon'),
(209,'trophy-1','el-icon-trophy-1','icon'),
(210,'first-aid-kit','el-icon-first-aid-kit','icon'),
(211,'discover','el-icon-discover','icon'),
(212,'place','el-icon-place','icon'),
(213,'location','el-icon-location','icon'),
(214,'location-outline','el-icon-location-outline','icon'),
(215,'location-information','el-icon-location-information','icon'),
(216,'add-location','el-icon-add-location','icon'),
(217,'delete-location','el-icon-delete-location','icon'),
(218,'map-location','el-icon-map-location','icon'),
(219,'alarm-clock','el-icon-alarm-clock','icon'),
(220,'timer','el-icon-timer','icon'),
(221,'watch-1','el-icon-watch-1','icon'),
(222,'watch','el-icon-watch','icon'),
(223,'lock','el-icon-lock','icon'),
(224,'unlock','el-icon-unlock','icon'),
(225,'key','el-icon-key','icon'),
(226,'service','el-icon-service','icon'),
(227,'mobile-phone','el-icon-mobile-phone','icon'),
(228,'bicycle','el-icon-bicycle','icon'),
(229,'truck','el-icon-truck','icon'),
(230,'ship','el-icon-ship','icon'),
(231,'basketball','el-icon-basketball','icon'),
(232,'football','el-icon-football','icon'),
(233,'soccer','el-icon-soccer','icon'),
(234,'baseball','el-icon-baseball','icon'),
(235,'wind-power','el-icon-wind-power','icon'),
(236,'light-rain','el-icon-light-rain','icon'),
(237,'lightning','el-icon-lightning','icon'),
(238,'heavy-rain','el-icon-heavy-rain','icon'),
(239,'sunrise','el-icon-sunrise','icon'),
(240,'sunrise-1','el-icon-sunrise-1','icon'),
(241,'sunset','el-icon-sunset','icon'),
(242,'sunny','el-icon-sunny','icon'),
(243,'cloudy','el-icon-cloudy','icon'),
(244,'partly-cloudy','el-icon-partly-cloudy','icon'),
(245,'cloudy-and-sunny','el-icon-cloudy-and-sunny','icon'),
(246,'moon','el-icon-moon','icon'),
(247,'moon-night','el-icon-moon-night','icon'),
(248,'dish','el-icon-dish','icon'),
(249,'dish-1','el-icon-dish-1','icon'),
(250,'food','el-icon-food','icon'),
(251,'chicken','el-icon-chicken','icon'),
(252,'fork-spoon','el-icon-fork-spoon','icon'),
(253,'knife-fork','el-icon-knife-fork','icon'),
(254,'burger','el-icon-burger','icon'),
(255,'tableware','el-icon-tableware','icon'),
(256,'sugar','el-icon-sugar','icon'),
(257,'dessert','el-icon-dessert','icon'),
(258,'ice-cream','el-icon-ice-cream','icon'),
(259,'hot-water','el-icon-hot-water','icon'),
(260,'water-cup','el-icon-water-cup','icon'),
(261,'coffee-cup','el-icon-coffee-cup','icon'),
(262,'cold-drink','el-icon-cold-drink','icon'),
(263,'goblet','el-icon-goblet','icon'),
(264,'goblet-full','el-icon-goblet-full','icon'),
(265,'goblet-square','el-icon-goblet-square','icon'),
(266,'goblet-square-full','el-icon-goblet-square-full','icon'),
(267,'refrigerator','el-icon-refrigerator','icon'),
(268,'grape','el-icon-grape','icon'),
(269,'watermelon','el-icon-watermelon','icon'),
(270,'cherry','el-icon-cherry','icon'),
(271,'apple','el-icon-apple','icon'),
(272,'pear','el-icon-pear','icon'),
(273,'orange','el-icon-orange','icon'),
(274,'ice-tea','el-icon-ice-tea','icon'),
(275,'ice-drink','el-icon-ice-drink','icon'),
(276,'milk-tea','el-icon-milk-tea','icon'),
(277,'potato-strips','el-icon-potato-strips','icon'),
(278,'lollipop','el-icon-lollipop','icon'),
(279,'ice-cream-square','el-icon-ice-cream-square','icon'),
(280,'ice-cream-round','el-icon-ice-cream-round','icon');

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_file` */

insert  into `sys_file`(`id`,`name`,`type`,`size`,`url`,`md5`,`is_delete`,`enable`) values 
(39,'92effbce5b51049a0fe0171b6b2f4587.jpeg','jpeg',119,'http://localhost:9090/file/056319a354b9496b91eba75a70a7f06e.jpeg','b23aca3520ca81d95db48a45e442fb00',0,1),
(40,'用户注册.png','png',40,'http://localhost:9090/file/864b2192bfe64d0ba0054c22b626aeb3.png','9f1a9c36279c70e78f732c122be69246',0,1),
(41,'农民头像.jpg','jpg',3,'http://localhost:9090/file/d2805a647db24613b440442a4ff0bc45.jpg','f0e1570d4deda2467ba671a69953ca2d',0,1);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_menu` */t'c

insert  into `sys_menu`(`id`,`name`,`path`,`icon`,`description`,`pid`,`page_path`,`sort_num`) values 
(4,'系统管理',NULL,'el-icon-s-grid',NULL,NULL,NULL,700),
(5,'农场员工管理','/user','el-icon-user',NULL,4,'User',301),
(6,'系统角色管理','/role','el-icon-s-custom',NULL,4,'Role',302),
(7,'系统菜单管理','/menu','el-icon-menu',NULL,4,'Menu',303),
(10,'农场主页通告','/home','el-icon-house',NULL,NULL,'Home',300),
(13,'农场物资管理','','el-icon-s-goods',NULL,NULL,'',600),
(15,'农作物出售','/sales','el-icon-s-cooperation',NULL,13,'Sales',3),
(21,'农田管理','/farmland','el-icon-menu',NULL,NULL,'Farmland',560),
(23,'物资采购','/purchase','el-icon-shopping-cart-full',NULL,13,'Purchase',1),
(27,'物资库存','/inventory','el-icon-house',NULL,13,'Inventory',2),
(28,'农场统计分析','','el-icon-s-data',NULL,NULL,'',550),
(29,'农田信息','/statistic','el-icon-data-line',NULL,28,'Statistic',1),
(39,'系统公告管理','/notice','el-icon-news',NULL,4,'Notice',300),
(40,'农场环境监测','/dashbord','el-icon-s-marketing',NULL,28,'Dashbord',0);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`flag`) values 
(1,'系统管理员','','ROLE_ADMIN'),
(2,'农田负责人','','ROLE_USER1'),
(3,'仓库管理员',NULL,'ROLE_USER2'),
(4,'销售人员',NULL,'ROLE_USER3'),
(5,'采购人员',NULL,'ROLE_USER4'),
(6,'农业专家',NULL,'ROLE_USER5');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(1,4),
(1,5),
(1,6),
(1,7),
(1,10),
(1,13),
(1,15),
(1,21),
(1,23),
(1,27),
(1,28),
(1,29),
(1,30),
(1,39),
(1,40),
(2,10),
(2,21),
(2,28),
(2,29),
(2,30),
(2,40),
(3,10),
(3,13),
(3,27),
(4,10),
(4,13),
(4,15),
(5,10),
(5,13),
(5,23),
(6,10),
(6,28),
(6,29),
(6,30),
(6,40);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`nickname`,`email`,`phone`,`address`,`create_time`,`avatar_url`,`role`) values 
(12,'admin','admin','admin','admin@qq.com','18240589365','河南','2024-06-13 21:47:05','http://localhost:9090/file/d2805a647db24613b440442a4ff0bc45.jpg','ROLE_ADMIN'),
(16,'小明111','12345678','小明','2094974024@qq.com','123456778','北京','2024-06-14 16:14:35',NULL,'ROLE_USER1'),
(17,'李逵','12345678','黑旋风','66666666@qq.com','15936657824','上海','2024-06-15 16:22:22',NULL,'ROLE_USER3'),
(18,'王小李','12345678','王五五','111111@qq.com','1111111','江西','2024-06-16 16:26:11',NULL,'ROLE_USER4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Add new tables to smart-agriculture database
USE `smart-agriculture`;

-- 1. Batch and Traceability Code Table
CREATE TABLE `batch_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `farm_id` int(11) NOT NULL COMMENT '关联农田ID',
  `crop_id` int(11) NOT NULL COMMENT '作物ID',
  `trace_code` varchar(50) NOT NULL COMMENT '溯源码',
  `planting_date` date NOT NULL COMMENT '种植日期',
  `status` varchar(50) DEFAULT NULL COMMENT '批次状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trace_code` (`trace_code`),
  KEY `farm_id` (`farm_id`),
  CONSTRAINT `batch_trace_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `statistic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Crop Growth Timeline Record Table
CREATE TABLE `crop_growth_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `stage` varchar(50) NOT NULL COMMENT '生长阶段',
  `start_date` date NOT NULL COMMENT '阶段开始日期',
  `end_date` date DEFAULT NULL COMMENT '阶段结束日期',
  `description` text COMMENT '阶段描述',
  `images` varchar(255) DEFAULT NULL COMMENT '图片记录',
  PRIMARY KEY (`id`),
  KEY `batch_id` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Harvest Record Table
CREATE TABLE `harvest_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `harvest_date` date NOT NULL COMMENT '收获日期',
  `quantity` decimal(10,2) NOT NULL COMMENT '收获数量(kg)',
  `quality_level` varchar(20) DEFAULT NULL COMMENT '质量等级',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `notes` text COMMENT '备注',
  `inventory_id` int(11) DEFAULT NULL COMMENT '关联入库记录',
  PRIMARY KEY (`id`),
  KEY `batch_id` (`batch_id`),
  KEY `inventory_id` (`inventory_id`),
  CONSTRAINT `harvest_record_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Fertilizer Information Table
CREATE TABLE `fertilizer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '肥料名称',
  `type` varchar(50) NOT NULL COMMENT '肥料类型',
  `composition` text COMMENT '成分',
  `usage_guide` text COMMENT '使用指南',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Fertilization Record Table
CREATE TABLE `fertilization_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) NOT NULL COMMENT '农田ID',
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `fertilizer_id` int(11) NOT NULL COMMENT '肥料ID',
  `application_date` datetime NOT NULL COMMENT '施肥日期时间',
  `amount` decimal(10,2) NOT NULL COMMENT '施肥量(kg)',
  `method` varchar(50) DEFAULT NULL COMMENT '施肥方法',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `inventory_id` int(11) DEFAULT NULL COMMENT '关联库存记录',
  `notes` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `farm_id` (`farm_id`),
  KEY `batch_id` (`batch_id`),
  KEY `inventory_id` (`inventory_id`),
  KEY `fertilizer_id` (`fertilizer_id`),
  CONSTRAINT `fertilization_record_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `statistic` (`id`),
  CONSTRAINT `fertilization_record_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`),
  CONSTRAINT `fertilization_record_ibfk_3` FOREIGN KEY (`fertilizer_id`) REFERENCES `fertilizer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Irrigation Record Table
CREATE TABLE `irrigation_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) NOT NULL COMMENT '农田ID',
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `irrigation_date` datetime NOT NULL COMMENT '浇水日期时间',
  `water_amount` decimal(10,2) NOT NULL COMMENT '用水量(L)',
  `duration` int(11) DEFAULT NULL COMMENT '持续时间(分钟)',
  `method` varchar(50) DEFAULT NULL COMMENT '浇水方法',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `notes` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `farm_id` (`farm_id`),
  KEY `batch_id` (`batch_id`),
  CONSTRAINT `irrigation_record_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `statistic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Crop Evaluation Standard Table
CREATE TABLE `crop_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `harvest_id` int(11) NOT NULL COMMENT '关联收获记录',
  `yield_per_mu` decimal(10,2) DEFAULT NULL COMMENT '亩产量(kg)',
  `average_size` decimal(10,2) DEFAULT NULL COMMENT '平均大小(cm)',
  `weight_per_unit` decimal(10,2) DEFAULT NULL COMMENT '单位重量(g)',
  `appearance_score` int(11) DEFAULT NULL COMMENT '外观评分(1-10)',
  `quality_score` int(11) DEFAULT NULL COMMENT '品质评分(1-10)',
  `moisture_content` decimal(5,2) DEFAULT NULL COMMENT '含水量(%)',
  `evaluation_date` date NOT NULL COMMENT '评估日期',
  `evaluator` varchar(50) DEFAULT NULL COMMENT '评估人',
  PRIMARY KEY (`id`),
  KEY `batch_id` (`batch_id`),
  KEY `harvest_id` (`harvest_id`),
  CONSTRAINT `crop_evaluation_ibfk_1` FOREIGN KEY (`harvest_id`) REFERENCES `harvest_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. Camera Table
CREATE TABLE `camera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) NOT NULL COMMENT '关联农田ID',
  `name` varchar(100) NOT NULL COMMENT '摄像头名称',
  `ip_address` varchar(100) NOT NULL COMMENT 'IP地址',
  `rtsp_url` varchar(255) DEFAULT NULL COMMENT 'RTSP流地址',
  `username` varchar(50) DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `status` varchar(20) DEFAULT 'offline' COMMENT '状态',
  `installation_date` date DEFAULT NULL COMMENT '安装日期',
  `location_description` text COMMENT '位置描述',
  PRIMARY KEY (`id`),
  KEY `farm_id` (`farm_id`),
  CONSTRAINT `camera_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `statistic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9. Camera Recording Record Table
CREATE TABLE `camera_recording` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camera_id` int(11) NOT NULL COMMENT '摄像头ID',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小(byte)',
  `duration` int(11) DEFAULT NULL COMMENT '时长(秒)',
  `storage_status` varchar(20) DEFAULT 'active' COMMENT '存储状态',
  PRIMARY KEY (`id`),
  KEY `camera_id` (`camera_id`),
  CONSTRAINT `camera_recording_ibfk_1` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10. Farm Environment History Record Table
CREATE TABLE `farm_environment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) NOT NULL COMMENT '农田ID',
  `record_time` datetime NOT NULL COMMENT '记录时间',
  `temperature` decimal(11,1) DEFAULT NULL COMMENT '温度（℃）',
  `air_humidity` int(11) DEFAULT NULL COMMENT '空气湿度（%）',
  `soil_humidity` int(11) DEFAULT NULL COMMENT '土壤湿度（%）',
  `carbon` int(11) DEFAULT NULL COMMENT 'CO2含量ppm',
  `ph` decimal(11,2) DEFAULT NULL COMMENT '土壤PH值',
  `light` int(11) DEFAULT NULL COMMENT '光照强度(lux)',
  `filllight_status` varchar(50) DEFAULT NULL COMMENT '补光灯状态',
  `pump_status` varchar(50) DEFAULT NULL COMMENT '水泵状态',
  PRIMARY KEY (`id`),
  KEY `farm_id` (`farm_id`),
  KEY `record_time` (`record_time`),
  CONSTRAINT `farm_environment_history_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `statistic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample data

-- First ensure we have some sample data in the statistic table
INSERT INTO `statistic` (`id`, `farm`, `area`, `address`, `crop`, `number`, `state`, `temperature`, `airhumidity`, `soilhumidity`, `carbon`, `ph`, `light`, `filllight`, `monitor`, `pump`, `keeper`) VALUES
(1, '东区农田A', 500, '青岛市城阳区春阳路1号', '小麦', 10000, '生长期', 22.5, 65, 70, 450, 6.8, 5000, '关闭', '在线', '关闭', '张三'),
(2, '西区农田B', 600, '青岛市城阳区春阳路2号', '玉米', 8000, '成熟期', 24.0, 60, 65, 430, 7.2, 5500, '关闭', '在线', '打开', '李四'),
(3, '南区农田C', 450, '青岛市城阳区春阳路3号', '大豆', 9000, '播种期', 21.0, 70, 75, 460, 6.5, 4800, '打开', '在线', '关闭', '王五');

-- Insert sample data into inventory table if not exists
INSERT INTO `inventory` (`id`, `produce`, `warehouse`, `region`, `number`, `keeper`, `remark`) VALUES
(1, '小麦种子', '中央仓库', 'A区', 500, '赵六', '优质种子'),
(2, '玉米种子', '中央仓库', 'B区', 400, '赵六', '新品种'),
(3, '有机肥', '东区仓库', 'C区', 1000, '钱七', '有机认证'),
(4, '氮肥', '西区仓库', 'A区', 800, '孙八', '高氮含量'),
(5, '农药', '南区仓库', 'B区', 300, '周九', '低毒');

-- 1. Insert data into batch_trace
INSERT INTO `batch_trace` (`batch_id`, `farm_id`, `crop_id`, `trace_code`, `planting_date`, `status`, `create_time`) VALUES
('2025-XM-001', 1, 1, 'TR2025001XM', '2025-03-15', '生长中', '2025-03-15 08:00:00'),
('2025-YM-001', 2, 2, 'TR2025001YM', '2025-03-20', '生长中', '2025-03-20 09:30:00'),
('2025-DD-001', 3, 3, 'TR2025001DD', '2025-03-25', '播种', '2025-03-25 10:15:00');

-- 2. Insert data into crop_growth_timeline
INSERT INTO `crop_growth_timeline` (`batch_id`, `stage`, `start_date`, `end_date`, `description`, `images`) VALUES
('2025-XM-001', '播种期', '2025-03-15', '2025-03-25', '完成小麦播种工作，土壤湿度良好', '/images/wheat/seed-20250315.jpg'),
('2025-XM-001', '出苗期', '2025-03-26', '2025-04-10', '小麦幼苗长势良好，高度平均2cm', '/images/wheat/seedling-20250326.jpg'),
('2025-YM-001', '播种期', '2025-03-20', '2025-04-01', '玉米播种完成，使用新型播种机', '/images/corn/seed-20250320.jpg'),
('2025-YM-001', '出苗期', '2025-04-02', '2025-04-15', '玉米出苗率95%，生长状态良好', '/images/corn/seedling-20250402.jpg'),
('2025-DD-001', '播种期', '2025-03-25', '2025-04-05', '大豆播种，使用有机肥', '/images/soybean/seed-20250325.jpg');

-- 3. Insert data into fertilizer
INSERT INTO `fertilizer` (`name`, `type`, `composition`, `usage_guide`) VALUES
('有机复合肥', '有机肥', '氮5%、磷3%、钾4%、有机质40%', '每亩使用20-30公斤，播种前施入土壤'),
('尿素', '氮肥', '氮含量46%', '每亩使用10-15公斤，追肥使用'),
('磷酸二铵', '磷肥', '氮18%、磷46%', '每亩使用15-20公斤，基肥使用'),
('硫酸钾', '钾肥', '钾含量50%、硫18%', '每亩使用10-12公斤，追肥使用');

-- 4. Insert data into fertilization_record
INSERT INTO `fertilization_record` (`farm_id`, `batch_id`, `fertilizer_id`, `application_date`, `amount`, `method`, `operator`, `inventory_id`, `notes`) VALUES
(1, '2025-XM-001', 1, '2025-03-14 08:30:00', 120.00, '机械撒施', '张三', 3, '播种前基肥施用'),
(1, '2025-XM-001', 2, '2025-04-01 09:15:00', 60.00, '机械撒施', '张三', 4, '苗期追肥'),
(2, '2025-YM-001', 1, '2025-03-19 07:45:00', 150.00, '机械撒施', '李四', 3, '播种前基肥施用'),
(2, '2025-YM-001', 3, '2025-04-05 08:00:00', 70.00, '机械撒施', '李四', 4, '苗期追肥'),
(3, '2025-DD-001', 1, '2025-03-24 10:00:00', 100.00, '机械撒施', '王五', 3, '播种前基肥施用');

-- 5. Insert data into irrigation_record
INSERT INTO `irrigation_record` (`farm_id`, `batch_id`, `irrigation_date`, `water_amount`, `duration`, `method`, `operator`, `notes`) VALUES
(1, '2025-XM-001', '2025-03-16 07:00:00', 25000.00, 120, '喷灌', '张三', '播种后灌水'),
(1, '2025-XM-001', '2025-04-02 06:30:00', 20000.00, 100, '喷灌', '张三', '苗期灌水'),
(2, '2025-YM-001', '2025-03-21 07:30:00', 30000.00, 150, '滴灌', '李四', '播种后灌水'),
(2, '2025-YM-001', '2025-04-06 06:45:00', 25000.00, 120, '滴灌', '李四', '苗期灌水'),
(3, '2025-DD-001', '2025-03-26 08:00:00', 22000.00, 110, '喷灌', '王五', '播种后灌水');

-- 6. Insert data into harvest_record
INSERT INTO `harvest_record` (`batch_id`, `harvest_date`, `quantity`, `quality_level`, `operator`, `notes`, `inventory_id`) VALUES
('2025-XM-001', '2025-04-20', 3500.00, 'A', '张三', '小麦试验收获', 1);

-- 7. Insert data into crop_evaluation
INSERT INTO `crop_evaluation` (`batch_id`, `harvest_id`, `yield_per_mu`, `average_size`, `weight_per_unit`, `appearance_score`, `quality_score`, `moisture_content`, `evaluation_date`, `evaluator`) VALUES
('2025-XM-001', 1, 450.00, NULL, 42.50, 9, 8, 14.50, '2025-04-21', '李四');

-- 8. Insert data into camera
INSERT INTO `camera` (`farm_id`, `name`, `ip_address`, `rtsp_url`, `username`, `password`, `status`, `installation_date`, `location_description`) VALUES
(1, '东区农田A摄像头', '192.168.1.101', 'rtsp://192.168.1.101:554/stream1', 'admin', 'admin123', 'online', '2025-03-01', '农田东北角高杆'),
(2, '西区农田B摄像头', '192.168.1.102', 'rtsp://192.168.1.102:554/stream1', 'admin', 'admin123', 'online', '2025-03-02', '农田西南角高杆'),
(3, '南区农田C摄像头', '192.168.1.103', 'rtsp://192.168.1.103:554/stream1', 'admin', 'admin123', 'online', '2025-03-03', '农田中央高杆');

-- 9. Insert data into camera_recording
INSERT INTO `camera_recording` (`camera_id`, `start_time`, `end_time`, `file_path`, `file_size`, `duration`, `storage_status`) VALUES
(1, '2025-04-01 00:00:00', '2025-04-01 23:59:59', '/recordings/farm1/20250401.mp4', 1524000000, 86400, 'active'),
(1, '2025-04-02 00:00:00', '2025-04-02 23:59:59', '/recordings/farm1/20250402.mp4', 1486000000, 86400, 'active'),
(2, '2025-04-01 00:00:00', '2025-04-01 23:59:59', '/recordings/farm2/20250401.mp4', 1510000000, 86400, 'active'),
(2, '2025-04-02 00:00:00', '2025-04-02 23:59:59', '/recordings/farm2/20250402.mp4', 1498000000, 86400, 'active'),
(3, '2025-04-01 00:00:00', '2025-04-01 23:59:59', '/recordings/farm3/20250401.mp4', 1512000000, 86400, 'active');

-- 10. Insert data into farm_environment_history
INSERT INTO `farm_environment_history` (`farm_id`, `record_time`, `temperature`, `air_humidity`, `soil_humidity`, `carbon`, `ph`, `light`, `filllight_status`, `pump_status`) VALUES
(1, '2025-04-01 08:00:00', 18.5, 65, 70, 450, 6.8, 5200, '关闭', '关闭'),
(1, '2025-04-01 14:00:00', 24.3, 55, 68, 430, 6.8, 8500, '关闭', '关闭'),
(1, '2025-04-01 20:00:00', 16.8, 72, 70, 470, 6.7, 200, '打开', '关闭'),
(2, '2025-04-01 08:00:00', 17.9, 68, 65, 440, 7.2, 5100, '关闭', '关闭'),
(2, '2025-04-01 14:00:00', 25.1, 52, 62, 420, 7.2, 8600, '关闭', '打开'),
(2, '2025-04-01 20:00:00', 17.2, 70, 68, 460, 7.1, 180, '打开', '关闭'),
(3, '2025-04-01 08:00:00', 18.2, 69, 75, 455, 6.5, 5000, '关闭', '关闭'),
(3, '2025-04-01 14:00:00', 23.8, 58, 72, 435, 6.5, 8300, '关闭', '关闭'),
(3, '2025-04-01 20:00:00', 16.5, 75, 74, 465, 6.4, 190, '打开', '关闭');

-- Add Nutrition Composition Table to smart-agriculture database
USE `smart-agriculture`;

-- Create Nutrition Composition Table
CREATE TABLE `nutrition_composition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(50) NOT NULL COMMENT '批次编号',
  `harvest_id` int(11) NOT NULL COMMENT '关联收获记录ID',
  `test_date` date NOT NULL COMMENT '测试日期',
  `protein` decimal(5,2) DEFAULT NULL COMMENT '蛋白质含量(%)',
  `fat` decimal(5,2) DEFAULT NULL COMMENT '脂肪含量(%)',
  `carbohydrate` decimal(5,2) DEFAULT NULL COMMENT '碳水化合物含量(%)',
  `fiber` decimal(5,2) DEFAULT NULL COMMENT '纤维素含量(%)',
  `vitamin_a` decimal(8,2) DEFAULT NULL COMMENT '维生素A含量(μg/100g)',
  `vitamin_c` decimal(8,2) DEFAULT NULL COMMENT '维生素C含量(mg/100g)',
  `vitamin_e` decimal(8,2) DEFAULT NULL COMMENT '维生素E含量(mg/100g)',
  `calcium` decimal(8,2) DEFAULT NULL COMMENT '钙含量(mg/100g)',
  `iron` decimal(8,2) DEFAULT NULL COMMENT '铁含量(mg/100g)',
  `zinc` decimal(8,2) DEFAULT NULL COMMENT '锌含量(mg/100g)',
  `selenium` decimal(8,2) DEFAULT NULL COMMENT '硒含量(μg/100g)',
  `antioxidant` decimal(8,2) DEFAULT NULL COMMENT '抗氧化物含量(mg/100g)',
  `moisture` decimal(5,2) DEFAULT NULL COMMENT '水分含量(%)',
  `energy` decimal(8,2) DEFAULT NULL COMMENT '能量(kcal/100g)',
  `tester` varchar(50) DEFAULT NULL COMMENT '测试人员',
  `test_method` varchar(100) DEFAULT NULL COMMENT '测试方法',
  `test_equipment` varchar(100) DEFAULT NULL COMMENT '测试设备',
  `notes` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `batch_id` (`batch_id`),
  KEY `harvest_id` (`harvest_id`),
  CONSTRAINT `nutrition_composition_ibfk_1` FOREIGN KEY (`harvest_id`) REFERENCES `harvest_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample data into nutrition_composition
INSERT INTO `nutrition_composition` (`batch_id`, `harvest_id`, `test_date`, `protein`, `fat`, `carbohydrate`, `fiber`, `vitamin_a`, `vitamin_c`, `vitamin_e`, `calcium`, `iron`, `zinc`, `selenium`, `antioxidant`, `moisture`, `energy`, `tester`, `test_method`, `test_equipment`, `notes`) VALUES
('2025-XM-001', 1, '2025-04-22', 12.60, 1.80, 71.20, 2.70, 0.00, 0.00, 1.20, 34.00, 3.60, 2.80, 40.30, 1.50, 14.50, 346.00, '王红', 'AOAC标准方法', 'SimMark营养分析仪S2000', '粒质饱满，品质优良'),
('2025-XM-001', 1, '2025-04-23', 12.45, 1.75, 71.40, 2.65, 0.00, 0.00, 1.18, 33.50, 3.55, 2.75, 40.00, 1.45, 14.62, 345.50, '李明', '近红外光谱法', 'NIR光谱分析仪A100', '复验样本，结果稳定');