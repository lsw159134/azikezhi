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
	width: 420px;
	z-index: 5;
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
	height: 400px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 420px;
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
<title>自可知用户系统-普通询价</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon" />
</head>

<body>
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
							class="dropDown_A">${sessionScope.userName}<i
								class="Hui-iconfont">&#xe6d5;</i>
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
						<li><a href="queryByInquiryUserid" data-title="询价记录"
							style="font-weight: normal;"> &emsp;&emsp;询价记录（采购记录） </a></li>
						<li style="background: #D0DFEF;"><a href="quoteAllByUser"
							data-title="报价记录" style="font-weight: normal;"> <img
								style="position: absolute; margin-top: 8px;"
								src="<%=basePath%>logo/yuan.png">&emsp;&emsp;报价记录
						</a></li>
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
								class="selected">报价记录</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="upfullbg"></div>
		<div id="updialog">
			<div
				style="height: 40px; background: #1057A7; text-align: center; line-height: 40px;">
				<span
					style="font-weight: bold; font-size: 17px; color: white; line-height: 40px;">报价记录修改</span>
				<a href="javascript:;" onclick="closeAdd()"> <img
					style="position: absolute; margin-left: 78px; margin-top: 3px;"
					src="<%=basePath%>logo/close.png">
				</a>
			</div>
			<form id="quoteForm" action="updateQuote" method="post"
				style="padding-left: 20px; padding-top: 20px;">
				<p>
					<input type="hidden" id="quote_id" name="quote_id"> <span
						style="color: red; margin-left: -5px;">*</span>供&#8195;应&#8195;商&#8195;
				</p>
				<input onblur="id1()" type="text" id="quote_name" name="quote_name"
					placeholder="供应商" required="required"
					style="text-transform: uppercase; width: 290px; color: #000000;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -5px;">*</span>联&nbsp;系&nbsp;方&nbsp;式&#8195;
				</p>
				<input onblur="id1()" type="text" id="quote_telephone"
					name="quote_telephone" placeholder="联系方式" required="required"
					style="text-transform: uppercase; width: 290px; color: #000000;">
				<p>
					<span style="color: red; margin-left: -5px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input onblur="id2()" type="text" id="quote_product"
					name="quote_product" placeholder="型号" required="required"
					style="width: 290px; margin-top: 5px; color: #000000;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -5px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;
				</p>
				<input onblur="id5()" type="text" id="quote_brand"
					name="quote_brand" placeholder="品牌" required="required"
					style="width: 80px;">

				<p>
					&nbsp;&nbsp;&nbsp;<span style="color: red; margin-left: -5px;">*</span>封&#8195;装&#8195;
				</p>
				<input type="text" id="quote_package" name="quote_package"
					placeholder="封装" required="required" style="width: 138px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -5px;">*</span>批&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input type="text" id="quote_lotnumber" name="quote_lotnumber"
					required="required" style="width: 80px;">
				<p>
					&nbsp;&nbsp;<span style="color: red;">*</span>数&#8195;量&#8195;
				</p>
				<input type="text" id="quote_number" name="quote_number"
					placeholder="数量" required="required" style="width: 137px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -5px;">*</span>价&#8195;&#8195;&#8195;格&#8195;
				</p>
				<input type="number" step="0.01" name="quote_price" id="quote_price"
					placeholder="价格" required="required"> -&nbsp;&nbsp;<select
					id="inquiry_priceutil" name="quote_priceutil"
					style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">

				</select> <select id="quote_status" name="quote_status">
				</select>
				<p id="p4"
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>质&#8195;&#8195;&#8195;量&#8195;</p>
				<input type="text" name="quote_quality" id="quote_quality"
					placeholder="质量"
					style="width: 100px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p id="p4"
					style="display: block; margin-left: 80px; height: 13px; color: red;"></p>
				<br>
				<button id="quote_add" type="submit" class="g-btn g-mr-5 tian"
					style="border: none; height: 30px; width: 70px; padding: 0px; cursor: pointer; padding-top: 1px\0; float: right; margin-right: 205px; margin-top: -15px; background: #1057A7; color: white">
					添加保存</button>
			</form>
		</div>
		<div id="cgfullbg"></div>
		<div id="cgdialog">
			<div
				style="height: 40px; background: #FFA500; text-align: center; line-height: 40px;">
				<span
					style="font-weight: bold; font-size: 17px; color: white; line-height: 40px;">报价记录添加</span>
				<a href="javascript:;" onclick="closeAdd()"> <img
					style="position: absolute; margin-left: 78px; margin-top: 3px;"
					src="<%=basePath%>logo/close.png">
				</a>
			</div>
			<form action="addQuote" method="post"
				style="padding-left: 20px; padding-top: 20px;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>客&#8195;&#8195;&#8195;户&#8195;
				</p>
				<input onblur="id1()" type="text" name="quote_name" placeholder="客户"
					required="required"
					style="text-transform: uppercase; width: 291px; color: #000000;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>电&nbsp;话&nbsp;/&nbsp;QQ&#8195;
				</p>
				<input onblur="id1()" type="text" name="quote_telephone"
					placeholder="联系方式" required="required"
					style="text-transform: uppercase; width: 291px; color: #000000;">
				<p>
					<span style="color: red; margin-left: -8px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input onblur="id2()" type="text" name="quote_product"
					placeholder="型号" required="required"
					style="text-transform: uppercase; width: 291px; margin-top: 5px; color: #000000; margin-left: 1px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;
				</p>
				<input onblur="id5()" type="text" name="quote_brand"
					required="required" placeholder="品牌" style="width: 80px;">
				<p>
					&nbsp;&nbsp;&nbsp;<span style="color: red; margin-left: -8px;">*</span>封&#8195;装&#8195;
				</p>
				<input type="text" name="quote_package" required="required"
					placeholder="封装" style="width: 138px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>批&#8195;&#8195;&#8195;号&#8195;
				</p>
				<input type="text" name="quote_lotnumber" placeholder="批号"
					required="required" style="width: 80px;">
				<p>
					&nbsp;&nbsp;<span style="color: red;">*</span>数&#8195;量&#8195;
				</p>
				<input type="text" name="quote_number" placeholder="数量"
					required="required" style="width: 137px;">
				<p
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>
					<span style="color: red; margin-left: -8px;">*</span>报&#8195;&#8195;&#8195;价&#8195;
				</p>
				<input type="number" step="0.01" name="quote_price" placeholder="价格"
					required="required"> -&nbsp;<select name="quote_priceutil"
					style="width: 70px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; margin-left: 1px;">
					<option selected="selected">人民币</option>
					<option>美元</option>
				</select>
				<p id="p4"
					style="display: block; margin-left: 80px; height: 8px; color: red;"></p>
				<p>质&#8195;&#8195;&#8195;量&#8195;</p>
				<input type="text" name="quote_quality" placeholder="质量"
					style="width: 100px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px;">
				<p id="p4"
					style="display: block; margin-left: 80px; height: 13px; color: red;"></p>
				<br>
				<button type="submit" class="g-btn g-mr-5 tian"
					style="border: none; height: 30px; width: 70px; padding: 0px; cursor: pointer; padding-top: 1px\0; float: right; margin-right: 205px; margin-top: -15px; background: #FFA500; color: white">
					添加保存</button>
			</form>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div style="margin-top: 10px;"></div>
			<div style="float: left; line-height: 65px; margin-left: 20px;">
				<a id="caigou" class="btn btn-primary"
					style="color: white; position: relative; background: #FFA500; padding: 4px 10px 4px 10px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px;">
					添加报价</a>
			</div>
			<!-- <p style="clear:both;"></p> -->
			<div style="margin-left: 20px; margin-top: 16px; float: left">
				<form action="quoteAllByUser" method="post">
					<input type="text" name="product" value="${product }"
						placeholder="请输入型号/客户名称/联系方式"
						style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; width: 260px;">
					<input type="date" name="date1" value="${date1 }"
						style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; width: 120px; margin-left: 20px;">至&nbsp;<input
						type="date" value="${date2 }" name="date2"
						style="height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; width: 120px;">
					<select name="status"
						style="width: 70px; height: 30px; border: 2px #87CEEB solid; -moz-border-radius: 2px; -webkit-border-radius: 2px; border-radius: 2px; text-align: center; margin-left: 20px;">
						<option value="0">全部</option>
						<option value="1"
							<c:if test='${status==1 }'>selected="selected"</c:if>>报价中</option>
						<option value="2"
							<c:if test='${status==2 }'>selected="selected"</c:if>>已成交</option>


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
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">产品型号</th>
									<th width="160"
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">客户</th>
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
										style="border-right: 2px solid #EEEEEE; height: 40px; color: black; font-weight: bold; text-align: center;">操作</th>
								</tr>
								<tr style="height: 20px;"></tr>
							</thead>
							<tbody style="background-color: #F5FAFE">
								<c:forEach items="${quote}" var="quote" varStatus="status">
									<tr style="height: 50px; border-bottom: 2px solid #EEEEEE;">
										<td
											style="height: 40px; width: 140px; border-right: 2px solid #EEEEEE;"><p
												style="padding-left: 10px; width: 140px; overflow: hidden; clear: both; text-overflow: ellipsis; white-space: nowrap; text-align: left;"
												title="${quote.quote_product}">
												<a href="search?keyword=${quote.quote_product}"
													target="_blank">${quote.quote_product}</a>
											</p></td>
										<td
											style="height: 40px; width: 140px; border-right: 2px solid #EEEEEE;"
											title="">
											<p
												style="width: 140px; overflow: hidden; clear: both; text-overflow: ellipsis; white-space: nowrap; text-align: left; padding-left: 5px;"
												title="${quote.quote_name}">${quote.quote_name}</p>
										</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; border-right: 2px solid #EEEEEE;"
											title="">${quote.quote_telephone}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; text-align: left; padding-left: 5px;"
											title="${quote.quote_brand}">${quote.quote_brand}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; text-align: left; padding-left: 5px;"
											title="${quote.quote_lotnumber}">${quote.quote_lotnumber}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; text-align: left; padding-left: 5px;"
											title="${quote.quote_package}">${quote.quote_package}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; text-align: left; padding-left: 5px;"
											title="${quote.quote_number}">${quote.quote_number}${quote.quote_utilnumber}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; width: 80px; text-align: left;"
											title="${quote.quote_price}"><c:if
												test="${quote.quote_priceutil eq '美元' }">&nbsp;$&nbsp;</c:if>
											<c:if test="${quote.quote_priceutil ne '美元' }"> ￥</c:if>${quote.quote_price}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; text-align: left; padding-left: 5px;"
											title="${quote.quote_quality}">${quote.quote_quality}</td>
										<td
											style="height: 40px; border-right: 2px solid #EEEEEE; width: 100px; text-align: left; padding-left: 5px;">
											<fmt:formatDate value="${quote.quote_date}"
												pattern="yyyy-MM-dd HH:mm" />
										</td>
										<td
											style="height: 40px; text-align: left; padding-left: 5px; width: 60px; border-left: 2px solid #EEEEEE;">
											<c:if test="${quote.quote_status==1}">
													报价中
												</c:if> <c:if test="${quote.quote_status==2}">
												<span style="color: red;">已成交</span>
											</c:if>
										</td>
										<td
											style="height: 40px; text-align: center; width: 60px; border-left: 2px solid #EEEEEE;">
											<a href="javascript:;"
											onclick="updatein('${quote.quote_id}',
												'${quote.quote_product}','${quote.quote_brand}',
												'${quote.quote_lotnumber}','${quote.quote_package}',
												'${quote.quote_number}','${quote.quote_price}',
												'${quote.quote_telephone}','${quote.quote_name}','${quote.quote_status }','${quote.quote_utilnumber }','${quote.quote_priceutil }','${quote.quote_quality }')">修改</a>
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
										test="${count==0 }">0</c:if>
									<c:if test="${count!=0 }">${page}</c:if>/${count }
								</span>
								<c:if test="${page<=1 || page==null}">
									<a class="no">首页</a>
									<a class="no">上一页</a>
								</c:if>
								<c:if test="${page>1}">
									<a href="quoteAllByUser?product=${product }">首页</a>
									<a href="quoteAllByUser?page=${page-1 }&product=${product }">上一页</a>
								</c:if>
								<c:if test="${page==count || count==0}">
									<a class="no">下一页</a>
									<a class="no">尾页</a>
								</c:if>
								<c:if test="${page!=count && count!=0}">
									<a href="quoteAllByUser?page=${page+1 }&product=${product }">下一页</a>
									<a href="quoteAllByUser?page=${count }&product=${product }">尾页</a>
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
					layer.alert("请先添加公司信息");
					window.location.href = "supplierIn";
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
					layer.alert("请先添加公司信息", function() {
						var index = window.location.href = "supplierIn";
						parent.layer.close(index);
					});
				} else if (data.result == "seccuss") {
					window.location.href = "putong";
				} else if (data.result == "login") {
					window.location.href = "frontLogin";
				}
			})
		}
		function updatein(inquiry_id, inquiry_product, inquiry_brand,
				inquiry_lotnumber, inquiry_package, inquiry_number,
				inquiry_price, telphone1, inquiry_supplier, inquiry_status,
				quote_utilnumber, quote_priceutil, quote_quality) {
			$("#quote_id").val(inquiry_id);
			$("#quote_product").val(inquiry_product);
			$("#quote_brand").val(inquiry_brand);
			$("#quote_package").val(inquiry_package);
			$("#quote_number").val(inquiry_number);
			$("#quote_lotnumber").val(inquiry_lotnumber);
			$("#quote_price").val(inquiry_price);
			$("#quote_telephone").val(telphone1);
			$("#quote_name").val(inquiry_supplier);
			$("#inquiry_utilnumber").val(quote_utilnumber);
			$("#quote_quality").val(quote_quality);
			if (inquiry_status == 1) {
				$("#quote_status")
						.html(
								"<option value='1' selected='selected'>报价中</option><option value='2'>已成交</option>");
			} else if (inquiry_status == 2) {
				$("#quote_status")
						.html(
								"<option value='1'>报价中</option><option value='2' selected='selected'>已成交</option>");
			}
			if (quote_priceutil == '人民币') {
				$("#inquiry_priceutil")
						.html(
								"<option value='人民币' selected='selected'>人民币</option><option value='美元'>美元</option>");
			} else if (quote_priceutil == '美元') {
				$("#inquiry_priceutil")
						.html(
								"<option value='人民币'>人民币</option><option value='美元' selected='selected'>美元</option>");
			} else {
				$("#inquiry_priceutil")
						.html(
								"<option value='人民币' selected='selected'>人民币</option><option value='美元'>美元</option>");
			}
			$("#upfullbg").css({
				display : "block"
			});
			$("#updialog").show();
		}

		$("#caigou").hover(function() {
			$(this).css("background", "#FFD700");
		}, function() {
			$(this).css("background", "#FFA500");
		});
		function closeAdd() {
			window.location = location;
		}

		$("#caigou").on("click", function() {
			$("#cgfullbg").css({
				display : "block"
			});
			$("#cgdialog").show();
		})
		$("#addquxiao").on("click", function() {
			$("#quote_product").val("");
			$("#quote_package").val("");
			$("#quote_number").val("");
			document.getElementById('tianjia').style.display = 'none';
		})
	</script>
</body>
</html>