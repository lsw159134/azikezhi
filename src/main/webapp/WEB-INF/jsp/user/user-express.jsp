<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" type="text/css"
	href="user/static/h-ui.admin/css/style.css" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<!--[if IE 6]>
		<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon" />
<style type="text/css">
html{
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

.button2 {
	/* General Properties */
	height: 25px;
	width: 60px;
	border: 1px solid #F5FAFE;
	background: #717a77;
	/* CSS3 Styling */
	background: -moz-linear-gradient(bottom, #0a0809, #0a0f0b 50%, #6d7673 50%, #afbdc0);
	background: -webkit-gradient(linear, left bottom, left top, from(#87CEEB),
		to(#87CEEB), color-stop(0.5, #87CEEB), color-stop(0.5, #87CEEB));
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 20px;
	-moz-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.5);
	box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.5);
	/* Text Styling */
	color: #ff7d00;
	text-shadow: 0px -1px 0px #000;
	font-size: 13px;
}

/* Pseudo-classes for interactivity */
.button2:hover {
	font-size: 16px;
	-moz-box-shadow: 0px 0px 7px rgba(255, 255, 255, 1);
	-webkit-box-shadow: 0px 0px 7px rgba(255, 255, 255, 1);
	box-shadow: 0px 0px 7px rgba(255, 255, 255, 1);
}

.button2:focus {
	-moz-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.75);
	-webkit-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.75);
	box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.75);
}

.button2:active {
	border-width: 2px 1px 1px 2px;
	font-size: 16px;
}
</style>
</head>

<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl">
				<div
					style="display: inline-block; background: #222222; width: 200px; margin-left: -15px; height: 50px; position: absolute; text-align: center; line-height: 50px; font-size: 16px; font-weight: bold; margin-top: -1px;">
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
									<img src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star==2 }">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
								</c:if> <c:if test="${sessionScope.star>50}">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
									<img src="<%=basePath%>logo/user_xingji.png">
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
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a  data-title="个人中心" style="font-weight: bold;" >
						用户信息
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd style="display: block;">
					<ul>
					<li>
							<a href="usersystem" style="margin-left: -25px" data-title="个人中心">
								&emsp;&emsp;个人中心
							</a>
						</li>
						<li>
							<a href="myCart" style="margin-left: -25px" data-title="我的购物车">
								&emsp;&emsp;我的购物车
							</a>
						</li>
						<li style="background: #D0DFEF;">
							<a href="express" data-title="主动元件订单" style="margin-left: -25px">
								<img style="position: absolute;margin-top: 8px;" src="<%=basePath%>logo/yuan.png?3214">&emsp;&emsp;主动元器件订单 
								 <c:if test="${not empty zdCountNoPay}">
								<font size="1px" color="red">未付款(${zdCountNoPay})</font>
								</c:if>
							</a>
						</li>
						<li>
							<a href="beidongExpress" style="margin-left: -25px" data-title="被动元器件订单">&emsp;&emsp;被动元器件订单 
							    <c:if test="${not empty bdCountNoPay}">
								<font size="1px" color="red">未付款(${bdCountNoPay})</font>
								</c:if>
							</a>
						</li>
						<li>
							<a href="MyAddress" style="margin-left: -25px" data-title="地址">&emsp;&emsp;我的地址</a>
						</li>
						<!-- <li>
							<a href="cashback" data-title="订单返现">&emsp;&emsp;订单返现</a>
						</li> -->
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="supplierIn" data-title="公司信息" >&emsp;&emsp;公司资料</a></li>
						<li>
							<a href="javascript:;" onclick="usersupplier()" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="javascript:;" onclick="usersupplierpt();" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu_2">
				<dt>
					<img src="<%=basePath%>logo/jilu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">资源管理</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="queryByInquiryUserid" data-title="询价记录" >
								&emsp;&emsp;询价记录（采购记录）
							</a>
						</li>
						<li><a href="quoteAllByUser" data-title="报价记录">&emsp;&emsp;报价记录</a></li>
						<li>
							<a href="stockAll" data-title="库存管理">
								&emsp;&emsp;库存管理（销售订单）
							</a>
						</li>
					</ul>
				</dd>
			</dl>
			<c:if test="${sessionScope.supplieruid==1 }">
				<dl id="menu_7">
					<dt>
						<img src="<%=basePath%>logo/zaixiang.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">在线购</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a href="seleonlineProduct" data-title="在线购库存" >
									&emsp;&emsp;在线购库存
								</a>
							</li>
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
							<a href="index">首页</a> 
							<a href="express" class="selected">我的订单</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
					<div style="margin-bottom: 20px; float: right;">
						<table
							style="border: 1px #EEEEEE solid; height: 80px; width: 200px; text-align: center;"
							border="1">
							<tr>
								<td style="font-size: 15px; font-weight: bold; color: red;">
									返现金额</td>
								<td style="font-size: 15px; font-weight: bold; color: red;">
									￥ <c:if test="${fanTotal-price > 0}">
									${fanTotal-price }
								</c:if> <c:if test="${fanTotal-price <= 0}">
									0
								</c:if>

								</td>
							</tr>
							<tr>
								<td colspan="2" style="font-weight: bold; color: #87CEEB">
									返现金额满一百 <a href="cashback"
									style="font-weight: bold; color: red;">点我提现</a>
								</td>
							</tr>
						</table>
					</div>
					<table cellpadding="0" cellspacing="0"
						style="text-align: center; background: #F5F5F5; height: 50px; border: 1px #C2C2C2 solid;">
						<tr>
							<td style="width: 400px;">商品信息</td>
							<td style="width: 60px;">单价</td>
							<td style="width: 60px;">数量</td>
							<td style="width: 200px;">金额</td>
							<td style="width: 128px;">备注</td>
							<td style="width: 160px;">交易状态</td>
							<td style="width: 103px;">交易操作</td>
						</tr>
					</table>
					<c:forEach items="${express}" var="items" varStatus="status">
						<div style="margin-top: 20px;"></div>
						<table cellpadding="0" cellspacing="0"
							style="text-align: center; background: #F5F5F5; border: 1px #AED8FF solid; border-bottom: none;">
							<tr style="background: #EAF8FF; height: 50px;">
								<td style="font-weight: bold; width: 150px;"><fmt:formatDate
										value="${items.edate}" pattern="yyyy/MM/dd HH:mm" /></td>
								<td style="width: 150px;">订单号 : ${items.ordernumber}</td>
								<td style="width: 500px;"></td>
								<td style="padding-right: 30px;">
									<div style="height: 18px; width: 73px; float: right;">
										<a href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
											<img src="<%=basePath%>/logo/indexQQ1.png">和我联系
										</a>
									</div>
								</td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" style="text-align: center; border: 1px #AED8FF solid; border-collapse: collapse;">
							<c:if test="${items.productuid == null }">
								<tr>
									<td style="width: 520px; border: 1px #AED8FF solid;">
										<c:forEach items="${items.order}" var="order" varStatus="status">
											<table cellpadding="0" cellspacing="0" <c:if test="${status.last == false }">style='border-bottom: 1px #AED8FF solid;'</c:if>>
												<tr>
													<td style="width: 100px; height: 100px;" valign="top">
														<div style="width: 100px; height: 100px; margin-top: 10px;">
															<c:if test="${not empty order.p.pimgList}">
																<c:forEach items="${order.p.pimgList}" var="img">
																	<c:if test="${img.p_imgstauts == '1'}">
																		<a class="apreview"
																			href="javascript:void(0)"  onclick="searchProduct('${ order.o_product }')">
																			<img style="width: 60px; height: 60px;"
																			src="<%=basePath%>upload/${img.p_imgname}">
																		</a>
																	</c:if>
																</c:forEach>
															</c:if>
															<c:if test="${ empty order.p.pimgList}">
																<a
																	href="javascript:void(0)"  onclick="searchProduct('${ order.o_product }')">
																	<img style="width: 40px; height: 40px;"
																	src="<%=basePath%>logo/nulltupian.png">
																</a>
															</c:if>
															<p title="${order.o_product}" style="width: 80px; height: 40px; line-height: 40px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 10px;">
																<a href="javascript:void(0)"  onclick="searchProduct('${order.o_product}')">
																	${order.o_product} </a>
															</p>
														</div>
													</td>
													<td style="width: 300px; height: 100px;" valign="top">
														<div style="width: 300px; height: 100px; margin-top: 10px;">
															<p style="width: 100px; display: inline-block;">
																<b>封装 : </b>
															</p>
															<p style="width: 190px; display: inline-block; text-align: left;">
																${order.o_package}
															</p>
															<p style="width: 100px; display: inline-block;">
																<b>型号 : </b>
															</p>
															<p style="width: 190px; display: inline-block; text-align: left;">
																<a title="${order.o_product}"
																	href="javascript:void(0)"  onclick="searchProduct('${order.o_product}')"
																	style="display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; position: absolute; width: 190px; margin-top: -13px;">
																	${order.o_product} </a>
															</p>
															<p style="width: 100px;float: left">
																<b style="color: red">取货地址 : </b>
															</p>
															<p title="${order.supplier.supplierposition}" style="color: red;width: 190px;overflow: hidden; display: inline-block; text-align: left;">
																${order.supplier.supplierposition}
															</p>
														</div>
													</td>
													<td style="width: 60px; height: 100px;border-left: 1px #AED8FF solid;" valign="top">
														<div
															style="width: 60px; height: 100px; margin-top: 10px;">
															${order.o_one}</div>
	
													</td>
													<td style="width: 60px; height: 100px;border-left: 1px #AED8FF solid;" valign="top">
														<div
															style="width: 60px; height: 100px; margin-top: 10px;">
															${order.o_number}</div>
													</td>
												</tr>
											</table>
										</c:forEach>
									</td>
									<td valign="top"
										style="width: 200px; padding: 10px 0 20px 0; border: 1px #AED8FF solid;">
										<table cellpadding="0" cellspacing="0" style="width: 200px;">
											<tr>
												<td style="width: 80px; text-align: right;"><b>总金额&emsp;:</b>
												</td>
												<td
													style="width: 110px; text-align: left; padding-left: 13px;">
													<b style="color: red;">￥${items.eprice}</b>
												</td>
											</tr>
											<tr>
												<td style="width: 80px; text-align: right;"><b>实付款&emsp;:</b>
												</td>
												<td
													style="width: 110px; text-align: left; padding-left: 13px;">
													<c:if test="${items.preferentialamount==null}">
														<b style="color: blue;">￥${items.eprice}</b>
													</c:if> <c:if test="${items.preferentialamount!=null}">
														<b style="color: blue;">￥${items.preferentialamount}</b>
													</c:if>
												</td>
											</tr>
										</table>
									</td>
									<td style="width: 128px; padding: 10px 0px 20px 0px; border: 1px #AED8FF solid;"valign="top">
										
									</td>
									<td style="font-weight: bold; width: 160px; padding: 10px 0px 20px 0px; border: 1px #AED8FF solid;"valign="top">
										<c:if test="${items.status == 1}">未付款</c:if>
										<c:if test="${items.status == 2}">已付款</c:if> 
										<c:if test="${items.status == 3}">已交货</c:if> 
										<c:if test="${items.status == 4}">已完成</c:if> 
										<c:if test="${items.status == 5}">已取消</c:if> 
										<c:if test="${items.status == 6}">审核中</c:if></br> 
										<c:if test="${items.status == 4}">交易已完成</br></c:if> 
										<c:if test="${items.status == 5}">交易已关闭</br></c:if> 
										<a href="expressA?eid=${items.express}"style="color: red; font-weight: normal;">订单详情</a>
									</td>
									<td style="width: 100px; padding: 20px 0px 20px 3px; border: 1px #AED8FF solid;"valign="top">
										<c:if test="${items.status == 1}">
											<c:if test="${items.preferentialamount==null}">
												<a class="fukuan" href="houfu?eid=${items.express}&price=${items.eprice}&ordernumber=${items.ordernumber}"
													style="color: white; position: relative; background: #EE4000; padding: 6px 14px 6px 14px; font-weight: bold; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
														立即付款
												</a>
											</c:if>
											<c:if test="${items.preferentialamount!=null}">
												<a class="fukuan" href="houfu?eid=${items.express}&price=${items.preferentialamount}&ordernumber=${items.ordernumber}"
													style="color: white; position: relative; background: #EE4000; padding: 6px 14px 6px 14px; font-weight: bold; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">
													立即付款
												</a>
											</c:if>
											</br>
											</br>
											<a data-quxiao="${items.express }" class="quxiao">取消订单</a>
										</c:if> 
										<c:if test="${items.status == 3}">
											<a data-quxiao="${items.express }"  title="一天后自动确认收货" class="shouhuo" style="color: white;position: relative;background: blue;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">确认收货</a>
										</c:if>
										<c:if test="${items.status == 5 || items.status == 4}">
											<%-- <a class="fukuan" href="goAgain?eid=${items.express }" style="color: white;position: relative;background: #EE4000;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">
													再次购买
												</a> 
											--%>
										</c:if>
									</td>
								</tr>
							</c:if>
							<c:if test="${items.productuid != null }">
								<tr>
									<td style="width: 520px; border: 1px #AED8FF solid; padding-bottom: 0px">
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td style="width: 100px; height: 100px;" valign="top">
													<div style="width: 100px; height: 100px; margin-top: 10px;">
														<c:if test="${not empty items.p.pimgList}">
															<c:forEach items="${items.p.pimgList}" var="img">
																<c:if test="${img.p_imgstauts == '1'}">
																	<a class="apreview"
																		href="javascript:void(0)"  onclick="searchProduct('${ order.o_product }')">
																		<img style="width: 60px; height: 60px;"
																		src="<%=basePath%>upload/${img.p_imgname}">
																	</a>
																</c:if>
															</c:forEach>
														</c:if>
														<c:if test="${ empty items.p.pimgList}">
															<a href="javascript:void(0)"  onclick="searchProduct('${ order.o_product }')">
																<img style="width: 40px; height: 40px;" src="<%=basePath%>logo/nulltupian.png">
															</a>
														</c:if>
														<p title="${items.product}" style="width: 80px; height: 40px; line-height: 40px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 10px;">
															<a
																href="javascript:void(0)"  onclick="searchProduct('${items.product}')">
																${items.product} </a>
														</p>
													</div>
												</td>
												<td style="width: 300px; height: 100px;" valign="top">
													<div style="width: 300px; height: 100px; margin-top: 10px;">
														<%-- <p style="width: 100px;display: inline-block;">
		    													<b>公司 : </b>
		    												</p>
									    					<p style="width: 190px;display: inline-block;text-align: left;">
									    						${items.p.supplier}
									    					</p> --%>
														<p style="width: 100px; display: inline-block;">
															<b>封装 : </b>
														</p>
														<p
															style="width: 190px; display: inline-block; text-align: left;">
															${items.express_package}</p>
														<p style="width: 100px; display: inline-block;">
															<b>型号 : </b>
														</p>
														<p style="width: 190px; display: inline-block; text-align: left;">
															<a title="${items.product}"
																href="javascript:void(0)"  onclick="searchProduct('${items.product}')"
																style="display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; position: absolute; width: 190px; margin-top: -13px;">
																${items.product} </a>
														</p>
														<p style="width: 100px;float: left">
															<b style="color: red">取货地址 : </b>
														</p>
														<p title="${order.supplier.supplierposition}" style="color: red;width: 190px;overflow: hidden; display: inline-block; text-align: left;">
															${items.supplierlist.supplierposition}
														</p>
													</div>
												</td>
												<td style="width: 60px; height: 100px;border-left: 1px #AED8FF solid;" valign="top">
													<div style="width: 60px; height: 100px; margin-top: 10px;">
														${items.one}
													</div>
												</td>
												<td style="width: 60px; height: 100px;border-left: 1px #AED8FF solid;" valign="top">
													<div style="width: 60px; height: 100px; margin-top: 10px;">
														${items.expressnumber}</div>
												</td>
											</tr>
										</table>
									</td>
									<td valign="top" style="width: 200px; padding: 10px 0 20px 0; border: 1px #AED8FF solid;">
										<table cellpadding="0" cellspacing="0"
											style="width: 200px;">
											<tr>
												<td style="width: 80px; text-align: right;"><b>总金额&emsp;:</b>
												</td>
												<td
													style="width: 110px; text-align: left; padding-left: 13px;">
													<b style="color: red;">￥${items.eprice}</b>
												</td>
											</tr>
											<tr>
												<td style="width: 80px; text-align: right;"><b>实付款&emsp;:</b>
												</td>
												<td
													style="width: 110px; text-align: left; padding-left: 13px;">
													<c:if test="${items.preferentialamount==null}">
														<b style="color: blue;">￥${items.eprice}</b>
													</c:if> <c:if test="${items.preferentialamount!=null}">
														<b style="color: blue;">￥${items.preferentialamount}</b>
													</c:if>
												</td>
											</tr>
										</table>
									</td>
									<td
										style="width: 128px; padding: 10px 0px 20px 0px; border: 1px #AED8FF solid;"
										valign="top"><c:if test="${items.beizhu == null}">无</c:if>
										<c:if test="${items.beizhu != null}">${items.beizhu}</c:if>
									</td>
									<td style="font-weight: bold; width: 160px; padding: 10px 0px 20px 0px; border: 1px #AED8FF solid;"
										valign="top"><c:if test="${items.status == 1}">未付款</c:if>
										<c:if test="${items.status == 2}">已付款</c:if> 
										<c:if test="${items.status == 3}">已交货</c:if> 
										<c:if test="${items.status == 4}">已完成</c:if> 
										<c:if test="${items.status == 5}">已取消</c:if> 
										<c:if test="${items.status == 6}">审核中</c:if></br> 
										<c:if test="${items.status == 4}">交易已完成</br></c:if> 
										<c:if test="${items.status == 5}">交易已关闭</br></c:if> 
										<a href="expressA?eid=${items.express}" style="color: red; font-weight: normal;">订单详情</a>
									</td>
									<td style="width: 100px; padding: 20px 0px 20px 3px; border: 1px #AED8FF solid;" valign="top">
										<c:if test="${items.status == 1}">
											<c:if test="${items.preferentialamount==null}">
												<a class="fukuan"
													href="houfu?eid=${items.express}&price=${items.eprice}&ordernumber=${items.ordernumber}"
													style="color: white; position: relative; background: #EE4000; padding: 6px 14px 6px 14px; font-weight: bold; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">立即付款</a>
											</c:if>
											<c:if test="${items.preferentialamount!=null}">
												<a class="fukuan"
													href="houfu?eid=${items.express}&price=${items.preferentialamount}&ordernumber=${items.ordernumber}"
													style="color: white; position: relative; background: #EE4000; padding: 6px 14px 6px 14px; font-weight: bold; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;">立即付款</a>
											</c:if>
											</br>
											</br>
											<a data-quxiao="${items.express }" class="quxiao" style="margin-top: 100px;">取消订单</a>
										</c:if>
										<c:if test="${items.status == 3 || items.status == 2 }">
											<a data-quxiao="${items.express }"  title="一天后自动确认收货" class="shouhuo"  title="一天后自动确认收货" style="color: white;position: relative;background: blue;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">确认收货</a>
										</c:if>
										<c:if test="${items.status == 5 || items.status == 4}">
											<%-- <a class="fukuan" href="javascript:;" onclick="gopay('${items.productuid}',${items.expressnumber});"
                   	   						style="color: white;position: relative;background: #EE4000;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">再次购买</a> --%>
										</c:if>
									</td>
								</tr>
							</c:if>
						</table>
				</c:forEach>
				<div style="width: 100%; margin-top: 20px;">
					当前第&ensp;<span style="font-weight: bold; color: black">${page }</span>&ensp;页&ensp;/&ensp;
					共&ensp;<span style="font-weight: bold; color: black">${count }</span>&ensp;页
					共&ensp;<span style="font-weight: bold; color: black">${total }</span>&ensp;条记录
					<button class="button2" onclick="first()">首页</button>
					<c:if test="${count > 1}">
						<button class="button2" onclick="previous()"
							<c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>
						<button class="button2" onclick="er()"
							<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>
						<button class="button2" onclick="san()"
							<c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>
						<button class="button2" onclick="si()"
							<c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>
					</c:if>
					<button class="button2" onclick="next()"
						<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>
					<button class="button2" onclick="end()">尾页</button>
				</div>
				<form action="pay" method="post" id="payForm">
					<input type="hidden" name="productuid" id="productuid">
					<input type="hidden" name="number" id="number">
				</form>
				<div
					style="margin-top: 50px; text-align: center; margin-bottom: 30px;">
					<%@include file="../../../../include/footer.jsp"%>
				</div>
			</div>
		</div>
	</div>
</section> 
<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="js/userinfo.js"></script>
</body>
<script type="text/javascript">
function usersupplier(){
	$.post("supplierseleuser",
		function(data){
			if(data.result=="fail"){
				layer.alert('请先添加公司信息');   
				setTimeout(function(){window.location.href="supplierIn";},1000);
			}else if(data.result=="seccuss"){
				window.location.href="userSupplierProduct";
			}else if(data.result=="login"){
				window.location.href="frontLogin";
			}
		}
	)
}




function searchProduct(product){
	window.location.href='search?keyword='+encodeURIComponent(product);
}


function usersupplierpt(){
	$.post("supplierseleuser",
        function(data){
			if(data.result=="fail"){
				layer.alert('请先添加公司信息');   
				setTimeout(function(){window.location.href="supplierIn";},1000);
			}else if(data.result=="seccuss"){
				window.location.href="putong";
			}else if(data.result=="login"){
				window.location.href="frontLogin";
			}
		}
   	)
}
	function gopay(pid, obj) {
		$.post("queryCartOrdercount?pid=" + pid, function(data) {
			if (parseInt(data.count) <= 1) {
				layer.alert("库存不足，请联系客服!");
			} else {
				if (parseInt(obj) > parseInt(data.count)) {
					$("#number").val(parseInt(data.count));
					$("#productuid").val(pid);
					document.getElementById('payForm').submit();
				} else {
					$("#number").val(obj);
					$("#productuid").val(pid);
					document.getElementById('payForm').submit();
				}
			}
		})
	}

	$(function() {
		$(".fukuan").hover(function() {
			$(this).css("background", "red");
		}, function() {
			$(this).css("background", "#EE4000");
		});

		$('.quxiao').click(function() {
			var eid = $(this).data("quxiao");
			layer.confirm('您确定要取消订单吗', {
				btn : [ '确定', '取消' ]
			//按钮
			}, function() {
				layer.msg('订单已取消', {
					icon : 1
				});
				window.location.href = "expressQuxiao?eid=" + eid;
			}, function() {
			});
		})
		$('.shouhuo').click(function() {
			var eid = $(this).data("quxiao");
			window.location.href = "onlineshouhuo?eid=" + eid;
		})
	});
</script>
<script type="text/javascript">
	imagePreview = function() {
		xOffset = -500;
		yOffset = -500;
		/* imgSr =getRealPath()+'/upload/' + $('.p_imgname').val(); */
		$(".apreview")
				.hover(
						function(e) {
							var $target = $(e.target);
							var src = $target.attr("src");
							/* t = $('.img_product').val();//显示在图片下的标题  
							title = "";  
							var c = (t != "") ? "<br/>" + t : "";  */
							/* $("body").append("<p id='preview'><img src='"+ src+"'" +"style='height:300px;width:300px;'"+ "/>" + c+ "</p>"); */
							$("body")
									.append(
											"<p id='preview'><img src='"+ src+"'" +"style='height:300px;width:300px;position:absolute;z-index:99999;left:350px;top:200px;'"+ "/>"
													+ "</p>");
							$("#preview").css({
								"top" : (e.pageY - yOffset) + "px",
								"left" : (e.pageX + xOffset) + "px"
							}).fadeIn("fast");

						}, function() {
							/*  title = t;   */
							$("#preview").remove();
						});
		$(".apreview").mousemove(function(e) {
			$("#preview").css({
				"top" : (e.pageY - yOffset) + "px",
				"left" : (e.pageX + xOffset) + "px"
			})
		});
	};
	$(document).ready(function() {
		imagePreview();
	});

	function Cart(express, price) {
		window.open('houfu?eid=' + express + '&price=' + price, '');
		window.close();
	}
	function first() {
		window.location.href = 'express?page=${1}&&rows=${pageSize }';
	}
	function end() {
		window.location.href = 'express?page=${count == 0 ? 1:count }&&rows=${pageSize }';
	}
	function er() {
		var page = ${page + 1};
		var count = ${count};
		if (page > count) {
			return false;
		} else {
			window.location.href = 'express?page=${page+1}&&rows=${pageSize }';
		}
	}
	function san() {
		var page = ${page + 2};
		var count = ${count};
		if (page > count) {
			return false;
		} else {
			window.location.href = 'express?page=${page+2}&&rows=${pageSize }';
		}
	}
	function si() {
		var page = ${page + 3};
		var count = ${count};
		if (page > count) {
			return false;
		} else {
			window.location.href = 'express?page=${page+3}&&rows=${pageSize }';
		}
	}
	function previous() {
		var page = ${page == 1};
		if (page) {
			return false;
		} else {
			window.location.href = 'express?page=${page-1}&&rows=${pageSize }';
		}
	}
	function next() {
		var page = ${count <= page};
		if (page) {
			return false;
		} else {
			window.location.href = 'express?page=${page+1}&&rows=${pageSize }';
		}
	}
</script>
<style type="text/css">
#update {
	width: 100px;
	height: 25px;
}

#update:hover {
	color: darkred;
}
</style>
</html>