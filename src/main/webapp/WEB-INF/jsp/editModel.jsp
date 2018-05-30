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
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta charset="UTF-8">
<title>在芯间-电子元器件查询平台</title>
<link rel="stylesheet" href="<%=basePath %>css/index.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jqPaginator.js"></script>
<style type="text/css">
			a:hover{ text-decoration: none} 
</style>
<script type="text/javascript">
	/*$(function() {
	
		$("[data-toggle='popover']").popover({
			html: true,
			delay: {show: 10, hide: 1000}
		});

		//分页
		var currentpage = $("#currentpage").val();
		if(currentpage == ""){
			currentpage = 1;
		}

		currentpage = parseInt(currentpage);
		$.jqPaginator('#pagination', {
	        totalPages: ${pageSize},
	        visiblePages: 10,
	        currentPage: currentpage,
	        first: '<li class="first"><a href="<%=basePath%>">首页</a></li>',
	        last: '<li class="last"><a href="<%=basePath%>1019/zai/xin/jian/?page=${pageSize}">尾页</a></li>',
	        page: '<li class="page"><a href="<%=basePath%>1019/zai/xin/jian/?page={{page}}">{{page}}</a></li>',
	        onPageChange: function (num, type) {
	        	if(type == "change"){
	        		window.location.href="<%=basePath%>1019/zai/xin/jian/addProductindex?page="+num;
	        	}
        	}
    		});
		});
		*/
</script>
</head>

<body>
		<div class="topmenu">
		<div class="menu">
			<ul>
				<li><a href="javascript:void(0)">客户服务</a></li>
				<li><a href="javascript:void(0)">收藏</a></li>
			</ul>
		</div>
	</div>
	<!--头部内容-->
	<div class="header" style="height:20px">
			<h3 class="logo">
            <a href="<%=basePath%>" title="回到首页" style="position:relative; display:block">
         		<span style="font-size: 25px;font-family:'微软雅黑';color: #CC0000;font-weight:bold">在芯间-最专业电子查询平台</span>
            </a>
        </h3>

			<div class="server">
				<span style="font-family: '微软雅黑';font-size: 20px;">微信:</span>
				<img src="<%=basePath%>img/QRcode.png" style="width: 100px;"/>
			</div>
			<div class="clear"></div>
			<div class="nav">
				<ul class="nav_menu">
					<li class="active">
						<a href="<%=basePath%>">首页</a>
					</li>
					<li id="supplier" class="batch_query link">
						<a href="javascript:void(0)">供应商</a>
					</li>
					<!-- 
					<li id="homemarket" class="link">
						<a href="javascript:void(0)">资料</a>
						<div class="icon"></div>
					</li> -->
				</ul>
			</div>
		</div>
	<!--搜索-->
	<header>
		<form method="GET" class="form-inline" id="form" action="?">
			<div class="form-group">
				<input type="search" class="form-control input-lg" placeholder="搜索" id="keyword" name="keyword" />
			</div>
			<input type="button" class="btn btn-primary btn-lg" value="搜索" id="search"/> 
				<%-- <input type="button"
					class="btn btn-primary btn-lg" value="搜商家" id="searchSupplier"
					name="supplier" />
				 --%>
		</form>
	</header>
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<!--模式选择-->
		<div class="navbar navbar-default" id="navigationBar">
			<ul class="nav navbar-nav">
				<li><a href="javascript:void(0)" class="model"
					style="padding-right: 0px;">型号</a></li>
				<li><a href="javascript:void(0)" class="encapsulation"
					style="padding-right: 0px;">封装</a></li>
				<li><a href="javascript:void(0)" class="manufacturer"
					style="padding-right: 0px;">厂商</a></li>
				<li><a href="javascript:void(0)" class="appraise"
					style="padding-right: 0px;">资料</a></li>
				<li><a href="javascript:void(0)" class="exchange"
					style="padding-right: 0px;">说明</a></li>
				<li><a href="javascript:void(0)" class="complaint"
					style="padding-right: 15px;width:100px;">替代型号</a></li>
				<li><a href="javascript:void(0)" class="storehouse"
					style="padding-right: 0px;">图片</a></li>
				<li><a href="javascript:void(0)" class="price"
					style="width:270px">描述</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px;">修改</a></li>
			</ul>
		</div>
		<!--搜索结果-->
		<div class="navbar navbar-default list">
		</div>
		<!--<nav>
			<ul class="pagination pagination-lg">
				<li><a href="index?page=1">首页</a></li>
				<c:forEach var="page" begin="1" end="${pageSize}">
					<li><a href="index?page=${page }">${page}</a></li>
				</c:forEach>
				<li><a href="index?page=${pageSize }">尾页</a></li>
			</ul>
		</nav>-->
		<input type="hidden" value="${param.page}" id="currentpage"/>
		<ul class="pagination" id="pagination"></ul>
	</div>
</body>

<script type="text/javascript">
$(document).ready(function() {
	$("#search").click(function() {
		var modelName = $("#keyword").val();
		$.ajax({
			type: "get",
			contentType: "application/json; charset=utf-8",
			url: "<%=basePath%>1019/zai/xin/jian/searchModel?modelName=" + modelName,
			dataType: "json",
			async: true,
			success:function(data){
				for(var i = 0; i < data.size; i++){
					$(".list").append("<ul class='record nav navbar-nav' id='item"+i+"'>")
					if(i < data.size/2){
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='model'>"+data.data[i].model+"</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='encapsulation'>"+data.data[i].encapsulation+"</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='manufacturer'>"+data.data[i].firm+"</a></li>");
						$("#item"+i+"").append("<li><a href='<%=basePath%>"+data.data[i].material+"' class='appraise' target='_blank'>资料</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='exchange'>"+data.data[i].explanation+"</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='complaint' style='width:100px;'>"+data.data[i].replacement+"</a></li>");
						$("#item"+i+"").append("<li><a href='<%=basePath%>"+data.data[i].photo+"' class='storehouse' target='_blank'>图片</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='price' style='width:270px'>"+data.data[i].synopsis+"</a></li><ul>");
						$("#item"+i+"").append("<li><a href='updatemodel?uid="+data.data[i].modeluuid+"'>修改</a></li><ul>");
					}else{
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='model'>"+data.data[i].model+"</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='encapsulation'>"+data.data[i].encapsulation+"</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='manufacturer'>"+data.data[i].firm+"</a></li>");
						$("#item"+i+"").append("<li><a href='<%=basePath%>"+data.data[i].material+"' class='appraise' target='_blank'>资料</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='exchange'>"+data.data[i].explanation+"</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='complaint' style='width:100px;'>"+data.data[i].replacement+"</a></li>");
						$("#item"+i+"").append("<li><a href='<%=basePath%>"+data.data[i].photo+"' class='storehouse' target='_blank'>图片</a></li>");
						$("#item"+i+"").append("<li><a href='javascript:void(0)' class='price' style='width:270px'>"+data.data[i].synopsis+"</a></li><ul>");
						$("#item"+i+"").append("<li><a href='updatemodel?uid="+data.data[i].modeluuid+"'>修改</a></li><ul>");
					}
				}
				//当内容有很多时大于6条数据时，不允许添加内容
				if(data.size > 6){
					$(".choose").attr("disabled",true); 
				}
			}
		});
		/*
		$(document).on("click",".choose",function(){
			$("#model").val($(this).siblings(".model").val());
			$("#encapsulation").val($(this).siblings(".encapsulation").val());
			$("#firm").val($(this).siblings(".firm").val());
		});
		*/
	});
});
</script>
</html>