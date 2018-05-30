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
<%
    if (header.equals("pay")) {
%>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="css/css/header.css" />
	<link rel="stylesheet" type="text/css" href="css/css/index.css" />
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<title>自可知</title>
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
</head>
	<%
    }
	%>
	<header style="width: 1200px">
		<div id="div"
			style="background-color: #E5E5E5; width: 1200px;height: 30px">
			<div style="text-align: left; margin-left: 10px;padding-top: 2px">
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
			<div id="regLogin" style="margin-top: -40px; text-align:right;width:500px">
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
					<a href="javascript:;" onclick="usersupplier()">
						免费上传库存
					</a>
				</span>
				<%-- <span> <img src="<%=basePath%>img/contactus.png" /> <a style="color: black;" href="aboutus">联系我们</a></span> --%>
				<span><img src="logo/userout.png"><a style="color: black;" href="userOut">&nbsp退出</a></span>	
			</div>
				
		<div  id="banner" style="background-color: white;width: 1200px">
			<span <%=header.equals("pay") ? "id='active'" : ""%>> 
				<a href="<%=basePath%>">
					首页
				</a>
			</span>
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