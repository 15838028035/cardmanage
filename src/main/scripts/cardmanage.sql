/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : cardmanage

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2015-09-12 11:01:10
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creditcard
-- ----------------------------
INSERT INTO `creditcard` VALUES ('1', 'C1001', '郑州银行', '张三', '300', '2', '2015-06-20', '21', '15', '0', '2015-07-05', null, null, '0', 'T');
INSERT INTO `creditcard` VALUES ('2', 'S001', 'S001', 'S001', '3000', '205', '2015-06-20', '3', '20', '0', '2015-07-05', '0', '2015-07-05 10:51:02', '0', 'T');
INSERT INTO `creditcard` VALUES ('3', 'U2001000000000000000', 'U2001', 'U2001', '30000', '200', '2015-06-20', '28', '20', '0', '2015-07-05', '0', '2015-08-22 03:52:51', '0', 'T');
INSERT INTO `creditcard` VALUES ('4', '11111', '11', '??', '133', '333', '33', '3', '20', '0', '2015-08-09', '0', '2015-08-09 01:21:18', '0', 'T');
INSERT INTO `creditcard` VALUES ('6', '11', '11', '测试用户01', '33', '333', '33', '3', '20', '0', '2015-08-09', null, null, '0', 'T');
INSERT INTO `creditcard` VALUES ('7', 'user222', '33', '测试02', '30', '33', '33', '2', '20', '0', '2015-08-09', '0', '2015-08-09 01:29:31', '0', 'T');
INSERT INTO `creditcard` VALUES ('9', '44444444444444444444', '招商银行', '11111111111111', '33', '333', '1', '2', '20', '0', '2015-08-15', '0', '2015-08-15 04:37:35', '0', 'T');
INSERT INTO `creditcard` VALUES ('10', '12345671234455555555', '中国银行', '张三', '20000', '345', '2015-06-20', '16', '6', '0', '2015-08-16', '0', '2015-08-16 09:45:06', '0', 'T');

-- ----------------------------
-- Table structure for `dayplantmpresult`
-- ----------------------------
DROP TABLE IF EXISTS `dayplantmpresult`;
CREATE TABLE `dayplantmpresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36850 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dayplantmpresult
-- ----------------------------
INSERT INTO `dayplantmpresult` VALUES ('36819', '20', '20');
INSERT INTO `dayplantmpresult` VALUES ('36820', '26', '26');
INSERT INTO `dayplantmpresult` VALUES ('36821', '2', '2');
INSERT INTO `dayplantmpresult` VALUES ('36822', '6', '6');
INSERT INTO `dayplantmpresult` VALUES ('36823', '14', '14');
INSERT INTO `dayplantmpresult` VALUES ('36824', '8', '8');
INSERT INTO `dayplantmpresult` VALUES ('36825', '4', '4');
INSERT INTO `dayplantmpresult` VALUES ('36826', '9', '9');
INSERT INTO `dayplantmpresult` VALUES ('36827', '13', '13');
INSERT INTO `dayplantmpresult` VALUES ('36828', '22', '22');
INSERT INTO `dayplantmpresult` VALUES ('36829', '16', '16');
INSERT INTO `dayplantmpresult` VALUES ('36830', '18', '18');
INSERT INTO `dayplantmpresult` VALUES ('36831', '12', '12');
INSERT INTO `dayplantmpresult` VALUES ('36832', '19', '19');
INSERT INTO `dayplantmpresult` VALUES ('36833', '7', '7');
INSERT INTO `dayplantmpresult` VALUES ('36834', '25', '25');
INSERT INTO `dayplantmpresult` VALUES ('36835', '24', '24');
INSERT INTO `dayplantmpresult` VALUES ('36836', '28', '28');
INSERT INTO `dayplantmpresult` VALUES ('36837', '10', '10');
INSERT INTO `dayplantmpresult` VALUES ('36838', '21', '21');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('511', '2015-08-24 08:30:00', '0', '3', '1', '2015-08-25', '30000', '0', '5000', '25000', 'T', '0', '2015-08-24', null, null, null, null);
INSERT INTO `plan` VALUES ('512', '2015-08-24 08:30:00', '0', '3', '14', '2015-08-26', '30000', '0', '0', '25000', 'T', '0', '2015-08-24', null, null, null, null);
INSERT INTO `plan` VALUES ('661', '2015-08-28 10:05:00', '0', '3', '14', '2015-08-29', '30000', '1650', '160', '28190', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('662', '2015-08-28 10:05:00', '0', '3', '14', '2015-08-30', '30000', '1139', '0', '15329', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('663', '2015-08-28 10:05:00', '0', '3', '1', '2015-08-31', '30000', '641', '4284', '11686', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('664', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-01', '30000', '533', '0', '12219', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('665', '2015-08-28 10:05:00', '0', '3', '1', '2015-09-02', '30000', '217', '5121', '7315', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('666', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-03', '30000', '246', '1379', '6182', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('667', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-04', '30000', '160', '1611', '4731', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('668', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-05', '30000', '120', '0', '4851', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('669', '2015-08-28 10:05:00', '0', '3', '1', '2015-09-06', '30000', '0', '2200', '2651', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('670', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-07', '30000', '0', '654', '1997', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('671', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-08', '30000', '294', '0', '2291', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('672', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-09', '30000', '0', '726', '1565', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('673', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-10', '30000', '0', '1556', '9', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('674', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-11', '30000', '0', '463', '-454', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('675', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-12', '30000', '0', '597', '-1051', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('676', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-13', '30000', '0', '337', '-1388', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('677', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-14', '30000', '0', '0', '-1388', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('678', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-15', '30000', '0', '0', '-1388', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('679', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-16', '30000', '0', '554', '-1942', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('680', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-17', '30000', '0', '258', '-2200', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('681', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-18', '30000', '0', '132', '-2332', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('682', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-19', '30000', '0', '0', '-2332', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('683', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-20', '30000', '0', '0', '-2332', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('684', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-21', '30000', '0', '0', '-2332', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('685', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-22', '30000', '0', '0', '-2332', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('686', '2015-08-28 10:05:00', '0', '3', '13', '2015-09-23', '30000', '0', '309', '-2641', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('687', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-24', '30000', '0', '0', '-2641', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('688', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-25', '30000', '0', '0', '-2641', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('689', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-26', '30000', '0', '105', '-2746', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('690', '2015-08-28 10:05:00', '0', '3', '14', '2015-09-27', '30000', '0', '0', '-2746', 'F', '0', '2015-08-28', null, null, null, null);
INSERT INTO `plan` VALUES ('1213', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-04', '3000', '0', '0', '3000', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1214', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-05', '3000', '0', '0', '3000', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1215', '2015-09-03 10:50:00', '0', '2', '13', '2015-09-06', '3000', '0', '438', '2562', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1216', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-07', '3000', '0', '280', '2282', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1217', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-08', '3000', '0', '0', '2282', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1218', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-09', '3000', '0', '0', '2282', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1219', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-10', '3000', '0', '103', '2179', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1220', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-11', '3000', '0', '0', '2179', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1221', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-12', '3000', '0', '232', '1947', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1222', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-13', '3000', '0', '0', '1947', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1223', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-14', '3000', '0', '0', '1947', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1224', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-15', '3000', '0', '216', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1225', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-16', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1226', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-17', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1227', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-18', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1228', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-19', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1229', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-20', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1230', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-21', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1231', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-22', '3000', '0', '0', '1731', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1232', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-23', '3000', '0', '110', '1621', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1233', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-24', '3000', '0', '113', '1508', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1234', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-25', '3000', '0', '0', '1508', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1235', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-26', '3000', '0', '118', '1390', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1236', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-27', '3000', '0', '179', '1211', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1237', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-28', '3000', '0', '128', '1083', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1238', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-29', '3000', '0', '0', '1083', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1239', '2015-09-03 10:50:00', '0', '2', '14', '2015-09-30', '3000', '0', '0', '1083', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1240', '2015-09-03 10:50:00', '0', '2', '14', '2015-10-01', '3000', '0', '0', '1083', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1241', '2015-09-03 10:50:00', '0', '2', '14', '2015-10-02', '3000', '0', '0', '1083', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1242', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-04', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1243', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-05', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1244', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-06', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1245', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-07', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1246', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-08', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1247', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-09', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1248', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-10', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1249', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-11', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1250', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-12', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1251', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-13', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1252', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-14', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1253', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-15', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1254', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-16', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1255', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-17', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1256', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-18', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1257', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-19', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1258', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-20', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1259', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-21', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1260', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-22', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1261', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-23', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1262', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-24', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1263', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-25', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1264', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-26', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1265', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-27', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1266', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-28', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1267', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-29', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1268', '2015-09-03 10:50:00', '0', '4', '14', '2015-09-30', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1269', '2015-09-03 10:50:00', '0', '4', '14', '2015-10-01', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1270', '2015-09-03 10:50:00', '0', '4', '14', '2015-10-02', '133', '0', '0', '133', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1271', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-04', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1272', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-05', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1273', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-06', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1274', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-07', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1275', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-08', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1276', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-09', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1277', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-10', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1278', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-11', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1279', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-12', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1280', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-13', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1281', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-14', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1282', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-15', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1283', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-16', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1284', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-17', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1285', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-18', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1286', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-19', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1287', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-20', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1288', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-21', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1289', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-22', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1290', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-23', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1291', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-24', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1292', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-25', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1293', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-26', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1294', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-27', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1295', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-28', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1296', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-29', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1297', '2015-09-03 10:50:00', '0', '6', '14', '2015-09-30', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1298', '2015-09-03 10:50:00', '0', '6', '14', '2015-10-01', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);
INSERT INTO `plan` VALUES ('1299', '2015-09-03 10:50:00', '0', '6', '14', '2015-10-02', '33', '0', '0', '33', 'F', '0', '2015-09-03', null, null, null, null);

-- ----------------------------
-- Table structure for `plandaytmp`
-- ----------------------------
DROP TABLE IF EXISTS `plandaytmp`;
CREATE TABLE `plandaytmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

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
  `rate` float DEFAULT NULL,
  `minMoney` float DEFAULT NULL,
  `maxMoney` float DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postcard
-- ----------------------------
INSERT INTO `postcard` VALUES ('1', 'system_001', 'manName', '0.8', '2000', '10000', '行业01', '建设银行', '444444444444444444444', '张三', null, null, '0', '2015-07-05', null, null);
INSERT INTO `postcard` VALUES ('2', 'system_002', 'manName', '0.8', '2000', '10000', '行业01', '建设银行', '444444444444444444444', '张三', null, null, '0', '2015-07-05', null, null);
INSERT INTO `postcard` VALUES ('12', 'system_004', '商户01', '0.8', '300', '100', '餐饮', '建设银行', '44444444444444444', '张三', null, null, '0', '2015-07-05', null, null);
INSERT INTO `postcard` VALUES ('13', 'system_005', 'U2001', '0.5', '300', '4000', '行业01', '建设银行', '44444444444', '张三', '0', 'T', '0', '2015-07-05', null, null);
INSERT INTO `postcard` VALUES ('14', 'system_006', '商户01', '0.38', '0', '100000', '111', '1111', '111111111111111111', '1111', '0', 'T', '0', '2015-08-15', '0', '2015-08-15');
INSERT INTO `postcard` VALUES ('15', 'system_007', '张三家电超市', '0.38', '500', '2000', '家电', '建设银行', '11111111111111111111', '张三', '0', 'T', '0', '2015-08-16', null, null);
INSERT INTO `postcard` VALUES ('16', 'system_008', '张三美发', '0.78', '100', '800', '美容', '张三', '11111111111111111111', '张三', '0', 'T', '0', '2015-08-16', null, null);
INSERT INTO `postcard` VALUES ('17', 'liujie_001', 'liujie', '0.38', '100', '10000', '超市', '建行', 'C0000000000000000000', '刘杰', '0', 'T', '49', '2015-08-22', null, null);
INSERT INTO `postcard` VALUES ('18', 'liujie_002', '刘杰', '0.49', '1000', '500000', '餐饮', '建行', 'C0000000000000000002', 'liuji', '0', 'T', '49', '2015-08-22', null, null);
INSERT INTO `postcard` VALUES ('19', 'liujie_003', '刘杰', '0.78', '500', '500000', 'KTV', '建行', 'C3333333333333333333', '刘杰', '0', 'T', '49', '2015-08-22', null, null);
INSERT INTO `postcard` VALUES ('21', 'liujie_004', '刘杰', '0.59', '5000', '60000', '保险', '建行', 'C4444444444444444444', '刘杰', '0', 'T', '49', '2015-08-22', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginNo` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', 'system', 'B3r19IYVtJU=', 'system', '41222419878809', 'address', '15838028035', '0', 'T', '1', '2015-07-04', '1', '2015-08-22');
INSERT INTO `user` VALUES ('23', 'user2', 'B3r19IYVtJU=', 'user2', 'user2', 'user2', 'user2', '0', 'T', '1', '2015-07-05', '0', '2015-08-08');
INSERT INTO `user` VALUES ('24', 'user3', 'G9YZLEvvN/o=', 'user3', 'user3', 'user3', 'user3', '0', 'T', '1', '2015-07-05', null, null);
INSERT INTO `user` VALUES ('25', 'user22', '848awTWMv6c=', 'user22', 'user22', 'user22', 'user22', '0', 'T', '0', '2015-07-05', null, null);
INSERT INTO `user` VALUES ('26', 'user222', 'Xa+Q9J/DIHg=', 'user222', 'user222', 'user222', 'user222', '0', 'T', '0', '2015-07-05', null, null);
INSERT INTO `user` VALUES ('31', 'user4', '5iyKvtt6vc2KXN/cj1HMbw==', 'user44', 'user4', 'user4', 'user4', '0', 'T', '0', '2015-07-05', null, null);
INSERT INTO `user` VALUES ('32', 'user5', 'B3r19IYVtJU=', 'user5', '3333', '33333333333333', '15833887796', '0', 'T', '0', '2015-07-19', null, null);
INSERT INTO `user` VALUES ('44', '111', 'caplhhj5SHw=', '测试用户01', '333333', '33', '33333', '0', 'T', '0', '2015-08-09', null, null);
INSERT INTO `user` VALUES ('47', 'user6', 'B3r19IYVtJU=', 'user6', '11111111111111111111', '河南省郑州市区', '444444444444444', '0', 'T', '0', '2015-08-16', null, null);
INSERT INTO `user` VALUES ('49', 'liujie', 'B3r19IYVtJU=', 'liujie', 'U0000000000000000000', 'zhengzhou', '15838028035', '0', 'T', '0', '2015-08-22', null, null);

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
-- Function structure for `f_get_post_cardId`
-- ----------------------------
DROP FUNCTION IF EXISTS `f_get_post_cardId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_post_cardId`(`money` int,`userId` int) RETURNS int(11)
BEGIN
	#Routine body goes here...

DECLARE v_post_cardId int;

SET v_post_cardId = 0;
SELECT P.ID into v_post_cardId  FROM POSTCARD P WHERE P.CREATEBY=userId AND P.MINMONEY<money AND P.MAXMONEY>=money

ORDER BY RAND() LIMIT 1 ;

return v_post_cardId;


END
;;
DELIMITER ;
