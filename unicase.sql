/*
 Navicat Premium Data Transfer

 Source Server         : mariaDB_local
 Source Server Type    : MariaDB
 Source Server Version : 100207
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MariaDB
 Target Server Version : 100207
 File Encoding         : 65001

 Date: 22/01/2018 22:05:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for box_table
-- ----------------------------
DROP TABLE IF EXISTS `box_table`;
CREATE TABLE `box_table`  (
  `box_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `box_goods_amount` int(11) DEFAULT NULL,
  `box_goods_price` int(11) DEFAULT NULL,
  `goods_color_num_1` int(11) NOT NULL,
  `goods_color_num_2` int(11) DEFAULT NULL,
  `goods_color_num_3` int(11) DEFAULT NULL,
  `goods_color_num_4` int(11) DEFAULT NULL,
  `goods_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `box_group` int(11) DEFAULT NULL,
  `order_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`box_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for delivery_info_table
-- ----------------------------
DROP TABLE IF EXISTS `delivery_info_table`;
CREATE TABLE `delivery_info_table`  (
  `delivery_idx` int(100) NOT NULL AUTO_INCREMENT COMMENT '베송인덱스',
  `to_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '받는 사람이름',
  `to_addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '받는 사람주소',
  `to_phnum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '받는 사람 휴대폰',
  PRIMARY KEY (`delivery_idx`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for good_details_table
-- ----------------------------
DROP TABLE IF EXISTS `good_details_table`;
CREATE TABLE `good_details_table`  (
  `goods_pk_num` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_amount` int(11) DEFAULT NULL,
  `goods_color_num` int(11) NOT NULL,
  PRIMARY KEY (`goods_pk_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_sort_table
-- ----------------------------
DROP TABLE IF EXISTS `goods_sort_table`;
CREATE TABLE `goods_sort_table`  (
  `goods_code` int(11) NOT NULL,
  `goods_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`goods_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_table
-- ----------------------------
DROP TABLE IF EXISTS `goods_table`;
CREATE TABLE `goods_table`  (
  `goods_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_code` int(11) DEFAULT NULL,
  `goods_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_brand` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_price` int(11) DEFAULT NULL,
  `goods_info` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_points` int(11) DEFAULT NULL,
  `goods_regdate` date NOT NULL,
  PRIMARY KEY (`goods_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_table
-- ----------------------------
DROP TABLE IF EXISTS `member_table`;
CREATE TABLE `member_table`  (
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pw` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_phnum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_grade` int(11) DEFAULT NULL,
  `user_points` int(11) DEFAULT NULL,
  `user_regdate` date NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_table
-- ----------------------------
INSERT INTO `member_table` VALUES ('test', '1234', '배님', '1234', '01066666666', 'zzzz@naver.com', 1, 0, '2018-01-22');

-- ----------------------------
-- Table structure for notice_table
-- ----------------------------
DROP TABLE IF EXISTS `notice_table`;
CREATE TABLE `notice_table`  (
  `notice_num` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `notice_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`notice_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_details_table
-- ----------------------------
DROP TABLE IF EXISTS `order_details_table`;
CREATE TABLE `order_details_table`  (
  `order_num` int(100) NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  `delivery_idx` int(100) NOT NULL COMMENT '배송인덱스',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '아이디',
  `order_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '주문자',
  `order_goods_amount` int(50) NOT NULL COMMENT '주문수량',
  `order_require` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '주문요구사항',
  `order_points` int(50) NOT NULL COMMENT '사용적립금',
  `order_give_points` int(50) NOT NULL COMMENT '지급적립금',
  `order_sum` int(50) NOT NULL COMMENT '주문합계금액',
  `order_state` int(50) NOT NULL COMMENT '주문상태',
  `order_pay_opt` int(50) NOT NULL COMMENT '결제방법',
  `order_pay_res` int(50) NOT NULL COMMENT '결제결과',
  `order_invoice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '송장',
  `order_delivery_opt` int(10) NOT NULL COMMENT '배송방법',
  `order_delivery_rs` int(10) NOT NULL COMMENT '배송결과',
  `order_date` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '주문날짜',
  PRIMARY KEY (`order_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_table
-- ----------------------------
DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table`  (
  `order_idx` int(50) NOT NULL AUTO_INCREMENT,
  `order_real_pricae` int(50) NOT NULL DEFAULT 0,
  `goods_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `order_num` int(100) NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_idx`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qa_table
-- ----------------------------
DROP TABLE IF EXISTS `qa_table`;
CREATE TABLE `qa_table`  (
  `qa_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qa_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qa_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qa_ref_file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qa_res_num` int(11) DEFAULT NULL,
  `qa_regdate` date NOT NULL,
  `qa_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`qa_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for review_table
-- ----------------------------
DROP TABLE IF EXISTS `review_table`;
CREATE TABLE `review_table`  (
  `review_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_goods_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `review_cnt` int(11) DEFAULT NULL,
  `review_star` int(11) DEFAULT NULL,
  `review_buy_opt` int(11) DEFAULT NULL,
  `review_regdate` date NOT NULL,
  `review_goods_num` int(11) NOT NULL,
  PRIMARY KEY (`review_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rqa_table
-- ----------------------------
DROP TABLE IF EXISTS `rqa_table`;
CREATE TABLE `rqa_table`  (
  `rqa_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rqa_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qa_num` int(11) NOT NULL,
  `rqa_regdate` date NOT NULL,
  PRIMARY KEY (`rqa_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
