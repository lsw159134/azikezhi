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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/header.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/index.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/ST.css" />
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	
	<title>自可知</title>
	<meta name="save" content="history">
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
</head>
	<header>
		<div id="div"
			style="background-color: #E5E5E5; width: 1348px; margin-left: -75px;height: 30px">
			<div style="text-align: left; margin-left: 75px;padding-top: 4px">
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
		
		
</header>