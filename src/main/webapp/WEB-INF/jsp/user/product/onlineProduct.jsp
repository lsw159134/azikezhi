<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
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
<!--<link rel="Bookmark" href="/favicon.ico">
		<link rel="Icon" href="/favicon.ico" />
		<link rel="Shortcut Icon" href="/favicon.ico" />-->
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui.admin/css/style.css" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="vendor/jquery-file-upload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="assets/css/plugins.css">
<link rel="stylesheet" href="assets/css/themes/theme-1.css"
	id="skin_color" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if IE 6]>
		<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon" />
<style type="text/css">
html {
	font: 微软雅黑;
}

.fix-div {
	margin: 0 auto;
	position: fixed;
	width: 80%;
	top: 0;
	left: 0;
	right: 0;
	z-index: 99999;
}

.fukuan:hover {
	text-decoration: none;
}

.quxiao:hover {
	text-decoration: none;
	color: red;
}

.sliderUnlockBtn {
	width: 62px;
	height: 27px;
	background: #593f4f;
	border: none;
	color: white;
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

input:hover {
	box-shadow: #ccc 1px 1px 8px;
}

body, button, input, select, textarea {
	font-size: 12px;
	font-family: "Microsoft Yahei", "宋体";
	color: #000000;
	margin-right: 4px;
	border: 1px solid #DED8B9;
	height: 27px;
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

#dialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #BCBFFD;
	height: 400px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 500px;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

#dialog input {
	height: 27px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	width: 300px;
	height: 35px;
}

#dialog select {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	text-align: center;
}

#dialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}

#updialog {
	box-shadow: #666 1px 1px 15px;
	background-color: #fff;
	border: 1px solid #BCBFFD;
	height: 400px;
	left: 50%;
	margin: -200px 0 0 -200px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 53%;
	width: 500px;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

#updialog input {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	text-align: center;
	width: 300px;
}

#updialog select {
	height: 30px;
	border: 2px #87CEEB solid;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	text-align: center;
}

#updialog p {
	display: inline-block;
	font-weight: bold;
	color: black;
}

.g-grid tr th {
	text-align: center;
}

.g-grid tr td {
	text-align: center;
}

input:hover {
	border-color: steelblue;
}
</style>
</head>

<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" style="height: 30px;">
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
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
								</c:if> <c:if test="${sessionScope.star==2 }">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
								</c:if> <c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
								</c:if> <c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
								</c:if> <c:if test="${sessionScope.star>50}">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
									<img src="<%=basePath%>logo/user_xingji.png"
										style="margin-top: 10px;">
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
						<li><a href="userSupplierProduct" data-title="库存管理">
								&emsp;&emsp;优势库存 </a></li>
						<li><a href="putong" data-title="公司信息">&emsp;&emsp;普通库存</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu_2">
				<dt>
					<img src="<%=basePath%>logo/jilu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
						data-title="库存管理" href="javascript:;" style="font-weight: bold;">资源管理</a><i
						class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="queryByInquiryUserid" data-title="询价记录">
								&emsp;&emsp;询价记录（采购记录） </a></li>
						<li><a href="quoteAllByUser" data-title="报价记录">&emsp;&emsp;报价记录</a></li>
						<li><a href="stockAll" data-title="库存管理">
								&emsp;&emsp;库存管理（销售订单） </a></li>
					</ul>
				</dd>
			</dl>
			<c:if test="${sessionScope.supplieruid==1 }">
				<dl id="menu_7">
					<dt style="background: #CDB38B;">
						<img src="<%=basePath%>logo/zaixiang.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							data-title="库存管理" href="javascript:;" style="font-weight: bold;">在线购</a><i
							class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
					</dt>
					<dt>
						<ul style="margin-bottom: 0px;">
							<li style="background: #D0DFEF;"><a href="seleonlineProduct"
								data-title="在线购库存"> <img
									style="position: absolute; margin-top: 8px;"
									src="<%=basePath%>logo/yuan.png">&emsp;&emsp;在线购库存
							</a></li>
							<li><a href="seleOnlineExpress" data-title="在线购订单">
									&emsp;&emsp;在线购订单 </a></li>
						</ul>
					</dt>
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
						<nav class="zznav" style="margin-top: 9px; margin-left: 13px;">
							<a href="index">首页</a> <a href="seleonlineProduct"
								class="selected">在线购库存</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div id="g-bd" class="g-bd">
					<div id="g-con">
						<div class="g-mh20" id="tabDiv110203" style="display: block;">
							<div class="g-cf g-bd-box g-plr-10 g-o-h"
								style="padding-left: 0px; border: none;">
								<div class="g-f-l g-bdbox" style="color: #3A006F;">
									<button type="button" class="btn  btn-success"
										onclick="ShowNewStock();" style="padding-top: 4px;">
										<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>库存
									</button>
								</div>
								<div class="g-bdbox">
									<span style="margin-left: 23px;"></span> <input type="text"
										style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 250px; padding-left: 20px;"
										name="product" id="product" placeholder="型号名称"
										value="${sproduct }">&emsp;&emsp;
									<button id="sousuo" type="button" onclick="sousuo()"
										class="btn btn-primary"
										style="padding-top: 4px; height: 30px;">搜索</button>
								</div>
							</div>
							<table class="g-grid" style="background: white;">
								<thead>
									<tr
										style="text-align: center; font-weight: bold; font-size: 14px;">
										<th width="40px" style="text-align: center;">序号</th>
										<th width="220px;" style="text-align: center;">型号</th>
										<th style="text-align: center;">品牌</th>
										<th style="text-align: center;">批号</th>
										<th style="text-align: center;">封装</th>
										<th style="text-align: center;">库存</th>
										<th style="text-align: center;">价格</th>
										<th align="center">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${product }" var="product" varStatus="status">
										<tr class="" onmouseout="this.classname='';"
											onmouseover="this.classname='s-msover';"
											style='<c:if test="${status.count%2==0 }">background-color: #FFFFEB;</c:if>height: 50px;'>
											<td style="text-align: center;">${status.count }</td>
											<td>${product.product }</td>
											<td>${product.manufacturer }</td>
											<td>${product.lotnumber }</td>
											<td>${product.encapsulation }</td>
											<td>${product.isgoodsinstock }</td>
											<td>￥${product.price }元</td>
											<td><a href="javascript:"
												onclick="EditStock('${product.productuuid }','${product.product }','${product.manufacturer }','${product.lotnumber }','${product.isgoodsinstock }','${product.price }','${product.encapsulation }');">
													修改 </a> <a href="javascript:;"
												onclick="deleonline('${product.productuuid }');"
												class="exchange"
												style="padding-right: 0px; width: 20px; color: red;"
												onClick="return confirm('确定删除?');"> 删除 </a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<div class="g-cf g-pagerwp g-bd-box g-plr-10 g-o-h"
								style="height: 33px;">
								<div class="g-pager g-f-r" style="visibility: visible;">
									<span>总记录数：${total }</span> <span>页数：${page}/${count }</span>
									<c:if test="${page==1}">
										<a class="no">首页</a>
										<a class="no">上一页</a>
									</c:if>
									<c:if test="${page!=1}">
										<a href="seleonlineProduct?product=${sproduct }">首页</a>
										<a
											href="seleonlineProduct?page=${page-1 }&product=${sproduct }">上一页</a>
									</c:if>
									<c:if test="${page==count || count==0}">
										<a class="no">下一页</a>
										<a class="no">尾页</a>
									</c:if>
									<c:if test="${page!=count && count!=0}">
										<a
											href="seleonlineProduct?page=${page+1 }&product=${sproduct }">下一页</a>
										<a
											href="seleonlineProduct?page=${count }&product=${sproduct }">尾页</a>
									</c:if>
								</div>
							</div>
						</div>
						<div id="fullbg"></div>
						<div id="dialog">
							<div
								style="height: 40px; text-align: center; line-height: 40px; margin-top: 5px; border-bottom: 1px solid #E4E4E4; padding-bottom: 5px;">
								<span
									style="font-weight: bold; font-size: 19px; line-height: 40px; padding-left: 30px;">自可知-在线购库存添加</span>
							</div>
							<form id="addform" method="post"
								style="padding-left: 50px; padding-top: 10px;">
								<p>
									<span style="font-size: 20px; color: red">&lowast;</span>型&#8195;&#8195;号&#8195;&#8195;
								</p>
								<input onblur="id1()" id="addproduct" type="text" name="product"
									placeholder="型号" required="required"
									style="text-transform: uppercase;">
								<p id="p1"
									style="display: block; margin-left: 80px; color: red;"></p>

								<p>
									<span style="font-size: 20px; color: red">&lowast;</span>品&#8195;&#8195;牌&#8195;&#8195;
								</p>
								<input onblur="id2()" id="addmanufacturer" type="text"
									name="manufacturer" placeholder="品牌" required="required"
									style="text-transform: uppercase;">
								<p id="p2"
									style="display: block; margin-left: 80px; color: red;"></p>

								<p>
									<span style="font-size: 20px; color: red">&lowast;</span>批&#8195;&#8195;号&#8195;&#8195;
								</p>
								<input onblur="id5()" type="text" id="addlotnumber"
									name="lotnumber" placeholder="批号" required="required">
								<p id="p3"
									style="display: block; margin-left: 80px; color: red;"></p>

								<p>
									<span style="font-size: 20px; color: red">&lowast;</span>封&#8195;&#8195;装&#8195;&#8195;
								</p>
								<input type="text" id="addencapsulation" name="encapsulation"
									placeholder="封装" required="required"
									style="text-transform: uppercase;">
								<p style="display: block; margin-left: 80px; color: red;"></p>

								<p>
									<span style="font-size: 20px; color: red">&lowast;</span>数&#8195;&#8195;量&#8195;&#8195;
								</p>
								<input type="number" id="addisgoodsinstock"
									name="isgoodsinstock" placeholder="只能为数字" required="required">
								<p style="display: block; margin-left: 80px; color: red;"></p>
								<p>
									<span style="font-size: 20px; color: red">&lowast;</span>价&#8195;&#8195;格&#8195;&#8195;
								</p>
								<input type="number" step="0.01" id="addprice" name="price"
									placeholder="价格" required="required">
								<p id="p4"
									style="display: block; margin-left: 80px; color: red;"></p>
								<div style="margin-top: 5px;">
									<button type="button" onclick="addonline()"
										style="border: none; padding: 2px 20px; cursor: pointer; float: right; background: #05AB58; border-radius: 3px; font-size: 14px; margin-right: 140px; color: white;">
										提&nbsp;&nbsp;交</button>
									<button type="button" onclick="closeAdd()"
										style="border: none; padding: 5px 20px; cursor: pointer; float: right; color: white; background: #05AB58; border-radius: 3px; font-size: 14px; margin-right: 60px;">
										取&nbsp;&nbsp;消</button>
								</div>
							</form>
						</div>

						<div id="upfullbg"></div>
						<div id="updialog">
							<div
								style="height: 40px; text-align: center; line-height: 40px; margin-top: 15px;">
								<span
									style="font-weight: bold; font-size: 19px; line-height: 40px; padding-left: 30px;">自可知-在线购库存修改</span>
							</div>
							<form action="upproductputong" method="post"
								style="padding-left: 50px; padding-top: 15px;">
								<p>
									<input type="hidden" name="productuuid" id="productuuid">
									型&#8195;&#8195;号&#8195;&#8195;
								</p>
								<input onblur="id1()" type="text" id="upa_name" name="product"
									placeholder="型号" required="required"
									style="text-transform: uppercase">
								<p id="p1"
									style="display: block; margin-left: 80px; height: 5px; color: red;"></p>

								<p>品&#8195;&#8195;牌&#8195;&#8195;</p>
								<input onblur="id2()" type="text" id="upa_phone"
									name="manufacturer" placeholder="品牌" required="required"
									style="text-transform: uppercase;">
								<p id="p2"
									style="display: block; margin-left: 80px; height: 5px; color: red;"></p>

								<p>批&#8195;&#8195;号&#8195;&#8195;</p>
								<input onblur="id5()" type="text" id="upa_gudingtel"
									name="lotnumber" placeholder="批号" required="required">
								<p id="p3"
									style="display: block; margin-left: 80px; height: 5px; color: red;"></p>

								<p>封&#8195;&#8195;装&#8195;&#8195;</p>
								<input type="text" id="upencapsulation" name="encapsulation"
									placeholder="封装" required="required"
									style="text-transform: uppercase;">
								<p
									style="display: block; margin-left: 80px; height: 5px; color: red;"></p>

								<p>数&#8195;&#8195;量&#8195;&#8195;</p>
								<input type="number" id="upisgoodsinstock" name="isgoodsinstock"
									placeholder="只能为数字" required="required">
								<p
									style="display: block; margin-left: 80px; height: 5px; color: red;"></p>
								<p>价&#8195;&#8195;格&#8195;&#8195;</p>
								<input type="number" step="0.01" name="price" id="upxiangxi"
									placeholder="价格" required="required">
								<p id="p4"
									style="display: block; margin-left: 80px; height: 5px; color: red;"></p>
								<div style="margin-top: 0px;">
									<button type="button" onclick="uponline()"
										style="border: none; padding: 2px 20px; cursor: pointer; float: right; background: #BCBFFD; border-radius: 3px; font-size: 14px; margin-right: 120px;">
										提&nbsp;&nbsp;交</button>
									<button type="button" onclick="closeAdd()"
										style="border: none; padding: 5px 20px; cursor: pointer; float: right; background: #BCBFFD; border-radius: 3px; font-size: 14px; margin-right: 60px;">
										取&nbsp;&nbsp;消</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div
					style="margin-top: 50px; text-align: center; margin-bottom: 30px;">
					<%@include file="../../../../include/footer.jsp"%>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		function ShowNewStock() {
			$(".adddemo").attr("id", "demo");
			$(".addprovince").attr("id", "province");
			$(".addcity").attr("id", "city");
			$("#fullbg").css({
				display : "block"
			});
			$("#dialog").show();
		}

		function addonline() {
			var product = $("#addproduct").val();
			var manufacturer = $("#addmanufacturer").val();
			var lotnumber = $("#addlotnumber").val();
			var isgoodsinstock = $("#addisgoodsinstock").val();
			var price = $("#addprice").val();
			var encapsulation = $("#addencapsulation").val();
			if (product == null || product == ''
					|| product.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确型号");
				return;
			}
			if (manufacturer == null || manufacturer == ''
					|| manufacturer.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确品牌");
				return;
			}
			if (lotnumber == null || lotnumber == ''
					|| lotnumber.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确批号");
				return;
			}
			if (isgoodsinstock == null || isgoodsinstock == ''
					|| isgoodsinstock.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入库存数量");
				return;
			}
			if (encapsulation == null || encapsulation == ''
					|| encapsulation.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确封装");
				return;
			}
			if (price == null || price == ''
					|| price.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入价格");
				return;
			}
			$.ajax({
				type : "post",
				url : "addOnlineProduct",
				async : true,
				dataType : "json",
				data : {
					product : product,
					manufacturer : manufacturer,
					lotnumber : lotnumber,
					isgoodsinstock : isgoodsinstock,
					encapsulation : encapsulation,
					price : price
				},
				success : function(data) {
					if (data.result == "login") {
						window.location.href = "frontLogin"
					} else if (data.result == "success") {
						window.location.href = "seleonlineProduct"
					}else if(data.result=="fail"){
						layer.alert('添加失败，请检查数据是否有误！');  
					}
				},
				error : function() {
					layer.alert('对不起失败了!');
				}
			});
		}

		function uponline() {
			var productuuid = $("#productuuid").val();
			var product = $("#upa_name").val();
			var manufacturer = $("#upa_phone").val();
			var lotnumber = $("#upa_gudingtel").val();
			var isgoodsinstock = $("#upisgoodsinstock").val();
			var price = $("#upxiangxi").val();
			var encapsulation = $("#upencapsulation").val();
			if (product == null || product == ''
					|| product.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确型号");
				return;
			}
			if (manufacturer == null || manufacturer == ''
					|| manufacturer.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确品牌");
				return;
			}
			if (lotnumber == null || lotnumber == ''
					|| lotnumber.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确批号");
				return;
			}
			if (isgoodsinstock == null || isgoodsinstock == ''
					|| isgoodsinstock.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入库存数量");
				return;
			}
			if (encapsulation == null || encapsulation == ''
					|| encapsulation.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入正确封装");
				return;
			}
			if (price == null || price == ''
					|| price.replace(/(^s*)|(s*$)/g, "").length == 0) {
				layer.alert("请输入价格");
				return;
			}
			$.ajax({
				type : "post",
				url : "upOnlineProduct",
				async : true,
				dataType : "json",
				data : {
					product : product,
					manufacturer : manufacturer,
					lotnumber : lotnumber,
					isgoodsinstock : isgoodsinstock,
					encapsulation : encapsulation,
					price : price,
					productuuid : productuuid
				},
				success : function(data) {
					if (data.result == "login") {
						window.location.href = "frontLogin"
					} else if (data.result == "success") {
						window.location.href = "seleonlineProduct"
					}
				},
				error : function() {
					layer.alert('对不起失败了');
				}
			});
		}

		function deleonline(pid) {
			layer.msg('你确定要删除么？', {
				time : 0 //不自动关闭
				,
				btn : [ '确定', '取消' ],
				yes : function(index) {
					layer.close(index);
					$.ajax({
						type : "post",
						url : "deleteOnlineProduct",
						async : true,
						dataType : "json",
						data : {
							pid : pid
						},
						success : function(data) {
							if (data.result == "login") {
								window.location.href = "frontLogin"
							} else if (data.result == "success") {
								window.location.reload();
							}
						},
						error : function() {
							layer.alert('对不起失败了');
						}
					});
				}
			});

		}

		function EditStock(pid, pname, manufacturer, lotnumber, isgoodsinstock,
				description, encapsulation) {
			$("#productuuid").val(pid);
			$("#upa_name").val(pname);
			$("#upa_phone").val(manufacturer);
			$("#upa_gudingtel").val(lotnumber);
			$("#upisgoodsinstock").val(isgoodsinstock);
			$("#upxiangxi").val(description);
			$("#upencapsulation").val(encapsulation);
			$("#upfullbg").css({
				display : "block"
			});
			$("#updialog").show();
		}

		function sousuo() {
			var product = $("#product").val();
			window.location.href = "seleonlineProduct?product=" + product;
		}

		function closeAdd() {
			window.location.href = "seleonlineProduct"
		}
	</script>
</body>

</html>