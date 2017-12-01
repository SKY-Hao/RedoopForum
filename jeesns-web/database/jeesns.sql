/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jeesns

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-30 16:39:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_action
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action`;
CREATE TABLE `tbl_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态，0正常，1禁用',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_action
-- ----------------------------
INSERT INTO `tbl_action` VALUES ('1', '2017-11-27 17:24:32', '会员注册', '注册了账号', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('2', '2017-11-27 17:24:32', '会员登录', '登录了账号', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3', '2017-11-27 17:24:32', '修改密码', '修改了密码', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('4', '2017-11-27 17:24:32', '找回密码', '找回了密码', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('5', '2017-11-27 17:24:32', '登录失败', '登录失败', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3001', '2017-11-27 17:24:32', '删除微博', '删除了微博', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3002', '2017-11-27 17:24:32', '删除微博评论', '删除了微博评论', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3003', '2017-11-27 17:24:32', '删除群组', '删除了群组', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3004', '2017-11-27 17:24:32', '删除群组帖子', '删除了帖子', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3005', '2017-11-27 17:24:32', '删除群组帖子评论', '删除了帖子评论', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3006', '2017-11-27 17:24:32', '删除文章', '删除文章', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('3007', '2017-11-27 17:24:32', '删除文章评论', '删除了文章评论', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('10001', '2017-11-27 17:24:32', '发布微博', '发布了微博', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('10002', '2017-11-27 17:24:32', '群组发帖', '发布了群组帖子', '0', '2017-11-27 17:24:32');
INSERT INTO `tbl_action` VALUES ('10003', '2017-11-27 17:24:32', '发布文章', '发布了文章', '0', '2017-11-27 17:24:32');

-- ----------------------------
-- Table structure for tbl_action_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_action_log`;
CREATE TABLE `tbl_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0',
  `foreign_id` int(11) DEFAULT '0',
  `action_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_action_log_member` (`member_id`),
  KEY `fk_action_log_action` (`action_id`),
  CONSTRAINT `fk_action_log_action` FOREIGN KEY (`action_id`) REFERENCES `tbl_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_action_log_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_ads
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ads`;
CREATE TABLE `tbl_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1是图片链接，2是文字链接，3是代码',
  `name` varchar(100) DEFAULT NULL COMMENT '广告名称',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `content` varchar(1000) NOT NULL COMMENT '内容，如果是图片链接，该内容为图片地址，如果是文字链接，改内容是文字描述信息，如果是代码，改内容是广告代码',
  `link` varchar(255) DEFAULT NULL COMMENT '链接，图片链接和文字链接类型时才有效',
  `status` int(1) DEFAULT '0' COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_ads
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_archive
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive`;
CREATE TABLE `tbl_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` int(11) DEFAULT '0' COMMENT '发布类型，1是普通文章，2是群组文章',
  `title` varchar(255) DEFAULT NULL COMMENT '文档标题',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) DEFAULT NULL COMMENT '描述说明',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键词',
  `view_rank` int(11) DEFAULT '0' COMMENT '浏览权限，0不限制，1会员',
  `view_count` int(11) DEFAULT '0' COMMENT '浏览次数',
  `writer` varchar(30) DEFAULT '' COMMENT '作者',
  `source` varchar(30) DEFAULT '' COMMENT '来源',
  `pub_time` datetime DEFAULT NULL COMMENT '发布日期',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `last_reply` datetime DEFAULT NULL COMMENT '最后回复时间',
  `can_reply` int(1) DEFAULT '0' COMMENT '是否可以回复，0可以回复，1不可以回复',
  `good_num` int(11) DEFAULT '0' COMMENT '点赞数量',
  `bad_num` int(11) DEFAULT '0' COMMENT '踩数量',
  `check_admin` int(11) DEFAULT '0' COMMENT '审核管理员id',
  `content` text COMMENT '内容',
  `favor` int(11) DEFAULT '0' COMMENT '喜欢、点赞',
  PRIMARY KEY (`archive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_archive
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_archive_favor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archive_favor`;
CREATE TABLE `tbl_archive_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `archive_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_archive_id_member_id` (`archive_id`,`member_id`),
  KEY `fk_archive_favor_member` (`member_id`),
  CONSTRAINT `fk_archive_favor_archive` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_archive_favor_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_archive_favor
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_article
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '栏目ID',
  `archive_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `status` int(11) DEFAULT '0' COMMENT '状态，0未审核，1已审核',
  PRIMARY KEY (`id`),
  KEY `fk_article_archive` (`archive_id`),
  KEY `fk_article_cate` (`cate_id`),
  CONSTRAINT `fk_article_archive` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_cate` FOREIGN KEY (`cate_id`) REFERENCES `tbl_article_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_article
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article_cate`;
CREATE TABLE `tbl_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT '0' COMMENT '上级类目ID，顶级栏目为0',
  `name` varchar(30) DEFAULT NULL COMMENT '栏目名称',
  `status` int(1) DEFAULT '0' COMMENT '0正常，1隐藏',
  `sort` int(11) DEFAULT '50' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_article_cate
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article_comment`;
CREATE TABLE `tbl_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `fk_article_comment_member` (`member_id`),
  KEY `fk_article_comment_article` (`article_id`),
  CONSTRAINT `fk_article_comment_article` FOREIGN KEY (`article_id`) REFERENCES `tbl_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_config`;
CREATE TABLE `tbl_config` (
  `jkey` varchar(100) NOT NULL DEFAULT '',
  `jvalue` varchar(500) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`jkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_config
-- ----------------------------
INSERT INTO `tbl_config` VALUES ('cms_post', '1', 'cms会员文章投稿，0关闭，1开启');
INSERT INTO `tbl_config` VALUES ('cms_post_review', '0', 'cms投稿审核，0需要审核，1不需要审核');
INSERT INTO `tbl_config` VALUES ('group_alias', '群组', '群组别名');
INSERT INTO `tbl_config` VALUES ('group_apply', '1', '群组是否可以申请，0不可以，1可以');
INSERT INTO `tbl_config` VALUES ('group_apply_review', '1', '群组申请是否需要审核，0需要审核，1不需要审核');
INSERT INTO `tbl_config` VALUES ('member_email_valid', '0', '邮箱验证，0不需要验证，1需要验证');
INSERT INTO `tbl_config` VALUES ('member_login_open', '1', '会员登录开关，0关闭，1开启');
INSERT INTO `tbl_config` VALUES ('member_register_open', '1', '会员注册开关，0关闭，1开启');
INSERT INTO `tbl_config` VALUES ('site_copyright', 'Copyright © 2012 - 2017.', '版权说明');
INSERT INTO `tbl_config` VALUES ('site_description', 'RedoopForum社区', '网站描述');
INSERT INTO `tbl_config` VALUES ('site_domain', 'www.redoop.com', '网站域名');
INSERT INTO `tbl_config` VALUES ('site_icp', '京ICP备17046370号', '备案号');
INSERT INTO `tbl_config` VALUES ('site_keys', 'redoop,RedoopForum,java', '网站关键词');
INSERT INTO `tbl_config` VALUES ('site_logo', '/res/common/images/RedoopLogo.png', '网站LOGO');
INSERT INTO `tbl_config` VALUES ('site_name', 'Redoop', '网站名称');
INSERT INTO `tbl_config` VALUES ('site_send_email_account', 'bd@redoop.com', '发送邮箱账号');
INSERT INTO `tbl_config` VALUES ('site_send_email_password', '', '发送邮箱密码');
INSERT INTO `tbl_config` VALUES ('site_send_email_smtp', '', '发送邮箱SMTP服务器地址');
INSERT INTO `tbl_config` VALUES ('site_seo_title', 'RedoopForum社区', 'SEO标题');
INSERT INTO `tbl_config` VALUES ('site_tongji', '<script>var _hmt = _hmt || [];(function() {var hm = document.createElement(\"script\");hm.src = \"https://hm.baidu.com/hm.js?6e79d941db914e4195f4a839b06f2567\";var s = document.getElementsByTagName(\"script\")[0]; s.parentNode.insertBefore(hm, s);})();</script>', '统计代码');
INSERT INTO `tbl_config` VALUES ('weibo_alias', '微博', '微博别名');
INSERT INTO `tbl_config` VALUES ('weibo_post', '0', '微博发布，0不可以发布，1可以发布');
INSERT INTO `tbl_config` VALUES ('weibo_post_maxcontent', '140', '微博内容字数');

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '群组名字',
  `logo` varchar(255) DEFAULT NULL COMMENT '群组logo',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `managers` varchar(200) DEFAULT NULL COMMENT '管理员',
  `tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `introduce` varchar(255) DEFAULT NULL COMMENT '介绍',
  `can_post` int(11) DEFAULT '0' COMMENT '是否能发帖，0不可以，1可以',
  `topic_review` int(11) DEFAULT '0' COMMENT '帖子是否需要审核，0不需要，1需要',
  `status` int(11) DEFAULT '0' COMMENT '0未审核，1已审核，-1审核不通过',
  PRIMARY KEY (`id`),
  KEY `fk_group_member` (`creator`),
  CONSTRAINT `fk_group_member` FOREIGN KEY (`creator`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_group
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_group_fans
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_fans`;
CREATE TABLE `tbl_group_fans` (
  `create_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  UNIQUE KEY `uk_group_id_member_id` (`group_id`,`member_id`),
  KEY `fk_group_fans_member` (`member_id`),
  CONSTRAINT `fk_group_fans_group` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_fans_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_group_fans
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_group_topic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_topic`;
CREATE TABLE `tbl_group_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `archive_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态，0未审核，1已审核',
  `is_essence` int(11) DEFAULT '0' COMMENT '精华，0不加精，1加精',
  `is_top` int(11) DEFAULT '0' COMMENT '置顶，0不置顶，1置顶，2超级置顶',
  PRIMARY KEY (`id`),
  KEY `fk_group_topic_group` (`group_id`),
  KEY `fk_group_topic_archive` (`archive_id`),
  CONSTRAINT `fk_group_topic_archive` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_topic_group` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_group_topic
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_group_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group_topic_comment`;
CREATE TABLE `tbl_group_topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_topic_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `fk_group_topic_comment_member` (`member_id`),
  KEY `fk_group_topic_comment_group_topic` (`group_topic_id`),
  CONSTRAINT `fk_group_topic_comment_group_topic` FOREIGN KEY (`group_topic_id`) REFERENCES `tbl_group_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_topic_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_group_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_link
-- ----------------------------
DROP TABLE IF EXISTS `tbl_link`;
CREATE TABLE `tbl_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '网站名称',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `recomment` int(11) NOT NULL DEFAULT '0' COMMENT '推荐，0不推荐，1推荐',
  `status` int(1) DEFAULT '0' COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_link
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0' COMMENT '分组ID',
  `name` varchar(50) DEFAULT NULL COMMENT '会员名称',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `phone` varchar(11) DEFAULT '' COMMENT '手机号码',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `regip` varchar(15) DEFAULT '' COMMENT '注册IP',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  `curr_login_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `curr_login_ip` varchar(15) DEFAULT NULL COMMENT '本次登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '上次登录IP',
  `update_time` datetime DEFAULT NULL COMMENT '更新资料时间',
  `money` double(11,2) DEFAULT '0.00' COMMENT '金额',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `is_active` int(1) DEFAULT '0' COMMENT '是否已激活，0未激活，1已激活',
  `status` int(2) DEFAULT '0' COMMENT '-1禁用，0启用',
  `birthday` varchar(10) DEFAULT NULL COMMENT '生日',
  `addprovince` varchar(20) DEFAULT '' COMMENT '居住省份',
  `addcity` varchar(20) DEFAULT '' COMMENT '居住城市',
  `addarea` varchar(20) DEFAULT '' COMMENT '居住地区',
  `address` varchar(50) DEFAULT '' COMMENT '居住地址',
  `qq` varchar(15) DEFAULT '' COMMENT 'QQ',
  `wechat` varchar(20) DEFAULT '' COMMENT '微信',
  `contact_phone` varchar(11) DEFAULT '' COMMENT '联系手机号',
  `contact_email` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `website` varchar(50) DEFAULT '' COMMENT '个人网站',
  `introduce` varchar(255) DEFAULT '' COMMENT '个人介绍',
  `is_admin` int(11) DEFAULT '0' COMMENT '是否管理员，0不是，1是普通管理员，2是超级管理员',
  `follows` int(11) DEFAULT '0' COMMENT '关注会员数量',
  `fans` int(11) DEFAULT '0' COMMENT '粉丝数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_member
-- ----------------------------
INSERT INTO `tbl_member` VALUES ('1', '0', 'admin', 'huangtianhao@redoop.com', '18515670511', '5df8e1af83c3327d2d326e10bf5c870f', '男', '/res/common/images/default-avatar.png', '2017-11-27 17:24:32', '', '76', '2017-11-30 16:29:02', '0:0:0:0:0:0:0:1', '2017-11-30 16:08:16', '0:0:0:0:0:0:0:1', null, '0.00', '100001', '1', '0', '1971-12-20', '', '', '', '', '8888888', 'admin', '18515670511', 'redoop@redoop.com', 'www.redoop.com', '', '2', '0', '0');

-- ----------------------------
-- Table structure for tbl_member_fans
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_fans`;
CREATE TABLE `tbl_member_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `follow_who` int(11) DEFAULT '0',
  `who_follow` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_follow_who_who_follow` (`follow_who`,`who_follow`),
  KEY `fk_member_fans_who_follow` (`who_follow`),
  CONSTRAINT `fk_member_fans_follow_who` FOREIGN KEY (`follow_who`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_member_fans_who_follow` FOREIGN KEY (`who_follow`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_member_fans
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_member_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member_token`;
CREATE TABLE `tbl_member_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT '0' COMMENT '会员ID',
  `token` varchar(32) DEFAULT '',
  `expire_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态，0是正常，1是失效',
  PRIMARY KEY (`id`),
  KEY `fk_member_token_member` (`member_id`),
  CONSTRAINT `fk_member_token_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_member_token
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_memgroup
-- ----------------------------
DROP TABLE IF EXISTS `tbl_memgroup`;
CREATE TABLE `tbl_memgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isadmin` int(1) DEFAULT '0' COMMENT '是否是管理组，0不是，1是',
  `name` varchar(50) DEFAULT '' COMMENT '分组名称',
  `fid` int(11) DEFAULT '0' COMMENT '上级分组ID，默认0，0是顶级分组',
  `rankid` int(11) DEFAULT '0' COMMENT '权限ID，0-99是会员权限，100以上是管理员权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_memgroup
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `from_member_id` int(11) DEFAULT '0',
  `to_member_id` int(11) DEFAULT '0',
  `content` text,
  `url` varchar(255) DEFAULT NULL,
  `app_tag` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `relate_key_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `isread` int(1) DEFAULT '0' COMMENT '是否已读，0未读，1已读',
  PRIMARY KEY (`id`),
  KEY `fk_message_from_member` (`from_member_id`),
  KEY `fk_message_to_member` (`to_member_id`),
  KEY `fk_message_member` (`member_id`),
  CONSTRAINT `fk_message_from_member` FOREIGN KEY (`from_member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_to_member` FOREIGN KEY (`to_member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_message
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_picture
-- ----------------------------
DROP TABLE IF EXISTS `tbl_picture`;
CREATE TABLE `tbl_picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '1是文章图片，2是群组帖子图片，3是微博图片',
  `foreign_id` int(11) DEFAULT NULL COMMENT '外键ID',
  `path` varchar(255) NOT NULL COMMENT '图片路径',
  `thumbnail_path` varchar(255) DEFAULT NULL COMMENT '缩小的图片路径',
  `md5` varchar(32) NOT NULL,
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_picture
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_score_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_score_detail`;
CREATE TABLE `tbl_score_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT '0' COMMENT '会员ID',
  `type` int(11) DEFAULT '0' COMMENT '类型，0是普通积分增加，1是奖励，2是撤销奖励',
  `score` int(11) DEFAULT '0' COMMENT '变化积分',
  `balance` int(11) DEFAULT '0' COMMENT '账户剩余积分',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  `foreign_id` int(11) DEFAULT '0' COMMENT '外键ID',
  `score_rule_id` int(11) DEFAULT '0' COMMENT '积分规则ID',
  `status` int(11) DEFAULT '1' COMMENT '状态，1是成功，0是取消',
  PRIMARY KEY (`id`),
  KEY `fk_score_detail_member` (`member_id`),
  KEY `fk_score_detail_score_rule` (`score_rule_id`),
  CONSTRAINT `fk_score_detail_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_score_detail_score_rule` FOREIGN KEY (`score_rule_id`) REFERENCES `tbl_score_rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_score_detail
-- ----------------------------
INSERT INTO `tbl_score_detail` VALUES ('41', '2017-11-30 16:29:02', '1', '1', '1', '100001', '每天登陆奖励', '0', '3', '1');

-- ----------------------------
-- Table structure for tbl_score_rule
-- ----------------------------
DROP TABLE IF EXISTS `tbl_score_rule`;
CREATE TABLE `tbl_score_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(30) DEFAULT '0' COMMENT '规则名称',
  `score` int(11) DEFAULT '0' COMMENT '变化积分',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  `type` varchar(10) DEFAULT 'unlimite' COMMENT '奖励次数类型，day每天一次，week每周一次，month每月一次，year每年一次，one只有一次，unlimite不限次数',
  `status` int(11) DEFAULT '1' COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_score_rule
-- ----------------------------
INSERT INTO `tbl_score_rule` VALUES ('1', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '注册奖励', '100', '注册奖励', 'one', '0');
INSERT INTO `tbl_score_rule` VALUES ('2', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '邮箱认证', '1', '邮箱认证奖励积分，只有一次', 'one', '1');
INSERT INTO `tbl_score_rule` VALUES ('3', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '每天登陆奖励', '1', '每天登陆奖励积分，一天仅限一次', 'day', '0');
INSERT INTO `tbl_score_rule` VALUES ('4', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '文章投稿', '1', '文章投稿奖励积分，如需审核，审核之后奖励', 'unlimite', '0');
INSERT INTO `tbl_score_rule` VALUES ('5', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '文章评论', '1', '评论文章奖励积分', 'unlimite', '0');
INSERT INTO `tbl_score_rule` VALUES ('6', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '文章收到喜欢', '1', '文章收到喜欢，作者奖励积分', 'unlimite', '0');
INSERT INTO `tbl_score_rule` VALUES ('7', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '发布微博', '1', '发布微博奖励积分', 'unlimite', '1');
INSERT INTO `tbl_score_rule` VALUES ('8', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '评论微博', '1', '评论微博奖励积分', 'unlimite', '1');
INSERT INTO `tbl_score_rule` VALUES ('9', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '微博收到点赞', '1', '微博收到点赞，作者奖励积分', 'unlimite', '1');
INSERT INTO `tbl_score_rule` VALUES ('10', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '申请群组', '-10', '申请群组扣除/奖励积分，如需要扣除积分，请填写负数', 'unlimite', '1');
INSERT INTO `tbl_score_rule` VALUES ('11', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '群组发帖', '1', '群组发帖奖励积分，如需审核，审核之后奖励', 'unlimite', '0');
INSERT INTO `tbl_score_rule` VALUES ('12', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '群组帖子评论', '1', '群组帖子评论奖励积分', 'unlimite', '0');
INSERT INTO `tbl_score_rule` VALUES ('13', '2017-11-27 17:24:32', '2017-11-27 17:24:32', '群组帖子收到喜欢', '1', '群组帖子收到喜欢奖励积分', 'unlimite', '0');

-- ----------------------------
-- Table structure for tbl_validate_code
-- ----------------------------
DROP TABLE IF EXISTS `tbl_validate_code`;
CREATE TABLE `tbl_validate_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `email` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(50) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT '0' COMMENT '1是重置密码，2会员激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_validate_code
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_weibo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weibo`;
CREATE TABLE `tbl_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` int(11) DEFAULT '0' COMMENT '0为普通文本,1为图片',
  `content` varchar(1000) DEFAULT NULL,
  `favor` int(11) DEFAULT '0' COMMENT '赞',
  `status` tinyint(11) DEFAULT '0' COMMENT '0未审核，1已审核，-1审核不通过',
  PRIMARY KEY (`id`),
  KEY `fk_weibo_member` (`member_id`),
  CONSTRAINT `fk_weibo_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_weibo
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_weibo_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weibo_comment`;
CREATE TABLE `tbl_weibo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `weibo_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论的id',
  `content` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0正常，1禁用',
  PRIMARY KEY (`id`),
  KEY `fk_weibo_comment_member` (`member_id`),
  KEY `fk_weibo_comment_weibo` (`weibo_id`),
  CONSTRAINT `fk_weibo_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_weibo_comment_weibo` FOREIGN KEY (`weibo_id`) REFERENCES `tbl_weibo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_weibo_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_weibo_favor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_weibo_favor`;
CREATE TABLE `tbl_weibo_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `weibo_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_weibo_id_member_id` (`weibo_id`,`member_id`),
  KEY `fk_weibo_favor_member` (`member_id`),
  CONSTRAINT `fk_weibo_favor_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_weibo_favor_weibo` FOREIGN KEY (`weibo_id`) REFERENCES `tbl_weibo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_weibo_favor
-- ----------------------------
