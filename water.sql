/*
 Navicat Premium Data Transfer

 Source Server         : xc
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : water

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 12/10/2018 15:29:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user info', 7, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change user info', 7, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user info', 7, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view user info', 7, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can add node record', 8, 'add_noderecord');
INSERT INTO `auth_permission` VALUES (30, 'Can change node record', 8, 'change_noderecord');
INSERT INTO `auth_permission` VALUES (31, 'Can delete node record', 8, 'delete_noderecord');
INSERT INTO `auth_permission` VALUES (32, 'Can view node record', 8, 'view_noderecord');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'watermonito', 'noderecord');
INSERT INTO `django_content_type` VALUES (7, 'watermonito', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-10-02 10:17:19.573674');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-10-02 10:17:20.581949');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-10-02 10:17:20.820313');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-10-02 10:17:20.835272');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2018-10-02 10:17:20.850232');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2018-10-02 10:17:20.998834');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-10-02 10:17:21.084605');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-10-02 10:17:21.203288');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-10-02 10:17:21.218248');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-10-02 10:17:21.289058');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-10-02 10:17:21.294045');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-10-02 10:17:21.305016');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-10-02 10:17:21.424696');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-10-02 10:17:21.507474');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-10-02 10:17:21.583272');
INSERT INTO `django_migrations` VALUES (16, 'watermonito', '0001_initial', '2018-10-02 11:07:47.278494');
INSERT INTO `django_migrations` VALUES (17, 'watermonito', '0002_noderecord', '2018-10-09 10:07:33.841724');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5tnauv94is4ptkka3oygkmfqw2tvpvef', 'OTBlYTg4NjVlMDc4YWMzY2Q4ZmVlZjdlMzJmMjIwZmUyMTc1NGYxMDp7IkNoZWNrQ29kZSI6ImhWd2oiLCJ1c2VybmFtZSI6Inl6YTg0NTExNjYiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-10-24 12:01:16.261099');
INSERT INTO `django_session` VALUES ('jvtzz6wwdndxzhwsnrbdhky5h1iu5y6m', 'OWVhNDlkM2UzNDBiZDYwMTJhMmVkNDM5NTcyNWEzOWJlYjQ2ODRiNjp7IkNoZWNrQ29kZSI6IkJRa3giLCJ1c2VybmFtZSI6Inl6YTg0NTExNjYiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-10-26 02:07:46.222041');
INSERT INTO `django_session` VALUES ('kt449sf264mvkbtx0lig564686krkw5c', 'NWIzZDgwNjhlZmI4NTNkNWE3ZmYwNGYyNmVhN2JkZjQ2NTYzOWRkZDp7IkNoZWNrQ29kZSI6IlhBUGYiLCJ1c2VybmFtZSI6Inl6YTg0NTExNjYifQ==', '2018-10-23 08:08:22.235739');
INSERT INTO `django_session` VALUES ('q2oijrau4ipd8hiiqcx1j5sn8vc7aj0w', 'ZDlkNTJjZDkxNTYwYjI5NDIxMmYzM2U1ZDg1MGNjN2MxYTdiYmRiNzp7IkNoZWNrQ29kZSI6IjRNM2sifQ==', '2018-10-25 08:48:00.509229');
INSERT INTO `django_session` VALUES ('r7isalannsdn9beqtvqmjynacif70s6l', 'ZDU1ZmI4YTNkMzdjMWY3OGI4ZGFjZDc3NTg2ODE4MGM1MTE2NTA5MTp7IkNoZWNrQ29kZSI6Imh3ZUYiLCJ1c2VybmFtZSI6Inl6YTg0NTExNjYifQ==', '2018-10-24 02:38:58.290880');
INSERT INTO `django_session` VALUES ('yel8hmc7fb105bywxoxmybqn10o07fae', 'ZjAzYWM1NWE4OWMyODliZDk1MDcxZjM4MTU4NDk2MTI0NTMxMjMzZjp7IkNoZWNrQ29kZSI6Ik1BVDUiLCJ1c2VybmFtZSI6Inl6YTg0NTExNjYiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-10-24 12:27:42.807538');

-- ----------------------------
-- Table structure for watermonito_noderecord
-- ----------------------------
DROP TABLE IF EXISTS `watermonito_noderecord`;
CREATE TABLE `watermonito_noderecord`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `nodename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` double NOT NULL,
  `rectime` datetime(6) NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of watermonito_noderecord
-- ----------------------------
INSERT INTO `watermonito_noderecord` VALUES (465, '20003756', 0.018, '2018-10-12 09:39:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (466, '20003757', 0, '2018-10-12 09:39:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (467, '20003756', 0.018, '2018-10-12 09:40:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (468, '20003757', 0, '2018-10-12 09:40:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (469, '20003756', 0.018, '2018-10-12 09:41:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (470, '20003757', 0, '2018-10-12 09:41:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (471, '20003756', 0.018, '2018-10-12 09:42:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (472, '20003757', 0, '2018-10-12 09:42:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (473, '20003756', 0.018, '2018-10-12 09:43:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (474, '20003757', 0, '2018-10-12 09:43:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (475, '20003756', 0.018, '2018-10-12 09:44:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (476, '20003757', 0, '2018-10-12 09:44:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (477, '20003756', 0.018, '2018-10-12 09:45:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (478, '20003757', 0, '2018-10-12 09:45:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (479, '20003756', 0.018, '2018-10-12 09:46:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (480, '20003757', 0, '2018-10-12 09:46:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (481, '20003756', 0.018, '2018-10-12 09:47:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (482, '20003757', 0, '2018-10-12 09:47:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (483, '20003756', 0.018, '2018-10-12 09:48:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (484, '20003757', 0, '2018-10-12 09:48:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (485, '20003756', 0.018, '2018-10-12 09:49:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (486, '20003757', 0, '2018-10-12 09:49:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (487, '20003756', 0.018, '2018-10-12 09:50:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (488, '20003757', 0, '2018-10-12 09:50:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (489, '20003756', 0.018, '2018-10-12 09:51:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (490, '20003757', 0, '2018-10-12 09:51:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (491, '20003756', 0.018, '2018-10-12 09:52:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (492, '20003757', 0, '2018-10-12 09:52:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (493, '20003756', 0.018, '2018-10-12 09:53:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (494, '20003757', 0, '2018-10-12 09:53:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (495, '20003756', 0.018, '2018-10-12 09:54:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (496, '20003757', 0, '2018-10-12 09:54:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (497, '20003756', 0.018, '2018-10-12 09:55:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (498, '20003757', 0, '2018-10-12 09:55:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (499, '20003756', 0.018, '2018-10-12 09:56:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (500, '20003757', 0, '2018-10-12 09:56:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (501, '20003756', 0.019, '2018-10-12 09:57:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (502, '20003757', 0, '2018-10-12 09:57:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (503, '20003756', 0.019, '2018-10-12 09:58:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (504, '20003757', 0, '2018-10-12 09:58:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (505, '20003756', 0.019, '2018-10-12 09:59:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (506, '20003757', 0, '2018-10-12 09:59:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (507, '20003756', 0.019, '2018-10-12 10:00:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (508, '20003757', 0, '2018-10-12 10:00:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (509, '20003756', 0.019, '2018-10-12 10:01:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (510, '20003757', 0, '2018-10-12 10:01:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (511, '20003756', 0.019, '2018-10-12 10:02:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (512, '20003757', 0, '2018-10-12 10:02:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (513, '20003756', 0.019, '2018-10-12 10:03:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (514, '20003757', 0, '2018-10-12 10:03:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (515, '20003756', 0.019, '2018-10-12 10:04:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (516, '20003757', 0, '2018-10-12 10:04:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (517, '20003756', 0.019, '2018-10-12 10:05:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (518, '20003757', 0, '2018-10-12 10:05:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (519, '20003756', 0.019, '2018-10-12 10:06:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (520, '20003757', 0, '2018-10-12 10:06:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (521, '20003756', 0.019, '2018-10-12 10:07:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (522, '20003757', 0, '2018-10-12 10:07:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (523, '20003756', 0.019, '2018-10-12 10:08:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (524, '20003757', 0, '2018-10-12 10:08:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (525, '20003756', 0.019, '2018-10-12 10:09:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (526, '20003757', 0, '2018-10-12 10:09:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (527, '20003756', 0.019, '2018-10-12 10:10:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (528, '20003757', 0, '2018-10-12 10:10:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (529, '20003756', 0.019, '2018-10-12 10:11:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (530, '20003757', 0, '2018-10-12 10:11:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (531, '20003756', 0.019, '2018-10-12 10:12:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (532, '20003757', 0, '2018-10-12 10:12:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (533, '20003756', 0.019, '2018-10-12 10:13:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (534, '20003757', 0, '2018-10-12 10:13:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (535, '20003756', 0.019, '2018-10-12 10:14:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (536, '20003757', 0, '2018-10-12 10:14:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (537, '20003756', 0.019, '2018-10-12 10:15:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (538, '20003757', 0, '2018-10-12 10:15:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (539, '20003756', 0.019, '2018-10-12 10:16:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (540, '20003757', 0, '2018-10-12 10:16:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (541, '20003756', 0.019, '2018-10-12 10:17:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (542, '20003757', 0, '2018-10-12 10:17:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (543, '20003756', 0.019, '2018-10-12 10:18:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (544, '20003757', 0, '2018-10-12 10:18:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (545, '20003756', 0.019, '2018-10-12 10:19:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (546, '20003757', 0, '2018-10-12 10:19:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (547, '20003756', 0.019, '2018-10-12 10:20:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (548, '20003757', 0, '2018-10-12 10:20:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (549, '20003756', 0.019, '2018-10-12 10:21:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (550, '20003757', 0, '2018-10-12 10:21:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (551, '20003756', 0.019, '2018-10-12 10:22:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (552, '20003757', 0, '2018-10-12 10:22:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (553, '20003756', 0.019, '2018-10-12 10:23:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (554, '20003757', 0, '2018-10-12 10:23:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (555, '20003756', 0.019, '2018-10-12 10:24:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (556, '20003757', 0, '2018-10-12 10:24:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (557, '20003756', 0.019, '2018-10-12 10:25:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (558, '20003757', 0, '2018-10-12 10:25:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (559, '20003756', 0.019, '2018-10-12 10:26:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (560, '20003757', 0, '2018-10-12 10:26:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (561, '20003756', 0.019, '2018-10-12 10:27:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (562, '20003757', 0, '2018-10-12 10:27:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (563, '20003756', 0.019, '2018-10-12 10:28:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (564, '20003757', 0, '2018-10-12 10:28:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (565, '20003756', 0.019, '2018-10-12 10:29:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (566, '20003757', 0, '2018-10-12 10:29:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (567, '20003756', 0.019, '2018-10-12 10:30:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (568, '20003757', 0, '2018-10-12 10:30:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (569, '20003756', 0.019, '2018-10-12 10:31:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (570, '20003757', 0, '2018-10-12 10:31:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (571, '20003756', 0.019, '2018-10-12 10:32:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (572, '20003757', 0, '2018-10-12 10:32:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (573, '20003756', 0.019, '2018-10-12 10:33:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (574, '20003757', 0, '2018-10-12 10:33:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (575, '20003756', 0.019, '2018-10-12 10:34:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (576, '20003757', 0, '2018-10-12 10:34:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (577, '20003756', 0.019, '2018-10-12 10:35:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (578, '20003757', 0, '2018-10-12 10:35:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (579, '20003756', 0.019, '2018-10-12 10:36:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (580, '20003757', 0, '2018-10-12 10:36:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (581, '20003756', 0.019, '2018-10-12 10:37:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (582, '20003757', 0, '2018-10-12 10:37:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (583, '20003756', 0.019, '2018-10-12 10:38:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (584, '20003757', 0, '2018-10-12 10:38:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (585, '20003756', 0.019, '2018-10-12 10:39:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (586, '20003757', 0, '2018-10-12 10:39:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (587, '20003756', 0.019, '2018-10-12 10:40:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (588, '20003757', 0, '2018-10-12 10:40:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (589, '20003756', 0.019, '2018-10-12 10:41:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (590, '20003757', 0, '2018-10-12 10:41:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (591, '20003756', 0.019, '2018-10-12 10:42:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (592, '20003757', 0, '2018-10-12 10:42:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (593, '20003756', 0.019, '2018-10-12 10:43:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (594, '20003757', 0, '2018-10-12 10:43:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (595, '20003756', 0.02, '2018-10-12 10:44:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (596, '20003757', 0, '2018-10-12 10:44:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (597, '20003756', 0.019, '2018-10-12 10:45:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (598, '20003757', 0, '2018-10-12 10:45:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (599, '20003756', 0.019, '2018-10-12 10:46:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (600, '20003757', 0, '2018-10-12 10:46:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (601, '20003756', 0.019, '2018-10-12 10:47:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (602, '20003757', 0, '2018-10-12 10:47:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (603, '20003756', 0.02, '2018-10-12 10:48:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (604, '20003757', 0, '2018-10-12 10:48:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (605, '20003756', 0.019, '2018-10-12 10:49:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (606, '20003757', 0, '2018-10-12 10:49:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (607, '20003756', 0.019, '2018-10-12 10:50:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (608, '20003757', 0, '2018-10-12 10:50:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (609, '20003756', 0.019, '2018-10-12 10:51:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (610, '20003757', 0, '2018-10-12 10:51:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (611, '20003756', 0.019, '2018-10-12 10:52:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (612, '20003757', 0, '2018-10-12 10:52:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (613, '20003756', 0.019, '2018-10-12 10:53:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (614, '20003757', 0, '2018-10-12 10:53:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (615, '20003756', 0.019, '2018-10-12 10:54:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (616, '20003757', 0, '2018-10-12 10:54:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (617, '20003756', 0.019, '2018-10-12 10:55:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (618, '20003757', 0, '2018-10-12 10:55:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (619, '20003756', 0.019, '2018-10-12 10:56:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (620, '20003757', 0, '2018-10-12 10:56:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (621, '20003756', 0.019, '2018-10-12 10:57:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (622, '20003757', 0, '2018-10-12 10:57:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (623, '20003756', 0.019, '2018-10-12 10:58:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (624, '20003757', 0, '2018-10-12 10:58:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (625, '20003756', 0.019, '2018-10-12 10:59:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (626, '20003757', 0, '2018-10-12 10:59:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (627, '20003756', 0.019, '2018-10-12 11:01:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (628, '20003757', 0, '2018-10-12 11:01:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (629, '20003756', 0.019, '2018-10-12 11:02:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (630, '20003757', 0, '2018-10-12 11:02:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (631, '20003756', 0.019, '2018-10-12 11:03:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (632, '20003757', 0, '2018-10-12 11:03:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (633, '20003756', 0.019, '2018-10-12 11:04:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (634, '20003757', 0, '2018-10-12 11:04:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (635, '20003756', 0.019, '2018-10-12 11:05:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (636, '20003757', 0, '2018-10-12 11:05:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (637, '20003756', 0.019, '2018-10-12 11:06:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (638, '20003757', 0, '2018-10-12 11:06:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (639, '20003756', 0.019, '2018-10-12 11:07:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (640, '20003757', 0, '2018-10-12 11:07:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (641, '20003756', 0.019, '2018-10-12 11:08:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (642, '20003757', 0, '2018-10-12 11:08:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (643, '20003756', 0.019, '2018-10-12 11:09:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (644, '20003757', 0, '2018-10-12 11:09:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (645, '20003756', 0.019, '2018-10-12 11:10:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (646, '20003757', 0, '2018-10-12 11:10:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (647, '20003756', 0.019, '2018-10-12 11:11:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (648, '20003757', 0, '2018-10-12 11:11:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (649, '20003756', 0.019, '2018-10-12 11:12:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (650, '20003757', 0, '2018-10-12 11:12:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (651, '20003756', 0.019, '2018-10-12 11:13:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (652, '20003757', 0, '2018-10-12 11:13:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (653, '20003756', 0.019, '2018-10-12 11:14:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (654, '20003757', 0, '2018-10-12 11:14:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (655, '20003756', 0.019, '2018-10-12 11:15:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (656, '20003757', 0, '2018-10-12 11:15:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (657, '20003756', 0.019, '2018-10-12 11:16:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (658, '20003757', 0, '2018-10-12 11:16:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (659, '20003756', 0.019, '2018-10-12 11:17:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (660, '20003757', 0, '2018-10-12 11:17:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (661, '20003756', 0.019, '2018-10-12 11:18:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (662, '20003757', 0, '2018-10-12 11:18:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (663, '20003756', 0.019, '2018-10-12 11:19:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (664, '20003757', 0, '2018-10-12 11:19:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (665, '20003756', 0.02, '2018-10-12 11:20:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (666, '20003757', 0, '2018-10-12 11:20:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (667, '20003756', 0.02, '2018-10-12 11:21:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (668, '20003757', 0, '2018-10-12 11:21:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (669, '20003756', 0.02, '2018-10-12 11:22:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (670, '20003757', 0, '2018-10-12 11:22:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (671, '20003756', 0.02, '2018-10-12 11:23:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (672, '20003757', 0, '2018-10-12 11:23:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (673, '20003756', 0.02, '2018-10-12 11:24:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (674, '20003757', 0, '2018-10-12 11:24:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (675, '20003756', 0.02, '2018-10-12 11:25:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (676, '20003757', 0, '2018-10-12 11:25:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (677, '20003756', 0.02, '2018-10-12 11:26:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (678, '20003757', 0, '2018-10-12 11:26:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (679, '20003756', 0.02, '2018-10-12 11:27:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (680, '20003757', 0, '2018-10-12 11:27:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (681, '20003756', 0.02, '2018-10-12 11:28:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (682, '20003757', 0, '2018-10-12 11:28:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (683, '20003756', 0.02, '2018-10-12 11:29:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (684, '20003757', 0, '2018-10-12 11:29:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (685, '20003756', 0.02, '2018-10-12 11:30:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (686, '20003757', 0, '2018-10-12 11:30:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (687, '20003756', 0.02, '2018-10-12 11:31:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (688, '20003757', 0, '2018-10-12 11:31:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (689, '20003756', 0.02, '2018-10-12 11:32:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (690, '20003757', 0, '2018-10-12 11:32:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (691, '20003756', 0.02, '2018-10-12 11:33:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (692, '20003757', 0, '2018-10-12 11:33:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (693, '20003756', 0.02, '2018-10-12 11:34:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (694, '20003757', 0, '2018-10-12 11:34:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (695, '20003756', 0.02, '2018-10-12 11:35:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (696, '20003757', 0, '2018-10-12 11:35:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (697, '20003756', 0.02, '2018-10-12 11:36:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (698, '20003757', 0, '2018-10-12 11:36:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (699, '20003756', 0.02, '2018-10-12 11:37:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (700, '20003757', 0, '2018-10-12 11:37:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (701, '20003756', 0.02, '2018-10-12 11:38:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (702, '20003757', 0, '2018-10-12 11:38:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (703, '20003756', 0.02, '2018-10-12 11:39:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (704, '20003757', 0, '2018-10-12 11:39:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (705, '20003756', 0.02, '2018-10-12 11:40:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (706, '20003757', 0, '2018-10-12 11:40:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (707, '20003756', 0.02, '2018-10-12 11:41:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (708, '20003757', 0, '2018-10-12 11:41:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (709, '20003756', 0.02, '2018-10-12 11:42:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (710, '20003757', 0, '2018-10-12 11:42:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (711, '20003756', 0.02, '2018-10-12 11:43:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (712, '20003757', 0, '2018-10-12 11:43:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (713, '20003756', 0.02, '2018-10-12 11:44:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (714, '20003757', 0, '2018-10-12 11:44:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (715, '20003756', 0.02, '2018-10-12 11:45:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (716, '20003757', 0, '2018-10-12 11:45:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (717, '20003756', 0.02, '2018-10-12 11:46:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (718, '20003757', 0, '2018-10-12 11:46:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (719, '20003756', 0.02, '2018-10-12 11:47:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (720, '20003757', 0, '2018-10-12 11:47:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (721, '20003756', 0.02, '2018-10-12 11:48:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (722, '20003757', 0, '2018-10-12 11:48:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (723, '20003756', 0.02, '2018-10-12 11:49:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (724, '20003757', 0, '2018-10-12 11:49:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (725, '20003756', 0.02, '2018-10-12 11:50:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (726, '20003757', 0, '2018-10-12 11:50:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (727, '20003756', 0.02, '2018-10-12 11:51:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (728, '20003757', 0, '2018-10-12 11:51:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (729, '20003756', 0.02, '2018-10-12 11:52:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (730, '20003757', 0, '2018-10-12 11:52:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (731, '20003756', 0.02, '2018-10-12 11:53:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (732, '20003757', 0, '2018-10-12 11:53:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (733, '20003756', 0.02, '2018-10-12 11:54:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (734, '20003757', 0, '2018-10-12 11:54:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (735, '20003756', 0.021, '2018-10-12 11:55:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (736, '20003757', 0, '2018-10-12 11:55:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (737, '20003756', 0.021, '2018-10-12 11:56:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (738, '20003757', 0, '2018-10-12 11:56:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (739, '20003756', 0.021, '2018-10-12 11:57:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (740, '20003757', 0, '2018-10-12 11:57:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (741, '20003756', 0.02, '2018-10-12 11:58:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (742, '20003757', 0, '2018-10-12 11:58:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (743, '20003756', 0.021, '2018-10-12 11:59:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (744, '20003757', 0, '2018-10-12 11:59:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (745, '20003756', 0.021, '2018-10-12 12:00:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (746, '20003757', 0, '2018-10-12 12:00:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (747, '20003756', 0.02, '2018-10-12 12:01:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (748, '20003757', 0, '2018-10-12 12:01:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (749, '20003756', 0.021, '2018-10-12 12:02:00.000000');
INSERT INTO `watermonito_noderecord` VALUES (750, '20003757', 0, '2018-10-12 12:02:00.000000');

-- ----------------------------
-- Table structure for watermonito_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `watermonito_userinfo`;
CREATE TABLE `watermonito_userinfo`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctime` datetime(6) NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of watermonito_userinfo
-- ----------------------------
INSERT INTO `watermonito_userinfo` VALUES (1, 'yza8451166', 'xc8451166', 'xc@126.com', '2018-10-02 19:09:14.000000');

SET FOREIGN_KEY_CHECKS = 1;
