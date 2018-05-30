<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/defined.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	response.setHeader("Cache-Control", "no-store");//HTTP 1.1   
	response.setHeader("Pragma", "no-cache");//HTTP 1.0   
	response.setDateHeader("Expires", -10);//prevents caching at the proxy server
%>

<!DOCTYPE html>
<html lang="lang=zh-cmn-Hans">
<head>
<title>自可知-电子元器件查询网</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/css/HeaderSearch.css" />
<link rel="stylesheet" type="text/css"
	href="css/css/productSearchResult.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/css/shangpinfenlei.css?21725" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/css/float.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/zaixiangounew.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/tooltip.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/faguang.css" />
 <link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css" /> 
<%-- <link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap-theme.min.css" /> --%>
<script src="<%=basePath%>js/jquerybasic.js"></script>
<%--  <script src="<%=basePath%>js/bootstrap.min.js"></script>  --%>
<%-- 		<script type="text/javascript" src="js/public_javascript.js"></script> --%>
<script src="<%=basePath%>js/productSearchResult.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.dotdotdot.js"></script>
<script type="text/javasccript" src="<%=basePath%>jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/paging.js" type="text/javascript"></script>
<script>
			var _hmt = _hmt || [];
			(function() {
		  		var hm = document.createElement("script");
		  		hm.src = "https://hm.baidu.com/hm.js?afc08fe83fbfc520487e2d11da429cc7";
		  		var s = document.getElementsByTagName("script")[0]; 
		  		s.parentNode.insertBefore(hm, s);
			})();
		</script>
<style type="text/css">
input, address, b, big, blockquote, body, center, cite, code, dd, del,
	div, dl, dt, em, fieldset, font, form, h1, h2, h3, h4, h5, h6, html, i,
	iframe, img, ins, label, legend, li, ol, p, pre, small, span, strong, u,
	ul, var {
	font-family: 微软雅黑, 宋体;
	color: black;
}


#datalist table tr td{

  vertical-align: middle;
  text-align: center;

}


#updialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #1057A7;
	height: 300px;
	left: 45%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 540px;
	z-index: 500000;
	border-radius: 5px;
	display: none;
}

#updialog input {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	text-align: center;
}

#updialog select {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	text-align: center;
}

#updialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}

#cgdialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #1057A7;
	height: 340px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 380px;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

#cgdialog input {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	text-align: center;
}

#cgdialog select {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	text-align: center;
}

#cgdialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}
</style>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%-- <script type="text/javascript" src="js/inputprompt.js"></script> --%>
<%--[if IE 7]> <link href="css/ie7fix.css" rel="stylesheet" type="text/css" /> <![endif]--%>
<link type="text/css" href="css/search_result.css?20161202"
	rel="stylesheet">
<link type="text/css" href="css/search_ad.css" rel="stylesheet">
<title>自可知-电子元器件采购网</title>
<style type="text/css">
* {
	font-family: "微软雅黑";
	margin: 0 auto;
}

a {
	text-decoration: none
}
.changpin{
    overflow: hidden;
    padding: 5px 10px 0 0;
}
.topimg {
	width: 18px;
	height: 18px;
	margin: 0px 0px -3px 0px
}

.home a font:hover {
	color: #f40;
}

.bd_daohang {
	width: 1200px;
	margin: 0 auto;
}

.bd_logo {
	width: 30%;
	display: inline-block;
	margin-left: 2px;
	display: inline-block;
}

.moveFont {
	display: inline-block;
	font-weight: bold;
	font-size: 22px;
	width: 30%;
}

.hotpinpai {
	width: 50%;
	display: inline-block;
	text-align: center;
	height: 39px;
	vertical-align: top;
	padding-top: 10px;
}

.bd_search {
	width: 50%;
	display: inline-block;
	text-align: center;
}

.bom_table {
	width: 19%;
	display: inline-block;
	height: 80px;
	vertical-align: bottom;
}

.bom_table table {
	width: 150px;
	height: 80px;
	float: right;
}

.bom_table table td {
	text-align: center;
	border: 1px #E5E5E5 solid;
}

.bd_search input {
	width: 500px;
	height: 50px;
	padding: 0px 70px 0 20px;
	opacity: 1;
	border: none;
	outline: none;
	border-radius: 50px;
	font-size: 16px;
	font-weight: 400;
	line-height: 20px;
	color: white;
	background: #87CEFA;
	text-transform: uppercase;
}

.bd_icon_div {
	border-radius: 20px;
	background: white;
	width: 40px;
	height: 40px;
	display: inline-block;
	margin-left: -50px;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
}
.bd_body table thead tr td ul:hover{

border: 1px #F3221E solid;

}
.resis {
     border: 1px solid #72ACE3;
     width:160px;
      /* border: 1px #D7EEFF solid; */
     box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
     height: 220px;
     overflow: hidden;
     overflow-y: auto;
     padding: 0;
     osition: relative;
     transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s;
     list-style-type: none;
}

.bd_icon_div:hover {
	background: #050505;
}

.bd_icon_span {
    margin-top:8px;
	color: #974BE0;
	font-size: 18px;
}

.bd_icon_span:hover {
	color: #FAFAD2;
	font-size: 23px;
}

body {
	margin: 0 auto;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

.bd_header {
	background: #E3E4E5;
	height: 30px;
	line-height: 30px;
	width: 100%;
}

.bd_headerback {
	width: 1200px;
	margin: 0 auto;
}

.bd_header_left {
	display: inline-block;
	text-align: left;
	width: 50%;
	margin-left: 2px;
}

.bd_header_left span, .bd_header_left a {
	font-size: 10px;
	color: #999;
}

.bd_header_right {
	display: inline-block;
	text-align: right;
	width: 49%;
}

.bd_header_right i {
	color: #A8A8A8;
}

.bd_header_right span, .bd_header_right a {
	font-size: 10px;
	color: #999;
}

.hello:hover {
	color: #CD2626;
}

.bd_header_right .hello1 {
	color: red;
}

.bd_header_right .hello1:hover {
	color: #CD2626;
}

.bd_header_right .aboutus:hover {
	color: #CD2626;
}

.bd_body {
	margin-right: 73px;
	margin-left: 73px;
	margin-top: 35px;
	padding-right: 0px;
	padding-left: 0px;
	margin-bottom: 25px /* margin: 0 auto; */ 
	 width: 1200px;
	/* margin-top: 50px; */
	box-shadow: 0px 0px 50px 30px white;
	/* padding: 15px 30px 15px 30px; */
	border-radius: 10px;
}

.bd_body_shaixuan {
	margin-top: 5px;
	text-align: left;
	font-size: 16px;
	color: #666666;
	padding-left: 65px;
}

.bd_body_xuxian {
	height: 1px;
}

.bd_body_second {
	/* width: 600px;
	border-collapse: collapse;
	margin-top: 20px;
   border: 1px #D7EEFF solid; */
}

/*  .bd_body_second thead tr {
	width: 60%;
	 background: #D7EEFF; 
	height: 40px;
	text-align: center;
}  */

/*   .bd_body_second thead tr td {
	width:15%;

}  */
/*
.bd_body_second tbody tr {
	width: 80% text-align: center;
}

.bd_body_second tbody td {
	height: 220px;
	border: 1px #D7EEFF solid;
	width: 16%;
} 

.bd_body_second tbody td:last-child {
	height: 220px;
	border: 1px #D7EEFF solid;
	width: 20%;
}

.bd_body_second tfoot td {
	padding-left: 10px;
	height: 21px;
}
 */
.second_div {
	height: 230px;
	width: 150px;
	overflow-y: auto;
	overflow: hidden;
	padding: 15px 0px 15px 0px;
}

.second_div p {
	padding: 2px 10px 1px 10px;
	line-height: 17px;
	height: 20px;
	margin: 0 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 160px !important;
}

.pinpai p {
	/* padding: 2px 10px 1px 10px; */
	line-height: 17px;
	height: 20px;
	margin: 0 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 140px !important;
}

.second_div p:hover {
	background: #00A1EA;
	cursor: pointer;
	color: white;
}

.close_hidden {
	display: none;
}

.close_select {
	float: right;
	color: white;
}

.close_select:hover {
	color: black;
}

.background_select {
	background: #00A1EA;
}

.background_select em {
	color: white;
}

.second_div p em {
	display: inline-block;
	width: 120px;
	height: 20px;
	font-style: normal;
}

/* .second_div p em span {
	display: inline-block;
	width: 80px;
	height: 20px;
} */
.bd_body table thead tr td ul li p em span {

   display: inline-block;
	width: 95px;
	height: 20px;

}
.fengzhuang p em {
	display: inline-block;
	width: 120px;
	height: 20px;
	font-style: normal;
}

.fengzhuang p em span {
	display: inline-block;
	width: 65px;
	height: 20px;
}

.pinpai p em {
	display: inline-block;
	width: 170px;
	height: 20px;
	font-style: normal;
}

.pinpai p em span {
	display: inline-block;
	width: 23px;
	height: 20px;
}

.close_shaixuan_hidden {
	display: none;
}

.close_shaixuan:hover {
	cursor: pointer;
	color: #FF7F00;
}

.tp_primary span {
	font-weight: bold;
}
</style>
</head>
<body style="clear: both; width: 100%; margin: 0 auto;">
	<div style="width: 100%; height: 30px; background-color: #E5E5E5;">
		<div style="width: 1200px; height: 30px; background-color: #E5E5E5;">
			<div
				style="float: left; text-align: left; width: 50%; padding-top: 7px; padding-left: 2px;">
				<span style="font-size: 10px">客服热线:0755-82720040</span> <b>|</b> <span
					style="font-size: 10px">交易时间：9:00-18:00</span> <b>|</b> <span
					style="font-size: 10px">在线客服</span> <a href="javascript:void(0)"
					onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
					<img class="topimg" src="<%=contextPath%>/logo/indexQQ1.png" />
				</a> <b>|</b> <span style="font-size: 10px">采购交流群：337260650</span>
			</div>
			<c:if test="${sessionScope.userName == null}">
				<div
					style="text-align: right; width: 48%; padding-top: 7px; float: right;">
					<span id="login"> <img class="topimg"
						src="<%=basePath%>img/login.png" alt="" /> <a
						style="color: black" href="javascript:void(0)" class="goLogin">登录</a>
					</span> <span id="register" style="margin-left: 20px;"> <img
						class="topimg" src="<%=basePath%>img/register.png" /> <a
						style="color: black" href="register">注册</a>
					</span>
				</div>
			</c:if>
			<c:if test="${sessionScope.userName != null}">
				<div
					style="text-align: right; width: 48%; padding-top: 7px; float: right;">
					<span id="userName"> <img class="topimg"
						src="<%=contextPath%>/img/userIcon.png" /> <a
						style="color: black;" href="usersystem"><%=session.getAttribute("userName")%></a>
					</span> <span style="padding-left: 22px;"> <img class="topimg"
						src="<%=contextPath%>/logo/mydingdan.png"> <a href="express"
						style="color: #000000"> 我的订单 </a>
					</span> <span style="padding-left: 22px;"> <img class="topimg"
						src="<%=contextPath%>/logo/user-kucun.png"> <a
						href="javascript:;" onclick="usersupplier()"
						style="color: #000000"> 免费上传库存 </a>
					</span> <span style="padding-left: 22px;"> <img class="topimg"
						src="<%=contextPath%>/logo/userout.png"> <a
						style="color: black;" href="userOut">退出</a>
					</span>
				</div>
			</c:if>
		</div>
	</div>
	<div style="width: 100%; height: 110px; margin-top: 22px;">
		<div style="width: 1200px;">
			<div style="float: left; width: 32%; padding-top: 18px">
				<a href="index"> <span style="float: left;"> <span
						style="color: #28004D; font-size: 35px; font-weight: bold; margin-top: 100px;">
							自可知 </span> <span
						style="color: #28004D; color: #28004D; font-size: 18px; font-weight: bold;">
							|&nbsp; 电子查询网 </span>
				</span>
				</a>

			</div>
			<div style="float: left; width: 48%; margin-top: 9px;margin-left: -15px">
				<form
					action="search?product_second=${product_second }&&manufacturer=${manufacturer}&&encapsulation=${encapsulation}"
					method="get">
					<input
						style="width: 420px; float: left; height: 49px; border: 3px solid #c00; border-color: #c00; border-right: none;margin-top:10px "
						id="keyword" type="text" name="keyword" placeholder="请输入要查找的产品型号">
					<div class="clickOver"
						style="float: left; border-top: 3px solid #c00; border-bottom: 3px solid #c00; height: 49px; line-height: 43px; text-align: center;margin-top:10px; padding-right: 5px; margin-left: -55px;">
						<p style="float: left; margin-top: 13px;">
							<input type="checkbox" name="isExact" value="isExact"
								style="float: left;">
						</p>
						&nbsp;
						<p
							style="float: left; margin-top: 1px; margin-left: 5px; font-size: 12px; font: '微软雅黑'">精确</p>
					</div>
					<button
						style="background-color: #c00; color: #FFF; font-size: 15px; width: 100px; height: 49px;margin-top:10px; padding: 10px 30px; border: none"
						id="submit" type="submit" value="搜索">搜索</button>
				</form>
				<div
					style="height: 20px; width: 88%; clear: both; margin-top: 5px; line-height: 25px; font-size: 11px;margin-right: 60px">
					<span style="font-weight: bold; color: red;"><img
						src="logo/hot.gif">热搜型号 :&nbsp;&nbsp;</span> <a
						href="search?keyword=STM32F103C8T6&amp;value=product&amp;page=1">STM32F103C8T6</a>&nbsp;
					&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="search?keyword=PIC16F690-I/P&amp;value=product&amp;page=1">PIC16F690-I/P</a>&nbsp;
					&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="search?keyword=STM8S003F3P6TR&amp;value=product&amp;page=1">STM8S003F3P6TR</a>&nbsp;
					&nbsp;
					<!-- <span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="shaixuanse?primary_name=二极管">二极管</a>&nbsp;
							&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="shaixuanse?primary_name=继电器">继电器</a>&nbsp;&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;
						<a href="shaixuanse?primary_name=电感和磁珠">电感和磁珠</a> -->
				</div>
			</div>
			<div
				style="float: left; width: 19%; margin-top: 8px; margin-left: 10px">
				<div style="color: f40; font-size: 18px; margin-top: 25px;">专注贸易商元器件查询服务
				</div>
			</div>
		</div>
	</div>
	
	<div
		style="width: 100%; background: #fff; height: 40px; background-color: #fff">
		<div id="nav"
			style="width: 1200px; height: 40px; position: relative; padding: 0;">
			<div class="home"
				style="float: left; height: 40px; position: relative;">
				<a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 80px;"
					href="<%=basePath%>"><font>首页</font></a>
				 <a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 80px;"
					href="<%=basePath%>zaixiangouProduct"><font>在线购</font></a> 
				<a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 150px;"
					href="<%=basePath%>beidongProduct"><font>被动器件供应商</font></a> <a
					style="float: left; text-align: center; height: 40px; line-height: 40px;background: -webkit-linear-gradient(top, #f62521, #cc0000); padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: white; font-size: 16px; width: 150px;"
					href="<%=basePath%>resistanceZone">被动器件商城</a>
			</div>
		</div>
	</div>
	<div
		style="width: 1200px; height: 2px; background-color: #cc0000; margin-top: -2px; text-align: center">
	</div>
	<%--新的在线购样式start --%>
	<script type="text/javascript">
			$.fn.smartFloat = function() {
				var position = function(element) {
					var top = element.position().top, pos = element.css("position");
					$(window).scroll(function() {
						var scrolls = $(this).scrollTop();
						if (scrolls > top) {
							if (window.XMLHttpRequest) {
								element.css({
				      				position: "fixed",
				      				top: 0,
				     			}); 
				    		} else {
				     			element.css({
				      				top: scrolls
				     			}); 
				    		}
				   		}else {
				    		element.css({
				     			position: pos,
				     			top: top
				    		}); 
				   		}
					});
				};
				return $(this).each(function() {
					position($(this));      
				});
			};
		</script>


	<div class="bd_body">
		<!-- <p class="bd_body_shaixuan">参数筛选器选择</p> -->
		<!-- <div class="bd_body_xuxian"></div> -->
		<table  style="width: 1050px"  >
			<thead >
				<tr >
					<td style="padding-right: 5px" >
					<div style="padding-left: 60px;padding-bottom: 6px">产品</div>
					      <ul class="resis" >
					    <li style="padding-top: 5px;">
					    <!-- style="margin-bottom: 0px;"><em style="margin-left:8px" -->
					    <p class="tp_dz" style="cursor:pointer" >
								<em style="margin-left:8px"><span>贴片电阻</span></em>
							</p>
					    </li>
					</ul>
					</td>
					<td style="padding-right: 5px" >
					<div  style="padding-left: 60px;padding-bottom: 6px">封裝</div>
					 <ul class="resis" >
					    <li  class=" fengzhuang1" style="padding-top: 5px;">
					    </li>
					</ul> 
					</td>
					<td style="padding-right: 5px" >
					<div style="padding-left: 60px;padding-bottom: 6px">阻值</div>
					 <ul class="resis">
					  <li class="sousuorz"
							style="padding-left: 10px; display: none; padding-top: 5px;">
							<input type="text" value="" id="zr_sousuo"
								style="width: 120px; height: 20px; opacity: 1; border: none; border-radius: 3px; line-height: 20px; color: white; background: #87CEFA; text-transform: uppercase; float: left" />
							<div
								style="display: inline-block; margin-left: -20px; margin-top: -10px; vertical-align: middle; text-align: center; cursor: pointer;">
								<span class="glyphicon glyphicon-search bd_icon_span"
									style="font-size: 11px;"></span>
							</div>
						</li> 
					    <li class="zhuzhi" style="padding-top: 5px;">
					    </li>
					</ul> 
					</td>
					<td style="padding-right: 5px" >
					<div style="padding-left: 60px;padding-bottom: 6px">精确度</div>
					 <ul class="resis">
					    <li class="jingque" style="padding-top: 5px;">
					</ul> 
					</td>
						<td style="padding-right: 5px" >
					<div style="padding-left: 60px;padding-bottom: 6px">品牌</div>
					 <ul class="resis">
					    <li class="pinpai" style="padding-top: 5px;">
					    </li>
					</ul> 
					</td>
						<td style="padding-right: 5px" >
					<div style="padding-left: 60px;padding-bottom: 6px">包装</div>
					 <ul class="resis">
					    <li class="baozhuang" style="padding-top: 5px;">
					    </li>
					</ul> 
					</td>
				</tr>
			</thead>
		</table>
	</div>

	<div style="margin-top: 20px"></div>
	<div id="to_top"
		style="display: none; position: fixed; right: 35px; bottom: 110px; background-color: #aaa; cursor: hand; height: 30px; width: 30px; font-size: 12px; color: white; display: inline-block; background-image: url(img/fding.png);"
		title="返回顶端"></div>
		<p  id="fuhe" style="font-weight: bold;display :none; font-size: 16px; color: #00BFFF; width: 1200px; margin: 5px auto;">符合条件的所有商品</p>
	<div class="title" id="datalist" style="margin-top: 35px">
	     
	       <table   class="table table-striped table-bordered" style="width: 1200px;text-align: center" >
							<tr>
							  <td width="17%">型号</td>
							  <td width="10%">品牌</td>
							  <td width="10%">封装</td>
							  <td width="10%">精确度</td>
							  <td width="12%">阻值</td>
							  <td width="10%">库存 (单位)</td>
							  <td width="12%">单价</td>
							  <td width="8">包装</td>
							  <td width="12%">操作</td>
							 </tr>
	     <c:forEach items="${Resistincelist}"  var="list">
	     
	       <tr>
			   <td width="17%" >${list.product}</td>
			    <td width="10%" >${list.manufacturer}</td>
			    <td width="10%" >${list.encapsulation}</td>
			    <td width="10%" >${list.jingquedu}</td>
			    <td width="10%" >${list.zhuzhi}</td>
			    <td width="10%" >${list.isgoodsinstock}${list.danwei}</td>
			    <td width="12%" >${list.price}元${list.description}</td>
			      <td width="8">${list.baozhuang}</td>
			    <td width="12%" >
			      <p><button type="button" id="jiaru"
			          data-uid="${list.productuuid}" data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>
			       <p><button type="button" id="xuanzhe"
			        data-panduan="beidong" data-price="${list.price}" data-uid="${list.productuuid}" data-product="${list.product}" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>
			           	 </td>
			      </tr>
	     </c:forEach>
	 </table>
	</div>
	
	<%--新的在线购样式end --%>
	<br>
	<div
		style="width: 1185px; margin-top: 40px; text-align: center; clear: both;">
		<span>新手指南&#8195;</span> <span>|&#8195;<a href="frontLogin">注册登录</a>&#8195;
		</span> <span>|&#8195;用户协议&#8195;</span> <span>|&#8195;支付方式&#8195;</span> <span>|&#8195;在线支付&#8195;</span>
		<span>|&#8195;银行汇款&#8195;</span> <span>|&#8195;特色服务&#8195;</span> <span>|&#8195;积分返现&#8195;</span>
		<span>|&#8195;<a href="javasctipt:;" onclick="addFavorite2()"
			title='自可知电子查询网' rel="sidebar">加入收藏</a>&#8195;
		</span> <span>|&#8195;关于库存&#8195;</span> <span>|&#8195;关于免费&#8195;</span> <span>|&#8195;关于自可知&#8195;</span>
		<span>|&#8195;联系我们</span>
		<hr
			style="border: 1px solid #3A006F; margin-top: 0px;; width: 1185px;" />
	</div>
	<!-- <div id="godatuxian"></div>  
        <div id="datuxian" style="z-index: 9999;background-color: #fff; border:1px solid #9D9FA0; height: 240px; position: absolute; width: 350px;border: none;">
  		</div> -->
		<div id="gofullbg"></div>
	<div id="godialog" style="z-index: 1000; border-color: #3A006F">
		<p class="goclose" style="background: #3A006F">
			<span
				style="font-weight: bold; padding-right: 130px; font-size: 15px; color: white;">
				我要进入 </span> <a href="javascript:;" onclick="gocloseBg();"> <img
				src="logo/close.png">
			</a>
		</p>
		<div style="margin-left: 40px;">
			<button type="button" class="button3" id="gobutton1"
				style="width: 129px; height: 40px; background-color: #EEEEE0; font-weight: bold; border: none;">
				密码登录</button>
			<button type="button" class="button4" id="gobutton2"
				style="width: 129px; height: 40px; background-color: #EEEEE0; font-weight: bold; margin-left: 60px; border: none;">
				手机验证码登录</button>
		</div>
		<div id="innerDiv1" style="margin-left: 40px;">
			<form action="userLogin" method="post" class="login form"
				name="submit1" id="submit1">
				<!-- 密码登录  -->
				<div class="group" style="margin-top: 10px;">
					<div class="group-ipt">
						<img alt="" src="logo/loginface.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 323px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="telephone" class="ipt" placeholder="手机号码"
							required>
					</div>

					<div class="group-ipt password">
						<img alt="" src="logo/loginmima.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 323px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="password" name="password" id="password" class="ipt"
							placeholder="输入您的登录密码" required>
					</div>

					<div class="group-ipt verify">
						<img alt="" src="logo/loginyzm.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 226px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="verify" id="verify" class="ipt"
							placeholder="输入验证码" required> <img src="kaptcha.jpg"
							class="imgcode"
							style="position: absolute; height: 40px; border: 1px gray solid; width: 97px;">
					</div>

					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3"
							style="height: 40px; width: 199px; font-size: 15px; font-weight: bold; background: #3A006F">
							登录</button>
					</div>
					<div
						style="margin-top: 20px; font-weight: bold; font-size: 18px; margin-bottom: 30px;">
						<a href="register" style="color: #23A8F6; margin-left: 80px;"
							class="zhu">没有账号，立即注册</a><br> <img src="logo/loginsmile.png">
						<span style="margin-left: 20px; color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
		<div id="innerDiv2" style="margin-left: 40px; display: none;">
			<form action="Loginverification" method="post" class="login form"
				name="submit2" id="submit2">
				<!-- 手机验证码登录   -->
				<div class="group" style="margin-top: 10px;">
					<div class="group-ipt">
						<img src="logo/loginface.png"
							style="position: absolute; margin-top: 2px;"><input
							style="width: 239px; height: 40px; padding-left: 80px;"
							type="text" name="telephone" id="telephonedt" class="ipt"
							placeholder="手机号码" required>
					</div>

					<div class="group-ipt verify">
						<img src="logo/loginyzm.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 139px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="verify" id="verifydt" class="verifydt"
							placeholder="输入验证码" required> <img src="kaptcha.jpg"
							class="imgcodedt"
							style="height: 40px; border: 1px #606c88 solid; width: 97px; position: absolute;">
					</div>

					<div class="group-ipt yanzhen">
						<img src="logo/loginmessage.png"
							style="position: absolute; margin-top: 2px;"> <input
							type="text" placeholder="短信验证码" id="yanzhen" name="yanzhen"
							class="ipt"
							style="width: 239px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							onfocus="clearErro();" required> <input type="button"
							id="hsbtn" value="获取验证码" onclick="time(hsbtn)"
							style="width: 97px; background: #CBE9CF; position: absolute; height: 40px; margin-top: 2px; margin-left: -98px; box-shadow: 40px 40px 40px 40px white inset;" />
					</div>

					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3"
							style="height: 40px; width: 199px; font-size: 15px; font-weight: bold; background: #3A006F">
							登录</button>
					</div>
					<div
						style="margin-top: 20px; font-weight: bold; font-size: 18px; margin-bottom: 30px;">
						<a href="register" style="color: #23A8F6; margin-left: 80px;"
							class="zhu">没有账号，立即注册</a><br> <img src="logo/loginsmile.png">
						<span style="margin-left: 20px; color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
	</div>
		<div id="innerDiv2" style="margin-left: 40px; display: none;">
			<form action="Loginverification" method="post" class="login form"
				name="submit2" id="submit2">
				<!-- 手机验证码登录   -->
				<div class="group" style="margin-top: 10px;">
					<div class="group-ipt">
						<img src="logo/loginface.png"
							style="position: absolute; margin-top: 2px;"><input
							style="width: 239px; height: 40px; padding-left: 80px;"
							type="text" name="telephone" id="telephonedt" class="ipt"
							placeholder="手机号码" required>
					</div>
					<div class="group-ipt verify">
						<img src="logo/loginyzm.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 139px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="verify" id="verifydt" class="verifydt"
							placeholder="输入验证码" required> <img src="kaptcha.jpg"
							class="imgcodedt"
							style="height: 40px; border: 1px #606c88 solid; width: 97px; position: absolute;">
					</div>
					<div class="group-ipt yanzhen">
						<img src="logo/loginmessage.png"
							style="position: absolute; margin-top: 2px;"> <input
							type="text" placeholder="短信验证码" id="yanzhen" name="yanzhen"
							class="ipt"
							style="width: 239px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							onfocus="clearErro();" required> <input type="button"
							id="hsbtn" value="获取验证码" onclick="time(hsbtn)"
							style="width: 97px; background: #CBE9CF; position: absolute; height: 40px; margin-top: 2px; margin-left: -98px; box-shadow: 40px 40px 40px 40px white inset;" />
					</div>
					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3"
							style="height: 40px; width: 199px; font-size: 15px; font-weight: bold; background: #3A006F">
							登录</button>
					</div>
					<div
						style="margin-top: 20px; font-weight: bold; font-size: 18px; margin-bottom: 30px;">
						<a href="register" style="color: #23A8F6; margin-left: 80px;"
							class="zhu">没有账号，立即注册</a><br> <img src="logo/loginsmile.png">
						<span style="margin-left: 20px; color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
	</div>

	<form action="pay" method="post" id="payForm">
		<input type="hidden" name="productuid" id="productuid"> <input
			type="hidden" name="number" id="number"> <input type="hidden"
			name="bdpanduan" id="panduan">
	</form>


	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript">
	$('.tian').hover(function(){
		$(this).css('background','#3878C0');			
	},function(){
		$(this).css('color','white');
		$(this).css('background','#1057A7');
	});
	$('.zaixian').hover(function(){
	},function(){
		$(".huantu").css('border','none');
		$(this).css('border','3px ridge #E3E3E3');
	});
	$('.houzhi').hover(function(){
		$(this).css('border','1px solid red');
	},function(){
		$(this).css('border','1px solid #DDDDDD');
	});
	$(".guizhe").click(function (){
		$("#upfullbg").css({  
            display: "block"  
         });  
         $("#updialog").show();
	})
	function closeAdd(){
		window.location=location;
	}
	function usersupplier(){
		$.post("supplierseleuser",
			function(data){
				if(data.result=="fail"){
					layer.msg('请先添加公司信息', {
						  time: 1000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
						window.location.href="supplierIn";
					});   
				}else if(data.result=="seccuss"){
					window.location.href="userSupplierProduct";
				}else if(data.result=="login"){
					window.location.href="frontLogin";
				}
			}
		)
	}
	function EditStock(pid,pname,manufacturer,lotnumber,isgoodsinstock,description,encapsulation,supplier,supplieruuid){
		$("#inquiry_supplier").val(supplier);
		$("#supplieruuid").val(supplieruuid);
		$("#inquiry_product").val(pname);
		$("#inquiry_brand").val(manufacturer);
		$("#inquiry_package").val(encapsulation);
		$("#lotnumber").val(lotnumber);
		$("#upfullbg").css({  
            display: "block"  
         });  
         $("#updialog").show();
	}
	
	function cgEditStock(pid,pname,manufacturer,lotnumber,isgoodsinstock,description,encapsulation,supplier,supplieruuid){
		$("#cg_supplier").val(supplier);
		$("#cg_supplieruuid").val(supplieruuid);
		$("#cg_product").val(pname);
		$("#cg_brand").val(manufacturer);
		$("#cg_package").val(encapsulation);
		$("#cg_lotnumber").val(lotnumber);
		$("#cgfullbg").css({  
            display: "block"  
         });  
         $("#cgdialog").show();
	}
	$('.zhu').hover(function(){
		$(this).css('color','red');			
	},function(){
		$(this).css('color','#23A8F6');	
	});
	function ziliao(name){
		window.open("ziliao?name="+encodeURIComponent(name));
	}
	
	function doSwithTab(pid){
		if(${sessionScope.userName!=null}){
			alert("denglule");
		    alert(pid)
    	$("#number").val("1");
    	$("#productuid").val(pid);
    	//document.getElementById('payForm').submit(); 
		}else{
			   $(".imgcode").attr('src',
						'kaptcha.jpg?' + Math.floor(Math.random() * 100));
		   	$("#gofullbg").show;  
	          $("#godialog").show();  
		}
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	}
	
	
	$(document).ready(function(){
		$("#keyword").val('${param.keyword}')
	});

	var a;
	var p_uid = "";
	var p_price = 0;
	var p_product = "";
	var expressname;

	<%-- $(function () {
		$("#page").paging({
			total: ${pageSize},/**/ 
			showPage:10,
			currentPage:${page},/*${page}*/
            animation: false,
            centerBgColor: "#fff",
            centerFontColor: "#000",
            centerBorder: "1px solid #ddd",
            transition: "all .2s",
            centerHoverBgColor: "#25dd3d",
            centerHoverBorder: "1px solid #25dd3d",
            centerFontHoverColor: "#fff",
            otherFontHoverColor: "#fff",
            otherBorder: "1px solid #ddd",
            otherHoverBorder: "1px solid #25dd3d",
            otherBgColor: "#fff",
            otherHoverBgColor: "#25dd3d",
            currentFontColor: "#fff",
            currentBgColor: "#f79898",
            currentBorder: "1px solid #f79898",
            fontSize: 13,
            currentFontSize: 13,
            cormer: 2,
            gapWidth: 3,
            showJump: false,
            jumpBgColor: "#fff",
            jumpFontHoverColor: "#fff",
            jumpHoverBgColor: "#25dd3d",
            jumpBorder: "1px solid #ddd",
            jumpHoverBorder: "1px solid #25dd3d",
            simpleType: 1,
            idParameter: 'page',
            submitStyle: 'href',
			url: '<%=basePath%>resistinceZone'
		});
	});
	$(function () {
		$("#page2").paging({
			total: ${pageSize},/**/
			showPage:5,
			currentPage:${page},/*${page}*/
            animation: false,
            centerBgColor: "#fff",
            centerFontColor: "#000",
            centerBorder: "1px solid #ddd",
            transition: "all .2s",
            centerHoverBgColor: "#25dd3d",
            centerHoverBorder: "1px solid #25dd3d",
            centerFontHoverColor: "#fff",
            otherFontHoverColor: "#fff",
            otherBorder: "1px solid #ddd",
            otherHoverBorder: "1px solid #25dd3d",
            otherBgColor: "#fff",
            otherHoverBgColor: "#25dd3d",
            currentFontColor: "#fff",
            currentBgColor: "#f79898",
            currentBorder: "1px solid #f79898",
            fontSize: 13,
            currentFontSize: 13,
            cormer: 2,
            gapWidth: 3,
            showJump: false,
            jumpBgColor: "#fff",
            jumpFontHoverColor: "#fff",
            jumpHoverBgColor: "#25dd3d",
            jumpBorder: "1px solid #ddd",
            jumpHoverBorder: "1px solid #25dd3d",
            simpleType: 1,
            idParameter: 'page',
            submitStyle: 'href',
			url: '<%=basePath%>resistanceZone'
		});
	}); --%>
	    
	$(function () {  
    	var A={links:"",layer:$(".detailLayer"),target:"",windowHight:600,mouseY:0,height:0};
    	function showCard(objCard){
			objCard.mouseenter(function(event){
				var w=$(document).width();
				var x=$(document).height();
				if($('#resultList').find('li.stair_tr:eq(1)').find('.result_supply').attr('ic361_coid')!=undefined){
					$('body').append(O);
					$('#ic361_price').remove();
					$('#ic361_comment').remove();
					$('#ic361_coInfo').remove();
					$('#bot_banner_361').remove();
					$('#ic361_card').remove();
					$('#ic361_lj').remove();
					$('#right-menu').remove();
				}
				A.target=$(this).parents("li").find(".result_supply");
				A.target.css("position","relative");
				A.layer=A.target.find(".detailLayer");
				thisLayer=A.layer;A.height=A.layer.height();
				A.windowHight=$(window).height();
				A.mouseY=event.clientY;
				$("#sift_bar").css("position","static");
				if((A.windowHight-A.mouseY)<A.height){
					A.layer.css("top",-A.height);
				}else {
					A.layer.css("top","20px");
				}
				A.layer.show();
				A.target.mouseleave(function(){
					$("#sift_bar").css("position","relative");
					A.layer.hide();
					A.target.css("position","static");
				});
			});
		}
		showCard($(".result_goCompany"));
	});
	
	$('.goLogin').click(
			function() {
				$(".imgcode").attr('src',
						'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				$("#gofullbg").show;
				$("#godialog").show();
			});
	
	$(document).on('click', '#jiaru', function () {
		if(${sessionScope.userName !=null}){
		 p_uid = $(this).data("uid");
		 p_panduan =$(this).data("panduan");
			$("#number").val("1");
	    	$("#productuid").val(p_uid);
	    	$("#panduan").val(p_panduan);
	    	document.getElementById('payForm').submit(); 
		}else{
			$(".imgcode").attr('src','kaptcha.jpg?' + Math.floor(Math.random() * 100));
		   	$("#gofullbg").show;  
	        $("#godialog").show(); 
		}
	});
	
	$(document).on('click', '#xuanzhe', function () {
		if(${sessionScope.userName !=null}){
		 p_uid = $(this).data("uid");
		 p_panduan = $(this).data("panduan");
		 $.post("addCart?pid="+p_uid,{panduan:p_panduan},
           function(data){
				if(data.result=="fail"){
					swal({
						title: "系统提示",
						text: data.errorMsg,
						type: "success",
					});
				}else if(data.result=="seccuss"){
					window.location.href="cartback?pid="+p_uid+"&panduan="+p_panduan;
				}
			}) 
		}else{ 
			   $(".imgcode").attr('src',
						'kaptcha.jpg?' + Math.floor(Math.random() * 100));
		   	$("#gofullbg").show;  
	          $("#godialog").show(); 
		}
	});
	$(document).on('click', '.zan', function () {
		var suid = $(this).data("supplieruid");
		var pid = $(this).data("pid");
		var t=$(this).parents("li").find(".zz");
		 $.post("inZan?evaluate_pid="+pid,
           function(data){
				if(data.result=="login"){
					$(".imgcode").attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
					$("#gofullbg").show;  
			        $("#godialog").show();
				}else if(data.result=="success"){
					$(t).html("("+data.msg+")");
				}else if(data.result=="fail"){
					
				}
			}
	   	)
	});
	
	$(document).on('click', '.cai', function () {
		var suid = $(this).data("supplieruid");
		var pid = $(this).data("pid");
		var t=$(this).parents("li").find(".cc");
		 $.post("inCai?evaluate_pid="+pid,
           function(data){
				if(data.result=="login"){
					$("#gofullbg").show;  
			        $("#godialog").show();
				}else if(data.result=="success"){
					$(t).html("("+data.msg+")");
				}else if(data.result=="fail"){
					
				}
			}
	   	)
	});
	
	$(document).on('click', '#inquiry_add', function () {
		var inquiry_supplieruuid=document.getElementById("supplieruuid").value;
		var inquiry_supplier=document.getElementById("inquiry_supplier").value;
		var inquiry_product=document.getElementById("inquiry_product").value;
		var inquiry_brand=document.getElementById("inquiry_brand").value;
		var inquiry_package=document.getElementById("inquiry_package").value;
		var inquiry_lotnumber=document.getElementById("lotnumber").value;
		var inquiry_number=document.getElementById("inquiry_number").value;
		var inquiry_price=document.getElementById("inquiry_price").value;
		if(inquiry_number=="" && inquiry_price==""){
			alert("请询价数量和价格为必填项!");
			return;
		}else{
			$.ajax({
				type:"post",
	            url:"addInquiry",
	            async:true,
	            dataType: "json",
	            data: {
	            	inquiry_supplieruuid:inquiry_supplieruuid,
	            	inquiry_supplier:inquiry_supplier,
	            	inquiry_product:inquiry_product,
	            	inquiry_brand:inquiry_brand,
	            	inquiry_package:inquiry_package,
	            	inquiry_lotnumber:inquiry_lotnumber,
	            	inquiry_number:inquiry_number,
	            	inquiry_price:inquiry_price
	            },
				success : function(data){
					if(data.result=="login"){
	            		$("#gofullbg").show;
	                    $("#godialog").show();
	            	}else if(data.result=="success"){
	            		alert("保存成功！");
	            		window.location=location;
	            	}
				}
	        });
		}
	});
	
	$(document).on('click', '#cg_add', function () {
		var inquiry_supplieruuid=document.getElementById("cg_supplieruuid").value;
		var inquiry_supplier=document.getElementById("cg_supplier").value;
		var inquiry_product=document.getElementById("cg_product").value;
		var inquiry_brand=document.getElementById("cg_brand").value;
		var inquiry_package=document.getElementById("cg_package").value;
		var inquiry_lotnumber=document.getElementById("cg_lotnumber").value;
		var inquiry_number=document.getElementById("cg_number").value;
		var inquiry_price=document.getElementById("cg_price").value;
		if(inquiry_number=="" && inquiry_price==""){
			alert("请询价数量和价格为必填项!");
			return;
		}else{
			$.ajax({
				type:"post",
	            url:"addCaigou",
	            async:true,
	            dataType: "json",
	            data: {
	            	inquiry_supplieruuid:inquiry_supplieruuid,
	            	inquiry_supplier:inquiry_supplier,
	            	inquiry_product:inquiry_product,
	            	inquiry_brand:inquiry_brand,
	            	inquiry_package:inquiry_package,
	            	inquiry_lotnumber:inquiry_lotnumber,
	            	inquiry_number:inquiry_number,
	            	inquiry_price:inquiry_price
	            },
				success : function(data){
					if(data.result=="login"){
	            		$("#gofullbg").show;
	                    $("#godialog").show();
	            	}else if(data.result=="success"){
	            		alert("保存成功！");
	            		window.location=location;
	            	}
				}
	        });
		}
	});
	
	$("ul").on("click",".jiazaigengduo", function(){
		$(this).attr('src','logo/shouqi.png');
		var table=$(this).parents("ul").find(".result_son").css({ display: "block"});
		$(this).addClass("sta").removeClass("jiazaigengduo");
	});
	$("ul").on("click", ".sta", function(){
		var table=$(this).parents("ul").find(".result_son").css({ display: "none"});
		$(this).attr('src','img/gengduo.png');
	    $(this).removeClass("sta").addClass("jiazaigengduo");
	});
	
	$(".huantu").click(function () {
		var img=$(this).data("img");
		$(".huantu").css("border", "none");
		$(this).css("border", "1px solid red");
		$(this).parent().parent().find(".datu").html("<a href='upload/"+img+"' target='_blank'><img src='upload/"+img+"'"+"style='height:260px;width:280px;'"+ "/></a>");
	})
	function getRealPath(){
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host+ "/"+ contextPath;//   + "/"+ contextPath
		return basePath ;
	}
	function showBg(pid,product) {
		$('#button2').click(function(){
			var fankuiText = document.getElementById('fankuiText').value;
     		if(fankuiText.replace(/[]/g,"").length == 0){
     			alert("请先填写反馈内容");
     		}else{
     			$.post("fankui?productuuid="+pid+"&product="+product+"&fankuitext="+fankuiText,
       	            function(data){
       					if(data.result=="success"){
       						alert(data.msg);
       						$("#fullbg").hide(); 
       						$("#dialog").hide(); 
       						document.getElementById('fankuiText').value = "";
       					}else if(data.result=="fail"){
       						alert(data.msg);
       					}
       				}
       		   	)
     		}
     		
		});
     	document.getElementById('chanpinbianhao').innerHTML = '${fankuiPid}';
     	document.getElementById('chanpinxinghao').innerHTML = product;
        $("#fullbg").css({  
            display: "block"  
        });  
        $("#dialog").show();  
    }  
    //关闭灰色 jQuery 遮罩   
    function closeBg() {  
        $("#fullbg,#dialog").hide();  
    }
        
	//限制反馈字数
    $("#fankuiText").on("input propertychange", function() {  
        var $this = $(this),  
            _val = $this.val(),  
            count = "";  
        if (_val.length > 200) {  
            $this.val(_val.substring(0, 200));  
        }  
        count = 200 - $this.val().length;  
        $("#text-count").text(count);  
    });
</script>
	<script type="text/javascript">
		$(function(){
			$('.float_qq2').hover(function(){
				
				$(this).animate({"left":"-70px"},350)
				
				},function(){
					
					$(this).animate({"left":"0"},350)
					
					})	
			
			$('.float_qq3').hover(function(){
				
				$(this).animate({"left":"-116px"},350)
				
				},function(){
					
					$(this).animate({"left":"0"},350)
					
					})	
			
			$('.float_qq4').hover(function(){
				
				$(this).animate({"left":"-90px"},350)
				
				},function(){
					
					$(this).animate({"left":"0"},350)
					
					})
			
			
			$('.float_qq5').hover(function(){
				
				$(this).find('.float_shwx').show();
				
				},function(){
					
					$(this).find('.float_shwx').hide();
					
					})
			
			var enflag = false;
			$('.moreEnShow').click(function(){
				if(!enflag){
					$('.moreEn').css('display','inline-block');
					$('.moreEnShow').html("收起"+"<img style='position:absolute' src='logo/moreup.png' >");
				}else{
					$('.moreEn').css('display','none');
					$('.moreEnShow').html("更多"+"<img style='position:absolute' src='logo/moredown.png' >");
				}
				enflag = !enflag;
			});
			
			var maflag = false;
			$('.moreMaShow').click(function(){
				if(!maflag){
					$('.moreMa').css('display','inline-block');
					$('.moreMaShow').html("收起"+"<img style='position:absolute' src='logo/moreup.png' >");
				}else{
					$('.moreMa').css('display','none');
					$('.moreMaShow').html("更多"+"<img style='position:absolute' src='logo/moredown.png' >");
				}
				maflag = !maflag;
			});
			
			var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;
			$head.click(function(e){
				e.stopPropagation();
				if(!inter){
					$('.jiantou').html("<img style='margin-top:-7px;position:absolute;' src='logo/up.png'>");
					$ul.show();
				}else{
					$('.jiantou').html("<img src='logo/down.png'>");
					$ul.hide();
				}
				inter=!inter;
			});
			
			$ul.click(function(event){
				event.stopPropagation();
			});
			
			$(document).click(function(){
				$ul.hide();
				inter=!inter;
			});
	
			$lis.hover(function(){
				var primary = $(this).find('.primary').html();
				var s = '';
				$.post("indexSeleSecond?primary_name="+primary,
					function(data){
						for(var o in data) {
							if(o % 2 != 0){
								s+=("<span><em><a style='margin-left:90px' href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span></br>");
							}else{
								s+=("<span><em><a href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span>");
							}
							 
							 /* "<span><a href='search?product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></span>" */
						}
						$('.prosmore').html('');
						$('.prosmore').html(s);
					}
			   	)
				if(!$(this).hasClass('nochild')){
					$(this).addClass("prosahover");
					$(this).find(".prosmore").removeClass('hide');
				}
			},function(){
				if(!$(this).hasClass('nochild')){
					if($(this).hasClass("prosahover")){
						$(this).removeClass("prosahover");
					}
					$(this).find(".prosmore").addClass('hide');
				}
			});
			
		});
		
	</script>
	<script type="text/javascript">
		$(function(){
			$("#submit1").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					$.post("userLogin", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.reload();
						}else{
							alert(d.msg);
						}
					});
				}
			});	
		});
		
      //关闭灰色 jQuery 遮罩   
      function gocloseBg() {  
          $("#gofullbg,#godialog").hide();  
      }
      
      //验证码
      $('.imgcode').hover(function() {
			layer.tips("看不清？点击更换", '.imgcode', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      
      $('.imgcodedt').hover(function() {
			layer.tips("看不清？点击更换", '.imgcodedt', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      $('#gobutton2').click(function(){
    	  $('#innerDiv1').hide();
    	  $('#innerDiv2').show();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
    	  $('#gobutton1').addClass('button4');
    	  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button3');
      });
      $('#gobutton1').click(function(){
    	  $('#innerDiv1').show();
    	  $('#innerDiv2').hide();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
		  $('#gobutton1').addClass('button3');
		  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button4');
      });

		
		$("#telephonedt").on("input propertychange", function() { 
			$("#erro").html("");
			var phone = document.getElementById("telephonedt").value;
			if(!(/^1[34578]\d{9}$/.test(phone))){
		    	return false; 
		    }else{
		    	$.post("1019/zai/xin/jian/queryByPhone?phone="+phone,
			        function(data){
						if(data.result=="fail"){
							$("#telephonedt").val("");
							alert("请先注册该号码");
							window.location.href="register";
						}else if(data.result=="seccuss"){
						}
					}
			   	) 
		    }
		});
		$(document).ready(function() {

			$("#submit2").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					var yan=$("#yanzhen").val();
					if(yan==null||yan==''){
						layer.msg("请输入短信验证码");
						return false;
					}
					$.post("Loginverification", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.reload();
						}else{
							alert(d.msg);
						}
					});
				}
			})
		});
	</script>
	<script type="text/javascript">
	
		var wait = 60;
		function time(btn) {
			var verify = document.getElementById('verifydt').value;
		  	var phone = document.getElementById('telephonedt').value;
		    if(phone == null || phone == "" ){
		    	layer.msg("请输入手机号码");
		        return false; 
		    }else if(!(/^1[34578]\d{9}$/.test(phone))){
		    	layer.msg("手机号码有误，请重填");
		    	return false; 
		    }else if(verify == null || verify == "" ){
		    	layer.msg("请输入图形验证码");
		    	return false; 
		    }else{
			    if (wait == 60) {
			        btn.value = "获取验证码";
			        var phone = $("#telephonedt").val(); 
				    phone = $.trim(phone); 
				    $.post("verification",{'phone':phone,'login':'login'},function(index){ 
				    },"json") 
			        btn.removeAttribute("disabled"); 
			    }else if(wait == 0){
			    	dj(btn);
			    }
			    btn.setAttribute("disabled", true); 
			    btn.value ="("+ wait + ")重新获取"; 
			    wait--; 
			    setTimeout(function () { 
			    	if(wait==0){
			    		dj(btn);
			    		clearTimeout();
			    	}else{
			            time(btn); 	
			    	}
			    },1000)
		    }
		}
		
		function dj(btn){
		    btn.value = "获取验证码";
		    btn.removeAttribute("disabled"); 
		    wait = 60;
		}
		function clearErro(){
			$("#erro").html("");
		}
	</script>




	<script type="text/javascript">
	$(function() {
		
          	
		//点击电阻触发的事件
	$(".tp_dz em").click(
			function() {
				$("#fuhe").css("display","none");
				/* $('.tp_rz').html('阻值');
				$('.tp_dy').html('功率'); */
				$('#datalist').empty();
				$('.zhuzhi p').hide();
				$('.sousuorz').hide();
				$('.gonglv p').hide();
				$('.jingque p').hide();
				$('.pinpai p').hide();
				 $('.baozhuang p').hide();
				$('#dataList').html('');
				$('.shaixuan2').html('');
				$('.shaixuan2').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan3').html('');
				$('.shaixuan3').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan4').html('');
				$('.shaixuan4').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan5').html('');
				$('.shaixuan5').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan6').html('');
				$('.shaixuan6').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.tp_primary').find("p").removeClass(
						"background_select");
				$('.tp_primary').find("p").find("i").addClass(
						"close_hidden");
				$(this).parent().addClass("background_select");
				$(this).parent().find("i").removeClass(
						"close_hidden");
				$('.shaixuan1').html('贴片电阻');
				$('.shaixuan1').parent().find('.close_shaixuan')
						.removeClass('close_shaixuan_hidden');
				var fengzhuang = '';
				page_primary = '贴片电阻';
				var url = "listResistance";
				$.post(url,function(data) {
							var list = data.list;
							if (data.result == 'success') {
							for (o in list) {
								fengzhuang += '<p class="fz_p" style="margin-bottom: 0px;cursor:pointer"><em style="margin-left:8px""><span>'
									+ list[o].encapsulation
									+ '</span>&emsp;(<a style="color:#FF7F00">'
									+ list[o].num
									+ '</a>)</em></p>';
								}
									} else {
										alert("暂无此类产品");
									}
									$('.fengzhuang1').html(
											fengzhuang);
								})
			});
	
	//点击封装触发的事件
	$(document).on('click','.fz_p em',
			function() {
      	$("#fuhe").css("display","none");
				$("#zr_sousuo").val("");
				$('.sousuorz').css({
					"display" : "block"
				});
				$('#datalist').empty();
				$('.dianya p').hide();
				$('.jingque p').hide();
				$('.pinpai p').hide();
				 $('.baozhuang p').hide();
				$('#searchList').html('');
				$('.shaixuan3').html('');
				$('.shaixuan3').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan4').html('');
				$('.shaixuan4').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan5').html('');
				$('.shaixuan5').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan6').html('');
				$('.shaixuan6').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.fengzhuang1').find("p").removeClass(
						"background_select");
				$('.fengzhuang1').find("p").find("i").addClass(
						"close_hidden");
				$(this).parent().addClass("background_select");
				$(this).parent().find("i").removeClass(
						"close_hidden");
				var pb_primary = $('.tp_primary').find(
						'.background_select').find("span").html();
				var pb_fengzhuang = $(this).parent().find("span")
						.html();
				page_fengzhuang = pb_fengzhuang;
				$('.shaixuan2').html(pb_fengzhuang);
				$('.shaixuan2').parent().find('.close_shaixuan')
						.removeClass('close_shaixuan_hidden');
				var zhuzhi = '';
				var url = "queryZhuZhi?encapsulation="+pb_fengzhuang;
				$.post(url,function(data) {
							var list = data.list;
							if (data.result == 'success') {
							for (o in list) {
								zhuzhi += '<p class="rz_p"style="margin-bottom: 0px;cursor:pointer"><em style="margin-left:8px""><span>'
									+ list[o].zhuzhi
									+ '</span>&emsp;(<a style="color:#FF7F00">'
									+ list[o].num
									+ '</a>)</em></p>';
								    }
									} else {
										alert("暂无此类产品");
									}
									$('.zhuzhi').html(zhuzhi);
								});
			});
	
	/* sou */
	$(document).on('keyup','#zr_sousuo',
					function() {
						$('.jingque p').hide();
						$('#datalist').empty();
						$('.pinpai p').hide();
						$('.shaixuan4').html('');
						 $('.baozhuang p').hide();
						$('.shaixuan4').parent().find('.close_shaixuan')
								.addClass('close_shaixuan_hidden');
						$('.shaixuan5').html('');
						$('.shaixuan5').parent().find('.close_shaixuan')
								.addClass('close_shaixuan_hidden');
						$('.shaixuan6').html('');
						$('.shaixuan6').parent().find('.close_shaixuan')
								.addClass('close_shaixuan_hidden');
						$('.rongzhi').parent().find("p").removeClass(
								"background_select");
						$('.rongzhi').parent().find("p").find("i")
								.addClass("close_hidden");
						var zz = $(this).val();
						var fengzhuang = $('.fengzhuang1').find(
								'.background_select').find("span").html();
						var zhuzhi = '';
						var url = "queryZhuZhiByCanshu?encapsulation=" +fengzhuang
								+ "&&sousuo=" + zz;
						$.post(url,function(data) {
									var list = data.list;
									if (data.result == 'success') {
									$('.zhuzhi').html('');
									for (o in list) {
									zhuzhi += '<p class="rz_p" style="margin-bottom: 0px;cursor:pointer"><em style="margin-left:8px""><span>'
										+ list[o].zhuzhi
										+ '</span>&emsp;(<a style="color:#FF7F00">'
										+ list[o].num
										+ '</a>)</em></p>';
									}
									
								     $.ajax({type : 'post', //可选get  
								            url : 'queryResistanceList',
								            cache : false, //不设置缓存
								            async : "true", //异步
								            dataType : "json",
								            data : {
								         encapsulation : fengzhuang,
									       sousuo: zz,
										             },
							            success : function(msg) {
							              	$("#fuhe").css("display","block");
							            	$(msg.list).each(function(i,e){
							            		if(i==0){
							            		 $("#datalist").append(
							                      '<table  id="#datalisttbody"  class="table table-striped table-bordered" style="width: 100%;text-align: center" >'
										          +'<tr>'
										          +'<td width="17%">型号</td>'
												  +'<td width="10%">品牌</td>'
												  +'<td width="10%">封装</td>'
												  +'<td width="10%">精确度</td>'
												  +'<td width="12%">阻值</td>'
												  +'<td width="10%">库存 (单位)</td>'
												  +'<td width="12%">单价</td>'
												  +'<td width="8">包装</td>'
												  +'<td width="12%">操作</td>'
										          +'</tr>'
										          +'<tr>'
						           			       +'<td width="17%"  >'+e.product+'</td>'
						           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
						           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
						           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
						           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
						           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
						           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
						           			    +'<td width="8">'+e.baozhuang+'</td>'
						           			       +'<p><button type="button" id="jiaru"'
						           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
						           			       +'<p><button type="button" id="xuanzhe"' 
						           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
						           			       +'</td>'
						           		           +'</tr>'); 
							            		}if(i!=0){
							            			 $("#datalist table").append(
							            					'<tr>'
									           			       +'<td width="17%"  >'+e.product+'</td>'
									           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
									           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
									           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
									           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
									           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
									           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
									           			    +'<td width="8">'+e.baozhuang+'</td>'
									           			       +'<td width="12%" >'
									           			       +'<p><button type="button" id="jiaru"'
									           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
									           			       +'<p><button type="button" id="xuanzhe"' 
									           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
									           			       +'</td>'
									           		           +'</tr>');
							            		}
							            	})
							            		
							            },
								            error : function() {
									        alert('对不起异步加载失败了');
											          	}
						                   }); 
										}
									
									else {
											alert("暂无此类产品");
										}
										$('.zhuzhi').html(zhuzhi);
									});
					});

	/* sou end */
	
	//点击阻值触发的事件
	$(document).on('click','.rz_p em',
			function() {
				$('.jingque p').hide();
				$('.pinpai p').hide();
				 $('.baozhuang p').hide();
				$('#datalist').empty();
				$('.shaixuan4').html('');
				$('.shaixuan4').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan5').html('');
				$('.shaixuan5').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.shaixuan6').html('');
				$('.shaixuan6').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.zhuzhi').parent().find("p").removeClass(
						"background_select");
				$('.zhuzhi').parent().find("p").find("i")
						.addClass("close_hidden");
				$(this).parent().addClass("background_select");
				$(this).parent().find("i").removeClass(
						"close_hidden");
				var fengzhuang = $('.fengzhuang1').find(
						'.background_select').find("span").html();
				var zhuzhi = $(this).parent().find("span")
						.html();
				page_rongzhi = zhuzhi;
				$('.shaixuan3').html(zhuzhi);
				$('.shaixuan3').parent().find('.close_shaixuan')
						.removeClass('close_shaixuan_hidden');
				var jingque = '';
				var url = "queryjqd?encapsulation="+fengzhuang+ "&&zhuzhi=" + zhuzhi;
				$.post(url,function(data) {
						var list = data.list;
						if (data.result == 'success') {
						for (o in list) {
							jingque += '<p class="jqd_p" style="margin-bottom: 0px;cursor:pointer"><em style="margin-left:8px""><span>'
								+ list[o].jingquedu
								+ '</span>&emsp;(<a style="color:#FF7F00">'
								+ list[o].num
								+ '</a>)</em></p>';
								}
						  $.ajax({type : 'post', //可选get  
					            url : 'queryResistanceList',
					            cache : false, //不设置缓存
					            async : "true", //异步
					            dataType : "json",
					            data : {
					           encapsulation : fengzhuang,
						       zhuzhi: zhuzhi,
							             },
				            success : function(msg) {
				            	$("#fuhe").css("display","block");
				            	$(msg.list).each(function(i,e){
				            		if(i==0){
				            		 $("#datalist").append(
				                      '<table  id="#datalisttbody"  class="table table-striped table-bordered" style="width: 100%;text-align: center" >'
							          +'<tr>'
							          +'<td width="17%">型号</td>'
									  +'<td width="10%">品牌</td>'
									  +'<td width="10%">封装</td>'
									  +'<td width="10%">精确度</td>'
									  +'<td width="12%">阻值</td>'
									  +'<td width="10%">库存 (单位)</td>'
									  +'<td width="12%">单价</td>'
									  +'<td width="8">包装</td>'
									  +'<td width="12%">操作</td>'
							          +'</tr>'
							          +'<tr>'
			           			       +'<td width="17%"  >'+e.product+'</td>'
			           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
			           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
			           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
			           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
			           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
			           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
			           			    +'<td width="8">'+e.baozhuang+'</td>'
			           			       +'<td width="12%" >'
			           			       +'<p><button type="button" id="jiaru"'
			           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
			           			       +'<p><button type="button" id="xuanzhe"' 
			           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
			           			       +'</td>'
			           		           +'</tr>'); 
				            		}if(i!=0){
				            			 $("#datalist table").append(
				            					'<tr>'
						           			       +'<td width="17%"  >'+e.product+'</td>'
						           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
						           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
						           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
						           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
						           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
						           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
						           			    +'<td width="8">'+e.baozhuang+'</td>'
						           			       +'<td width="12%" >'
						           			       +'<p><button type="button" id="jiaru"'
						           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
						           			       +'<p><button type="button" id="xuanzhe"' 
						           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
						           			       +'</td>'
						           		           +'</tr>');
				            		}
				            	})
				            		
				            },
					            error : function() {
						        alert('对不起异步加载失败了');
								          	}
			                   }); 
									} else {
										alert("暂无此类产品");
									}
									$('.jingque').html(jingque);
								});
			});

			
	
	$(document)
	.on('click','.jqd_p em',
			function() {
		        $('.baozhuang p').hide();
				$('.shaixuan6').html('');
		        $('#datalist').empty();
				$('.shaixuan6').parent().find('.close_shaixuan')
						.addClass('close_shaixuan_hidden');
				$('.jingque').find("p").removeClass(
						"background_select");
				$('.jingque').find("p").find("i").addClass(
						"close_hidden");
				$(this).parent().addClass("background_select");
				$(this).parent().find("i").removeClass(
						"close_hidden");
				
				var fengzhuang = $('.fengzhuang1').find(
						'.background_select').find("span").html();
				var zhuzhi = $('.zhuzhi').find(
						'.background_select').find("span").html();
				var jingque = $(this).parent().find("span").html();
				/* page_jingque = jingque; */
				$('.shaixuan5').html(jingque);
				$('.shaixuan5').parent().find('.close_shaixuan')
						.removeClass('close_shaixuan_hidden');
				var pinpai = '';
				var url = "queryPinpai";
				$.post(url,{encapsulation:fengzhuang,zhuzhi:zhuzhi,jingquedu:jingque},function(data) {
							var list = data.list;
							if (data.result == 'success') {
							for (o in list) {
							pinpai += '<p class="pp_p"style="margin-bottom: 0px;cursor:pointer"><em style="margin-left:8px""><span>'
								+ list[o].manufacturer
								+ '</span>&emsp;(<a style="color:#FF7F00">'
								+ list[o].num
								+ '</a>)</em></p>';
								}

							  $.ajax({type : 'post', //可选get  
						            url : 'queryResistanceList',
						            cache : false, //不设置缓存
						            async : "true", //异步
						            dataType : "json",
						            data : {
						           encapsulation:fengzhuang,
							       zhuzhi:zhuzhi,
							       jingquedu:jingque,
								             },
					            success : function(msg) {
					            	$("#fuhe").css("display","block");
					            	$(msg.list).each(function(i,e){
					            		if(i==0){
					            		 $("#datalist").append(
					                      '<table  id="#datalisttbody"  class="table table-striped table-bordered" style="width: 100%;text-align: center" >'
								          +'<tr>'
								          +'<td width="17%">型号</td>'
										  +'<td width="10%">品牌</td>'
										  +'<td width="10%">封装</td>'
										  +'<td width="10%">精确度</td>'
										  +'<td width="12%">阻值</td>'
										  +'<td width="10%">库存 (单位)</td>'
										  +'<td width="12%">单价</td>'
										  +'<td width="8">包装</td>'
										  +'<td width="12%">操作</td>'
								          +'</tr>'
								          +'<tr>'
				           			       +'<td width="17%"  >'+e.product+'</td>'
				           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
				           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
				           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
				           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
				           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
				           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
				           			    +'<td width="8">'+e.baozhuang+'</td>'
				           			       +'<td width="12%" >'
				           			       +'<p><button type="button" id="jiaru"'
				           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
				           			       +'<p><button type="button" id="xuanzhe"' 
				           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
				           			       +'</td>'
				           		           +'</tr>'); 
					            		}if(i!=0){
					            			 $("#datalist table").append(
					            					'<tr>'
							           			       +'<td width="17%"  >'+e.product+'</td>'
							           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
							           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
							           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
							           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
							           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
							           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
							           			    +'<td width="8">'+e.baozhuang+'</td>'
							           			       +'<td width="12%" >'
							           			       +'<p><button type="button" id="jiaru"'
							           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
							           			       +'<p><button type="button" id="xuanzhe"' 
							           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
							           			       +'</td>'
							           		           +'</tr>');
					            		}
					            	})
					            		
					            },
						            error : function() {
							        alert('对不起异步加载失败了');
									          	}
				                   }); 
							
							
								} else {
									alert("暂无此类产品");
								}
						 $('.pinpai').html(pinpai);
								})
			});
	
	$(document).on('click','.pp_p em',
			function() {
	            $('#datalist').empty();
				$('.pinpai').find("p").removeClass("background_select");
				$('.pinpai').find("p").find("i").addClass("close_hidden"); 
				$(this).parent().addClass("background_select");
				$(this).parent().find("i").removeClass("close_hidden");
				var fengzhuang = $('.fengzhuang1').find(
						'.background_select').find("span").html();
				var zhuzhi = $('.zhuzhi').find('.background_select')
						.find("span").html();
				
				var jingque = $('.jingque').find('.background_select')
						.find("span").html();
				var pinpai = $(this).parent().find("span").html();
				pinpai = pinpai;
				var baozhuang = '';
				$('.shaixuan6').html(pinpai);
				/* $('.shaixuan6').parent().find('.close_shaixuan').removeClass('close_shaixuan_hidden'); */
				var url="queryBaozhuang";
		$.post(url,{encapsulation:fengzhuang,zhuzhi:zhuzhi,jingquedu:jingque,manufacturer:pinpai},function(data) {
					var list = data.list;
					if (data.result == 'success') {
					for (o in list) {
						baozhuang += '<p class="bz_p" style="margin-bottom: 0px;cursor:pointer"><em style="margin-left:8px""><span>'
							+ list[o].baozhuang
							+ '</span>&emsp;(<a style="color:#FF7F00">'
							+ list[o].num
							+ '</a>)</em></p>';
							}
				$.ajax({
					type : 'post', //可选get  
					url : 'queryResistanceList',
					cache : false, //不设置缓存
					async : "true", //异步
					dataType : "json",
					data : {
						encapsulation : fengzhuang,
						zhuzhi : zhuzhi,
						jingquedu : jingque,
						manufacturer : pinpai
					}, 
					success : function(msg) {
		            	$("#fuhe").css("display","block");
		            	$(msg.list).each(function(i,e){
		            		if(i==0){
		            		 $("#datalist").append(
		                      '<table  id="#datalisttbody"  class="table table-striped table-bordered" style="width: 100%;text-align: center" >'
					          +'<tr>'
					          +'<td width="17%">型号</td>'
							  +'<td width="10%">品牌</td>'
							  +'<td width="10%">封装</td>'
							  +'<td width="10%">精确度</td>'
							  +'<td width="12%">阻值</td>'
							  +'<td width="10%">库存 (单位)</td>'
							  +'<td width="12%">单价</td>'
							  +'<td width="8">包装</td>'
							  +'<td width="12%">操作</td>'
					          +'</tr>'
					          +'<tr>'
	           			       +'<td width="17%"  >'+e.product+'</td>'
	           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
	           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
	           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
	           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
	           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
	           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
	           			    +'<td width="8">'+e.baozhuang+'</td>'
	           			       +'<td width="12%" >'
	           			       +'<p><button type="button" id="jiaru"'
	           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
	           			       +'<p><button type="button" id="xuanzhe"' 
	           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
	           			       +'</td>'
	           		           +'</tr>'); 
		            		}if(i!=0){
		            			 $("#datalist table").append(
		            					'<tr>'
				           			       +'<td width="17%"  >'+e.product+'</td>'
				           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
				           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
				           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
				           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
				           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
				           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
				           			    +'<td width="8">'+e.baozhuang+'</td>'
				           			       +'<td width="12%" >'
				           			       +'<p><button type="button" id="jiaru"'
				           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
				           			       +'<p><button type="button" id="xuanzhe"' 
				           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
				           			       +'</td>'
				           		           +'</tr>');
		            		}
		            	})
		            		
		            },
					error : function() {
						alert('对不起异步加载失败了');
					}
				      });
			       }
					else {
							alert("暂无此类产品");
						}
						$('.baozhuang').html(baozhuang);
					});
	});});
	
	
	$(document).on(
			'click',
			'.baozhuang em',
			function() {
				 $('#datalist').empty();
				$('.baozhuang').find("p").removeClass("background_select");
				$('.baozhuang').find("p").find("i").addClass("close_hidden");
				$(this).parent().addClass("background_select");
				$(this).parent().find("i").removeClass("close_hidden");
				var fengzhuang = $('.fengzhuang1').find(
						'.background_select').find("span").html();
				var zhuzhi = $('.zhuzhi').find('.background_select')
						.find("span").html();
				var jingque = $('.jingque').find('.background_select')
						.find("span").html();
				var pinpai = $('.pinpai').find('.background_select')
				.find("span").html();
		
				var baozhuang = $(this).parent().find("span").html();
				
				baozhuang = baozhuang;

				$.ajax({
					type : 'post', //可选get  
					url : 'queryResistanceList',
					cache : false, //不设置缓存
					async : "true", //异步
					dataType : "json",
					data : {
						encapsulation : fengzhuang,
						zhuzhi : zhuzhi,
						jingquedu : jingque,
						manufacturer : pinpai,
						baozhuang :baozhuang
					},
					success : function(msg) {
		            	$("#fuhe").css("display","block");
		            	$(msg.list).each(function(i,e){
		            		if(i==0){
		            		 $("#datalist").append(
		                      '<table  id="#datalisttbody"  class="table table-striped table-bordered" style="width: 100%;text-align: center" >'
					          +'<tr>'
					          +'<td width="17%">型号</td>'
							  +'<td width="10%">品牌</td>'
							  +'<td width="10%">封装</td>'
							  +'<td width="10%">精确度</td>'
							  +'<td width="12%">阻值</td>'
							  +'<td width="10%">库存 (单位)</td>'
							  +'<td width="12%">单价</td>'
							  +'<td width="8">包装</td>'
							  +'<td width="12%">操作</td>'
					          +'</tr>'
					          +'<tr>'
	           			       +'<td width="17%"  >'+e.product+'</td>'
	           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
	           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
	           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
	           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
	           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
	           			    +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
	           			    +'<td width="8">'+e.baozhuang+'</td>'
	           			       +'<td width="12%" >'
	           			       +'<p><button type="button" id="jiaru"'
	           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
	           			       +'<p><button type="button" id="xuanzhe"' 
	           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
	           			       +'</td>'
	           		           +'</tr>'); 
		            		}if(i!=0){
		            			 $("#datalist table").append(
		            					'<tr>'
				           			       +'<td width="17%"  >'+e.product+'</td>'
				           			       +'<td width="10%"  >'+e.manufacturer+'</td>'
				           			       +'<td width="10%"  >'+e.encapsulation+'</td>'
				           			       +'<td width="10%"  >'+e.jingquedu+'</td>'
				           			       +'<td width="12%"  >'+e.zhuzhi+'</td>'
				           			       +'<td width="10%"  >'+e.isGoodsInStock+e.danwei+'</td>'
				           			     
				           			       +'<td width="12%" style="padding-top:25px">'+e.price+'元'+'('+e.description+')'+'</td>'
				           			    +'<td width="8">'+e.baozhuang+'</td>'
				           			       +'<td width="12%" >'
				           			       +'<p><button type="button" id="jiaru"'
				           			       +'data-uid="'+e.productuuid+'"  data-panduan="beidong" class="btn btn-primary btn-sm" style="width:78px">立即购买</button></p>'
				           			       +'<p><button type="button" id="xuanzhe"' 
				           			       +'data-panduan="beidong" data-price="'+e.price+'" data-uid="'+e.productuuid+'"data-product="'+e.product+'" class="btn btn-primary btn-sm" style="width:78px">加入购物车</button></p>'
				           			       +'</td>'
				           		           +'</tr>');
		            		}
		            	})
		            		
		            },
					error : function() {
						alert('对不起异步加载失败了');
					}
				});
			});
	
	
	
	
	</script>
	<%-- <script type="text/javascript" src="js/search_card.js"></script> --%>
	<script src='js/background.min.js' type="text/javascript"></script>
	<script src="layer/layer.js"></script>
	<script src="js/dist/jquery.validator.min.js?local=zh-CN"
		type="text/javascript" charset="utf-8"></script>
	<%@include file="../../include/footer.jsp"%>
</body>
</html>

