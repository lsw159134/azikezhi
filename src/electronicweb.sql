/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : electronicweb

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-05-26 19:12:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addsimpleproduct
-- ----------------------------
DROP TABLE IF EXISTS `addsimpleproduct`;
CREATE TABLE `addsimpleproduct` (
  `productuid` varchar(32) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `billUid` varchar(32) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `particulars` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `detailed` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`billUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentsUid` varchar(32) NOT NULL,
  `commentsId` int(11) NOT NULL AUTO_INCREMENT,
  `userUid` varchar(32) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `unlikeCount` int(11) DEFAULT '0',
  `likeCount` int(11) DEFAULT '0',
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `topicType` varchar(32) DEFAULT NULL,
  `parentUid` varchar(32) DEFAULT NULL,
  `delFlag` tinyint(4) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `path` varchar(10000) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `postkey` varchar(64) DEFAULT NULL,
  `activity` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`commentsUid`),
  UNIQUE KEY `commentsId` (`commentsId`) USING BTREE COMMENT 'commentsId是id自增长,不可少'
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `communityUUID` char(32) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`communityUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `express` char(32) NOT NULL,
  `expressName` varchar(64) DEFAULT NULL,
  `expressNumber` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `telphone` varchar(32) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `help` varchar(512) DEFAULT NULL,
  `useruid` varchar(32) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `productuid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`express`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for helpbuy
-- ----------------------------
DROP TABLE IF EXISTS `helpbuy`;
CREATE TABLE `helpbuy` (
  `HelpBuyUid` varchar(32) NOT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Number` varchar(11) DEFAULT NULL,
  `Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `Ip` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HelpBuyUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for hothelpbuy
-- ----------------------------
DROP TABLE IF EXISTS `hothelpbuy`;
CREATE TABLE `hothelpbuy` (
  `hothelpbuyuid` varchar(32) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hothelpbuyuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for hotmall
-- ----------------------------
DROP TABLE IF EXISTS `hotmall`;
CREATE TABLE `hotmall` (
  `hotmallUid` varchar(32) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `encapsulation` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `number` decimal(10,0) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hotmallUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for leavemessage
-- ----------------------------
DROP TABLE IF EXISTS `leavemessage`;
CREATE TABLE `leavemessage` (
  `messageUid` varchar(32) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`messageUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mallbilling
-- ----------------------------
DROP TABLE IF EXISTS `mallbilling`;
CREATE TABLE `mallbilling` (
  `billUid` varchar(32) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `product` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`billUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for memberservice
-- ----------------------------
DROP TABLE IF EXISTS `memberservice`;
CREATE TABLE `memberservice` (
  `memberServiceUId` varchar(32) NOT NULL,
  `product` varchar(64) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `encapsulation` varchar(64) DEFAULT NULL,
  `supplier` varchar(64) DEFAULT NULL,
  `supplierAddress` varchar(255) DEFAULT NULL,
  `year` varchar(32) DEFAULT NULL,
  `ActualsNumber` int(11) DEFAULT NULL,
  `submitTime` datetime DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `submitUsername` varchar(255) DEFAULT NULL,
  `submitIp` varchar(64) DEFAULT NULL,
  `submitUserUid` varchar(32) DEFAULT NULL,
  `userRemark` varchar(255) DEFAULT NULL,
  `resultRemark` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`memberServiceUId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `ModelUUID` varchar(32) NOT NULL,
  `Model` varchar(32) NOT NULL,
  `Encapsulation` varchar(32) NOT NULL,
  `Firm` varchar(32) NOT NULL,
  `Photo` varchar(128) DEFAULT NULL,
  `Material` varchar(128) DEFAULT NULL,
  `Synopsis` varchar(128) DEFAULT NULL,
  `Replacement` varchar(128) DEFAULT NULL,
  `explanation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ModelUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `ModuleUUID` varchar(32) NOT NULL,
  `ProductModule` varchar(8) DEFAULT NULL,
  `SupplierModule` varchar(8) DEFAULT NULL,
  `SupplierUserModule` varchar(8) DEFAULT NULL,
  `RecruitmentModule` varchar(8) DEFAULT NULL,
  `UserInfoModule` varchar(8) DEFAULT NULL,
  `UserUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ModuleUUID`),
  KEY `FK_UserUUID_Module` (`UserUUID`) USING BTREE,
  CONSTRAINT `FK_module_userinfo` FOREIGN KEY (`UserUUID`) REFERENCES `userinfo` (`UserUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for passivecomponents
-- ----------------------------
DROP TABLE IF EXISTS `passivecomponents`;
CREATE TABLE `passivecomponents` (
  `passiveComponentsUid` varchar(32) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `phone1` varchar(32) DEFAULT NULL,
  `phone2` varchar(32) DEFAULT NULL,
  `down` int(11) DEFAULT '0',
  `up` int(11) DEFAULT '0',
  `cellphone` varchar(32) DEFAULT NULL,
  `cellphone1` varchar(32) DEFAULT NULL,
  `qq` varchar(32) DEFAULT NULL,
  `qq1` varchar(32) DEFAULT NULL,
  `qq2` varchar(32) DEFAULT NULL,
  `qq3` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `illustration` varchar(255) DEFAULT NULL,
  `explain1` varchar(255) DEFAULT NULL,
  `explain2` varchar(255) DEFAULT NULL,
  `explain3` varchar(255) DEFAULT NULL,
  `label` varchar(64) DEFAULT NULL,
  `label1` varchar(64) DEFAULT NULL,
  `label2` varchar(64) DEFAULT NULL,
  `label3` varchar(64) DEFAULT NULL,
  `label4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`passiveComponentsUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for procurementservice
-- ----------------------------
DROP TABLE IF EXISTS `procurementservice`;
CREATE TABLE `procurementservice` (
  `procurementserviceuid` varchar(64) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `encapsulation` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `realyear` varchar(255) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `useruid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `usertel` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`procurementserviceuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductUUID` varchar(32) NOT NULL,
  `Product` varchar(32) NOT NULL,
  `Supplier` varchar(32) DEFAULT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `Manufacturer` varchar(32) DEFAULT NULL,
  `LotNumber` varchar(32) DEFAULT NULL,
  `Encapsulation` varchar(24) DEFAULT NULL,
  `IsGoodsInStock` varchar(9) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Document` varchar(128) DEFAULT NULL,
  `Image` varchar(128) DEFAULT NULL,
  `Keywords` varchar(64) DEFAULT NULL,
  `Complaint` varchar(128) DEFAULT NULL,
  `Quality` int(4) DEFAULT NULL,
  `SupplierUUID` varchar(32) DEFAULT NULL,
  `complaintPrice` int(7) DEFAULT '0',
  `complaintActuals` int(7) DEFAULT '0',
  `complaintOriginal` int(7) DEFAULT '0',
  `QQ` char(20) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductUUID`),
  KEY `FK_Product_Supplier` (`SupplierUUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for productmall
-- ----------------------------
DROP TABLE IF EXISTS `productmall`;
CREATE TABLE `productmall` (
  `productUidMall` varchar(32) NOT NULL,
  `productImgMall` varchar(255) DEFAULT NULL,
  `productEncapsulationMall` varchar(255) DEFAULT NULL,
  `productNameMall` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `productPriceMall` decimal(10,3) DEFAULT NULL,
  `productCountMall` varchar(255) DEFAULT '0' COMMENT '总数',
  `year` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `productDescriptionMall` varchar(255) DEFAULT NULL,
  `supportSeeTheGoodsMall` varchar(255) DEFAULT NULL,
  `supportTackingPicturesMall` varchar(255) DEFAULT NULL,
  `supportLockGoodsMall` varchar(255) DEFAULT NULL,
  `productOriginalPriceMall` varchar(255) DEFAULT NULL,
  `productPurchaseLimitMall` varchar(255) DEFAULT NULL,
  `purchaseChannelMall` varchar(255) DEFAULT NULL,
  `productNumMall` varchar(8) DEFAULT NULL,
  `purchasePriceMall` varchar(255) DEFAULT NULL,
  `customerServiceQQMall` varchar(64) DEFAULT NULL,
  `customerServiceQQ1Mall` varchar(64) DEFAULT NULL,
  `customerServiceQQ2Mall` varchar(64) DEFAULT NULL,
  `customerServiceTelMall` varchar(64) DEFAULT NULL,
  `customerServiceTel1Mall` varchar(64) DEFAULT '0',
  `customerServiceWechatMall` varchar(64) DEFAULT NULL,
  `customerServiceWechat1Mall` varchar(64) DEFAULT NULL,
  `customerServiceWechat2Mall` varchar(64) DEFAULT NULL,
  `descriptionMall` varchar(255) DEFAULT NULL,
  `descriptionMall1` varchar(255) DEFAULT NULL,
  `descriptionMall2` varchar(255) DEFAULT NULL,
  `descriptionMall3` varchar(255) DEFAULT NULL,
  `descriptionMall4` varchar(255) DEFAULT NULL,
  `relatedProduct` varchar(255) DEFAULT NULL,
  `relatedProduct1` varchar(255) DEFAULT NULL,
  `relatedProduct2` varchar(255) DEFAULT NULL,
  `relatedProduct3` varchar(255) DEFAULT NULL,
  `relatedProduct4` varchar(255) DEFAULT NULL,
  `relatedProduct5` varchar(255) DEFAULT NULL,
  `relatedProduct6` varchar(255) DEFAULT NULL,
  `relatedProduct7` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productUidMall`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for quanzicomments
-- ----------------------------
DROP TABLE IF EXISTS `quanzicomments`;
CREATE TABLE `quanzicomments` (
  `commentsUid` varchar(32) NOT NULL,
  `commentsId` int(11) NOT NULL AUTO_INCREMENT,
  `userUid` varchar(32) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `unlikeCount` int(11) DEFAULT '0',
  `likeCount` int(11) DEFAULT '0',
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `topicType` varchar(32) DEFAULT NULL,
  `parentUid` varchar(32) DEFAULT NULL,
  `delFlag` tinyint(4) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `path` varchar(10000) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `postkey` varchar(64) DEFAULT NULL,
  `activity` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`commentsUid`),
  UNIQUE KEY `commentsId` (`commentsId`) USING BTREE COMMENT 'commentsId是id自增长,不可少'
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `RecruitmentUUID` varchar(32) NOT NULL,
  `SupplierPrefile` longtext,
  `Demand` varchar(256) DEFAULT NULL,
  `Sex` tinyint(4) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `Age` int(1) DEFAULT NULL,
  `SkillsRequirement` varchar(256) DEFAULT NULL,
  `Contact` varchar(5) DEFAULT NULL,
  `PublishTime` datetime DEFAULT NULL,
  `SupplierUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RecruitmentUUID`),
  KEY `FK_recruitment_supplier` (`SupplierUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for search
-- ----------------------------
DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `searchUUID` char(32) NOT NULL,
  `content` varchar(256) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `IP` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`searchUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `SupplierUUID` varchar(32) NOT NULL,
  `SupplierName` varchar(32) DEFAULT NULL,
  `SupplierPosition` varchar(64) DEFAULT NULL,
  `RepoPosition` varchar(64) DEFAULT NULL,
  `ValidityPeriod` varchar(64) DEFAULT NULL,
  `SupplierPrefile` longtext,
  `Telphone` varchar(32) DEFAULT NULL,
  `Telphone1` varchar(32) DEFAULT NULL,
  `Telphone2` varchar(32) DEFAULT NULL,
  `Telphone3` varchar(32) DEFAULT NULL,
  `Telphone4` varchar(32) DEFAULT NULL,
  `Cellphone` varchar(32) DEFAULT NULL,
  `Fax` varchar(32) DEFAULT NULL,
  `Email` varchar(32) DEFAULT NULL,
  `BrandOperation` varchar(256) DEFAULT NULL,
  `SupplierPhotos` varchar(2000) DEFAULT NULL,
  `Qualification` varchar(2000) DEFAULT NULL,
  `Evaluate` varchar(128) DEFAULT NULL,
  `IsCheck` bit(4) DEFAULT NULL,
  `QQ` char(20) DEFAULT NULL,
  `QQ2` char(20) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SupplierUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplieruser
-- ----------------------------
DROP TABLE IF EXISTS `supplieruser`;
CREATE TABLE `supplieruser` (
  `SupplierUserUUID` varchar(32) NOT NULL,
  `SupplierName` varchar(32) DEFAULT NULL,
  `IPAddress` varchar(16) DEFAULT NULL,
  `Passwd` varchar(16) DEFAULT NULL,
  `Cellphone` varchar(16) DEFAULT NULL,
  `Email` varchar(32) DEFAULT NULL,
  `RegTime` datetime DEFAULT NULL,
  `Sex` tinyint(4) DEFAULT NULL,
  `LastLoginTime` datetime DEFAULT NULL,
  `RegIP` varchar(16) DEFAULT NULL,
  `QQ` char(16) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `BussinessLicence` varchar(128) DEFAULT NULL,
  `Credit` float DEFAULT NULL,
  `SupplierUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`SupplierUserUUID`),
  KEY `FK_supplieruser_supplier` (`SupplierUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userUid` varchar(32) NOT NULL,
  `userIcon` varchar(255) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `regTime` datetime DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL,
  `lastIp` varchar(64) DEFAULT NULL,
  `regIp` varchar(64) DEFAULT NULL,
  `qq` char(20) DEFAULT NULL,
  `qqMail` varchar(64) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `grade` int(11) DEFAULT '1',
  `prompt` int(11) DEFAULT '0',
  `supplieruid` varchar(32) DEFAULT NULL,
  `excellent` int(11) DEFAULT '0',
  `good` int(11) DEFAULT '0',
  `average` int(11) DEFAULT '0',
  `authority` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `alipay` varchar(32) DEFAULT NULL,
  `countsearch` int(11) DEFAULT '0',
  `realname` varchar(32) DEFAULT NULL,
  `realtelphone` varchar(32) DEFAULT NULL,
  `realaddress` varchar(512) DEFAULT NULL,
  `expressaddress` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`userUid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='activity　表示此用户是否可用\r\ncount表示用户登录次数';

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `UserUUID` varchar(32) NOT NULL,
  `UserName` varchar(32) DEFAULT NULL,
  `Passwd` varchar(16) DEFAULT NULL,
  `Telphone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`UserUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
