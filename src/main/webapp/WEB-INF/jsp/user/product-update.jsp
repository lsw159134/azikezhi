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
<meta charset="utf-8" />
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
<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>我的桌面</title>
</head>

<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		会员管理
		<span class="c-gray en">&gt;</span>
		上传型号
		<a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="page-container">
		<span id="choose">
			<!--
			<input type="hidden" id="supplier" value=""/>
			<input type="hidden" id="qq" value=""/>
			<input type="hidden" id="description" value="" />
			-->
		</span>
		<br /> <br />
		<form method="post" action="productUpdate">
			<table class="table table-border table-bordered table-bg">
				<thead>
				<tr class="text-c">
					<th>产品</th>
					<th>生产厂商</th>
					<th>封装</th>
					<th>批号</th>
					<th>价格</th>
					<th>交易说明</th>
					<th>数量</th>
					<th>质量</th>
				</tr>
				</thead>
				<tbody>
				<tr class="text-c">
					<input type="hidden" name="productuuid" value="${product.productuuid}">
					<td><input type="text" class="input-text product" placeholder="请输入产品" value="${product.product}" disabled/></td>
					<td><input type="text" class="input-text manufacturer" placeholder="请输入生产厂商" name="manufacturer" value="${product.manufacturer}" required="required"/></td>
					<td><input type="text" class="input-text encapsulation" placeholder="请输入封装" name="encapsulation"  value="${product.encapsulation}" required="required"/></td>
					<td><input type="text" class="input-text lotnumber" placeholder="请输入批号" name="lotnumber" value="${product.lotnumber}" required="required"/></td>
					<td><input type="text" class="input-text price" placeholder="请输入价格" name="price" value="${product.price}" required="required"/></td>
					<td><input type="text" class="input-text explain" placeholder="请输入交易说明" name="description" value="${product.description}" required="required"/></td>
					<td>
						<input type="text" name="isgoodsinstock" class="goodinstock input-text" required="required" placeholder="请输入产品数量" value="${product.isgoodsinstock}">
						<%--<select name="goodinstock" class="goodinstock">--%>
						<%--<option value="1" <c:if test="${product.isgoodsinstock==1}">selected</c:if>>有现货</option>--%>
						<%--<option value="0">没有现货</option>--%>
					<%--</select>--%>
					</td>
					<td><select class="quality" name="quality">
						<option value="27" <c:if test="${product.quality <= 30}">selected</c:if> >非原装</option>
						<option value="17" <c:if test="${product.quality<=20}">selected</c:if> >国产仿制</option>
						<option value="7" <c:if test="${product.quality<=10}">selected</c:if>>原装</option>
					</select></td>
					<td class="left-border"></td>
				</tr>
				<tr>
					<td colspan="7" id="submit"><input type="submit" class="button  button-primary button-rounded" value="提交" /></td>
				</tr>
				</tbody>
			</table>
		</form>
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
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
	<%--<script src="user/product-upload.js" type="text/javascript" charset="utf-8"></script>--%>
</body>

</html>