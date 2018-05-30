<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="0">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
			<script type="text/javascript" src="lib/html5.js"></script>
			<script type="text/javascript" src="lib/respond.min.js"></script>
			<script type="text/javascript" src="lib/PIE_IE678.js"></script>
		<![endif]-->
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<!--[if IE 6]>
			<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
			<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>查看上传历史</title>
</head>

<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		会员管理
		<span class="c-gray en">&gt;</span>
		上传历史
		<a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="r">
				共有数据：<strong>${product.size()}</strong> 条
			</span>
		</div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th>产品</th>
						<th>生产厂商</th>
						<th>封装</th>
						<th>批号</th>
						<th>价格</th>
						<th>交易说明</th>
						<th>修改</th>
						<!--<th>操作</th>-->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${product}" var="items" varStatus="varproduct">
					<tr class="text-c">
						<td>${items.product}</td>
						<td>${items.manufacturer}</td>
						<td>${items.encapsulation}</td>
						<td>${items.lotnumber}</td>
						<td>${items.price}</td>
						<td>${items.description}</td>
						<!--<td>
							<a style="text-decoration:none" class="ml-5" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
						</td>-->
						<td><a href="productUpdate?productuid=${items.productuuid}">修改</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<footer class="footer mt-20">
		<div class="container">
			<p>
				版权所有 &copy; 2016 在芯间 保留所有权利 |
				<a href="http://www.miibeian.gov.cn/">
					<img src="img/img/icp.png" />
					粤ICP备15008173号-2
				</a>
				|
			</p>
		</div>
	</footer>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/lib/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$('.table-sort').dataTable({
		//				"aaSorting": [
		//					[1, "desc"]
		//				], //默认第几个排序
		//				"iDisplayLength": 10,
		//				"bStateSave": true, //状态保存
		//				"aoColumnDefs": [
		//					//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		//					{
		//						"orderable": false,
		//						"aTargets": [0, 8]
		//					} // 不参与排序的列
		//				]
		});
	</script>
</body>

</html>