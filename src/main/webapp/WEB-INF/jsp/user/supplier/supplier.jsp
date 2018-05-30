<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
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
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<style type="text/css">
	html{
		font: 微软雅黑;
		font-size: 11px;
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
	.hyxx_titile {
	line-height: 17px;
	text-align: right;
	float: left;
	height: 17px;
	width: 115px;
	color: #666666;
	padding-right: 15px;
}
.hyxx_xinxi {
	height: 40px;
}
.hyxx_value {
	color: #666;
	line-height: 17px;
	float: left;
	height: 17px;
}
.hyxx_inputline {
	height: 39px;
}
.hyxx_longinput {
	width: 328px;
	float: left;
}
.hyxx_wangzhi, .hyxx_tuiguangyu {
	line-height: 27px;
	text-align: right;
	float: left;
	height: 27px;
	width: 115px;
	color: #666666;
	padding-right: 15px;
}
.hyxx_zhuying {
	height: 178px;
	width: 501px;
	float: left;
}
.hyxx_jieshao {
	height: 205px;
}
.hyxx_remainword {
	line-height: 160px;
	color: #999;
	float: left;
	height: 150px;
	padding-left: 20px;
}
.hyxx_tgy_remainword{
	color: #999;
	line-height:27px;
	padding-left: 20px;
	display:inline-block;
}
.hyxx_savebtn {
	height: 31px;
	width: 82px;
	margin-top: 8px;
	margin-left: 130px;
	display:block;
}
.hyxx_save {
	padding-bottom: 33px;
}
.hylx_title {
	line-height: 27px;
	float: left;
	height: 27px;
	width: 112px;
	text-align: right;
	color: #666;
	padding-right: 6px;
}
.hylx_content {
	line-height: 27px;
	float: left;
	height: 27px;
	width: 281px;
	color: #666;
}
.hyxx_yb {
	line-height: 27px;
	color: #666;
	float: left;
	height: 27px;
	width: 75px;
	text-align: right;
	padding-right: 6px;
}
.hyxx_lxfs {
	height: 40px;
}
.hyxx_youbian {
	float: left;
	width: 82px;
	height:25px;
	line-height:28px;
	color:#666;
}
.hyxx_czshort {
	float: left;
	width: 40px;
}
.hyxx_gang {
	line-height: 27px;
	color: #666;
	height: 27px;
	width: 20px;
	float: left;
	text-align: center;
}
.hylx_phone {
	line-height: 27px;
	color: #666;
	float: left;
	height: 27px;
	margin-right: 30px;
}
.hylx_tishi {
	line-height: 27px;
	color: #999;
	float: left;
	height: 27px;
}
.yltippoint {
	font-size: 2px;
	line-height: 2px;
	background: url(../../images/member/yellowtishi.gif) no-repeat left top;
	height: 5px;
	width: 6px;
	position: absolute;
	left: -4px;
	top: 10px;
}
.yellowtips p {
	line-height: 23px;
	height: 23px;
	border: 1px solid #FFF;
	color: #666;
}
.hyxx_lxfs .yellowerror_tips {
	float: left;
	margin-left: 10px;
}
.hyxx_savecontact {
	float: left;
	height: 31px;
	width: 82px;
	margin-left: 118px;
	line-height: 31px;
}
.savecontact {
	height: 51px;
	padding-top: 5px;
}
.bindphoneBtn {
	line-height: 31px;
	height: 31px;
	width: 98px;
	font-weight: bolder;
	font-size: 14px;
	margin-left: 39px;
	margin-top: 18px;
}
.bindphone_help {
	width: 12px;
	height: 12px;
	background: url(../../images/member/pagepicker.png) no-repeat -262px -7px;
	display: inline-block;
	margin-left: 20px;
}
#bindphone {
	background-color: #FFF;
	height: 129px;
	width: 397px;
}
.loginpwd {
	height: 260px;
}
.safepwd {
	height: 255px;
}
.hymm_savebtn {
	line-height: 31px;
	height: 31px;
	width: 82px;
	margin-top: 8px;
	margin-left: 147px;
	display:block;
}
.hymm_yuanshi {
	height: 42px;
	margin-top: 23px;
}
.hymm_title {
	line-height: 27px;
	color: #666;
	text-align: right;
	height: 27px;
	width: 135px;
	padding-right: 10px;
	float: left;
}
.hymm_xinmima, .hymm_querenmima {
	height: 42px;
}
.hymm_btns {
	height: 55px;
}
.hymm_longinput {
	width: 254px;
	float: left;
}
.hymm_xinmima .yellowtips, .hymm_querenmima .yellowtips, .hymm_yuanshi .yellowtips {
	float: left;
	margin-left: 10px;
}
.safeleftcontent {
	position: absolute;
	width: 690px;
}
.frc_number {
	float: left;
}
.frc_title {
	height: 28px;
}
.frc_content {
	line-height: 20px;
	padding-bottom: 10px;
}
.saferightcontent {
	float: right;
	width: 320px;
	padding-right: 40px;
	margin-top: 23px;
}
.maincontent.duanxin .content {
	min-height: 200px;
	padding-bottom: 20px;
}
.hydx_haoma {
	line-height: 38px;
	height: 38px;
	color: #666;
}
.hydx_choose {
	margin-left: 55px;
	width: 400px;
	margin-top: 20px;
}
.hydx_sysjh {
	line-height: 35px;
	height: 45px;
}
.hydx_hqyzm {
	line-height: 35px;
	height: 42px;
}
.hydx_sryzm {
	line-height: 35px;
	height: 35px;
}
.hydx_yanzhengma {
	height: 27px;
	width: 108px;
	line-height: 27px;
	margin-left: 102px;
}
.hydx_phonenumber {
	width: 106px;
	margin-left: 5px;
}
.hydx_what {
	width: 380px;
	float: right;
	margin-right: 10px;
	margin-top: 25px;
}
.hydx_yzmtitle {
	line-height: 27px;
	height: 27px;
	width: 92px;
	float: left;
	text-align: right;
	padding-right: 10px;
	color: #666;
}
.hydx_vertifi {
	width: 106px;
}
.hydx_notreceive {
	line-height: 35px;
	height: 35px;
	color: #666;
}
.hydx_usephone {
	color: #666;
}
.hydx_saveBtn {
	height: 31px;
	width: 82px;
	line-height: 31px;
	margin: 22px 0px 0px 20px;
}
.hydx_btn {
	height: 66px;
}
.hydx_detail p {
	line-height: 25px;
	color: #999;
}
.hydx_help {
	color: #FE5B00;
	padding-top: 22px;
	display: block;
}
.hydx_help:hover {
	text-decoration: underline;
}
.hydx_what h4 {
	font-weight: normal;
	color: #999;
	line-height: 25px;
	height: 25px;
}
.yellowerror_tips {
	line-height: 25px;
	height: 25px;
	padding-right: 10px;
	padding-left: 27px;
	border: 1px solid #ded8b9;
	position: relative;
	white-space: nowrap;
	display: inline-block;
	-webkit-border-radius: 2px;
	-ms-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	background: #fffeef url(../../images/member/errortips.gif) no-repeat 8px 6px;
}
.yellowtips {
	line-height: 25px;
	background-color: #fffeef;
	height: 25px;
	padding-right: 7px;
	padding-left: 7px;
	border: 1px solid #ded8b9;
	position: relative;
	white-space: nowrap;
	display: inline-block;
	-webkit-border-radius: 2px;
	-ms-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}
.bind_ads {
	font-size: 14px;
	color: #666;
	padding-top: 39px;
	padding-left: 39px;
}
.hymm_xinmima .yellowtips, .hymm_querenmima .yellowtips, .hymm_yuanshi .yellowtips, .hymm_yuanshi .yellowerror_tips {
	float: left;
	margin-left: 10px;
}
.hyxb_nowmail {
	line-height: 25px;
	height: 40px;
	margin: 25px 0px 0px 56px;
	color: #666;
}
.hyxb_change {
	line-height: 25px;
	height: 40px;
	margin-left: 56px;
	color: #666;
}
.hyxb_notuse {
	line-height: 25px;
	height: 40px;
	margin-left: 56px;
	color: #666;
}
.hyxb_btn {
	line-height: 25px;
	height: 40px;
	margin-left: 56px;
}
.hyxb_button {
	line-height: 31px;
	height: 31px;
	width: 82px;
	margin: 11px 0px 0px 18px;
}
.hyxb_radio {
	position: relative;
	top: 3px;
}
.hyxb_input {
	width: 210px;
}
.maincontent.hyxbj {
	height: 266px;
}
.hyxb_change .yellowerror_tips {
	position: relative;
	top: -2px;
	left: 5px;
}
.hyff_state {
	line-height: 35px;
	height: 35px;
	margin-left: 28px;
	color: #666;
	margin-bottom: 11px;
}
.hyff_state .orangenumber {
	padding: 0px 5px;
}
.hyff_table1, .hyff_table2 {
	border: 1px solid #ccc;
	border-collapse: collapse;
	margin-left: 30px;
}
.hyff_table2 {
	margin-top: 20px;
}
.hyff_table1 td, .hyff_table1 th, .hyff_table2 td, .hyff_table2 th {
	height: 34px;
	text-align: center;
	border: 1px solid #ccc;
	font: normal 12px/34px 瀹嬩綋;
	overflow: hidden;
}
.hyff_explain {
	font-size: 12px;
	line-height: 23px;
	color: #666;
	height: 23px;
}
.hyff_shuoming {
	margin: 20px 0px 0px 30px;
}
.maincontent.hy_ffjl .content {
	padding-bottom: 20px;
}
.hyxx_czhm {
	float: left;
	width: 152px;
}
.greencheck {
	width: 12px;
	height: 12px;
	float: left;
	margin: 7px 0px 0px 5px;
	background: url(../../images/ui/vfc_right.gif) no-repeat left top;
}
.hyb_button {
	width: 80px;
	height: 31px;
	line-height: 31px;
	margin-left: 18px;
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
										<img src="<%=basePath%>logo/user_xingji.png">	
									</c:if>
									<c:if test="${sessionScope.star==2 }">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>50}">
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
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="产品上传" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dt style="border: none;">
					<ul>
						<li style="background: #D0DFEF;">
							<a href="supplierIn" data-title="公司信息" style="font-weight: normal;">
								<img style="position: absolute;margin-top: 13px;" src="<%=basePath%>logo/yuan.png">&emsp;&emsp;公司资料
							</a>
						</li>
						<li>
							<a href="javascript:;" onclick="usersupplier()" style="font-weight: normal;" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="javascript:;" onclick="usersupplierpt()" style="font-weight: normal;" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
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
							<a href="usersystem" class="selected">公司信息</a>
							
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<ul class="hyxx_tabs">
					<li class="selected hyxx_tabB"><a href="supplierIn">&nbsp;</a></li>
		    	</ul>
			    <!--基本信息begin-->
			    <div class="hyxx_jiben" style="margin-top: 30px;">
			    	<form action="addSupplier" method="post" class="form">
				      <p class="hyxx_xinxi" style="color: red;font-size: 24px;">
				      		<c:if test="${supplier.suppliername==null }">
				      			<span class="hyxx_titile" style="color: red;font-size: 18px;">公司全称：</span>
				      		</c:if>
				      		<span class="hyxx_value" style="color: red;<c:if test='${supplier.suppliername!=null }'>margin-left:85px</c:if>">
				      			<c:if test="${supplier.suppliername==null }">
				      				<input type="text" class="inputtext hyxx_longinput" id="suppliername" name="suppliername" maxlength="32" style="width:398px;height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -15px;" required="required">
				      			</c:if>
				      			<input type="hidden" name="supplieruuid" value="${supplier.supplieruuid }">
				      			${supplier.suppliername }
				      		</span>
				      </p>
		      	      <p class="hyxx_xinxi">
		      	      	<span class="hyxx_titile" style="margin-left: 0px;">QQ：</span>
		      	      </p>
		      	      <p class="hyxx_xinxi" style="margin-top: -20px;">
		      	      	<span class="hyxx_titile" style="margin-left: -10px;"><span class="orangewords" style="color: red;font-size: 13px;">*</span>1：</span>
		      	      	<span class="hyxx_value" style="margin-left: -10px;"><input type="text" name="qq" class="inputtext hyxx_longinput" value="${supplier.qq }" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" style="width: 155px;height: 30px;height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;" required="required"></span>
		      	      	<span class="hyxx_titile" style="margin-left: -42px;">2：</span>
		      	      	<span class="hyxx_value" style="margin-left: -5px;"><input type="text" name="qq2" class="inputtext hyxx_longinput" value="${supplier.qq2 }" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" style="width: 155px;height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;"></span>
		      	      </p>
		      	      <p class="hyxx_xinxi">
		      	      	<span class="hyxx_titile" style="margin-left: 0px;width: 210px;">电话：<span style="color: red;">格式：区号-号码</span></span>
		      	      </p>
		      	      <p class="hyxx_xinxi" style="margin-top: -20px;">
		      	      	<span class="hyxx_titile" style="margin-left: -10px;"><b class="orangewords" style="color: red;font-size: 13px;">*</b>1：</span>
		      	      	<span class="hyxx_value" style="margin-left: -10px;"><input id="telphone1" maxlength="13" type="text" name="telphone1" class="inputtext hyxx_longinput" value="${supplier.telphone1 }" style="height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width: 155px;" required="required"></span>
		      	      	<span class="hyxx_titile" style="margin-left: -42px;">2：</span>
		      	      	<span class="hyxx_value" style="margin-left: -5px;"><input id="telphone2" type="text" maxlength="13" name="telphone2" class="inputtext hyxx_longinput" value="${supplier.telphone2 }" style="height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width: 155px;"></span>
		      	      </p>
		      	      <p class="hyxx_xinxi" style="margin-top: 0px;">
		      	      	<span class="hyxx_titile" style="margin-left: -10px;">3：</span>
		      	      	<span class="hyxx_value" style="margin-left: -10px;"><input type="text" id="telphone3" maxlength="13" name="telphone3" class="inputtext hyxx_longinput" value="${supplier.telphone3 }" style="height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width: 155px;"></span>
		      	      	<span class="hyxx_titile" style="margin-left: -42px;">4：</span>
		      	      	<span class="hyxx_value" style="margin-left: -5px;"><input type="text" maxlength="13" id="telphone4" name="telphone4" class="inputtext hyxx_longinput" value="${supplier.telphone3 }" style="height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width: 155px;"></span>
		      	      </p>
		      	      <p class="hyxx_xinxi">
		      	      	<span class="hyxx_titile" style="margin-left: 0px;">手机：</span>
		      	      </p>
		      	      <p class="hyxx_xinxi" style="margin-top: -20px;">
		      	      	<span class="hyxx_titile" style="margin-left: -10px;">1：</span>
		      	      	<span class="hyxx_value" style="margin-left: -10px;"><input type="text" maxlength="11" id="cellphone" name="cellphone" class="inputtext hyxx_longinput" value="${supplier.cellphone }" style="height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width: 155px;"></span>
		      	      </p>
		      	      <p class="hyxx_xinxi">
		      	      	<span class="hyxx_titile" style="margin-left: 0px;"><span class="orangewords" style="color: red;font-size: 13px;">*</span>地址：</span>
		      	      </p>
		      	      <p class="hyxx_xinxi" style="margin-top: -20px;">
		      	      	<span class="hyxx_titile" style="margin-left: -10px;">1：</span>
		      	      	<span class="hyxx_value" style="margin-left: -10px;"><input type="text" class="inputtext hyxx_longinput" maxlength="65" id="supplierposition" name="supplierposition" value="${supplier.supplierposition }" style="height: 27px;border: 2px #CDB38B solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;width: 400px;" required="required"></span>
		      	      </p>
				      <div class="hyxx_jieshao">
				      		<span class="hyxx_wangzhi" style="margin-left: 20px;"> 特色经营：</span>
				      		<p style="clear: both;"></p>
			      	        <textarea id="impro" style="margin-left: 105px;margin-top: 10px;width: 401px;" name="brandoperation" class="inputtextarea hyxx_zhuying" onkeyup="javascript: checkImpro();">${supplier.brandoperation }</textarea>
			      	  		<span class="hyxx_remainword">您还可以输入<span id="impro_num" class="orangenumber">150</span>字</span> 
			      	  </div>
				      <div class="hyxx_save">
				        <input type="submit" name="btn_saveBasic" class="hyxx_savebtn orangeBtn" style="background-color:#FD7C00;border: none;margin-top: 20px;margin-left: 105px;" value="保存" />
				      </div>
			       </form>
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
		$("#impro").on("input propertychange", function() {  
		    var $this = $(this),  
		        _val = $this.val(),  
		        count = "";  
		    if (_val.length > 150) {  
		        $this.val(_val.substring(0, 150));  
		    }  
		    count = 150 - $this.val().length;  
		    $("#impro_num").text(count);  
		});
		function usersupplier(){
			$.post("supplierseleuser",
	            function(data){
					if(data.result=="fail"){
						layer.alert("请先添加公司信息",function(){var index = window.location.href="supplierIn";
		                parent.layer.close(index);});
					}else if(data.result=="seccuss"){
						window.location.href="userSupplierProduct";
					}else if(data.result=="login"){
						window.location.href="frontLogin";
					}
				}
		   	)
		}
		function usersupplierpt(){
			$.post("supplierseleuser",
	            function(data){
					if(data.result=="fail"){
						layer.alert("请先添加公司信息",function(){var index = window.location.href="supplierIn";
		                parent.layer.close(index);});
					}else if(data.result=="seccuss"){
						window.location.href="putong";
					}else if(data.result=="login"){
						window.location.href="frontLogin";
					}
				}
		   	)
		}
		$("#suppliername").on("input propertychange", function() { 
		    var $this = $(this);
		    $(function () {  
			    var objectout = $("#suppliername");  
			    objectout.mouseout(function () {
			    	var expressnumber = $("#suppliername").val();
			    	if(expressnumber==null && expressnumber==''){
				    	return false;
				    }
			    	if(expressnumber!=null && expressnumber!==''){
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
				            			layer.alert("该公司是本网站重点保护客户，为防止被人乱注册，请先与客服 2829795872 联系！");
										$("#suppliername").val("");
				            		}
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
				            	}else{
				            		
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
			    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
			    });
			});
		});
		 $(function () {
			 var a='${biaozi}';
			 if(a!=null && a=="chenggong"){
				layer.alert("保存成功",function(){var index = window.location.href="supplierIn"; 
                parent.layer.close(index);});
			 }else if(a!=null && a=="shibai"){
				 layer.alert("保存失败");
				setTimeout(function(){window.location.href="supplierIn";},1000);
			 }
		    var objectout = $("#telphone1");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone1").val();
		    	var str =/^([0-9]{3,4}-)?[0-9]{7,8}$/;
		    	if(expressnumber!=null&& expressnumber!=''){
		    		if(!(str.test(expressnumber))){
		    			layer.alert("请输入正确的固定电话");
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
				            				layer.alert("该号码已被添加!");
					            		}
										$("#telphone1").val(data.s[o].telphone1);
				            		}
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
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
		    	var str =/^([0-9]{3,4}-)?[0-9]{7,8}$/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
			    		layer.alert("请输入正确的固定电话");
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
				            				layer.alert("该号码已被添加!");
					            		}
										$("#telphone2").val(data.s[o].telphone2);
				            		}
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
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
		    	var str =/^([0-9]{3,4}-)?[0-9]{7,8}$/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
			    		layer.alert("请输入正确的固定电话");
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
				            		layer.alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone3!=expressnumber){
				            				layer.alert("该号码已被添加!");
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
		    var objectout = $("#telphone4");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone4").val();
		    	var str =/^([0-9]{3,4}-)?[0-9]{7,8}$/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
			    		layer.alert("请输入正确的固定电话");
				    	$("#telphone4").val("");
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
				            		layer.alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone3!=expressnumber){
				            				layer.alert("该号码已被添加!");
					            		}
										$("#telphone4").val(data.s[o].telphone4);
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
			    		layer.alert("请输入正确的手机号码");
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
				            		layer.alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].cellphone!=expressnumber){
				            				layer.alert("该号码已被添加!");
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
		    			layer.alert("请输入正确的地址");
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
				            		for(var o in data.s){
				            			if(data.s[o].supplierposition==expressnumber){
				            				layer.alert("该地址已被添加!");
											$("#supplierposition").val("");
					            		}
				            		}
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
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
		    			layer.alert("请输入正确的地址");
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
				            		layer.alert("该地址已被添加!");
									$("#repoposition").val("");
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
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