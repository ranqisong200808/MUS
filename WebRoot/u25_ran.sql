/*
Navicat MySQL Data Transfer

Source Server         : ransong
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : u25_ran

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-09-05 22:16:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `family`
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `fid` int(11) NOT NULL auto_increment,
  `student_id` int(11) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `birthtime` datetime default NULL,
  `politics` varchar(20) default NULL,
  `education` varchar(20) default NULL,
  `address` varchar(50) default NULL,
  `newaddress` varchar(50) default NULL,
  `idtype` varchar(50) default NULL,
  `idcardno` varchar(18) default NULL,
  `workunit` varchar(50) default NULL,
  `phone` varchar(20) default NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES ('1', '1', '父子', '张永福', '1993-01-01 00:00:00', '群众', '高中毕业', '重庆市江北区观音桥电测村30号', '重庆市綦江县', '身份证', '50023819940202222x', '綦江县公安分局', '15696464332');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `url` varchar(100) default NULL,
  `isshow` int(11) default '1',
  `level` int(11) default NULL,
  `parentid` int(11) default NULL,
  PRIMARY KEY  (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统根菜单', '#', '1', '1', '-1');
INSERT INTO `menu` VALUES ('2', '招生管理', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('3', '助学中心', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('4', '教育管理', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('5', '学生信息', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('6', '队伍建设', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('7', '就业管理', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('8', '文档管理', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('9', '学生工作管理', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('10', '系统管理', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('11', '其它', '#', '1', '2', '1');
INSERT INTO `menu` VALUES ('12', '新生数据管理', '#', '1', '3', '2');
INSERT INTO `menu` VALUES ('13', '统计分析', '#', '1', '3', '2');
INSERT INTO `menu` VALUES ('14', '成绩查询', '#', '1', '3', '2');
INSERT INTO `menu` VALUES ('15', '交互平台', '#', '1', '3', '2');
INSERT INTO `menu` VALUES ('16', '助学贷款管理', '#', '1', '3', '3');
INSERT INTO `menu` VALUES ('17', '绿色通道', '#', '1', '3', '3');
INSERT INTO `menu` VALUES ('18', '学费减免', '#', '1', '3', '3');
INSERT INTO `menu` VALUES ('19', '奖助项目', '#', '1', '3', '3');
INSERT INTO `menu` VALUES ('20', '统计分析', '#', '1', '3', '3');
INSERT INTO `menu` VALUES ('21', '学生奖励管理', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('22', '学生违纪信息', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('23', '学生干部管理', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('24', '学生党员管理', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('25', '学生德育成绩评定', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('26', '学生档案管理', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('27', '学生心理健康管理', '#', '1', '3', '4');
INSERT INTO `menu` VALUES ('28', '就业管理', '#', '1', '3', '9');
INSERT INTO `menu` VALUES ('29', '心理健康', '#', '1', '3', '9');
INSERT INTO `menu` VALUES ('30', '日常业务', '#', '1', '3', '9');
INSERT INTO `menu` VALUES ('31', '助学中心', '#', '1', '3', '9');
INSERT INTO `menu` VALUES ('32', '招生管理', '#', '1', '3', '9');
INSERT INTO `menu` VALUES ('33', '心理健康资料', '#', '1', '3', '8');
INSERT INTO `menu` VALUES ('34', '助学资料', '#', '1', '3', '8');
INSERT INTO `menu` VALUES ('35', '就业资料', '#', '1', '3', '8');
INSERT INTO `menu` VALUES ('36', '招生资料', '#', '1', '3', '8');
INSERT INTO `menu` VALUES ('37', '学生基本信息', 'view/showStudents.jsp', '1', '3', '5');
INSERT INTO `menu` VALUES ('38', '辅导员管理', '#', '1', '3', '6');
INSERT INTO `menu` VALUES ('39', '就业信息管理', '#', '1', '3', '7');
INSERT INTO `menu` VALUES ('40', '用人单位管理', '#', '1', '3', '7');
INSERT INTO `menu` VALUES ('41', '交互平台', '#', '1', '3', '7');
INSERT INTO `menu` VALUES ('42', '统计分析', '#', '1', '3', '7');
INSERT INTO `menu` VALUES ('43', '角色管理', 'view/showRole.jsp', '1', '3', '10');
INSERT INTO `menu` VALUES ('44', '权限管理', 'view/showMenus.jsp', '1', '3', '10');
INSERT INTO `menu` VALUES ('45', '修改密码', 'view/amendPass.jsp', '1', '3', '11');
INSERT INTO `menu` VALUES ('46', '系统操作日志', '#', '1', '3', '10');
INSERT INTO `menu` VALUES ('47', '学生家庭信息', 'view/showFamily.jsp', '1', '3', '5');
INSERT INTO `menu` VALUES ('48', '学生资助信息', 'view/showSubsidize.jsp', '1', '3', '5');
INSERT INTO `menu` VALUES ('49', '学生奖励信息', '#', '1', '3', '5');
INSERT INTO `menu` VALUES ('50', '学生户口信息', '#', '1', '3', '5');
INSERT INTO `menu` VALUES ('51', '学生素质评估', '#', '1', '3', '5');
INSERT INTO `menu` VALUES ('52', '学生违纪信息', '#', '1', '3', '5');
INSERT INTO `menu` VALUES ('53', '学生保险信息', '#', '1', '3', '5');
INSERT INTO `menu` VALUES ('54', '学生成绩信息', '#', '1', '3', '5');
INSERT INTO `menu` VALUES ('62', '学生简历信息', '#', '1', '3', '5');

-- ----------------------------
-- Table structure for `menu_copy`
-- ----------------------------
DROP TABLE IF EXISTS `menu_copy`;
CREATE TABLE `menu_copy` (
  `menu_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `url` varchar(100) default NULL,
  `isshow` int(11) default '1',
  `level` int(11) default NULL,
  `parentid` int(11) default NULL,
  PRIMARY KEY  (`menu_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_copy
-- ----------------------------
INSERT INTO `menu_copy` VALUES ('1', '系统根菜单', '#', '0', '1', '-1');
INSERT INTO `menu_copy` VALUES ('2', '招生管理', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('3', '助学中心', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('4', 'aaaa', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('5', '22222222', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('6', '222', '#', '1', '3', '5');
INSERT INTO `menu_copy` VALUES ('7', '1111', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('8', '111111111111', '#', '1', '3', '5');
INSERT INTO `menu_copy` VALUES ('9', '1111111111', '#', '1', '3', '5');
INSERT INTO `menu_copy` VALUES ('10', '11111', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('11', '1', '#', '1', '3', '2');
INSERT INTO `menu_copy` VALUES ('12', '辅导员信4', '#', '1', '3', '3');
INSERT INTO `menu_copy` VALUES ('13', '学生列表4', '#', '1', '3', '4');
INSERT INTO `menu_copy` VALUES ('14', '学生档案4', '#', '1', '3', '7');
INSERT INTO `menu_copy` VALUES ('15', '角色管理4', '#', '1', '3', '10');
INSERT INTO `menu_copy` VALUES ('16', '权限管理4', '#', '1', '3', '10');
INSERT INTO `menu_copy` VALUES ('17', '系统操4日志', '#', '1', '3', '10');
INSERT INTO `menu_copy` VALUES ('18', '其他4', '#', '1', '2', '1');
INSERT INTO `menu_copy` VALUES ('19', '修改密码4', '#', '1', '3', '18');
INSERT INTO `menu_copy` VALUES ('20', '查看个人登录日志4', '#', '1', '3', '18');

-- ----------------------------
-- Table structure for `result`
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `rid` int(11) NOT NULL auto_increment,
  `student_id` int(11) NOT NULL,
  `course` varchar(50) NOT NULL,
  `score` double(5,1) default '0.0',
  PRIMARY KEY  (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('1', '1', '语文', '99.0');
INSERT INTO `result` VALUES ('2', '1', '数学', '100.0');
INSERT INTO `result` VALUES ('3', '1', '外语', '80.0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY  (`role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('5', '二级单位管理员');
INSERT INTO `role` VALUES ('12', '信息中心操作员');
INSERT INTO `role` VALUES ('2', '助学中心操作员');
INSERT INTO `role` VALUES ('10', '学生');
INSERT INTO `role` VALUES ('6', '学生信息录入员');
INSERT INTO `role` VALUES ('3', '学生教育管理科操作员');
INSERT INTO `role` VALUES ('1', '招生办操作员');
INSERT INTO `role` VALUES ('9', '教务职称审核人员');
INSERT INTO `role` VALUES ('4', '普通职工');
INSERT INTO `role` VALUES ('11', '系统管理员');
INSERT INTO `role` VALUES ('7', '网上报名人员');
INSERT INTO `role` VALUES ('8', '财务系统操作员');

-- ----------------------------
-- Table structure for `rolemenu`
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `rmid` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL,
  `menu_id` int(11) default NULL,
  PRIMARY KEY  (`rmid`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES ('271', '11', '1');
INSERT INTO `rolemenu` VALUES ('272', '11', '2');
INSERT INTO `rolemenu` VALUES ('273', '11', '3');
INSERT INTO `rolemenu` VALUES ('274', '11', '4');
INSERT INTO `rolemenu` VALUES ('275', '11', '5');
INSERT INTO `rolemenu` VALUES ('276', '11', '6');
INSERT INTO `rolemenu` VALUES ('277', '11', '7');
INSERT INTO `rolemenu` VALUES ('278', '11', '8');
INSERT INTO `rolemenu` VALUES ('279', '11', '9');
INSERT INTO `rolemenu` VALUES ('280', '11', '10');
INSERT INTO `rolemenu` VALUES ('281', '11', '11');
INSERT INTO `rolemenu` VALUES ('282', '11', '12');
INSERT INTO `rolemenu` VALUES ('283', '11', '13');
INSERT INTO `rolemenu` VALUES ('284', '11', '14');
INSERT INTO `rolemenu` VALUES ('285', '11', '15');
INSERT INTO `rolemenu` VALUES ('286', '11', '16');
INSERT INTO `rolemenu` VALUES ('287', '11', '17');
INSERT INTO `rolemenu` VALUES ('288', '11', '18');
INSERT INTO `rolemenu` VALUES ('289', '11', '19');
INSERT INTO `rolemenu` VALUES ('290', '11', '20');
INSERT INTO `rolemenu` VALUES ('291', '11', '21');
INSERT INTO `rolemenu` VALUES ('292', '11', '22');
INSERT INTO `rolemenu` VALUES ('293', '11', '23');
INSERT INTO `rolemenu` VALUES ('294', '11', '24');
INSERT INTO `rolemenu` VALUES ('295', '11', '25');
INSERT INTO `rolemenu` VALUES ('296', '11', '26');
INSERT INTO `rolemenu` VALUES ('297', '11', '27');
INSERT INTO `rolemenu` VALUES ('298', '11', '28');
INSERT INTO `rolemenu` VALUES ('299', '11', '29');
INSERT INTO `rolemenu` VALUES ('300', '11', '30');
INSERT INTO `rolemenu` VALUES ('301', '11', '31');
INSERT INTO `rolemenu` VALUES ('302', '11', '32');
INSERT INTO `rolemenu` VALUES ('303', '11', '33');
INSERT INTO `rolemenu` VALUES ('304', '11', '34');
INSERT INTO `rolemenu` VALUES ('305', '11', '35');
INSERT INTO `rolemenu` VALUES ('306', '11', '36');
INSERT INTO `rolemenu` VALUES ('307', '11', '37');
INSERT INTO `rolemenu` VALUES ('308', '11', '38');
INSERT INTO `rolemenu` VALUES ('309', '11', '39');
INSERT INTO `rolemenu` VALUES ('310', '11', '40');
INSERT INTO `rolemenu` VALUES ('311', '11', '41');
INSERT INTO `rolemenu` VALUES ('312', '11', '42');
INSERT INTO `rolemenu` VALUES ('313', '11', '43');
INSERT INTO `rolemenu` VALUES ('314', '11', '44');
INSERT INTO `rolemenu` VALUES ('315', '11', '45');
INSERT INTO `rolemenu` VALUES ('316', '11', '46');
INSERT INTO `rolemenu` VALUES ('317', '11', '47');
INSERT INTO `rolemenu` VALUES ('318', '11', '48');
INSERT INTO `rolemenu` VALUES ('319', '11', '49');
INSERT INTO `rolemenu` VALUES ('320', '11', '50');
INSERT INTO `rolemenu` VALUES ('321', '11', '51');
INSERT INTO `rolemenu` VALUES ('322', '11', '52');
INSERT INTO `rolemenu` VALUES ('323', '11', '53');
INSERT INTO `rolemenu` VALUES ('324', '11', '54');
INSERT INTO `rolemenu` VALUES ('325', '11', '62');
INSERT INTO `rolemenu` VALUES ('326', '10', '5');
INSERT INTO `rolemenu` VALUES ('327', '10', '11');
INSERT INTO `rolemenu` VALUES ('328', '10', '45');
INSERT INTO `rolemenu` VALUES ('329', '10', '47');
INSERT INTO `rolemenu` VALUES ('330', '10', '48');
INSERT INTO `rolemenu` VALUES ('331', '10', '49');
INSERT INTO `rolemenu` VALUES ('332', '10', '50');
INSERT INTO `rolemenu` VALUES ('333', '10', '51');
INSERT INTO `rolemenu` VALUES ('334', '10', '52');
INSERT INTO `rolemenu` VALUES ('335', '10', '53');
INSERT INTO `rolemenu` VALUES ('336', '10', '54');
INSERT INTO `rolemenu` VALUES ('337', '7', '11');
INSERT INTO `rolemenu` VALUES ('338', '7', '45');
INSERT INTO `rolemenu` VALUES ('339', '12', '11');
INSERT INTO `rolemenu` VALUES ('340', '12', '45');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL auto_increment,
  `snumber` varchar(11) NOT NULL,
  `loginPass` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `sex` int(11) default NULL,
  `age` int(11) default NULL,
  `phone` varchar(11) default NULL,
  `IDcard` varchar(18) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY  (`staff_id`),
  UNIQUE KEY `snumber` (`snumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'u201225', '123', '冉啟松', '1', '0', '15696161338', '11', '1');
INSERT INTO `staff` VALUES ('2', 'u201224', '123', '周润发', '1', '20', '1515151515', '12', '1');

-- ----------------------------
-- Table structure for `staffrole`
-- ----------------------------
DROP TABLE IF EXISTS `staffrole`;
CREATE TABLE `staffrole` (
  `sr_id` int(11) NOT NULL auto_increment,
  `staff_id` int(11) default NULL,
  `role_id` int(11) default NULL,
  PRIMARY KEY  (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffrole
-- ----------------------------
INSERT INTO `staffrole` VALUES ('1', '1', '11');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL auto_increment,
  `snumber` varchar(11) NOT NULL,
  `loginPass` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `sex` int(11) default NULL,
  `age` int(11) default NULL,
  `isenroll` int(11) NOT NULL,
  `isreport` int(11) NOT NULL,
  `indate` datetime default NULL,
  `ingrade` double(4,1) default NULL,
  `college` varchar(40) NOT NULL,
  `major` varchar(40) NOT NULL,
  `sclass` varchar(40) NOT NULL,
  `phone` varchar(20) default NULL,
  `qq` varchar(20) default NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `snumber` (`snumber`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 's2012001', '123', '张三', '1', '18', '1', '1', '2015-09-01 00:00:00', '560.0', '财经系', '财务管理专业', '2', '15696161387', '649662885');
INSERT INTO `student` VALUES ('2', 's2012002', '123', '李四', '1', '19', '1', '1', '2014-09-01 00:00:00', '480.0', '财经系', '会计学专业', '1', '15623545666', '66666666');
INSERT INTO `student` VALUES ('3', 's2012003', '123', '安祉臣', '1', '17', '1', '1', '2013-09-01 00:00:00', '500.0', '财经系', '会计学专业', '1', '15696161332', '555444111');
INSERT INTO `student` VALUES ('4', 's2012004', '123', '孙荣大', '1', '19', '1', '1', '2014-09-01 00:00:00', '460.0', '财经系', '金融学专业', '1', '13478945666', '963654159');
INSERT INTO `student` VALUES ('5', 's2012005', '123', '宋明瑶', '2', '20', '1', '1', '2015-09-01 00:00:00', '496.0', '财经系', '金融学专业', '2', '15694564656', '465454415');
INSERT INTO `student` VALUES ('6', 's2012006', '123', '杨宗航', '1', '18', '1', '1', '2015-09-01 21:01:51', '460.0', '财经系', '经济学专业', '2', '15694565456', '564111488');
INSERT INTO `student` VALUES ('7', 's2012007', '123', '李正彭', '1', '18', '1', '1', '2016-09-05 21:01:47', '440.0', '财经系', '财务管理专业', '1', '13456465412', '123156545');
INSERT INTO `student` VALUES ('8', 's2012008', '123', '孙嘉言', '2', '17', '1', '1', '2015-09-01 00:00:00', '500.0', '财经系', '电子商务专业', '1', '18745445644', '245215456');
INSERT INTO `student` VALUES ('9', 's2012009', '123', '张泮祺', '2', '18', '1', '1', '2014-09-01 21:04:28', '500.0', '财经系', '经济学专业', '1', '13515465515', '5645641154');
INSERT INTO `student` VALUES ('10', 's2012010', '123', '李尚林', '2', '18', '1', '1', '2015-09-01 00:00:00', '500.0', '文法系', '法学专业', '2', '15361561255', '544145645');
INSERT INTO `student` VALUES ('11', 's2012011', '123', '张宜芳', '2', '18', '1', '1', '2015-09-01 21:08:35', '450.0', '文法系', '法学专业', ' 2', '15484515641', '1445455165');
INSERT INTO `student` VALUES ('12', 's2012012', '123', '万雨辰', '2', '18', '1', '1', '2016-09-01 21:10:20', '500.0', '文法系', '汉语言文学专业', ' 2', '15648451454', '254654654');
INSERT INTO `student` VALUES ('13', 's2012013', '123', '李博一', '1', '18', '0', '0', '2015-09-01 21:11:39', '520.0', '文法系', '小学教育专业', '3', '14156132156', '21120.1515');
INSERT INTO `student` VALUES ('14', 's2012014', '123', '吴政航', '1', '19', '1', '1', '2014-09-01 21:12:56', '455.0', '文法系', '广告学专业', '1', '13944154646', '5416541321');
INSERT INTO `student` VALUES ('15', 's2012015', '123', '史金梁', '1', '19', '1', '1', '2015-09-01 21:14:24', '512.0', '文法系', '广告学专业', '1', '13456465456', '564613544');
INSERT INTO `student` VALUES ('16', 's2012016', '123', '徐豪', '1', '18', '1', '1', '2015-09-01 21:27:04', '510.0', '管理系', '行政管理', '1', '13914154654', '254561351');
INSERT INTO `student` VALUES ('17', 's2012017', '123', '李嘉龙', '1', '19', '1', '1', '2014-09-01 21:29:48', '490.0', '管理系', '公共事业管理', '2', '15654651232', '216541321');
INSERT INTO `student` VALUES ('18', 's2012018', '123', '段筱诺', '2', '17', '1', '1', '2015-09-01 21:31:44', '450.0', '管理系', '工商管理专业', '1', '13915456141', '541654515');
INSERT INTO `student` VALUES ('19', 's2012019', '123', '董南汐', '2', '19', '1', '1', '2015-09-01 21:34:12', '399.0', '管理系', '人力资源管理', '2', '15695546545', '322156435');
INSERT INTO `student` VALUES ('20', 's2012020', '123', '张语芪', '2', '20', '1', '1', '2015-09-01 21:35:35', '460.0', '管理系', '物业管理专业', '2', '18745445644', '245135465');
INSERT INTO `student` VALUES ('21', 's2012021', '123', '杨嘉琪', '2', '21', '1', '1', '2015-09-01 21:37:20', '500.0', '管理系', '房地产经营管理', '3', '18715464554', '546454564');
INSERT INTO `student` VALUES ('22', 's2012022', '123', '刘珈彤', '2', '20', '1', '1', '2015-09-01 21:39:02', '490.0', '管理系', '旅游管理专业', '2', '18756465456', '324654254');
INSERT INTO `student` VALUES ('23', 's2012023', '123', '李珏蓉蓉', '2', '17', '1', '1', '2014-09-01 21:40:40', '494.0', '管理系', '社会工作专业', '1', '18741564654', '215435415');
INSERT INTO `student` VALUES ('24', 's2012024', '123', '金沫含', '2', '19', '1', '1', '2015-09-01 21:42:01', '500.0', '管理系', '物流管理专业', '1', '18745464545', '524654534');

-- ----------------------------
-- Table structure for `student_copy`
-- ----------------------------
DROP TABLE IF EXISTS `student_copy`;
CREATE TABLE `student_copy` (
  `student_id` int(11) NOT NULL auto_increment,
  `snumber` varchar(11) NOT NULL,
  `loginPass` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `sex` int(11) default NULL,
  `age` int(11) default NULL,
  `indate` datetime default NULL,
  `grad` int(11) default NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `snumber` (`snumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_copy
-- ----------------------------
INSERT INTO `student_copy` VALUES ('1', 's2012001', '123', '张三', '1', '16', '1992-08-25 00:00:00', '1');
INSERT INTO `student_copy` VALUES ('2', 's2012002', '123', '李四', '1', '18', '2016-09-12 00:00:00', '1');
INSERT INTO `student_copy` VALUES ('3', 's2012003', '123', '周芷若', '2', '17', '2014-08-13 00:00:00', '1');

-- ----------------------------
-- Table structure for `subsidize`
-- ----------------------------
DROP TABLE IF EXISTS `subsidize`;
CREATE TABLE `subsidize` (
  `sid` int(11) NOT NULL auto_increment,
  `student_id` int(11) NOT NULL,
  `subtype` varchar(50) default NULL,
  `submoney` double(10,2) default NULL,
  `sponsor` varchar(50) default NULL,
  `subtime` datetime default NULL,
  `notes` varchar(100) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subsidize
-- ----------------------------
INSERT INTO `subsidize` VALUES ('1', '1', '贫困生生活补助', '1200.00', '助学中心', '2016-09-05 00:00:00', '生活补助');
