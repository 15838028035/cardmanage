/*
Navicat MySQL Data Transfer

Source Server         : 本地卡管家系统
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : cardmanage

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-29 10:46:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `batch`
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batchCode` varchar(20) DEFAULT NULL,
  `lockStatus` varchar(2) DEFAULT NULL,
  `enableFlag` varchar(2) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of batch
-- ----------------------------

-- ----------------------------
-- Table structure for `cmpermission`
-- ----------------------------
DROP TABLE IF EXISTS `cmpermission`;
CREATE TABLE `cmpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(400) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `enableFlag` varchar(2) DEFAULT NULL,
  `lockStatus` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmpermission
-- ----------------------------
INSERT INTO `cmpermission` VALUES ('1', 'S0101', '用户登录', '/jsp/user/userList.jsp', '0', null, null, null, '0', null);

-- ----------------------------
-- Table structure for `creditcard`
-- ----------------------------
DROP TABLE IF EXISTS `creditcard`;
CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardNo` varchar(50) DEFAULT NULL,
  `bankNo` varchar(100) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `maxLimit` float DEFAULT NULL,
  `secNo` varchar(20) DEFAULT NULL,
  `validateDate` varchar(30) DEFAULT NULL,
  `billDate` int(11) DEFAULT NULL,
  `repaymentDate` int(11) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` varchar(20) DEFAULT NULL,
  `lockStatus` varchar(2) DEFAULT '0',
  `enableFlag` varchar(2) DEFAULT 'T',
  `serviceRate` float(10,3) DEFAULT NULL,
  `initRemainMoney` float DEFAULT NULL,
  `cardNoProfile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creditcard
-- ----------------------------
INSERT INTO `creditcard` VALUES ('16', '4392258326438126', '招商银行', '李国欣', '20000', '456', '0920', '16', '5', '40', '2015-08-22', '0', '2017-04-17 09:59:50', '0', 'T', '0.015', '20000', '04');
INSERT INTO `creditcard` VALUES ('14', '4392258326438112', '招商银行', '李国欣', '40000', '456', '1219', '2', '23', '40', '2015-08-17', '40', '2016-06-05 09:42:40', '0', 'T', '0.015', '40000', '02');
INSERT INTO `creditcard` VALUES ('15', '4392258326438125', '招商银行', '李国欣', '50000', '456', '1219', '3', '25', '40', '2015-08-17', '40', '2016-06-05 09:42:49', '0', 'T', '0.015', '50000', '03');
INSERT INTO `creditcard` VALUES ('13', '4392258326438123', '招商银行', '李国欣', '50000', '456', '1219', '17', '5', '40', '2015-08-17', '40', '2017-04-17 09:53:19', '0', 'T', '0.020', '0', '01');
INSERT INTO `creditcard` VALUES ('74', '4392258326438129', '招商银行', '王嘉诚', '4000', '333', '1229', '5', '19', '40', '2015-11-29', '40', '2016-06-05 09:43:11', '0', 'T', '0.015', '4000', '05');
INSERT INTO `creditcard` VALUES ('107', '4392285320151207', '招商银行', '李国欣', '50000', '567', '2112', '7', '21', '40', '2015-12-07', '40', '2016-02-22 05:31:09', '0', 'T', '0.020', '50000', '06');
INSERT INTO `creditcard` VALUES ('112', '4392258326431211', '广发银行', '李国欣', '100000', '145', '2110', '15', '25', '40', '2015-12-09', '40', '2016-02-22 05:31:18', '0', 'T', '0.020', '100000', '07');
INSERT INTO `creditcard` VALUES ('144', '6214853788886219', '建设银行', '李国欣', '10000', '123', '1258', '19', '15', '40', '2016-02-19', '40', '2016-02-22 05:31:26', '0', 'T', '0.020', '500', '08');
INSERT INTO `creditcard` VALUES ('145', '8789586545879526', '建设银行', '张爱国', '30000', '784', '1229', '19', '5', '40', '2016-02-22', '40', '2016-03-19 09:26:46', '0', 'T', '0.020', '20000', '09');
INSERT INTO `creditcard` VALUES ('146', '4587896558745896', '广发银行', '李国欣', '30000', '458', '1229', '26', '10', '40', '2016-02-29', '40', '2016-03-26 04:06:03', '0', 'T', '0.020', '30000', '10');

-- ----------------------------
-- Table structure for `dayplantmpresult`
-- ----------------------------
DROP TABLE IF EXISTS `dayplantmpresult`;
CREATE TABLE `dayplantmpresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=992703 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dayplantmpresult
-- ----------------------------
INSERT INTO `dayplantmpresult` VALUES ('992683', '24', '24');
INSERT INTO `dayplantmpresult` VALUES ('992684', '9', '9');
INSERT INTO `dayplantmpresult` VALUES ('992685', '20', '20');
INSERT INTO `dayplantmpresult` VALUES ('992686', '7', '7');
INSERT INTO `dayplantmpresult` VALUES ('992687', '12', '12');
INSERT INTO `dayplantmpresult` VALUES ('992688', '21', '21');
INSERT INTO `dayplantmpresult` VALUES ('992689', '13', '13');
INSERT INTO `dayplantmpresult` VALUES ('992690', '16', '16');
INSERT INTO `dayplantmpresult` VALUES ('992691', '14', '14');
INSERT INTO `dayplantmpresult` VALUES ('992692', '8', '8');
INSERT INTO `dayplantmpresult` VALUES ('992693', '18', '18');
INSERT INTO `dayplantmpresult` VALUES ('992694', '23', '23');
INSERT INTO `dayplantmpresult` VALUES ('992695', '15', '15');
INSERT INTO `dayplantmpresult` VALUES ('992696', '1', '1');
INSERT INTO `dayplantmpresult` VALUES ('992697', '5', '5');
INSERT INTO `dayplantmpresult` VALUES ('992698', '28', '28');
INSERT INTO `dayplantmpresult` VALUES ('992699', '25', '25');
INSERT INTO `dayplantmpresult` VALUES ('992700', '27', '27');
INSERT INTO `dayplantmpresult` VALUES ('992701', '19', '19');
INSERT INTO `dayplantmpresult` VALUES ('992702', '3', '3');

-- ----------------------------
-- Table structure for `plan`
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batchNo` varchar(30) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `creditCardId` int(11) DEFAULT NULL,
  `postCardId` int(11) DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `sumAllMoney` int(11) DEFAULT NULL,
  `inMoney` int(11) DEFAULT NULL,
  `outMoney` int(11) DEFAULT NULL,
  `remainMoney` int(11) DEFAULT NULL,
  `excuteFlag` varchar(2) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  `enableFlag` varchar(2) DEFAULT NULL,
  `lockStatus` varchar(2) DEFAULT NULL,
  `serviceRateSumFormat` varchar(30) DEFAULT NULL,
  `poundageSumFormat` varchar(30) DEFAULT NULL,
  `incomeMoneySumFormat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32793 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('25719', '2015-09-25 12:00:00', '42', '18', '0', '2015-09-26', '11000', '0', '418', '10582', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25720', '2015-09-25 12:00:00', '42', '18', '0', '2015-09-27', '11000', '0', '0', '10582', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25721', '2015-09-25 12:00:00', '42', '18', '0', '2015-09-28', '11000', '0', '1350', '9232', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25722', '2015-09-25 12:00:00', '42', '18', '0', '2015-09-29', '11000', '0', '725', '8507', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25723', '2015-09-25 12:00:00', '42', '18', '0', '2015-09-30', '11000', '0', '704', '7803', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25724', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-01', '11000', '0', '154', '7649', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25725', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-02', '11000', '0', '0', '7649', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25726', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-03', '11000', '0', '250', '7399', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25727', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-04', '11000', '0', '0', '7399', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25728', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-05', '11000', '0', '0', '7399', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25729', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-06', '11000', '0', '475', '6924', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25730', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-07', '11000', '0', '942', '5982', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25731', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-08', '11000', '0', '367', '5615', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25732', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-09', '11000', '0', '0', '5615', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25733', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-10', '11000', '0', '0', '5615', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25734', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-11', '11000', '0', '0', '5615', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25735', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-12', '11000', '0', '892', '4723', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25736', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-13', '11000', '0', '249', '4474', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25737', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-14', '11000', '0', '403', '4071', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25738', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-15', '11000', '0', '0', '4071', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25739', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-16', '11000', '0', '114', '3957', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25740', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-17', '11000', '0', '0', '3957', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25741', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-18', '11000', '0', '0', '3957', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25742', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-19', '11000', '0', '131', '3826', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25743', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-20', '11000', '0', '284', '3542', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25744', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-21', '11000', '0', '0', '3542', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25745', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-22', '11000', '0', '0', '3542', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25746', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-23', '11000', '0', '0', '3542', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25747', '2015-09-25 12:00:00', '42', '18', '0', '2015-10-24', '11000', '0', '0', '3542', 'F', '42', '2015-09-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25836', '2015-09-27 12:00:00', '39', '19', '0', '2015-09-29', '3000', '0', '0', '2894', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25837', '2015-09-27 12:00:00', '39', '19', '0', '2015-09-30', '3000', '0', '0', '2894', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25838', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-01', '3000', '0', '0', '2894', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25839', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-02', '3000', '0', '0', '2894', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25841', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-04', '3000', '0', '0', '2712', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25847', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-10', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25848', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-11', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25849', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-12', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25850', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-13', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25851', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-14', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25852', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-15', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25853', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-16', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25854', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-17', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25855', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-18', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25856', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-19', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25857', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-20', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25858', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-21', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25859', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-22', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25860', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-23', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25861', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-24', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25862', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-25', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('25863', '2015-09-27 12:00:00', '39', '19', '0', '2015-10-26', '3000', '0', '0', '1338', 'F', '39', '2015-09-27', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26009', '2015-11-12 12:05:00', '44', '36', '62', '2015-11-13', '0', '0', '0', '0', 'T', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26010', '2015-11-12 12:05:00', '44', '36', '62', '2015-11-14', '0', '0', '0', '0', 'T', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26011', '2015-11-12 12:05:00', '44', '36', '47', '2015-11-15', '20000', '0', '392', '18495', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26012', '2015-11-12 12:05:00', '44', '36', '45', '2015-11-16', '20000', '0', '0', '18495', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26013', '2015-11-12 12:05:00', '44', '36', '46', '2015-11-17', '20000', '0', '253', '18242', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26014', '2015-11-12 12:05:00', '44', '36', '56', '2015-11-18', '20000', '0', '0', '18242', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26015', '2015-11-12 12:05:00', '44', '36', '48', '2015-11-19', '20000', '0', '4230', '14012', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26016', '2015-11-12 12:05:00', '44', '36', '45', '2015-11-20', '20000', '0', '246', '13766', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26017', '2015-11-12 12:05:00', '44', '36', '59', '2015-11-21', '20000', '0', '1672', '12094', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26018', '2015-11-12 12:05:00', '44', '36', '54', '2015-11-22', '20000', '0', '377', '11717', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26019', '2015-11-12 12:05:00', '44', '36', '52', '2015-11-23', '20000', '0', '1183', '10534', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26020', '2015-11-12 12:05:00', '44', '36', '62', '2015-11-24', '20000', '0', '662', '9872', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26021', '2015-11-12 12:05:00', '44', '36', '60', '2015-11-25', '20000', '0', '936', '8936', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26022', '2015-11-12 12:05:00', '44', '36', '56', '2015-11-26', '20000', '0', '0', '8936', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26023', '2015-11-12 12:05:00', '44', '36', '56', '2015-11-27', '20000', '0', '564', '8372', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26024', '2015-11-12 12:05:00', '44', '36', '45', '2015-11-28', '20000', '0', '0', '8372', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26025', '2015-11-12 12:05:00', '44', '36', '62', '2015-11-29', '20000', '0', '694', '7678', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26026', '2015-11-12 12:05:00', '44', '36', '56', '2015-11-30', '20000', '0', '394', '7284', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26027', '2015-11-12 12:05:00', '44', '36', '56', '2015-12-01', '20000', '0', '0', '7284', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26028', '2015-11-12 12:05:00', '44', '36', '56', '2015-12-02', '20000', '0', '0', '7284', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26029', '2015-11-12 12:05:00', '44', '36', '54', '2015-12-03', '20000', '0', '222', '7062', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26030', '2015-11-12 12:05:00', '44', '36', '48', '2015-12-04', '20000', '0', '277', '6785', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26031', '2015-11-12 12:05:00', '44', '36', '51', '2015-12-05', '20000', '0', '265', '6520', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26032', '2015-11-12 12:05:00', '44', '36', '45', '2015-12-06', '20000', '0', '0', '6520', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26033', '2015-11-12 12:05:00', '44', '36', '48', '2015-12-07', '20000', '0', '108', '6412', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26034', '2015-11-12 12:05:00', '44', '36', '56', '2015-12-08', '20000', '0', '0', '6412', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26035', '2015-11-12 12:05:00', '44', '36', '45', '2015-12-09', '20000', '0', '0', '6412', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26036', '2015-11-12 12:05:00', '44', '36', '45', '2015-12-10', '20000', '0', '0', '6412', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26037', '2015-11-12 12:05:00', '44', '36', '45', '2015-12-11', '20000', '0', '0', '6412', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26075', '2015-11-12 11:05:00', '44', '37', '0', '2015-11-21', '100000', '0', '12082', '52456', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26074', '2015-11-12 11:05:00', '44', '37', '0', '2015-11-20', '100000', '0', '10615', '64538', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26073', '2015-11-12 11:05:00', '44', '37', '0', '2015-11-19', '100000', '0', '10826', '75153', 'F', '44', '2015-11-12', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26473', '2015-11-25 12:00:00', '42', '18', '0', '2015-11-26', '11000', '2088', '354', '5276', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26474', '2015-11-25 12:00:00', '42', '18', '0', '2015-11-27', '11000', '1449', '316', '6409', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26475', '2015-11-25 12:00:00', '42', '18', '0', '2015-11-28', '11000', '1019', '192', '7236', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26476', '2015-11-25 12:00:00', '42', '18', '0', '2015-11-29', '11000', '725', '506', '7455', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26477', '2015-11-25 12:00:00', '42', '18', '0', '2015-11-30', '11000', '805', '298', '7962', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26478', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-01', '11000', '370', '159', '8173', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26479', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-02', '11000', '290', '0', '8463', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26480', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-03', '11000', '263', '1269', '7457', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26481', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-04', '11000', '125', '149', '7433', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26482', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-05', '11000', '110', '1263', '6280', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26483', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-06', '11000', '214', '502', '5992', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26484', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-07', '11000', '0', '838', '5154', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26485', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-08', '11000', '0', '0', '5154', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26486', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-09', '11000', '0', '618', '4536', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26487', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-10', '11000', '0', '317', '4219', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26488', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-11', '11000', '0', '295', '3924', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26489', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-12', '11000', '0', '902', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26490', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-13', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26491', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-14', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26492', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-15', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26493', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-16', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26494', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-17', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26495', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-18', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26496', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-19', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26497', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-20', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26498', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-21', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26499', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-22', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26500', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-23', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('26501', '2015-11-25 12:00:00', '42', '18', '0', '2015-12-24', '11000', '0', '0', '3022', 'F', '42', '2015-11-25', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32754', '2017-04-17 09:55:00', '40', '13', '21', '2017-04-28', '50000', '3760', '3755', '175', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32755', '2017-04-17 09:55:00', '40', '13', '22', '2017-04-29', '50000', '3680', '3670', '185', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32756', '2017-04-17 09:55:00', '40', '13', '21', '2017-04-30', '50000', '1700', '1685', '200', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32757', '2017-04-17 09:55:00', '40', '13', '23', '2017-05-01', '50000', '2220', '1000', '210', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32758', '2017-04-17 09:55:00', '40', '13', '23', '2017-05-02', '50000', '2310', '2300', '220', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32759', '2017-04-17 09:55:00', '40', '13', '23', '2017-05-03', '50000', '2300', '2280', '240', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32390', '2017-03-10 12:58:00', '40', '13', '30', '2017-03-18', '50000', '3195', '3188', '48', 'F', '40', '2017-03-10', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32760', '2017-04-17 09:55:00', '40', '13', '22', '2017-05-04', '50000', '0', '240', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32761', '2017-04-17 09:55:00', '40', '13', '29', '2017-05-05', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32762', '2017-04-17 09:55:00', '40', '13', '23', '2017-05-06', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32763', '2017-04-17 09:55:00', '40', '13', '21', '2017-05-07', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32764', '2017-04-17 09:55:00', '40', '13', '31', '2017-05-08', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32765', '2017-04-17 09:55:00', '40', '13', '23', '2017-05-09', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32766', '2017-04-17 09:55:00', '40', '13', '23', '2017-05-10', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32398', '2017-03-10 12:58:00', '40', '13', '30', '2017-03-26', '50000', '2280', '2272', '106', 'F', '40', '2017-03-10', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32767', '2017-04-17 09:55:00', '40', '13', '29', '2017-05-11', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32768', '2017-04-17 09:55:00', '40', '13', '21', '2017-05-12', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32769', '2017-04-17 09:55:00', '40', '13', '22', '2017-05-13', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32770', '2017-04-17 09:55:00', '40', '13', '29', '2017-05-14', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32771', '2017-04-17 09:55:00', '40', '13', '20', '2017-05-15', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32792', '2017-04-17 07:46:00', '40', '13', '21', '2017-05-16', '50000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32749', '2017-04-17 09:55:00', '40', '13', '29', '2017-04-23', '50000', '3310', '3305', '105', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28020', '2015-12-13 03:35:00', '41', '123', '0', '2016-01-12', '10000', '0', '0', '989', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28018', '2015-12-13 03:35:00', '41', '123', '0', '2016-01-10', '10000', '0', '0', '1382', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28013', '2015-12-13 03:35:00', '41', '123', '0', '2016-01-05', '10000', '0', '0', '1661', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28014', '2015-12-13 03:35:00', '41', '123', '0', '2016-01-06', '10000', '0', '0', '1661', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28016', '2015-12-13 03:35:00', '41', '123', '0', '2016-01-08', '10000', '0', '0', '1496', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28011', '2015-12-13 03:35:00', '41', '123', '0', '2016-01-03', '10000', '0', '0', '1806', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28004', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-27', '10000', '0', '0', '2512', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28005', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-28', '10000', '0', '0', '2512', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28006', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-29', '10000', '0', '0', '2512', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28657', '2015-12-16 07:55:00', '41', '123', '0', '2015-12-30', '10000', '0', '0', '1854', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28656', '2015-12-16 07:55:00', '41', '123', '0', '2015-12-26', '10000', '500', '0', '3464', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28002', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-25', '10000', '0', '0', '2778', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28001', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-24', '10000', '0', '0', '2778', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28000', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-23', '10000', '0', '0', '2778', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28660', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-02', '10000', '0', '0', '1114', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28661', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-04', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28662', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-07', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('27996', '2015-12-13 03:35:00', '41', '123', '0', '2015-12-19', '10000', '0', '0', '3894', 'F', '41', '2015-12-13', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28663', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-09', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28665', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-13', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28664', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-11', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28666', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-14', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('28667', '2015-12-16 07:55:00', '41', '123', '0', '2016-01-15', '10000', '0', '0', '881', 'F', '41', '2015-12-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32750', '2017-04-17 09:55:00', '40', '13', '22', '2017-04-24', '50000', '3290', '3270', '125', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32751', '2017-04-17 09:55:00', '40', '13', '20', '2017-04-25', '50000', '3810', '3800', '135', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32752', '2017-04-17 09:55:00', '40', '13', '21', '2017-04-26', '50000', '1750', '1730', '155', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32416', '2017-04-16 06:35:00', '40', '16', '30', '2017-04-20', '20000', '1890', '1865', '80', 'F', '40', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32753', '2017-04-17 09:55:00', '40', '13', '20', '2017-04-27', '50000', '2260', '2245', '170', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32424', '2017-04-16 06:35:00', '40', '16', '30', '2017-04-28', '20000', '1070', '1065', '200', 'F', '40', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32425', '2017-04-16 06:35:00', '40', '16', '30', '2017-04-29', '20000', '1080', '1070', '210', 'F', '40', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32727', '2017-04-17 09:55:00', '40', '16', '31', '2017-04-25', '20000', '1090', '1085', '95', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32730', '2017-04-17 09:55:00', '40', '16', '31', '2017-04-30', '20000', '1230', '1205', '190', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32435', '2017-04-16 06:35:00', '40', '16', '30', '2017-05-09', '20000', '0', '0', '0', 'F', '40', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32438', '2017-04-16 06:35:00', '40', '16', '30', '2017-05-12', '20000', '0', '0', '0', 'F', '40', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32440', '2017-04-16 06:35:00', '40', '16', '30', '2017-05-14', '20000', '0', '0', '0', 'F', '40', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32736', '2017-04-17 09:55:00', '40', '16', '31', '2017-05-06', '20000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32739', '2017-04-17 09:55:00', '40', '16', '31', '2017-05-10', '20000', '0', '0', '0', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32494', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-17', '2000', '170', '155', '15', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32495', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-18', '2000', '180', '170', '25', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32496', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-19', '2000', '140', '115', '50', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32497', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-20', '2000', '170', '155', '65', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32498', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-21', '2000', '80', '70', '75', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32499', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-22', '2000', '110', '105', '80', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32500', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-23', '2000', '70', '55', '95', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32501', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-24', '2000', '110', '100', '105', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32502', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-25', '2000', '60', '40', '125', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32503', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-26', '2000', '170', '160', '135', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32504', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-27', '2000', '90', '70', '155', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32505', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-28', '2000', '90', '75', '170', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32506', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-29', '2000', '170', '150', '190', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32507', '2017-04-16 11:48:00', '249', '254', '0', '2017-04-30', '2000', '140', '115', '215', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32508', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-01', '2000', '160', '145', '230', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32509', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-02', '2000', '90', '80', '240', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32510', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-03', '2000', '0', '240', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32511', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-04', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32512', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-05', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32513', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-06', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32514', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-07', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32515', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-08', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32516', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-09', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32517', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-10', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32518', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-11', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32519', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-12', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32520', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-13', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32521', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-14', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32522', '2017-04-16 11:48:00', '249', '254', '0', '2017-05-15', '2000', '0', '0', '0', 'F', '249', '2017-04-16', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32744', '2017-04-17 09:55:00', '40', '13', '29', '2017-04-18', '50000', '3100', '3075', '25', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32745', '2017-04-17 09:55:00', '40', '13', '29', '2017-04-19', '50000', '4760', '4735', '50', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32746', '2017-04-17 09:55:00', '40', '13', '22', '2017-04-20', '50000', '3190', '3175', '65', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32747', '2017-04-17 09:55:00', '40', '13', '23', '2017-04-21', '50000', '4280', '4255', '90', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);
INSERT INTO `plan` VALUES ('32748', '2017-04-17 09:55:00', '40', '13', '23', '2017-04-22', '50000', '4280', '4270', '100', 'F', '40', '2017-04-17', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `plandaytmp`
-- ----------------------------
DROP TABLE IF EXISTS `plandaytmp`;
CREATE TABLE `plandaytmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plandaytmp
-- ----------------------------
INSERT INTO `plandaytmp` VALUES ('147', '1', '1');
INSERT INTO `plandaytmp` VALUES ('148', '2', '2');
INSERT INTO `plandaytmp` VALUES ('149', '3', '3');
INSERT INTO `plandaytmp` VALUES ('150', '4', '4');
INSERT INTO `plandaytmp` VALUES ('151', '5', '5');
INSERT INTO `plandaytmp` VALUES ('152', '6', '6');
INSERT INTO `plandaytmp` VALUES ('153', '7', '7');
INSERT INTO `plandaytmp` VALUES ('154', '8', '8');
INSERT INTO `plandaytmp` VALUES ('155', '9', '9');
INSERT INTO `plandaytmp` VALUES ('156', '10', '10');
INSERT INTO `plandaytmp` VALUES ('157', '11', '11');
INSERT INTO `plandaytmp` VALUES ('158', '12', '12');
INSERT INTO `plandaytmp` VALUES ('159', '13', '13');
INSERT INTO `plandaytmp` VALUES ('160', '14', '14');
INSERT INTO `plandaytmp` VALUES ('161', '15', '15');
INSERT INTO `plandaytmp` VALUES ('162', '16', '16');
INSERT INTO `plandaytmp` VALUES ('163', '17', '17');
INSERT INTO `plandaytmp` VALUES ('164', '18', '18');
INSERT INTO `plandaytmp` VALUES ('165', '19', '19');
INSERT INTO `plandaytmp` VALUES ('166', '20', '20');
INSERT INTO `plandaytmp` VALUES ('167', '21', '21');
INSERT INTO `plandaytmp` VALUES ('168', '22', '22');
INSERT INTO `plandaytmp` VALUES ('169', '23', '23');
INSERT INTO `plandaytmp` VALUES ('170', '24', '24');
INSERT INTO `plandaytmp` VALUES ('171', '25', '25');
INSERT INTO `plandaytmp` VALUES ('172', '26', '26');
INSERT INTO `plandaytmp` VALUES ('173', '27', '27');
INSERT INTO `plandaytmp` VALUES ('174', '28', '28');
INSERT INTO `plandaytmp` VALUES ('175', '29', '29');

-- ----------------------------
-- Table structure for `postcard`
-- ----------------------------
DROP TABLE IF EXISTS `postcard`;
CREATE TABLE `postcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postCardNo` varchar(50) DEFAULT NULL,
  `manName` varchar(200) DEFAULT NULL,
  `rate` float(10,3) DEFAULT NULL,
  `minMoney` float(10,0) DEFAULT NULL,
  `maxMoney` float(10,0) DEFAULT NULL,
  `trade` varchar(100) DEFAULT NULL,
  `bindBank` varchar(100) DEFAULT NULL,
  `cardNo` varchar(50) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `lockStatus` varchar(2) DEFAULT NULL,
  `enableFlag` varchar(2) DEFAULT NULL,
  `createBy` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postcard
-- ----------------------------
INSERT INTO `postcard` VALUES ('270', '李国欣_007', '苏登峰', '0.000', '0', '0', null, '苏登峰', '撒的发生', '苏登峰', '0', 'T', '40', '2017-04-18', '40', '2017-04-18');
INSERT INTO `postcard` VALUES ('19', '李国欣_001', '家乐福', '0.006', '0', '100000', '超市', '招商银行', '4392258326438100', '李国欣', '0', 'T', '40', '2015-08-16', '0', '2017-04-16');
INSERT INTO `postcard` VALUES ('20', '李国欣_002', '丽人服饰', '0.006', '0', '30000', '服装', '招商银行', '4392258326438100', '李国欣', '0', 'T', '40', '2015-08-17', '0', '2017-04-16');
INSERT INTO `postcard` VALUES ('21', '李国欣_003', '便民超市', '0.006', '0', '30000', '超市', '招商银行', '4392258326438100', '李国欣', '0', 'T', '40', '2015-08-17', '0', '2017-04-16');
INSERT INTO `postcard` VALUES ('22', '李国欣_004', '沙县小吃', '0.006', '0', '50000', '小吃', '招商银行', '4392258326438100', '李国欣', '0', 'T', '40', '2015-08-17', '0', '2017-04-16');
INSERT INTO `postcard` VALUES ('23', '李国欣_005', '国美电器', '0.006', '0', '5000', '电器', '招商银行', '4392258326438100', '李国欣', '0', 'T', '40', '2015-08-17', '0', '2017-04-16');
INSERT INTO `postcard` VALUES ('271', '李国欣_008', '234234', '0.000', '0', '0', null, '234234', '234232', '23423', '0', 'T', '40', '2017-04-18', null, null);
INSERT INTO `postcard` VALUES ('29', '李国欣_006', '周大福珠宝', '0.006', '0', '100000', '珠宝', '招商银行', '4392258326438100', '李国欣', '0', 'T', '40', '2015-08-22', '0', '2017-04-16');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginNo` varchar(100) DEFAULT NULL,
  `pwd` varchar(200) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `cardNo` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `lockStatus` varchar(2) DEFAULT '',
  `enableFlag` varchar(2) DEFAULT 'T',
  `createBy` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL,
  `updateDate` date DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', 'system', 'ps1mc3o8MWE=', 'system', '4392258326438100', '河南省郑州市', '18339207935', '0', 'T', '0', '2015-07-04', '0', '2017-04-16');
INSERT INTO `user` VALUES ('40', 'liguoxin', 'B3r19IYVtJU=', '李国欣', '8888888888888888', '河南省南阳市333', '18339207935', '0', 'T', '0', '2015-08-16', '40', '2017-04-16');

-- ----------------------------
-- Procedure structure for `exceutePlanCron`
-- ----------------------------
DROP PROCEDURE IF EXISTS `exceutePlanCron`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exceutePlanCron`(in param1 varchar(20),in param2 varchar(20),out p_val int)
BEGIN
DECLARE v_pre_month_bill_sum_money int ; -- 上月账单总额度

DECLARE v_pre_month_bill_sale_money int;  -- 上月消费总金额

DECLARE v_pre_month_bill_pay_money int ; --  上月还款总金额

DECLARE v_pre_month_not_pay_bill_money  int;  -- 上月欠款总金额

DECLARE v_cur_month_bill_sum_money int ; --   当月账单总额度

DECLARE v_cur_month_bill_sale_money int;  -- 当月消费总金额

DECLARE v_cur_month_bill_pay_money int ; --   当月还款总金额

DECLARE v_cur_month_not_pay_bill_money  int;  --  当月欠款总金额

DECLARE  v_billDATE  int; -- 账单日

DECLARE  v_credit_bill_date_count int; -- 账单日信用卡数量

DECLARE  v_pre_bill_sum_money	int ; -- 前一个帐号总金额

DECLARE v_current_sale_sum_money int; -- 当前消费总金额

DECLARE v_current_pay_sum_money	int; -- 当前还款总金额

DECLARE v_bill_count  int; -- 每张信用卡的账单数量

DECLARE v_bill_sale_rate double; -- 账单消费比率(总金额的70%-80%)

DECLARE v_bill_credit_no VARCHAR(30); -- 信用卡号


DECLARE v_pre_bill_date date;  -- 前一个月帐号日

DECLARE  v_current_bill_day date; --  当前日期

DECLARE v_next_bill_day date;	-- 下一个账单日期

DECLARE v_bill_sum_days  int; -- 账单总天数

DECLARE v_credit_no  VARCHAR(30); --  信用卡编号

DECLARE i INT;

DECLARE v_day_count  INT;

DECLARE v_sale_day date;

SELECT  DAYOFMONTH( DATE_FORMAT(NOW(),'%Y-%m-%d %h:%i:%s')) into v_billDATE ; 

select date_format(now(),'%y-%m-%d') into v_current_bill_day;

select date_format(date_add(NOW(), interval 1 MONTH),'%y-%m-%d')  into  v_next_bill_day;

SELECT   v_next_bill_day - v_current_bill_day INTO   v_bill_sum_days;

SELECT count(1) INTO v_credit_bill_date_count   FROM CREDITCARD  F where f.billDate=v_billDate;

select date_add(NOW(), interval 1 MONTH) ; --  获取下一个月的今天

select date_sub(NOW(), interval  1 MONTH);  -- 获取上一个月的今天

if v_credit_bill_date_count >0 then
	
SELECT *   FROM CREDITCARD  F where f.billDate=v_billDate;

SET v_credit_no='C001';

loop_label:  LOOP
 SET i=i+1;
	IF  v_day_count>i then
select DATE_ADD(now(), Interval +i day) INTO  v_sale_day;


	if f_check_sale_day(i) =1  then 
	
		INSERT INTO Plan(crditId,saleDate,outmoney) VALUES(i,iv_sale_day,100);

	else 
	
		INSERT INTO Plan(crditId,saleDate,outmoney) VALUES(i,iv_sale_day,0);

	end if;

	



	END IF;

	if i>dayCount then 
	LEAVE loop_label;
	end if;
	
END LOOP loop_label;


end if;

if v_credit_bill_date_count  is null then 

SELECT *   FROM CREDITCARD  F where f.billDate=v_billDate;
end if;


COMMIT;

   END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `executePlanProc`
-- ----------------------------
DROP PROCEDURE IF EXISTS `executePlanProc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `executePlanProc`()
BEGIN
	
DECLARE v_pre_month_bill_sum_money INT ; -- 上月账单总额度

DECLARE v_pre_month_bill_sale_money INT;  -- 上月消费总金额

DECLARE v_pre_month_bill_pay_money INT ; --  上月还款总金额

DECLARE v_pre_month_not_pay_bill_money  INT;  -- 上月欠款总金额


DECLARE v_cur_month_bill_sum_money INT ; --   当月账单总额度

DECLARE v_cur_month_bill_sale_money INT;  -- 当月消费总金额

DECLARE v_cur_month_bill_pay_money INT ; --   当月还款总金额

DECLARE v_cur_month_not_pay_bill_money  INT;  --  当月欠款总金额


DECLARE  v_billDATE  INT; -- 账单日

DECLARE  v_credit_bill_date_count INT; -- 账单日信用卡数量

DECLARE  v_pre_bill_sum_money	INT ; -- 前一个帐号总金额


DECLARE v_current_sale_sum_money INT; -- 当前消费总金额

DECLARE v_current_pay_sum_money	INT; -- 当前还款总金额


DECLARE v_bill_count  INT; -- 每张信用卡的账单数量
DECLARE v_bill_sale_rate DOUBLE; -- 账单消费比率(总金额的70%-80%)

DECLARE v_bill_credit_no VARCHAR(30); -- 信用卡号

DECLARE v_pre_bill_date DATE;  -- 前一个月帐号日



DECLARE  v_current_bill_day DATE; --  当前日期
DECLARE v_next_bill_day DATE;	-- 下一个账单日期


DECLARE v_bill_sum_days  INT; -- 账单总天数


DECLARE v_credit_no  VARCHAR(30); --  信用卡编号



DECLARE i INT;
DECLARE dayCount  INT;

DECLARE v_day_count  INT;
DECLARE v_sale_day DATE;

DECLARE v_is_sale_date  INT;


SELECT  DAYOFMONTH( DATE_FORMAT(NOW(),'%Y-%m-%d %h:%i:%s')) into v_billDATE ; 

select date_format(now(),'%y-%m-%d') into v_current_bill_day;
select date_format(date_add(NOW(), interval 1 MONTH),'%y-%m-%d')  into  v_next_bill_day;


SELECT   v_next_bill_day - v_current_bill_day INTO   v_bill_sum_days;


SELECT count(1) INTO v_credit_bill_date_count   FROM CREDITCARD  F where f.billDate=v_billDate;

select date_add(NOW(), interval 1 MONTH) ; --  获取下一个月的今天


select date_sub(NOW(), interval  1 MONTH);  -- 获取上一个月的今天


SEt dayCount=30;
SET i=0;
SET v_is_sale_date = 0;

SET v_sale_day = now();

if v_credit_bill_date_count >0 then

SELECT *   FROM CREDITCARD  F where f.billDate=v_billDate;

SET v_credit_no='C001';
SET v_day_count  =1;
	IF  v_day_count>i then

loop_label:  LOOP
 SET i=i+1;
  SELECT  f_check_sale_day(i) INTO v_is_sale_date;

		 select DATE_ADD(now(), Interval i day) INTO  v_sale_day;
			if v_is_sale_date =1  then

				INSERT INTO Plan(creditCardId,saleDate,outmoney)
        VALUES(i,v_sale_day,100);
        COMMIT;
			else

				INSERT INTO Plan(creditCardId,saleDate,outmoney)
         VALUES(i,v_sale_day,0);
         COMMIT;
			end if;



	if i>dayCount then
	LEAVE loop_label;
	end if;
	
END LOOP loop_label;


end if;


end if;

if v_credit_bill_date_count  is null then

SELECT *   FROM CREDITCARD  F where f.billDate=v_billDate;
end if;


COMMIT;

   END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `f_check_sale_day`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_check_sale_day`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_check_sale_day`(`day` int) RETURNS int(11)
BEGIN
	#Routine body goes here...


	DECLARE i int ;
	DECLARE v_count  int;
	SET i = 0;

		SELECT count(day) INTO v_count  FROM dayplantmpresult d WHERE d.day=day;

	IF v_count is null OR v_count =0 then 
		SET i = 0;

	else 
		SET i = 1;

	end if;

	RETURN i;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `f_generate_plan_day_tmp`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_generate_plan_day_tmp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_generate_plan_day_tmp`(dayCount int) RETURNS int(11)
BEGIN 

DECLARE i int;
SET i=0;


/**
 loop_label:  LOOP
 SET i=i+1;
	IF  dayCount>i then

	INSERT INTO PlanDayTmp(day,orderId) VALUES(i,i);



	END IF;

	if i>dayCount then 
	LEAVE loop_label;
	end if;
	
END LOOP loop_label;

*/
 
DELETE FROM  dayplantmpresult;  -- 删除数据

INSERT INTO dayplantmpresult(day,orderId) 

SELECT T.day,t.orderId FROM planDayTmp  T  where t.orderId<dayCount order by RAND() LIMIT 20;


return i;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `F_getMaxSaleDay`
-- ----------------------------
DROP FUNCTION IF EXISTS `F_getMaxSaleDay`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `F_getMaxSaleDay`() RETURNS int(11)
BEGIN
	#Routine body goes here...


	DECLARE i int ;
	DECLARE v_count  int;
	SET i = 0;

		SELECT max(day) INTO v_count  FROM dayplantmpresult d ;

	IF v_count is null OR v_count =0 then 
		SET i = 0;

	else 
		SET i = v_count;

	end if;

	RETURN i;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `f_get_post_cardId`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_get_post_cardId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_post_cardId`(`money` int,`userId` int) RETURNS int(11)
BEGIN
	#Routine body goes here...

DECLARE v_post_cardId int;

SET v_post_cardId = 0;
SELECT P.ID into v_post_cardId  FROM POSTCARD P WHERE P.CREATEBY=userId AND P.MINMONEY<money AND P.MAXMONEY>=money and p.lockStatus='0'

ORDER BY RAND() LIMIT 1 ;

if v_post_cardId =0 then 
SELECT P.ID into v_post_cardId  FROM POSTCARD P WHERE P.CREATEBY=userId 
ORDER BY RAND() LIMIT 1 ;
end if;

return v_post_cardId;


END
;;
DELIMITER ;
