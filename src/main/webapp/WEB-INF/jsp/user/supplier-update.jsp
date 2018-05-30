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
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link href="//cdn.bootcss.com/layer/2.4/skin/layer.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="user/supplier-load.css" />
<!--[if IE 6]>
		<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
</head>

<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		会员管理
		<span class="c-gray en">&gt;</span>
		修改公司资料
		<a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	<div class="page-container">
		<form action="supplierUpdate" method="post">
			<input type="hidden" name="supplieruuid" value="${sessionScope.supplieruid}" />
			<input type="hidden"  name="suppliername" value="${supplier.suppliername }"/>
			<table class="table table-border table-bordered table-bg" id="userinfo">
				<thead>
					<tr>
						<th colspan="3" scope="col">添加供应商</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="20%">公司名称:</td>
						<td width="60%"><input type="text" class="input-text" placeholder="请输入公司名称" value="${supplier.suppliername }" disabled/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>公司地址:</td>
						<td><input type="text" class="input-text" name="supplierposition" placeholder="请输入公司地址" required="required" value="${supplier.supplierposition}"/></td>
						<td class="left-border"></td>
					</tr>
					< tr>
						<td>电话:</td>
						<td><input type="text" class="input-text" name="telphone" placeholder="请输入电话号码" required="required" value='${supplier.telphone}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" class="input-text" name="telphone1" placeholder="请输入电话号码" value='${supplier.telphone1}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" class="input-text" name="telphone2" placeholder="请输入电话号码" value='${supplier.telphone2}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" class="input-text" name="telphone3" placeholder="请输入电话号码" value='${supplier.telphone3}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" class="input-text" name="telphone4" placeholder="请输入电话号码" value='${supplier.telphone4}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>手机号码:</td>
						<td><input type="text" class="input-text" name="cellphone" placeholder="请输入手机号码" value='${supplier.cellphone}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>传真:</td>
						<td><input type="text" class="input-text"  name="fax" placeholder="请输入传真" value='${supplier.fax}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>邮箱:</td>
						<td><input type="text" class="input-text" name="email" placeholder="请输入邮箱" value='${supplier.email}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>QQ:</td>
						<td><input type="text" class="input-text" name="qq" placeholder="请输入QQ" required="required" value='${supplier.qq}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td>QQ:</td>
						<td><input type="text" class="input-text" name="qq2" placeholder="请输入QQ" value='${supplier.qq2}'/></td>
						<td class="left-border"></td>
					</tr>
					<tr>
						<td colspan="2" id="submit"><input type="submit" class="button  button-primary button-rounded" value="提交"></input></td>
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
	<script src="user/supplier-update.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>