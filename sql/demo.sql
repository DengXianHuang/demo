/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.23
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 192.168.0.23:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 31/05/2023 15:18:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for filter_url_config
-- ----------------------------
DROP TABLE IF EXISTS `filter_url_config`;
CREATE TABLE `filter_url_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '过滤类型：(1、过滤签名，2、过滤登录，3、过滤权限验证)',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口地址(\"/\"开头，结尾没有”/“，示例：/system/save)',
  `request_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求接口名称',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '启用状态（0 默认启用，1 停用）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `deleted` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0 正常，1 删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可以跳过系统校验的请求地址配置，此表中的地址可跳过一些强制校验' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filter_url_config
-- ----------------------------
INSERT INTO `filter_url_config` VALUES (1, '1', '/demoApp/login', '登录接口', '0', '2023-03-28 13:15:32', '2023-03-28 13:15:34', '0', '该接口跳过【登录验证】');
INSERT INTO `filter_url_config` VALUES (2, '2', '/demoApp/login', '登录接口', '0', '2023-03-28 13:15:32', '2023-03-28 13:15:34', '0', '该接口跳过【签名验证】');
INSERT INTO `filter_url_config` VALUES (3, '1', '/demoApp/captchaImage', '获取验证码接口', '0', '2023-05-03 13:44:22', '2023-05-03 13:44:27', '0', '该接口跳过【登录验证】');
INSERT INTO `filter_url_config` VALUES (4, '2', '/demoApp/captchaImage', '获取验证码接口', '0', '2023-05-03 13:44:22', '2023-05-03 13:44:27', '0', '该接口跳过【签名验证】');
INSERT INTO `filter_url_config` VALUES (5, '1', '/error', '错误', '0', '2023-05-22 14:23:29', '2023-05-22 14:23:32', '0', '错误');
INSERT INTO `filter_url_config` VALUES (6, '2', '/error', '错误', '0', '2023-05-22 14:23:29', '2023-05-22 14:23:32', '0', '错误');
INSERT INTO `filter_url_config` VALUES (7, '1', '/demoApp/logout', '退出登录', '0', '2023-05-23 11:22:12', '2023-05-23 11:22:14', '0', '退出登录');
INSERT INTO `filter_url_config` VALUES (8, '2', '/demoApp/logout', '退出登录', '0', '2023-05-23 11:22:12', '2023-05-23 11:22:14', '0', '退出登录');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_parent_id_dept_name`(`parent_id`, `dept_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '一级部门', 0, '林菁', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 0, '', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '昆明分公司', 1, '', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '胡盛朝', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '曾超', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '曾超', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '曾超', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '曾超', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '曾超', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '工程部', 2, '曾超', '15888888888', 'hangtong@qq.com', '0', '0', 'admin', '2023-04-28 01:11:08', '', NULL);
INSERT INTO `sys_dept` VALUES (111, 102, '0,100,102', '开发部', 1, 'dev', NULL, NULL, '0', '0', '超级管理员', '2023-05-26 10:45:42', '', '2023-05-26 10:45:42');
INSERT INTO `sys_dept` VALUES (114, 100, '0,100', '重庆分公司', 2, NULL, NULL, NULL, '0', '0', '超级管理员', '2023-05-31 14:59:14', '', '2023-05-31 14:59:14');
INSERT INTO `sys_dept` VALUES (115, 114, '0,100,114', '开发部', 1, NULL, NULL, NULL, '0', '0', '超级管理员', '2023-05-31 14:59:27', '', '2023-05-31 14:59:27');
INSERT INTO `sys_dept` VALUES (116, 114, '0,100,114', '工程部', 2, NULL, NULL, NULL, '0', '0', '超级管理员', '2023-05-31 14:59:37', '', '2023-05-31 14:59:37');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dict_type_dict_value`(`dict_type`, `dict_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 'sys_normal_disable', '正常', '0', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-25 09:59:36', '超级管理员', '2023-05-25 13:56:23', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 'sys_normal_disable', '停用', '1', 0, NULL, 'warning', 'N', '0', '超级管理员', '2023-05-25 10:19:20', '超级管理员', '2023-05-25 13:55:39', NULL);
INSERT INTO `sys_dict_data` VALUES (3, 'sys_user_type', '系统用户', '0', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-25 10:29:26', '超级管理员', '2023-05-26 14:03:55', NULL);
INSERT INTO `sys_dict_data` VALUES (4, 'sys_user_type', 'APP用户', '1', 0, NULL, 'primary', 'N', '0', '超级管理员', '2023-05-25 10:29:37', '超级管理员', '2023-05-26 14:03:38', NULL);
INSERT INTO `sys_dict_data` VALUES (5, 'sys_user_sex', '男', '1', 0, NULL, 'primary', 'N', '0', '超级管理员', '2023-05-25 10:31:51', '超级管理员', '2023-05-25 13:31:36', NULL);
INSERT INTO `sys_dict_data` VALUES (6, 'sys_user_sex', '女', '2', 0, NULL, 'primary', 'N', '0', '超级管理员', '2023-05-25 10:31:59', '超级管理员', '2023-05-25 13:56:06', NULL);
INSERT INTO `sys_dict_data` VALUES (7, 'list_class', '默认', 'default', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-25 13:33:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (8, 'list_class', '主要', 'primary', 0, NULL, 'primary', 'N', '0', '超级管理员', '2023-05-25 13:33:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (9, 'list_class', '成功', 'success', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-25 13:33:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (10, 'list_class', '信息', 'info', 0, NULL, 'info', 'N', '0', '超级管理员', '2023-05-25 13:34:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (11, 'list_class', '警告', 'warning', 0, NULL, 'warning', 'N', '0', '超级管理员', '2023-05-25 13:34:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (12, 'list_class', '危险', 'danger', 0, NULL, 'danger', 'N', '0', '超级管理员', '2023-05-25 13:34:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (13, 'sys_show_hide', '显示', '0', 0, NULL, 'primary', 'N', '0', '超级管理员', '2023-05-26 13:23:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (14, 'sys_show_hide', '隐藏', '1', 0, NULL, 'danger', 'N', '0', '超级管理员', '2023-05-26 13:23:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (15, 'menu_type', '目录', 'M', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-26 13:28:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (16, 'menu_type', '菜单', 'C', 0, NULL, 'primary', 'N', '0', '超级管理员', '2023-05-26 13:28:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (17, 'menu_type', '按钮', 'F', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-26 13:29:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (18, 'sys_oper_type', '其他', '0', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:33:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (19, 'sys_oper_type', '新增', '1', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:33:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (20, 'sys_oper_type', '修改', '2', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:33:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (21, 'sys_oper_type', '删除', '3', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:33:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (22, 'sys_oper_type', '授权', '4', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:34:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (23, 'sys_oper_type', '导出', '5', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:34:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (24, 'sys_oper_type', '导入', '6', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:34:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (25, 'sys_oper_type', '强制退出', '7', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-30 17:34:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (26, 'sys_common_status', '正常', '0', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-30 17:36:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (27, 'sys_common_status', '异常', '1', 0, NULL, 'danger', 'N', '0', '超级管理员', '2023-05-30 17:36:28', '超级管理员', '2023-05-30 17:36:37', NULL);
INSERT INTO `sys_dict_data` VALUES (28, 'filter_type', '过滤签名', '1', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-31 10:36:56', '超级管理员', '2023-05-31 10:45:46', NULL);
INSERT INTO `sys_dict_data` VALUES (29, 'filter_type', '过滤登录', '2', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-31 10:37:03', '超级管理员', '2023-05-31 10:45:46', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 'filter_type', '过滤权限验证', '3', 0, NULL, 'default', 'N', '0', '超级管理员', '2023-05-31 10:37:10', '超级管理员', '2023-05-31 10:45:46', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 'enable_status', '启用', '0', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-31 10:37:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 'enable_status', '停用', '1', 0, NULL, 'danger', 'N', '0', '超级管理员', '2023-05-31 10:38:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 'deleted', '正常', '0', 0, NULL, 'success', 'N', '0', '超级管理员', '2023-05-31 10:38:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 'deleted', '删除', '1', 0, NULL, 'danger', 'N', '0', '超级管理员', '2023-05-31 10:38:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (2, 'sys_normal_disable', '正常/停用状态', '0', '超级管理员', '2023-05-25 09:23:57', '', NULL, '0-正常，1-停用');
INSERT INTO `sys_dict_type` VALUES (3, 'sys_user_type', '用户类型', '0', '超级管理员', '2023-05-25 10:29:14', '', NULL, '00-系统用户，11-APP用户');
INSERT INTO `sys_dict_type` VALUES (4, 'sys_user_sex', '性别', '0', '超级管理员', '2023-05-25 10:31:42', '', NULL, '1-男，2-女');
INSERT INTO `sys_dict_type` VALUES (15, 'list_class', '回显样式', '0', '超级管理员', '2023-05-25 13:32:51', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (16, 'sys_show_hide', '显示状态', '0', '超级管理员', '2023-05-26 13:23:16', '', NULL, '0-显示，1-隐藏');
INSERT INTO `sys_dict_type` VALUES (17, 'menu_type', '菜单类型', '0', '超级管理员', '2023-05-26 13:28:04', '', NULL, 'M目录 C菜单 F按钮');
INSERT INTO `sys_dict_type` VALUES (18, 'sys_oper_type', '操作类型', '0', '超级管理员', '2023-05-30 17:33:07', '', NULL, '日志操作类型');
INSERT INTO `sys_dict_type` VALUES (19, 'sys_common_status', '操作状态', '0', '超级管理员', '2023-05-30 17:36:02', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (20, 'filter_type', '过滤类型', '0', '超级管理员', '2023-05-31 10:36:45', '超级管理员', '2023-05-31 10:45:46', NULL);
INSERT INTO `sys_dict_type` VALUES (21, 'enable_status', '启用状态', '0', '超级管理员', '2023-05-31 10:37:39', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (22, 'deleted', '删除标识', '0', '超级管理员', '2023-05-31 10:38:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_logger
-- ----------------------------
DROP TABLE IF EXISTS `sys_logger`;
CREATE TABLE `sys_logger`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作模块',
  `operate_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作类型',
  `clazz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求类名',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `request_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作状态(0-正常，1-异常)',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logger
-- ----------------------------
INSERT INTO `sys_logger` VALUES (12, '日志管理-清空所有日志', '3', 'com.ht.demo.app.controller.monitor.SysLoggerController', 'cleanLog', 'DELETE', '192.168.0.140', '超级管理员', '2023-05-30 18:07:49', 'http://localhost:8088/demoApp/monitor/log/clean', 14, '0', '内网IP', '{}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (13, '用户管理', '2', 'com.ht.demo.app.controller.system.SysUserController', 'updateUserById', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 09:40:28', 'http://localhost:8088/demoApp/updateUserById', 58, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"sysDeptId\":100,\"sysUserId\":1,\"token\":\"B17DB8B38F945460C808EFB0F3D1C1C6\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685440595000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (14, '角色管理', '2', 'com.ht.demo.app.controller.system.SysRoleController', 'updateRole', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 09:40:44', 'http://localhost:8088/demoApp/system/updateRole', 40, '0', '内网IP', '{\"createBy\":\"超级管理员\",\"createTime\":1684891881000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054],\"roleKey\":\"dev\",\"roleName\":\"开发组\",\"roleSort\":3,\"status\":\"0\",\"sysRoleId\":5,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (15, '角色管理', '2', 'com.ht.demo.app.controller.system.SysRoleController', 'updateRole', 'POST', '192.168.0.140', '管理员', '2023-05-31 09:43:57', 'http://localhost:8088/demoApp/system/updateRole', 53, '0', '内网IP', '{\"createBy\":\"超级管理员\",\"createTime\":1684891881000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"menuIds\":[1,104,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,1022,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054],\"roleKey\":\"dev\",\"roleName\":\"开发组\",\"roleSort\":3,\"status\":\"0\",\"sysRoleId\":5,\"updateBy\":\"超级管理员\",\"updateTime\":1685497244000}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (16, '用户管理', '2', 'com.ht.demo.app.controller.system.SysUserController', 'updateUserById', 'POST', '192.168.0.140', '管理员', '2023-05-31 09:53:22', 'http://localhost:8088/demoApp/updateUserById', 26, '0', '内网IP', '{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sex\":\"2\",\"sysDeptId\":102,\"sysRoleId\":1,\"sysUserId\":4,\"token\":\"7269585A79AA8404F0392E376D66D012\",\"updateTime\":1685497228000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685497228000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (17, '用户管理', '2', 'com.ht.demo.app.controller.system.SysUserController', 'updateUserById', 'POST', '192.168.0.140', '管理员', '2023-05-31 09:56:53', 'http://localhost:8088/demoApp/updateUserById', 187555, '0', '内网IP', '{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sex\":\"2\",\"sysDeptId\":102,\"sysRoleId\":1,\"sysUserId\":4,\"token\":\"7269585A79AA8404F0392E376D66D012\",\"updateTime\":1685497228000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685498002000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (18, '用户管理', '2', 'com.ht.demo.app.controller.system.SysUserController', 'updateUserById', 'POST', '192.168.0.140', '管理员', '2023-05-31 09:57:07', 'http://localhost:8088/demoApp/updateUserById', 5567, '0', '内网IP', '{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sex\":\"2\",\"sysDeptId\":102,\"sysRoleId\":1,\"sysUserId\":4,\"token\":\"7269585A79AA8404F0392E376D66D012\",\"updateTime\":1685497228000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"航通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685498002000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (19, '岗位管理', '2', 'com.ht.demo.app.controller.system.SysPostController', 'updatePost', 'PUT', '192.168.0.140', '管理员', '2023-05-31 09:59:06', 'http://localhost:8088/demoApp/system/post/updateById', 31, '0', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1685085151000,\"postCode\":\"HR\",\"postName\":\"人力资源\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"sysPostId\":3,\"updateBy\":\"管理员\",\"updateTime\":1685498346178}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (20, '岗位管理', '2', 'com.ht.demo.app.controller.system.SysPostController', 'updatePost', 'PUT', '192.168.0.140', '管理员', '2023-05-31 09:59:27', 'http://localhost:8088/demoApp/system/post/updateById', 14718, '0', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1685085151000,\"postCode\":\"HR\",\"postName\":\"人力资源\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"sysPostId\":3,\"updateBy\":\"管理员\",\"updateTime\":1685498367447}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (21, '角色管理', '2', 'com.ht.demo.app.controller.system.SysRoleController', 'updateRole', 'POST', '192.168.0.140', '管理员', '2023-05-31 10:17:30', 'http://localhost:8088/demoApp/system/updateRole', 56, '0', '内网IP', '{\"createBy\":\"超级管理员\",\"createTime\":1684891881000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"menuIds\":[1,104,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,1022,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054],\"roleKey\":\"dev\",\"roleName\":\"开发组\",\"roleSort\":3,\"status\":\"0\",\"sysRoleId\":5,\"updateBy\":\"管理员\",\"updateTime\":1685497437000}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (22, '字典管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictType', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:36:45', 'http://localhost:8088/demoApp/system/dictType/save', 12, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500605770,\"dictName\":\"过滤类型\",\"dictType\":\"filter_url\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (23, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:36:56', 'http://localhost:8088/demoApp/system/dictData/save', 139, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500616608,\"dictLabel\":\"过滤签名\",\"dictSort\":0,\"dictType\":\"filter_url\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (24, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:37:03', 'http://localhost:8088/demoApp/system/dictData/save', 5, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500623590,\"dictLabel\":\"过滤登录\",\"dictSort\":0,\"dictType\":\"filter_url\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (25, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:37:10', 'http://localhost:8088/demoApp/system/dictData/save', 5, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500630644,\"dictLabel\":\"过滤权限验证\",\"dictSort\":0,\"dictType\":\"filter_url\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (26, '字典管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictType', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:37:39', 'http://localhost:8088/demoApp/system/dictType/save', 4, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500659683,\"dictName\":\"启用状态\",\"dictType\":\"enable_status\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (27, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:37:52', 'http://localhost:8088/demoApp/system/dictData/save', 6, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500672286,\"dictLabel\":\"启用\",\"dictSort\":0,\"dictType\":\"enable_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"success\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (28, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:38:01', 'http://localhost:8088/demoApp/system/dictData/save', 17, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500681763,\"dictLabel\":\"停用\",\"dictSort\":0,\"dictType\":\"enable_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (29, '字典管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictType', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:38:18', 'http://localhost:8088/demoApp/system/dictType/save', 3, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500698555,\"dictName\":\"删除标识\",\"dictType\":\"deleted\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (30, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:38:29', 'http://localhost:8088/demoApp/system/dictData/save', 5, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500709053,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"deleted\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"success\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (31, '字典数据管理', '1', 'com.ht.demo.app.controller.system.SysDictController', 'saveDictData', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 10:38:37', 'http://localhost:8088/demoApp/system/dictData/save', 3, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500717275,\"dictLabel\":\"删除\",\"dictSort\":0,\"dictType\":\"deleted\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (32, '字典管理', '2', 'com.ht.demo.app.controller.system.SysDictController', 'updateDictType', 'PUT', '192.168.0.140', '超级管理员', '2023-05-31 10:40:45', 'http://localhost:8088/demoApp/system/dictType/update', 6, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500605000,\"dictName\":\"过滤类型\",\"dictType\":\"filter_type\",\"status\":\"0\",\"sysDictTypeId\":20,\"updateBy\":\"超级管理员\",\"updateTime\":1685500845279}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (33, '字典管理', '2', 'com.ht.demo.app.controller.system.SysDictController', 'updateDictType', 'PUT', '192.168.0.140', '超级管理员', '2023-05-31 10:42:34', 'http://localhost:8088/demoApp/system/dictType/update', 72963, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500605000,\"dictName\":\"过滤类型\",\"dictType\":\"filter_type\",\"status\":\"0\",\"sysDictTypeId\":20,\"updateBy\":\"超级管理员\",\"updateTime\":1685500954609}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (34, '字典管理', '2', 'com.ht.demo.app.controller.system.SysDictController', 'updateDictType', 'PUT', '192.168.0.140', '超级管理员', '2023-05-31 10:43:44', 'http://localhost:8088/demoApp/system/dictType/update', 66771, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500605000,\"dictName\":\"过滤类型\",\"dictType\":\"filter_type1\",\"status\":\"0\",\"sysDictTypeId\":20,\"updateBy\":\"超级管理员\",\"updateTime\":1685501024418}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (35, '字典管理', '2', 'com.ht.demo.app.controller.system.SysDictController', 'updateDictType', 'PUT', '192.168.0.140', '超级管理员', '2023-05-31 10:44:05', 'http://localhost:8088/demoApp/system/dictType/update', 5134, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500605000,\"dictName\":\"过滤类型\",\"dictType\":\"filter_rul\",\"status\":\"0\",\"sysDictTypeId\":20,\"updateBy\":\"超级管理员\",\"updateTime\":1685501045287}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (36, '字典管理', '2', 'com.ht.demo.app.controller.system.SysDictController', 'updateDictType', 'PUT', '192.168.0.140', '超级管理员', '2023-05-31 10:45:46', 'http://localhost:8088/demoApp/system/dictType/update', 1936, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"2D3D95A93F2175D1D9B0900DB69B719B\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createBy\":\"超级管理员\",\"createTime\":1685500605000,\"dictName\":\"过滤类型\",\"dictType\":\"filter_type\",\"status\":\"0\",\"sysDictTypeId\":20,\"updateBy\":\"超级管理员\",\"updateTime\":1685501146856}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (37, '菜单管理', '1', 'com.ht.demo.app.controller.system.SysMenuController', 'insertMenu', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 11:19:04', 'http://localhost:8088/demoApp/system/menu/insert', 25, '0', '内网IP', '{\"ancestors\":\"0,1\",\"component\":\"system/filter/index\",\"createBy\":\"超级管理员\",\"createTime\":1685503144607,\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"登录过滤\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":1,\"path\":\"filter\",\"perms\":\"system:filter:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (38, '菜单管理', '3', 'com.ht.demo.app.controller.system.SysMenuController', 'delMenu', 'DELETE', '192.168.0.140', '超级管理员', '2023-05-31 11:20:17', 'http://localhost:8088/demoApp/system/menu/delete/1063', 14, '0', '内网IP', '{}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (39, '菜单管理', '1', 'com.ht.demo.app.controller.system.SysMenuController', 'insertMenu', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 11:22:57', 'http://localhost:8088/demoApp/system/menu/insert', 114410, '0', '内网IP', '{\"ancestors\":\"0,1\",\"component\":\"system/filter/index\",\"createBy\":\"超级管理员\",\"createTime\":1685503263327,\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"登录过滤\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":1,\"path\":\"filter\",\"perms\":\"system:filter:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (40, '菜单管理', '1', 'com.ht.demo.app.controller.system.SysMenuController', 'insertMenu', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 11:23:10', 'http://localhost:8088/demoApp/system/menu/insert', 34, '0', '内网IP', '{\"ancestors\":\"0,1\",\"component\":\"system/filter/index\",\"createBy\":\"超级管理员\",\"createTime\":1685503390805,\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"登录过滤\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":1,\"path\":\"filter\",\"perms\":\"system:filter:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (41, '菜单管理', '3', 'com.ht.demo.app.controller.system.SysMenuController', 'delMenu', 'DELETE', '192.168.0.140', '超级管理员', '2023-05-31 11:23:33', 'http://localhost:8088/demoApp/system/menu/delete/1065', 16, '0', '内网IP', '{}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (42, '菜单管理', '1', 'com.ht.demo.app.controller.system.SysMenuController', 'insertMenu', 'POST', '192.168.0.140', '超级管理员', '2023-05-31 11:24:15', 'http://localhost:8088/demoApp/system/menu/insert', 4, '0', '内网IP', '{\"ancestors\":\"0,1\",\"component\":\"system/filter/index\",\"createBy\":\"超级管理员\",\"createTime\":1685503455576,\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"登录签名过滤\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":1,\"path\":\"filter\",\"perms\":\"system:filter:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (43, '菜单管理', '3', 'com.ht.demo.app.controller.system.SysMenuController', 'delMenu', 'DELETE', '127.0.0.1', '超级管理员', '2023-05-31 14:55:03', 'http://localhost:8088/demoApp/system/menu/delete/114', 32, '0', '内网IP', '{}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (44, '菜单管理', '3', 'com.ht.demo.app.controller.system.SysMenuController', 'delMenu', 'DELETE', '127.0.0.1', '超级管理员', '2023-05-31 14:55:11', 'http://localhost:8088/demoApp/system/menu/delete/113', 4, '0', '内网IP', '{}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (45, '菜单管理', '3', 'com.ht.demo.app.controller.system.SysMenuController', 'delMenu', 'DELETE', '127.0.0.1', '超级管理员', '2023-05-31 14:57:16', 'http://localhost:8088/demoApp/system/menu/delete/111', 8, '0', '内网IP', '{}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (46, '部门管理', '2', 'com.ht.demo.app.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 14:58:56', 'http://localhost:8088/demoApp/system/dept/update', 21, '0', '内网IP', '{\"ancestors\":\"0,100,102\",\"createBy\":\"admin\",\"createTime\":1682615468000,\"delFlag\":\"0\",\"deptName\":\"工程部\",\"email\":\"hangtong@qq.com\",\"leader\":\"曾超\",\"orderNum\":2,\"parentId\":102,\"phone\":\"15888888888\",\"status\":\"0\",\"sysDeptId\":109,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (47, '部门管理', '1', 'com.ht.demo.app.controller.system.SysDeptController', 'saveDept', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 14:59:14', 'http://localhost:8088/demoApp/system/dept/insert', 11, '0', '内网IP', '{\"ancestors\":\"0,100\",\"deptName\":\"重庆分公司\",\"orderNum\":1,\"parentId\":100,\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (48, '部门管理', '1', 'com.ht.demo.app.controller.system.SysDeptController', 'saveDept', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 14:59:27', 'http://localhost:8088/demoApp/system/dept/insert', 5, '0', '内网IP', '{\"ancestors\":\"0,100,114\",\"deptName\":\"开发部\",\"orderNum\":1,\"parentId\":114,\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (49, '部门管理', '1', 'com.ht.demo.app.controller.system.SysDeptController', 'saveDept', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 14:59:37', 'http://localhost:8088/demoApp/system/dept/insert', 6, '0', '内网IP', '{\"ancestors\":\"0,100,114\",\"deptName\":\"工程部\",\"orderNum\":2,\"parentId\":114,\"status\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (50, '部门管理', '2', 'com.ht.demo.app.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 14:59:48', 'http://localhost:8088/demoApp/system/dept/update', 3, '0', '内网IP', '{\"ancestors\":\"0,100\",\"createBy\":\"admin\",\"createTime\":1682615468000,\"delFlag\":\"0\",\"deptName\":\"深圳总公司\",\"email\":\"hangtong@qq.com\",\"leader\":\"何勇\",\"orderNum\":0,\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"sysDeptId\":101,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (51, '部门管理', '2', 'com.ht.demo.app.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 15:01:33', 'http://localhost:8088/demoApp/system/dept/update', 24, '0', '内网IP', '{\"ancestors\":\"0,100\",\"createBy\":\"超级管理员\",\"createTime\":1685516354000,\"delFlag\":\"0\",\"deptName\":\"重庆分公司\",\"orderNum\":2,\"parentId\":100,\"status\":\"0\",\"sysDeptId\":114,\"updateBy\":\"\",\"updateTime\":1685516354000}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (52, '部门管理', '2', 'com.ht.demo.app.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 15:01:44', 'http://localhost:8088/demoApp/system/dept/update', 6, '0', '内网IP', '{\"ancestors\":\"0,100\",\"createBy\":\"admin\",\"createTime\":1682615468000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"hangtong@qq.com\",\"leader\":\"曾超\",\"orderNum\":1,\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"sysDeptId\":102,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (53, '部门管理', '2', 'com.ht.demo.admin.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 15:14:32', 'http://localhost:8088/demoApp/system/dept/update', 27, '0', '内网IP', '{\"ancestors\":\"0\",\"createBy\":\"admin\",\"createTime\":1682615468000,\"delFlag\":\"0\",\"deptName\":\"一级部门\",\"email\":\"hangtong@qq.com\",\"leader\":\"林菁\",\"orderNum\":0,\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"sysDeptId\":100,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (54, '部门管理', '2', 'com.ht.demo.admin.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 15:14:55', 'http://localhost:8088/demoApp/system/dept/update', 10, '0', '内网IP', '{\"ancestors\":\"0,100\",\"createBy\":\"admin\",\"createTime\":1682615468000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"hangtong@qq.com\",\"leader\":\"\",\"orderNum\":1,\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"sysDeptId\":102,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (55, '部门管理', '2', 'com.ht.demo.admin.controller.system.SysDeptController', 'updateDept', 'PUT', '127.0.0.1', '超级管理员', '2023-05-31 15:15:03', 'http://localhost:8088/demoApp/system/dept/update', 4, '0', '内网IP', '{\"ancestors\":\"0,100\",\"createBy\":\"admin\",\"createTime\":1682615468000,\"delFlag\":\"0\",\"deptName\":\"深圳总公司\",\"email\":\"hangtong@qq.com\",\"leader\":\"\",\"orderNum\":0,\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"sysDeptId\":101,\"updateBy\":\"\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (56, '用户管理', '2', 'com.ht.demo.admin.controller.system.SysUserController', 'updateUserById', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 15:15:52', 'http://localhost:8088/demoApp/updateUserById', 1061, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"7BCBB16048EC16BAEAD56F82FB29E688\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"普通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685498227000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (57, '用户管理', '2', 'com.ht.demo.admin.controller.system.SysUserController', 'updateUserById', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 15:15:52', 'http://localhost:8088/demoApp/updateUserById', 10612, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"7BCBB16048EC16BAEAD56F82FB29E688\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"普通管理员\",\"passWdMd\":\"122957A92652DEBA731C3E4A34BAE81F\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685498227000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (58, '用户管理', '2', 'com.ht.demo.admin.controller.system.SysUserController', 'updateUserById', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 15:16:22', 'http://localhost:8088/demoApp/updateUserById', 5, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"7BCBB16048EC16BAEAD56F82FB29E688\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"passWd\":\"123456\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"sysUserId\":4}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (59, '用户管理', '2', 'com.ht.demo.admin.controller.system.SysUserController', 'updateUserById', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 15:16:39', 'http://localhost:8088/demoApp/updateUserById', 6, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"7BCBB16048EC16BAEAD56F82FB29E688\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685083139000,\"delFlag\":\"0\",\"deptName\":\"昆明分公司\",\"email\":\"13333333333@qq.com\",\"loginIp\":\"\",\"loginNo\":\"htadmin\",\"nickName\":\"普通管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"13333333333\",\"sex\":\"2\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"sysUserId\":4,\"updateTime\":1685517382000,\"userName\":\"管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":true,\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');
INSERT INTO `sys_logger` VALUES (60, '用户管理', '1', 'com.ht.demo.admin.controller.system.SysUserController', 'insertUser', 'POST', '127.0.0.1', '超级管理员', '2023-05-31 15:17:30', 'http://localhost:8088/demoApp/insertUser', 24, '0', '内网IP', '{\"createTime\":1683116221000,\"delFlag\":\"0\",\"deptName\":\"航通智能\",\"email\":\"\",\"loginIp\":\"\",\"loginNo\":\"admin\",\"nickName\":\"超级管理员\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"phoneNo\":\"15288288357\",\"role\":{\"createBy\":\"\",\"createTime\":1683374022000,\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"super_admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\",\"sysRoleId\":1,\"updateBy\":\"\",\"updateTime\":1683374026000},\"sysDeptId\":100,\"sysRoleId\":1,\"sysUserId\":1,\"token\":\"7BCBB16048EC16BAEAD56F82FB29E688\",\"updateTime\":1683116226000,\"userName\":\"超级管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}{\"createTime\":1685517450160,\"deptName\":\"昆明分公司\",\"loginNo\":\"devadmin\",\"nickName\":\"开发管理员\",\"passWd\":\"123456\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"sex\":\"1\",\"sysDeptId\":102,\"sysPostIds\":[2],\"sysRoleId\":5,\"userName\":\"开发管理员\",\"userStatus\":\"0\",\"userType\":\"0\"}', '{\"isSuccess\":true,\"data\":{\"loginNo\":\"devadmin\",\"userName\":\"开发管理员\",\"nickName\":\"开发管理员\",\"sysDeptId\":102,\"deptName\":\"昆明分公司\",\"userType\":\"0\",\"passWdMd\":\"62352DC29273478BAC22C1DAA38FBB16\",\"passWd\":\"123456\",\"userStatus\":\"0\",\"createTime\":\"May 31, 2023 3:17:30 PM\",\"sex\":\"1\",\"sysRoleId\":5,\"sysPostIds\":[2]},\"message\":\"操作成功！\",\"code\":20000,\"extraMap\":{},\"appErrorCodeEnum\":\"SUCCESS\"}', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级id集合，多个英文逗号分割',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1067 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', '0', 0, 1, 'system', NULL, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2023-04-28 01:11:08', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', '0', 0, 2, 'monitor', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2023-04-28 01:11:08', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', '0', 0, 3, 'tool', NULL, '', '1', '0', 'M', '1', '0', '', 'tool', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:36:12', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', '0,1', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-04-28 01:11:08', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', '0,1', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-04-28 01:11:08', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', '0,1', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-04-28 01:11:08', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', '0,1', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-04-28 01:11:08', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', '0,1', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-04-28 01:11:08', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', '0,1', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-04-28 01:11:08', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', '0,2', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '1', '0', 'monitor:online:list', 'online', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:34:47', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', '0,2', 2, 2, 'job', 'monitor/job/index', '', '1', '0', 'C', '1', '0', 'monitor:job:list', 'job', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:34:36', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', '0,2', 2, 4, 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-04-28 01:11:08', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', '0,3', 3, 1, 'build', 'tool/build/index', '', '1', '0', 'C', '1', '0', 'tool:build:list', 'build', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:35:31', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', '0,3', 3, 2, 'gen', 'tool/gen/index', '', '1', '0', 'C', '1', '0', 'tool:gen:list', 'code', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:35:25', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', '0,3', 3, 3, 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '1', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:35:08', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', '0,1,108', 2, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:44:59', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', '0,1,108', 2, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-04-28 01:11:08', '', '2023-05-30 11:45:13', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', '0,1,100', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', '0,1,100', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', '0,1,100', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', '0,1,100', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', '0,1,100', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', '0,1,100', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', '0,1,100', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', '0,1,101', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', '0,1,101', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', '0,1,101', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', '0,1,101', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', '0,1,101', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', '0,1,102', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', '0,1,102', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', '0,1,102', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', '0,1,102', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', '0,1,103', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', '0,1,103', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', '0,1,103', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', '0,1,103', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', '0,1,104', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', '0,1,104', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', '0,1,104', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', '0,1,104', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', '0,1,104', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', '0,1,105', 105, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', '0,1,105', 105, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', '0,1,105', 105, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', '0,1,105', 105, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', '0,1,105', 105, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', '0,1,108,500', 500, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', '0,1,108,500', 500, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', '0,1,108,500', 500, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', '0,1,108,501', 501, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', '0,1,108,501', 501, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', '0,1,108,501', 501, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', '0,1,108,501', 501, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', '0,2,109', 109, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', '0,2,109', 109, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', '0,2,109', 109, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', '0,2,110', 110, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', '0,2,110', 110, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', '0,2,110', 110, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', '0,2,110', 110, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', '0,2,110', 110, 5, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', '0,2,110', 110, 6, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', '0,3,116', 116, 1, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', '0,3,116', 116, 2, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', '0,3,116', 116, 3, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', '0,3,116', 116, 4, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', '0,3,116', 116, 5, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', '0,3,116', 116, 6, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-04-28 01:11:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '百度一下', '0', 0, 1, 'http://www.baidu.com', NULL, NULL, '0', '0', 'M', '1', '0', NULL, 'search', NULL, NULL, NULL, '2023-05-26 13:24:19', NULL);
INSERT INTO `sys_menu` VALUES (1066, '登录签名过滤', '0,1', 1, 1, 'filter', 'system/filter/index', NULL, '1', '0', 'C', '0', '0', 'system:filter:index', 'international', '超级管理员', '2023-05-31 11:24:15', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'CEO', '董事长', 1, '0', 'admin', '2023-05-26 15:12:31', '超级管理员', '2023-05-30 17:57:21', '');
INSERT INTO `sys_post` VALUES (2, 'SE', '项目经理', 2, '0', 'admin', '2023-05-26 15:12:31', '超级管理员', '2023-05-30 17:57:20', '');
INSERT INTO `sys_post` VALUES (3, 'HR', '人力资源', 3, '0', 'admin', '2023-05-26 15:12:31', '管理员', '2023-05-31 09:59:27', '');
INSERT INTO `sys_post` VALUES (6, 'JAVA', 'Java开发工程师', 4, '0', '超级管理员', '2023-05-26 16:47:45', '超级管理员', '2023-05-30 17:57:16', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'super_admin', 1, '1', 1, 1, '0', '0', '', '2023-05-06 19:53:42', '', '2023-05-06 19:53:46', NULL);
INSERT INTO `sys_role` VALUES (5, '开发组', 'dev', 3, '1', 1, 1, '0', '0', '超级管理员', '2023-05-24 09:31:21', '管理员', '2023-05-31 10:17:30', NULL);
INSERT INTO `sys_role` VALUES (7, '货场用户', 'custom_admin', 2, '1', 1, 1, '0', '0', '超级管理员', '2023-05-24 14:45:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `sys_menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_role_id_menu_id`(`sys_role_id`, `sys_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 633 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (184, 3, 1, '', '系统管理', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (185, 3, 103, 'system:dept:list', '部门管理', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (186, 3, 104, 'system:post:list', '岗位管理', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (187, 3, 106, 'system:config:list', '参数设置', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (190, 3, 500, 'monitor:operlog:list', '操作日志', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (191, 3, 501, 'monitor:logininfor:list', '登录日志', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (192, 3, 1016, 'system:dept:query', '部门查询', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (193, 3, 1017, 'system:dept:add', '部门新增', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (194, 3, 1018, 'system:dept:edit', '部门修改', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (195, 3, 1019, 'system:dept:remove', '部门删除', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (196, 3, 1020, 'system:post:query', '岗位查询', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (197, 3, 1021, 'system:post:add', '岗位新增', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (198, 3, 1022, 'system:post:edit', '岗位修改', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (199, 3, 1023, 'system:post:remove', '岗位删除', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (200, 3, 1024, 'system:post:export', '岗位导出', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (201, 3, 1030, 'system:config:query', '参数查询', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (202, 3, 1031, 'system:config:add', '参数新增', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (203, 3, 1032, 'system:config:edit', '参数修改', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (204, 3, 1033, 'system:config:remove', '参数删除', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (205, 3, 1034, 'system:config:export', '参数导出', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (210, 3, 1039, 'monitor:operlog:query', '操作查询', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (211, 3, 1040, 'monitor:operlog:remove', '操作删除', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (212, 3, 1041, 'monitor:operlog:export', '日志导出', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (213, 3, 1042, 'monitor:logininfor:query', '登录查询', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (214, 3, 1043, 'monitor:logininfor:remove', '登录删除', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (215, 3, 1044, 'monitor:logininfor:export', '日志导出', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (216, 3, 1045, 'monitor:logininfor:unlock', '账户解锁', '2023-05-24 10:07:15');
INSERT INTO `sys_role_menu` VALUES (359, 7, 1, '', '系统管理', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (360, 7, 2, '', '系统监控', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (361, 7, 100, 'system:user:list', '用户管理', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (362, 7, 101, 'system:role:list', '角色管理', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (363, 7, 103, 'system:dept:list', '部门管理', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (364, 7, 104, 'system:post:list', '岗位管理', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (367, 7, 109, 'monitor:online:list', '在线用户', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (368, 7, 110, 'monitor:job:list', '定时任务', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (370, 7, 112, 'monitor:server:list', '服务监控', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (373, 7, 500, 'monitor:operlog:list', '操作日志', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (374, 7, 501, 'monitor:logininfor:list', '登录日志', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (375, 7, 1000, 'system:user:query', '用户查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (376, 7, 1001, 'system:user:add', '用户新增', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (377, 7, 1002, 'system:user:edit', '用户修改', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (378, 7, 1003, 'system:user:remove', '用户删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (379, 7, 1004, 'system:user:export', '用户导出', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (380, 7, 1005, 'system:user:import', '用户导入', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (381, 7, 1006, 'system:user:resetPwd', '重置密码', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (382, 7, 1007, 'system:role:query', '角色查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (383, 7, 1008, 'system:role:add', '角色新增', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (384, 7, 1009, 'system:role:edit', '角色修改', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (385, 7, 1010, 'system:role:remove', '角色删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (386, 7, 1011, 'system:role:export', '角色导出', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (387, 7, 1016, 'system:dept:query', '部门查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (388, 7, 1017, 'system:dept:add', '部门新增', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (389, 7, 1018, 'system:dept:edit', '部门修改', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (390, 7, 1019, 'system:dept:remove', '部门删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (391, 7, 1020, 'system:post:query', '岗位查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (392, 7, 1021, 'system:post:add', '岗位新增', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (393, 7, 1022, 'system:post:edit', '岗位修改', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (394, 7, 1023, 'system:post:remove', '岗位删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (395, 7, 1024, 'system:post:export', '岗位导出', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (400, 7, 1039, 'monitor:operlog:query', '操作查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (401, 7, 1040, 'monitor:operlog:remove', '操作删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (402, 7, 1041, 'monitor:operlog:export', '日志导出', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (403, 7, 1042, 'monitor:logininfor:query', '登录查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (404, 7, 1043, 'monitor:logininfor:remove', '登录删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (405, 7, 1044, 'monitor:logininfor:export', '日志导出', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (406, 7, 1045, 'monitor:logininfor:unlock', '账户解锁', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (407, 7, 1046, 'monitor:online:query', '在线查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (408, 7, 1047, 'monitor:online:batchLogout', '批量强退', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (409, 7, 1048, 'monitor:online:forceLogout', '单条强退', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (410, 7, 1049, 'monitor:job:query', '任务查询', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (411, 7, 1050, 'monitor:job:add', '任务新增', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (412, 7, 1051, 'monitor:job:edit', '任务修改', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (413, 7, 1052, 'monitor:job:remove', '任务删除', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (414, 7, 1053, 'monitor:job:changeStatus', '状态修改', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (415, 7, 1054, 'monitor:job:export', '任务导出', '2023-05-24 14:48:20');
INSERT INTO `sys_role_menu` VALUES (448, 6, 1, '', '系统管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (449, 6, 2, '', '系统监控', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (450, 6, 3, '', '系统工具', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (452, 6, 100, 'system:user:list', '用户管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (453, 6, 101, 'system:role:list', '角色管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (454, 6, 102, 'system:menu:list', '菜单管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (455, 6, 103, 'system:dept:list', '部门管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (456, 6, 104, 'system:post:list', '岗位管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (457, 6, 105, 'system:dict:list', '字典管理', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (458, 6, 106, 'system:config:list', '参数设置', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (461, 6, 109, 'monitor:online:list', '在线用户', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (462, 6, 110, 'monitor:job:list', '定时任务', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (464, 6, 112, 'monitor:server:list', '服务监控', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (467, 6, 115, 'tool:build:list', '表单构建', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (468, 6, 116, 'tool:gen:list', '代码生成', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (469, 6, 117, 'tool:swagger:list', '系统接口', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (470, 6, 500, 'monitor:operlog:list', '操作日志', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (471, 6, 501, 'monitor:logininfor:list', '登录日志', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (472, 6, 1000, 'system:user:query', '用户查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (473, 6, 1001, 'system:user:add', '用户新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (474, 6, 1002, 'system:user:edit', '用户修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (475, 6, 1003, 'system:user:remove', '用户删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (476, 6, 1004, 'system:user:export', '用户导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (477, 6, 1005, 'system:user:import', '用户导入', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (478, 6, 1006, 'system:user:resetPwd', '重置密码', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (479, 6, 1007, 'system:role:query', '角色查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (480, 6, 1008, 'system:role:add', '角色新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (481, 6, 1009, 'system:role:edit', '角色修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (482, 6, 1010, 'system:role:remove', '角色删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (483, 6, 1011, 'system:role:export', '角色导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (484, 6, 1012, 'system:menu:query', '菜单查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (485, 6, 1013, 'system:menu:add', '菜单新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (486, 6, 1014, 'system:menu:edit', '菜单修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (487, 6, 1015, 'system:menu:remove', '菜单删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (488, 6, 1016, 'system:dept:query', '部门查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (489, 6, 1017, 'system:dept:add', '部门新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (490, 6, 1018, 'system:dept:edit', '部门修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (491, 6, 1019, 'system:dept:remove', '部门删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (492, 6, 1020, 'system:post:query', '岗位查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (493, 6, 1021, 'system:post:add', '岗位新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (494, 6, 1022, 'system:post:edit', '岗位修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (495, 6, 1023, 'system:post:remove', '岗位删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (496, 6, 1024, 'system:post:export', '岗位导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (497, 6, 1025, 'system:dict:query', '字典查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (498, 6, 1026, 'system:dict:add', '字典新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (499, 6, 1027, 'system:dict:edit', '字典修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (500, 6, 1028, 'system:dict:remove', '字典删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (501, 6, 1029, 'system:dict:export', '字典导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (502, 6, 1030, 'system:config:query', '参数查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (503, 6, 1031, 'system:config:add', '参数新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (504, 6, 1032, 'system:config:edit', '参数修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (505, 6, 1033, 'system:config:remove', '参数删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (506, 6, 1034, 'system:config:export', '参数导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (511, 6, 1039, 'monitor:operlog:query', '操作查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (512, 6, 1040, 'monitor:operlog:remove', '操作删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (513, 6, 1041, 'monitor:operlog:export', '日志导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (514, 6, 1042, 'monitor:logininfor:query', '登录查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (515, 6, 1043, 'monitor:logininfor:remove', '登录删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (516, 6, 1044, 'monitor:logininfor:export', '日志导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (517, 6, 1045, 'monitor:logininfor:unlock', '账户解锁', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (518, 6, 1046, 'monitor:online:query', '在线查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (519, 6, 1047, 'monitor:online:batchLogout', '批量强退', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (520, 6, 1048, 'monitor:online:forceLogout', '单条强退', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (521, 6, 1049, 'monitor:job:query', '任务查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (522, 6, 1050, 'monitor:job:add', '任务新增', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (523, 6, 1051, 'monitor:job:edit', '任务修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (524, 6, 1052, 'monitor:job:remove', '任务删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (525, 6, 1053, 'monitor:job:changeStatus', '状态修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (526, 6, 1054, 'monitor:job:export', '任务导出', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (527, 6, 1055, 'tool:gen:query', '生成查询', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (528, 6, 1056, 'tool:gen:edit', '生成修改', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (529, 6, 1057, 'tool:gen:remove', '生成删除', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (530, 6, 1058, 'tool:gen:import', '导入代码', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (531, 6, 1059, 'tool:gen:preview', '预览代码', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (532, 6, 1060, 'tool:gen:code', '生成代码', '2023-05-24 14:48:35');
INSERT INTO `sys_role_menu` VALUES (599, 5, 1, '', '系统管理', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (600, 5, 2, '', '系统监控', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (601, 5, 100, 'system:user:list', '用户管理', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (602, 5, 101, 'system:role:list', '角色管理', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (603, 5, 102, 'system:menu:list', '菜单管理', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (604, 5, 104, 'system:post:list', '岗位管理', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (605, 5, 109, 'monitor:online:list', '在线用户', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (606, 5, 110, 'monitor:job:list', '定时任务', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (607, 5, 1000, 'system:user:query', '用户查询', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (608, 5, 1001, 'system:user:add', '用户新增', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (609, 5, 1002, 'system:user:edit', '用户修改', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (610, 5, 1003, 'system:user:remove', '用户删除', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (611, 5, 1004, 'system:user:export', '用户导出', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (612, 5, 1005, 'system:user:import', '用户导入', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (613, 5, 1006, 'system:user:resetPwd', '重置密码', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (614, 5, 1007, 'system:role:query', '角色查询', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (615, 5, 1008, 'system:role:add', '角色新增', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (616, 5, 1009, 'system:role:edit', '角色修改', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (617, 5, 1010, 'system:role:remove', '角色删除', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (618, 5, 1011, 'system:role:export', '角色导出', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (619, 5, 1012, 'system:menu:query', '菜单查询', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (620, 5, 1013, 'system:menu:add', '菜单新增', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (621, 5, 1014, 'system:menu:edit', '菜单修改', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (622, 5, 1015, 'system:menu:remove', '菜单删除', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (623, 5, 1022, 'system:post:edit', '岗位修改', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (624, 5, 1046, 'monitor:online:query', '在线查询', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (625, 5, 1047, 'monitor:online:batchLogout', '批量强退', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (626, 5, 1048, 'monitor:online:forceLogout', '单条强退', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (627, 5, 1049, 'monitor:job:query', '任务查询', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (628, 5, 1050, 'monitor:job:add', '任务新增', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (629, 5, 1051, 'monitor:job:edit', '任务修改', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (630, 5, 1052, 'monitor:job:remove', '任务删除', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (631, 5, 1053, 'monitor:job:changeStatus', '状态修改', '2023-05-31 10:17:30');
INSERT INTO `sys_role_menu` VALUES (632, 5, 1054, 'monitor:job:export', '任务导出', '2023-05-31 10:17:30');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `sys_dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `phone_no` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（0系统用户）',
  `pass_wd_md` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密后的密码',
  `pass_wd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `user_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户状态（0-正常，1-停用）',
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(1-男，2女)',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '最近修改时间',
  `del_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否删除（0 未删除，1 已删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '超级管理员', 100, '航通智能', '15288888888', '0', '62352DC29273478BAC22C1DAA38FBB16', '123456', '', '0', NULL, '', NULL, '2023-05-03 20:17:01', '2023-05-03 20:17:06', '0', NULL);
INSERT INTO `sys_user` VALUES (4, 'htadmin', '管理员', '普通管理员', 102, '昆明分公司', '13333333333', '0', '62352DC29273478BAC22C1DAA38FBB16', '123456', '13333333333@qq.com', '0', '2', '', NULL, '2023-05-26 14:38:59', '2023-05-31 15:16:39', '0', NULL);
INSERT INTO `sys_user` VALUES (5, 'devadmin', '开发管理员', '开发管理员', 102, '昆明分公司', NULL, '0', '62352DC29273478BAC22C1DAA38FBB16', '123456', '', '0', '1', '', NULL, '2023-05-31 15:17:30', '2023-05-31 15:17:30', '0', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) NOT NULL,
  `sys_post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (12, 4, 2);
INSERT INTO `sys_user_post` VALUES (13, 5, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `sys_role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sys_user_id_role_id`(`sys_user_id`, `sys_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2023-05-31 09:35:39');
INSERT INTO `sys_user_role` VALUES (2, 4, 5, '2023-05-31 09:57:06');
INSERT INTO `sys_user_role` VALUES (3, 5, 5, '2023-05-31 15:17:30');

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '最近修改时间',
  `deleted` int(1) NOT NULL COMMENT '是否删除（0 未删除，1 已删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
