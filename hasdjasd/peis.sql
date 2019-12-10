/*
 Navicat Premium Data Transfer

 Source Server         : fan
 Source Server Type    : MySQL
 Source Server Version : 50548
 Source Host           : localhost:3306
 Source Schema         : peis

 Target Server Type    : MySQL
 Target Server Version : 50548
 File Encoding         : 65001

 Date: 06/12/2019 12:44:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for itemtypes
-- ----------------------------
DROP TABLE IF EXISTS `itemtypes`;
CREATE TABLE `itemtypes`  (
  `typeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类别编号 主键',
  `typeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of itemtypes
-- ----------------------------
INSERT INTO `itemtypes` VALUES (1, '内科检查');
INSERT INTO `itemtypes` VALUES (2, '外科检查');

-- ----------------------------
-- Table structure for peitems
-- ----------------------------
DROP TABLE IF EXISTS `peitems`;
CREATE TABLE `peitems`  (
  `itemId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目编号  主键',
  `itemName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `typeId` bigint(20) NOT NULL COMMENT '项目类别编号  关联主键',
  `necessary` int(5) DEFAULT NULL COMMENT '是否必查',
  `ref` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参考值',
  `price` decimal(20, 2) NOT NULL COMMENT '价格',
  `info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`itemId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of peitems
-- ----------------------------
INSERT INTO `peitems` VALUES (1, '身高', 1, 1, '150~190', 2.12, '电子仪器测量');
INSERT INTO `peitems` VALUES (2, '体重', 1, 1, '50~90', 3.00, '包含脂肪量检查');
INSERT INTO `peitems` VALUES (3, '血液', 1, 1, '600~900', 5.50, '抽血检验');
INSERT INTO `peitems` VALUES (4, 'CT', 2, 1, '无', 10.00, 'X射线拍照');

SET FOREIGN_KEY_CHECKS = 1;
