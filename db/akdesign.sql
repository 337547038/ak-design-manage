-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-02-02 09:36:32
-- 服务器版本： 10.4.27-MariaDB
-- PHP 版本： 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `akdesign`
--

-- --------------------------------------------------------

--
-- 表的结构 `ak-customer`
--

CREATE TABLE `ak-customer` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `intention` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='客户信息管理';

--
-- 转存表中的数据 `ak-customer`
--

INSERT INTO `ak-customer` (`id`, `name`, `phone`, `weixin`, `creatTime`, `company`, `status`, `remark`, `intention`) VALUES
(1, '客户名称', '13800138000', '337547038', '0000-00-00 00:00:00', '', 1, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ak-demo-test`
--

CREATE TABLE `ak-demo-test` (
  `id` int(10) NOT NULL,
  `inputText` varchar(50) NOT NULL COMMENT 'null',
  `radio` int(2) NOT NULL COMMENT 'null',
  `checkbox` varchar(20) DEFAULT NULL COMMENT 'null',
  `select1` int(2) DEFAULT NULL COMMENT 'null',
  `dateTime` datetime DEFAULT NULL COMMENT 'null',
  `switch` int(2) DEFAULT NULL COMMENT 'null',
  `textarea` text DEFAULT NULL COMMENT 'null',
  `upload` varchar(50) DEFAULT NULL COMMENT 'null',
  `component` varchar(50) DEFAULT NULL COMMENT 'null',
  `user` varchar(50) DEFAULT NULL COMMENT 'null',
  `prepend` varchar(50) DEFAULT NULL COMMENT 'null',
  `select2` varchar(50) DEFAULT NULL COMMENT 'null',
  `tinymce` text DEFAULT NULL COMMENT 'null',
  `table` text DEFAULT NULL COMMENT 'null',
  `flex` text DEFAULT NULL COMMENT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `ak-demo-test`
--

INSERT INTO `ak-demo-test` (`id`, `inputText`, `radio`, `checkbox`, `select1`, `dateTime`, `switch`, `textarea`, `upload`, `component`, `user`, `prepend`, `select2`, `tinymce`, `table`, `flex`) VALUES
(1, 'test', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '789', 0, '[2]', 1, '2024-02-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '123654', 0, '[4]', 1, '2024-02-02 00:00:00', 1, '多行文本', NULL, '广东省广州市越秀区北京街道广州市人民政府', 'user,admin', 'h', '5', '<p>富文本内容</p>', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ak-holidays`
--

CREATE TABLE `ak-holidays` (
  `id` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `duration` varchar(20) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `files` varchar(200) DEFAULT NULL,
  `creatTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='请假流程';

--
-- 转存表中的数据 `ak-holidays`
--

INSERT INTO `ak-holidays` (`id`, `type`, `startTime`, `endTime`, `duration`, `remark`, `files`, `creatTime`) VALUES
(9, 1, '2023-09-30 16:00:00', '2023-10-04 16:00:00', '4天', '请假事由', '', '0000-00-00 00:00:00'),
(10, 2, '2023-09-30 08:00:00', '2023-10-06 08:00:00', '6天', '请假事由请假事由', '', '2023-10-09 01:44:04');

-- --------------------------------------------------------

--
-- 表的结构 `datasource`
--

CREATE TABLE `datasource` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '数据源名称',
  `tableName` varchar(50) NOT NULL COMMENT '表名',
  `category` int(4) DEFAULT NULL COMMENT '分类',
  `status` int(1) NOT NULL,
  `creatDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `creatUserId` int(10) DEFAULT NULL,
  `updateUserId` int(10) DEFAULT NULL COMMENT '最后修改人',
  `remark` varchar(50) DEFAULT NULL COMMENT '表注释',
  `tableData` text NOT NULL COMMENT '表结构数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='数据源表';

--
-- 转存表中的数据 `datasource`
--

INSERT INTO `datasource` (`id`, `name`, `tableName`, `category`, `status`, `creatDate`, `updateDate`, `creatUserId`, `updateUserId`, `remark`, `tableData`) VALUES
(13, '客户信息管理', 'ak-customer', 0, 1, NULL, NULL, 0, 0, '客户信息管理', '[{\"label\":\"客户名称\",\"name\":\"name\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"手机号码\",\"name\":\"phone\",\"type\":\"INT\",\"length\":\"11\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"微信\",\"name\":\"weixin\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"添加时间\",\"name\":\"creatTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":false},{\"label\":\"公司名称\",\"name\":\"company\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"类型\",\"name\":\"status\",\"type\":\"INT\",\"length\":\"2\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"备注\",\"name\":\"remark\",\"type\":\"VARCHAR\",\"length\":\"100\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"合作意向\",\"name\":\"intention\",\"type\":\"INT\",\"length\":\"2\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true}]'),
(14, '请假', 'ak-holidays', 1, 1, NULL, '2023-12-06 16:21:52', 0, 1, '请假流程', '[{\"label\":\"类型\",\"name\":\"type\",\"type\":\"INT\",\"length\":\"2\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"开始时间\",\"name\":\"startTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"结束时间\",\"name\":\"endTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"时长\",\"name\":\"duration\",\"type\":\"VARCHAR\",\"length\":\"4\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"请假事由\",\"name\":\"remark\",\"type\":\"VARCHAR\",\"length\":\"200\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"图片附件\",\"name\":\"files\",\"type\":\"VARCHAR\",\"length\":\"200\",\"default\":\"\",\"empty\":true,\"remark\":\"\",\"enterable\":true},{\"label\":\"创建时间\",\"name\":\"creatTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"current_timestamp()\",\"empty\":false,\"remark\":\"\",\"enterable\":false}]'),
(20, '组件示例测试', 'ak-demo-test', 1, 1, '2024-02-01 09:41:59', '2024-02-02 13:23:53', 1, 1, '', '[{\"name\":\"inputText\",\"type\":\"VARCHAR\",\"length\":\"50\",\"label\":\"标题名称\",\"filedType\":\"input\"},{\"name\":\"radio\",\"type\":\"INT\",\"length\":\"2\",\"label\":\"性别\",\"filedType\":\"radio\"},{\"name\":\"checkbox\",\"type\":\"VARCHAR\",\"length\":\"20\",\"empty\":true,\"label\":\"多选\",\"filedType\":\"checkbox\"},{\"name\":\"select1\",\"type\":\"INT\",\"length\":\"2\",\"empty\":true,\"label\":\"选择框\",\"filedType\":\"select\"},{\"name\":\"dateTime\",\"type\":\"DATETIME\",\"empty\":true,\"label\":\"日期时间\",\"filedType\":\"datePicker\"},{\"name\":\"switch\",\"type\":\"INT\",\"length\":\"2\",\"empty\":true,\"label\":\"开关\",\"filedType\":\"switch\"},{\"name\":\"textarea\",\"type\":\"TEXT\",\"length\":\"100\",\"empty\":true,\"label\":\"多行文本\",\"filedType\":\"textarea\"},{\"name\":\"upload\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"图片文件上传\",\"filedType\":\"upload\"},{\"name\":\"component\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"自定义组件\"},{\"name\":\"user\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"选择用户\"},{\"name\":\"prepend\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"前缀\"},{\"name\":\"select2\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"复合型\"},{\"name\":\"tinymce\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"内容\",\"filedType\":\"tinymce\"},{\"name\":\"table\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"子表\",\"isNew\":1},{\"name\":\"flex\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"弹性\",\"isNew\":1}]');

-- --------------------------------------------------------

--
-- 表的结构 `design`
--

CREATE TABLE `design` (
  `id` int(11) NOT NULL,
  `source` int(11) DEFAULT NULL COMMENT '设计表单选择的数据源 id',
  `name` varchar(50) DEFAULT NULL COMMENT '保存的标题名称',
  `type` int(2) NOT NULL COMMENT '1 表单 2 列表 3流程　4大屏',
  `data` text NOT NULL COMMENT '设计生成的字符串内容',
  `listData` text DEFAULT NULL COMMENT '主用于表格的列表数据',
  `status` int(11) DEFAULT 1 COMMENT '是否启用 1启用（默认） 0禁用',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `creatDate` datetime DEFAULT NULL COMMENT '创建时间',
  `dict` text DEFAULT NULL COMMENT '用于匹配的字典数据',
  `category` int(4) DEFAULT NULL COMMENT '分类名称',
  `creatUserId` int(10) DEFAULT NULL COMMENT '创建的用户id',
  `editUserId` int(10) DEFAULT NULL COMMENT '最后修改的用户id',
  `roleId` int(4) DEFAULT NULL COMMENT '权限角色id,主用于控制大屏及流程。其他则在菜单控制',
  `remark` varchar(200) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL COMMENT '流程图标'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='设计的表单';

--
-- 转存表中的数据 `design`
--

INSERT INTO `design` (`id`, `source`, `name`, `type`, `data`, `listData`, `status`, `updateDate`, `creatDate`, `dict`, `category`, `creatUserId`, `editUserId`, `roleId`, `remark`, `icon`) VALUES
(25, 12, '组件示例', 1, '{list:[{type:\"txt\",control:{modelValue:\"组件示例演示，可快速轻松实现功能复杂的各类型表单；功能强大、简单灵活、超乎你想象\",style:{color:\"red\"}},config:{span:24}},{type:\"title\",control:{modelValue:\"基础字段\"},config:{span:24}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入\"},config:{},name:\"text\",formItem:{label:\"单行文本\"}},{type:\"password\",control:{modelValue:\"\"},config:{},name:\"password\",formItem:{label:\"密码框\"},customRules:[]},{type:\"password\",control:{modelValue:\"\"},config:{},name:\"password2\",formItem:{label:\"确认密码\",rules:[{validator:(rule, value, callback) =>\n        {\n          // 获取密码的值\n          const val = getcomponentsValueByName(\'password\')\n          console.log(val)\n          if (value === \'\')\n          {\n            callback(new Error(\'请输入密码\'))\n          }\n          else if (value !== val)\n          {\n            callback(new Error(\'两次密码不一样\'))\n          }\n          else\n          {\n            callback()\n          }\n        },trigger:\"change\"}]},customRules:[{type:\"required\",message:\"请输入确认密码\",trigger:\"blur\"}]},{type:\"switch\",control:{modelValue:false},config:{},name:\"status\",formItem:{label:\"状态开关\"}},{type:\"tabs\",columns:[{label:\"常用\",list:[{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[],config:{optionsType:1,optionsFun:\"deptList\",method:\"post\",label:\"name\",value:\"id\",transformData:\"string\"},name:\"select1\",formItem:{label:\"下拉选择\"}},{type:\"radio\",control:{modelValue:\"\"},options:[],config:{optionsType:2,optionsFun:\"sys-status\"},name:\"radio\",formItem:{label:\"单选组\"}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\"},config:{},name:\"creatTime\",formItem:{label:\"时间\"}},{type:\"checkbox\",control:{modelValue:[]},options:[{label:\"电脑\",value:\"1\"},{label:\"音乐\",value:\"2\"},{label:\"旅游\",value:\"3\"}],config:{optionsType:0,transformData:\"string\"},name:\"checkbox\",formItem:{label:\"多选组\"}}]},{label:\"其他\",list:[{type:\"colorPicker\",control:{modelValue:\"\"},config:{},name:\"color\",formItem:{label:\"取色器\"}},{type:\"rate\",control:{modelValue:0},config:{},name:\"rate\",formItem:{label:\"评分\"}},{type:\"inputNumber\",control:{modelValue:0},config:{},name:\"number\",formItem:{label:\"计时器\"}},{type:\"cascader\",control:{modelValue:[]},options:[],config:{optionsType:0},name:\"cascader\",formItem:{label:\"级联\"}},{type:\"slider\",control:{modelValue:0},config:{},name:\"slider\",formItem:{label:\"滑块\"}},{type:\"treeSelect\",control:{modelValue:\"\",data:[],renderAfterExpand:false},config:{optionsType:0},name:\"tree\",formItem:{label:\"树形控件\"}}]}],control:{},config:{span:24}},{type:\"textarea\",control:{modelValue:\"\"},config:{span:24},name:\"textarea\",formItem:{label:\"多行文本\"}},{type:\"upload\",control:{modelValue:\"\",listType:\"text\",action:\"\"},config:{btnText:\"选择文件\"},name:\"upload\",formItem:{label:\"上传图片\"}},{type:\"card\",list:[{type:\"component\",control:{modelValue:\"\",placeholder:\"请选择地理位置\"},config:{componentName:\"ComponentTest\"},name:\"components\",formItem:{label:\"选择位置\"}},{type:\"expand-user\",control:{modelValue:\"\"},config:{},name:\"userName\",formItem:{label:\"选择用户\"}}],control:{},config:{span:24},item:{label:\"自定义及扩展组件\"}},{type:\"title\",control:{modelValue:\"复合型输入框\"},config:{span:24}},{type:\"inputSlot\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"小时\",value:\"1\"},{label:\"分钟\",value:\"2\"},{label:\"天\",value:\"3\"}],config:{optionsType:0,transformData:\"string\"},name:\"prepend\",formItem:{label:\"前缀\"}},{type:\"input\",control:{modelValue:\"\"},config:{append:\"key:prepend\"},name:\"input1\",formItem:{label:\"文本框1\"}},{type:\"title\",control:{modelValue:\"子表\"},config:{span:24}},{type:\"table\",list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"这里也可以校验哦\"},config:{},name:\"t1\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"请输入姓名\",trigger:\"blur\"}]},{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"男\",value:\"1\"},{label:\"女\",value:\"2\"}],config:{optionsType:0},name:\"t2\",formItem:{label:\"性别\"}}],tableData:[],control:{border:true},config:{addBtnText:\"添加一行\",span:24,delBtnText:\"删除\"},name:\"table\"},{type:\"title\",control:{modelValue:\"弹性布局\"},config:{span:24,help:\"什么是弹性布局\"}},{type:\"flex\",list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"这里可以校验哦\"},config:{},name:\"f1\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"请输入姓名\",trigger:\"blur\"}]},{type:\"input\",control:{modelValue:\"\"},config:{},name:\"f2\",formItem:{label:\"联系电话\"},customRules:[{type:\"mobile\",message:\"请输入手机号码\",trigger:\"blur\"}]}],tableData:[],control:{},config:{add:\"添加一行\",span:24,addBtnText:\"添加\",delBtnText:\"del\"},name:\"flex\"},{type:\"tinymce\",control:{modelValue:\"\"},config:{span:24},name:\"tinymce\",formItem:{label:\"富文本\"}}],form:{size:\"default\",labelWidth:\"120px\",class:\"form-row-2\",name:\"components\"},config:{submitCancel:true},events:{afterResponse:(res) =>\r\n{\r\n  const result = res.result\r\n  result.checkbox = result.checkbox ? result.checkbox.split(\',\') : []\r\n  result.slider = result.slider ? parseInt(result.slider) : 0\r\n  result.table = result.table ? JSON.parse(result.table) : []\r\n  result.flex = result.flex ? JSON.parse(result.flex) : []\r\n  result.cascader = result.cascader ? JSON.parse(result.cascader) : []\r\n  result.password2 = result.password // 设置确认密码\r\n  console.log(res)\r\n  return res\r\n},beforeSubmit:(data, route) =>\n{\n  // data经过处理后返回示例接口只接收string\n  if (data.password2)\n  {\n    delete data.password2\n  }\n  // 转字符串\n  try {\n      data.checkbox = data.checkbox.join(\',\')\n      data.table = JSON.stringify(data.table)\n       data.flex = JSON.stringify(data.flex)\n      data.cascader=JSON.stringify(data.cascader)\n  } catch (e) {}\n  console.log(\'beforeRequest\', data)\n  return data\n}}}', '', 1, '2023-10-08 10:49:07', '2030-12-12 12:12:12', '{\"test\":{\"0\":\"test1\",\"1\":\"test2\"}}', 1, 1, 1, 1, '', NULL),
(26, 25, '组件示例', 2, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入\"},config:{},name:\"text\",formItem:{label:\"单行文本\"}}],form:{size:\"default\"},config:{submitCancel:true}}', '{columns:[{label:\"多选\",type:\"selection\"},{label:\"序号\",type:\"index\",width:\"70px\"},{prop:\"text\",label:\"单行文本\",help:\"\"},{prop:\"creatTime\",label:\"时间\",help:\"\",config:{formatter:\"{y}-{m}-{d}\"}},{prop:\"select1\",label:\"下拉选择\",help:\"\"},{prop:\"userName\",label:\"选择用户\",help:\"\"},{prop:\"status\",label:\"状态开关\",help:\"\",config:{dictKey:\"sys-status\",tagList:{1:\"success\",2:\"info\"}}},{label:\"操作\",prop:\"__control\"}],config:{expand:true,openType:\"page\"},operateBtn:[{label:\"编辑\",key:\"edit\"},{label:\"删除\",key:\"del\"}],controlBtn:[{label:\"新增\",key:\"add\",type:\"primary\",size:\"small\",icon:\"plus\"},{label:\"导出\",key:\"import\",type:\"primary\",size:\"small\",icon:\"SoldOut\"},{label:\"批量删除\",key:\"del\",type:\"danger\",size:\"small\",icon:\"delete\"}]}', 1, '2023-10-07 15:13:37', '2030-12-12 12:12:12', '{}', 1, 1, 1, 0, '', NULL),
(27, 13, '客户信息', 1, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入客户名称\"},config:{},name:\"name\",formItem:{label:\"客户名称\"},customRules:[{type:\"required\",message:\"请输入客户名称\",trigger:\"blur\"}]},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入手机号码\"},config:{},name:\"phone\",formItem:{label:\"手机号码\"},customRules:[{type:\"mobile\",message:\"请输入手机号码\",trigger:\"blur\"}]},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入微信号码\"},config:{},name:\"weixin\",formItem:{label:\"微信\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入公司名称\"},config:{},name:\"company\",formItem:{label:\"公司名称\"}},{type:\"radio\",control:{modelValue:1},options:[],config:{optionsType:2,optionsFun:\"sys-status\"},name:\"status\",formItem:{label:\"状态\"}},{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"普通客户\",value:\"1\"},{label:\"合作客户\",value:\"2\"},{label:\"Vip客户\",value:\"3\"},{label:\"无合作意向\",value:\"4\"}],config:{optionsType:0},name:\"intention\",formItem:{label:\"客户类型\"}},{type:\"textarea\",control:{modelValue:\"\"},config:{span:24},name:\"remark\",formItem:{label:\"备注\"}}],form:{size:\"default\",labelWidth:\"100px\",class:\"form-row-2\"},config:{submitCancel:true}}', '', 1, '2023-10-08 10:48:26', '2030-12-12 12:12:12', '{}', 1, 1, 1, NULL, '', NULL),
(28, 27, '客户信息', 2, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入客户名称\"},config:{},name:\"name\",formItem:{label:\"客户名称\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入手机号码\"},config:{},name:\"phone\",formItem:{label:\"手机号码\"}},{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[],config:{optionsType:2,optionsFun:\"intention\"},name:\"intention\",formItem:{label:\"客户类型\"}}],form:{size:\"default\"},config:{submitCancel:true}}', '{columns:[{label:\"多选\",type:\"selection\"},{label:\"序号\",type:\"index\",width:\"70px\"},{prop:\"name\",label:\"客户名称\",help:\"\"},{prop:\"phone\",label:\"手机号码\",help:\"\"},{prop:\"weixin\",label:\"微信\",help:\"\"},{prop:\"status\",label:\"状态\",help:\"\",config:{dictKey:\"sys-status\",tagList:{1:\"success\",2:\"info\"}}},{prop:\"intention\",label:\"客户类型\",help:\"\",config:{dictKey:\"intention\"}},{prop:\"creatTime\",label:\"添加时间\"},{label:\"操作\",prop:\"__control\"}],config:{openType:\"dialog\",expand:true,dialogWidth:\"600\"},operateBtn:[{label:\"编辑\",key:\"edit\"},{label:\"删除\",key:\"del\"}],controlBtn:[{label:\"新增\",key:\"add\",type:\"primary\",size:\"small\",icon:\"plus\"},{label:\"批量删除\",key:\"del\",type:\"danger\",size:\"small\",icon:\"delete\"}]}', 1, '2023-10-08 10:47:15', '2030-12-12 12:12:12', '{\"intention\":{\"1\":\"普通客户\",\"2\":\"合作客户\",\"3\":\"Vip客户\",\"4\":\"无合作意向\"}}', 2, 1, 1, NULL, '', NULL),
(29, 27, '出差', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"},{id:\"yD5kFCsl\",nodeType:2,parentId:\"\"}]', '', 1, '2023-10-08 10:30:15', '2030-12-12 12:12:12', '', 3, 1, 1, 1, '', 'icon-component,#0015FF'),
(30, 37, '请假', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"},{id:\"SJsxPGcF\",nodeType:4,parentId:\"\"},{id:\"0BjptkBe\",nodeType:5,parentId:\"SJsxPGcF\",priority:1,userType:\"\",flowType:\"\",content:\"$.duration<=2\"},{id:\"rNDFSaFs\",nodeType:2,parentId:\"0BjptkBe\",userType:\"1\",flowType:\"1\",content:\"admin\",priority:1},{id:\"F15jIwHB\",nodeType:3,parentId:\"0BjptkBe\",userType:\"1\",flowType:\"1\",content:\"user\",priority:1},{id:\"jAH8nqoK\",nodeType:5,parentId:\"SJsxPGcF\",content:\"其他条件进入此流程\",priority:0}]', '', 1, '2023-10-08 10:29:15', '2030-12-12 12:12:12', '', 3, 1, 1, 1, '', 'icon-sp,#007BFF'),
(35, 25, '加班', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"}]', '', 1, '2023-10-08 09:18:23', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', 'icon-number,#F90404'),
(36, 25, '通用流程', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"}]', '', 1, '2023-10-08 10:29:54', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', 'icon-post,#AB2626'),
(37, 14, '请假流程表单', 1, '{list:[{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"事假\",value:\"1\"},{label:\"病假\",value:\"2\"},{label:\"调休\",value:\"3\"},{label:\"产假\",value:\"4\"},{label:\"陪产假\",value:\"5\"},{label:\"婚假\",value:\"6\"},{label:\"丧假\",value:\"7\"}],config:{optionsType:0},name:\"type\",formItem:{label:\"请假类型\",rules:[{required:true,message:\"请选择请假类型\",trigger:\"change\"}]}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",placeholder:\"请填写开始时间\"},config:{},name:\"startTime\",formItem:{label:\"开始时间\",rules:[{required:true,message:\"请选择开始时间\",trigger:\"change\"}]}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",placeholder:\"请填写结束时间\"},config:{},name:\"endTime\",formItem:{label:\"结束时间\",rules:[{required:true,message:\"请选择结束时间\",trigger:\"change\"},{validator:(rule, value, callback) =>\r\n        {\r\n          const val = getaskForLeaveValueByName(\'startTime\')\r\n          if (value <= val)\r\n          {\r\n            callback(new Error(\'结束时间必须大于开始时间\'))\r\n          }\r\n          else\r\n          {\r\n            callback()\r\n          }\r\n        },trigger:\"blur\"}]}},{type:\"input\",control:{modelValue:\"\",placeholder:\"自动计算时长\",disabled:true},config:{},name:\"duration\",formItem:{label:\"时长\"}},{type:\"textarea\",control:{modelValue:\"\",placeholder:\"不填写不能通过\"},config:{span:24},name:\"remark\",formItem:{label:\"请假事由\",rules:[{required:true,message:\"请填写请假事由\",trigger:\"change\"}]}},{type:\"upload\",control:{modelValue:\"\"},config:{},name:\"files\",formItem:{label:\"图片附件\",rules:[]}}],form:{size:\"default\",class:\"form-row-2\",labelWidth:\"100px\",name:\"askForLeave\"},config:{submitCancel:true},events:{change:(key, model) =>\r\n    {\r\n      // name当前改变组件的值,model表单的值\r\n      console.log(key, model)\r\n      if ([\'startTime\', \'endTime\'].includes(key) && model.startTime && model.endTime)\r\n      {\r\n        model.duration = (model.endTime - model.startTime) / (1000 * 60 * 60 * 24) + \'天\'\r\n      }\r\n      return model\r\n    }}}', '', 1, '2023-10-08 11:04:39', '2030-12-12 12:12:12', '{}', 2, 1, 1, NULL, '', NULL),
(39, 0, '可视化数据大屏示例', 4, '{list:[{type:\"background\",position:{height:\"105\",left:0,top:0,display:false,width:\"100%\"},config:{src:\"./static/screen/bg/head_bg.png\",lock:false}},{type:\"text\",position:{height:30,left:0,top:20,zIndex:0,width:\"100%\"},config:{text:\"大数据可视化系统数据分析通用模版\",style:{fontSize:\"20px\",\"text-align\":\"center\"},lock:false,optionsType:0}},{type:\"line\",position:{width:550,height:280,left:32,top:139,zIndex:2},option:{tooltip:{},grid:{left:\"0\",top:\"30\",right:\"20\",bottom:\"10\",containLabel:true},xAxis:[{type:\"category\",boundaryGap:false,axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},data:\"{{getScreenGlobal.line.xAxis}}\"},{axisPointer:{show:false},axisLine:{show:false},position:\"bottom\",offset:20}],yAxis:[{type:\"value\",axisTick:{show:false},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}}}],series:[{name:\"模块标题\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:10,showSymbol:true,lineStyle:{normal:{color:\"rgba(228, 228, 126, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(228, 228, 126, .8)\"},{offset:0.8,color:\"rgba(228, 228, 126, 0.1)\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:\"{{getScreenGlobal.line.data}}\"}]},config:{lock:false,optionsType:0},events:{}},{type:\"text\",position:{width:100,height:30,left:32,top:453,zIndex:2},config:{text:\"使用动态形式\",lock:false}},{type:\"border\",position:{width:570,height:310,left:20,top:440},config:{style:{},class:\"border\",lock:false}},{type:\"border\",position:{width:570,height:310,left:20,top:110,zIndex:0},config:{style:{},lock:false,class:\"border\"}},{type:\"text\",position:{width:260,height:69,left:604,top:164},config:{text:\"{{getScreenGlobal.textNum1}}\",style:{fontSize:\"36px\",color:\"rgba(254, 3, 3, 1)\",fontWeight:\"700\"},optionsType:0}},{type:\"echarts\",position:{width:148,height:148,left:929,top:142},option:{title:{text:\"80%\",x:\"center\",y:\"center\",textStyle:{fontWeight:\"normal\",color:\"#fff\",fontSize:\"18\"}},color:\"#49bcf7\",series:[{name:\"Line 1\",type:\"pie\",clockWise:true,radius:[\"65%\",\"80%\"],itemStyle:{normal:{label:{show:false},labelLine:{show:false}}},hoverAnimation:false,data:[{value:\"{{getScreenGlobal.pie[0]}}\",name:\"已使用\",itemStyle:{normal:{color:\"#eaff00\",label:{show:false},labelLine:{show:false}}}},{name:\"未使用\",value:\"{{getScreenGlobal.pie[1]}}\"}]}]},config:{optionsType:0}},{type:\"echarts\",position:{width:148,height:148,left:1101,top:143},option:{title:{text:\"60%\",x:\"center\",y:\"center\",textStyle:{fontWeight:\"normal\",color:\"#fff\",fontSize:\"18\"}},color:\"#49bcf7\",series:[{name:\"Line 1\",type:\"pie\",clockWise:true,radius:[\"65%\",\"80%\"],itemStyle:{normal:{label:{show:false},labelLine:{show:false}}},hoverAnimation:false,data:[{value:\"{{getScreenGlobal.pie2[0]}}\",name:\"已使用\",itemStyle:{normal:{color:\"#ea4d4d\",label:{show:false},labelLine:{show:false}}}},{name:\"未使用\",value:\"{{getScreenGlobal.pie2[1]}}\"}]}]},config:{optionsType:0}},{type:\"echarts\",position:{width:394,height:271,left:1474,top:140,zIndex:2},option:{tooltip:{},radar:[{indicator:[{text:\"盈利能力\",max:100},{text:\"发展水平\",max:100},{text:\"融资能力\",max:100},{text:\"技术能力\",max:100},{text:\"企业规模\",max:100}],textStyle:{color:\"red\"},center:[\"50%\",\"50%\"],radius:\"70%\",startAngle:90,splitNumber:4,shape:\"circle\",name:{padding:-5,formatter:\"{value}\",textStyle:{fontSize:14,color:\"rgba(255,255,255,.6)\"}},splitArea:{areaStyle:{color:\"rgba(255,255,255,.05)\"}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}}}],series:[{name:\"雷达图\",type:\"radar\",tooltip:{trigger:\"item\"},data:[{name:\"园区平均值\",value:\"{{getScreenGlobal.radar.list[0]}}\",lineStyle:{normal:{color:\"#03b48e\",width:2}},areaStyle:{normal:{color:\"#03b48e\",opacity:0.4}},symbolSize:0},{name:\"当前园区\",value:\"{{getScreenGlobal.radar.list[1]}}\",symbolSize:0,lineStyle:{normal:{color:\"#3893e5\",width:2}},areaStyle:{normal:{color:\"rgba(19, 173, 255, 0.5)\"}}}]}]},config:{lock:false,optionsType:0}},{type:\"border\",position:{width:470,height:310,left:1440,top:110},config:{style:{border:\"\"},class:\"border\",lock:false}},{type:\"pie\",position:{width:394,height:271,left:1486,top:466,zIndex:2},option:{tooltip:{},legend:{orient:\"vertical\",left:\"left\",color:\"#fff\"},series:\"{{getScreenGlobal.pie3}}\"},config:{lock:false,optionsType:0}},{type:\"text\",position:{width:100,height:30,left:607,top:123},config:{text:\"使用全局数据\"}},{type:\"border\",position:{width:808,height:439,left:610,top:312},config:{style:{border:\"\"},class:\"border\",lock:false}},{type:\"echarts\",position:{width:780,height:407,left:626,top:332,zIndex:2},option:{tooltip:{trigger:\"axis\",axisPointer:{type:\"shadow\"}},legend:{x:\"center\",y:\"0\",icon:\"circle\",itemGap:8,textStyle:{color:\"rgba(255,255,255,.5)\"},itemWidth:10,itemHeight:10},grid:{left:\"0\",top:\"30\",right:\"15\",bottom:\"0\",containLabel:true},xAxis:{type:\"category\",data:[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"],axisLine:{show:false},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}}},yAxis:{type:\"value\",splitNumber:4,axisLine:{show:false},axisTick:{show:false},splitLine:{show:true,lineStyle:{color:\"rgba(255,255,255,0.05)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}}},series:[{name:\"字段1\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#8bd46e\"},{offset:1,color:\"#03b48e\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[77,35,319,364,364,416,244,45,331,267,301,353]},{name:\"字段2\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#3893e5\"},{offset:1,color:\"#248ff7\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[86,114,70,159,196,5,197,461,12,235,252,340]},{name:\"字段3\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#43cadd\"},{offset:1,color:\"#0097c9\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[23,354,334,221,178,190,234,354,334,221,178,190]}]},config:{lock:false}},{type:\"bar\",position:{width:550,height:277,left:28,top:471},option:{tooltip:{trigger:\"axis\",axisPointer:{lineStyle:{color:\"#dddc6b\"}}},grid:{left:\"0\",top:\"30\",right:\"20\",bottom:\"10\",containLabel:true},legend:{data:[\"字段1\",\"字段2\"],right:\"center\",top:0,textStyle:{color:\"#fff\"},itemWidth:12,itemHeight:10},xAxis:[{type:\"category\",boundaryGap:false,axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},data:[]},{axisPointer:{show:false},axisLine:{show:false},position:\"bottom\",offset:20}],yAxis:[{type:\"value\",axisTick:{show:false},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}}}],series:[{name:\"字段1\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:5,showSymbol:false,lineStyle:{normal:{color:\"rgba(228, 228, 126, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(228, 228, 126, .8)\"},{offset:0.8,color:\"rgba(228, 228, 126, 0.1)\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:[]},{name:\"字段2\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:5,showSymbol:false,lineStyle:{normal:{color:\"rgba(255, 128, 128, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(255, 128, 128,.8)\"},{offset:0.8,color:\"rgba(255, 128, 128, .1)\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:[]}]},config:{lock:false,optionsType:1,requestUrl:\"demo/echarts\",method:\"post\"},events:{afterFetch:(res, data) =>\n{\n  // res响应数据, 当前组件数据data\n  console.log(\'afterFetchScreen\', data)\n  data.xAxis[0].data = res.line.xAxis\n  data.series[0].data = res.line.data\n  data.series[1].data = res.bar.data1\n  return data //返回新的图表数据\n}}},{type:\"text\",position:{width:100,height:30,left:627,top:780,zIndex:2},config:{text:\"模块标题\",lock:false}},{type:\"border\",position:{width:808,height:276,left:610,top:764},config:{style:{border:\"\"},class:\"border\",lock:false}},{type:\"bar\",position:{width:757,height:237,left:635,top:800,zIndex:2},option:{tooltip:{trigger:\"axis\",axisPointer:{type:\"shadow\"}},grid:{top:\"20%\",right:\"50\",bottom:\"20\",left:\"30\"},legend:{data:[\"数据1\",\"数据2\",\"数据3\",\"增幅\"],right:\"center\",width:\"100%\",textStyle:{color:\"rgba(255,255,255,.5)\"},itemWidth:12,itemHeight:10},xAxis:[{type:\"category\",data:[\"2016\",\"2017\",\"2018\",\"2019\"],axisLine:{show:false},axisLabel:{textStyle:{fontSize:14,color:\"rgba(255,255,255,.5)\"}}}],yAxis:[{type:\"value\",axisTick:{show:false},splitLine:{show:false},axisLine:{min:0,max:10,show:false},axisLabel:{show:true,fontSize:14,color:\"rgba(255,255,255,.5)\"}},{type:\"value\",show:true,axisLabel:{formatter:\"{value} %\",fontSize:14,color:\"rgba(255,255,255,.5)\"},axisTick:{show:false},splitNumber:3,axisLine:{show:false},splitLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}}}],series:[{name:\"数据1\",type:\"bar\",data:[36.6,38.8,40.84,41.6],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#8bd46e\"},{offset:1,color:\"#09bcb7\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"数据2\",type:\"bar\",data:[14.8,14.1,15,16.3],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#248ff7\"},{offset:1,color:\"#6851f1\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"数据3\",type:\"bar\",data:[9.2,9.1,9.85,8.9],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#fccb05\"},{offset:1,color:\"#f5804d\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"增幅\",type:\"line\",yAxisIndex:1,data:[3,1,5,2.3],lineStyle:{normal:{width:2}},itemStyle:{normal:{color:\"#3496f8\"}},symbolSize:0}]},config:{lock:false}},{type:\"text\",position:{width:100,height:30,left:32,top:119},config:{text:\"使用全局数据\",lock:false}},{type:\"clock\",position:{width:320,height:30,left:1600,top:21,zIndex:0},config:{style:{fontSize:\"20px\"},dateTime:\"{y}年{m}月{d}日 {h}:{i}:{s} 星期{w}\",lock:false}},{type:\"text\",position:{width:100,height:30,left:1455,top:123},config:{text:\"模块标题\",lock:false}},{type:\"border\",position:{width:470,height:310,left:1440,top:440},config:{style:{border:\"\"},class:\"border\",lock:false}},{type:\"bar\",position:{width:389,height:239,left:1492,top:795,zIndex:2},option:{tooltip:{show:false},grid:{top:\"0%\",left:\"50\",right:\"50\",bottom:\"0%\"},xAxis:{min:0,splitLine:{show:false},axisTick:{show:false},axisLine:{show:false},axisLabel:{show:false}},yAxis:{data:[\"数据\",\"数据\",\"数据\",\"数据\",\"数据\",\"数据\"],axisTick:{show:false},axisLine:{show:false},axisLabel:{color:\"rgba(255,255,255,.6)\",fontSize:14}},series:[{type:\"bar\",label:{show:true,zlevel:10000,position:\"right\",padding:6,color:\"#4e84a1\",fontSize:14,formatter:\"{c}\"},itemStyle:{barBorderRadius:25,color:\"#3facff\"},barWidth:\"15\",data:[1800,1240,1168,1200,2336,1680],z:6}]},config:{lock:false}},{type:\"text\",position:{width:100,height:30,left:1460,top:773,zIndex:2},config:{text:\"模块标题\",lock:true}},{type:\"border\",position:{width:470,height:276,left:1440,top:764},config:{style:{border:\"\"},class:\"border\",lock:false}},{type:\"table\",position:{width:570,height:276,left:20,top:764},option:{columns:[{prop:\"name1\",label:\"字段1\"},{prop:\"name2\",label:\"字段2\"},{prop:\"name3\",label:\"字段3\"},{prop:\"name4\",label:\"字段4\"},{prop:\"name5\",label:\"字段5\"}],list:[{name5:\"111\",name4:\"4444\",name3:\"3333\",name2:\"222\",name1:\"5555\"}]},config:{class:\"border scroll-table\",optionsType:0,carousel:false,props:{},speed:50,lock:false}}],config:{width:\"1920px\",height:\"1080px\",background:\"url(./static/screen/bg/bg.jpg)\",style:\".border{background:rgba(6, 48, 109, 0.5);border:none}\\\\n.scroll-table .el-table tr,.scroll-table .el-table{background:none}\\\\n.scroll-table .el-table th.el-table__cell{background:none;border:none}\\\\n.scroll-table .el-table td,.scroll-table .el-table th{border:none}\\\\n.scroll-table .el-table__inner-wrapper:before{display:none}\",primary:\"rgba(255, 255, 255, 1)\",method:\"post\",requestUrl:\"demo/echarts\"}}', '', 1, '2024-01-25 16:26:56', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', NULL),
(48, 19, '未命名表单', 1, '{list:[{type:\"input\",control:{modelValue:\"\"},config:{},name:\"name\",formItem:{label:\"名称标题\"}},{type:\"input\",control:{modelValue:\"\"},config:{},name:\"content\",formItem:{label:\"内容\"}},{type:\"input\",control:{modelValue:\"\"},config:{},name:\"dateTime\",formItem:{label:\"时间\"}}],form:{size:\"default\"},config:{}}', NULL, 1, '2023-12-10 14:25:38', '2030-12-12 12:12:12', '{}', 1, 1, 1, NULL, NULL, NULL),
(49, 48, '未命名列表', 2, '{}', '{columns:[{label:\"多选\",type:\"selection\"},{label:\"序号\",type:\"index\",width:\"70px\"},{prop:\"name\",label:\"名称标题\"},{prop:\"content\",label:\"内容\"},{prop:\"dateTime\",label:\"时间\"},{label:\"操作\",prop:\"__control\"}],config:{},controlBtn:[{label:\"新增\",key:\"add\",type:\"primary\",size:\"small\",icon:\"plus\"},{label:\"导出\",key:\"import\",type:\"primary\",size:\"small\",icon:\"plus\"},{label:\"批量删除\",key:\"del\",type:\"danger\",size:\"small\",icon:\"delete\"}],operateBtn:[{label:\"编辑\",key:\"edit\"},{label:\"删除\",key:\"del\"}]}', 1, '2023-12-10 17:42:53', '2023-12-10 17:33:14', '{}', 1, 1, 1, NULL, NULL, NULL),
(56, NULL, '未命名可视化大屏', 4, '{list:[{type:\"bar\",position:{width:400,height:300,left:\"86px\",top:\"104px\"},option:{xAxis:{type:\"category\",data:[]},yAxis:{type:\"value\"},grid:{left:0,top:0,right:0,bottom:30},series:[{data:[],type:\"bar\"}]},config:{optionsType:1,method:\"post\",requestUrl:\"demo/echarts\"},events:{beforeFetch:(data, route) =>\r\n      {\r\n        // data请求参数，route当前路由信息\r\n        console.log(\'beforeFetch\', data)\r\n        return data\r\n      },afterFetch:(res, data) =>\r\n      {\r\n        // res响应数据, 当前组件数据data\r\n        console.log(\'当前组件数据\', data)\r\n        console.log(\'接口响应数据\', res)\r\n        //下面两行是重点，将接口返回的数据赋值级当前组件\r\n        data.xAxis.data = res.bar.xAxis\r\n        data.series[0].data = res.bar.data1\r\n        return data //返回新的图表数据\r\n      }}}],config:{width:\"1920px\",height:\"1080px\",background:\"#000\",style:\"\",primary:\"#409eff\"}}', NULL, NULL, '2024-01-21 17:25:14', '2024-01-21 17:22:26', NULL, NULL, 1, 1, NULL, NULL, NULL),
(57, 20, '组件示例表单', 1, '{list:[{type:\"txt\",control:{modelValue:\"组件示例演示，可快速轻松实现功能复杂的各类型表单；功能强大、简单灵活、超乎你想象\",style:{color:\"red\"}},config:{}},{type:\"title\",control:{modelValue:\"基础字段\"},config:{}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入标题名称\"},config:{},name:\"inputText\",formItem:{label:\"标题名称\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"radio\",control:{modelValue:\"0\"},config:{optionsType:0,transformData:\"number\"},name:\"radio\",formItem:{label:\"性别\"},options:[{label:\"男\",value:1},{label:\"女\",value:0}]},{type:\"checkbox\",control:{modelValue:[]},options:[],config:{optionsType:2,optionsFun:\"sys-flow\"},name:\"checkbox\",formItem:{label:\"多选\"}},{type:\"select\",control:{appendToBody:true},config:{optionsType:1,optionsFun:\"demo/select\",method:\"get\",label:\"name\",value:\"value\"},name:\"select1\",formItem:{label:\"选择框\"},options:[]},{type:\"datePicker\",control:{type:\"date\",placeholder:\"请选择日期\",format:\"YYYY-MM-DD\",valueFormat:\"YYYY-MM-DD\"},config:{},name:\"dateTime\",formItem:{label:\"日期时间\"}},{type:\"switch\",control:{modelValue:false,activeValue:1,inactiveValue:0},config:{},name:\"switch\",formItem:{label:\"开关\"}},{type:\"textarea\",control:{modelValue:\"\"},config:{},name:\"textarea\",formItem:{label:\"多行文本\"}},{type:\"upload\",control:{modelValue:\"\"},config:{tip:\"\",btnText:\"选择图片\"},name:\"upload\",formItem:{label:\"图片文件上传\"}},{type:\"card\",list:[{type:\"component\",control:{modelValue:\"\"},config:{componentName:\"ComponentTest\"},name:\"component\",formItem:{label:\"选择位置\"}},{type:\"expand-user\",control:{modelValue:\"\"},config:{},name:\"user\",formItem:{label:\"选择用户\"}}],control:{},config:{},formItem:{label:\"卡片布局\"}},{type:\"inputSlot\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"小时\",value:\"h\"},{label:\"分钟\",value:\"m\"},{label:\"天\",value:\"d\"}],config:{optionsType:0},name:\"prepend\",formItem:{label:\"前缀\",hideLabel:true}},{type:\"input\",control:{modelValue:\"\"},config:{append:\"key:prepend\"},name:\"select2\",formItem:{label:\"复合型\"}},{type:\"title\",control:{modelValue:\"子表\"},config:{},name:\"title1706851586238\"},{type:\"table\",list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入姓名\"},config:{},name:\"name\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"男\",value:\"1\"},{label:\"女\",value:\"0\"},{label:\"未知\",value:\"2\"}],config:{optionsType:0,transformData:\"string\"},name:\"sex\",formItem:{label:\"性别\"}}],tableData:[],control:{border:true},config:{addBtnText:\"添加一行\"},name:\"table\"},{type:\"title\",control:{modelValue:\"弹性字段\"},config:{}},{type:\"flex\",list:[{type:\"input\",control:{modelValue:\"\"},config:{span:10},name:\"input1706851786349\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"input\",control:{modelValue:\"\"},config:{span:10},name:\"tel\",formItem:{label:\"电话\"},customRules:[{type:\"mobile\",message:\"请输入手机号码\",trigger:\"blur\"}]}],tableData:[],control:{},config:{addBtnText:\"添加一行\",span:22,delBtnText:\"删除\"},name:\"flex\"},{type:\"tinymce\",control:{modelValue:\"\"},config:{},name:\"tinymce\",formItem:{label:\"内容\"}}],form:{size:\"default\",labelWidth:\"120\"},config:{submitCancel:true}}', NULL, 1, '2024-02-02 13:49:12', '2024-02-01 09:47:26', '{}', 1, 1, 1, NULL, NULL, NULL),
(58, 57, '组件示例', 2, '{}', '{columns:[{label:\"多选\",type:\"selection\"},{label:\"序号\",type:\"index\",width:\"70px\"},{prop:\"inputText\",label:\"标题名称\"},{prop:\"radio\",label:\"性别\"},{label:\"操作\",prop:\"__control\"}],config:{},controlBtn:[{label:\"新增\",key:\"add\",type:\"primary\",size:\"small\",icon:\"plus\"},{label:\"导出\",key:\"import\",type:\"primary\",size:\"small\",icon:\"plus\"},{label:\"批量删除\",key:\"del\",type:\"danger\",size:\"small\",icon:\"delete\"}],operateBtn:[{label:\"编辑\",key:\"edit\"},{label:\"删除\",key:\"del\"}]}', 1, '2024-02-01 09:48:33', '2024-02-01 09:48:18', '{}', 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_department`
--

CREATE TABLE `sys_department` (
  `id` int(4) NOT NULL,
  `parentId` int(4) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sort` int(2) DEFAULT 0,
  `status` int(2) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='部门';

--
-- 转存表中的数据 `sys_department`
--

INSERT INTO `sys_department` (`id`, `parentId`, `name`, `sort`, `status`, `remark`, `updateTime`) VALUES
(1, 0, '广州分公司', 0, 1, '', NULL),
(2, 0, '北京分公司', 0, 1, '', NULL),
(3, 0, '上海分公司', 0, 1, '', NULL),
(4, 1, '业务部', 0, 1, '', NULL),
(5, 1, '技术开发部', 0, 1, '', NULL),
(6, 1, '设计部', 0, 1, '设计部', NULL),
(7, 3, '客服部', 0, 1, '', NULL),
(9, 7, '客服1部', 0, 1, '', NULL),
(10, 7, '客服2部', 0, 1, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict`
--

CREATE TABLE `sys_dict` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '唯一标识类型',
  `status` int(2) DEFAULT NULL COMMENT '1启用0禁用',
  `remark` varchar(50) DEFAULT NULL,
  `children` text DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `isSystem` int(2) DEFAULT NULL COMMENT '1系统类型不能删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='数据字典表';

--
-- 转存表中的数据 `sys_dict`
--

INSERT INTO `sys_dict` (`id`, `name`, `type`, `status`, `remark`, `children`, `updateTime`, `isSystem`) VALUES
(20, '表单分类', 'sys-form', 1, '方便管理所有创建的表单', '[{\"label\":\"设计表单\",\"value\":\"1\"},{\"label\":\"流程表单\",\"value\":\"2\"}]', '2023-11-28 17:27:23', 1),
(21, '启用状态', 'sys-status', 1, '', '[{\"label\":\"启用\",\"value\":\"1\"},{\"label\":\"禁用\",\"value\":\"0\"}]', '2023-11-28 17:27:23', 1),
(22, '数据源分类', 'sys-source', 1, '', '[{\"label\":\"设计表单\",\"value\":\"1\"},{\"label\":\"流程表单\",\"value\":\"2\"}]', '2023-11-28 17:27:23', 1),
(23, '列表分类', 'sys-list', 1, '方便管理列表', '[{\"label\":\"分类1\",\"value\":\"1\"},{\"label\":\"分类2\",\"value\":\"2\"}]', '2023-11-28 17:27:23', 1),
(25, '流程分类', 'sys-flow', 1, '', '[{\"label\":\"内外勤\",\"value\":\"1\"},{\"label\":\"财务\",\"value\":\"2\"},{\"label\":\"行政\",\"value\":\"3\"},{\"label\":\"其他\",\"value\":\"4\"}]', '2023-11-28 17:27:23', 1),
(26, '数据大屏分类', 'sys-screen', 1, '', '[{\"label\":\"大屏分类1\",\"value\":\"1\"}]', '2023-11-28 17:27:23', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_flow`
--

CREATE TABLE `sys_flow` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL COMMENT '操作用户id',
  `title` varchar(50) NOT NULL COMMENT '流程审批标题',
  `creatTime` datetime NOT NULL COMMENT '发起时间',
  `status` varchar(50) DEFAULT NULL COMMENT '审批状态',
  `endTime` datetime DEFAULT NULL COMMENT '完成时间',
  `formId` int(10) NOT NULL COMMENT '提交流程表单保存信息id',
  `flowId` int(10) NOT NULL COMMENT '流程id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='流程表';

--
-- 转存表中的数据 `sys_flow`
--

INSERT INTO `sys_flow` (`id`, `userId`, `title`, `creatTime`, `status`, `endTime`, `formId`, `flowId`) VALUES
(3, 0, 'user提交的请假审批', '2023-10-09 09:29:04', '', '0000-00-00 00:00:00', 9, 30),
(4, 0, 'user提交的请假审批', '2023-10-09 09:44:04', NULL, NULL, 10, 30);

-- --------------------------------------------------------

--
-- 表的结构 `sys_login_log`
--

CREATE TABLE `sys_login_log` (
  `id` int(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `loginIp` varchar(50) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_login_log`
--

INSERT INTO `sys_login_log` (`id`, `userName`, `loginIp`, `remark`, `dateTime`, `status`) VALUES
(3, 'admin', '127.0.0.1', NULL, '2023-11-29 15:56:22', 1),
(6, 'user', '127.0.0.1', NULL, '2023-11-29 16:13:38', 1),
(7, 'admin', '127.0.0.1', NULL, '2023-11-30 05:32:35', 1),
(8, 'admin', '127.0.0.1', NULL, '2023-11-30 06:12:43', 1),
(9, 'admin', '127.0.0.1', NULL, '2023-11-30 06:20:27', 1),
(10, 'admin', '127.0.0.1', NULL, '2023-11-30 06:35:34', 1),
(11, 'admin', '127.0.0.1', NULL, '2023-11-30 11:12:10', 1),
(12, 'admin', '127.0.0.1', NULL, '2023-11-30 11:12:21', 1),
(13, 'admin', '127.0.0.1', NULL, '2023-12-05 11:44:16', 1),
(14, 'admin', '127.0.0.1', NULL, '2023-12-06 11:16:44', 1),
(15, 'admin', '127.0.0.1', NULL, '2023-12-06 11:28:30', 1),
(16, 'admin', '127.0.0.1', NULL, '2023-12-06 11:30:14', 1),
(17, 'admin', '127.0.0.1', NULL, '2023-12-07 09:51:39', 1),
(18, 'admin', '127.0.0.1', NULL, '2023-12-10 13:06:27', 1),
(19, 'admin', '127.0.0.1', NULL, '2023-12-10 13:49:10', 1),
(20, 'admin', '127.0.0.1', NULL, '2023-12-11 21:30:10', 1),
(21, 'admin', '127.0.0.1', NULL, '2023-12-17 17:11:05', 1),
(22, 'admin', '127.0.0.1', NULL, '2023-12-17 17:13:28', 1),
(23, 'admin', '127.0.0.1', NULL, '2023-12-17 17:16:29', 1),
(24, 'admin', '127.0.0.1', NULL, '2023-12-17 17:17:02', 1),
(25, 'admin', '127.0.0.1', NULL, '2023-12-17 17:18:35', 1),
(26, 'admin', '127.0.0.1', NULL, '2023-12-17 17:20:37', 1),
(27, 'admin', '127.0.0.1', NULL, '2023-12-17 17:22:49', 1),
(28, 'admin', '127.0.0.1', NULL, '2023-12-17 17:23:49', 1),
(29, 'admin', '127.0.0.1', NULL, '2023-12-17 17:24:53', 1),
(30, 'admin', '127.0.0.1', NULL, '2023-12-17 17:25:16', 1),
(31, 'admin', '127.0.0.1', NULL, '2023-12-17 18:12:41', 1),
(33, 'admin', '127.0.0.1', NULL, '2023-12-17 18:13:43', 1),
(34, 'admin', '127.0.0.1', NULL, '2023-12-17 18:15:13', 1),
(35, 'admin', '127.0.0.1', NULL, '2023-12-17 18:15:57', 1),
(36, 'admin', '127.0.0.1', NULL, '2023-12-17 18:18:51', 1),
(37, 'admin', '127.0.0.1', NULL, '2023-12-17 18:19:12', 1),
(39, 'admin', '127.0.0.1', NULL, '2023-12-17 18:20:57', 1),
(40, 'admin', '127.0.0.1', NULL, '2023-12-17 18:21:28', 1),
(50, 'admin', '127.0.0.1', NULL, '2023-12-24 12:40:27', 1),
(51, 'admin', '127.0.0.1', NULL, '2023-12-25 20:16:48', 1),
(52, 'admin', '127.0.0.1', NULL, '2023-12-26 20:47:17', 1),
(53, 'admin', '127.0.0.1', NULL, '2023-12-27 20:54:27', 1),
(54, 'admin', '127.0.0.1', NULL, '2023-12-28 20:35:31', 1),
(55, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-01-13 15:54:53', 1),
(56, 'admin', '127.0.0.1', NULL, '2024-01-21 17:18:39', 1),
(57, 'admin', '127.0.0.1', NULL, '2024-01-25 16:08:25', 1),
(58, 'admin', '127.0.0.1', NULL, '2024-02-01 09:39:04', 1),
(59, 'admin', '127.0.0.1', NULL, '2024-02-01 09:49:10', 1),
(60, 'admin', '127.0.0.1', NULL, '2024-02-01 17:50:03', 1),
(61, 'admin', '127.0.0.1', NULL, '2024-02-02 11:18:28', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_menu`
--

CREATE TABLE `sys_menu` (
  `id` int(4) NOT NULL,
  `parentId` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `sort` int(2) NOT NULL,
  `path` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL COMMENT '1启用0禁用',
  `remark` varchar(100) DEFAULT NULL,
  `type` int(2) NOT NULL,
  `navShow` int(2) NOT NULL COMMENT '是否在导航中显示1为是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_menu`
--

INSERT INTO `sys_menu` (`id`, `parentId`, `name`, `icon`, `sort`, `path`, `status`, `remark`, `type`, `navShow`) VALUES
(1, 0, '内容管理', 'icon-doc', 1, '', 1, '', 1, 1),
(2, 0, '设计管理', 'icon-design', 2, '', 1, '', 1, 1),
(3, 0, '系统管理', 'icon-sys', 4, '', 1, '', 1, 1),
(4, 0, '系统工具', 'icon-tool', 6, '', 1, '', 1, 1),
(5, 4, '新建设计', 'icon-creat', 0, '/', 1, '', 1, 1),
(6, 4, '表单数据源', 'icon-data-source', 2, '/design/datasource', 1, '', 1, 1),
(7, 4, '帮助文档', 'icon-doc', 4, '/docs', 1, '', 1, 1),
(8, 3, '用户管理', 'icon-user', 0, '/system/user', 1, '', 1, 1),
(9, 3, '角色管理', 'icon-role', 2, '/system/role', 1, '', 1, 1),
(10, 3, '菜单管理', 'icon-menu', 4, '/system/menu', 1, '', 1, 1),
(11, 3, '部门管理', 'icon-tree', 6, '/system/dept', 1, '', 1, 1),
(12, 3, '岗位管理', 'icon-post', 8, '/system/post', 1, '', 1, 1),
(13, 3, '字典管理', 'icon-dict', 10, '/system/dict', 1, '', 1, 1),
(14, 3, '登录日志', 'icon-log2', 12, '/system/log', 1, '', 1, 1),
(15, 3, '操作日志', 'icon-log', 14, '/system/log', 1, '', 1, 1),
(16, 2, '表单设计管理', 'icon-form', 0, '/design/form/list', 1, '', 1, 1),
(17, 2, '列表页设计管理', 'icon-list', 2, '/design/list/list', 1, '', 1, 1),
(18, 2, '数据统计图管理', 'icon-line', 4, '/design/echarts/list', 1, '', 1, 1),
(19, 2, '数据大屏管理', 'icon-data', 8, '/design/screen/list', 1, '', 1, 1),
(20, 2, '流程设计管理', 'icon-tree', 6, '/design/flow/list', 1, '', 1, 1),
(21, 0, '工作台', 'icon-work', 0, '', 1, '', 1, 1),
(22, 21, '发起流程', 'icon-apply', 0, '/task/apply', 1, '', 1, 1),
(23, 21, '待办任务', 'icon-todo', 2, '/task/todo', 1, '', 1, 1),
(24, 21, '已办事项', 'icon-done', 1, '/task/done', 1, '', 1, 1),
(25, 21, '我发起的', 'icon-applyed', 6, '/task/applyed', 1, '', 1, 1),
(26, 21, '抄送事项', 'icon-cs', 8, '/task/copyer', 1, '', 1, 1),
(27, 1, '组件示例', 'icon-doc', 0, '/design/list/content/58', 1, '', 3, 1),
(28, 1, '客户信息', 'icon-user', 0, '/design/list/content/28', 1, '', 3, 1),
(29, 4, 'swagger文档', 'icon-work', 6, '/api/swagger-ui/index.html', 1, '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_role`
--

CREATE TABLE `sys_role` (
  `id` int(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `menuId` text NOT NULL,
  `remark` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_role`
--

INSERT INTO `sys_role` (`id`, `name`, `status`, `menuId`, `remark`) VALUES
(1, '管理员', 1, '2,16,17,18,20,19,3,8,9,10,11,12,13,14,15,4,5,6,7', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `roleId` varchar(50) DEFAULT NULL COMMENT '权限角色id',
  `password` varchar(50) NOT NULL,
  `departmentId` int(4) DEFAULT NULL,
  `postId` int(2) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后登录',
  `loginTimer` int(10) DEFAULT 0 COMMENT '登录次数',
  `ip` varchar(50) DEFAULT NULL COMMENT '登录ip地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`id`, `userName`, `nickName`, `phone`, `status`, `roleId`, `password`, `departmentId`, `postId`, `remark`, `creatTime`, `updateTime`, `lastLoginTime`, `loginTimer`, `ip`) VALUES
(1, 'admin', '管理员', '13800138000', 1, '1', '123456', 2, 0, '', NULL, NULL, '2024-02-02 11:18:28', 83, '127.0.0.1'),
(2, 'user', '会员', '', 1, '1', '123456', 10, 0, '', NULL, NULL, '2023-11-29 16:13:38', 18, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE `test` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `test`
--

INSERT INTO `test` (`id`, `name`, `content`, `phone`, `status`) VALUES
(1, 'name', '12222', '13666', 1),
(2, 'name123', '12222', '13666', 1),
(7, 'name123', '{\"test\":{\"0\":\"test1\",\"1\":\"test2\"}}', NULL, 1),
(17, 'name123', NULL, NULL, 1),
(18, 'name123', NULL, NULL, 1),
(19, 'name123', NULL, NULL, 1),
(20, '', NULL, NULL, 1),
(21, '', NULL, NULL, 1),
(22, '', NULL, NULL, 1),
(32, 'name', NULL, '136', NULL),
(33, 'name', '123', '136', NULL),
(34, 'name', '123', '136', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `upload-files`
--

CREATE TABLE `upload-files` (
  `id` int(10) NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `fileUrl` varchar(100) NOT NULL,
  `userId` int(10) NOT NULL,
  `creatTime` datetime NOT NULL DEFAULT current_timestamp(),
  `md5` varchar(50) NOT NULL,
  `groupId` int(10) DEFAULT NULL,
  `size` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='文件上传列表';

-- --------------------------------------------------------

--
-- 表的结构 `upload-group`
--

CREATE TABLE `upload-group` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `creatTime` datetime NOT NULL DEFAULT current_timestamp(),
  `userId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='上传文件分组';

--
-- 转存表中的数据 `upload-group`
--

INSERT INTO `upload-group` (`id`, `name`, `creatTime`, `userId`) VALUES
(1, '视频文件', '2023-10-09 17:32:25', 0),
(2, '图片文件', '2023-10-09 17:35:52', NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `ak-customer`
--
ALTER TABLE `ak-customer`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ak-demo-test`
--
ALTER TABLE `ak-demo-test`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ak-holidays`
--
ALTER TABLE `ak-holidays`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `datasource`
--
ALTER TABLE `datasource`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `design`
--
ALTER TABLE `design`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_department`
--
ALTER TABLE `sys_department`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_dict`
--
ALTER TABLE `sys_dict`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_flow`
--
ALTER TABLE `sys_flow`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_login_log`
--
ALTER TABLE `sys_login_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `upload-files`
--
ALTER TABLE `upload-files`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `upload-group`
--
ALTER TABLE `upload-group`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ak-customer`
--
ALTER TABLE `ak-customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `ak-demo-test`
--
ALTER TABLE `ak-demo-test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `ak-holidays`
--
ALTER TABLE `ak-holidays`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `datasource`
--
ALTER TABLE `datasource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `design`
--
ALTER TABLE `design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用表AUTO_INCREMENT `sys_department`
--
ALTER TABLE `sys_department`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `sys_dict`
--
ALTER TABLE `sys_dict`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `sys_flow`
--
ALTER TABLE `sys_flow`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_login_log`
--
ALTER TABLE `sys_login_log`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- 使用表AUTO_INCREMENT `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用表AUTO_INCREMENT `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `test`
--
ALTER TABLE `test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `upload-files`
--
ALTER TABLE `upload-files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `upload-group`
--
ALTER TABLE `upload-group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
