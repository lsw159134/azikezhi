<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<%
    String header = request.getParameter("header");
%>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/shangpinfenlei.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/header.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/index.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/float.css" />
	<script src="<%=basePath%>js/jquerybasic.js"></script>
	<title>自可知</title>
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
	
</head>
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
		<a href="index">
			<span style="margin-top: -10px" id="logo"> <img src="<%=contextPath%>/logo/logo.png" /> 
				<span id="title" style="color: #7BA8AB;font-size: 40px">
				 	自可知 <span style="color: #7BA8AB" id="smallTitle">|&nbsp; 电子查询网</span>
				</span>
			</span>
			
		</a>
		
			
			<%
	            if (session.getAttribute("userName") == null) {
	        %>
			<div id="regLogin"
				style="margin-top: -40px; text-align:right;width:600px">
				<span id="login"> <img src="<%=basePath%>img/login.png" alt="" />
					<a style="color: black" href="frontLogin">登录</a>
				</span> <span id="register"> <img src="<%=basePath%>img/register.png" />
					<a style="color: black" href="register">注册</a>
				</span> 
				<%-- <span> <img src="<%=basePath%>img/contactus.png" alt="" /> <a
					style="color: black" href="aboutus">联系我们</a>
				</span> --%>
				<!-- <span><img src="logo/ruzhu.png"><a href="merchantLogin">商家入驻</a></span> --><!-- merchantLogin -->
			</div>
			<div id="right" style="margin-top: -130px;" >
				<div id="search" >
					<form  action="search" method="get">
						<input style="border-color: #7BA8AB" id="keyword" type="text" name="keyword"
							placeholder="请输入芯片、IC、二三极管等产品型号"> <input style="background-color: #7BA8AB" id="submit"
							type="submit" value="搜索">
					</form>
					<div id="product" style="margin-left: 5px;">
						<div style="height: 17px;width: 450px;margin-left: 205px;">
							<span style="font-weight: bold;color: red;"><img src="logo/hot.gif">热搜型号 :&nbsp;&nbsp;</span>
								<a 
							href="search?keyword=STM32F103C8T6&amp;value=product&amp;page=1">STM32F103C8T6</a>&nbsp;
								&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
							href="search?keyword=CP2102-GMR&amp;value=product&amp;page=1">CP2102-GMR</a>&nbsp;
								&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
							href="search?keyword=ATMEGA328P-AU&amp;value=product&amp;page=1">ATMEGA328P-AU</a>&nbsp;
								&nbsp;<!-- <span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
							href="shaixuanse?primary_name=二极管">二极管</a>&nbsp;
								&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
							href="shaixuanse?primary_name=继电器">继电器</a>&nbsp;&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;
							<a href="shaixuanse?primary_name=电感和磁珠">电感和磁珠</a> -->
						</div>
							
					</div>
					<!-- <div style="margin-left: 875px;margin-top: -80px;position: absolute;" >
							<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #E5E5E5 solid;border-collapse:collapse;width: 143px;height: 78px;">
								<tr>
									<td width="40px" style="padding-top: 5px;border: 1px #E5E5E5 solid;">
										<a href="javascript:void(0)"
											onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
											<img style="width: 20px;height: 20px" alt="QQ" src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg">&nbsp;
										</a>
									</td>
									<td style="background-color: #FFA500;color: white;font-size: 12px;border: 1px #E5E5E5 solid;" width="100px">
										<a href="addbomQuotes"
											 style="color: white">
											BOM表报价
										</a>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="padding-top: 20px">
										<span style="font-size: 13px;">
											昨日成交订单:
										</span>
										<span id="chengjiao" style="font-weight: bold;"></span>
										<span style="font-size: 13px">
											笔
										</span>
									</td>
								</tr>
							</table>
						</div> -->
					
				</div>
			</div>
			
		<%
	        } else {
	        %>
				<div id="regLogin" style="margin-top: -40px; text-align:right;width:600px">
					<span id="userName"> <img src="<%=basePath%>img/userIcon.png" />
						<a style="color: black;" href="usersystem"><%=session.getAttribute("userName")%></a>
					</span> 
					<span>
						<img src="logo/mydingdan.png">
						<a href="express">
							我的订单
						</a>
					</span>
					<span >
						<img src="logo/mygouwuche.png">
						<a href="myCart">
							我的购物车
						</a>
					</span>
					<%-- <span> <img src="<%=basePath%>img/contactus.png" /> <a style="color: black;" href="aboutus">联系我们</a></span> --%>
					<span><img src="logo/userout.png"><a style="color: black;" href="userOut">&nbsp退出</a></span>	
				</div>
				<div id="right" style="margin-top: -130px">
					<div id="search">
						<form  action="search" method="get">
							<input style="border-color: #7BA8AB" id="keyword" type="text" name="keyword"
							placeholder="请输入芯片、IC、二三极管等产品型号"> <input style="background-color: #7BA8AB" id="submit"
							type="submit" value="搜索">
						</form>
						<div id="product" style="margin-left: 5px;">
							<div style="height: 17px;width: 450px;margin-left: 205px;">
								<span style="font-weight: bold;color: red;"><img src="logo/hot.gif">热搜型号 :&nbsp;&nbsp;</span>
									<a 
								href="search?keyword=STM32F103C8T6&amp;value=product&amp;page=1">STM32F103C8T6</a>&nbsp;
									&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
								href="search?keyword=CP2102-GMR&amp;value=product&amp;page=1">CP2102-GMR</a>&nbsp;
									&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
								href="search?keyword=ATMEGA328P-AU&amp;value=product&amp;page=1">ATMEGA328P-AU</a>&nbsp;
									&nbsp;<!-- <span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
								href="shaixuanse?primary_name=二极管">二极管</a>&nbsp;
									&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
								href="shaixuanse?primary_name=继电器">继电器</a>&nbsp;&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;
								<a href="shaixuanse?primary_name=电感和磁珠">电感和磁珠</a> -->
							</div>
								
						</div>
						<!-- <div style="margin-left: 875px;margin-top: -80px;position: absolute;" >
							<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #E5E5E5 solid;border-collapse:collapse;width: 143px;height: 78px;">
								<tr>
									<td width="40px" style="padding-top: 5px;border: 1px #E5E5E5 solid;">
										<a href="javascript:void(0)"
											onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
											<img style="width: 20px;height: 20px" alt="QQ" src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg">&nbsp;
										</a>
									</td>
									<td style="background-color: #FFA500;color: white;font-size: 12px;border: 1px #E5E5E5 solid;" width="100px">
										<a href="addbomQuotes" style="color: white">
											BOM表报价
										</a>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="padding-top: 20px">
										<span style="font-size: 13px;">
											昨日成交订单:
										</span>
										<span id="chengjiao" style="font-weight: bold;"></span>
										<span style="font-size: 13px">
											笔
										</span>
									</td>
								</tr>
							</table>
						</div> -->
					</div>
				</div>
				
		<%
	            }
	        %>
		
		
		<div class="header-wrap" style="margin-top: 150px">
			<div style="color: #7BA8AB;font-size: 16px;margin-top: -65px;"><b style="margin-left: -190px;">专注贸易商元器件查询服务</b></div>
			<div class="navwrap" style="margin-top: 50px;background: #4DB031">
				<div id="nav">
					<div class="navbar" style="margin-left: -80px;;width: 960px" >
						<a <%=header.equals("index") ? "id='daohangback'" : ""%> style="width: 150px;margin-left: -12px;border-left: none;border-right: none;color: #E01222;font-size: 18px;" href="<%=basePath%>"><b>首页</b></a>
						<%-- <a <%=header.equals("more") ? "id='daohangback'" : ""%> href="booking" style="border-left: none;border-right: none;color:white;font-size: 16px;width: 150px;"><b>芯片代售</b></a> --%>
						<%-- <a <%=header.equals("module") ? "id='daohangback'" : ""%> href="module">模块</a>
						<c:if test="${sessionScope.userName == null}">
							<a href="frontLogin">选型指导</a>
						</c:if>
						<c:if test="${sessionScope.userName != null}">
							<a <%=header.equals("ST") ? "id='daohangback'" : ""%> href="sortList?sort_miaoshu=ST">选型指导</a>
						</c:if> --%>
						
					</div>
					<%-- <div class="pros subpage" style="margin-left: -111px;width: 230px;margin-top: 1px" >
						<h2 style="background-color: #00BFFF;width: 214px;text-align: center">
							全部产品分类<span class="jiantou" style="margin-left: 20px;margin-top: 8px;position: absolute;"></span>
						</h2>
						<ul class="prosul clearfix" id="proinfo">
							<c:forEach items="${sessionScope.primaryList}" var="primary">
								<li style="border-bottom: 1px #FF8C00 solid;">
									<!-- <a class="ti" href="#">美食</a>
									<a class="hot" href="#">地方菜</a> -->
									<a class="primary" href="#" style="font-size: 13px;font-weight: bold;">${primary.primary_name}</a>
									<span class="rightjiantou" style="float: right;padding-right: 10px;color: white">&gt;</span>
									<div class="prosmore hide">
									</div>
								</li>
							</c:forEach>
							<li style="border-bottom: 1px #FF8C00 solid;">
								<a href="moreSort" style="font-size: 13px;font-weight: bold;">更多</a>
								<span class="rightjiantou" style="float: right;padding-right: 10px;color: white">&gt;</span>
							</li>
							<!-- <li style="border-bottom: 1px #FF8C00 solid;">
								<a href="javascript:void(0)" style="font-size: 13px;font-weight: bold;">更多</a>
							</li> -->
						</ul>
					</div> --%>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function usersupplier(){
				$.post("supplierseleuser",
					function(data){
						if(data.result=="fail"){
							alert("请先添加公司信息");
							window.location.href="supplierIn";
						}else if(data.result=="seccuss"){
							window.location.href="userSupplierProduct";
						}else if(data.result=="login"){
							window.location.href="frontLogin";
						}
					}
				)
			}
		</script>
</header>