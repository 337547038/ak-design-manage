-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2026-06-02 05:40:43
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
-- 表的结构 `ak-componentdemo`
--

CREATE TABLE `ak-componentdemo` (
  `id` int(10) NOT NULL,
  `text` varchar(50) DEFAULT NULL,
  `checkbox` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `ak-componentdemo`
--

INSERT INTO `ak-componentdemo` (`id`, `text`, `checkbox`) VALUES
(3, '1', '2');

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
(4, '客户名称', '手机号码', '微信', '2024-11-28 00:00:00', '公司名称', 0, '', 1),
(5, '客户名称22', '13813801380', '123456', '2024-11-11 00:00:00', '公司名称', 1, '', 1),
(6, '客户名称', '13800138000', '13800138000', '2026-06-04 00:00:00', '公司名称', 1, '备注备注', 1);

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
  `table2` text DEFAULT NULL COMMENT 'null',
  `flex` text DEFAULT NULL COMMENT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `ak-demo-test`
--

INSERT INTO `ak-demo-test` (`id`, `inputText`, `radio`, `checkbox`, `select1`, `dateTime`, `switch`, `textarea`, `upload`, `component`, `user`, `prepend`, `select2`, `tinymce`, `table2`, `flex`) VALUES
(5, '标题名称开', 0, '[3,4]', 1, '2024-11-12 00:00:00', 1, '', '', '', '', '', '', '', '[]', '[{\"input1706851786349\":\"姓名\",\"tel\":\"\"}]'),
(6, '标题名称', 1, '[1]', 2, '2026-05-01 00:00:00', 1, '41414', '', '', '8,7', 'h', '41414', '<p>444444</p>', '[{\"name\":\"48\",\"sex\":1}]', '[{\"input1706851786349\":\"4\",\"tel\":\"13800138000\"},{\"input1706851786349\":\"5\",\"tel\":\"13800138000\"}]');

-- --------------------------------------------------------

--
-- 表的结构 `ak-flow-comm`
--

CREATE TABLE `ak-flow-comm` (
  `id` int(10) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `files` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='通用流程';

--
-- 转存表中的数据 `ak-flow-comm`
--

INSERT INTO `ak-flow-comm` (`id`, `content`, `files`) VALUES
(1, '申请办公电脑', ''),
(2, '申请内容', ''),
(3, '789', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ak-holidays`
--

CREATE TABLE `ak-holidays` (
  `id` int(10) NOT NULL,
  `type` int(2) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `duration` int(20) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `files` varchar(200) DEFAULT NULL,
  `creatTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='请假流程';

--
-- 转存表中的数据 `ak-holidays`
--

INSERT INTO `ak-holidays` (`id`, `type`, `startTime`, `endTime`, `duration`, `remark`, `files`, `creatTime`) VALUES
(122, 1, '2024-12-01 00:00:00', '2024-12-07 00:00:00', 6, '请假不需要理由', '', '2024-12-21 16:14:47'),
(123, 1, '2024-12-01 00:00:00', '2024-12-02 00:00:00', 1, '请假', '', '2024-12-23 08:48:32'),
(124, 1, '2024-12-01 00:00:00', '2024-12-02 00:00:00', 1, '123', '', '2024-12-23 08:49:34');

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
(13, '客户信息管理', 'ak-customer', 1, 1, NULL, '2024-11-22 15:51:12', 0, 1, '客户信息管理', '[{\"name\":\"name\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"客户名称\",\"filedType\":\"input\",\"search\":false,\"enterable\":true},{\"name\":\"phone\",\"type\":\"INT\",\"length\":\"11\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"手机号码\",\"filedType\":\"input\",\"search\":false,\"enterable\":true},{\"name\":\"weixin\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"微信\",\"filedType\":\"input\",\"search\":false,\"enterable\":true},{\"name\":\"creatTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"添加时间\",\"filedType\":\"datePicker\",\"search\":false,\"enterable\":false},{\"name\":\"company\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"公司名称\",\"filedType\":\"input\",\"search\":false,\"enterable\":true},{\"name\":\"status\",\"type\":\"INT\",\"length\":\"2\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"类型\",\"filedType\":\"radio\",\"search\":false,\"enterable\":true},{\"name\":\"remark\",\"type\":\"VARCHAR\",\"length\":\"100\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"备注\",\"filedType\":\"textarea\",\"search\":false,\"enterable\":true},{\"name\":\"intention\",\"type\":\"INT\",\"length\":\"2\",\"default\":\"\",\"remark\":\"\",\"empty\":false,\"label\":\"合作意向\",\"filedType\":\"select\",\"search\":false,\"enterable\":true}]'),
(14, '请假', 'ak-holidays', 2, 1, NULL, '2024-11-22 15:51:06', 0, 1, '请假流程', '[{\"label\":\"类型\",\"name\":\"type\",\"type\":\"INT\",\"length\":\"2\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"开始时间\",\"name\":\"startTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"结束时间\",\"name\":\"endTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"时长\",\"name\":\"duration\",\"type\":\"VARCHAR\",\"length\":\"4\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"请假事由\",\"name\":\"remark\",\"type\":\"VARCHAR\",\"length\":\"200\",\"default\":\"\",\"empty\":false,\"remark\":\"\",\"enterable\":true},{\"label\":\"图片附件\",\"name\":\"files\",\"type\":\"VARCHAR\",\"length\":\"200\",\"default\":\"\",\"empty\":true,\"remark\":\"\",\"enterable\":true},{\"label\":\"创建时间\",\"name\":\"creatTime\",\"type\":\"DATETIME\",\"length\":\"\",\"default\":\"current_timestamp()\",\"empty\":false,\"remark\":\"\",\"enterable\":false}]'),
(20, '组件示例测试', 'ak-demo-test', 1, 1, '2024-02-01 09:41:59', '2026-04-10 14:28:18', 1, 1, '', '[{\"name\":\"inputText\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"标题名称\",\"filedType\":\"input\"},{\"name\":\"radio\",\"type\":\"INT\",\"length\":\"2\",\"label\":\"性别\",\"filedType\":\"radio\"},{\"name\":\"checkbox\",\"type\":\"VARCHAR\",\"length\":\"20\",\"empty\":true,\"label\":\"多选\",\"filedType\":\"checkbox\"},{\"name\":\"select1\",\"type\":\"INT\",\"length\":\"2\",\"empty\":true,\"label\":\"选择框\",\"filedType\":\"select\"},{\"name\":\"dateTime\",\"type\":\"DATETIME\",\"empty\":true,\"label\":\"日期时间\",\"filedType\":\"datePicker\"},{\"name\":\"switch\",\"type\":\"INT\",\"length\":\"2\",\"empty\":true,\"label\":\"开关\",\"filedType\":\"switch\"},{\"name\":\"textarea\",\"type\":\"TEXT\",\"length\":\"100\",\"empty\":true,\"label\":\"多行文本\",\"filedType\":\"textarea\"},{\"name\":\"upload\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"图片文件上传\",\"filedType\":\"upload\"},{\"name\":\"component\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"自定义组件\"},{\"name\":\"user\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"选择用户\"},{\"name\":\"prepend\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"前缀\"},{\"name\":\"select2\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"复合型\"},{\"name\":\"tinymce\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"内容\",\"filedType\":\"tinymce\"},{\"name\":\"table2\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"子表\"},{\"name\":\"flex\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"弹性\"}]'),
(22, '通用流程审批', 'ak-flow-comm', 2, 1, '2024-12-23 09:00:41', '2024-12-23 09:00:41', 1, NULL, '通用流程', '[{\"name\":\"content\",\"type\":\"VARCHAR\",\"length\":\"200\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"申请内容\",\"filedType\":\"textarea\",\"search\":false,\"isNew\":1},{\"name\":\"files\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"文件附件\",\"filedType\":\"upload\",\"search\":false,\"isNew\":1}]'),
(27, '组件示例', 'ak-componentDemo', 1, 1, '2026-05-25 11:01:10', '2026-05-25 11:01:10', 1, NULL, '', '[{\"name\":\"text\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"文本\",\"filedType\":\"input\",\"search\":false,\"isNew\":1},{\"name\":\"checkbox\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"性别\",\"filedType\":\"radio\",\"search\":false,\"isNew\":1}]');

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
  `icon` varchar(50) DEFAULT NULL COMMENT '流程图标',
  `formType` int(2) DEFAULT NULL COMMENT '流程的表单类型0在线1本地',
  `formId` varchar(10) DEFAULT NULL COMMENT '流程选择的表单id或名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='设计的表单';

--
-- 转存表中的数据 `design`
--

INSERT INTO `design` (`id`, `source`, `name`, `type`, `data`, `listData`, `status`, `updateDate`, `creatDate`, `dict`, `category`, `creatUserId`, `editUserId`, `roleId`, `remark`, `icon`, `formType`, `formId`) VALUES
(37, 14, '请假流程表单', 1, '{list:[{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"事假\",value:\"1\"},{label:\"病假\",value:\"2\"},{label:\"调休\",value:\"3\"},{label:\"产假\",value:\"4\"},{label:\"陪产假\",value:\"5\"},{label:\"婚假\",value:\"6\"},{label:\"丧假\",value:\"7\"}],optionsType:0,transformData:\"string\",name:\"type\",formItem:{label:\"请假类型\",rules:[{required:true,message:\"请选择请假类型\",trigger:\"change\"}]}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",placeholder:\"请填写开始时间\",valueFormat:\"YYYY-MM-DD\"},name:\"startTime\",formItem:{label:\"开始时间\",rules:[{required:true,message:\"请选择开始时间\",trigger:\"change\"}]}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",placeholder:\"请填写结束时间\",valueFormat:\"YYYY-MM-DD\"},name:\"endTime\",formItem:{label:\"结束时间\",rules:[{required:true,message:\"请选择结束时间\",trigger:\"change\"},{validator:(rule, value, callback) =>\r\n        {\r\n          const val = getaskForLeaveValueByName(\'startTime\')\r\n          if (value <= val)\r\n          {\r\n            callback(new Error(\'结束时间必须大于开始时间\'))\r\n          }\r\n          else\r\n          {\r\n            callback()\r\n          }\r\n        },trigger:\"blur\"}]}},{type:\"input\",control:{modelValue:\"\",placeholder:\"自动计算时长\",disabled:true},append:\"天\",name:\"duration\",formItem:{label:\"时长\"}},{type:\"textarea\",control:{modelValue:\"\",placeholder:\"不填写不能通过\"},span:24,name:\"remark\",formItem:{label:\"请假事由\",rules:[{required:true,message:\"请填写请假事由\",trigger:\"change\"}]}},{type:\"upload\",control:{modelValue:\"\"},name:\"files\",formItem:{label:\"图片附件\",rules:[]}}],config:{submitCancel:true,sourceId:14,name:\"请假流程表单\",size:\"default\",class:\"form-row-2\",labelWidth:\"100px\",change:(\r\n    {\r\n      prop,\r\n      model\r\n    }) =>\r\n    {\r\n      // name当前改变组件的值,model表单的值\r\n      console.log(model)\r\n      if ([\'startTime\', \'endTime\'].includes(prop) && model.startTime && model.endTime)\r\n      {\r\n        model.duration = (new Date(model.endTime) - new Date(model.startTime)) / (1000 * 60 * 60 * 24)\r\n      }\r\n      return model\r\n    },key:\"askForLeave\"}}', '', 1, '2026-06-01 19:21:54', '2030-12-12 12:12:12', '{}', 2, 1, 1, NULL, '', NULL, NULL, NULL),
(39, 0, '可视化数据大屏示例', 4, '{list:[{type:\"background\",id:\"background17210383022510\",x:0,height:\"105\",display:false,width:\"100%\",src:\"./static/screen/bg/head_bg.png\"},{type:\"text\",id:\"text17210383022511\",x:0,y:20,height:30,width:\"100%\",text:\"大数据可视化系统数据分析通用模版\",style:{fontSize:\"20px\",\"text-align\":\"center\"},lock:false},{type:\"line\",option:{tooltip:{},grid:{left:\"0\",top:\"30\",right:\"20\",bottom:\"10\",containLabel:true},xAxis:[{type:\"category\",boundaryGap:false,axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},data:\"{{getScreenGlobal.line.xAxis}}\"},{axisPointer:{show:false},axisLine:{show:false},position:\"bottom\",offset:20}],yAxis:[{type:\"value\",axisTick:{show:false},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}}}],series:[{name:\"模块标题\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:10,lineStyle:{normal:{color:\"rgba(228, 228, 126, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(228, 228, 126, .8)\"},{offset:0.8,color:\"rgba(228, 228, 126, 0.1)\"}],x:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:\"{{getScreenGlobal.line.data}}\"}]},events:{},id:\"line17210383022512\",x:32,y:139,width:550,height:280,zIndex:2,lock:false,optionsType:0},{type:\"text\",id:\"text17210383022513\",x:32,y:453,width:100,height:30,zIndex:2,text:\"使用动态形式\",lock:false},{type:\"background\",id:\"border17210383022514\",x:20,y:440,width:570,height:310,style:{},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"background\",id:\"border17210383022515\",x:20,y:110,width:570,height:310,zIndex:0,style:{},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"text\",id:\"text17210383022516\",x:604,y:164,width:260,height:69,text:\"{{getScreenGlobal.textNum1}}\",style:{fontSize:\"36px\",color:\"rgba(254, 3, 3, 1)\",fontWeight:\"700\"},optionsType:0},{type:\"echarts\",option:{title:{text:\"80%\",x:\"center\",textStyle:{fontWeight:\"normal\",color:\"#fff\",fontSize:\"18\"}},color:\"#49bcf7\",series:[{name:\"Line 1\",type:\"pie\",clockWise:true,radius:[\"65%\",\"80%\"],itemStyle:{normal:{label:{show:false},labelLine:{show:false}}},hoverAnimation:false,data:[{value:\"{{getScreenGlobal.pie.0}}\",name:\"已使用\",itemStyle:{normal:{color:\"#eaff00\",label:{show:false},labelLine:{show:false}}}},{name:\"未使用\",value:\"{{getScreenGlobal.pie.1}}\"}]}]},id:\"echarts17210383022517\",x:929,y:142,width:148,optionsType:0,height:\"148\"},{type:\"echarts\",option:{title:{text:\"60%\",x:\"center\",textStyle:{fontWeight:\"normal\",color:\"#fff\",fontSize:\"18\"}},color:\"#49bcf7\",series:[{name:\"Line 1\",type:\"pie\",clockWise:true,radius:[\"65%\",\"80%\"],itemStyle:{normal:{label:{show:false},labelLine:{show:false}}},hoverAnimation:false,data:[{value:\"{{getScreenGlobal.pie2.0}}\",name:\"已使用\",itemStyle:{normal:{color:\"#ea4d4d\",label:{show:false},labelLine:{show:false}}}},{name:\"未使用\",value:\"{{getScreenGlobal.pie2.1}}\"}]}]},id:\"echarts17210383022518\",x:1101,y:143,width:148,optionsType:0,height:\"148\"},{type:\"echarts\",option:{tooltip:{},radar:[{indicator:[{text:\"盈利能力\",max:100},{text:\"发展水平\",max:100},{text:\"融资能力\",max:100},{text:\"技术能力\",max:100},{text:\"企业规模\",max:100}],textStyle:{color:\"red\"},center:[\"50%\",\"50%\"],radius:\"70%\",startAngle:90,splitNumber:4,shape:\"circle\",name:{padding:-5,formatter:\"{value}\",textStyle:{fontSize:14,color:\"rgba(255,255,255,.6)\"}},splitArea:{areaStyle:{color:\"rgba(255,255,255,.05)\"}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}}}],series:[{name:\"雷达图\",type:\"radar\",tooltip:{trigger:\"item\"},data:[{name:\"园区平均值\",value:\"{{getScreenGlobal.radar.list.0}}\",lineStyle:{normal:{color:\"#03b48e\",width:2}},areaStyle:{normal:{color:\"#03b48e\",opacity:0.4}},symbolSize:0},{name:\"当前园区\",value:\"{{getScreenGlobal.radar.list.1}}\",symbolSize:0,lineStyle:{normal:{color:\"#3893e5\",width:2}},areaStyle:{normal:{color:\"rgba(19, 173, 255, 0.5)\"}}}]}]},id:\"echarts17210383022519\",x:1474,y:140,width:394,height:271,zIndex:2,lock:false,optionsType:0},{type:\"background\",id:\"border172103830225110\",x:1440,y:110,width:470,height:310,style:{border:\"\"},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"pie\",option:{tooltip:{},legend:{orient:\"vertical\",left:\"left\",color:\"#fff\"},series:\"{{getScreenGlobal.pie3}}\"},id:\"pie172103830225111\",x:1486,y:466,width:394,height:271,zIndex:2,lock:false,optionsType:0},{type:\"text\",id:\"text172103830225112\",x:607,y:123,width:100,height:30,text:\"使用全局数据\"},{type:\"background\",id:\"border172103830225113\",x:610,y:312,width:808,height:439,style:{border:\"\"},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"echarts\",option:{tooltip:{trigger:\"axis\",axisPointer:{type:\"shadow\"}},legend:{x:\"center\",y:\"0\",icon:\"circle\",itemGap:8,textStyle:{color:\"rgba(255,255,255,.5)\"},itemWidth:10},grid:{left:\"0\",top:\"30\",right:\"15\",bottom:20,containLabel:true},xAxis:{type:\"category\",data:[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"],axisLine:{show:false},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}}},yAxis:{type:\"value\",splitNumber:4,axisLine:{show:false},axisTick:{show:false},splitLine:{show:true,lineStyle:{color:\"rgba(255,255,255,0.05)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}}},series:[{name:\"字段1\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#8bd46e\"},{offset:1,color:\"#03b48e\"}],x:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[77,35,319,364,364,416,244,45,331,267,301,353]},{name:\"字段2\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#3893e5\"},{offset:1,color:\"#248ff7\"}],x:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[86,114,70,159,196,5,197,461,12,235,252,340]},{name:\"字段3\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#43cadd\"},{offset:1,color:\"#0097c9\"}],x:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[23,354,334,221,178,190,234,354,334,221,178,190]}]},id:\"echarts172103830225114\",x:626,y:332,width:780,height:407,zIndex:2,lock:false},{type:\"bar\",option:{tooltip:{trigger:\"axis\",axisPointer:{lineStyle:{color:\"#dddc6b\"}}},grid:{left:\"0\",top:\"30\",right:\"20\",bottom:\"10\",containLabel:true},legend:{data:[\"字段1\",\"字段2\"],right:\"center\",top:0,textStyle:{color:\"#fff\"},itemWidth:12,itemHeight:10},xAxis:[{type:\"category\",boundaryGap:false,axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},data:[\"8:00\",\"9:00\",\"10:00\",\"11:00\",\"12:00\",\"13:00\",\"14:00\",\"15:00\",\"16:00\",\"17:00\",\"18:00\",\"19:00\",\"20:00\",\"21:00\",\"22:00\"]},{axisPointer:{show:false},axisLine:{show:false},position:\"bottom\",offset:20}],yAxis:[{type:\"value\",axisTick:{show:false},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}}}],series:[{name:\"字段1\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:5,showSymbol:false,lineStyle:{normal:{color:\"rgba(228, 228, 126, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(228, 228, 126, .8)\"},{offset:0.8,color:\"rgba(228, 228, 126, 0.1)\"}],x:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:[191,203,315,429,179,78,373,10,393,469,176,126,349,119,293]},{name:\"字段2\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:5,showSymbol:false,lineStyle:{normal:{color:\"rgba(255, 128, 128, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(255, 128, 128,.8)\"},{offset:0.8,color:\"rgba(255, 128, 128, .1)\"}],x:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:[298,226,11,422,24,489,234,401,323,300,335,218]}]},id:\"bar172103830225115\",x:28,y:471,width:550,height:277,lock:false,optionsType:1,requestUrl:\"demo/echarts\",method:\"post\"},{type:\"text\",id:\"text172103830225116\",x:627,y:780,width:100,height:30,zIndex:2,text:\"模块标题\",lock:false},{type:\"background\",id:\"border172103830225117\",x:610,y:764,width:808,height:276,style:{border:\"\"},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"bar\",option:{tooltip:{trigger:\"axis\",axisPointer:{type:\"shadow\"}},grid:{top:\"20%\",right:\"50\",bottom:\"20\",left:\"30\"},legend:{data:[\"数据1\",\"数据2\",\"数据3\",\"增幅\"],right:\"center\",width:\"100%\",textStyle:{color:\"rgba(255,255,255,.5)\"},itemWidth:12,itemHeight:10},xAxis:[{type:\"category\",data:[\"2016\",\"2017\",\"2018\",\"2019\"],axisLine:{show:false},axisLabel:{textStyle:{fontSize:14,color:\"rgba(255,255,255,.5)\"}}}],yAxis:[{type:\"value\",axisTick:{show:false},splitLine:{show:false},axisLine:{min:0,max:10,show:false},axisLabel:{show:true,fontSize:14,color:\"rgba(255,255,255,.5)\"}},{type:\"value\",show:true,axisLabel:{formatter:\"{value} %\",fontSize:14,color:\"rgba(255,255,255,.5)\"},axisTick:{show:false},splitNumber:3,axisLine:{show:false},splitLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}}}],series:[{name:\"数据1\",type:\"bar\",data:[36.6,38.8,40.84,41.6],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#8bd46e\"},{offset:1,color:\"#09bcb7\"}],x:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"数据2\",type:\"bar\",data:[14.8,14.1,15,16.3],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#248ff7\"},{offset:1,color:\"#6851f1\"}],x:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"数据3\",type:\"bar\",data:[9.2,9.1,9.85,8.9],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#fccb05\"},{offset:1,color:\"#f5804d\"}],x:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"增幅\",type:\"line\",yAxisIndex:1,data:[3,1,5,2.3],lineStyle:{normal:{width:2}},itemStyle:{normal:{color:\"#3496f8\"}},symbolSize:0}]},id:\"bar172103830225118\",x:635,y:800,width:757,height:237,zIndex:2,lock:false},{type:\"text\",id:\"text172103830225119\",x:32,y:119,width:100,height:30,text:\"使用全局数据\",lock:false},{type:\"clock\",id:\"clock172103830225120\",x:1600,y:21,width:320,height:30,zIndex:0,style:{fontSize:\"20px\"},dateTime:\"{y}年{m}月{d}日 {h}:{i}:{s} 星期{w}\",lock:false},{type:\"text\",id:\"text172103830225121\",x:1455,y:123,width:100,height:30,text:\"模块标题\",lock:false},{type:\"background\",id:\"border172103830225122\",x:1440,y:440,width:470,height:310,style:{border:\"\"},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"bar\",option:{tooltip:{show:false},grid:{top:\"0%\",left:\"50\",bottom:10},xAxis:{min:0,splitLine:{show:false},axisTick:{show:false},axisLine:{show:false},axisLabel:{show:false}},yAxis:{data:[\"数据\",\"数据\",\"数据\",\"数据\",\"数据\",\"数据\"],axisTick:{show:false},axisLine:{show:false},axisLabel:{color:\"rgba(255,255,255,.6)\",fontSize:14}},series:[{type:\"bar\",label:{show:true,zlevel:10000,position:\"right\",padding:6,color:\"#4e84a1\",fontSize:14,formatter:\"{c}\"},itemStyle:{barBorderRadius:25,color:\"#3facff\"},barWidth:\"15\",data:[1800,1240,1168,1200,2336,1680],z:6}]},id:\"bar172103830225123\",x:1492,y:795,width:389,height:239,zIndex:2,lock:false},{type:\"text\",id:\"text172103830225124\",x:1460,y:773,width:100,height:30,zIndex:2,text:\"模块标题\",lock:true},{type:\"background\",id:\"border172103830225125\",x:1440,y:764,width:470,height:276,style:{border:\"\"},lock:false,background:\"rgba(6, 48, 109, 0.5)\"},{type:\"table\",option:{columns:[{prop:\"name1\",label:\"字段1\"},{prop:\"name2\",label:\"字段2\"},{prop:\"name3\",label:\"字段3\"},{prop:\"name4\",label:\"字段4\"},{prop:\"name5\",label:\"字段5\"}],list:[{name5:\"111\",name4:\"4444\",name3:\"3333\",name2:\"222\",name1:\"5555\"}]},id:\"table172103830225126\",x:20,y:764,width:570,height:276,class:\"border scroll-table\",optionsType:0,carousel:false,props:{},speed:50,background:\"rgba(6, 48, 109, 0.5)\"}],config:{width:\"1920px\",height:\"1080px\",background:\"url(./static/screen/bg/bg.jpg)\",style:\".scroll-table .el-table tr,.scroll-table .el-table{background:none}\\\\n.scroll-table .el-table th.el-table__cell{background:none;border:none}\\\\n.scroll-table .el-table td,.scroll-table .el-table th{border:none}\\\\n.scroll-table .el-table__inner-wrapper:before{display:none}\",primary:\"rgba(255, 255, 255, 1)\",method:\"post\",requestUrl:\"demo/echarts\"}}', '', 1, '2026-05-15 09:37:50', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', NULL, NULL, NULL),
(56, NULL, '地图', 4, '{list:[{type:\"text\",width:\"300\",height:\"100\",x:281,y:386,text:\"<p>顺丰<span style=\\\"color:#0e94eb\\\">192581</span>30.87%</p> <p>京东<span style=\\\"color:#c440ef\\\">215635</span>34.08%</p> <p>EMS<span style=\\\"color:#efb013\\\">224585</span>35.49%</p>\",class:\"pie-text\",id:\"text17210430315400\"},{type:\"text\",width:\"496\",height:\"42\",x:25,y:\"550\",text:\"广东省寄派件数据\",class:\"title1\",id:\"text17210430315401\"},{type:\"text\",width:\"178\",height:\"26\",x:185,y:39,zIndex:2,text:\"当前到件量\",class:\"left-title1\",id:\"text17210430315402\"},{type:\"background\",width:\"496\",height:\"186\",x:\"25\",style:{border:\"\"},class:\"left1\",id:\"border17210430315403\"},{type:\"text\",width:\"496\",height:30,x:\"25\",y:100,zIndex:3,text:\"123,456,789\",style:{\"text-align\":\"center\",fontSize:\"28px\",color:\"#fff\"},id:\"text17210430315404\"},{type:\"image\",width:\"19\",height:\"100%\",x:\"28%\",y:\"0\",src:\"./static/demo1/line_img.png\",id:\"image17210430315405\"},{type:\"clock\",width:230,height:30,x:606,y:145,zIndex:2,dateTime:\"{y}年{m}月{d}日 {h}:{i}:{s} 星期{w}\",style:{fontSize:\"24px\"},id:\"clock17210430315406\"},{type:\"border\",width:\"370\",height:100,x:588,y:127,style:{border:\"1px solid #0E94EA\"},id:\"border17210430315407\"},{type:\"echarts\",width:439,height:245,x:1435,y:88,option:{title:\"\",grid:{top:20,containLabel:true,bottom:0},tooltip:{show:true},xAxis:[{type:\"category\",show:false,data:[\"入库件\",\"在库件\",\"出库件\",\"退签件\",\"丢失件\"],axisLabel:{textStyle:{color:\"#fff\"}}},{type:\"category\",position:\"bottom\",data:[\"入库件\",\"在库件\",\"出库件\",\"退签件\",\"丢失件\"],boundaryGap:true,axisTick:{show:false},axisLine:{show:false},axisLabel:{textStyle:{color:\"#fff\"}}},{show:false,data:[1378,1378,1378,1378,1378,1378,1378,1378,1378,1378],axisLabel:{inside:true,textStyle:{color:\"#fff\"}},axisTick:{show:false},axisLine:{show:false},z:10}],yAxis:[{show:true,splitLine:{show:false,lineStyle:{color:\"#0e94eb\"}},axisTick:{show:false},axisLine:{show:false},axisLabel:{show:true,color:\"#0e94eb\"}},{show:false,type:\"value\",nameTextStyle:{color:\"#0e94eb\"},axisLabel:{color:\"#0e94eb\"},splitLine:{show:false},axisLine:{show:false},axisTick:{show:false}},{axisLine:{show:false},axisTick:{show:false},axisLabel:{textStyle:{color:\"#999\"}}}],series:[{type:\"bar\",barWidth:20,xAxisIndex:2,tooltip:{show:false},itemStyle:{normal:{color:\"rgba(14, 148, 235, 0.102)\"}},data:[1378,1378,1378,1378,1378,1378,1378,1378,1378,1378],animation:false},{name:\"入库件\",type:\"bar\",barGap:\"-100%\",barWidth:\"40%\",xAxisIndex:1,itemStyle:{normal:{color:\"#0e94eb\"},emphasis:{opacity:1}},data:[{name:\"入库件\",value:584},0,0,0,0]},{name:\"滞留件\",type:\"bar\",stack:\"在库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(239,176,19,.9)\"},emphasis:{opacity:1}},data:[0,{name:\"滞留件\",value:152},0,0,0]},{name:\"丢失件\",type:\"bar\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(239,176,19,0.4)\"},emphasis:{opacity:1}},data:[0,0,0,0,{name:\"丢失件\",value:100}]},{name:\"正常件\",type:\"bar\",stack:\"在库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(239,176,19,0.3)\"},emphasis:{opacity:1}},data:[0,{name:\"正常件\",value:689},0,0,0]},{name:\"派送件\",type:\"bar\",stack:\"出库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(196,64,239,0.8)\"},emphasis:{opacity:1}},data:[0,0,{name:\"派送件\",value:200},0,0]},{name:\"自提件\",type:\"bar\",stack:\"出库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(196,64,239,0.4)\"},emphasis:{opacity:1}},data:[0,0,{name:\"自提件\",value:121},0,0]},{name:\"退签件\",type:\"bar\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(219,44,44,0.8)\"},emphasis:{opacity:1}},data:[0,0,0,{name:\"退签件\",value:92},0]}]},id:\"echarts17210430315408\"},{type:\"image\",width:\"19\",height:\"100%\",x:\"72%\",y:\"0\",src:\"./static/demo1/line_img.png\",id:\"image17210430315409\"},{type:\"text\",width:\"496\",height:\"42\",x:25,y:238,text:\"派件入库量占比\",class:\"title1\",id:\"text172104303154010\"},{type:\"text\",width:\"800\",height:\"53\",x:\"569\",y:\"30\",text:\"智慧物流服务中心\",class:\"title-h1\",id:\"text172104303154011\"},{type:\"pie\",width:253,height:230,x:31,y:322,option:{tooltip:{trigger:\"item\",confine:true,formatter:\"{a} <br/>{b}: {c} ({d}%)\"},series:[{radius:[\"50%\",\"85%\"],center:[\"50%\",\"50%\"],type:\"pie\",label:{normal:{show:false},emphasis:{show:false}},labelLine:{normal:{show:false},emphasis:{show:false}},name:\"派件入库量占比内容\",data:[{name:\"顺丰\",value:192581,percent:\"30.8721\",itemStyle:{normal:{color:{type:\"linear\",x:0,y2:1,colorStops:[{offset:0,color:\"#0e94eb\"},{offset:1,color:\"#0e94eb\"}],globalCoord:false}}}},{name:\"京东\",value:215635,percent:\"34.076\",itemStyle:{normal:{color:{type:\"linear\",x:0,y2:1,colorStops:[{offset:0,color:\"#c440ef\"},{offset:1,color:\"#c440ef\"}],globalCoord:false}}}},{name:\"EMS\",value:224585,percent:\"35.49\",itemStyle:{normal:{color:{type:\"linear\",x:0,y2:1,colorStops:[{offset:0,color:\"#efb013\"},{offset:1,color:\"#efb013\"}],globalCoord:false}}}}]},{radius:[\"45%\",\"50%\"],center:[\"50%\",\"50%\"],type:\"pie\",label:{normal:{show:false},emphasis:{show:false}},labelLine:{normal:{show:false},emphasis:{show:false}},animation:false,tooltip:{show:false},data:[{name:\"顺丰\",value:192581,percent:\"30.8721\",itemStyle:{normal:{color:{type:\"linear\",x:0,y2:1,colorStops:[{offset:0,color:\"#0077c5\"},{offset:1,color:\"#0077c5\"}],globalCoord:false}}}},{name:\"京东\",value:215635,percent:\"34.076\",itemStyle:{normal:{color:{type:\"linear\",x:0,y2:1,colorStops:[{offset:0,color:\"#a819d7\"},{offset:1,color:\"#a819d7\"}],globalCoord:false}}}},{name:\"EMS\",value:224585,percent:\"35.49\",itemStyle:{normal:{color:{type:\"linear\",x:0,y2:1,colorStops:[{offset:0,color:\"#c99002\"},{offset:1,color:\"#c99002\"}],globalCoord:false}}}}]}]},id:\"pie172104303154012\"},{type:\"component\",width:\"496\",height:\"300\",x:22,y:603,component:\"echartsMap\",id:\"component172104303154013\"},{type:\"component\",width:\"800\",height:\"600\",x:570,y:\"280\",component:\"echartsMap\",props:{mapType:\"china\"},id:\"component172104303154014\"},{type:\"text\",width:\"496\",height:\"42\",x:1405,y:26,text:\"派件数据\",class:\"title1\",id:\"text172104303154015\"},{type:\"text\",width:\"496\",height:\"42\",x:1406,y:\"650\",text:\"支出数据\",class:\"title1\",id:\"text172104303154016\"},{type:\"text\",width:\"496\",height:\"42\",x:1404,y:\"350\",text:\"收入数据\",class:\"title1\",id:\"text172104303154017\"},{type:\"text\",width:\"490\",height:\"242\",x:1408,y:\"400\",text:\"123,456.5元\",class:\"right-title\",id:\"text172104303154018\"},{type:\"text\",width:\"490\",height:\"242\",x:1410,y:\"700\",text:\"123,456.5元\",class:\"right-title\",id:\"text172104303154019\"}],config:{width:\"1920px\",height:\"1080px\",background:\"url(./static/demo1/index_bg.png)\",style:\".left1{background:url(\'./static/demo1/border_bg01.png\') top left no-repeat}\\n.left-title1{\\n    background:url(\'./static/demo1/title_bg01.png\') top left no-repeat;\\n    text-align:center;\\n    line-height: 26px;\\n    font-size: 18px;\\n}\\n.title1{\\n   background:url(\'./static/demo1/box_title.png\') top left no-repeat; \\n   line-height: 42px;\\n   color: #fff;\\n   font-size: 16px;\\n   padding-left: 30px;\\n}\\n.title-h1{\\n    background:url(\'./static/demo1/title_border.png\') top left no-repeat;\\n    height:53px;\\n    line-height: 53px;\\n    color: #cdddf7;\\n    font-size: 36px;\\n    text-align: center;\\n}\\n.right-title{\\n    background:url(\'./static/demo1/bg_img03.png\') top left no-repeat;\\n    font-size: 38px;\\n    color: #fff;\\n}\\n.right-title .text{\\n    display: flex;\\n    align-items: center;\\n    justify-content: center;\\n}\\n.pie-text{\\n    color: #ffff;\\n    line-height: 30px;\\n}\\n.pie-text span{\\n    padding: 0 10px;\\n}\",primary:\"#409eff\"}}', NULL, 1, '2026-05-15 11:02:14', '2024-01-21 17:22:26', NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(57, 20, '组件示例表单', 1, '{list:[{type:\"txt\",control:{modelValue:\"组件示例演示，可快速轻松实现功能复杂的各类型表单；功能强大、简单灵活、超乎你想象\",style:{color:\"red\"}},span:24},{type:\"title\",control:{modelValue:\"基础字段\"},span:24},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入标题名称\"},name:\"inputText\",formItem:{label:\"标题名称\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"radio\",control:{modelValue:\"0\"},optionsType:0,transformData:\"number\",name:\"radio\",formItem:{label:\"性别\"},options:[{label:\"男\",value:1},{label:\"女\",value:0}]},{type:\"checkbox\",control:{modelValue:[]},options:[],optionsType:2,optionsFun:\"sys-flow\",name:\"checkbox\",formItem:{label:\"多选\"}},{type:\"select\",control:{appendToBody:true},optionsType:1,optionsFun:\"demo/select\",method:\"get\",label:\"name\",value:\"value\",name:\"select1\",formItem:{label:\"选择框接口数据\"},options:[]},{type:\"datePicker\",control:{type:\"date\",placeholder:\"请选择日期\",format:\"YYYY-MM-DD\",valueFormat:\"YYYY-MM-DD\"},name:\"dateTime\",formItem:{label:\"日期时间\"}},{type:\"switch\",control:{modelValue:false,activeValue:1,inactiveValue:0},name:\"switch\",formItem:{label:\"开关\"}},{type:\"textarea\",control:{modelValue:\"\"},name:\"textarea\",formItem:{label:\"多行文本\"}},{type:\"upload\",control:{modelValue:\"\"},tip:\"\",btnText:\"选择图片\",name:\"upload\",formItem:{label:\"图片文件上传\"}},{type:\"card\",columns:[{label:\"卡片1\",list:[{type:\"component\",control:{modelValue:\"\"},componentName:\"ComponentTest\",name:\"component\",formItem:{label:\"选择位置\"},span:0},{type:\"expand-user\",control:{modelValue:\"\"},name:\"user\",formItem:{label:\"选择用户\"},span:0}]}],control:{},formItem:{label:\"卡片布局\"}},{type:\"inputSlot\",control:{modelValue:\"\",appendToBody:true,style:{width:\"150px\"}},options:[{label:\"小时\",value:\"h\"},{label:\"分钟\",value:\"m\"},{label:\"天\",value:\"d\"}],optionsType:0,name:\"prepend\",formItem:{label:\"前缀\",hideLabel:true}},{type:\"input\",control:{modelValue:\"\"},append:\"key:prepend\",name:\"select2\",formItem:{label:\"复合型\"}},{type:\"div\",control:{},list:[{type:\"title\",control:{modelValue:\"子表\"},name:\"title1706851586238\",span:0},{type:\"table\",list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入姓名\"},name:\"name\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"男\",value:\"1\"},{label:\"女\",value:\"0\"},{label:\"未知\",value:\"2\"}],optionsType:0,transformData:\"number\",name:\"sex\",formItem:{label:\"性别\"}}],tableData:[],control:{border:true},addBtnText:\"添加一行\",name:\"table2\",span:0}],span:\"\"},{type:\"div\",control:{},list:[{type:\"title\",control:{modelValue:\"弹性字段\"},span:24},{type:\"flex\",list:[{type:\"input\",control:{modelValue:\"\"},span:10,name:\"input1706851786349\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"input\",control:{modelValue:\"\"},span:10,name:\"tel\",formItem:{label:\"电话\"},customRules:[{type:\"mobile\",message:\"请输入手机号码\",trigger:\"blur\"}]}],tableData:[],control:{},addBtnText:\"添加一行\",span:24,delBtnText:\"删除\",name:\"flex\"}]},{type:\"tinymce\",control:{modelValue:\"\"},name:\"tinymce\",formItem:{label:\"内容\"},span:24}],config:{submitCancel:true,sourceId:20,name:\"组件示例表单\",transformData:true,size:\"default\",labelWidth:\"120\",key:\"demo\",class:\"form-row-2\"}}', NULL, 1, '2026-06-01 19:21:53', '2024-02-01 09:47:26', '{\"form-select1\":{\"1\":\"名称1\",\"2\":\"名称2\",\"3\":\"名称3\"}}', 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(59, NULL, '未命名可视化大屏', 4, '{list:[{type:\"bar\",id:\"bar1\",width:400,height:300,x:86,y:104,option:{xAxis:{type:\"category\",data:[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"]},yAxis:{type:\"value\"},grid:{left:0,bottom:30},series:[{data:[148,57,497,478,143,292,245,317,460,49,118,281],type:\"bar\"}]},config:{optionsType:1,method:\"post\",requestUrl:\"demo/echarts\",before:(data) =>\n      {\n        // data请求参数，route当前路由信息\n        console.log(\'beforeFetch\', data)\n        return data\n      },after:(res, data) =>\n      {\n        // res响应数据, 当前组件数据data\n        console.log(\'当前组件数据\', data)\n        console.log(\'接口响应数据\', res)\n        //下面两行是重点，将接口返回的数据赋值级当前组件\n        data.xAxis.data = res.bar.xAxis\n        data.series[0].data = res.bar.data1\n        return data //返回新的图表数据\n      }}},{type:\"bar\",width:\"403.77px\",height:300,x:849,y:74,option:{xAxis:{type:\"category\",data:\"{{getScreenGlobal.bar.xAxis}}\"},yAxis:{type:\"value\"},grid:{left:0,bottom:30},series:[{data:[120,200,150,80,70,110,130],type:\"bar\"}]},config:{lock:false,optionsType:0},id:\"bar1720868137715\"}],config:{width:\"1920px\",height:\"1080px\",background:\"#000\",style:\"\",primary:\"#409eff\",method:\"post\",requestUrl:\"demo/echarts\"}}', NULL, 1, '2026-05-15 11:03:52', '2024-07-13 18:55:41', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(78, 57, '组件示例', 2, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入标题名称\"},config:{},name:\"inputText\",formItem:{label:\"标题名称\"}},{type:\"select\",control:{style:{width:\"100px\"}},config:{optionsType:1,optionsFun:\"demo/select\",method:\"get\",label:\"name\",value:\"value\"},name:\"select1\",formItem:{label:\"选择框\"},options:[]}],form:{size:\"default\"},config:{submitCancel:true,sourceId:57,name:\"组件示例\"}}', '{columns:[{label:\"多选\",type:\"selection\"},{prop:\"inputText\",label:\"标题名称\"},{prop:\"radio\",label:\"性别\",render:\"tag\",config:{},replaceValue:{\"0\":\"女\",\"1\":\"男\"},custom:{\"0\":\"danger\",\"1\":\"primary\"}},{prop:\"select1\",label:\"选择框\",render:\"text\",config:{},replaceValue:\"form-select1\",replaceType:\"0\"},{prop:\"dateTime\",label:\"日期时间\",render:\"datetime\",config:{},timeFormat:\"{yyyy}-{mm}-{dd} {h}:{i}:{s}\"},{prop:\"switch\",label:\"开关\",render:\"switch\",config:{activeText:\"开\",inactiveText:\"关\",activeValue:\"1\",inactiveValue:\"0\",inlinePrompt:true},renderFormatter:(val,row) => {\n  // 渲染前对字段值的预处理方法，需返回新值\n  return val&&val.toString()\n}},{prop:\"textarea\",label:\"多行文本\"},{prop:\"select2\",label:\"复合型\"},{label:\"操作\",render:\"buttons\",config:{},buttons:[{key:\"edit\"},{key:\"del\",render:\"confirm\",popConfirm:{title:\"确认删除该记录吗？\",confirmButtonText:\"确认\",cancelButtonText:\"取消\",confirmButtonType:\"danger\"}}]}],config:{openType:\"page\",fixedBottomScroll:true,columnsSetting:true,expand:true,formId:\"57\",name:\"组件示例\",searchJump:true,controlBtn:[{key:\"add\"},{key:\"del\"}]}}', 1, '2026-06-01 19:22:03', '2024-11-19 15:30:04', NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(79, 13, '客户信息管理', 1, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入客户名称\"},name:\"name\",formItem:{label:\"客户名称\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入手机号码\"},name:\"phone\",formItem:{label:\"手机号码\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入微信\"},name:\"weixin\",formItem:{label:\"微信\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入公司名称\"},name:\"company\",formItem:{label:\"公司名称\"}},{type:\"radio\",control:{modelValue:\"\"},optionsType:2,optionsFun:\"sys-status\",name:\"status\",formItem:{label:\"类型\"},options:[]},{type:\"textarea\",control:{modelValue:\"\"},name:\"remark\",formItem:{label:\"备注\"}},{type:\"select\",control:{},optionsType:0,transformData:\"string\",name:\"intention\",formItem:{label:\"合作意向\"},options:[{label:\"普通客户\",value:\"1\"},{label:\"合作客户\",value:\"2\"},{label:\"无意向\",value:\"3\"}]},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",valueFormat:\"YYYY-MM-DD\",format:\"YYYY-MM-DD\"},name:\"creatTime\",formItem:{label:\"添加时间\"}}],config:{submitCancel:true,sourceId:13,name:\"客户信息管理\",size:\"default\",labelWidth:\"120px\"}}', NULL, 1, '2026-06-01 19:21:51', '2024-11-20 15:18:21', '{}', 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(80, 79, '客户信息管理列表', 2, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入客户名称\"},config:{},name:\"name\",formItem:{label:\"客户名称\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入手机号码\"},config:{},name:\"phone\",formItem:{label:\"手机号码\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入微信\"},config:{},name:\"weixin\",formItem:{label:\"微信\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入公司名称\"},config:{},name:\"company\",formItem:{label:\"公司名称\"}},{type:\"select\",control:{},config:{optionsType:0},name:\"intention\",formItem:{label:\"合作意向\"},options:[{label:\"普通客户\",value:\"1\"},{label:\"合作客户\",value:\"2\"},{label:\"无意向\",value:\"3\"}]}],config:{submitCancel:true}}', '{columns:[{prop:\"name\",label:\"客户名称\"},{prop:\"phone\",label:\"手机号码\"},{prop:\"weixin\",label:\"微信\"},{prop:\"creatTime\",label:\"添加时间\",render:\"datetime\",config:{}},{prop:\"company\",label:\"公司名称\"},{prop:\"status\",label:\"类型\",render:\"tag\",config:{},replaceValue:\"sys-status\",replaceType:\"0\",custom:{\"0\":\"danger\",\"1\":\"primary\"}},{prop:\"remark\",label:\"备注\"},{prop:\"intention\",label:\"合作意向\"},{label:\"操作\",render:\"buttons\",config:{},buttons:[{key:\"edit\"},{key:\"del\",render:\"confirm\",popConfirm:{title:\"确认删除该记录吗？\",confirmButtonText:\"确认\",cancelButtonText:\"取消\",confirmButtonType:\"danger\"}}]}],config:{openType:\"dialog\",fixedBottomScroll:true,columnsSetting:true,expand:true,formId:\"79\",controlBtn:[{key:\"add\"},{key:\"del\"}],apiKey:{list:\"\"},name:\"客户信息管理列表\"}}', 1, '2026-06-01 19:22:01', '2024-11-20 15:25:00', NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
(82, 22, '通用流程表单', 1, '{list:[{type:\"textarea\",control:{modelValue:\"\"},name:\"content\",formItem:{label:\"申请内容\"}},{type:\"upload\",control:{modelValue:\"\"},name:\"files\",formItem:{label:\"文件附件\"}}],config:{submitCancel:true,sourceId:\"22\",name:\"通用流程表单\",size:\"default\"}}', NULL, 1, '2026-06-01 19:21:49', '2024-12-23 09:01:35', '{}', 2, 1, 1, NULL, NULL, NULL, NULL, NULL),
(89, NULL, '大屏测试', 4, '{list:[{type:\"line\",width:400,height:300,x:412,y:138,option:{tooltip:{show:false},grid:{top:\"0%\",left:\"50\"},xAxis:{min:0,splitLine:{show:false},axisTick:{show:false},axisLine:{show:false},axisLabel:{show:false}},yAxis:{data:[\"数据\",\"数据\",\"数据\",\"数据\",\"数据\",\"数据\"],axisTick:{show:false},axisLine:{show:false},axisLabel:{color:\"rgba(255,255,255,.6)\",fontSize:14}},series:[{type:\"bar\",label:{show:true,zlevel:10000,position:\"right\",padding:6,color:\"#4e84a1\",fontSize:14,formatter:\"{c}\"},itemStyle:{barBorderRadius:25,color:\"#3facff\"},barWidth:\"15\",data:[1800,1240,1168,1200,2336,1680],z:6}]},id:\"line1747041344018\"}],config:{width:\"1920px\",height:\"1080px\",background:\"#000\",style:\"body{color:red}\\n.div{font-size:18px}\",primary:\"#409eff\",method:\"get\"}}', NULL, 1, '2026-05-15 09:11:19', '2025-05-12 17:15:50', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(94, 27, '组件示例', 1, '{list:[{type:\"input\",control:{modelValue:\"\"},name:\"text\",formItem:{label:\"文本\"}},{type:\"radio\",control:{modelValue:\"\"},name:\"checkbox\",formItem:{label:\"性别\"},options:[{label:\"男\",value:\"1\"},{label:\"女\",value:\"2\"}],optionsType:0}],config:{submitCancel:true,sourceId:27,name:\"组件示例\"}}', NULL, 1, '2026-06-01 19:21:47', '2026-05-25 11:16:25', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(95, 94, '未命名列表', 2, '{list:[{type:\"input\",control:{modelValue:\"\"},name:\"text\",formItem:{label:\"文本\"}},{type:\"radio\",control:{modelValue:\"\"},name:\"checkbox\",formItem:{label:\"性别\"},options:[{label:\"男\",value:\"1\"},{label:\"女\",value:\"2\"}],optionsType:0}],config:{submitCancel:true}}', '{columns:[{label:\"多选\",type:\"selection\",prop:\"selection\"},{prop:\"text\",label:\"文本\",help:\"\"},{prop:\"checkbox\",label:\"性别\",help:\"\"},{label:\"操作\",prop:\"operate\",render:\"buttons\",buttons:[{key:\"edit\",props:{type:\"danger\",size:\"small\"}},{key:\"del\"}]}],config:{formId:94,controlBtn:[{key:\"add\"},{key:\"del\"},{key:\"export\"}],name:\"未命名列表\",openType:\"dialog\"}}', 1, '2026-06-01 19:21:59', '2026-05-26 19:12:49', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL),
(97, NULL, '通用审批流程', 3, '{\"nodes\":[{\"id\":\"start\",\"type\":\"start\",\"x\":233,\"y\":166,\"properties\":{\"width\":40,\"height\":40},\"text\":{\"x\":233,\"y\":166,\"value\":\"开始\"}},{\"id\":\"779800dd-98be-4ac3-87ac-bf10ff20180b\",\"type\":\"userTask\",\"x\":387,\"y\":166,\"properties\":{\"width\":120,\"nodeName\":\"用户任务\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"admin\",\"joinUserId\":\"1\"},\"text\":{\"x\":387,\"y\":166,\"value\":\"用户任务\"}},{\"id\":\"c8e23610-1862-46e3-a195-047595e7efd3\",\"type\":\"sysTask\",\"x\":635,\"y\":166,\"properties\":{\"width\":120,\"nodeName\":\"抄送\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"admin,user,hr\",\"joinUserId\":\"1,2,7\"},\"text\":{\"x\":635,\"y\":166,\"value\":\"抄送\"}},{\"id\":\"d495fbc1-1dde-4c4f-8792-ddc98f266016\",\"type\":\"end\",\"x\":803,\"y\":164,\"properties\":{\"width\":40,\"height\":40}}],\"edges\":[{\"id\":\"e33171f9-2987-44d8-9b6b-d1dda0c22159\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"start\",\"targetNodeId\":\"779800dd-98be-4ac3-87ac-bf10ff20180b\",\"sourceAnchorId\":\"start_1\",\"targetAnchorId\":\"779800dd-98be-4ac3-87ac-bf10ff20180b_3\",\"startPoint\":{\"x\":253,\"y\":166},\"endPoint\":{\"x\":327,\"y\":166},\"pointsList\":[{\"x\":253,\"y\":166},{\"x\":327,\"y\":166}]},{\"id\":\"4e09d3f0-418c-4de2-ad48-990a540971eb\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"779800dd-98be-4ac3-87ac-bf10ff20180b\",\"targetNodeId\":\"c8e23610-1862-46e3-a195-047595e7efd3\",\"sourceAnchorId\":\"779800dd-98be-4ac3-87ac-bf10ff20180b_1\",\"targetAnchorId\":\"c8e23610-1862-46e3-a195-047595e7efd3_3\",\"startPoint\":{\"x\":447,\"y\":166},\"endPoint\":{\"x\":575,\"y\":166},\"pointsList\":[{\"x\":447,\"y\":166},{\"x\":575,\"y\":166}]},{\"id\":\"09bba063-f3f9-4e46-b380-ebf0bb49eb35\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"c8e23610-1862-46e3-a195-047595e7efd3\",\"targetNodeId\":\"d495fbc1-1dde-4c4f-8792-ddc98f266016\",\"sourceAnchorId\":\"c8e23610-1862-46e3-a195-047595e7efd3_1\",\"targetAnchorId\":\"d495fbc1-1dde-4c4f-8792-ddc98f266016_3\",\"startPoint\":{\"x\":695,\"y\":166},\"endPoint\":{\"x\":783,\"y\":164},\"pointsList\":[{\"x\":695,\"y\":166},{\"x\":739,\"y\":166},{\"x\":739,\"y\":164},{\"x\":783,\"y\":164}]}]}', 'form3', 1, '2026-06-01 13:02:16', '2026-06-01 08:42:14', NULL, 1, 1, 1, NULL, NULL, NULL, 1, 'form3'),
(98, NULL, '调休流程', 3, '{\"nodes\":[{\"id\":\"start\",\"type\":\"start\",\"x\":233,\"y\":379,\"properties\":{\"width\":40,\"height\":40},\"text\":{\"x\":233,\"y\":379,\"value\":\"开始\"}},{\"id\":\"225ad617-7420-4e61-9387-e8b9588232eb\",\"type\":\"userTask\",\"x\":398,\"y\":379,\"properties\":{\"width\":120,\"nodeName\":\"上级主管审批\",\"flowType\":2,\"height\":80,\"userType\":\"3\",\"joinName\":\"直接领导\"},\"text\":{\"x\":398,\"y\":379,\"value\":\"上级主管审批\"}},{\"id\":\"b6ff9a0a-49d1-4341-8553-ae736183df11\",\"type\":\"condition\",\"x\":546,\"y\":379,\"properties\":{\"width\":50,\"height\":50}},{\"id\":\"57c651c1-e9ac-48a1-b356-40194a261df4\",\"type\":\"userTask\",\"x\":750,\"y\":302,\"properties\":{\"width\":120,\"nodeName\":\"总经理审批\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"user\",\"joinUserId\":\"2\"},\"text\":{\"x\":750,\"y\":302,\"value\":\"总经理审批\"}},{\"id\":\"59bc0e18-b4d0-4cec-a6ef-751278fad639\",\"type\":\"userTask\",\"x\":755,\"y\":477,\"properties\":{\"width\":120,\"nodeName\":\"部门经理审批\",\"height\":80,\"flowType\":2,\"userType\":\"1\",\"joinName\":\"admin\",\"joinUserId\":\"1\"},\"text\":{\"x\":755,\"y\":477,\"value\":\"部门经理审批\"}},{\"id\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70\",\"type\":\"sysTask\",\"x\":1055,\"y\":408,\"properties\":{\"width\":120,\"nodeName\":\"抄送行政\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"hr\",\"joinUserId\":\"5\"},\"text\":{\"x\":1055,\"y\":408,\"value\":\"抄送行政\"}},{\"id\":\"fb1db69e-a27b-477e-a66e-f837497d376d\",\"type\":\"end\",\"x\":1229,\"y\":408,\"properties\":{\"width\":40,\"height\":40}}],\"edges\":[{\"id\":\"9ac86e76-5a05-4e28-b843-6be5283f15ce\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"start\",\"targetNodeId\":\"225ad617-7420-4e61-9387-e8b9588232eb\",\"sourceAnchorId\":\"start_1\",\"targetAnchorId\":\"225ad617-7420-4e61-9387-e8b9588232eb_3\",\"startPoint\":{\"x\":253,\"y\":379,\"id\":\"284-164\"},\"endPoint\":{\"x\":338,\"y\":379,\"id\":\"369-164\"},\"pointsList\":[{\"x\":253,\"y\":379},{\"x\":338,\"y\":379}]},{\"id\":\"281cf407-e63e-4cb9-8234-d709a2a7143e\",\"type\":\"connection\",\"properties\":{\"flowType\":2,\"expr\":\"day>=3\"},\"sourceNodeId\":\"b6ff9a0a-49d1-4341-8553-ae736183df11\",\"targetNodeId\":\"57c651c1-e9ac-48a1-b356-40194a261df4\",\"sourceAnchorId\":\"b6ff9a0a-49d1-4341-8553-ae736183df11_0\",\"targetAnchorId\":\"57c651c1-e9ac-48a1-b356-40194a261df4_3\",\"startPoint\":{\"x\":546,\"y\":354},\"endPoint\":{\"x\":690,\"y\":302},\"text\":{\"x\":618,\"y\":302,\"value\":\"请假大于3天\"},\"pointsList\":[{\"x\":546,\"y\":354},{\"x\":546,\"y\":302},{\"x\":690,\"y\":302}]},{\"id\":\"2926c889-380d-4254-aa6d-922c04b938a1\",\"type\":\"connection\",\"properties\":{\"flowType\":2,\"expr\":\"day<3\"},\"sourceNodeId\":\"b6ff9a0a-49d1-4341-8553-ae736183df11\",\"targetNodeId\":\"59bc0e18-b4d0-4cec-a6ef-751278fad639\",\"sourceAnchorId\":\"b6ff9a0a-49d1-4341-8553-ae736183df11_2\",\"targetAnchorId\":\"59bc0e18-b4d0-4cec-a6ef-751278fad639_3\",\"startPoint\":{\"x\":546,\"y\":404},\"endPoint\":{\"x\":695,\"y\":477},\"text\":{\"x\":620.5,\"y\":477,\"value\":\"请假小于3天\"},\"pointsList\":[{\"x\":546,\"y\":404},{\"x\":546,\"y\":477},{\"x\":695,\"y\":477}]},{\"id\":\"49e93750-6a77-4a84-8c98-91c80f78720c\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"225ad617-7420-4e61-9387-e8b9588232eb\",\"targetNodeId\":\"b6ff9a0a-49d1-4341-8553-ae736183df11\",\"sourceAnchorId\":\"225ad617-7420-4e61-9387-e8b9588232eb_1\",\"targetAnchorId\":\"b6ff9a0a-49d1-4341-8553-ae736183df11_3\",\"startPoint\":{\"x\":458,\"y\":379},\"endPoint\":{\"x\":521,\"y\":379},\"pointsList\":[{\"x\":458,\"y\":379},{\"x\":521,\"y\":379}]},{\"id\":\"54de3eb9-8b3e-4424-b7dd-f2f5a083a525\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"59bc0e18-b4d0-4cec-a6ef-751278fad639\",\"targetNodeId\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70\",\"sourceAnchorId\":\"59bc0e18-b4d0-4cec-a6ef-751278fad639_1\",\"targetAnchorId\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70_2\",\"startPoint\":{\"x\":815,\"y\":477},\"endPoint\":{\"x\":1055,\"y\":448},\"pointsList\":[{\"x\":815,\"y\":477},{\"x\":845,\"y\":477},{\"x\":845,\"y\":478},{\"x\":1055,\"y\":478},{\"x\":1055,\"y\":448}]},{\"id\":\"f2d8a58d-ec20-4577-9b04-a11fb0536867\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"57c651c1-e9ac-48a1-b356-40194a261df4\",\"targetNodeId\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70\",\"sourceAnchorId\":\"57c651c1-e9ac-48a1-b356-40194a261df4_1\",\"targetAnchorId\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70_0\",\"startPoint\":{\"x\":810,\"y\":302},\"endPoint\":{\"x\":1055,\"y\":368},\"pointsList\":[{\"x\":810,\"y\":302},{\"x\":1055,\"y\":302},{\"x\":1055,\"y\":368}]},{\"id\":\"b484c232-be82-4671-a0da-c6e8869ee2fd\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70\",\"targetNodeId\":\"fb1db69e-a27b-477e-a66e-f837497d376d\",\"sourceAnchorId\":\"dd76c04b-2ead-4119-9b99-77ec5e7eaf70_1\",\"targetAnchorId\":\"fb1db69e-a27b-477e-a66e-f837497d376d_3\",\"startPoint\":{\"x\":1115,\"y\":408},\"endPoint\":{\"x\":1209,\"y\":408},\"pointsList\":[{\"x\":1115,\"y\":408},{\"x\":1209,\"y\":408}]}]}', NULL, 1, '2026-06-01 14:06:40', '2026-06-01 12:59:20', NULL, 3, 1, 1, NULL, NULL, NULL, 0, '37'),
(99, NULL, '加班', 3, '{\"nodes\":[{\"id\":\"start\",\"type\":\"start\",\"x\":232,\"y\":166,\"properties\":{\"width\":40,\"height\":40},\"text\":{\"x\":232,\"y\":166,\"value\":\"开始\"}},{\"id\":\"18e7c864-575a-4be9-a995-d0f356d79bda\",\"type\":\"userTask\",\"x\":387,\"y\":166,\"properties\":{\"width\":120,\"nodeName\":\"主管审批\",\"flowType\":2,\"height\":80,\"userType\":\"3\",\"joinName\":\"直接领导\"},\"text\":{\"x\":387,\"y\":166,\"value\":\"主管审批\"}},{\"id\":\"5ca95d99-dcf9-4076-bc09-c2595c57dde6\",\"type\":\"sysTask\",\"x\":559,\"y\":166,\"properties\":{\"width\":120,\"nodeName\":\"前台行政\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"hr\",\"joinUserId\":\"7\"},\"text\":{\"x\":559,\"y\":166,\"value\":\"前台行政\"}},{\"id\":\"05309907-c7df-4c4c-8705-fdf057aa2da0\",\"type\":\"end\",\"x\":728,\"y\":166,\"properties\":{\"width\":40,\"height\":40}}],\"edges\":[{\"id\":\"b0bfe224-8af7-446b-8a63-394824b54035\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"start\",\"targetNodeId\":\"18e7c864-575a-4be9-a995-d0f356d79bda\",\"sourceAnchorId\":\"start_1\",\"targetAnchorId\":\"18e7c864-575a-4be9-a995-d0f356d79bda_3\",\"startPoint\":{\"x\":252,\"y\":166},\"endPoint\":{\"x\":327,\"y\":166},\"pointsList\":[{\"x\":252,\"y\":166},{\"x\":327,\"y\":166}]},{\"id\":\"183e97ef-efd6-451e-8e4d-78bd94b03984\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"18e7c864-575a-4be9-a995-d0f356d79bda\",\"targetNodeId\":\"5ca95d99-dcf9-4076-bc09-c2595c57dde6\",\"sourceAnchorId\":\"18e7c864-575a-4be9-a995-d0f356d79bda_1\",\"targetAnchorId\":\"5ca95d99-dcf9-4076-bc09-c2595c57dde6_3\",\"startPoint\":{\"x\":447,\"y\":166},\"endPoint\":{\"x\":499,\"y\":166},\"pointsList\":[{\"x\":447,\"y\":166},{\"x\":499,\"y\":166}]},{\"id\":\"7b28c227-c45d-4749-8663-7c8792292128\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"5ca95d99-dcf9-4076-bc09-c2595c57dde6\",\"targetNodeId\":\"05309907-c7df-4c4c-8705-fdf057aa2da0\",\"sourceAnchorId\":\"5ca95d99-dcf9-4076-bc09-c2595c57dde6_1\",\"targetAnchorId\":\"05309907-c7df-4c4c-8705-fdf057aa2da0_3\",\"startPoint\":{\"x\":619,\"y\":166},\"endPoint\":{\"x\":708,\"y\":166},\"pointsList\":[{\"x\":619,\"y\":166},{\"x\":708,\"y\":166}]}]}', NULL, 0, '2026-06-01 13:00:26', '2026-06-01 13:00:16', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `design` (`id`, `source`, `name`, `type`, `data`, `listData`, `status`, `updateDate`, `creatDate`, `dict`, `category`, `creatUserId`, `editUserId`, `roleId`, `remark`, `icon`, `formType`, `formId`) VALUES
(100, NULL, '请假申请', 3, '{\"nodes\":[{\"id\":\"start\",\"type\":\"start\",\"x\":313,\"y\":283,\"properties\":{\"width\":40,\"height\":40,\"flowType\":2},\"text\":{\"x\":313,\"y\":283,\"value\":\"申请\"}},{\"id\":\"723d2767-9b50-4e0d-9039-7462279acd5c\",\"type\":\"userTask\",\"x\":829,\"y\":473,\"properties\":{\"width\":120,\"nodeName\":\"经理审批\",\"height\":80,\"flowType\":2,\"userType\":\"1\",\"joinName\":\"admin\",\"joinUserId\":\"1\"},\"text\":{\"x\":829,\"y\":473,\"value\":\"经理审批\"}},{\"id\":\"4257ec39-ae7a-4a82-963d-cdeb7e2c9082\",\"type\":\"userTask\",\"x\":490,\"y\":283,\"properties\":{\"width\":120,\"nodeName\":\"主管审批\",\"height\":80,\"flowType\":2,\"userType\":\"3\",\"joinName\":\"直接领导\"},\"text\":{\"x\":490,\"y\":283,\"value\":\"主管审批\"}},{\"id\":\"5886c5d4-3b49-4d15-8dea-63fba456b783\",\"type\":\"userTask\",\"x\":1011,\"y\":473,\"properties\":{\"width\":120,\"nodeName\":\"总经理审批\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"admin\",\"joinUserId\":\"1\"},\"text\":{\"x\":1011,\"y\":473,\"value\":\"总经理审批\"}},{\"id\":\"604c73b7-525a-49cd-a714-6d7855edc66d\",\"type\":\"condition\",\"x\":635,\"y\":283,\"properties\":{\"width\":50,\"height\":50}},{\"id\":\"9f336b1a-1df6-454b-8394-e4e743d6a037\",\"type\":\"userTask\",\"x\":831,\"y\":283,\"properties\":{\"width\":120,\"nodeName\":\"经理审批\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"user\",\"joinUserId\":\"2\"},\"text\":{\"x\":831,\"y\":283,\"value\":\"经理审批\"}},{\"id\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec\",\"type\":\"sysTask\",\"x\":1027,\"y\":131,\"properties\":{\"width\":120,\"nodeName\":\"人事行政\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"hr\",\"joinUserId\":\"7\"},\"text\":{\"x\":1027,\"y\":131,\"value\":\"人事行政\"}},{\"id\":\"b9de6086-b1b0-43eb-805d-972e7b1daa9d\",\"type\":\"sysTask\",\"x\":1246,\"y\":131,\"properties\":{\"width\":120,\"nodeName\":\"前台\",\"flowType\":2,\"height\":80,\"userType\":\"1\",\"joinName\":\"user\",\"joinUserId\":\"2\"},\"text\":{\"x\":1246,\"y\":131,\"value\":\"前台\"}},{\"id\":\"44171ef1-8b0a-458c-8dbe-2703c97c20ab\",\"type\":\"end\",\"x\":1246,\"y\":341,\"properties\":{\"width\":40,\"height\":40}}],\"edges\":[{\"id\":\"9656fc63-ae5e-4107-9136-50ea53442a9b\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"start\",\"targetNodeId\":\"4257ec39-ae7a-4a82-963d-cdeb7e2c9082\",\"sourceAnchorId\":\"start_1\",\"targetAnchorId\":\"4257ec39-ae7a-4a82-963d-cdeb7e2c9082_3\",\"startPoint\":{\"x\":333,\"y\":283},\"endPoint\":{\"x\":430,\"y\":283},\"pointsList\":[{\"x\":333,\"y\":283},{\"x\":430,\"y\":283}]},{\"id\":\"6d4af52d-68e1-48ac-8d80-6af21093971d\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"4257ec39-ae7a-4a82-963d-cdeb7e2c9082\",\"targetNodeId\":\"604c73b7-525a-49cd-a714-6d7855edc66d\",\"sourceAnchorId\":\"4257ec39-ae7a-4a82-963d-cdeb7e2c9082_1\",\"targetAnchorId\":\"604c73b7-525a-49cd-a714-6d7855edc66d_3\",\"startPoint\":{\"x\":550,\"y\":283},\"endPoint\":{\"x\":610,\"y\":283},\"pointsList\":[{\"x\":550,\"y\":283},{\"x\":610,\"y\":283}]},{\"id\":\"b9e21230-5002-409a-9f79-d67a57f0b49c\",\"type\":\"connection\",\"properties\":{\"flowType\":2,\"expr\":\"day>5\"},\"sourceNodeId\":\"604c73b7-525a-49cd-a714-6d7855edc66d\",\"targetNodeId\":\"723d2767-9b50-4e0d-9039-7462279acd5c\",\"sourceAnchorId\":\"604c73b7-525a-49cd-a714-6d7855edc66d_2\",\"targetAnchorId\":\"723d2767-9b50-4e0d-9039-7462279acd5c_3\",\"startPoint\":{\"x\":635,\"y\":308},\"endPoint\":{\"x\":769,\"y\":473},\"text\":{\"x\":636,\"y\":473,\"value\":\"请假大于5天\"},\"pointsList\":[{\"x\":635,\"y\":308},{\"x\":635,\"y\":473},{\"x\":769,\"y\":473}]},{\"id\":\"489a7ce9-50ea-4f52-8b7a-5d118617fced\",\"type\":\"connection\",\"properties\":{\"flowType\":2,\"expr\":\"day>=3&&day<=5\"},\"sourceNodeId\":\"604c73b7-525a-49cd-a714-6d7855edc66d\",\"targetNodeId\":\"9f336b1a-1df6-454b-8394-e4e743d6a037\",\"sourceAnchorId\":\"604c73b7-525a-49cd-a714-6d7855edc66d_1\",\"targetAnchorId\":\"9f336b1a-1df6-454b-8394-e4e743d6a037_3\",\"startPoint\":{\"x\":660,\"y\":283},\"endPoint\":{\"x\":771,\"y\":283},\"text\":{\"x\":715.5,\"y\":283,\"value\":\"请假3-5天\"},\"pointsList\":[{\"x\":660,\"y\":283},{\"x\":771,\"y\":283}]},{\"id\":\"a82216b5-ce4b-424b-824d-18cad498343e\",\"type\":\"connection\",\"properties\":{\"flowType\":2,\"expr\":\"day<=2\"},\"sourceNodeId\":\"604c73b7-525a-49cd-a714-6d7855edc66d\",\"targetNodeId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec\",\"sourceAnchorId\":\"604c73b7-525a-49cd-a714-6d7855edc66d_0\",\"targetAnchorId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec_3\",\"startPoint\":{\"x\":635,\"y\":258},\"endPoint\":{\"x\":967,\"y\":131},\"text\":{\"x\":801,\"y\":131,\"value\":\"请假1-2天\"},\"pointsList\":[{\"x\":635,\"y\":258},{\"x\":635,\"y\":131},{\"x\":967,\"y\":131}]},{\"id\":\"87d29e46-dd4d-42b3-aeca-a205c26263eb\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"9f336b1a-1df6-454b-8394-e4e743d6a037\",\"targetNodeId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec\",\"sourceAnchorId\":\"9f336b1a-1df6-454b-8394-e4e743d6a037_1\",\"targetAnchorId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec_2\",\"startPoint\":{\"x\":891,\"y\":283},\"endPoint\":{\"x\":1027,\"y\":171},\"pointsList\":[{\"x\":891,\"y\":283},{\"x\":1027,\"y\":283},{\"x\":1027,\"y\":171}]},{\"id\":\"a406e270-f625-4aed-9c0b-2329cd636140\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"723d2767-9b50-4e0d-9039-7462279acd5c\",\"targetNodeId\":\"5886c5d4-3b49-4d15-8dea-63fba456b783\",\"sourceAnchorId\":\"723d2767-9b50-4e0d-9039-7462279acd5c_1\",\"targetAnchorId\":\"5886c5d4-3b49-4d15-8dea-63fba456b783_3\",\"startPoint\":{\"x\":889,\"y\":473},\"endPoint\":{\"x\":951,\"y\":473},\"pointsList\":[{\"x\":889,\"y\":473},{\"x\":951,\"y\":473}]},{\"id\":\"09ecf4ea-e93d-48dc-a817-adb2dcf7ecad\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"5886c5d4-3b49-4d15-8dea-63fba456b783\",\"targetNodeId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec\",\"sourceAnchorId\":\"5886c5d4-3b49-4d15-8dea-63fba456b783_1\",\"targetAnchorId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec_2\",\"startPoint\":{\"x\":1071,\"y\":473},\"endPoint\":{\"x\":1027,\"y\":171},\"pointsList\":[{\"x\":1071,\"y\":473},{\"x\":1101,\"y\":473},{\"x\":1101,\"y\":201},{\"x\":1027,\"y\":201},{\"x\":1027,\"y\":171}]},{\"id\":\"830a7bba-ce69-45d1-9964-a2cb1b5383e0\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec\",\"targetNodeId\":\"b9de6086-b1b0-43eb-805d-972e7b1daa9d\",\"sourceAnchorId\":\"b38ab502-07ce-4367-b12c-8e8b48d230ec_1\",\"targetAnchorId\":\"b9de6086-b1b0-43eb-805d-972e7b1daa9d_3\",\"startPoint\":{\"x\":1087,\"y\":131},\"endPoint\":{\"x\":1186,\"y\":131},\"pointsList\":[{\"x\":1087,\"y\":131},{\"x\":1186,\"y\":131}]},{\"id\":\"2251b796-01e6-4fb7-8ed8-51d5ae7b1f4d\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"b9de6086-b1b0-43eb-805d-972e7b1daa9d\",\"targetNodeId\":\"44171ef1-8b0a-458c-8dbe-2703c97c20ab\",\"sourceAnchorId\":\"b9de6086-b1b0-43eb-805d-972e7b1daa9d_2\",\"targetAnchorId\":\"44171ef1-8b0a-458c-8dbe-2703c97c20ab_0\",\"startPoint\":{\"x\":1246,\"y\":171},\"endPoint\":{\"x\":1246,\"y\":321},\"pointsList\":[{\"x\":1246,\"y\":171},{\"x\":1246,\"y\":321}]}]}', NULL, 1, '2026-06-01 13:07:45', '2026-06-01 13:01:29', NULL, 3, 1, 1, NULL, NULL, NULL, 1, 'form1'),
(101, NULL, '测试', 3, '{\"nodes\":[{\"id\":\"start\",\"type\":\"start\",\"x\":264,\"y\":164,\"properties\":{\"width\":40,\"height\":40},\"text\":{\"x\":264,\"y\":164,\"value\":\"开始\"}},{\"id\":\"09e6a306-f4c8-4816-88c7-8c5ca81b4d33\",\"type\":\"userTask\",\"x\":584,\"y\":168,\"properties\":{\"width\":120,\"nodeName\":\"用户任务\",\"flowType\":2,\"height\":80,\"userType\":\"3\",\"joinUserId\":\"\",\"joinName\":\"直接领导\"},\"text\":{\"x\":584,\"y\":168,\"value\":\"用户任务\"}},{\"id\":\"3c8bd886-071d-4b7a-87c6-ed812c56052a\",\"type\":\"end\",\"x\":920,\"y\":172,\"properties\":{\"width\":40,\"height\":40}}],\"edges\":[{\"id\":\"bcb88fd1-3e26-448d-ac84-fad533d0ea0f\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"start\",\"targetNodeId\":\"09e6a306-f4c8-4816-88c7-8c5ca81b4d33\",\"sourceAnchorId\":\"start_1\",\"targetAnchorId\":\"09e6a306-f4c8-4816-88c7-8c5ca81b4d33_3\",\"startPoint\":{\"x\":284,\"y\":164},\"endPoint\":{\"x\":524,\"y\":168},\"pointsList\":[{\"x\":284,\"y\":164},{\"x\":404,\"y\":164},{\"x\":404,\"y\":168},{\"x\":524,\"y\":168}]},{\"id\":\"f5d1ac6f-14c2-4440-b5ab-a344a14731b8\",\"type\":\"connection\",\"properties\":{},\"sourceNodeId\":\"09e6a306-f4c8-4816-88c7-8c5ca81b4d33\",\"targetNodeId\":\"3c8bd886-071d-4b7a-87c6-ed812c56052a\",\"sourceAnchorId\":\"09e6a306-f4c8-4816-88c7-8c5ca81b4d33_1\",\"targetAnchorId\":\"3c8bd886-071d-4b7a-87c6-ed812c56052a_1\",\"startPoint\":{\"x\":644,\"y\":168},\"endPoint\":{\"x\":940,\"y\":172},\"pointsList\":[{\"x\":644,\"y\":168},{\"x\":659,\"y\":168},{\"x\":659,\"y\":137},{\"x\":955,\"y\":137},{\"x\":955,\"y\":172},{\"x\":940,\"y\":172}]}]}', NULL, 1, '2026-06-01 14:38:27', '2026-06-01 14:37:57', NULL, NULL, 1, 1, NULL, NULL, NULL, 0, '57'),
(102, NULL, '未命名', 1, '{list:[{type:\"input\",control:{modelValue:\"\"},formItem:{label:\"单行文本\"},name:\"input1780297578519\"},{type:\"select\",control:{modelValue:\"\",teleported:true},options:[],formItem:{label:\"下拉选择框\"},name:\"select1780297580302\"}],config:{submitCancel:true}}', NULL, 1, '2026-06-01 19:21:45', '2026-06-01 15:06:57', '{}', 2, 1, 1, NULL, NULL, NULL, NULL, NULL);

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
  `updateTime` datetime DEFAULT NULL,
  `userId` int(10) DEFAULT NULL COMMENT '负责人id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='部门';

--
-- 转存表中的数据 `sys_department`
--

INSERT INTO `sys_department` (`id`, `parentId`, `name`, `sort`, `status`, `remark`, `updateTime`, `userId`) VALUES
(1, 0, '广州分公司', 0, 1, '', NULL, NULL),
(2, 0, '北京分公司', 0, 1, '', NULL, NULL),
(3, 0, '上海分公司', 0, 1, '', NULL, 7),
(4, 1, '业务部', 0, 1, '', NULL, NULL),
(5, 1, '软件开发部', 0, 1, '', NULL, 1),
(6, 1, '设计部', 0, 1, '设计部', NULL, NULL),
(7, 3, '客服部', 0, 1, '', NULL, NULL),
(9, 7, '客服1部', 0, 1, '', NULL, NULL),
(10, 7, '客服2部', 0, 1, '', NULL, NULL),
(12, 1, '前台行政', 0, 1, '', NULL, NULL);

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
(26, '数据大屏分类', 'sys-screen', 1, '', '[{\"label\":\"大屏分类1\",\"value\":\"1\"},{\"label\":\"大屏分类2\",\"value\":\"2\"}]', '2023-11-28 17:27:23', 1),
(29, '流程审批状态', 'sys-flow-status', 1, '', '[{\"label\":\"进行中\",\"value\":\"0\"},{\"label\":\"完成\",\"value\":\"1\"},{\"label\":\"拒绝\",\"value\":\"2\"},{\"label\":\"已撤回\",\"value\":\"3\"},{\"label\":\"退回\",\"value\":\"4\"}]', '2024-11-25 16:23:50', NULL),
(30, '测试', 'ak-test', 1, '', NULL, '2026-05-28 09:04:54', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_flow`
--

CREATE TABLE `sys_flow` (
  `id` int(10) NOT NULL,
  `userId` int(11) NOT NULL COMMENT '申请人',
  `startTime` datetime NOT NULL COMMENT '申请时间',
  `endTime` datetime DEFAULT NULL COMMENT '完成时间',
  `formContent` text NOT NULL COMMENT '提交的表单内容',
  `status` int(2) NOT NULL COMMENT '0进行中 1完成 2拒绝 3已撤回 4退回',
  `currentNode` varchar(200) DEFAULT NULL COMMENT '当前节点id,多个,隔开',
  `currentUserId` varchar(50) DEFAULT NULL COMMENT '当前审批人',
  `flowId` int(10) NOT NULL COMMENT '所属流程id',
  `approver` varchar(200) DEFAULT NULL COMMENT '自选节点指定审批人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_flow`
--

INSERT INTO `sys_flow` (`id`, `userId`, `startTime`, `endTime`, `formContent`, `status`, `currentNode`, `currentUserId`, `flowId`, `approver`) VALUES
(43, 1, '2026-06-01 11:25:08', '2026-06-01 11:29:07', '{\"remark\":\"申请理由\\n申请理由\\n\"}', 3, '', '', 97, '{}'),
(44, 1, '2026-06-01 11:29:34', '2026-06-01 12:02:28', '{\"remark\":\"申请理由\"}', 1, '', '', 97, '{}'),
(45, 2, '2026-06-01 11:53:50', NULL, '{\"remark\":\"4141414\"}', 0, '{\"779800dd-98be-4ac3-87ac-bf10ff20180b\":{\"nodeName\":\"用户任务\",\"userId\":\"1\"}}', '1', 97, '{}'),
(46, 1, '2026-06-01 13:10:53', NULL, '{\"day\":\"10\",\"remark\":\"101010100\",\"type\":\"1\",\"startDate\":\"2026-06-01T16:00:00.000Z\",\"endDate\":\"2026-06-03T16:00:00.000Z\"}', 0, '{\"723d2767-9b50-4e0d-9039-7462279acd5c\":{\"nodeName\":\"经理审批\",\"userId\":\"1\"}}', '1', 100, '{}'),
(47, 1, '2026-06-01 13:28:56', NULL, '{\"type\":\"1\",\"startDate\":\"2026-06-02T16:00:00.000Z\",\"endDate\":\"2026-06-04T16:00:00.000Z\",\"day\":\"10\",\"remark\":\"10day\"}', 0, '{\"723d2767-9b50-4e0d-9039-7462279acd5c\":{\"nodeName\":\"经理审批\",\"userId\":\"1\"}}', '1', 100, '{}'),
(48, 1, '2026-06-01 13:58:46', NULL, '{\"type\":\"1\",\"startDate\":\"2026-06-06T16:00:00.000Z\",\"endDate\":\"2026-06-15T16:00:00.000Z\",\"day\":\"10\",\"remark\":\"010\"}', 0, '{\"723d2767-9b50-4e0d-9039-7462279acd5c\":{\"nodeName\":\"经理审批\",\"userId\":\"1\"}}', '1', 100, '{}'),
(49, 1, '2026-06-01 14:32:58', NULL, '{\"type\":\"1\",\"startTime\":\"2026-06-01\",\"endTime\":\"2026-06-16\",\"duration\":15,\"remark\":\"不填写不行吗\",\"files\":\"\"}', 0, '{\"225ad617-7420-4e61-9387-e8b9588232eb\":{\"nodeName\":\"上级主管审批\",\"userId\":\"1\"}}', '1', 98, '{}');

-- --------------------------------------------------------

--
-- 表的结构 `sys_flow_old`
--

CREATE TABLE `sys_flow_old` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL COMMENT '操作用户id',
  `title` varchar(50) NOT NULL COMMENT '流程审批标题',
  `creatTime` datetime NOT NULL COMMENT '发起时间',
  `status` int(2) DEFAULT NULL COMMENT '0待审批 1已撤回 2审批中3同意4拒绝5异常',
  `endTime` datetime DEFAULT NULL COMMENT '最后审批时间',
  `formId` int(10) NOT NULL COMMENT '提交流程表单保存信息id',
  `flowId` int(10) NOT NULL COMMENT '流程id',
  `currentApprover` varchar(50) DEFAULT NULL COMMENT '当前审批人',
  `copyIds` varchar(50) DEFAULT NULL COMMENT '抄送人id',
  `currentApproverIds` varchar(50) DEFAULT NULL COMMENT '当前审批人id',
  `currentNode` varchar(20) DEFAULT NULL COMMENT '当前节点',
  `nodeStatus` varchar(250) DEFAULT NULL COMMENT '节点审批状态',
  `nodeApprover` varchar(200) DEFAULT NULL COMMENT '节点自选审批抄送人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='流程表';

--
-- 转存表中的数据 `sys_flow_old`
--

INSERT INTO `sys_flow_old` (`id`, `userId`, `title`, `creatTime`, `status`, `endTime`, `formId`, `flowId`, `currentApprover`, `copyIds`, `currentApproverIds`, `currentNode`, `nodeStatus`, `nodeApprover`) VALUES
(43, 1, 'admin提交的请假申请审批', '2024-12-21 16:14:47', 2, '2024-12-21 16:16:32', 122, 36, 'user', '', '2', 'ycw8GypAtpSG', '{\"pSZf0OdyiyYl\":1,\"JNoJXzedKlqj\":4,\"ycw8GypAtpSG\":2,\"I791Z6Sty9Y8\":3}', '{}'),
(44, 1, 'admin提交的请假申请审批', '2024-12-23 08:48:32', 4, '2024-12-23 08:53:26', 123, 36, '', '', '', '', '{\"pSZf0OdyiyYl\":0,\"zZ9j6NSjzNBQ\":4,\"I791Z6Sty9Y8\":3}', '{}'),
(45, 2, 'user提交的请假申请审批', '2024-12-23 08:49:34', 4, '2024-12-23 08:53:15', 124, 36, '', '', '', '', '{\"pSZf0OdyiyYl\":0,\"zZ9j6NSjzNBQ\":4,\"I791Z6Sty9Y8\":3}', '{}'),
(46, 1, 'admin提交的通用流程审批申请审批', '2024-12-23 09:03:34', 3, '2024-12-23 09:04:52', 1, 30, '', '', '', '', '{\"9E4QZCAE\":1,\"jAH8nqoK\":4}', '{\"9E4QZCAE\":{\"id\":\"2\",\"name\":\"user\"}}'),
(47, 1, 'admin提交的通用流程审批申请审批', '2024-12-23 09:06:57', 2, '2024-12-23 09:07:22', 2, 30, 'admin', '', '1', 'YtpZSfzEa3pA', '{\"9E4QZCAE\":1,\"YtpZSfzEa3pA\":2,\"03hWmEiHgeAj\":3}', '{\"9E4QZCAE\":{\"id\":\"2\",\"name\":\"user\"}}');

-- --------------------------------------------------------

--
-- 表的结构 `sys_flow_record`
--

CREATE TABLE `sys_flow_record` (
  `id` int(11) NOT NULL,
  `flowId` int(10) NOT NULL COMMENT '所属流程',
  `userId` int(10) NOT NULL COMMENT '节点处理人id 0表示系统',
  `dateTime` datetime NOT NULL COMMENT '处理时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '处理意见',
  `status` int(2) NOT NULL COMMENT '1同意 2拒绝 3返回发起人 4撤回 5抄送同意 6系统通过',
  `nodeId` varchar(50) NOT NULL COMMENT '当前节点id',
  `nodeName` varchar(50) NOT NULL COMMENT '当前节点名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_flow_record`
--

INSERT INTO `sys_flow_record` (`id`, `flowId`, `userId`, `dateTime`, `remark`, `status`, `nodeId`, `nodeName`) VALUES
(61, 43, 1, '2026-06-01 11:29:07', '用户自行撤回', 4, '779800dd-98be-4ac3-87ac-bf10ff20180b', '用户任务'),
(62, 44, 1, '2026-06-01 12:02:28', '同意', 1, '779800dd-98be-4ac3-87ac-bf10ff20180b', '用户任务'),
(63, 44, 1, '2026-06-01 12:02:28', '抄送成功', 5, 'c8e23610-1862-46e3-a195-047595e7efd3', '抄送'),
(64, 44, 2, '2026-06-01 12:02:28', '抄送成功', 5, 'c8e23610-1862-46e3-a195-047595e7efd3', '抄送'),
(65, 44, 7, '2026-06-01 12:02:28', '抄送成功', 5, 'c8e23610-1862-46e3-a195-047595e7efd3', '抄送'),
(66, 46, 0, '2026-06-01 13:10:53', '没有审批人自动通过', 6, '4257ec39-ae7a-4a82-963d-cdeb7e2c9082', '主管审批'),
(67, 47, 0, '2026-06-01 13:28:56', '没有审批人自动通过', 6, '4257ec39-ae7a-4a82-963d-cdeb7e2c9082', '主管审批'),
(68, 48, 1, '2026-06-01 13:59:35', '能不同意吗', 1, '4257ec39-ae7a-4a82-963d-cdeb7e2c9082', '主管审批');

-- --------------------------------------------------------

--
-- 表的结构 `sys_flow_record_old`
--

CREATE TABLE `sys_flow_record_old` (
  `id` int(10) NOT NULL,
  `flowId` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `datetime` datetime NOT NULL,
  `approverId` int(10) NOT NULL COMMENT '审批人',
  `status` int(4) NOT NULL COMMENT '0拒绝1同意2流转3撤回',
  `nodeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='流程审批记录';

--
-- 转存表中的数据 `sys_flow_record_old`
--

INSERT INTO `sys_flow_record_old` (`id`, `flowId`, `content`, `datetime`, `approverId`, `status`, `nodeName`) VALUES
(59, 43, '同意', '2024-12-21 16:16:32', 1, 1, 'pSZf0OdyiyYl'),
(60, 45, '拒绝', '2024-12-23 08:53:15', 1, 0, 'pSZf0OdyiyYl'),
(61, 44, '拒绝', '2024-12-23 08:53:26', 1, 0, 'pSZf0OdyiyYl'),
(62, 46, '同意', '2024-12-23 09:04:52', 2, 1, '9E4QZCAE'),
(63, 47, '同意', '2024-12-23 09:07:23', 2, 1, '9E4QZCAE'),
(64, 48, '抄送成功', '2025-04-27 09:59:06', 0, 1, 'AHWkzsXpZmzH'),
(65, 48, '同意', '2025-04-27 09:59:06', 1, 1, 'NZbGCJQ0nJPn'),
(66, 49, '抄送成功', '2025-04-27 10:12:41', 0, 1, 'AHWkzsXpZmzH'),
(67, 49, '同意', '2025-04-27 10:12:41', 1, 1, 'NZbGCJQ0nJPn');

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
(61, 'admin', '127.0.0.1', NULL, '2024-02-02 11:18:28', 1),
(62, 'admin', '127.0.0.1', NULL, '2024-02-21 10:13:03', 1),
(63, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-07-14 12:01:48', 1),
(64, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-07-15 11:38:57', 1),
(65, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-08-03 09:36:53', 1),
(66, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-08-03 12:51:15', 1),
(67, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-08-06 22:30:05', 1),
(68, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-08-08 22:12:16', 1),
(69, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-09-19 20:12:38', 1),
(71, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-16 12:28:57', 1),
(72, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-16 12:36:04', 1),
(73, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-16 12:36:44', 1),
(74, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-16 12:39:31', 1),
(75, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-17 12:18:11', 1),
(76, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-18 11:12:07', 1),
(77, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-25 12:39:01', 1),
(78, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-28 10:03:31', 1),
(79, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-28 10:29:47', 1),
(80, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-30 10:55:40', 1),
(81, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-10-31 10:20:58', 1),
(82, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-01 14:28:29', 1),
(83, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-01 14:36:00', 1),
(84, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-05 08:31:12', 1),
(85, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-06 11:11:17', 1),
(86, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-07 15:31:45', 1),
(87, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-08 10:10:04', 1),
(88, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-10 13:21:26', 1),
(89, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-11 09:38:01', 1),
(90, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-12 13:22:01', 1),
(91, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-13 12:11:52', 1),
(92, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-14 10:23:12', 1),
(93, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-15 10:56:34', 1),
(94, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-18 12:39:38', 1),
(95, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-19 09:50:27', 1),
(96, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-19 15:31:54', 1),
(97, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-20 10:51:18', 1),
(98, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-20 15:31:06', 1),
(99, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-21 08:22:52', 1),
(100, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-22 13:15:17', 1),
(101, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-25 10:35:37', 1),
(102, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-26 09:48:32', 1),
(103, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-26 09:53:47', 1),
(104, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-26 13:35:52', 1),
(105, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-26 13:37:38', 1),
(106, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-27 08:27:41', 1),
(107, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-28 09:37:31', 1),
(108, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-29 08:44:09', 1),
(109, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-29 12:00:46', 1),
(110, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-29 14:52:44', 1),
(111, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-11-30 08:58:48', 1),
(112, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-11 15:37:46', 1),
(113, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-12 13:05:03', 1),
(114, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-13 08:21:25', 1),
(115, 'user', '0:0:0:0:0:0:0:1', NULL, '2024-12-13 16:22:28', 1),
(116, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-14 09:15:34', 1),
(117, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-14 16:15:04', 1),
(118, 'user', '0:0:0:0:0:0:0:1', NULL, '2024-12-14 16:15:22', 1),
(119, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-16 11:42:38', 1),
(120, 'user', '0:0:0:0:0:0:0:1', NULL, '2024-12-17 10:16:47', 1),
(121, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-19 14:17:06', 1),
(122, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-20 09:18:31', 1),
(123, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-21 14:32:03', 1),
(124, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-23 08:47:08', 1),
(125, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-23 08:48:07', 1),
(126, 'user', '0:0:0:0:0:0:0:1', NULL, '2024-12-23 08:49:18', 1),
(127, 'admin', '0:0:0:0:0:0:0:1', NULL, '2024-12-31 08:31:47', 1),
(128, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-01-01 10:15:17', 1),
(129, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-04-20 14:58:01', 1),
(130, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-04-23 11:56:45', 1),
(131, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-04-26 10:04:50', 1),
(132, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-04-27 08:15:27', 1),
(133, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-04-30 14:38:48', 1),
(134, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-05-06 15:58:16', 1),
(135, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-05-07 10:19:58', 1),
(136, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-05-07 15:31:46', 1),
(137, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-05-09 16:16:48', 1),
(138, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-05-12 15:54:32', 1),
(139, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-05-23 09:57:49', 1),
(140, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-19 16:07:57', 1),
(141, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-20 08:38:54', 1),
(142, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-20 08:45:13', 1),
(143, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-24 08:36:29', 1),
(144, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-25 08:45:18', 1),
(145, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-26 08:26:54', 1),
(146, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-27 08:40:50', 1),
(147, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-29 14:44:09', 1),
(148, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-06-30 08:34:20', 1),
(149, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-07-01 09:01:38', 1),
(150, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-07-02 08:48:49', 1),
(151, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-09-01 10:54:40', 1),
(152, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-09-04 12:31:28', 1),
(153, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-03-23 08:09:26', 1),
(154, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-23 08:10:31', 1),
(155, 'test', '0:0:0:0:0:0:0:1', NULL, '2026-03-23 10:29:24', 1),
(156, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-03-25 15:33:03', 1),
(157, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-25 15:33:14', 1),
(158, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-25 15:34:47', 1),
(159, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-25 15:36:06', 1),
(160, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-25 15:38:54', 1),
(161, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-25 15:40:17', 1),
(162, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-03-26 08:45:47', 1),
(163, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-27 09:30:01', 1),
(164, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-27 09:31:04', 1),
(165, 'user', '0:0:0:0:0:0:0:1', NULL, '2026-03-27 09:33:26', 1),
(166, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-04-01 11:39:06', 1),
(167, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-04-01 11:44:11', 1),
(191, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-05-30 08:31:34', 1),
(192, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-05-30 17:26:30', 1),
(193, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-05-30 17:31:55', 1),
(194, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-05-31 10:12:07', 1),
(195, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-05-31 14:56:52', 1),
(196, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-06-01 08:38:49', 1),
(197, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-06-01 17:12:36', 1),
(198, 'admin', '0:0:0:0:0:0:0:1', NULL, '2026-06-02 08:07:32', 1);

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
(19, 2, '数据大屏管理', 'icon-data', 8, '/design/screen/list', 1, '', 1, 1),
(20, 2, '流程设计管理', 'icon-tree', 6, '/design/flow/list', 1, '', 1, 1),
(21, 0, '工作台', 'icon-work', 0, '', 1, '', 1, 1),
(22, 21, '发起流程', 'icon-apply', 0, '/task/apply', 1, '', 1, 1),
(23, 21, '待办任务', 'icon-todo', 2, '/task/todo', 1, '', 1, 1),
(24, 21, '已办事项', 'icon-done', 1, '/task/done', 1, '', 1, 1),
(25, 21, '我发起的', 'icon-applyed', 6, '/task/my', 1, '', 1, 1),
(26, 21, '抄送事项', 'icon-cs', 8, '/task/copy', 1, '', 1, 1),
(27, 1, '组件示例', 'icon-doc', 0, '/design/list/content/78', 1, '', 3, 1),
(28, 1, '客户信息', 'icon-user', 0, '/design/list/content/80', 1, '', 3, 1),
(29, 4, 'swagger文档', 'icon-work', 6, '/api/swagger-ui/index.html', 1, '', 1, 1),
(35, 1, '升级测试', 'icon-mouse', 0, '/design/list/content/95', 1, '', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sys_post`
--

CREATE TABLE `sys_post` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_post`
--

INSERT INTO `sys_post` (`id`, `name`) VALUES
(1, '开发工程师'),
(2, '主管');

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
(1, '管理员', 1, '4,29,7,6,5,3,15,14,13,12,11,10,9,8,2,20,19,18,17,16', ''),
(2, '普通会员', 1, '21,26,25,24,23,22,3,15,14,13,12,11,10,9,8,2,20,19,17,16,1,35,28,27', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_upload_files`
--

CREATE TABLE `sys_upload_files` (
  `id` int(10) NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `fileUrl` varchar(100) NOT NULL,
  `userId` int(10) NOT NULL,
  `creatTime` datetime NOT NULL DEFAULT current_timestamp(),
  `md5` varchar(50) NOT NULL,
  `groupId` int(10) DEFAULT NULL,
  `size` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='文件上传列表';

--
-- 转存表中的数据 `sys_upload_files`
--

INSERT INTO `sys_upload_files` (`id`, `fileName`, `fileUrl`, `userId`, `creatTime`, `md5`, `groupId`, `size`) VALUES
(39, '2.png', '/upload/2.png', 1, '2025-07-02 11:14:35', '5eecbf57ceef0857760389fa4e8f9c4e', NULL, 153336);

-- --------------------------------------------------------

--
-- 表的结构 `sys_upload_group`
--

CREATE TABLE `sys_upload_group` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `creatTime` datetime NOT NULL DEFAULT current_timestamp(),
  `userId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='上传文件分组';

--
-- 转存表中的数据 `sys_upload_group`
--

INSERT INTO `sys_upload_group` (`id`, `name`, `creatTime`, `userId`) VALUES
(1, '视频文件', '2023-10-09 17:32:25', 0),
(2, '图片文件', '2023-10-09 17:35:52', NULL);

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
  `ip` varchar(50) DEFAULT NULL COMMENT '登录ip地址',
  `picture` varchar(50) DEFAULT NULL COMMENT '头像'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`id`, `userName`, `nickName`, `phone`, `status`, `roleId`, `password`, `departmentId`, `postId`, `remark`, `creatTime`, `updateTime`, `lastLoginTime`, `loginTimer`, `ip`, `picture`) VALUES
(1, 'admin', '管理员', '13800138000', 1, '2,1', '123456', 5, 1, '', NULL, NULL, '2026-06-02 08:07:32', 206, '0:0:0:0:0:0:0:1', NULL),
(2, 'user', '会员', '', 1, '2', '123456', 5, 0, '', NULL, NULL, '2026-03-27 09:33:26', 31, '0:0:0:0:0:0:0:1', NULL),
(7, 'hr', 'test', '', 1, '2', '123456', 12, NULL, '', '2024-11-29 11:56:07', NULL, NULL, NULL, NULL, NULL),
(8, 'test', 'test', '', 1, '', '123456', NULL, NULL, '', '2026-03-23 10:24:42', NULL, '2026-03-23 10:29:24', 1, '0:0:0:0:0:0:0:1', NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `ak-componentdemo`
--
ALTER TABLE `ak-componentdemo`
  ADD PRIMARY KEY (`id`);

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
-- 表的索引 `ak-flow-comm`
--
ALTER TABLE `ak-flow-comm`
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
-- 表的索引 `sys_flow_old`
--
ALTER TABLE `sys_flow_old`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_flow_record`
--
ALTER TABLE `sys_flow_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_flow_record_old`
--
ALTER TABLE `sys_flow_record_old`
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
-- 表的索引 `sys_post`
--
ALTER TABLE `sys_post`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_upload_files`
--
ALTER TABLE `sys_upload_files`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_upload_group`
--
ALTER TABLE `sys_upload_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ak-componentdemo`
--
ALTER TABLE `ak-componentdemo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `ak-customer`
--
ALTER TABLE `ak-customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `ak-demo-test`
--
ALTER TABLE `ak-demo-test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `ak-flow-comm`
--
ALTER TABLE `ak-flow-comm`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `ak-holidays`
--
ALTER TABLE `ak-holidays`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- 使用表AUTO_INCREMENT `datasource`
--
ALTER TABLE `datasource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用表AUTO_INCREMENT `design`
--
ALTER TABLE `design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- 使用表AUTO_INCREMENT `sys_department`
--
ALTER TABLE `sys_department`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `sys_dict`
--
ALTER TABLE `sys_dict`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- 使用表AUTO_INCREMENT `sys_flow`
--
ALTER TABLE `sys_flow`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用表AUTO_INCREMENT `sys_flow_old`
--
ALTER TABLE `sys_flow_old`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用表AUTO_INCREMENT `sys_flow_record`
--
ALTER TABLE `sys_flow_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- 使用表AUTO_INCREMENT `sys_flow_record_old`
--
ALTER TABLE `sys_flow_record_old`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- 使用表AUTO_INCREMENT `sys_login_log`
--
ALTER TABLE `sys_login_log`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- 使用表AUTO_INCREMENT `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- 使用表AUTO_INCREMENT `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `sys_upload_files`
--
ALTER TABLE `sys_upload_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `sys_upload_group`
--
ALTER TABLE `sys_upload_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
