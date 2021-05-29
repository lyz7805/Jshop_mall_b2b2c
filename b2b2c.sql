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
