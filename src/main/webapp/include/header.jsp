<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<html>

<head>
	<meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" /> 
    <meta name="format-detection" content="telephone=no" />  
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/css/shangpinfenlei.css">
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/css/header.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/css/index.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/fudong.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/css/float.css" />
	<script src="<%=basePath%>js/jquerybasic.js"></script>
	<title>自可知-电子元器件查询网</title>
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
	<style type="text/css">
		*{
			font-family:"微软雅黑";
			margin: 0 auto;
		}
		a{
			text-decoration:none
		}
		.topimg{
			width: 18px;
			height: 18px; 
			margin: 0px 0px -3px 0px
		}
		.home a:hover {
		    background-color:#2D2594;
		}
	</style>
	<script>
		var _hmt = _hmt || [];
		(function () {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?973a46004763863d10483eab2f1ae9b2";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</head>
<body>
	<div style="width: 100%;height: 30px;background-color: #E5E5E5;">
		<div style="width: 1200px;height: 30px;background-color: #E5E5E5;">
			<div style="float: left;text-align: left; width: 50%;padding-top: 5px;padding-left: 2px;">
				<span style="font-size: 10px">客服热线:0755-82720040</span>
				<b>|</b>
				<span style="font-size: 10px">交易时间：9:00-18:00</span>
				<b>|</b> 
				<span style="font-size: 10px">在线客服</span>
				<a href="javascript:void(0)"
					onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
					<img class="topimg" src="<%=contextPath%>/logo/indexQQ1.png"/>
				</a>
				<b>|</b> 
				<span style="font-size: 10px">采购交流群：337260650</span>
			</div>
			<c:if test="${sessionScope.userName == null}">
				<div style="text-align:right;width:48%;padding-top: 5px;float: right;">
					<span id="login"> 
						<img class="topimg" src="<%=basePath%>img/login.png" alt=""/>
						<a style="color: black" href="javascript:void(0)" class="goLogin">登录</a>
					</span>
					<span id="register" style="margin-left: 20px;"> <img class="topimg" src="<%=basePath%>img/register.png"/>
						<a style="color: black" href="register">注册</a>
					</span> 
				</div>
			</c:if>
			<c:if test="${sessionScope.userName != null}">
				<div style="text-align:right;width:48%;padding-top: 5px;float: right;">
					<span id="userName"> <img class="topimg" src="<%=contextPath%>/img/userIcon.png" />
						<a style="color: black;" href="usersystem"><%=session.getAttribute("userName")%></a>
					</span> 
					<span style="padding-left: 22px;">
						<img class="topimg" src="<%=contextPath%>/logo/mydingdan.png">
						<a href="express" style="color: #000000">
							我的订单
						</a>
					</span>
					<span style="padding-left: 22px;">
						<img class="topimg" src="<%=contextPath%>/logo/user-kucun.png">
						<a href="javascript:;" onclick="usersupplier()" style="color: #000000">
							免费上传库存
						</a>
					</span>
					<span style="padding-left: 22px;">
						<img class="topimg" src="<%=contextPath%>/logo/userout.png">
						<a style="color: black;" href="userOut">退出</a>
					</span>	
				</div>
			</c:if>
		</div>
	</div>
	<div style="width: 100%;height:110px; margin-top: 22px;">
		<div style="width: 1200px;">
			<div style="float:left;width: 32%;margin-top: 5px;">
				<a href="index">
					<span style="float: left;">
						<img alt="自可知" src="img/indexazikezi.png" style="width: 55px;height: 55px;margin: 0 0px -10px 0;">
						<span style="color: #28004D;font-size: 46px;font-weight: bold;margin-top: 20px;">
						 	自可知
						</span>
						<span style="color: #28004D;color: #28004D;font-size: 18px;font-weight: bold;">
					 		|&nbsp; 电子查询网
					 	</span>
					</span>
				</a>
				<div style="color: #28004D;font-size: 18px;font-weight: bold;line-height: 30px;clear: both;padding-left: 26%;">
					专注贸易商元器件查询服务
				</div>
			</div>
			<div style="float:left;width: 48%;margin-top: 9px;">
				<form action="search?product_second=${product_second }&&manufacturer=${manufacturer}&&encapsulation=${encapsulation}" method="get">
					<input style="width: 370px;float: left;height: 43px;border: 3px solid #28004D;border-color: #28004D;border-right: none" id="keyword" type="text" name="keyword"
						placeholder="请输入要查找的产品型号" value="${keyword }">
					<div id="accuracy" class="clickOver" style="float: left;border-top: 3px solid #28004D;border-bottom: 3px solid #28004D;height: 43px;line-height: 43px;text-align: center;padding-right: 5px;margin-left: -55px;">
						<p style="float: left;margin-top: 16px;"><input type="checkbox" name="isExact" value="isExact" class="accuracy_cbox" style="float: left;"></p>&nbsp;<p style="float: left;margin-top: 1px;margin-left: 5px;font-size: 12px;font: '微软雅黑'">精确</p>
					</div>
					<button style="background-color: #28004D;color: #FFF;font-size: 22px;width: 150px;height: 49px;padding: 10px 30px;border: none" id="submit"
					type="submit" value="搜索">搜索</button>
				</form>
				<div style="height: 20px;width: 88%;clear: both;margin-top: 5px;line-height: 25px;font-size:11px;">
					<span style="font-weight: bold;color: red;"><img src="logo/hot.gif">热搜型号 :&nbsp;&nbsp;</span>
						<a 
					href="search?keyword=STM32F103C8T6&amp;value=product&amp;page=1">STM32F103C8T6</a>&nbsp;
						&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
					href="search?keyword=PIC16F690-I/P&amp;value=product&amp;page=1">PIC16F690-I/P</a>&nbsp;
						&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
					href="search?keyword=STM8S003F3P6TR&amp;value=product&amp;page=1">STM8S003F3P6TR</a>&nbsp;
						&nbsp;<!-- <span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
					href="shaixuanse?primary_name=二极管">二极管</a>&nbsp;
						&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
					href="shaixuanse?primary_name=继电器">继电器</a>&nbsp;&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;
					<a href="shaixuanse?primary_name=电感和磁珠">电感和磁珠</a> -->
				</div>
			</div>
			<div style="float:right;width: 19.8%;margin-top: 3px;" >
				<div style="margin-top: 8px;float: right;">
					<b style="color: #3A006F;font-size: 16px;">终身免费上传库存</b>
					<p style="margin-top: 0px;color: #3A006F;font-weight:bold;font-size: 16px;">终身免费使用ERP</p>
				</div>
				<div style="width: 55px;float: right;margin-right: 10px;">
					<img alt="自可知" src="img/indexazikezi.png" style="width: 55px;height: 55px;">
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%;background: #363942;height:40px;">
		<div id="nav" style="width: 1200px;height: 40px;position: relative;padding: 0;">
			<div class="home" style="float: left;height: 40px;position: relative;">
				<a style="float: left;text-align: center;height: 40px;line-height: 40px;padding: 0 15px;text-decoration: none;position: relative;white-space: nowrap;background-color:#2D2594;border-left: none;border-right: none;color:white;font-size: 16px;width: 150px;" href="<%=basePath%>">首页</a>
			<%-- 	<a style="float: left;text-align: center;height: 40px;line-height: 40px;padding: 0 15px;text-decoration: none;position: relative;white-space: nowrap;border-left: none;border-right: none;color:white;font-size: 16px;width: 150px;" href="<%=basePath%>zaixiangouProduct">在线购</a> --%>
				<a style="float: left;text-align: center;height: 40px;line-height: 40px;padding: 0 15px;text-decoration: none;position: relative;white-space: nowrap;border-left: none;border-right: none;color:white;font-size: 16px;width: 150px;" href="<%=basePath%>beidongProduct">被动器件供应商</a>
				<a style="float: left;text-align: center;height: 40px;line-height: 40px;padding: 0 15px;text-decoration: none;position: relative;white-space: nowrap;border-left: none;border-right: none;color:white;font-size: 16px;width: 150px;" href="<%=basePath%>resistanceZone">贴片电阻专区</a>
			</div> 
		</div>
	</div>
</body>
</html>