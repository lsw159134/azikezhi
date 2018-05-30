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
<%  
	List list = new ArrayList();  
	for (int i = 1; i <= 10; i++) {  
	    list.add(i);  
	} 
	List list1 = new ArrayList();  
	for (int i = 1; i <= 2; i++) {  
	    list1.add(i);  
	}
	request.setAttribute("list1", list1);  
    request.setAttribute("list", list);  
    
    List list3 = new ArrayList();  
	for (int i = 0; i < 20; i++) {  
	    list3.add(i);  
	}  
    request.setAttribute("list3", list3);  
%>
<%
	if(session.getAttribute("uid") == null){
		response.sendRedirect("frontLogin");
	}
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
	button, input, select, textarea {
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
</style>
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" >
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
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${user.username}<i class="Hui-iconfont">&#xe6d5;</i>
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
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="产品上传" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dt style="border: none;">
					<ul>
						<li style="background: #D0DFEF;">
							<a href="supplierIn" data-title="公司信息" style="font-weight: normal;">
								&emsp;&emsp;公司资料
							</a>
						</li>
						<li>
							<a href="userSupplierProduct" data-title="库存管理" style="font-weight: normal;">
								<img style="position: absolute;margin-top: 13px;" src="<%=basePath%>logo/yuan.png">&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="putong" style="font-weight: normal;" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
					</ul>
				</dt>
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
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 9px;margin-left: 13px;">
							<a href="index">首页</a>
							<a href="javascript:;" class="selected">优势库存</a>
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
				<div class="g-cf g-bd-box g-plr-10 g-o-h" style="color: white;background-color: #3A006F">
					<b>注意：每条型号的信息必须填全，数量栏只能填写数字。自发布后第二天起可每天修改一次。</b>
				</div>
				<table class="g-grid" style="background: #DAFFCB">
					<thead>
						<tr>
							<th style="text-align: center;border-left:none;background: #BCBFFD;font-size: 14px;" width="80"><b>库存等级</b></th>
							<th style="text-align: center;background: #BCBFFD;font-size: 16px;" width="20px"></th>
							<th width="" style="text-align: center;border-left:none;background: #BCBFFD;font-size: 14px;"><b>型号</b></th>
							<th width="140" style="background: #BCBFFD;text-align: center;border-left:none;font-size: 14px;"><b>品牌</b></th>
							<th width="80" style="background: #BCBFFD;text-align: center;border-left:none;font-size: 14px;"><b>批号</b></th>
							<th width="100" style="background: #BCBFFD;text-align: center;border-left:none;font-size: 14px;"><b>封装</b></th>
							<th width="80" style="background: #BCBFFD;text-align: center;border-left:none;font-size: 14px;"><b>数量</b></th>
							<th width="220" style="background: #BCBFFD;text-align: center;border-left:none;font-size: 14px;"><b>说明</b></th>
							<th width="100" style="background: #BCBFFD;text-align: center;border-left:none;font-size: 14px;"><b>操作</b></th>
						</tr>
					</thead>
					<tbody id="Table30_areaList_list3">
						<c:forEach items="${product1 }" var="p" varStatus="status">
							<form action="addproductuser1" method="post" enctype="application/x-www-form-urlencoded">
								<tr style="border:1px solid;height:45px;background:#F8D2EC;">
									<c:if test="${status.count==1}">
										<td rowspan="2" style="width:80px;text-align: center;">优势库存</td>
									</c:if>
									<td style="text-align: center;"><input class="result_ckb" value="${p.productuuid }"
									type="checkbox"></td>
									<c:if test="${p.qq ==  '1'}">
										<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" value="${p.product }" required="required" style="width: 180px;"><input type="hidden" class="pid" name="productuuid" value="${p.productuuid }"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="manufacturer" name="manufacturer" value="${p.manufacturer }" required="required" style="width: 120px;"><input type="hidden" class="biaozi" value="1"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" value="${p.lotnumber }" required="required" style="width:60px;"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" value="${p.encapsulation }"required="required"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" value="${p.isgoodsinstock }" required="required" style="width:60px;"></td>
										<!--<td><input type="text" style="width:70px;"></td>-->
										<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" value="${p.description }" maxlength="20" style="width:200px;" required="required"></td>
										<td style="border-left:none;text-align: center;">
											<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
											<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
										</td>
									</c:if>
									<c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set> 
 									<c:if test="${p.qq ==  '2'}">
										<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" value="${p.product }" disabled="disabled" style="width: 180px;"><input type="hidden" class="pid" name="productuuid" value="${p.productuuid }"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="manufacturer" name="manufacturer" value="${p.manufacturer }" disabled="disabled" style="width: 120px;"><input type="hidden" class="biaozi" value="1"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" value="${p.lotnumber }" style="width:60px;" disabled="disabled"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" value="${p.encapsulation }" style="width:80px;" disabled="disabled"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" value="${p.isgoodsinstock }" disabled="disabled" style="width:60px;"></td>
										<!--<td><input type="text" style="width:70px;"></td>-->
										<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" value="${p.description }" maxlength="20" style="width:200px;" disabled="disabled"></td>
										<td style="border-left:none;text-align: center;">
											<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;background: #EBEBE4" value="保存" disabled="disabled">
											<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #EBEBE4;border: none;color: white;" disabled="disabled" value="删除">
										</td>
									</c:if>
								</tr>
							</form>
						</c:forEach>
						<c:forEach items="${requestScope.list1 }" var="p" begin="${fn:length(product1)}" varStatus="status">
							<c:if test="${status.count==1}">
								<c:if test="${fn:length(product1)<1}">
									<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
										<tr style="border:1px solid;height:45px;background:#F8D2EC;">
											<td rowspan="2" style="width:80px;text-align: center;">优势库存</td>
											<td style="text-align: center;">
												<input class="result_ckb"  value="bxsdz" type="checkbox"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" required="required" style="width: 180px;"><input type="hidden" class="biaozi" value="1"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="manufacturer" name="manufacturer" required="required" style="width: 120px;"><input type="hidden" class="pid" name="productuuid"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
											<!--<td><input type="text" style="width:70px;"></td>-->
											<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
											<td style="border-left:none;text-align: center;">
												<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
												<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">											
											</td>
										</tr>
									</form>
								</c:if>
							</c:if>
							<c:if test="${status.count>1}">
								<c:if test="${fn:length(product1)<1}">
									<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
										<tr style="border:1px solid;height:45px;background:#F8D2EC;">
											<td style="text-align: center;"><input class="result_ckb"  value="bxsdz" type="checkbox"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" required="required" style="width: 180px;" ><input type="hidden" class="biaozi" value="1"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="manufacturer" name="manufacturer" required="required" style="width: 120px;"><input type="hidden" class="pid" name="productuuid"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
											<!--<td><input type="text" style="width:70px;"></td>-->
											<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
											<td style="border-left:none;text-align: center;">
												<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
												<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
											</td>
										</tr>
									</form>
								</c:if>
							</c:if>
							<c:if test="${fn:length(product1)>=1}">
								<tr style="border:1px solid;height:45px;background:#F8D2EC;">
									<td style="text-align: center;"><input class="result_ckb"  value="bxsdz" type="checkbox"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" required="required" style="width: 180px;"><input type="hidden" class="biaozi" value="1"><input type="hidden" class="pid" name="productuuid"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="manufacturer" name="manufacturer" required="required" style="width: 120px;"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
									<!--<td><input type="text" style="width:70px;"></td>-->
									<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
									<td style="border-left:none;text-align: center;">
										<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
										<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
									</td>
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach items="${product2 }" var="p" varStatus="status">
							<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
								<tr style="border:1px solid;height:45px;background:#FFFFA8;">
									<c:if test="${status.count==1}">
										<td rowspan="10" style="width:80px;text-align: center;">热卖库存</td>
									</c:if>
									<td style="text-align: center;"><input class="result_ckb"  value="${p.productuuid }" type="checkbox"></td>
									<c:if test="${p.qq ==  '1'}">
										<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" value="${p.product }" style="width: 180px;" required="required"><input type="hidden" class="pid" name="productuuid" value="${p.productuuid }"></td>
										<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" value="${p.manufacturer }" required="required"><input type="hidden" class="biaozi" value="2"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" value="${p.lotnumber }" required="required"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" value="${p.encapsulation }" style="width:80px;" required="required"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" value="${p.isgoodsinstock }" required="required" style="width:60px;"></td>
										<!--<td><input type="text" style="width:70px;"></td>-->
										<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" value="${p.description }" required="required"></td>
										<td style="border-left:none;text-align: center;">
											<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
											<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
										</td>
									</c:if>
 									<c:if test="${p.qq ==  '2'}">
										<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" value="${p.product }" disabled="disabled"><input type="hidden" class="pid" name="productuuid" value="${p.productuuid }"></td>
										<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" value="${p.manufacturer }" disabled="disabled"><input type="hidden" class="biaozi" value="2"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" value="${p.lotnumber }" disabled="disabled"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" value="${p.encapsulation }" style="width:80px;" disabled="disabled"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" value="${p.isgoodsinstock }" disabled="disabled" style="width:60px;"></td>
										<!--<td><input type="text" style="width:70px;"></td>-->
										<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" value="${p.description }" disabled="disabled"></td>
										<td style="border-left:none;text-align: center;">
											<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;background: #EBEBE4" value="保存" disabled="disabled">
											<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #EBEBE4;border: none;color: white;" disabled="disabled" value="删除">
										</td>
									</c:if>
								</tr>
							</form>
						</c:forEach>
						<c:forEach items="${requestScope.list }" var="p" begin="${fn:length(product2)}" varStatus="status">
							<c:if test="${status.count==1}">
								<c:if test="${fn:length(product2)<1}">
									<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
										<tr style="border:1px solid;height:45px;background:#FFFFA8;">
											<td rowspan="10" style="width:80px;">热卖库存</td>
											<td style="text-align: center;"><input class="result_ckb" value="" type="checkbox"></td>
											<td style="border-left:none;border-right:none;"><input type="text"style="width: 180px;" class="product" name="product" required="required"><input type="hidden" class="biaozi" value="2"></td>
											<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" required="required"><input type="hidden" class="pid" name="productuuid"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
											<!--<td><input type="text" style="width:70px;"></td>-->
											<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
											<td style="border-left:none;text-align: center;">
												<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
												<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
											</td>
										</tr>
									</form>
								</c:if>
							</c:if>
							<c:if test="${status.count>1}">
								<c:if test="${fn:length(product2)<1}">
									<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
										<tr style="border:1px solid;height:45px;background:#FFFFA8;">
											<td style="text-align: center;">
												<input class="result_ckb" value="" type="checkbox"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="product" name="product" required="required" style="width: 180px;"><input type="hidden" class="biaozi" value="2"></td>
											<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" required="required"><input type="hidden" class="pid" name="productuuid"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
											<!--<td><input type="text" style="width:70px;"></td>-->
											<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
											<td style="border-left:none;text-align: center;">
												<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
												<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
											</td>
										</tr>
									</form>
								</c:if>
							</c:if>
							<c:if test="${fn:length(product2)>=1}">
								<tr style="border:1px solid;height:45px;background:#FFFFA8;">
									<td style="text-align: center;">
									<input class="result_ckb" value="" type="checkbox"></td>
									<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" required="required"><input type="hidden" class="biaozi" value="2"><input type="hidden" class="pid" name="productuuid"></td>
									<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
									<!--<td><input type="text" style="width:70px;"></td>-->
									<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
									<td style="border-left:none;text-align: center;">
										<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
										<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
									</td>
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach items="${product3 }" var="p" varStatus="status">
							<form action="addproductuser3" method="post" enctype="application/x-www-form-urlencoded">
								<tr style="border:1px solid;height:45px;background:#BFFFBF;">
									<c:if test="${status.count==1 }">
										<td rowspan="20" style="width:80px;text-align: center;">推荐库存</td>
									</c:if>
									<td style="text-align: center;"><input class="result_ckb" value="${p.productuuid }"
									type="checkbox"></td>
									<c:if test="${p.qq ==  '1'}">
										<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" value="${p.product }" required="required"><input type="hidden" class="pid" name="productuuid" value="${p.productuuid }"></td>
										<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" value="${p.manufacturer }" required="required"><input type="hidden" class="biaozi" value="3"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" value="${p.lotnumber }" required="required"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" value="${p.encapsulation }" style="width:80px;" required="required"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" value="${p.isgoodsinstock }" required="required" style="width:60px;"></td>
										<!--<td><input type="text" style="width:70px;"></td>-->
										<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" value="${p.description }" maxlength="20" style="width:200px;" required="required"></td>
										<td style="border-left:none;text-align: center;">
											<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
											<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
										</td>
									</c:if>
 									<c:if test="${p.qq ==  '2'}">
										<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" value="${p.product }" disabled="disabled"><input type="hidden" class="pid" name="productuuid" value="${p.productuuid }"></td>
										<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" value="${p.manufacturer }" disabled="disabled"><input type="hidden" class="biaozi" value="3"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" value="${p.lotnumber }" disabled="disabled"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" value="${p.encapsulation }" style="width:80px;" disabled="disabled"></td>
										<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" value="${p.isgoodsinstock }" disabled="disabled" style="width:60px;"></td>
										<!--<td><input type="text" style="width:70px;"></td>-->
										<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" value="${p.description }" disabled="disabled"></td>
										<td style="border-left:none;text-align: center;">
											<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;background: #EBEBE4" value="保存" disabled="disabled">
											<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #EBEBE4;border: none;color: white;" disabled="disabled" value="删除">
										</td>
									</c:if>
								</tr>
							</form>
						</c:forEach>
						<c:forEach items="${requestScope.list3 }" var="p" begin="${fn:length(product3)}" varStatus="status">
							<c:if test="${status.count==1}">
								<c:if test="${fn:length(product3)<1}">
									<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
										<tr style="border:1px solid;height:45px;background:#BFFFBF;">
											<td rowspan="20" style="width:80px;text-align: center;">推荐库存</td>
											<td style="text-align: center;"><input class="result_ckb" type="checkbox"></td>
											<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" required="required"><input type="hidden" class="biaozi" value="3"></td>
											<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" required="required"><input type="hidden" class="pid" name="productuuid"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
											<!--<td><input type="text" style="width:70px;"></td>-->
											<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
											<td style="border-left:none;text-align: center;">
												<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
												<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
											</td>
										</tr>
									</form>
								</c:if>
							</c:if>
							<c:if test="${status.count>1}">
								<c:if test="${fn:length(product3)<1}">
									<form action="addproductuser2" method="post" enctype="application/x-www-form-urlencoded">
										<tr style="border:1px solid;height:45px;background:#BFFFBF;">
											<td style="text-align: center;"><input class="result_ckb" value="" type="checkbox"></td>
											<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" required="required"><input type="hidden" class="biaozi" value="3"></td>
											<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" required="required"><input type="hidden" class="pid" name="productuuid"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
											<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
											<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
											<td style="border-left:none;text-align: center;">
												<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
												<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
											</td>
										</tr>
									</form>
								</c:if>
							</c:if>
							<c:if test="${fn:length(product3)>=1}">
								<tr style="border:1px solid;height:45px;background:#BFFFBF;">
									<td style="text-align: center;">
										<input class="result_ckb"  value="" type="checkbox"></td>
									<td style="border-left:none;border-right:none;"><input style="width: 180px;" type="text" class="product" name="product" required="required"><input type="hidden" class="biaozi" value="3"><input type="hidden" class="pid" name="productuuid"></td>
									<td style="border-left:none;border-right:none;"><input style="width: 120px;" type="text" class="manufacturer" name="manufacturer" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="lotnumber" name="lotnumber" style="width:60px;" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="encapsulation" name="encapsulation" style="width:80px;" required="required"></td>
									<td style="border-left:none;border-right:none;"><input type="text" class="isgoodsinstock" name="isgoodsinstock" required="required" style="width:60px;"></td>
									<td style="border-left:none;border-right:none;" ><input class="description" type="text" name="description" maxlength="20" style="width:200px;" required="required"></td>
									<td style="border-left:none;text-align: center;">
										<input type="button"  class="orangeBtn kcrm_fabu sliderUnlockBtn" style="width: 42px;height: 22px;" value="保存">
										<input type="button"  class="orangeBtn kcrm_fabu deleteproduct" style="width: 42px;height: 23px;background: #593f4f;border: none;color: white;" value="删除">
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- <div class="g-tms-mhpb g-mb-10">
				<table style="text-align: left;width: 100%" border="0">
					<tbody>
						<tr>
							<td style="width: 200px; line-height: 18px">
								<span class="g-fw-b">库存总量统计</span><br>
								库存总量：<span class="g-fw-b" id="spStockAllCount">0</span>条<br>
								现货总量：<span class="g-fw-b" id="spStockPublishedCount">0</span>条<br>
								优势总量：<span class="g-fw-b" id="spStockRecommendedCount">0</span>条<br>
								<span class="stockpriority">热卖总量：<span class="g-fw-b" id="spStockPriorityCount">0</span>条
											</span></td>
							<td style="width: 200px; line-height: 18px"><span
								class="g-fw-b">现货库存统计</span><br>最多可设置：<span class="g-fw-b"
									id="spCanPublishedCount">0</span>条<br>已设置：<span
										class="g-fw-b" id="spPublishedCount">0</span>条<br>还可设置：<span
											class="g-fw-b" id="spLeavePublishedCount">0</span>条<br></td>
							<td style="width: 200px; line-height: 18px"><span
								class="g-fw-b">优势库存统计</span><br>最多可设置：<span class="g-fw-b"
									id="spCanRecommendedCount">0</span>条<br>已设置：<span
										class="g-fw-b" id="spRecommendedCount">0</span>条<br>还可设置：<span
											class="g-fw-b" id="spLeaveRecommendedCount">0</span>条<br></td>
							<td style="width: 200px; line-height: 18px; display: none;"
								id="iscp-info"><span class="g-fw-b">现货库存统计</span><br>最多可设置：<span
									class="g-fw-b" id="spCanIscpCount">0</span>条<br>已设置：<span
										class="g-fw-b" id="spIscpCount">0</span>条<br>还可设置：<span
											class="g-fw-b" id="spLeaveIscpCount">0</span>条<br></td>
							<td style="width: 200px; line-height: 18px;" id="hot-info"><span
								class="g-fw-b">热卖库存统计</span><br>最多可设置：<span class="g-fw-b"
									id="spCanHotCount">0</span>条<br>已设置：<span class="g-fw-b"
										id="spHotCount">0</span>条<br>已设置：IC(<span
											class="g-fw-b g-c-r" id="spOpenSetICHotCount">0</span>条)&nbsp;&nbsp;
											元器件(<span class="g-fw-b" id="spOpenSetECHotCount">0</span>条)<br>还可设置：<span
												class="g-fw-b" id="spLeaveHotCount">0</span>条<br></td>
						</tr>
					</tbody>
				</table>
			</div> -->
			<script type="text/javascript">
				function ConvertDateFormat(strDate) {
					if (strDate == null || strDate == "" || strDate == "0") {
						return ("");
					} else {
						try {
							var ExDate = new Date(strDate
									.replace(/-/g, "/"));
							var yyyy = ExDate.getFullYear();
							var mm = ExDate.getMonth() + 1;
							mm = mm < 10 ? "0" + mm : mm;
							var dd = ExDate.getDate();
							dd = dd < 10 ? "0" + dd : dd;
							return yyyy + "-" + mm + "-" + dd;
						} catch (e) {
							return ("");
						}
					}
				}
			</script>
			<script type="text/javascript">
				var _isCanBid = "True";
			</script>
			<input id="hidUserIDN" value="1343912" type="hidden">
		</div>
	</div>
				<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
					<%@include file="../../../../include/footer.jsp"%>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="js/userinfo.js"></script>
	<script type="text/javascript">
		/* $("form").button(function(){
		  alert($("input[name=product]").val())
		 alert($("input[name=description]").val())
		}) */
		$('.sliderUnlockBtn').click(function(){
			//var pileId=$(this).closest("tr").find("input[class='product']").val();
			var pid=$(this).parents("tr").find(".pid").val();
			if (pid == null || pid == undefined || pid == '') { 
				var pid = null; 
			}
			var me=this;
			var product=$(this).parents("tr").find(".product").val();
			var manufacturer=$(this).parents("tr").find(".manufacturer").val();
			var lotnumber=$(this).parents("tr").find(".lotnumber").val();
			var encapsulation=$(this).parents("tr").find(".encapsulation").val();
			var isgoodsinstock=$(this).parents("tr").find(".isgoodsinstock").val();
			var description=$(this).parents("tr").find(".description").val();
			var biaozi=$(this).parents("tr").find(".biaozi").val();
			if(product.length==0||manufacturer.length==0||lotnumber.length==0||encapsulation.length==0||isgoodsinstock.length==0||description.length==0){
				layer.alert("请输入完整信息！");
				return false;
			}else{
				$.ajax({
					type: 'POST',
					async : false,
					url: 'panduanshangcheng',
					data: {
						product:product,
						manufacturer:manufacturer,
						lotnumber:lotnumber,
						encapsulation:encapsulation,
						isgoodsinstock:isgoodsinstock
					},
					error:function(){
						layer.alert('请求错误');
		            },
					success:function(data){
						if(data.result=="fail"){
							layer.alert("保存失败！<br>已有相同型号！", {icon : 5});
		            	}else if(data.result=="login"){
		            		window.location.href="frontLogin";
		            	}else if(data.result=="success"){
		            		$.ajax({
		        				type: 'POST',
		        				async : false,
		        				url: 'addproductuser1',
		        				data: {
		        					productuuid:pid,
		        					product:product,
		        					manufacturer:manufacturer,
		        					lotnumber:lotnumber,
		        					encapsulation:encapsulation,
		        					isgoodsinstock:isgoodsinstock,
		        					description:description,
		        					biaozi:biaozi
		        				},
		        				beforeSend:function(){ //触发ajax请求开始时执行
		        	      	  		$(me).attr('onclick','javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
		        				}, 
		        				error:function(){
		        	                alert('请求错误');
		        	            },
		        				success:function(data){
		        					if(data.result=="fail"){
		        						$(me).parents("tr").find(".product").attr("disabled", true);
		        		  				$(me).parents("tr").find(".manufacturer").attr("disabled", true);
		        		  				$(me).parents("tr").find(".lotnumber").attr("disabled", true);
		        		  				$(me).parents("tr").find(".encapsulation").attr("disabled", true);
		        		  				$(me).parents("tr").find(".isgoodsinstock").attr("disabled", true);
		        		  				$(me).parents("tr").find(".description").attr("disabled", true);
		        		  				$(me).parents("tr").find(".sliderUnlockBtn").attr("disabled", true);
		        		  				$(me).parents("tr").find(".sliderUnlockBtn").css({background:"#EBEBE4"});
		        		  				$(me).parents("tr").find(".deleteproduct").attr("disabled", true);
		        		  				$(me).parents("tr").find(".deleteproduct").css({background:"#EBEBE4"});
		        						$(me).parents("tr").find(".pid").val(data.msg);
		        						layer.alert("保存成功！", {icon : 6});
		        	            	}else if(data.result=="login"){
		        	            		window.location.href="frontLogin";
		        	            	}else if(data.result=="success"){
		        						$(me).parents("tr").find(".product").attr("disabled", true);
		        		  				$(me).parents("tr").find(".manufacturer").attr("disabled", true);
		        		  				$(me).parents("tr").find(".lotnumber").attr("disabled", true);
		        		  				$(me).parents("tr").find(".encapsulation").attr("disabled", true);
		        		  				$(me).parents("tr").find(".isgoodsinstock").attr("disabled", true);
		        		  				$(me).parents("tr").find(".description").attr("disabled", true);
		        		  				$(me).parents("tr").find(".sliderUnlockBtn").attr("disabled", true);
		        		  				$(me).parents("tr").find(".sliderUnlockBtn").css({background:"#EBEBE4"});
		        		  				$(me).parents("tr").find(".deleteproduct").attr("disabled", true);
		        		  				$(me).parents("tr").find(".deleteproduct").css({background:"#EBEBE4"});
		        		  				layer.alert("保存成功！", {icon : 6});
		        					}
		        				}
		        	        })
		            	}
					}
		        })
			}
	    });
		$('.deleteproduct').click(function(){
			//var pileId=$(this).closest("tr").find("input[class='product']").val();
			var pid=$(this).parents("tr").find(".pid").val();
			if (pid == null || pid == undefined || pid == '') { 
				var pid = null; 
			}else{
				var me=this;
				$.ajax({
					type: 'POST',
					async : false,
					url: 'deleteproduct',
					data: {
						pid:pid
					},
					beforeSend:function(){ //触发ajax请求开始时执行
		      	  		$(me).attr('onclick','javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
					}, 
					error:function(){
		                alert('请求错误');
		            },
					success:function(data){
						if(data.result=="fail"){
							layer.alert("删除失败！", {icon : 5});
		            	}else if(data.result=="login"){
		            		window.location.href="frontLogin";
		            	}else if(data.result=="success"){
		            		$(me).parents("tr").find(".pid").val("");
		            		$(me).parents("tr").find(".product").val("");
		        			$(me).parents("tr").find(".manufacturer").val("");
		        			$(me).parents("tr").find(".lotnumber").val("");
		        			$(me).parents("tr").find(".encapsulation").val("");
		        			$(me).parents("tr").find(".isgoodsinstock").val("");
		        			$(me).parents("tr").find(".description").val("");
			  				layer.alert("删除成功！", {icon : 6});
						}
					}
		        })
			}
	    });
		$("#impro").on("input propertychange", function() {  
		    var $this = $(this),  
		        _val = $this.val(),  
		        count = "";  
		    if (_val.length > 2000) {  
		        $this.val(_val.substring(0, 2000));  
		    }  
		    count = 2000 - $this.val().length;  
		    $("#impro_num").text(count);  
		});
		$("#suppliername").on("input propertychange", function() { 
		    var $this = $(this);
		    var expressnumber = $this.val();
		    $(function () {  
			    var objectout = $("#suppliername");  
			    objectout.mouseout(function () {
			    	$.ajax({
			             type:"post",
			             url:"paduansupplier",
			             async:true,
			             dataType: "json",
			             data: {
			            	 suppliername:expressnumber
			            },
			            success : function(data){
			            	if(data.result=="fail"){
			            		for(var o in data.s){
			            			if(data.s[o].suppliername!=suppliername){
				            			alert("该公司名已被添加!");
				            		}
									$("#suppliername").val(data.s[o].suppliername);
			            		}
			            	}else if(data.result=="login"){
			            		alert("请重新登录");
			            	}else{
			            		
			            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
			            	}
			             }
			         });
			    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
			    });
			});
		});
		 $(function () {
		    var objectout = $("#telphone1");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone1").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的固定电话");
				    	$("#telphone1").val("");
			    	}else if(expressnumber!='${supplier.telphone1}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone1:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone1!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#telphone1").val(data.s[o].telphone1);
				            		}
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#telphone2");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone2").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	alert("请输入正确的固定电话");
				    	$("#telphone2").val("");
			    	}else{
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone2:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone2!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#telphone2").val(data.s[o].telphone2);
				            		}
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#telphone3");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone3").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	alert("请输入正确的固定电话");
				    	$("#telphone3").val("");
			    	}else{
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone3:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="login"){
				            		alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone3!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#telphone3").val(data.s[o].telphone3);
				            		}
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#cellphone");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#cellphone").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null && expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	alert("请输入正确的手机号码");
				    	$("#cellphone").val("");
			    	}else if(expressnumber!='${supplier.cellphone}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 cellphone:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="login"){
				            		alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].cellphone!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#suppliername").val(data.s[o].cellphone);
				            		}
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#supplierposition");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#supplierposition").val();
		    	if(expressnumber!=null&& expressnumber!=''){
		    		var str=/([^\x00-\xff]|[A-Za-z0-9_])+/;
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的地址");
				    	$("#supplierposition").val('${supplier.supplierposition}');
			    	}else if(expressnumber!='${supplier.supplierposition}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 supplierposition:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
			            			alert("该地址已被添加!");
									$("#supplierposition").val("");
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#repoposition");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#repoposition").val();
		    	if(expressnumber!=null&& expressnumber!=''){
		    		var str=/([^\x00-\xff]|[A-Za-z0-9_])+/;
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的地址");
				    	$("#repoposition").val('${supplier.repoposition}');
			    	}else if(expressnumber!='${supplier.repoposition}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 repoposition:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
			            			alert("该地址已被添加!");
									$("#repoposition").val("");
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		});
	</script>
</body>

</html>