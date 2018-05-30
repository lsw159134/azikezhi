<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
	String header = request.getParameter("header");
%>
<%
	if (header.equals("productSearchResult")) {
%>
<head>
	<title>自可知-电子元器件查询网</title>
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
	<link rel="stylesheet" type="text/css" href="css/css/HeaderSearch.css" />
	<link rel="stylesheet" type="text/css" href="css/css/productSearchResult.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/shangpinfenlei.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/float.css" />
	<script src="<%=basePath%>js/jquerybasic.js"></script>
	<script src="js/productSearchResult.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/paging.js" type="text/javascript"></script>
	<style type="text/css">
		a,address,b,big,blockquote,body,center,cite,code,dd,del,div,dl,dt,em,fieldset,font,form,h1,h2,h3,h4,h5,h6,html,i,iframe,img,ins,label,legend,li,ol,p,pre,small,span,strong,u,ul,var
		{
			font-family : 微软雅黑,宋体;
		}
	</style>
</head>
<%
	}else if(header.equals("AddBom")) {
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>自可知-电子元器件查询网</title>
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
	<link rel="stylesheet" type="text/css" href="css/css/HeaderSearch.css" />
	<link rel="stylesheet" type="text/css" href="css/css/productSearchResult.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/shangpinfenlei.css">
	<link rel="stylesheet" type="text/css" href="css/bomPage.css" />
	<script src="<%=basePath%>js/jquerybasic.js"></script>
</head>
<%
  }
%>
	<header>
		<div id="div"
			style="background-color: #E5E5E5; width: 1348px; margin-left: -75px;height: 30px">
			<div style="text-align: left; margin-left: 75px;padding-top: 5px">
				<span style="font-size: 10px">客服热线:0755-82720040</span> <b>|</b>
				 <span style="font-size: 10px">交易时间：9:00-18:00</span> <b>|</b> 
				 <span style="font-size: 10px">在线客服</span> 
				 <a href="javascript:void(0)"
					onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
					<img src="<%=contextPath%>/logo/indexQQ1.png"
					style="width: 15px; height: 15px; margin: 0px 0px -3px 0px" />
				</a> <b>|</b> 
				<span style="font-size: 10px">采购交流群：337260650</span>
			</div>
		</div>
		
		<div style="float: left; width: 25%;padding-top: 55px">
				<a href="index"> <span style="float: left;">  <span
						style="color: #28004D; font-size: 35px; font-weight: bold; margin-top: 80px;">
							自可知 </span> <span
						style="color: #28004D; color: #28004D; font-size: 18px; font-weight: bold;">
							|&nbsp; 电子查询网 </span>
				</span>
				</a>
			</div>
		
	       		 <c:if test="${sessionScope.userName == null}">
					<div id="regLogin"
						style="margin-top: -55px; text-align:right;width:600px">
						<span id="login"> <img src="<%=basePath%>img/login.png" alt="" />
							<a style="color: black" href="javascript:void(0)" class="goLogin">登录</a>
						</span> <span id="register"> <img src="<%=basePath%>img/register.png" />
							<a style="color: black" href="register">注册</a>
						</span> 
						<%-- <span> <img src="<%=basePath%>img/contactus.png" alt="" /> <a
							style="color: black" href="aboutus">联系我们</a>
						</span> --%>
						<!-- <span><img src="logo/ruzhu.png"><a href="merchantLogin">商家入驻</a></span> --><!-- merchantLogin -->
					</div>
				</c:if>
				<c:if test="${sessionScope.userName != null}">
					<div id="regLogin" style="margin-top: -55px; text-align: right; width:600px">
						<%-- <span> <img src="<%=basePath%>img/contactus.png" alt="" /> <a
						href="aboutus" style="color: black;">联系我们</a></span>	 --%>
						<span><img src="logo/userout.png"><a href="userOut">&nbsp退出</a></span>
					</div>
				</c:if>
		
		<div style="float: left; width: 48%; margin-top: 25px;margin-left: 45px">
				<form
					action="search?product_second=${product_second }&&manufacturer=${manufacturer}&&encapsulation=${encapsulation}"
					method="get">
					<input
						style="width: 420px; float: left; height: 43px; border: 3px solid #c00; border-color: #c00; border-right: none;margin-top:10px "
						id="keyword" type="text" name="keyword" placeholder="请输入要查找的产品型号">
					<div class="clickOver"
						style="float: left; border-top: 3px solid #c00; border-bottom: 3px solid #c00; height: 43px; line-height: 43px; text-align: center;margin-top:10px; padding-right: 5px; margin-left: -55px;">
						<p style="float: left; margin-top: 16px;">
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
		<c:if test="${sessionScope.userName != null}">
			<div style="margin-left:1010px;position: absolute;margin-top: 30px;">
				<table class="table1" cellpadding="0" cellspacing="0" style="border: 1px #28004D solid;width: 180px;text-align: center;height: 90px;table-layout: fixed;">
					<tr>
						<td  colspan="2">
							<span>
								<img src="logo/user_geren.png" />
								<a href="usersystem" style="font-size: 13px"><%=session.getAttribute("userName")%></a>
							</span> 
						</td>
					</tr>
					<tr>
						<td style="border: 1px #28004D solid;width: 130px;border-left: none;border-bottom: none;" >
							<img style="width: 20px;height: 20px" src="logo/mydingdan.png">
							<a href="express" style="font-size: 13px">
								订单
							</a>
						</td>
						<td style="border: 1px #28004D solid;border-right: none;border-bottom: none;border-left: none;">
							<p style="display:inline-block;background-image: url('logo/cartCount.png');width: 18px;height: 18px;color: white;font-weight: bold;position: absolute;margin-top: -10px;margin-left: 15px;font-size: 12px;line-height:18px;" >
				 				${carCount}
				 			</p>
							<img src="logo/mygouwuche.png">
							<a href="myCart" style="font-size: 13px">
								购物车
							</a>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
		
		
		
		<div
		style="width: 100%; margin-top: 137px;  background: #fff; height: 40px; background-color: #fff">
		<div id="nav"
			style="width: 1200px; height: 40px; position: relative; padding: 0;">
			<div class="home"
				style="float: left; height: 40px; position: relative;">
				<a
					style="float: left; text-align: center; height: 40px; line-height: 40px; background: -webkit-linear-gradient(top, #f62521, #cc0000); padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: white; font-size: 16px; width: 80px;"
					href="<%=basePath%>">首页</a> <a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 80px;"
					href="<%=basePath%>zaixiangouProduct"><font>在线购</font></a>  <a
					style="float: left; text-align: center; height: 40px; line-height: 40px; padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 120px;"
					href="<%=basePath%>beidongProduct"><font>被动器件供应商</font></a>
					<a style="float: left;text-align: center;height: 40px;line-height: 40px;padding: 0 10px;text-decoration: none;position: relative;white-space: nowrap;border-left: none;border-right: none;color:black;font-size: 16px;width: 120px;" href="<%=basePath%>resistanceZone"><font>被动器件商城</font></a>
			</div>
		</div>
	</div> 
	<div style="width: 88%;height: 2px;background-color: #cc0000;margin-top: -2px;margin-bottom:20px;" >
	</div>
		
		
		<%-- <div class="header-wrap" style="margin-top: 150px">
			
			<div class="navwrap" style="margin-top: 50px;background: #3A006F">
				<div id="nav">
					<div class="navbar" style="margin-left: -190px;width: 960px" >
						<a <%=header.equals("productSearchResult") ? "id='daohangback'" : ""%> style="margin-left: -18px;border-left: none;border-right: none;color: white;font-size: 18px;width: 150px;" href="<%=basePath%>"><b>首页</b></a>
				</div>
			</div>
			</div>
		</div> --%>
	</header>