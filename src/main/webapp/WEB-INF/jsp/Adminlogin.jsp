<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>
<html lang="zh">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>后台登录页面</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<link rel="stylesheet" href="<%=basePath%>css/login.css">
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
</head>

<body>
	<div class="wrapper contents_wrapper">
		<div class="login">
			<div class="widget_header" style="width: 300px;">
				<h4 class="widget_header_title wwIcon i_16_login">登录</h4>
			</div>
			<div class="widget_contents lgNoPadding" style="width: 330px;">
				<form action="loginAction" method="post">
					<div class="line_grid">
						<div class="g_2 ">
							<span class="label">用户名:</span>
						</div>
						<div class="g_10 ">
							<input class="simple_field tooltip" type="text" placeholder="用户名" name="username">
						</div>
						<div class="clear"></div>
					</div>
					<div class="line_grid">
						<div class="g_2">
							<span class="label">密&nbsp;码:</span>
						</div>
						<div class="g_10">
							<input class="simple_field tooltip" type="password" placeholder="密码" name="password">
						</div>
						<div class="clear"></div>
					</div>
					<div class="line_grid">
						<div class="g_6">
							<input class="submitIt simple_buttons" value="提交" type="submit">
						</div>
						<div class="clear"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var id='${ip}'
			if(id=='ip'){
				alert("请在特定ip下登录");
			}
		})
	</script> 
</body>

</html>