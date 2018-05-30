<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<%
	if (session.getAttribute("uid") == null) {
		response.sendRedirect("frontLogin");
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="css/dhtmlxcombo.css?15345521" />
<script src="js/dhtmlxcombo.js"></script>
<style type="text/css">
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	color: rgb(250, 0, 255);
}

::-moz-placeholder { /* Mozilla Firefox 19+ */
	color: rgb(250, 0, 255);
}

input:-ms-input-placeholder, textarea:-ms-input-placeholder {
	color: rgb(250, 0, 255);
}

input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
	color: rgb(250, 0, 255);
}

.zznav {
	position: relative;
	z-index: 1;
	padding-left: 1em;
}

.zznav>a {
	position: relative;
	display: inline-block;
	padding: .3em 1em 0;
	color: inherit;
	text-decoration: none;
	margin: 0 -.3em;
}

.zznav>a::before, .zznav a::before {
	content: ''; /* To generate the box */
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -1;
	border-bottom: none;
	border-radius: .5em .5em 0 0;
	background: #A5C9CE linear-gradient(hsla(0, 0%, 100%, .6),
		hsla(0, 0%, 100%, 0));
	box-shadow: 0 .15em white inset;
	transform: scale(1.1, 1.3) perspective(.5em) rotateX(5deg);
	transform-origin: bottom;
}

.zznav a.selected {
	z-index: 2;
}

.zznav a.selected::before {
	background-color: #CDC8B1;
	margin-bottom: -.08em;
}

.zznav.left>a::before {
	transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
	transform-origin: bottom left;
}

.zznav.right {
	padding-left: 2em;
}

.zznav.right>a::before {
	transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
	transform-origin: bottom right;
}

.zznav a:hover {
	color: white;
}

#updialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #1057A7;
	height: 400px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 445px;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

#updialog select {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

#updialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}

#xiudialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #1057A7;
	height: 400px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 445px;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

#xiudialog select {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

#xiudialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}

#cgdialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #1057A7;
	height: 400px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 445px;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

#cgdialog input {
	height: 30px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
}

#cgdialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}
</style>
<title>自可知用户系统-普通询价</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon" />
<script>
	var myCombo;
	function doOnLoad() {
		myCombo = dhtmlXComboFromSelect("myinquiry");
		dhtmlXComboFromSelect("upmyinquiry");
		dhtmlXComboFromSelect("xiumyinquiry");
	}
</script>
</head>
<body onload="doOnLoad();">
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl">
				<div
					style="display: inline-block; background: #222222; width: 200px; margin-left: -15px; height: 50px; position: absolute; text-align: center; line-height: 50px; font-size: 16px; font-weight: bold;">
					<a href="index" style="color: white;"> 自可知用户系统 </a>
				</div>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>
				<div style="display: inline-block; margin-left: 800px;">
					<nav class="nav navbar-nav">
						<ul class="cl">
							<li style="min-width: 500px;">会员星级 : <c:if
									test="${sessionScope.star == 0 }">
										(星级随着订单交易完成的数量成长)	
									</c:if> <c:if test="${sessionScope.star == 1 }">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star==2 }">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star>50}">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
									<img style="margin-top: 10px;"
										src="<%=basePath%>logo/user_xingji.png">
								</c:if>
							</li>
						</ul>
					</nav>
				</div>

				<nav id="Hui-userbar"
					class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#"
							class="dropDown_A">${user.username}<i class="Hui-iconfont">&#xe6d5;</i>
						</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="frontLogin">切换账户</a></li>
								<li><a href="userOut">退出</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside" style="background: white;">
		<input type="hidden" id="supplieruid" value="" />
		<div class="menu_dropdown bk_2">
			<dl id="menu_1">
				<dt>
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="usersystem" data-title="个人中心"
						style="font-weight: bold;"> 个人中心 </a> <i
						class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="myCart" data-title="我的购物车">
								&emsp;&emsp;我的购物车 </a></li>
						<li><a href="express" data-title="我的订单"> &emsp;&emsp;我的订单
						</a></li>
						<li><a href="MyAddress" data-title="地址">&emsp;&emsp;我的地址</a>
						</li>
						<li><a href="cashback" data-title="订单返现">&emsp;&emsp;订单返现</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						data-title="库存管理" href="javascript:;" style="font-weight: bold;">上传库存</a><i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="supplierIn" data-title="公司信息">&emsp;&emsp;公司资料</a></li>
						<li><a href="javascript:;" onclick="usersupplier()"
							data-title="库存管理"> &emsp;&emsp;优势库存 </a></li>
						<li><a href="javascript:;" onclick="usersupplierpt();"
							data-title="公司信息">&emsp;&emsp;普通库存</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu_2">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/jilu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						data-title="库存管理" href="javascript:;" style="font-weight: bold;">资源管理</a><i
						class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dt style="border: none;">
					<ul>
						<li style="background: #D0DFEF;"><a
							href="queryByInquiryUserid" data-title="询价记录"
							style="font-weight: normal;"> <img
								style="position: absolute; margin-top: 8px;"
								src="<%=basePath%>logo/yuan.png">&emsp;&emsp;询价记录（采购记录）
						</a></li>
						<li><a href="quoteAllByUser" data-title="报价记录"
							style="font-weight: normal;">&emsp;&emsp;报价记录</a></li>
						<li><a href="stockAll" data-title="库存管理"
							style="font-weight: normal;"> &emsp;&emsp;库存管理（销售订单） </a></li>
					</ul>
				</dt>
			</dl>
			<c:if test="${sessionScope.supplieruid==1 }">
				<dl id="menu_7">
					<dt>
						<img src="<%=basePath%>logo/zaixiang.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							data-title="库存管理" href="javascript:;" style="font-weight: bold;">在线购</a><i
							class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li><a href="seleonlineProduct" data-title="在线购库存">
									&emsp;&emsp;在线购库存 </a></li>
							<li><a href="seleOnlineExpress" data-title="在线购订单">&emsp;&emsp;在线购订单</a></li>
						</ul>
					</dd>
				</dl>
			</c:if>
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs"
			style="background: white; border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list">
					<li>
						<nav class="zznav" style="margin-top: 11px; margin-left: 13px;">
							<a href="index">首页</a> <a href="queryByInquiryUserid"
								class="selected">(询价/采购)记录</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="upfullbg"></div>
		<div id="updialog">
			<div
				style="height: 40px; background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */ background: -o-radial-gradient(#FF2D2D, #CB0201); background: -moz-radial-gradient(#CB0201, #FF2D2D); background: radial-gradient(#FF2D2D, #CB0201); text-align: center; line-height: 40px;">
				<span
					style="font-weight: bold; font-size: 17px; color: white; line-height: 40px;">自可知-询价记录添加</span>
				<a href="javascript:;" onclick="closeAdd()"> <img
					style="position: absolute; margin-left: 78px; margin-top: 3px;"
					src="<%=basePath%>logo/close.png">
				</a>
			</div>
			<form id="inquiryForm" action="addInquiryxunjia" method="post"
				style="padding-left: 20px; padding-top: 20px;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>供&#8195;应&#8195;商&#8195;
				</p>
				<input onblur="id1()" type="text" name="inquiry_supplier"
					placeholder="供应商" required="required"
					style="text-transform: uppercase; width: 290px; color: #000000; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>联&nbsp;系&nbsp;方&nbsp;式&#8195;
				</p>
				<input onblur="id1()" type="text" name="inquiry_telphone"
					placeholder="联系方式" required="required"
					style="text-transform: uppercase; width: 290px; color: #000000; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input onblur="id2()" type="text" name="inquiry_product"
					placeholder="型号" required="required"
					style="text-transform: uppercase; width: 290px; margin-top: 5px; color: #000000; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;
				</p>
				<input onblur="id5()" type="text" name="inquiry_brand"
					placeholder="品牌" required="required"
					style="width: 100px; text-transform: uppercase; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">

				<p>
					&nbsp;&nbsp;<span style="color: red;">*</span>封&#8195;装&#8195;
				</p>
				<input type="text" name="inquiry_package" placeholder="封装"
					required="required"
					style="width: 118px; height: 30px; text-transform: uppercase; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>批&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input type="text" name="inquiry_lotnumber" placeholder="批号"
					required="required"
					style="width: 100px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p>
					&nbsp;&nbsp;<span style="color: red;">*</span>数&#8195;量&#8195;
				</p>
				<input type="text" name="inquiry_number" placeholder="数量"
					required="required"
					style="width: 116px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>价&#8195;&#8195;&#8195;格&#8195;
				</p>
				<input type="number" step="0.01" name="inquiry_price"
					style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;"
					placeholder="价格" required="required">-&nbsp;<select
					name="inquiry_priceutil"
					style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
					<option selected="selected">人民币</option>
					<option>美元</option>
				</select>
				<p id="p4"
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>质&#8195;&#8195;&#8195;量&#8195;</p>
				<input type="text" name="inquiry_quality" id="inquiry_quality"
					placeholder="质量"
					style="width: 100px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p id="p4"
					style="display: block; margin-left: 80px; height: 13px; color: red;"></p>
				<br> <br>
				<button id="inquiry_add" type="submit" class="g-btn g-mr-5 tian"
					style="border: none; height: 30px; width: 70px; padding: 0px; cursor: pointer; padding-top: 1px\0; float: right; margin-right: 205px; margin-top: -15px; background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */ background: -o-radial-gradient(#FF2D2D, #CB0201); background: -moz-radial-gradient(#CB0201, #FF2D2D); background: radial-gradient(#FF2D2D, #CB0201); color: white">
					添加保存</button>
			</form>
		</div>
		<div id="cgfullbg"></div>
		<div id="cgdialog">
			<div
				style="height: 40px; background: #1057A7; text-align: center; line-height: 40px;">
				<span
					style="font-weight: bold; font-size: 17px; color: white; line-height: 40px;">采购记录添加</span>
				<a href="javascript:;" onclick="closeAdd()"> <img
					style="position: absolute; margin-left: 78px; margin-top: 3px;"
					src="<%=basePath%>logo/close.png">
				</a>
			</div>
			<form action="addCaigouUser" method="post"
				style="padding-left: 20px; padding-top: 20px;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>供&#8195;应&#8195;商&#8195;
				</p>
				<input onblur="id1()" type="text" name="inquiry_supplier"
					placeholder="供应商" required="required"
					style="border: 2px #87CEEB solid; text-transform: uppercase; width: 290px; color: #000000; margin-left: 2px">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>电&nbsp;话&nbsp;/&nbsp;QQ&#8195;
				</p>
				<input onblur="id1()" type="text" name="inquiry_telphone"
					placeholder="联系方式" required="required"
					style="border: 2px #87CEEB solid; text-transform: uppercase; width: 290px; color: #000000;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input onblur="id2()" type="text" name="inquiry_product"
					placeholder="型号" required="required"
					style="border: 2px #87CEEB solid; text-transform: uppercase; width: 290px; margin-top: 5px; color: #000000; margin-left: 2px">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p><span style="color: red; margin-left: -8px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;</p>
				<input onblur="id5()" type="text" name="inquiry_brand"
					placeholder="品牌" required="required"
					style="width: 80px; border: 2px #87CEEB solid; text-transform: uppercase;">
				<p>&nbsp;&nbsp;<span style="color: red;">*</span>封&#8195;装&#8195;</p>
				<input type="text" name="inquiry_package" placeholder="封装"
					required="required"
					style="width: 138px; border: 2px #87CEEB solid; text-transform: uppercase;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p><span style="color: red; margin-left: -8px;">*</span>批&#8195;&#8195;&#8195;号&#8195;</p>
				<input type="text" name="inquiry_lotnumber" placeholder="批号"
					required="required" style="width: 80px; border: 2px #87CEEB solid;">
				<p>
					&nbsp;&nbsp;<span style="color: red;">*</span>数&#8195;量&#8195;
				</p>
				<input type="text" name="inquiry_number" placeholder="数量"
					required="required"
					style="width: 137px; border: 2px #87CEEB solid;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>价&#8195;&#8195;&#8195;格&#8195;
				</p>
				<input type="number" name="inquiry_price" step="0.01"
					placeholder="价格" required="required"
					style="border: 2px #87CEEB solid;">-&nbsp;<select
					name="inquiry_priceutil"
					style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
					<option selected="selected">人民币</option>
					<option>美元</option>
				</select>
				<p id="p4"
					style="display: block; margin-left: 80px; height: 13px; color: red;"></p>
				<p>质&#8195;&#8195;&#8195;量&#8195;</p>
				<input type="text" name="inquiry_quality" id="cg_inquiry_quality"
					placeholder="质量" style="width: 100px; border: 2px #87CEEB solid;">
				<p id="p4"
					style="display: block; margin-left: 80px; height: 13px; color: red;"></p>
				<br>
				<button type="submit" class="g-btn g-mr-5 tian"
					style="border: none; height: 30px; width: 70px; padding: 0px; cursor: pointer; padding-top: 1px\0; float: right; margin-right: 205px; margin-top: -15px; background: #1057A7; color: white">
					添加保存</button>
			</form>
		</div>
		<div id="xiufullbg"></div>
		<div id="xiudialog">
			<div
				style="height: 40px; background: #1057A7; text-align: center; line-height: 40px;">
				<span
					style="font-weight: bold; font-size: 17px; color: white; line-height: 40px;">询价/采购记录修改</span>
				<a href="javascript:;" onclick="closeAdd()"> <img
					style="position: absolute; margin-left: 78px; margin-top: 3px;"
					src="<%=basePath%>logo/close.png">
				</a>
			</div>
			<form action="updateInquiryxunjia" method="post"
				style="padding-left: 20px; padding-top: 25px;">
				<p>
					<input type="hidden" id="inquiry_id" name="inquiry_id"><input
						type="hidden" name="inquiry_supplieruuid" value=""> <span
						style="color: red; margin-left: -8px;">*</span>供&#8195;应&#8195;商&#8195;
				</p>
				<input onblur="id1()" type="text" id="inquiry_supplier"
					name="inquiry_supplier" placeholder="供应商" required="required"
					style="text-transform: uppercase; width: 290px; color: #000000; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; margin-left: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>电&nbsp;话&nbsp;/&nbsp;QQ&#8195;
				</p>
				<input onblur="id1()" type="text" id="inquiry_telphone"
					name="inquiry_telphone" placeholder="联系方式" required="required"
					style="text-transform: uppercase; width: 290px; color: #000000; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input onblur="id2()" type="text" id="inquiry_product"
					name="inquiry_product" placeholder="型号" required="required"
					style="text-transform: uppercase; width: 290px; margin-top: 5px; color: #000000; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; margin-left: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p><span style="color: red; margin-left: -8px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;</p>
				<input onblur="id5()" type="text" id="inquiry_brand"
					name="inquiry_brand" placeholder="品牌" required="required"
					style="width: 80px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red; margin-left: -8px;">*</span>封&#8195;装&#8195;</p>
				<input type="text" id="inquiry_package" name="inquiry_package"
					placeholder="封装" required="required"
					style="width: 138px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p><span style="color: red; margin-left: -8px;">*</span>批&#8195;&#8195;&#8195;号&#8195;</p>
				<input type="text" id="inquiry_lotnumber" name="inquiry_lotnumber"
					placeholder="批号"
					style="width: 80px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p>
					&nbsp;&nbsp;<span style="color: red;">*</span>数&#8195;量&#8195;
				</p>
				<input type="text" id="inquiry_number" name="inquiry_number"
					placeholder="数量" required="required"
					style="width: 137px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>价&#8195;&#8195;&#8195;格&#8195;
				</p>
				<input type="number" step="0.01" name="inquiry_price"
					id="inquiry_price" placeholder="价格" required="required"
					style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				-&nbsp;<select id="inquiry_priceutil" name="inquiry_priceutil"
					style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				</select> <select id="inquiry_status" name="inquiry_status">
				</select>
				<p id="p4"
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>质&#8195;&#8195;&#8195;量&#8195;</p>
				<input type="text" name="inquiry_quality" id="xg_inquiry_quality"
					placeholder="质量"
					style="width: 100px; border: 2px #87CEEB solid; height: 30px;">
				<p id="p4"
					style="display: block; margin-left: 80px; height: 13px; color: red;"></p>
				<br>
				<button type="submit" class="g-btn g-mr-5 tian"
					style="border: none; height: 30px; width: 70px; padding: 0px; cursor: pointer; padding-top: 1px\0; float: right; margin-right: 205px; margin-top: -15px; background: #1057A7; color: white">
					添加保存</button>
			</form>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div style="margin-top: 10px;"></div>
			<div style="float: left; line-height: 65px; margin-left: 20px;">
				<a id="yiji" class="btn btn-primary"
					style="color: white; position: relative; background: #EE4000; padding: 4px 10px 4px 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px;">
					添加询价</a><a id="caigou" class="btn btn-primary"
					style="margin-left: 15px; color: white; position: relative; background: #0035EE; padding: 4px 10px 4px 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px;">
					添加采购</a>
				<!-- <span style="font-size: 24px;margin-left: 280px;"><img alt="" src="logo/xunjia.png"></span> -->
			</div>
			<!-- <p style="clear:both;"></p> -->
			<div style="margin-left: 30px; margin-top: 16px; float: left">
				<form action="queryByInquiryUserid" method="post">
					<input type="text" name="product" placeholder="请输入型号"
						style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; width: 260px;"
						value="${product }"> <input type="date" name="date1"
						value="${date1 }"
						style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; width: 120px; margin-left: 20px;">至&nbsp;<input
						type="date" value="${date2 }" name="date2"
						style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; width: 120px;">
					<select name="status"
						style="width: 70px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; text-align: center; margin-left: 20px;">
						<option value="0">全部</option>
						<option value="1">询价</option>
						<option value="2">采购</option>
					</select> <input type="submit" value="搜  索"
						style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */ background: -o-radial-gradient(#FF2D2D, #CB0201); background: -moz-radial-gradient(#CB0201, #FF2D2D); background: radial-gradient(#FF2D2D, #CB0201); color: white; padding: 4px 12px 4px 12px; border-radius: 3px; -webkit-font-smoothing: antialiased; font-size: 16px; border: none; margin-left: 15px;">
				</form>
			</div>
			<div style="float: left; line-height: 65px; margin-left: 20px;">
			</div>
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div>
					<a name="top"></a>
					<div class="mt-20">
						<table
							style="border: 1px #EEEEEE solid; border-collapse: collapse; width: 1127px; margin-left: 20px;">
							<thead
								style="border-bottom: 2px solid #EEEEEE; background-color: #BCBFFD;">
								<tr>
									<th width="140"
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; padding-left: 10px; text-align: center;"">产品型号</th>
									<th width="160"
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;"">供应商</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">联系方式</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">品牌</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">批号</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">封装</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">数量</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">价格</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">质量</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">时间</th>
									<th
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">状态</th>
									<th
										style="border-left: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">操作</th>
								</tr>
								<tr style="height: 20px;"></tr>
							</thead>
							<tbody style="background-color: #F5FAFE">
								<c:forEach items="${inquiry}" var="inquiry" varStatus="status">
									<tr style="height: 50px; border-bottom: 2px solid #EEEEEE;">
										<td
											style="height: 40px; width: 120px; border-right: 2px solid #EEEEEE;"><p
												style="padding-left: 10px; width: 120px; overflow: hidden; clear: both; text-overflow: ellipsis; white-space: nowrap; text-align: left;"
												title="${inquiry.inquiry_product}">
												<a href="search?keyword=${inquiry.inquiry_product}"
													target="_blank">${inquiry.inquiry_product}</a>
											</p></td>
										<td
											style="height: 40px; width: 140px; border-right: 2px solid #EEEEEE;"
											title=""><c:if
												test="${inquiry.supplier.suppliername == null}">
												<p
													style="width: 160px; overflow: hidden; clear: both; text-overflow: ellipsis; white-space: nowrap; text-align: left"
													title="${inquiry.inquiry_supplier}">${inquiry.inquiry_supplier}</p>
											</c:if>
											<p
												style="width: 160px; overflow: hidden; clear: both; text-overflow: ellipsis; white-space: nowrap;"
												title="${inquiry.supplier.suppliername}">${inquiry.supplier.suppliername}</p>
										</td>
										<td
											style="height: 40px; dding-left: 5px; border-right: 2px solid #EEEEEE;"
											title=""><c:if
												test="${inquiry.supplier.telphone1 == null}">
													${inquiry.inquiry_telphone}
												</c:if> ${inquiry.supplier.telphone1}</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;">${inquiry.inquiry_brand}</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;">${inquiry.inquiry_lotnumber}</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;">${inquiry.inquiry_package}</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;">${inquiry.inquiry_number}${inquiry.inquiry_utilnumber}</td>
										<td
											style="height: 40px; text-align: left; border-right: 2px solid #EEEEEE;"><c:if
												test="${inquiry.inquiry_priceutil ne '美元' }">￥ ${inquiry.inquiry_price}</c:if>
											<c:if test="${inquiry.inquiry_priceutil eq '美元' }">&nbsp;$&nbsp;${inquiry.inquiry_price}</c:if></td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;">${inquiry.inquiry_quality}</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; width: 80px; border-right: 1px solid #EEEEEE;">
											<fmt:formatDate value="${inquiry.inquiry_date}"
												pattern="yyyy-MM-dd HH:mm" />
										</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;">
											<c:if test="${inquiry.inquiry_status==1}">
												<span style="color: #EE4000;"><b>询价</b></span>
											</c:if> <c:if test="${inquiry.inquiry_status==2}">
												<span style="color: #0035EE;"><b>采购</b></span>
											</c:if>
										</td>
										<td
											style="height: 40px; text-align: center; border-left: 2px solid #EEEEEE;">
											<a href="javascript:;"
											onclick="updatein('${inquiry.inquiry_id}',
												'${inquiry.inquiry_product}','${inquiry.inquiry_brand}',
												'${inquiry.inquiry_lotnumber}','${inquiry.inquiry_package}',
												'${inquiry.inquiry_number}','${inquiry.inquiry_price}',
												'${inquiry.inquiry_telphone}','${inquiry.supplier.telphone1}','${inquiry.supplier.suppliername}','${inquiry.inquiry_supplier}','${inquiry.inquiry_status }','${inquiry.inquiry_priceutil }','${inquiry.inquiry_quality }')">修改</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<div class="g-cf g-pagerwp g-bd-box g-plr-10 g-o-h"
							style="width: 1113px; margin-left: 20px;">
							<div class="g-pager g-f-r" style="visibility: visible;">
								<span>总记录数：${total }</span> <span>页数：<c:if
										test="${count==0 }">0</c:if> <c:if test="${count!=0 }">${page}</c:if>/${count }
								</span>
								<c:if test="${page<=1 || page==null}">
									<a class="no">首页</a>
									<a class="no">上一页</a>
								</c:if>
								<c:if test="${page>1}">
									<a
										href="queryByInquiryUserid?product${product }&date1=${date1}&date2=${date2}&status=${status}">首页</a>
									<a
										href="queryByInquiryUserid?page=${page-1 }&product${product }&date1=${date1}&date2=${date2}&status=${status}">上一页</a>
								</c:if>
								<c:if test="${page==count || count==0}">
									<a class="no">下一页</a>
									<a class="no">尾页</a>
								</c:if>
								<c:if test="${page!=count && count!=0}">
									<a
										href="queryByInquiryUserid?page=${page+1 }&product${product }&date1=${date1}&date2=${date2}&status=${status}">下一页</a>
									<a
										href="queryByInquiryUserid?page=${count }&product${product }&date1=${date1}&date2=${date2}&status=${status}">尾页</a>
								</c:if>
								<%-- <c:if test="${page>3}">
										<input class="g-go-page" type="text" name="page">
										<a id="">GO</a>
									</c:if> --%>
							</div>
						</div>
					</div>
					<%-- <div style="width: 100%;height: 27px;margin-top: 3px;">
					       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
					       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
					       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
					       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
					       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
					       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
					       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
					       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
					       </div> --%>

				</div>

			</div>
			<div
				style="margin-top: 150px; text-align: center; margin-bottom: 30px;">
				<%@include file="../../../../include/footer.jsp"%>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript"
		src="user/lib/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		function usersupplier() {
			$.post("supplierseleuser", function(data) {
				if (data.result == "fail") {
					layer.alert('请先添加公司信息');
					setTimeout(function() {
						window.location.href = "supplierIn";
					}, 1000);
				} else if (data.result == "seccuss") {
					window.location.href = "userSupplierProduct";
				} else if (data.result == "login") {
					window.location.href = "frontLogin";
				}
			})
		}
		function usersupplierpt() {
			$.post("supplierseleuser", function(data) {
				if (data.result == "fail") {
					layer.alert('请先添加公司信息');
					setTimeout(function() {
						window.location.href = "supplierIn";
					}, 1000);
				} else if (data.result == "seccuss") {
					window.location.href = "putong";
				} else if (data.result == "login") {
					window.location.href = "frontLogin";
				}
			})
		}
		$("#yiji").hover(function() {
			$(this).css("background", "red");
		}, function() {
			$(this).css("background", "#EE4000");
		});
		$("#caigou").hover(function() {
			$(this).css("background", "#00BCEE");
		}, function() {
			$(this).css("background", "#0035EE");
		});
		function closeAdd() {
			window.location.href = "queryByInquiryUserid";
		}
		function updatein(inquiry_id, inquiry_product, inquiry_brand,
				inquiry_lotnumber, inquiry_package, inquiry_number,
				inquiry_price, inquiry_telphone, telphone1, suppliername,
				inquiry_supplier, inquiry_status, priceutil, quality) {
			$("#inquiry_id").val(inquiry_id);
			$("#inquiry_product").val(inquiry_product);
			$("#inquiry_brand").val(inquiry_brand);
			$("#inquiry_package").val(inquiry_package);
			$("#inquiry_number").val(inquiry_number);
			$("#inquiry_lotnumber").val(inquiry_lotnumber);
			$("#inquiry_price").val(inquiry_price);
			$("#xg_inquiry_quality").val(quality);
			if (inquiry_telphone == null || inquiry_telphone == '') {
				$("#inquiry_telphone").val(telphone1);
			} else {
				$("#inquiry_telphone").val(inquiry_telphone);
			}
			if (suppliername == null || suppliername == '') {
				$("#inquiry_supplier").val(inquiry_supplier);
			} else {
				$("#inquiry_supplier").val(suppliername);
			}
			if (priceutil == '人民币') {
				$("#inquiry_priceutil")
						.html(
								"<option value='人民币' selected='selected'>人民币</option><option value='美元'>美元</option>");
			} else if (priceutil == '美元') {
				$("#inquiry_priceutil")
						.html(
								"<option value='人民币'>人民币</option><option value='美元' selected='selected'>美元</option>");
			} else {
				$("#inquiry_priceutil")
						.html(
								"<option value='人民币' selected='selected'>人民币</option><option value='美元'>美元</option>");
			}
			if (inquiry_status == 1) {
				$("#inquiry_status")
						.html(
								"<option value='1' selected='selected'>询价</option><option value='2'>采购</option>");
			} else if (inquiry_status == 2) {
				$("#inquiry_status")
						.html(
								"<option value='1'>询价</option><option value='2' selected='selected'>采购</option>");
			}

			$("#xiufullbg").css({
				display : "block"
			});
			$("#xiudialog").show();
		}
		$("#yiji").on("click", function() {
			$("#upfullbg").css({
				display : "block"
			});
			$("#updialog").show();
		})
		$("#caigou").on("click", function() {
			$("#cgfullbg").css({
				display : "block"
			});
			$("#cgdialog").show();
		})
		$("#addquxiao").on("click", function() {
			$("#inquiry_product").val("");
			$("#inquiry_package").val("");
			$("#inquiry_number").val("");
			document.getElementById('tianjia').style.display = 'none';
		})
	</script>
</body>
</html>