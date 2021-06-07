/*
 此SQL文件用于记录B2B2C模式开发过程中数据库变更
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jshop_shop
-- ----------------------------
DROP TABLE IF EXISTS `jshop_shop`;
CREATE TABLE `jshop_shop`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `secret_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺名称',
  `subdomain` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '子域名',
  `ctime` bigint(12) UNSIGNED NULL DEFAULT NULL,
  `utime` bigint(12) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1 = 正常 2 = 停用',
  `isdel` bigint(12) UNSIGNED NULL DEFAULT NULL COMMENT '软删除位置  有时间代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_secret_id`(`secret_id`) USING BTREE,
  UNIQUE INDEX `unique_subdomain`(`subdomain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城店铺' ROW_FORMAT = DYNAMIC;

-- 修改部分表，将需要按照B2B2C模式区分的表增加shop_id
ALTER TABLE `jshop_advertisement` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_article` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_article_type` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_bargain` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_bargain_log` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_bargain_record` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_bill_aftersales` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `aftersales_id`;
ALTER TABLE `jshop_bill_aftersales_images` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_bill_aftersales_items` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_bill_delivery` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `delivery_id`;
ALTER TABLE `jshop_bill_delivery_items` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_bill_delivery_order_rel` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_bill_lading` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_bill_payments` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `payment_id`;
ALTER TABLE `jshop_bill_payments_rel` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `payment_id`;
ALTER TABLE `jshop_bill_refund` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `refund_id`;
ALTER TABLE `jshop_bill_reship` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `reship_id`;
ALTER TABLE `jshop_bill_reship_items` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_brand` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_cart` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `user_id`;
ALTER TABLE `jshop_clerk` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_coupon` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;

ALTER TABLE `jshop_form` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_form_item` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_form_submit` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_form_submit_detail` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_goods` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_browsing` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_cat` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_collection` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_comment` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_extend_cat` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_grade` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_images` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `goods_id`;
ALTER TABLE `jshop_goods_params` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_type` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_type_params` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_goods_type_spec` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_goods_type_spec_rel` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_goods_type_spec_value` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_group_goods` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_ietask` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_images` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_images_group` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_invoice` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_invoice_record` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_label` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_manage` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_manage_role` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_manage_role_addons_rel` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_manage_role_operation_rel` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_manage_role_rel` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;

ALTER TABLE `jshop_message` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_message_center` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_notice` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_operation_log` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_order` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `order_id`;
ALTER TABLE `jshop_order_items` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_order_log` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_pages` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_pages_items` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_pintuan_goods` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_pintuan_record` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_pintuan_rule` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_products` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_promotion` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_promotion_condition` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_promotion_record` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;
ALTER TABLE `jshop_promotion_result` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;

ALTER TABLE `jshop_setting` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_ship` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
ALTER TABLE `jshop_store` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;

ALTER TABLE `jshop_user_grade` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' FIRST;
// 用户等级取消店铺等级，改为商城用户等级
// TODO 以后可考虑店铺会员等级之说
ALTER TABLE `jshop_user_grade` DROP COLUMN `shop_id`;
ALTER TABLE `jshop_user_log` ADD COLUMN `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id' AFTER `id`;


-- 更新部分表，将默认shop_id设置为1，此更新主要用于普通商城加入B2B2C模式时适应
UPDATE `jshop_advertisement` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_article` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_article_type` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_bargain` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bargain_log` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bargain_record` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_bill_aftersales` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_aftersales_images` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_aftersales_items` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_delivery` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_delivery_items` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_delivery_order_rel` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_lading` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_payments` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_payments_rel` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_refund` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_reship` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_bill_reship_items` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_brand` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_cart` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_clerk` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_coupon` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_form` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_form_item` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_form_submit` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_form_submit_detail` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_goods` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_browsing` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_cat` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_collection` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_comment` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_extend_cat` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_grade` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_images` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_params` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_type` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_type_params` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_type_spec` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_type_spec_rel` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_goods_type_spec_value` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_group_goods` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_ietask` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_images` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_images_group` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_invoice` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_invoice_record` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_label` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_manage` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_manage_role` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_manage_role_addons_rel` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_manage_role_operation_rel` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_manage_role_rel` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_message` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_message_center` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_notice` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_operation_log` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_order` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_order_items` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_order_log` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_pages` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_pages_items` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_pintuan_goods` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_pintuan_record` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_pintuan_rule` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_products` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_promotion` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_promotion_condition` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_promotion_record` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_promotion_result` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_setting` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_ship` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_store` SET `shop_id` = 1 WHERE `shop_id` = 0;

UPDATE `jshop_user_grade` SET `shop_id` = 1 WHERE `shop_id` = 0;
UPDATE `jshop_user_log` SET `shop_id` = 1 WHERE `shop_id` = 0;

-- 创建mange_log
CREATE TABLE `jshop_manage_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shop_id` int(10) NOT NULL COMMENT '商铺ID 关联shop.id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `state` tinyint(1) DEFAULT NULL COMMENT '登录 1  退出2,3注册',
  `ctime` bigint(12) unsigned DEFAULT NULL COMMENT '时间',
  `params` varchar(200) DEFAULT '' COMMENT '参数',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='管理员登录日志';

-- 更新操作权限
UPDATE jshop_operation SET code = 'managelog' WHERE code = 'userlog' AND type = 'a';


-- ----------------------------
-- Table structure for jshop_admin
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin`;
CREATE TABLE `jshop_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码 md5(md5()+创建时间)',
  `mobile` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `ctime` bigint(12) UNSIGNED NULL DEFAULT NULL,
  `utime` bigint(12) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1 = 正常 2 = 停用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台管理员表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_message`;
CREATE TABLE `jshop_admin_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息编码',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `ctime` bigint(12) UNSIGNED NOT NULL COMMENT '创建时间',
  `utime` bigint(12) UNSIGNED NOT NULL COMMENT '查看时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台站内信' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_message_center
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_message_center`;
CREATE TABLE `jshop_admin_message_center`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `message` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1 启用  2禁用 站内消息',
  `wx_tpl_message` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1 启用  2禁用 微信模板消息',
  `overall` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1 启用  2禁用 总开关',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台消息中心表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_operation
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_operation`;
CREATE TABLE `jshop_admin_operation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作编码',
  `type` enum('m','c','a') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'a' COMMENT '类型',
  `parent_menu_id` int(10) UNSIGNED NOT NULL COMMENT '菜单id',
  `perm_type` int(1) UNSIGNED NOT NULL DEFAULT 3 COMMENT '权限许可类型，如果为1就是主体权限，， 如果为2就是半主体权限，在左侧菜单不显示，但是在权限菜单上有体现，如果为3就是关联权限',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 100 COMMENT '操作排序 越小越靠前',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `parent_menu_id`(`parent_menu_id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 607 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_operation_log`;
CREATE TABLE `jshop_admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '管理员ID',
  `controller` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的控制器名',
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法名',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作数据序列号存储',
  `ip` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP',
  `ctime` bigint(12) UNSIGNED NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台后台操作记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_role`;
CREATE TABLE `jshop_admin_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `utime` bigint(12) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台总后台角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_role_addons_rel
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_role_addons_rel`;
CREATE TABLE `jshop_admin_role_addons_rel`  (
  `admin_role_id` int(10) NOT NULL,
  `menu_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '插件里的菜单的id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台角色操作权限关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_role_operation_rel
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_role_operation_rel`;
CREATE TABLE `jshop_admin_role_operation_rel`  (
  `admin_role_id` int(10) NOT NULL,
  `operation_id` int(10) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台角色操作权限关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_role_rel`;
CREATE TABLE `jshop_admin_role_rel`  (
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT '管理员ID 关联manage.id',
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID 关联role.id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台管理员和角色关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for jshop_admin_token
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_token`;
CREATE TABLE `jshop_admin_token`  (
  `token` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `platform` smallint(2) NOT NULL DEFAULT 1 COMMENT '平台类型，1就是默认，2就是微信小程序',
  `ctime` bigint(12) UNSIGNED NOT NULL,
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员token记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jshop_admin_user_log
-- ----------------------------
DROP TABLE IF EXISTS `jshop_admin_user_log`;
CREATE TABLE `jshop_admin_user_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '登录 1  退出2,3注册',
  `ctime` bigint(12) UNSIGNED NULL DEFAULT NULL COMMENT '时间',
  `params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '类型，1会员，2管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员用户登录日志' ROW_FORMAT = COMPACT;


-- ----------------------------
-- Records of jshop_admin_operation
-- ----------------------------
INSERT INTO `jshop_admin_operation` VALUES (2, 1, '管理后台', 'admin', 'm', 1, 1, 200);
INSERT INTO `jshop_admin_operation` VALUES (238, 2, '会员', 'User', 'c', 2, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (239, 238, '会员列表', 'index', 'a', 238, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (240, 238, '商品评价', 'comment', 'a', 305, 1, 101);
INSERT INTO `jshop_admin_operation` VALUES (242, 238, '积分记录查询', 'pointlog', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (243, 238, '积分编辑', 'editpoint', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (244, 2, '设置', 'Setting', 'c', 2, 1, 200);
INSERT INTO `jshop_admin_operation` VALUES (245, 244, '平台设置', 'index', 'a', 244, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (246, 2, '支付方式', 'Payments', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (247, 246, '支付配置', 'index', 'a', 244, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (249, 246, '支付方式修改', 'edit', 'a', 247, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (251, 246, '支付方式启/禁用', 'changestatus', 'a', 249, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (252, 2, '文章分类', 'ArticleType', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (253, 252, '文章栏目', 'index', 'a', 258, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (254, 252, '文章分类添加', 'add', 'a', 253, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (255, 252, '文章分类修改', 'edit', 'a', 253, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (256, 252, '文章分类删除', 'del', 'a', 253, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (257, 252, '文章添加子分类', 'addson', 'a', 253, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (258, 2, '文章管理', 'Article', 'c', 266, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (259, 258, '文章列表', 'index', 'a', 258, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (260, 258, '文章添加', 'add', 'a', 259, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (261, 258, '文章修改', 'edit', 'a', 259, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (262, 258, '文章删除', 'del', 'a', 259, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (263, 2, '优惠券管理', 'Coupon', 'c', 2, 3, 140);
INSERT INTO `jshop_admin_operation` VALUES (264, 263, '优惠券领取列表', 'index', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (265, 263, '优惠券删除', 'del', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (266, 2, '站点', 'Notice', 'c', 2, 1, 130);
INSERT INTO `jshop_admin_operation` VALUES (267, 266, '公告列表', 'index', 'a', 266, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (268, 266, '公告添加', 'add', 'a', 267, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (269, 266, '公告修改', 'edit', 'a', 267, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (270, 266, '公告删除', 'del', 'a', 267, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (271, 2, '广告位管理', 'CarouselSeat', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (272, 271, '广告位列表', 'index', 'a', 277, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (273, 271, '广告位添加', 'add', 'a', 272, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (274, 271, '广告位修改', 'edit', 'a', 272, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (275, 271, '广告位删除', 'del', 'a', 272, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (277, 2, '广告管理', 'Carousel', 'c', 266, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (278, 277, '广告列表', 'index', 'a', 277, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (279, 277, '广告添加', 'add', 'a', 278, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (280, 277, '广告修改', 'edit', 'a', 278, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (281, 277, '广告删除', 'del', 'a', 278, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (282, 277, '获取商品', 'getgoods', 'a', 278, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (283, 277, '获取文章', 'getarticle', 'a', 278, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (284, 277, '获取商品名称', 'goodsinfo', 'a', 278, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (285, 277, '获取文章名称', 'articleinfo', 'a', 278, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (286, 2, '品牌管理', 'Brand', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (287, 286, '商品品牌', 'index', 'a', 305, 1, 60);
INSERT INTO `jshop_admin_operation` VALUES (288, 286, '品牌添加', 'add', 'a', 287, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (289, 286, '品牌修改', 'edit', 'a', 287, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (290, 286, '品牌删除', 'del', 'a', 287, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (291, 2, '商品分类', 'Categories', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (292, 291, '商品分类', 'index', 'a', 305, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (296, 2, '订单', 'Order', 'c', 2, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (297, 296, '订单列表', 'index', 'a', 296, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (298, 296, '查看订单详情', 'view', 'a', 297, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (299, 296, '编辑订单', 'edit', 'a', 297, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (300, 296, '订单发货', 'ship', 'a', 297, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (301, 296, '取消订单', 'cancel', 'a', 299, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (302, 296, '完成订单', 'complete', 'a', 299, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (303, 296, '删除订单', 'del', 'a', 297, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (304, 296, '物流查询', 'logistics', 'a', 297, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (305, 2, '商品', 'Goods', 'c', 2, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (306, 305, '商品管理', 'index', 'a', 305, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (307, 305, '添加商品', 'add', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (308, 305, '保存商品', 'doAdd', 'a', 307, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (309, 305, '商品评价列表', 'commentlist', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (310, 305, '商品评价详情', 'getcommentinfo', 'a', 309, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (311, 305, '商家回复', 'sellercontent', 'a', 309, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (312, 305, '前台展示状态', 'setdisplay', 'a', 164, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (313, 305, '获取子分类', 'getcat', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (314, 305, '获取规格信息', 'getspec', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (315, 305, '生成多规格', 'getspechtml', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (316, 305, '编辑商品', 'edit', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (317, 305, '保存编辑商品信息', 'doedit', 'a', 316, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (318, 305, '批量上下架', 'batchmarketable', 'a', 316, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (319, 305, '批量删除', 'batchdel', 'a', 321, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (320, 305, '商品高级筛选', 'goodssearch', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (321, 305, '删除商品', 'del', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (322, 305, '设置热门或推荐', 'changestate', 'a', 316, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (323, 2, '商品类型管理', 'GoodsType', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (324, 323, '商品类型', 'index', 'a', 305, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (325, 323, '添加类型', 'add', 'a', 324, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (326, 323, '关联属性', 'addrel', 'a', 324, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (327, 323, '编辑属性', 'edit', 'a', 324, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (328, 323, '删除属性', 'del', 'a', 324, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (329, 323, '关联参数', 'addparams', 'a', 324, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (330, 2, '商品属性', 'GoodsTypeSpec', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (331, 330, '商品规格', 'index', 'a', 305, 1, 40);
INSERT INTO `jshop_admin_operation` VALUES (332, 330, '添加属性', 'add', 'a', 331, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (333, 330, '编辑属性', 'edit', 'a', 331, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (334, 330, '删除属性', 'del', 'a', 331, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (335, 2, '配送方式', 'Ship', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (336, 335, '运费模板', 'index', 'a', 296, 1, 60);
INSERT INTO `jshop_admin_operation` VALUES (337, 335, '添加配送方式', 'add', 'a', 336, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (338, 335, '编辑配送方式', 'edit', 'a', 336, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (339, 335, '删除配送方式', 'del', 'a', 336, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (340, 335, '选择地区', 'choosearea', 'a', 336, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (343, 2, '售后单管理', 'BillAftersales', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (344, 343, '售后申请', 'index', 'a', 296, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (345, 343, '售后单审核', 'audit', 'a', 344, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (346, 343, '售后单查看', 'view', 'a', 344, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (347, 2, '退货单管理', 'BillReship', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (348, 347, '退货单', 'index', 'a', 296, 1, 50);
INSERT INTO `jshop_admin_operation` VALUES (349, 347, '退货单查看', 'view', 'a', 348, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (350, 347, '退货单确认收货', 'confirmreship', 'a', 348, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (351, 2, '退款单管理', 'BillRefund', 'c', 2, 3, 150);
INSERT INTO `jshop_admin_operation` VALUES (352, 351, '退款单', 'index', 'a', 399, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (353, 351, '退款单查看', 'view', 'a', 352, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (354, 351, '操作退款', 'refund', 'a', 352, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (355, 351, '再次退款', 'reaudit', 'a', 354, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (356, 2, '营销', 'Promotion', 'c', 2, 1, 40);
INSERT INTO `jshop_admin_operation` VALUES (357, 356, '促销管理', 'index', 'a', 356, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (358, 356, '添加促销', 'add', 'a', 357, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (359, 356, '促销编辑', 'edit', 'a', 357, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (360, 356, '促销删除', 'del', 'a', 357, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (361, 356, '优惠券', 'coupon', 'a', 356, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (362, 356, '添加优惠券规则', 'couponadd', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (363, 356, '优惠券规则编辑', 'couponedit', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (364, 356, '优惠券规则删除', 'coupondel', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (365, 2, '门店管理', 'Store', 'c', 2, 3, 220);
INSERT INTO `jshop_admin_operation` VALUES (366, 365, '门店管理', 'index', 'a', 244, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (367, 365, '门店添加', 'add', 'a', 366, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (368, 365, '门店修改', 'edit', 'a', 366, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (369, 365, '门店删除', 'del', 'a', 366, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (370, 365, '门店地图展现', 'showmap', 'a', 366, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (390, 2, '图片列表', 'images', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (391, 390, '图片管理', 'index', 'a', 244, 1, 70);
INSERT INTO `jshop_admin_operation` VALUES (392, 2, '导入导出管理', 'ietask', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (393, 392, '导入导出', 'index', 'a', 244, 1, 60);
INSERT INTO `jshop_admin_operation` VALUES (394, 392, '导出', 'export', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (395, 392, '导入', 'import', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (396, 392, '下载导入模板', 'importtemplete', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (397, 392, '下载文件', 'down', 'a', 393, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (398, 392, '执行下载文件', 'dodown', 'a', 397, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (399, 2, '财务', 'BillPayments', 'c', 2, 1, 50);
INSERT INTO `jshop_admin_operation` VALUES (400, 399, '支付单', 'index', 'a', 399, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (401, 399, '后台支付', 'pay', 'a', 400, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (402, 399, '后台支付实际操作', 'topay', 'a', 401, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (403, 399, '支付单查看', 'index', 'a', 400, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (404, 2, '发货单管理', 'BillDelivery', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (405, 404, '发货单', 'index', 'a', 296, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (406, 404, '发货单详情', 'view', 'a', 405, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (407, 404, '发货单明细', 'items', 'a', 405, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (408, 2, '消息中心', 'MessageCenter', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (409, 408, '消息提醒', 'index', 'a', 244, 1, 40);
INSERT INTO `jshop_admin_operation` VALUES (410, 2, '角色管理', 'Role', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (411, 410, '平台角色', 'index', 'a', 416, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (412, 410, '角色添加', 'add', 'a', 411, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (413, 410, '角色删除', 'del', 'a', 411, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (414, 410, '编辑权限', 'getoperation', 'a', 411, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (415, 410, '角色保存权限', 'saveperm', 'a', 411, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (416, 2, '账号管理', 'Administrator', 'c', 244, 1, 90);
INSERT INTO `jshop_admin_operation` VALUES (417, 416, '平台管理员', 'index', 'a', 416, 1, 200);
INSERT INTO `jshop_admin_operation` VALUES (418, 416, '管理员添加', 'add', 'a', 417, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (419, 416, '管理员修改', 'edit', 'a', 417, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (420, 416, '管理员删除', 'del', 'a', 417, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (421, 2, '商品参数', 'GoodsParams', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (422, 421, '商品参数', 'index', 'a', 305, 1, 50);
INSERT INTO `jshop_admin_operation` VALUES (423, 421, '添加参数', 'add', 'a', 422, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (424, 421, '编辑参数', 'edit', 'a', 422, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (425, 421, '删除参数', 'del', 'a', 422, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (426, 2, '标签管理', 'Label', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (427, 426, '设置标签', 'setlabel', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (428, 426, '设置标签', 'dosetlabel', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (429, 426, '删除标签', 'dellabel', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (430, 426, '删除标签', 'dodellabel', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (431, 2, '提现管理', 'Balance', 'c', 399, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (432, 431, '资金明细', 'index', 'a', 399, 1, 40);
INSERT INTO `jshop_admin_operation` VALUES (434, 2, '节点控制器', 'Operation', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (435, 434, '后台菜单', 'index', 'a', 266, 1, 150);
INSERT INTO `jshop_admin_operation` VALUES (436, 434, '节点删除', 'del', 'a', 435, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (437, 434, '节点编辑', 'add', 'a', 435, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (438, 2, '消息控制器', 'Message', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (439, 438, '消息管理', 'index', 'a', 239, 3, 300);
INSERT INTO `jshop_admin_operation` VALUES (440, 438, '消息删除', 'del', 'a', 439, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (441, 2, '短信控制器', 'Sms', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (442, 441, '短信管理', 'index', 'a', 244, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (443, 441, '短信删除', 'del', 'a', 442, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (460, 431, '提现申请', 'tocash', 'a', 431, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (461, 431, '提现审核', 'tocashexamine', 'a', 460, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (462, 2, '钩子列表', 'Hooks', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (463, 462, '钩子列表', 'index', 'a', 464, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (464, 2, '开发设置', 'Addons', 'c', 244, 1, 80);
INSERT INTO `jshop_admin_operation` VALUES (465, 464, '插件列表', 'index', 'a', 464, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (466, 2, '基础数据管理', 'Area', 'c', 244, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (467, 466, '地区管理', 'index', 'a', 244, 1, 50);
INSERT INTO `jshop_admin_operation` VALUES (468, 466, '添加地区', 'add', 'a', 467, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (469, 466, '编辑地区', 'edit', 'a', 467, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (470, 466, '删除地区', 'del', 'a', 467, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (471, 462, '添加钩子', 'add', 'a', 463, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (472, 462, '编辑钩子', 'edit', 'a', 463, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (473, 462, '删除钩子', 'del', 'a', 463, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (474, 464, '安装插件', 'install', 'a', 465, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (475, 464, '卸载插件', 'uninstall', 'a', 465, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (476, 464, '插件配置', 'setting', 'a', 465, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (477, 464, '保存配置', 'dosetting', 'a', 476, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (478, 464, '插件启用/停用', 'changestatus', 'a', 465, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (479, 2, '微信公众号', 'Wechat', 'c', 266, 1, 60);
INSERT INTO `jshop_admin_operation` VALUES (480, 479, '小程序配置', 'edit', 'a', 604, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (481, 479, '模板列表', 'template', 'a', 479, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (482, 479, '保存配置', 'doEdit', 'a', 480, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (483, 479, '公众号配置', 'official', 'a', 479, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (484, 365, '店员列表', 'clerklist', 'a', 366, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (485, 365, '添加店员', 'addclerk', 'a', 366, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (486, 365, '删除店员', 'delclerk', 'a', 366, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (487, 2, '提货单列表', 'BillLading', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (488, 487, '提货单', 'index', 'a', 296, 1, 40);
INSERT INTO `jshop_admin_operation` VALUES (489, 487, '提货单详情', 'info', 'a', 488, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (490, 487, '删除提货单', 'dellading', 'a', 488, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (491, 356, '限时秒杀', 'group', 'a', 356, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (492, 356, '添加团购', 'groupadd', 'a', 491, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (493, 356, '编辑团购', 'groupedit', 'a', 491, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (494, 356, '删除团购', 'groupdel', 'a', 491, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (495, 2, '物流公司', 'Logistics', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (496, 495, '物流公司', 'index', 'a', 296, 1, 70);
INSERT INTO `jshop_admin_operation` VALUES (497, 495, '添加', 'add', 'a', 496, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (498, 495, '编辑', 'edit', 'a', 496, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (499, 495, '删除', 'del', 'a', 496, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (500, 277, '获取文章分类', 'getarticletype', 'a', 278, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (501, 277, '获取文章分类名称', 'articletypeinfo', 'a', 278, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (502, 466, '地区列表', 'getlist', 'a', 467, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (503, 487, '提货单核销', 'write', 'a', 488, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (504, 286, '获取所有品牌', 'getAll', 'a', 287, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (505, 291, '全部分类', 'getAll', 'a', 292, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (506, 305, '更新排序', 'updatesort', 'a', 316, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (507, 421, '弹窗参数', 'getlist', 'a', 422, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (508, 323, '获取所有', 'getAll', 'a', 324, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (509, 330, '弹窗属性列表', 'getlist', 'a', 331, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (510, 408, '消息编辑', 'edit', 'a', 409, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (511, 2, '操作日志', 'OperationLog', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (512, 511, '操作日志', 'index', 'a', 244, 1, 110);
INSERT INTO `jshop_admin_operation` VALUES (517, 479, '自定义菜单', 'officialmenu', 'a', 479, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (518, 479, '公众号菜单-编辑', 'officialmenu', 'a', 517, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (519, 479, '公众号菜单-编辑保存', 'doeditmenu', 'a', 517, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (520, 479, '公众号菜单-删除', 'deletemenu', 'a', 517, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (521, 479, '公众号菜单-同步', 'updatemenu', 'a', 517, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (522, 479, '消息回复', 'message', 'a', 479, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (523, 479, '微信消息-添加', 'addMessage', 'a', 522, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (524, 479, '微信消息-删除', 'delMessage', 'a', 522, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (525, 479, '微信消息-编辑', 'editMessage', 'a', 522, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (526, 479, '微信消息-互动', 'autoreply', 'a', 522, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (527, 479, '编辑图文', 'editmediamessage', 'a', 522, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (528, 479, '保存图文消息', 'doeditmediamessage', 'a', 522, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (529, 238, '邀请人修改', 'editinvite', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (530, 238, '会员编辑', 'edituser', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (531, 238, '余额修改', 'editmoney', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (532, 238, '余额明细', 'moneylog', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (533, 238, '添加会员', 'adduser', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (534, 335, '选择地区', 'getarea', 'a', 336, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (535, 2, '统计', 'Report', 'c', 2, 1, 70);
INSERT INTO `jshop_admin_operation` VALUES (536, 535, '订单统计', 'order', 'a', 535, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (537, 535, '收款报表', 'payments', 'a', 399, 1, 60);
INSERT INTO `jshop_admin_operation` VALUES (538, 535, '商品统计', 'goods', 'a', 535, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (539, 390, '删除图片', 'del', 'a', 391, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (540, 392, '删除任务', 'del', 'a', 393, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (541, 2, '万能表单', 'Form', 'c', 266, 1, 40);
INSERT INTO `jshop_admin_operation` VALUES (542, 541, '表单列表', 'index', 'a', 541, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (543, 541, '添加表单', 'add', 'a', 542, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (544, 541, '编辑表单', 'edit', 'a', 542, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (545, 541, '删除表单', 'del', 'a', 542, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (546, 541, '小程序码', 'generate', 'a', 542, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (547, 541, '提交列表', 'formsubmit', 'a', 541, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (548, 541, '表单报表', 'report', 'a', 542, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (549, 541, '表单统计', 'statistics', 'a', 542, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (550, 541, '删除提交', 'delsubmit', 'a', 547, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (551, 541, '提交明细', 'formsubmitdetail', 'a', 547, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (552, 541, '反馈', 'editformsubmit', 'a', 547, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (553, 238, '会员等级', 'grade', 'a', 238, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (554, 238, '添加&修改', 'gradeadd', 'a', 553, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (555, 238, '删除', 'gradedel', 'a', 553, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (556, 296, '订单打印', 'print_tpl', 'a', 297, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (557, 296, '打印选择快递', 'print_form', 'a', 297, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (558, 535, '收藏统计', 'goodscollection', 'a', 535, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (559, 2, '页面模块', 'Pages', 'c', 2, 3, 200);
INSERT INTO `jshop_admin_operation` VALUES (560, 559, '页面管理', 'index', 'a', 266, 1, 90);
INSERT INTO `jshop_admin_operation` VALUES (561, 559, '保存配置', 'savecustom', 'a', 560, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (562, 559, '页面编辑', 'custom', 'a', 560, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (563, 466, '生成缓存', 'generatecache', 'a', 467, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (564, 263, '优惠券启用禁用', 'changestate', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (565, 356, '优惠券启用禁用', 'changestate', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (566, 305, '批量修改价格', 'batchmodifyprice', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (567, 305, '保存批量修改价格', 'dobatchmodifyprice', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (568, 305, '批量修改库存', 'batchmodifystock', 'a', 306, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (569, 305, '保存批量修改库存', 'dobatchmodifystock', 'a', 306, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (570, 559, '添加页面', 'add', 'a', 560, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (571, 559, '删除页面', 'del', 'a', 560, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (572, 2, '拼团管理', 'Pintuan', 'c', 356, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (573, 572, '拼团列表', 'index', 'a', 572, 1, 10);
INSERT INTO `jshop_admin_operation` VALUES (574, 572, '删除拼团', 'del', 'a', 573, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (575, 572, '添加编辑拼团', 'edit', 'a', 573, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (576, 572, '更新排序', 'updatesort', 'a', 573, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (577, 572, '拼团禁用启用', 'changestate', 'a', 573, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (578, 572, '拼团选择商品', 'getgoods', 'a', 573, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (579, 238, '删除会员', 'deluser', 'a', 239, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (580, 291, '是否显示', 'changestate', 'a', 292, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (581, 296, '保存备注', 'savemark', 'a', 297, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (582, 399, '查看支付单详情', 'view', 'a', 400, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (583, 464, '插件刷新', 'refresh', 'a', 465, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (584, 479, '编辑菜单', 'editmenu', 'a', 517, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (585, 572, '拼团记录', 'record', 'a', 572, 1, 20);
INSERT INTO `jshop_admin_operation` VALUES (586, 2, '发票模块', 'Invoice', 'c', 2, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (587, 586, '发票申请', 'index', 'a', 399, 1, 50);
INSERT INTO `jshop_admin_operation` VALUES (588, 263, '变更领取者', 'binduser', 'a', 361, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (589, 238, '第三方账号', 'userwx', 'a', 238, 1, 30);
INSERT INTO `jshop_admin_operation` VALUES (590, 238, '第三方账号删除', 'userwxdel', 'a', 238, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (591, 296, '订单编辑-订单明细显示', 'edititemslist', 'a', 299, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (592, 296, '订单编辑-订单明细添加', 'edititemsadd', 'a', 299, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (593, 296, '订单编辑-订单明细删除', 'edititemsdel', 'a', 299, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (594, 296, '订单编辑-订单明细编辑', 'edititemsedit', 'a', 299, 3, 100);
INSERT INTO `jshop_admin_operation` VALUES (595, 2, '砍价管理', 'Bargain', 'c', 356, 1, 100);
INSERT INTO `jshop_admin_operation` VALUES (596, 595, '砍价列表', 'index', 'a', 595, 1, 1);
INSERT INTO `jshop_admin_operation` VALUES (597, 595, '添加编辑砍价', 'edit', 'a', 596, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (598, 595, '删除砍价', 'del', 'a', 596, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (599, 595, '更改排序', 'updatesort', 'a', 596, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (600, 595, '更改状态', 'changestate', 'a', 596, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (601, 595, '参与记录', 'record', 'a', 595, 1, 2);
INSERT INTO `jshop_admin_operation` VALUES (602, 595, '砍价日志', 'recordlog', 'a', 595, 1, 3);
INSERT INTO `jshop_admin_operation` VALUES (603, 305, '商品标签', 'labellist', 'a', 305, 1, 70);
INSERT INTO `jshop_admin_operation` VALUES (604, 479, '微信小程序', 'wechat', 'a', 266, 1, 70);
INSERT INTO `jshop_admin_operation` VALUES (605, 296, '申请售后', 'aftersales', 'a', 297, 2, 100);
INSERT INTO `jshop_admin_operation` VALUES (606, 347, '填写退货单', 'reship', 'a', 348, 2, 100);

-- 区分模块ID
-- TODO 其实operation的设计思路是可以将多个模块，比如manage和admin合在一起的，这个以后可以再探讨
UPDATE `jshop_admin_operation` SET `id` = 5, `name` = '平台管理后台' WHERE `id` = 2;
UPDATE `jshop_admin_operation` SET `parent_id` = 5 WHERE `parent_id` = 2;
UPDATE `jshop_admin_operation` SET `parent_menu_id` = 5 WHERE `parent_menu_id` = 2;

SET FOREIGN_KEY_CHECKS = 1;
