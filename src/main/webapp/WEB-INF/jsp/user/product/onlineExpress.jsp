<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--<link rel="Bookmark" href="/favicon.ico">
		<link rel="Icon" href="/favicon.ico" />
		<link rel="Shortcut Icon" href="/favicon.ico" />-->
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="vendor/jquery-file-upload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="assets/css/plugins.css">
<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if IE 6]>
		<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<style type="text/css">
	html{
		font: 微软雅黑;
	}
	.fix-div{ 
	    margin: 0 auto;
	    position: fixed;
	    width: 80%; 
	    top: 0;     
	    left: 0; 
	    right: 0;
	    z-index: 99999;
	}
	.fukuan:hover{
		text-decoration: none;
	}
	.quxiao:hover{
		text-decoration: none;
		color: red;
	}
	.sliderUnlockBtn{
		width: 62px;height: 27px;background: #593f4f;border: none;color: white;
	
	}
	.zznav {
		position: relative;
		z-index: 1;
		padding-left: 1em;
	}
	
	.zznav > a {
		position: relative;
		display: inline-block;
		padding: .3em 1em 0;
		color: inherit;
		text-decoration: none;
		margin: 0 -.3em;
	} 
	
	.zznav > a::before,
	
	.zznav a::before {
		content: ''; /* To generate the box */
		position: absolute;
		top: 0; right: 0; bottom: 0; left: 0;
		z-index: -1;
		border-bottom: none;
		border-radius: .5em .5em 0 0;
		background: #A5C9CE linear-gradient(hsla(0,0%,100%,.6), hsla(0,0%,100%,0));
		box-shadow: 0 .15em white inset;
		transform: scale(1.1, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom;
	}
	
	.zznav a.selected { z-index: 2;}
	input:hover {
	    box-shadow: #ccc 1px 1px 8px;
	}
	body, button, input, select, textarea {
	    font-size: 12px;
	    font-family: "Microsoft Yahei","宋体";
	    color: #000000;
	    margin-right: 4px;
	    border: 1px solid #DED8B9;
	    height: 27px;
	}
	.zznav a.selected::before {
		background-color: #CDC8B1;
		margin-bottom: -.08em;
	}
	.zznav.left > a::before {
		transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom left;
	}
	
	.zznav.right { padding-left: 2em; }
	
	.zznav.right > a::before {
		transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom right;
	}
	
	.zznav a:hover {
		color:white;
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
      #dialog input{
      	height: 27px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;width: 300px;height: 35px;
      }
      #dialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
      }
      #dialog p {  
          display: inline-block;font-weight: bold;color: black; 
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
      #updialog input{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;width: 300px;
      }
      #updialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;
      }
      #updialog p {  
          display: inline-block;font-weight: bold;color: black; 
       }
       .g-grid tr th{
		   text-align: center;
	   }
	   .g-grid tr td{
		   text-align: center;
	   }
	   input:hover{
		   border-color:steelblue;
	   }
</style>
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" style="height: 30px;" >
				<div style="display: inline-block;background: #222222;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;">
					<a href="index" style="color: white;">
						自可知用户系统
					</a>
				</div>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<div style="display: inline-block;margin-left: 800px;">
					<nav class="nav navbar-nav">
						<ul class="cl">
							<li style="min-width: 500px;">
							会员星级 : <c:if test="${sessionScope.star == 0 }">
										(星级随着订单交易完成的数量成长)	
									</c:if>
									<c:if test="${sessionScope.star == 1 }">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">	
									</c:if>
									<c:if test="${sessionScope.star==2 }">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>50}">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${sessionScope.userName}<i class="Hui-iconfont">&#xe6d5;</i>
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
		<input type="hidden"  id="supplieruid" value=""/>
		<div class="menu_dropdown bk_2">
			<dl id="menu_1">
				<dt>
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >
						个人中心
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="myCart" data-title="我的购物车">
								&emsp;&emsp;我的购物车
							</a>
						</li>
						<li>
							<a href="express" data-title="我的订单">
								&emsp;&emsp;我的订单
							</a>
						</li>
						<li>
							<a href="MyAddress" data-title="地址">&emsp;&emsp;我的地址</a>
						</li>
						<li>
							<a href="cashback" data-title="订单返现">&emsp;&emsp;订单返现</a>
						</li>
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
							<a href="userSupplierProduct" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="putong" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
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
					<dt style="background: #CDB38B;">
						<img src="<%=basePath%>logo/zaixiang.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">在线购</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
					</dt>
					<dt>
						<ul style="margin-bottom: 0px;">
							<li>
								<a href="seleonlineProduct" data-title="在线购库存" >
									&emsp;&emsp;在线购库存
								</a>
							</li>
							<li style="background: #D0DFEF;"><a href="seleOnlineExpress" data-title="在线购订单"><img style="position: absolute;margin-top: 8px;" src="<%=basePath%>logo/yuan.png">&emsp;&emsp;在线购订单</a></li>
						</ul>
					</dt>
				</dl>
			</c:if>
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 9px;margin-left: 13px;">
							<a href="index">首页</a>
							<a href="seleOnlineExpress" class="selected">在线购订单</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
					<div id="g-bd" class="g-bd" style="margin-left: -8px;">
						<div id="g-con">
							<div class="g-mh20" id="tabDiv110203" style="display: block;">
								<div class="g-cf g-bd-box g-plr-10 g-o-h" style="padding-left:0px;border:none;float: left">
									<div class="g-bdbox">
										<span style="margin-left:0px;"></span>
										<input type="text" style="height: 30px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px #DDDDDD solid;width: 250px;padding-left: 20px;"
											   name="username" id="username" placeholder="会员名称" value="${username }" >&emsp;&emsp;
										<button id="sousuo" type="button" onclick="sousuo()" class="btn btn-primary" style="padding-top: 4px;height:30px;">
											搜索
										</button>
									</div>
								</div>
								<div class="g-cf g-bd-box g-plr-2 g-o-h" style="padding-left:0px;border:none;float: right;margin-top: 10px;width: 210px;">
									<div class="g-bdbox">
										<span style="color: red;margin-left: 10px;font-size: 13px;">本月成交金额：<b>${pricetotal }</b>元</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="guding" style="z-index:20000;margin: 0 auto;">
						<table cellpadding="0" cellspacing="0"
							style="text-align: center; background: #F5F5F5; height: 50px; border: 1px #C2C2C2 solid;">
							<tr>
								<td style="width: 371px;">商品信息</td>
								<td style="width: 75px;border-left: 1px solid #C2C2C2;">单价</td>
								<td style="width: 75px;border-left: 1px solid #C2C2C2;">数量</td>
								<td style="width: 163px;border-left: 1px solid #C2C2C2;">金额</td>
								<td style="width: 170px;border-left: 1px solid #C2C2C2;">备注</td>
								<td style="width: 161px;border-left: 1px solid #C2C2C2;">交易状态</td>
								<td style="width: 102px;border-left: 1px solid #C2C2C2;">交易操作</td>
							</tr>
						</table>
					</div>
					<c:forEach items="${express}" var="items" varStatus="s">
						<div style="margin-top: 20px;"></div>
						<table cellpadding="0" cellspacing="0"
							style="text-align: center; background: #F5F5F5; border: 1px #AED8FF solid; border-bottom: none;">
							<tr style="background: #EAF8FF; height: 50px;">
								<td style="font-weight: bold;width: 420px;text-align: left;padding-left: 20px;">
									会员名称：${items.user.username } &emsp;
									联系方式：${items.user.telephone }
								</td>
								<td style="font-weight: bold; width: 320px;text-align: left;">
									下单时间：<fmt:formatDate value="${items.edate}" pattern="yyyy/MM/dd HH:mm" />
								</td>
								<td style="width: 400px;font-weight: bold;text-align: right;">订单号 : ${items.ordernumber}</td>
								<td style="width: 160px;"></td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" style="text-align: center; border: 1px #AED8FF solid; border-collapse: collapse;">
							<c:if test="${items.productuid == null }">
								<tr>
									<td style="border: 1px #AED8FF solid;">
										<c:forEach items="${items.order}" var="order" varStatus="status">
											<table cellpadding="0" cellspacing="0" style='<c:if test="${status.last == false }">border-bottom: 1px #AED8FF solid;</c:if>'>
												<tr>
													<td style="width: 300px; height: 50px;" valign="top">
														<div style="width: 300px; height: 50px; margin-top: 10px;">
															<p style="width: 100px; display: inline-block;">
																<b>型号 : </b>
															</p>
															<p style="color:red;width: 190px; display: inline-block; text-align: left;">
																${order.o_product}
															</p>
															<p style="width: 100px; display: inline-block;">
																<b>封装 : </b>
															</p>
															<p style="width: 190px; display: inline-block; text-align: left;">
																${order.o_package}
															</p>
														</div>
													</td>
													<td style="width: 60px; height: 65px;border-left: 1px #AED8FF solid;" valign="top">
														<div style="width: 60px; height: 65px; margin-top: 10px;">
															${order.o_one}</div>
	
													</td>
													<td style="width: 60px; height: 65px;border-left: 1px #AED8FF solid;" valign="top">
														<div
															style="width: 60px; height: 65px; margin-top: 10px;">
															${order.o_number}</div>
													</td>
												</tr>
											</table>
										</c:forEach>
									</td>
									<td valign="top" style="width: 160px; padding: 10px 0 20px 0; border-left: 1px #AED8FF solid;border-right: none;border-bottom: none">
										<table cellpadding="0" cellspacing="0" style="width: 160px;border: none">
											<tr style="border: none">
												<td style="width: 70px; text-align: right;border: none"><b>实付款&emsp;:</b>
												</td>
												<td style="width: 80px; text-align: left; padding-left: 13px;border: none">
													<c:forEach items="${items.order}" var="order" varStatus="status">
														<c:if test="${status.count==1 }">
															<c:forEach items="${items.order}" var="order2" begin="1" varStatus="status">
																<span style="display: none;"><fmt:formatNumber type="number" value="${order.o_price=(order.o_price+order2.o_price)}" pattern="0.00" maxFractionDigits="2"/> </span> 
															</c:forEach>
															<span style="color: blue;font-weight: bold;">￥${order.o_price}</span>
														</c:if>
													</c:forEach>
												</td>
											</tr>
										</table>
									</td>
									<td style="width: 168px; padding: 10px 0px 10px 0px; border: 1px #AED8FF solid;"valign="middle">
										<c:if test="${items.beizhu == null}">无</c:if>
										<c:if test="${items.beizhu != null}">${items.beizhu}</c:if>
									</td>
									<td style="font-weight: bold; width: 160px; padding: 10px 0px 10px 0px; border: 1px #AED8FF solid;"valign="top">
										<c:if test="${items.status == 1}">未付款</c:if>
										<c:if test="${items.status == 2}">已付款</c:if> 
										<c:if test="${items.status == 3}"><span style="color: green;font-weight: bold;">已交货</span></c:if> 
										<c:if test="${items.status == 4}"><span style="color: blue;font-weight: bold;">已完成</span></c:if> 
										<c:if test="${items.status == 5}"><span style="color: red;">已取消</span></c:if> 
										<c:if test="${items.status == 6}">审核中</c:if></br> 
										<c:if test="${items.express_biaoqian != null}">
											标签：<span style="color: red;">定制标签</span></br>
											公司名：<span style="color: red;">${items.express_biaoqian}</span>
										</c:if>
										<c:if test="${items.express_biaoqian == null || items.express_biaoqian eq ''}">
											标签：<span style="color:red;">统一标签</span>
										</c:if>
									</td>
									<td style="width: 100px; padding: 20px 0px 10px 3px; border: 1px #AED8FF solid;"valign="top">
										<c:if test="${items.status == 1}">
											<a data-quxiao="${items.express }" class="quxiao" style="color: white;position: relative;background: black;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">取消订单</a>
										</c:if>
										<c:if test="${items.status == 2}">
											<a data-quxiao="${items.express }" class="jiaohuo" style="color: white;position: relative;background: #EE4000;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">确认交货</a>
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
									<td style="border: 1px #AED8FF solid;">
										<table cellpadding="0" cellspacing="0" style='<c:if test="${status.last == false }">border-bottom: 1px #AED8FF solid;</c:if>'>
											<tr>
												<td style="width: 300px; height: 60px;" valign="top">
													<div style="width: 300px; height: 60px; margin-top: 10px;">
														<p style="width: 100px; display: inline-block;">
															<b>型号 : </b>
														</p>
														<p style="color:red;width: 190px; display: inline-block; text-align: left;">
															${items.product}
														</p>
														<p style="width: 100px; display: inline-block;">
															<b>封装 : </b>
														</p>
														<p style="width: 190px; display: inline-block; text-align: left;">
															${items.express_package}
														</p>
													</div>
												</td>
												<td style="width: 60px; height: 65px;border-left: 1px #AED8FF solid;" valign="top">
													<div
														style="width: 60px; height: 65px; margin-top: 10px;">
														${items.one}</div>

												</td>
												<td style="width: 60px; height: 65px;border-left: 1px #AED8FF solid;" valign="top">
													<div
														style="width: 60px; height: 65px; margin-top: 10px;">
														${items.expressnumber}</div>
												</td>
											</tr>
										</table>
									</td>
									<td valign="top" style="width: 160px; padding: 10px 0 10px 0; border: 1px #AED8FF solid;">
										<table cellpadding="0" cellspacing="0"
											style="width: 160px;">
											<tr> 
												<td style="width: 70px; text-align: right;"><b>实付款&emsp;:</b>
												</td>
												<td
													style="width: 80px; text-align: left; padding-left: 13px;">
													<c:if test="${items.preferentialamount==null}">
														<b style="color: blue;">￥${items.eprice}</b>
													</c:if> <c:if test="${items.preferentialamount!=null}">
														<b style="color: blue;">￥${items.preferentialamount}</b>
													</c:if>
												</td>
											</tr>
										</table>
									</td>
									<td style="width: 168px; padding: 10px 0px 10px 0px; border: 1px #AED8FF solid;"
										valign="top"><c:if test="${items.beizhu == null}">无</c:if>
										<c:if test="${items.beizhu != null}">${items.beizhu}</c:if>
									</td>
									<td style="font-weight: bold; width: 160px; padding: 10px 0px 0px 0px; border: 1px #AED8FF solid;"
										valign="top">
										<c:if test="${items.status == 1}">未付款</c:if>
										<c:if test="${items.status == 2}">已付款</c:if> 
										<c:if test="${items.status == 3}"><span style="color: green;font-weight: bold;">已交货</span></c:if> 
										<c:if test="${items.status == 4}"><span style="color: blue;font-weight: bold;">已完成</span></c:if> 
										<c:if test="${items.status == 5}"><span style="color: red;">已取消</span></c:if>
										<c:if test="${items.status == 6}">审核中</c:if></br> 
										<c:if test="${items.express_biaoqian != null}">
											标签：<span style="color: red;">定制标签</span></br>
											公司名：<span style="color: red;">${items.express_biaoqian}</span>
										</c:if>
										<c:if test="${items.express_biaoqian == null || items.express_biaoqian eq ''}">
											标签：<span style="color:red;">统一标签</span>
										</c:if>
									</td>
									<td style="width: 100px; padding: 20px 0px 10px 3px; border: 1px #AED8FF solid;"
										valign="top">
										<c:if test="${items.status == 1}">
											<a data-quxiao="${items.express }" class="quxiao" style="color: white;position: relative;background: black;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">取消订单</a>
										</c:if>
										<c:if test="${items.status == 2}">
											<a data-quxiao="${items.express }" class="jiaohuo" style="color: white;position: relative;background: #EE4000;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">确认交货</a>
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
					<div style="margin-top: 50px; text-align: center; margin-bottom: 30px;">
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
				window.location.href = "onlineQuxiao?eid=" + eid;
			}, function() {
			});
		})
		$('.jiaohuo').click(function() {
			var eid = $(this).data("quxiao");
			window.location.href = "onlinejiaohuo?eid=" + eid;
		})
	});
</script>
<script type="text/javascript">
	$.fn.smartFloat = function() {
		var position = function(element) {
			var top = element.position().top, pos = element.css("position");
			document.getElementById("iframe_box").addEventListener("scroll", myFunction);
			function myFunction() {
				var scrolls = $(this).scrollTop();
				
				if (scrolls > top) {
					$("#guding").css({"box-shadow":"#999 0px 0px 15px","width":"1105px","height":"45px"});
					if (window.XMLHttpRequest) {
						element.css({
		      				position: "fixed",
		      				top: 0+78,
		     			}); 
		    		} else {
		     			element.css({
		      				top: scrolls
		     			}); 
		    		}
		   		}else {
		   			$("#guding").css({"box-shadow":"#999 0px 0px 0px"});
		    		element.css({
		     			position: pos,
		     			top: top
		    		}); 
		   		}
			}
		};
		return $(this).each(function() {
			position($(this));      
		});
	};
	$("#guding").smartFloat();
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

	function first() {
		window.location.href = 'seleOnlineExpress?page=${1}&&rows=${pageSize }';
	}
	function end() {
		window.location.href = 'seleOnlineExpress?page=${count == 0 ? 1:count }&&rows=${pageSize }';
	}
	function er() {
		var page = ${page + 1};
		var count = ${count};
		if (page > count) {
			return false;
		} else {
			window.location.href = 'seleOnlineExpress?page=${page+1}&&rows=${pageSize }';
		}
	}
	function san() {
		var page = ${page + 2};
		var count = ${count};
		if (page > count) {
			return false;
		} else {
			window.location.href = 'seleOnlineExpress?page=${page+2}&&rows=${pageSize }';
		}
	}
	function si() {
		var page = ${page + 3};
		var count = ${count};
		if (page > count) {
			return false;
		} else {
			window.location.href = 'seleOnlineExpress?page=${page+3}&&rows=${pageSize }';
		}
	}
	function previous() {
		var page = ${page == 1};
		if (page) {
			return false;
		} else {
			window.location.href = 'seleOnlineExpress?page=${page-1}&&rows=${pageSize }';
		}
	}
	function next() {
		var page = ${count <= page};
		if (page) {
			return false;
		} else {
			window.location.href = 'seleOnlineExpress?page=${page+1}&&rows=${pageSize }';
		}
	}
	function sousuo(){
		var username=$("#username").val();
		window.location.href="seleOnlineExpress?username="+username;
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