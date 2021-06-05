/*
 此SQL文件用于记录B2B2C模式开发过程中数据库变更
*/

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