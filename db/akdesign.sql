-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2025-07-02 06:08:26
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
(4, '客户名称', '手机号码', '微信', '2024-11-28 00:00:00', '公司名称', 0, '', 1),
(5, '客户名称22', '13813801380', '123456', '2024-11-11 00:00:00', '公司名称', 1, '', 1);

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
(5, '标题名称开', 0, '[3,4]', 1, '2024-11-12 00:00:00', 1, '', '', '', '', '', '', '', '[]', '[{\"input1706851786349\":\"姓名\",\"tel\":\"\"}]');

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
(2, '申请内容', '');

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
(20, '组件示例测试', 'ak-demo-test', 1, 1, '2024-02-01 09:41:59', '2024-11-22 13:40:01', 1, 1, '', '[{\"name\":\"inputText\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"标题名称\",\"filedType\":\"input\"},{\"name\":\"radio\",\"type\":\"INT\",\"length\":\"2\",\"label\":\"性别\",\"filedType\":\"radio\"},{\"name\":\"checkbox\",\"type\":\"VARCHAR\",\"length\":\"20\",\"empty\":true,\"label\":\"多选\",\"filedType\":\"checkbox\"},{\"name\":\"select1\",\"type\":\"INT\",\"length\":\"2\",\"empty\":true,\"label\":\"选择框\",\"filedType\":\"select\"},{\"name\":\"dateTime\",\"type\":\"DATETIME\",\"empty\":true,\"label\":\"日期时间\",\"filedType\":\"datePicker\"},{\"name\":\"switch\",\"type\":\"INT\",\"length\":\"2\",\"empty\":true,\"label\":\"开关\",\"filedType\":\"switch\"},{\"name\":\"textarea\",\"type\":\"TEXT\",\"length\":\"100\",\"empty\":true,\"label\":\"多行文本\",\"filedType\":\"textarea\"},{\"name\":\"upload\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"图片文件上传\",\"filedType\":\"upload\"},{\"name\":\"component\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"自定义组件\"},{\"name\":\"user\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"选择用户\"},{\"name\":\"prepend\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"前缀\"},{\"name\":\"select2\",\"type\":\"VARCHAR\",\"length\":\"50\",\"empty\":true,\"label\":\"复合型\"},{\"name\":\"tinymce\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"内容\",\"filedType\":\"tinymce\"},{\"name\":\"table2\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"子表\"},{\"name\":\"flex\",\"type\":\"TEXT\",\"empty\":true,\"label\":\"弹性\"}]'),
(22, '通用流程审批', 'ak-flow-comm', 2, 1, '2024-12-23 09:00:41', '2024-12-23 09:00:41', 1, NULL, '通用流程', '[{\"name\":\"content\",\"type\":\"VARCHAR\",\"length\":\"200\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"申请内容\",\"filedType\":\"textarea\",\"search\":false,\"isNew\":1},{\"name\":\"files\",\"type\":\"VARCHAR\",\"length\":\"50\",\"default\":\"\",\"remark\":\"\",\"empty\":true,\"label\":\"文件附件\",\"filedType\":\"upload\",\"search\":false,\"isNew\":1}]');

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
(29, 37, '出差', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"},{id:\"yD5kFCsl\",nodeType:2,parentId:\"\",userType:\"2\",flowType:\"1\",content:\"上级主管\",priority:1,checkedUserId:\"\",remark:\"\"}]', '', 1, '2024-12-21 16:29:56', '2030-12-12 12:12:12', '', 3, 1, 1, 1, '', 'icon-component,#0015FF'),
(30, 82, '通用流程审批', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"},{id:\"9E4QZCAE\",nodeType:2,parentId:\"\",userType:\"3\",flowType:\"1\",content:\"发起人自选\",priority:1,checkedUserId:\"\",remark:\"\"},{id:\"YtpZSfzEa3pA\",nodeType:2,parentId:\"\",userType:\"1\",flowType:\"1\",content:\"admin\",priority:1,checkedUserId:\"1\",remark:\"\"},{id:\"03hWmEiHgeAj\",nodeType:3,parentId:\"\",userType:\"1\",flowType:\"1\",content:\"hr\",priority:1,checkedUserId:\"7\",remark:\"\"}]', '', 1, '2024-12-23 09:06:15', '2030-12-12 12:12:12', '', 3, 1, 1, 1, '', 'icon-sp,#007BFF'),
(35, 37, '加班', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"}]', '', 1, '2024-11-25 12:45:35', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', 'icon-number,#F90404'),
(36, 37, '请假', 3, '[{id:\"start\",nodeType:1,parentId:\"\",content:\"发起人\"},{id:\"pSZf0OdyiyYl\",nodeType:2,parentId:\"\",userType:\"2\",flowType:\"1\",content:\"上级主管\",priority:1,checkedUserId:\"\",remark:\"\"},{id:\"wO6ksKgPATSO\",nodeType:4,parentId:\"\"},{id:\"I791Z6Sty9Y8\",nodeType:3,parentId:\"\",userType:\"1\",flowType:\"1\",content:\"hr\",priority:1,checkedUserId:\"7\",remark:\"\"},{id:\"JNoJXzedKlqj\",nodeType:5,parentId:\"wO6ksKgPATSO\",priority:1,userType:\"\",flowType:\"\",content:\"duration>2\",checkedUserId:\"\"},{id:\"ycw8GypAtpSG\",nodeType:2,parentId:\"JNoJXzedKlqj\",userType:\"1\",flowType:\"1\",content:\"user\",priority:1,checkedUserId:\"2\"},{id:\"zZ9j6NSjzNBQ\",nodeType:5,parentId:\"wO6ksKgPATSO\",content:\"其他条件进入此流程\",priority:0}]', '', 1, '2025-04-27 09:34:15', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', 'icon-post,#A20A0A'),
(37, 14, '请假流程表单', 1, '{list:[{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"事假\",value:\"1\"},{label:\"病假\",value:\"2\"},{label:\"调休\",value:\"3\"},{label:\"产假\",value:\"4\"},{label:\"陪产假\",value:\"5\"},{label:\"婚假\",value:\"6\"},{label:\"丧假\",value:\"7\"}],config:{optionsType:0,transformData:\"string\"},name:\"type\",formItem:{label:\"请假类型\",rules:[{required:true,message:\"请选择请假类型\",trigger:\"change\"}]}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",placeholder:\"请填写开始时间\",valueFormat:\"YYYY-MM-DD\"},config:{},name:\"startTime\",formItem:{label:\"开始时间\",rules:[{required:true,message:\"请选择开始时间\",trigger:\"change\"}]}},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",placeholder:\"请填写结束时间\",valueFormat:\"YYYY-MM-DD\"},config:{},name:\"endTime\",formItem:{label:\"结束时间\",rules:[{required:true,message:\"请选择结束时间\",trigger:\"change\"},{validator:(rule, value, callback) =>\r\n        {\r\n          const val = getaskForLeaveValueByName(\'startTime\')\r\n          if (value <= val)\r\n          {\r\n            callback(new Error(\'结束时间必须大于开始时间\'))\r\n          }\r\n          else\r\n          {\r\n            callback()\r\n          }\r\n        },trigger:\"blur\"}]}},{type:\"input\",control:{modelValue:\"\",placeholder:\"自动计算时长\",disabled:true},config:{append:\"天\"},name:\"duration\",formItem:{label:\"时长\"}},{type:\"textarea\",control:{modelValue:\"\",placeholder:\"不填写不能通过\"},config:{span:24},name:\"remark\",formItem:{label:\"请假事由\",rules:[{required:true,message:\"请填写请假事由\",trigger:\"change\"}]}},{type:\"upload\",control:{modelValue:\"\"},config:{},name:\"files\",formItem:{label:\"图片附件\",rules:[]}}],form:{size:\"default\",class:\"form-row-2\",labelWidth:\"100px\",name:\"askForLeave\"},config:{submitCancel:true,sourceId:14,name:\"请假流程表单\"},events:{change:(\r\n{\r\n  name,\r\n  model\r\n}) =>\r\n{\r\n  // name当前改变组件的值,model表单的值\r\n  console.log(model)\r\n  if ([\'startTime\', \'endTime\'].includes(name) && model.startTime && model.endTime)\r\n  {\r\n    model.duration = (new Date(model.endTime) - new Date(model.startTime)) / (1000 * 60 * 60 * 24)\r\n  }\r\n  return model\r\n}}}', '', 1, '2024-12-21 14:47:03', '2030-12-12 12:12:12', '{}', 2, 1, 1, NULL, '', NULL),
(39, 0, '可视化数据大屏示例', 4, '{list:[{id:\"rect\",type:\"tempRect\",position:{width:200,height:200,display:true}},{type:\"background\",position:{height:\"105\",left:0,top:0,display:false,width:\"100%\"},config:{src:\"./static/screen/bg/head_bg.png\",lock:false},id:\"background17210383022510\"},{type:\"text\",position:{height:30,left:0,top:20,zIndex:0,width:\"100%\"},config:{text:\"大数据可视化系统数据分析通用模版\",style:{fontSize:\"20px\",\"text-align\":\"center\"},lock:false,optionsType:0},id:\"text17210383022511\"},{type:\"line\",position:{width:550,height:280,left:32,top:139,zIndex:2},option:{tooltip:{},grid:{left:\"0\",top:\"30\",right:\"20\",bottom:\"10\",containLabel:true},xAxis:[{type:\"category\",boundaryGap:false,axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},data:\"{{getScreenGlobal.line.xAxis}}\"},{axisPointer:{show:false},axisLine:{show:false},position:\"bottom\",offset:20}],yAxis:[{type:\"value\",axisTick:{show:false},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}}}],series:[{name:\"模块标题\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:10,showSymbol:true,lineStyle:{normal:{color:\"rgba(228, 228, 126, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(228, 228, 126, .8)\"},{offset:0.8,color:\"rgba(228, 228, 126, 0.1)\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:\"{{getScreenGlobal.line.data}}\"}]},config:{lock:false,optionsType:0},events:{},id:\"line17210383022512\"},{type:\"text\",position:{width:100,height:30,left:32,top:453,zIndex:2},config:{text:\"使用动态形式\",lock:false},id:\"text17210383022513\"},{type:\"border\",position:{width:570,height:310,left:20,top:440},config:{style:{},class:\"border\",lock:false},id:\"border17210383022514\"},{type:\"border\",position:{width:570,height:310,left:20,top:110,zIndex:0},config:{style:{},lock:false,class:\"border\"},id:\"border17210383022515\"},{type:\"text\",position:{width:260,height:69,left:604,top:164},config:{text:\"{{getScreenGlobal.textNum1}}\",style:{fontSize:\"36px\",color:\"rgba(254, 3, 3, 1)\",fontWeight:\"700\"},optionsType:0},id:\"text17210383022516\"},{type:\"echarts\",position:{width:148,height:148,left:929,top:142},option:{title:{text:\"80%\",x:\"center\",y:\"center\",textStyle:{fontWeight:\"normal\",color:\"#fff\",fontSize:\"18\"}},color:\"#49bcf7\",series:[{name:\"Line 1\",type:\"pie\",clockWise:true,radius:[\"65%\",\"80%\"],itemStyle:{normal:{label:{show:false},labelLine:{show:false}}},hoverAnimation:false,data:[{value:\"{{getScreenGlobal.pie[0]}}\",name:\"已使用\",itemStyle:{normal:{color:\"#eaff00\",label:{show:false},labelLine:{show:false}}}},{name:\"未使用\",value:\"{{getScreenGlobal.pie[1]}}\"}]}]},config:{optionsType:0},id:\"echarts17210383022517\"},{type:\"echarts\",position:{width:148,height:148,left:1101,top:143},option:{title:{text:\"60%\",x:\"center\",y:\"center\",textStyle:{fontWeight:\"normal\",color:\"#fff\",fontSize:\"18\"}},color:\"#49bcf7\",series:[{name:\"Line 1\",type:\"pie\",clockWise:true,radius:[\"65%\",\"80%\"],itemStyle:{normal:{label:{show:false},labelLine:{show:false}}},hoverAnimation:false,data:[{value:\"{{getScreenGlobal.pie2[0]}}\",name:\"已使用\",itemStyle:{normal:{color:\"#ea4d4d\",label:{show:false},labelLine:{show:false}}}},{name:\"未使用\",value:\"{{getScreenGlobal.pie2[1]}}\"}]}]},config:{optionsType:0},id:\"echarts17210383022518\"},{type:\"echarts\",position:{width:394,height:271,left:1474,top:140,zIndex:2},option:{tooltip:{},radar:[{indicator:[{text:\"盈利能力\",max:100},{text:\"发展水平\",max:100},{text:\"融资能力\",max:100},{text:\"技术能力\",max:100},{text:\"企业规模\",max:100}],textStyle:{color:\"red\"},center:[\"50%\",\"50%\"],radius:\"70%\",startAngle:90,splitNumber:4,shape:\"circle\",name:{padding:-5,formatter:\"{value}\",textStyle:{fontSize:14,color:\"rgba(255,255,255,.6)\"}},splitArea:{areaStyle:{color:\"rgba(255,255,255,.05)\"}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}}}],series:[{name:\"雷达图\",type:\"radar\",tooltip:{trigger:\"item\"},data:[{name:\"园区平均值\",value:\"{{getScreenGlobal.radar.list[0]}}\",lineStyle:{normal:{color:\"#03b48e\",width:2}},areaStyle:{normal:{color:\"#03b48e\",opacity:0.4}},symbolSize:0},{name:\"当前园区\",value:\"{{getScreenGlobal.radar.list[1]}}\",symbolSize:0,lineStyle:{normal:{color:\"#3893e5\",width:2}},areaStyle:{normal:{color:\"rgba(19, 173, 255, 0.5)\"}}}]}]},config:{lock:false,optionsType:0},id:\"echarts17210383022519\"},{type:\"border\",position:{width:470,height:310,left:1440,top:110},config:{style:{border:\"\"},class:\"border\",lock:false},id:\"border172103830225110\"},{type:\"pie\",position:{width:394,height:271,left:1486,top:466,zIndex:2},option:{tooltip:{},legend:{orient:\"vertical\",left:\"left\",color:\"#fff\"},series:\"{{getScreenGlobal.pie3}}\"},config:{lock:false,optionsType:0},id:\"pie172103830225111\"},{type:\"text\",position:{width:100,height:30,left:607,top:123},config:{text:\"使用全局数据\"},id:\"text172103830225112\"},{type:\"border\",position:{width:808,height:439,left:610,top:312},config:{style:{border:\"\"},class:\"border\",lock:false},id:\"border172103830225113\"},{type:\"echarts\",position:{width:780,height:407,left:626,top:332,zIndex:2},option:{tooltip:{trigger:\"axis\",axisPointer:{type:\"shadow\"}},legend:{x:\"center\",y:\"0\",icon:\"circle\",itemGap:8,textStyle:{color:\"rgba(255,255,255,.5)\"},itemWidth:10,itemHeight:10},grid:{left:\"0\",top:\"30\",right:\"15\",bottom:\"0\",containLabel:true},xAxis:{type:\"category\",data:[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"],axisLine:{show:false},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}}},yAxis:{type:\"value\",splitNumber:4,axisLine:{show:false},axisTick:{show:false},splitLine:{show:true,lineStyle:{color:\"rgba(255,255,255,0.05)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}}},series:[{name:\"字段1\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#8bd46e\"},{offset:1,color:\"#03b48e\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[77,35,319,364,364,416,244,45,331,267,301,353]},{name:\"字段2\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#3893e5\"},{offset:1,color:\"#248ff7\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[86,114,70,159,196,5,197,461,12,235,252,340]},{name:\"字段3\",type:\"bar\",barWidth:\"15%\",itemStyle:{normal:{color:{colorStops:[{offset:0,color:\"#43cadd\"},{offset:1,color:\"#0097c9\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},barBorderRadius:11}},data:[23,354,334,221,178,190,234,354,334,221,178,190]}]},config:{lock:false},id:\"echarts172103830225114\"},{type:\"bar\",position:{width:550,height:277,left:28,top:471},option:{tooltip:{trigger:\"axis\",axisPointer:{lineStyle:{color:\"#dddc6b\"}}},grid:{left:\"0\",top:\"30\",right:\"20\",bottom:\"10\",containLabel:true},legend:{data:[\"字段1\",\"字段2\"],right:\"center\",top:0,textStyle:{color:\"#fff\"},itemWidth:12,itemHeight:10},xAxis:[{type:\"category\",boundaryGap:false,axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},data:[\"8:00\",\"9:00\",\"10:00\",\"11:00\",\"12:00\",\"13:00\",\"14:00\",\"15:00\",\"16:00\",\"17:00\",\"18:00\",\"19:00\",\"20:00\",\"21:00\",\"22:00\"]},{axisPointer:{show:false},axisLine:{show:false},position:\"bottom\",offset:20}],yAxis:[{type:\"value\",axisTick:{show:false},axisLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}},axisLabel:{textStyle:{color:\"rgba(255,255,255,.6)\",fontSize:14}},splitLine:{lineStyle:{color:\"rgba(255,255,255,.1)\"}}}],series:[{name:\"字段1\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:5,showSymbol:false,lineStyle:{normal:{color:\"rgba(228, 228, 126, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(228, 228, 126, .8)\"},{offset:0.8,color:\"rgba(228, 228, 126, 0.1)\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:[191,203,315,429,179,78,373,10,393,469,176,126,349,119,293]},{name:\"字段2\",type:\"line\",smooth:true,symbol:\"circle\",symbolSize:5,showSymbol:false,lineStyle:{normal:{color:\"rgba(255, 128, 128, 1)\",width:2}},areaStyle:{normal:{color:{colorStops:[{offset:0,color:\"rgba(255, 128, 128,.8)\"},{offset:0.8,color:\"rgba(255, 128, 128, .1)\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false},shadowColor:\"rgba(0, 0, 0, 0.1)\"}},itemStyle:{normal:{color:\"#dddc6b\",borderColor:\"rgba(221, 220, 107, .1)\",borderWidth:12}},data:[298,226,11,422,24,489,234,401,323,300,335,218]}]},config:{lock:false,optionsType:1,requestUrl:\"demo/echarts\",method:\"post\"},events:{},id:\"bar172103830225115\"},{type:\"text\",position:{width:100,height:30,left:627,top:780,zIndex:2},config:{text:\"模块标题\",lock:false},id:\"text172103830225116\"},{type:\"border\",position:{width:808,height:276,left:610,top:764},config:{style:{border:\"\"},class:\"border\",lock:false},id:\"border172103830225117\"},{type:\"bar\",position:{width:757,height:237,left:635,top:800,zIndex:2},option:{tooltip:{trigger:\"axis\",axisPointer:{type:\"shadow\"}},grid:{top:\"20%\",right:\"50\",bottom:\"20\",left:\"30\"},legend:{data:[\"数据1\",\"数据2\",\"数据3\",\"增幅\"],right:\"center\",width:\"100%\",textStyle:{color:\"rgba(255,255,255,.5)\"},itemWidth:12,itemHeight:10},xAxis:[{type:\"category\",data:[\"2016\",\"2017\",\"2018\",\"2019\"],axisLine:{show:false},axisLabel:{textStyle:{fontSize:14,color:\"rgba(255,255,255,.5)\"}}}],yAxis:[{type:\"value\",axisTick:{show:false},splitLine:{show:false},axisLine:{min:0,max:10,show:false},axisLabel:{show:true,fontSize:14,color:\"rgba(255,255,255,.5)\"}},{type:\"value\",show:true,axisLabel:{formatter:\"{value} %\",fontSize:14,color:\"rgba(255,255,255,.5)\"},axisTick:{show:false},splitNumber:3,axisLine:{show:false},splitLine:{lineStyle:{color:\"rgba(255,255,255,.05)\"}}}],series:[{name:\"数据1\",type:\"bar\",data:[36.6,38.8,40.84,41.6],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#8bd46e\"},{offset:1,color:\"#09bcb7\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"数据2\",type:\"bar\",data:[14.8,14.1,15,16.3],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#248ff7\"},{offset:1,color:\"#6851f1\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"数据3\",type:\"bar\",data:[9.2,9.1,9.85,8.9],barWidth:\"10%\",itemStyle:{normal:{barBorderRadius:15,color:{colorStops:[{offset:0,color:\"#fccb05\"},{offset:1,color:\"#f5804d\"}],x:0,y:0,x2:0,y2:1,type:\"linear\",global:false}}},barGap:\"0.2\"},{name:\"增幅\",type:\"line\",yAxisIndex:1,data:[3,1,5,2.3],lineStyle:{normal:{width:2}},itemStyle:{normal:{color:\"#3496f8\"}},symbolSize:0}]},config:{lock:false},id:\"bar172103830225118\"},{type:\"text\",position:{width:100,height:30,left:32,top:119},config:{text:\"使用全局数据\",lock:false},id:\"text172103830225119\"},{type:\"clock\",position:{width:320,height:30,left:1600,top:21,zIndex:0},config:{style:{fontSize:\"20px\"},dateTime:\"{y}年{m}月{d}日 {h}:{i}:{s} 星期{w}\",lock:false},id:\"clock172103830225120\"},{type:\"text\",position:{width:100,height:30,left:1455,top:123},config:{text:\"模块标题\",lock:false},id:\"text172103830225121\"},{type:\"border\",position:{width:470,height:310,left:1440,top:440},config:{style:{border:\"\"},class:\"border\",lock:false},id:\"border172103830225122\"},{type:\"bar\",position:{width:389,height:239,left:1492,top:795,zIndex:2},option:{tooltip:{show:false},grid:{top:\"0%\",left:\"50\",right:\"50\",bottom:\"0%\"},xAxis:{min:0,splitLine:{show:false},axisTick:{show:false},axisLine:{show:false},axisLabel:{show:false}},yAxis:{data:[\"数据\",\"数据\",\"数据\",\"数据\",\"数据\",\"数据\"],axisTick:{show:false},axisLine:{show:false},axisLabel:{color:\"rgba(255,255,255,.6)\",fontSize:14}},series:[{type:\"bar\",label:{show:true,zlevel:10000,position:\"right\",padding:6,color:\"#4e84a1\",fontSize:14,formatter:\"{c}\"},itemStyle:{barBorderRadius:25,color:\"#3facff\"},barWidth:\"15\",data:[1800,1240,1168,1200,2336,1680],z:6}]},config:{lock:false},id:\"bar172103830225123\"},{type:\"text\",position:{width:100,height:30,left:1460,top:773,zIndex:2},config:{text:\"模块标题\",lock:true},id:\"text172103830225124\"},{type:\"border\",position:{width:470,height:276,left:1440,top:764},config:{style:{border:\"\"},class:\"border\",lock:false},id:\"border172103830225125\"},{type:\"table\",position:{width:570,height:276,left:20,top:764},option:{columns:[{prop:\"name1\",label:\"字段1\"},{prop:\"name2\",label:\"字段2\"},{prop:\"name3\",label:\"字段3\"},{prop:\"name4\",label:\"字段4\"},{prop:\"name5\",label:\"字段5\"}],list:[{name5:\"111\",name4:\"4444\",name3:\"3333\",name2:\"222\",name1:\"5555\"}]},config:{class:\"border scroll-table\",optionsType:0,carousel:false,props:{},speed:50,lock:false},id:\"table172103830225126\"}],config:{width:\"1920px\",height:\"1080px\",background:\"url(./static/screen/bg/bg.jpg)\",style:\".border{background:rgba(6, 48, 109, 0.5);border:none}\\\\n.scroll-table .el-table tr,.scroll-table .el-table{background:none}\\\\n.scroll-table .el-table th.el-table__cell{background:none;border:none}\\\\n.scroll-table .el-table td,.scroll-table .el-table th{border:none}\\\\n.scroll-table .el-table__inner-wrapper:before{display:none}\",primary:\"rgba(255, 255, 255, 1)\",method:\"post\",requestUrl:\"demo/echarts\"}}', '', 1, '2024-07-15 18:13:12', '2030-12-12 12:12:12', '', 1, 1, 1, 1, '', NULL),
(56, NULL, '地图', 4, '{list:[{type:\"text\",position:{width:\"300\",height:\"100\",left:281,top:386},config:{text:\"<p>顺丰<span style=\\\"color:#0e94eb\\\">192581</span>30.87%</p> <p>京东<span style=\\\"color:#c440ef\\\">215635</span>34.08%</p> <p>EMS<span style=\\\"color:#efb013\\\">224585</span>35.49%</p>\",class:\"pie-text\"},id:\"text17210430315400\"},{type:\"text\",position:{width:\"496\",height:\"42\",left:25,top:\"550\"},config:{text:\"广东省寄派件数据\",class:\"title1\"},id:\"text17210430315401\"},{type:\"text\",position:{width:\"178\",height:\"26\",left:185,top:39,zIndex:2},config:{text:\"当前到件量\",class:\"left-title1\"},id:\"text17210430315402\"},{type:\"border\",position:{width:\"496\",height:\"186\",left:\"25\",top:\"25\"},config:{style:{border:\"\"},class:\"left1\"},id:\"border17210430315403\"},{type:\"text\",position:{width:\"496\",height:30,left:\"25\",top:100,zIndex:3},config:{text:\"123,456,789\",style:{\"text-align\":\"center\",fontSize:\"28px\",color:\"#fff\"}},id:\"text17210430315404\"},{type:\"image\",position:{width:\"19\",height:\"100%\",left:\"28%\",top:\"0\"},config:{src:\"./static/demo1/line_img.png\"},id:\"image17210430315405\"},{type:\"clock\",position:{width:230,height:30,left:606,top:145,zIndex:2},config:{dateTime:\"{y}年{m}月{d}日 {h}:{i}:{s} 星期{w}\",style:{fontSize:\"24px\"}},id:\"clock17210430315406\"},{type:\"border\",position:{width:\"370\",height:100,left:588,top:127},config:{style:{border:\"1px solid #0E94EA\"}},id:\"border17210430315407\"},{type:\"echarts\",position:{width:439,height:245,left:1435,top:88},option:{title:\"\",grid:{top:20,containLabel:true,bottom:0,left:0},tooltip:{show:true},xAxis:[{type:\"category\",show:false,data:[\"入库件\",\"在库件\",\"出库件\",\"退签件\",\"丢失件\"],axisLabel:{textStyle:{color:\"#fff\"}}},{type:\"category\",position:\"bottom\",data:[\"入库件\",\"在库件\",\"出库件\",\"退签件\",\"丢失件\"],boundaryGap:true,axisTick:{show:false},axisLine:{show:false},axisLabel:{textStyle:{color:\"#fff\"}}},{show:false,data:[1378,1378,1378,1378,1378,1378,1378,1378,1378,1378],axisLabel:{inside:true,textStyle:{color:\"#fff\"}},axisTick:{show:false},axisLine:{show:false},z:10}],yAxis:[{show:true,splitLine:{show:false,lineStyle:{color:\"#0e94eb\"}},axisTick:{show:false},axisLine:{show:false},axisLabel:{show:true,color:\"#0e94eb\"}},{show:false,type:\"value\",nameTextStyle:{color:\"#0e94eb\"},axisLabel:{color:\"#0e94eb\"},splitLine:{show:false},axisLine:{show:false},axisTick:{show:false}},{axisLine:{show:false},axisTick:{show:false},axisLabel:{textStyle:{color:\"#999\"}}}],series:[{type:\"bar\",barWidth:20,xAxisIndex:2,tooltip:{show:false},itemStyle:{normal:{color:\"rgba(14, 148, 235, 0.102)\"}},data:[1378,1378,1378,1378,1378,1378,1378,1378,1378,1378],animation:false},{name:\"入库件\",type:\"bar\",barGap:\"-100%\",barWidth:\"40%\",xAxisIndex:1,itemStyle:{normal:{color:\"#0e94eb\"},emphasis:{opacity:1}},data:[{name:\"入库件\",value:584},0,0,0,0]},{name:\"滞留件\",type:\"bar\",stack:\"在库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(239,176,19,.9)\"},emphasis:{opacity:1}},data:[0,{name:\"滞留件\",value:152},0,0,0]},{name:\"丢失件\",type:\"bar\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(239,176,19,0.4)\"},emphasis:{opacity:1}},data:[0,0,0,0,{name:\"丢失件\",value:100}]},{name:\"正常件\",type:\"bar\",stack:\"在库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(239,176,19,0.3)\"},emphasis:{opacity:1}},data:[0,{name:\"正常件\",value:689},0,0,0]},{name:\"派送件\",type:\"bar\",stack:\"出库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(196,64,239,0.8)\"},emphasis:{opacity:1}},data:[0,0,{name:\"派送件\",value:200},0,0]},{name:\"自提件\",type:\"bar\",stack:\"出库件\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(196,64,239,0.4)\"},emphasis:{opacity:1}},data:[0,0,{name:\"自提件\",value:121},0,0]},{name:\"退签件\",type:\"bar\",xAxisIndex:1,itemStyle:{normal:{color:\"rgba(219,44,44,0.8)\"},emphasis:{opacity:1}},data:[0,0,0,{name:\"退签件\",value:92},0]}]},config:{},id:\"echarts17210430315408\"},{type:\"image\",position:{width:\"19\",height:\"100%\",left:\"72%\",top:\"0\"},config:{src:\"./static/demo1/line_img.png\"},id:\"image17210430315409\"},{type:\"text\",position:{width:\"496\",height:\"42\",left:25,top:238},config:{text:\"派件入库量占比\",class:\"title1\"},id:\"text172104303154010\"},{type:\"text\",position:{width:\"800\",height:\"53\",left:\"569\",top:\"30\"},config:{text:\"智慧物流服务中心\",class:\"title-h1\"},id:\"text172104303154011\"},{type:\"pie\",position:{width:253,height:230,left:31,top:322},option:{tooltip:{trigger:\"item\",confine:true,formatter:\"{a} <br/>{b}: {c} ({d}%)\"},series:[{radius:[\"50%\",\"85%\"],center:[\"50%\",\"50%\"],type:\"pie\",label:{normal:{show:false},emphasis:{show:false}},labelLine:{normal:{show:false},emphasis:{show:false}},name:\"派件入库量占比内容\",data:[{name:\"顺丰\",value:192581,percent:\"30.8721\",itemStyle:{normal:{color:{type:\"linear\",x:0,y:0,x2:0,y2:1,colorStops:[{offset:0,color:\"#0e94eb\"},{offset:1,color:\"#0e94eb\"}],globalCoord:false}}}},{name:\"京东\",value:215635,percent:\"34.076\",itemStyle:{normal:{color:{type:\"linear\",x:0,y:0,x2:0,y2:1,colorStops:[{offset:0,color:\"#c440ef\"},{offset:1,color:\"#c440ef\"}],globalCoord:false}}}},{name:\"EMS\",value:224585,percent:\"35.49\",itemStyle:{normal:{color:{type:\"linear\",x:0,y:0,x2:0,y2:1,colorStops:[{offset:0,color:\"#efb013\"},{offset:1,color:\"#efb013\"}],globalCoord:false}}}}]},{radius:[\"45%\",\"50%\"],center:[\"50%\",\"50%\"],type:\"pie\",label:{normal:{show:false},emphasis:{show:false}},labelLine:{normal:{show:false},emphasis:{show:false}},animation:false,tooltip:{show:false},data:[{name:\"顺丰\",value:192581,percent:\"30.8721\",itemStyle:{normal:{color:{type:\"linear\",x:0,y:0,x2:0,y2:1,colorStops:[{offset:0,color:\"#0077c5\"},{offset:1,color:\"#0077c5\"}],globalCoord:false}}}},{name:\"京东\",value:215635,percent:\"34.076\",itemStyle:{normal:{color:{type:\"linear\",x:0,y:0,x2:0,y2:1,colorStops:[{offset:0,color:\"#a819d7\"},{offset:1,color:\"#a819d7\"}],globalCoord:false}}}},{name:\"EMS\",value:224585,percent:\"35.49\",itemStyle:{normal:{color:{type:\"linear\",x:0,y:0,x2:0,y2:1,colorStops:[{offset:0,color:\"#c99002\"},{offset:1,color:\"#c99002\"}],globalCoord:false}}}}]}]},config:{},id:\"pie172104303154012\"},{type:\"component\",position:{width:\"496\",height:\"300\",left:22,top:603},config:{component:\"echartsMap\"},id:\"component172104303154013\"},{type:\"component\",position:{width:\"800\",height:\"600\",left:570,top:\"280\"},config:{component:\"echartsMap\",mapType:\"china\"},id:\"component172104303154014\"},{type:\"text\",position:{width:\"496\",height:\"42\",left:1405,top:26},config:{text:\"派件数据\",class:\"title1\"},id:\"text172104303154015\"},{type:\"text\",position:{width:\"496\",height:\"42\",left:1406,top:\"650\"},config:{text:\"支出数据\",class:\"title1\"},id:\"text172104303154016\"},{type:\"text\",position:{width:\"496\",height:\"42\",left:1404,top:\"350\"},config:{text:\"收入数据\",class:\"title1\"},id:\"text172104303154017\"},{type:\"text\",position:{width:\"490\",height:\"242\",left:1408,top:\"400\"},config:{text:\"123,456.5元\",class:\"right-title\"},id:\"text172104303154018\"},{type:\"text\",position:{width:\"490\",height:\"242\",left:1410,top:\"700\"},config:{text:\"123,456.5元\",class:\"right-title\"},id:\"text172104303154019\"}],config:{width:\"1920px\",height:\"1080px\",background:\"url(./static/demo1/index_bg.png)\",style:\".left1{background:url(\\\'./static/demo1/border_bg01.png\\\') top left no-repeat}\\n.left-title1{\\n    background:url(\\\'./static/demo1/title_bg01.png\\\') top left no-repeat;\\n    text-align:center;\\n    line-height: 26px;\\n    font-size: 18px;\\n}\\n.title1{\\n   background:url(\\\'./static/demo1/box_title.png\\\') top left no-repeat; \\n   line-height: 42px;\\n   color: #fff;\\n   font-size: 16px;\\n   padding-left: 30px;\\n}\\n.title-h1{\\n    background:url(\\\'./static/demo1/title_border.png\\\') top left no-repeat;\\n    height:53px;\\n    line-height: 53px;\\n    color: #cdddf7;\\n    font-size: 36px;\\n    text-align: center;\\n}\\n.right-title{\\n    background:url(\\\'./static/demo1/bg_img03.png\\\') top left no-repeat;\\n    font-size: 38px;\\n    color: #fff;\\n}\\n.right-title .text{\\n    display: flex;\\n    align-items: center;\\n    justify-content: center;\\n}\\n.pie-text{\\n    color: #ffff;\\n    line-height: 30px;\\n}\\n.pie-text span{\\n    padding: 0 10px;\\n}\",primary:\"#409eff\"}}', NULL, 1, '2024-07-15 19:37:02', '2024-01-21 17:22:26', NULL, 1, 1, 1, NULL, NULL, NULL),
(57, 20, '组件示例表单', 1, '{list:[{type:\"txt\",control:{modelValue:\"组件示例演示，可快速轻松实现功能复杂的各类型表单；功能强大、简单灵活、超乎你想象\",style:{color:\"red\"}},config:{}},{type:\"title\",control:{modelValue:\"基础字段\"},config:{}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入标题名称\"},config:{},name:\"inputText\",formItem:{label:\"标题名称\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"radio\",control:{modelValue:\"0\"},config:{optionsType:0,transformData:\"number\"},name:\"radio\",formItem:{label:\"性别\"},options:[{label:\"男\",value:1},{label:\"女\",value:0}]},{type:\"checkbox\",control:{modelValue:[]},options:[],config:{optionsType:2,optionsFun:\"sys-flow\"},name:\"checkbox\",formItem:{label:\"多选\"}},{type:\"select\",control:{appendToBody:true},config:{optionsType:1,optionsFun:\"demo/select\",method:\"get\",label:\"name\",value:\"value\"},name:\"select1\",formItem:{label:\"选择框\"},options:[]},{type:\"datePicker\",control:{type:\"date\",placeholder:\"请选择日期\",format:\"YYYY-MM-DD\",valueFormat:\"YYYY-MM-DD\"},config:{},name:\"dateTime\",formItem:{label:\"日期时间\"}},{type:\"switch\",control:{modelValue:false,activeValue:1,inactiveValue:0},config:{},name:\"switch\",formItem:{label:\"开关\"}},{type:\"textarea\",control:{modelValue:\"\"},config:{},name:\"textarea\",formItem:{label:\"多行文本\"}},{type:\"upload\",control:{modelValue:\"\"},config:{tip:\"\",btnText:\"选择图片\"},name:\"upload\",formItem:{label:\"图片文件上传\"}},{type:\"card\",list:[{type:\"component\",control:{modelValue:\"\"},config:{componentName:\"ComponentTest\"},name:\"component\",formItem:{label:\"选择位置\"}},{type:\"expand-user\",control:{modelValue:\"\"},config:{},name:\"user\",formItem:{label:\"选择用户\"}}],control:{},config:{},formItem:{label:\"卡片布局\"}},{type:\"inputSlot\",control:{modelValue:\"\",appendToBody:true,style:{width:\"150px\"}},options:[{label:\"小时\",value:\"h\"},{label:\"分钟\",value:\"m\"},{label:\"天\",value:\"d\"}],config:{optionsType:0},name:\"prepend\",formItem:{label:\"前缀\",hideLabel:true}},{type:\"input\",control:{modelValue:\"\"},config:{append:\"key:prepend\"},name:\"select2\",formItem:{label:\"复合型\"}},{type:\"title\",control:{modelValue:\"子表\"},config:{},name:\"title1706851586238\"},{type:\"table\",list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入姓名\"},config:{},name:\"name\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"select\",control:{modelValue:\"\",appendToBody:true},options:[{label:\"男\",value:\"1\"},{label:\"女\",value:\"0\"},{label:\"未知\",value:\"2\"}],config:{optionsType:0,transformData:\"string\"},name:\"sex\",formItem:{label:\"性别\"}}],tableData:[],control:{border:true},config:{addBtnText:\"添加一行\"},name:\"table2\"},{type:\"title\",control:{modelValue:\"弹性字段\"},config:{}},{type:\"flex\",list:[{type:\"input\",control:{modelValue:\"\"},config:{span:10},name:\"input1706851786349\",formItem:{label:\"姓名\"},customRules:[{type:\"required\",message:\"必填项\",trigger:\"blur\"}]},{type:\"input\",control:{modelValue:\"\"},config:{span:10},name:\"tel\",formItem:{label:\"电话\"},customRules:[{type:\"mobile\",message:\"请输入手机号码\",trigger:\"blur\"}]}],tableData:[],control:{},config:{addBtnText:\"添加一行\",span:22,delBtnText:\"删除\"},name:\"flex\"},{type:\"tinymce\",control:{modelValue:\"\"},config:{},name:\"tinymce\",formItem:{label:\"内容\"}}],form:{size:\"default\",labelWidth:\"120\"},config:{submitCancel:true,sourceId:20,name:\"组件示例表单\",transformData:true}}', NULL, 1, '2025-06-19 16:24:27', '2024-02-01 09:47:26', '{}', 1, 1, 1, NULL, NULL, NULL),
(59, NULL, '未命名可视化大屏', 4, '{list:[{id:\"rect\",type:\"tempRect\",position:{display:true}},{type:\"bar\",id:\"bar1\",position:{width:400,height:300,left:86,top:104},option:{xAxis:{type:\"category\",data:[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"]},yAxis:{type:\"value\"},grid:{left:0,top:0,right:0,bottom:30},series:[{data:[148,57,497,478,143,292,245,317,460,49,118,281],type:\"bar\"}]},config:{optionsType:1,method:\"post\",requestUrl:\"demo/echarts\",before:(data) =>\n      {\n        // data请求参数，route当前路由信息\n        console.log(\'beforeFetch\', data)\n        return data\n      },after:(res, data) =>\n      {\n        // res响应数据, 当前组件数据data\n        console.log(\'当前组件数据\', data)\n        console.log(\'接口响应数据\', res)\n        //下面两行是重点，将接口返回的数据赋值级当前组件\n        data.xAxis.data = res.bar.xAxis\n        data.series[0].data = res.bar.data1\n        return data //返回新的图表数据\n      }}},{type:\"bar\",position:{width:\"403.77px\",height:300,left:849,top:74},option:{xAxis:{type:\"category\",data:\"{{getScreenGlobal.bar.xAxis}}\"},yAxis:{type:\"value\"},grid:{left:0,top:0,right:0,bottom:30},series:[{data:[120,200,150,80,70,110,130],type:\"bar\"}]},config:{lock:false,optionsType:0},id:\"bar1720868137715\",layerName:\"bar1720868137715\"}],config:{width:\"1920px\",height:\"1080px\",background:\"#000\",style:\"\",primary:\"#409eff\",method:\"post\",requestUrl:\"demo/echarts\"}}', NULL, 1, '2024-11-11 09:39:34', '2024-07-13 18:55:41', NULL, NULL, 1, 1, NULL, NULL, NULL),
(78, 57, '组件示例', 2, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入标题名称\"},config:{},name:\"inputText\",formItem:{label:\"标题名称\"}},{type:\"select\",control:{style:{width:\"100px\"}},config:{optionsType:1,optionsFun:\"demo/select\",method:\"get\",label:\"name\",value:\"value\"},name:\"select1\",formItem:{label:\"选择框\"},options:[]}],form:{size:\"default\"},config:{submitCancel:true,sourceId:57,name:\"组件示例\"}}', '{tableProps:{},columns:[{label:\"多选\",type:\"selection\"},{prop:\"inputText\",label:\"标题名称\"},{prop:\"radio\",label:\"性别\",render:\"tag\",config:{},replaceValue:{0:\"女\",1:\"男\"},custom:{0:\"danger\",1:\"primary\"}},{prop:\"select1\",label:\"选择框\"},{prop:\"dateTime\",label:\"日期时间\",render:\"datetime\",config:{},timeFormat:\"{yyyy}-{mm}-{dd} {h}:{i}:{s}\"},{prop:\"switch\",label:\"开关\",render:\"switch\",config:{activeText:\"开\",inactiveText:\"关\",activeValue:\"1\",inactiveValue:\"0\",inlinePrompt:true},renderFormatter:(val,row) => {\n  // 渲染前对字段值的预处理方法，需返回新值\n  return val&&val.toString()\n}},{prop:\"textarea\",label:\"多行文本\"},{prop:\"select2\",label:\"复合型\"},{label:\"操作\",render:\"buttons\",config:{},buttons:[{key:\"edit\"},{key:\"del\",render:\"confirm\",popConfirm:{title:\"确认删除该记录吗？\",confirmButtonText:\"确认\",cancelButtonText:\"取消\",confirmButtonType:\"danger\"}}]}],config:{openType:\"page\",fixedBottomScroll:true,columnsSetting:true,expand:true,formId:\"57\",name:\"组件示例\",searchJump:true},apiKey:{},controlBtn:[{key:\"add\"},{key:\"del\",render:\"confirm\",popConfirm:{title:\"确认删除该记录吗？\",confirmButtonText:\"确认\",cancelButtonText:\"取消\",confirmButtonType:\"danger\"}}]}', 1, '2024-11-22 15:32:53', '2024-11-19 15:30:04', NULL, 1, 1, 1, NULL, NULL, NULL),
(79, 13, '客户信息管理', 1, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入客户名称\"},config:{},name:\"name\",formItem:{label:\"客户名称\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入手机号码\"},config:{},name:\"phone\",formItem:{label:\"手机号码\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入微信\"},config:{},name:\"weixin\",formItem:{label:\"微信\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入公司名称\"},config:{},name:\"company\",formItem:{label:\"公司名称\"}},{type:\"radio\",control:{modelValue:\"\"},config:{optionsType:2,optionsFun:\"sys-status\"},name:\"status\",formItem:{label:\"类型\"},options:[]},{type:\"textarea\",control:{modelValue:\"\"},config:{},name:\"remark\",formItem:{label:\"备注\"}},{type:\"select\",control:{},config:{optionsType:0,transformData:\"string\"},name:\"intention\",formItem:{label:\"合作意向\"},options:[{label:\"普通客户\",value:\"1\"},{label:\"合作客户\",value:\"2\"},{label:\"无意向\",value:\"3\"}]},{type:\"datePicker\",control:{modelValue:\"\",type:\"date\",valueFormat:\"YYYY-MM-DD\",format:\"YYYY-MM-DD\"},config:{},name:\"creatTime\",formItem:{label:\"添加时间\"}}],form:{size:\"default\",labelWidth:\"120px\"},config:{submitCancel:true,sourceId:13,name:\"客户信息管理\"},apiKey:{}}', NULL, 1, '2024-11-20 16:22:42', '2024-11-20 15:18:21', NULL, 1, 1, 1, NULL, NULL, NULL),
(80, 79, '客户信息管理列表', 2, '{list:[{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入客户名称\"},config:{},name:\"name\",formItem:{label:\"客户名称\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入手机号码\"},config:{},name:\"phone\",formItem:{label:\"手机号码\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入微信\"},config:{},name:\"weixin\",formItem:{label:\"微信\"}},{type:\"input\",control:{modelValue:\"\",placeholder:\"请输入公司名称\"},config:{},name:\"company\",formItem:{label:\"公司名称\"}},{type:\"select\",control:{},config:{optionsType:0},name:\"intention\",formItem:{label:\"合作意向\"},options:[{label:\"普通客户\",value:\"1\"},{label:\"合作客户\",value:\"2\"},{label:\"无意向\",value:\"3\"}]}],form:{size:\"default\"},config:{submitCancel:true}}', '{tableProps:{},columns:[{prop:\"name\",label:\"客户名称\"},{prop:\"phone\",label:\"手机号码\"},{prop:\"weixin\",label:\"微信\"},{prop:\"creatTime\",label:\"添加时间\",render:\"datetime\",config:{}},{prop:\"company\",label:\"公司名称\"},{prop:\"status\",label:\"类型\",render:\"tag\",config:{},replaceValue:\"sys-status\"},{prop:\"remark\",label:\"备注\"},{prop:\"intention\",label:\"合作意向\"},{label:\"操作\",render:\"buttons\",config:{},buttons:[{key:\"edit\"},{key:\"del\",render:\"confirm\",popConfirm:{title:\"确认删除该记录吗？\",confirmButtonText:\"确认\",cancelButtonText:\"取消\",confirmButtonType:\"danger\"}}]}],config:{openType:\"dialog\",fixedBottomScroll:true,columnsSetting:true,expand:true,formId:\"79\"},apiKey:{},controlBtn:[{key:\"add\"},{key:\"del\",render:\"confirm\",popConfirm:{title:\"确认删除该记录吗？\",confirmButtonText:\"确认\",cancelButtonText:\"取消\",confirmButtonType:\"danger\"}}]}', 1, '2024-11-20 16:07:51', '2024-11-20 15:25:00', NULL, 1, 1, 1, NULL, NULL, NULL),
(82, 22, '通用流程表单', 1, '{list:[{type:\"textarea\",control:{modelValue:\"\"},config:{},name:\"content\",formItem:{label:\"申请内容\"}},{type:\"upload\",control:{modelValue:\"\"},config:{},name:\"files\",formItem:{label:\"文件附件\"}}],form:{size:\"default\"},config:{submitCancel:true,sourceId:\"22\",name:\"通用流程表单\"}}', NULL, 1, '2024-12-23 09:01:41', '2024-12-23 09:01:35', NULL, 2, 1, 1, NULL, NULL, NULL),
(89, NULL, '大屏测试', 4, '{list:[{id:\"rect\",type:\"tempRect\",position:{width:200,height:200,display:true}},{type:\"line\",position:{width:400,height:300,left:412,top:138},option:{xAxis:{type:\"category\",data:[\"Mon\",\"Tue\",\"Wed\",\"Thu\",\"Fri\",\"Sat\",\"Sun\"]},yAxis:{type:\"value\"},grid:{left:0,top:0,right:0,bottom:30},series:[{data:[150,230,224,218,135,147,260],type:\"line\"}]},config:{},id:\"line1747041344018\",layerName:\"line1747041344018\"}],config:{width:\"1920px\",height:\"1080px\",background:\"#000\",style:\"\",primary:\"#409eff\",method:\"get\"}}', NULL, NULL, '2025-05-12 17:16:01', '2025-05-12 17:15:50', NULL, NULL, 1, 1, NULL, NULL, NULL);

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
(29, '流程审批状态', 'sys-flow-status', 1, '', '[{\"label\":\"待审批\",\"value\":\"0\"},{\"label\":\"已撤回\",\"value\":\"1\"},{\"label\":\"审批中\",\"value\":\"2\"},{\"label\":\"同意\",\"value\":\"3\"},{\"label\":\"已拒绝\",\"value\":\"4\"},{\"label\":\"异常\",\"value\":\"5\"}]', '2024-11-25 16:23:50', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_flow`
--

CREATE TABLE `sys_flow` (
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
-- 转存表中的数据 `sys_flow`
--

INSERT INTO `sys_flow` (`id`, `userId`, `title`, `creatTime`, `status`, `endTime`, `formId`, `flowId`, `currentApprover`, `copyIds`, `currentApproverIds`, `currentNode`, `nodeStatus`, `nodeApprover`) VALUES
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
  `id` int(10) NOT NULL,
  `flowId` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `datetime` datetime NOT NULL,
  `approverId` int(10) NOT NULL COMMENT '审批人',
  `status` int(4) NOT NULL COMMENT '0拒绝1同意2流转3撤回',
  `nodeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='流程审批记录';

--
-- 转存表中的数据 `sys_flow_record`
--

INSERT INTO `sys_flow_record` (`id`, `flowId`, `content`, `datetime`, `approverId`, `status`, `nodeName`) VALUES
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
(150, 'admin', '0:0:0:0:0:0:0:1', NULL, '2025-07-02 08:48:49', 1);

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
(26, 21, '抄送事项', 'icon-cs', 8, '/task/applyed?task=copyer', 1, '', 1, 1),
(27, 1, '组件示例', 'icon-doc', 0, '/design/list/content/78', 1, '', 3, 1),
(28, 1, '客户信息', 'icon-user', 0, '/design/list/content/80', 1, '', 3, 1),
(29, 4, 'swagger文档', 'icon-work', 6, '/api/swagger-ui/index.html', 1, '', 1, 1);

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
(1, '管理员', 1, '2,16,17,18,20,19,3,8,9,10,11,12,13,14,15,4,5,6,7', ''),
(2, '普通会员', 1, '21,26,25,24,23,22,4,29,7,6,5,2,20,19,18,17,16,1,33,28,27', '');

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
(1, 'admin', '管理员', '13800138000', 1, '2,1', '123456', 5, 1, '', NULL, NULL, '2025-07-02 08:48:49', 168, '0:0:0:0:0:0:0:1', NULL),
(2, 'user', '会员', '', 1, '2', '123456', 5, 0, '', NULL, NULL, '2024-12-23 08:49:18', 22, '0:0:0:0:0:0:0:1', NULL),
(7, 'hr', 'test', '', 1, '2', '123456', 12, NULL, '', '2024-11-29 11:56:07', NULL, NULL, NULL, NULL, NULL);

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
-- 表的索引 `sys_flow_record`
--
ALTER TABLE `sys_flow_record`
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
-- 使用表AUTO_INCREMENT `ak-customer`
--
ALTER TABLE `ak-customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ak-demo-test`
--
ALTER TABLE `ak-demo-test`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `ak-flow-comm`
--
ALTER TABLE `ak-flow-comm`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `ak-holidays`
--
ALTER TABLE `ak-holidays`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- 使用表AUTO_INCREMENT `datasource`
--
ALTER TABLE `datasource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `design`
--
ALTER TABLE `design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- 使用表AUTO_INCREMENT `sys_department`
--
ALTER TABLE `sys_department`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `sys_dict`
--
ALTER TABLE `sys_dict`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- 使用表AUTO_INCREMENT `sys_flow`
--
ALTER TABLE `sys_flow`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用表AUTO_INCREMENT `sys_flow_record`
--
ALTER TABLE `sys_flow_record`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- 使用表AUTO_INCREMENT `sys_login_log`
--
ALTER TABLE `sys_login_log`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- 使用表AUTO_INCREMENT `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
