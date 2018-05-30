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
<!doctype html>
<html lang="zh">

	<head>
		<meta charset="UTF-8" />
		<title>搜索内容</title>
		<link rel="stylesheet" href="<%=basePath %>css/index.css">
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
		<style type="text/css">
			a:hover{ text-decoration: none} 
		</style>
		<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
	</head>

	<body style="background: #F1F1F1">
		<div class="container" style="background: #F1F1F1">
			<div class="row  aaaaaa" style="margin-left: 160px;margin-top: 20px;">
				<span style="font-size: 16px;">未付款总订单（${status1}）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 16px;">待审核总订单（${status6}）</span>
				<br>
				<span style="font-size: 16px;color: red;">已取消总订单（${status5}）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size: 16px;color: blue;font-weight: bold;">已完成总订单（${status4}）</span>
				<br>
				<span style="font-size: 16px;color: green;font-weight: bold;">已发货总订单（${status3}）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		<span style="font-size: 16px;">已付款总订单（${status2}）</span>
			</div>
			<hr />
			<div class="row">
				<form action="seleByIP" method="post" style="float: left;">
	    			<input type="text" class="list-group-item list-group-item-success" style="height: 32px;margin-right: 10px;float: left;" name="ip" placeholder="IP">
	    			<input type="submit" class="btn radius btn-primary size-S" value="搜素">
	    		</form>
				<form action="updateByIPguoLv" method="post" style="float: right;margin-right: 80px;">
	    			<input type="text" class="list-group-item list-group-item-success" style="height: 32px;margin-right: 10px;float: left;" name="ip_ip" placeholder="IP">
	    			<input type="submit" class="btn radius btn-primary size-S" value="过滤">
	    		</form>
			</div>
			<br>
			<div class="row">
				<div class="col-md-4 bg-primary" style="border: 1px solid #3A006F;background: #3A006F">
					<h3>最新搜索</h3>
				</div>
				<div class="col-md-4 bg-primary" style="border: 1px solid #3A006F;background: #3A006F">
					<h3>搜索时间</h3>
				</div>
				<div class="col-md-4 bg-primary" style="border: 1px solid #3A006F;background: #3A006F">
					<h3>IP</h3>
				</div>
			</div>
			
			<c:forEach items="${search}" var="content" varStatus="status">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid #3A006F;">
						<h3><a target="_blank" href="<%=contextPath %>/search?keyword=${content.content}">${content.content}</a></h3>
					</div>
					<div class="col-md-4" style="border: 1px solid #3A006F;">
						<h3><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${content.time}"/></h3> 
					</div>
					<div class="col-md-4" style="border: 1px solid #3A006F;">
						<h3>${content.ip }</h3>
					</div>
				</div>	
			</c:forEach>
		</div>
	</body>
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		$.post('<%=basePath%>1019/zai/xin/jian/queryByExpressByStatus',function(data){
			if(data.result=="fail"){
			}else if(data.result=="seccuss"){
				layer.alert("有"+data.msg+"个未审核订单", {icon : 6})
			}
		});
	})
	</script>
</html>