<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/angular.js"></script>
<script src="<%=basePath%>js/tooltip.js"></script>
<script src="<%=basePath%>js/jQuery.print.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/tooltip.css?2018011501" />
<style>
body {
	margin: 0 auto;
}

a:HOVER {
	text-decoration: none;
}

table input {
	border: 1px #DDDDDD solid;
	padding: 5px 10px 5px 10px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

table input:hover {
	border-color: #CD6600;
}

table select {
	width: 153px;
	padding: 5px 10px 5px 10px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

table select:hover {
	border-color: #CD6600;
}

table textarea {
	padding: 5px 10px 5px 10px;
	min-width: 700px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

table textarea:hover {
	border-color: #CD6600;
}

.g_product, .pihao {
	width: 230px;
}

.table1 th, .table1 td {
	text-align: center;
}

.yuanback {
	border-radius: 50%;
	background-color: #1296D8;
	padding: 5px 8px;
	display: inline-block;
	text-align: center;
}

.yuanback1 {
	border-radius: 50%;
	background-color: red;
	padding: 5px 7px 5px 8px;
	display: inline-block;
	text-align: center;
}

.yuanback2 {
	border-radius: 50%;
	background-color: #4D994D;
	padding: 5px 7px 5px 8px;
	display: inline-block;
	text-align: center;
}

.kctr td {
	height: 50px;
	vertical-align: middle !important;
}

.theme-popover-mask {
	z-index: 9998;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.4;
	filter: alpha(opacity = 40);
	display: none
}

.theme-popover {
	z-index: 9999;
	position: fixed;
	top: 40%;
	left: 40%;
	width: 1130px;
	height: 560px;
	margin: -180px 0 0 -330px;
	border-radius: 5px;
	border: solid 2px #666;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
	overflow: auto;
}

.theme-popoverx {
	z-index: 9999;
	position: fixed;
	top: 40%;
	left: 40%;
	width: 1130px;
	height: 560px;
	margin: -180px 0 0 -330px;
	border-radius: 5px;
	border: solid 2px #666;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
	overflow: auto;
}

.theme-closex {
	float: right;
	color: #999;
	padding: 5px;
	margin: -2px -5px -5px;
	font: bold 14px/14px simsun;
	text-shadow: 0 1px 0 #ddd
}

.theme-popover1 {
	z-index: 9999;
	position: fixed;
	top: 40%;
	left: 40%;
	width: 1130px;
	height: 560px;
	margin: -180px 0 0 -330px;
	border-radius: 5px;
	border: solid 2px #666;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
	overflow: auto;
}

.theme-close1 {
	float: right;
	color: #999;
	padding: 5px;
	margin: -2px -5px -5px;
	font: bold 14px/14px simsun;
	text-shadow: 0 1px 0 #ddd
}

.theme-close {
	float: right;
	color: #999;
	padding: 5px;
	margin: -2px -5px -5px;
	font: bold 14px/14px simsun;
	text-shadow: 0 1px 0 #ddd
}

.theme-close:hover {
	color: #444;
}

.xstabletr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

.xstabletr td {
	height: 30px;
	vertical-align: middle !important;
	text-align: center;
	background-color: white;
}

.xiaoshoutr td {
	height: 40px;
	vertical-align: middle !important;
	text-align: center;
}

.xstabletr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

/*---滚动条默认显示样式--*/
::-webkit-scrollbar-thumb {
	background-color: #C1C1C1;
	height: 50px;
	outline-offset: -2px;
	outline: 2px solid #C1C1C1;
	-webkit-border-radius: 4px;
	border: 2px solid #C1C1C1;
}
/*---鼠标点击滚动条显示样式--*/
::-webkit-scrollbar-thumb:hover {
	background-color: #8B8878;
	height: 50px;
	-webkit-border-radius: 4px;
}
/*---滚动条大小--*/
::-webkit-scrollbar {
	width: 12px;
	height: 8px;
}
/*---滚动框背景样式--*/
::-webkit-scrollbar-track-piece {
	background-color: #F1F1F1;
	-webkit-border-radius: 0;
}

#mcTooltipWrapper {
	display: none;
}
</style>
</head>
<body ng-app="myApp" ng-controller="myController">
	<div class="container" style="margin: 20px 0 0px 0"></div>
	<div class="container" style="text-align: center;">
		<c:if test="${stockall eq 'stockall'}">
			<div class="row">
				<div class="col-md-12" style="text-align: left; padding-left: 30px;">
					<button type="button"
						class="btn btn-primary glyphicon glyphicon-home gohome"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: black; border-color: black;"
						title="库存管理首页">库存管理</button>
					&emsp;
					<button id="xiaoshouAll"
						class="btn btn-primary button9 glyphicon glyphicon-rub"
						style="padding-top: 4px; height: 30px; background: #912CEE;">订单管理</button>
					&emsp;
					<button id="churu"
						class="btn btn-primary button9 glyphicon glyphicon-log-out"
						style="padding-top: 4px; height: 30px; background: #912CEE;">出/入库记录</button>
					&emsp;
					<!-- <button type="button" class="btn btn-primary button7 jiakucun glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加仓库">添加仓库</button> -->
				</div>
			</div>
		</c:if>
		<c:if test="${xiaoshouall eq 'xiaoshouall'}">
			<div class="row">
				<div class="col-md-12" style="text-align: left; padding-left: 30px;">
					<button type="button"
						class="btn btn-primary button9 glyphicon glyphicon-home gohome"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #912CEE; border-color: #912CEE;"
						title="库存管理首页">库存管理</button>
					&emsp;
					<button class="btn btn-primary glyphicon glyphicon-rub"
						style="padding-top: 4px; height: 30px; background: black;">订单管理</button>
					&emsp;
					<button id="churu"
						class="btn btn-primary glyphicon glyphicon-log-out"
						style="padding-top: 4px; height: 30px; background: #912CEE;">出/入库记录</button>
					&emsp;
					<!-- <button type="button" class="btn btn-primary button7 jiakucun glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加仓库">添加仓库</button> -->
				</div>
			</div>
		</c:if>
		<c:if test="${rkreportall eq 'rkreportall'}">
			<div class="row">
				<div class="col-md-12" style="text-align: left; padding-left: 30px;">
					<button type="button"
						class="btn btn-primary button9 glyphicon glyphicon-home gohome"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #912CEE; border-color: #912CEE;"
						title="库存管理首页">库存管理</button>
					&emsp;
					<button id="xiaoshouAll"
						class="btn btn-primary glyphicon glyphicon-rub"
						style="padding-top: 4px; height: 30px; background: #912CEE;">订单管理</button>
					&emsp;
					<button id="churu"
						class="btn btn-primary glyphicon glyphicon-log-out"
						style="padding-top: 4px; height: 30px; background: black;">出/入库记录</button>
					&emsp;
					<!-- <button type="button" class="btn btn-primary button7 jiakucun glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加仓库">添加仓库</button> -->
				</div>
			</div>
		</c:if>
		<c:if test="${diaohuo eq 'diaohuo' }">
			<div class="row">
				<div class="col-md-12" style="text-align: left; padding-left: 30px;">
					<button type="button"
						class="btn btn-primary glyphicon glyphicon-home gohome"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #912CEE; border-color: #912CEE;"
						title="库存管理首页">库存管理</button>
					&emsp;
					<button id="xiaoshouAll"
						class="btn btn-primary button9 glyphicon glyphicon-rub"
						style="padding-top: 4px; height: 30px; background: #912CEE;">订单管理</button>
					&emsp;
					<button type="button"
						class="btn btn-primary glyphicon glyphicon-plus"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: black; border-color: black;"
						title="库存调货">库存调货</button>
				</div>
			</div>
			<div class="container" style="margin-top: 15px;">
				<div class="row">
					<div class="col-md-12">
						<table
							class="table1 table table-bordered table-hover table-responsive"
							style="text-align: center; border-collapse: collapse; width: 1100px;"
							cellspacing="0" cellpadding="0">
							<tr class="kctr">
								<th style="vertical-align: middle !important;">型号</th>
								<td style="vertical-align: middle !important;">${s.stock_product }</td>
								<th style="vertical-align: middle !important;">品牌</th>
								<td style="vertical-align: middle !important;">${s.stock_brand }</td>
								<th style="vertical-align: middle !important;">封装</th>
								<td style="vertical-align: middle !important;">${s.stock_package }</td>
							</tr>
							<tr class="kctr">
								<th style="vertical-align: middle !important;">批号</th>
								<td style="vertical-align: middle !important;" class="pihao">${s.stock_lotnumber }</td>
								<th style="vertical-align: middle !important;">数量</th>
								<td style="vertical-align: middle !important;"><input
									type="number" id="dhnumber" value="${s.stock_number }"
									placeholder="数量" min="0"
									style="text-align: center; width: 100px; color: #CD8500; font-weight: bold;">
								</td>
								<th style="vertical-align: middle !important;">进货单价</th>
								<td
									style="vertical-align: middle !important; color: #9B86FB; font-weight: bold;"
									class="chengben">${s.stock_price }</td>
							</tr>
							<tr class="kctr">
								<th style="vertical-align: middle !important;">总计金额</th>
								<td class="money"
									style="vertical-align: middle !important; color: #FC7947; font-weight: bold;">${s.stock_price*s.stock_number }</td>
								<th style="vertical-align: middle !important;">仓库</th>
								<td style="vertical-align: middle !important;"><b>${s.stock_position}</b>&ensp;<span
									class="glyphicon glyphicon-log-out" style="color: red;"></span>&ensp;
									<select name="stock_position" id="dhstock_position"
									style="width: 100px;">
										<c:if test="${s.stock_position ne '柜台' }">
											<option value="柜台">柜台</option>
										</c:if>
										<c:if test="${s.stock_position ne '公司' }">
											<option value="公司">公司</option>
										</c:if>
										<c:if test="${s.stock_position ne '仓库' }">
											<option value="仓库">仓库</option>
										</c:if>
								</select></td>
								<th style="vertical-align: middle !important;">品质</th>
								<td style="vertical-align: middle !important;"
									class="cb_quality">${s.stock_quality}</td>
							</tr>
							<tr class="kctr">
								<th style="vertical-align: middle !important;">供应商</th>
								<td style="vertical-align: middle !important;"
									class="cb_supplier">${s.stock_supplier }</td>
								<th style="vertical-align: middle !important;">详细位置</th>
								<td style="vertical-align: middle !important;" colspan="3">
									${s.stock_address}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<button id="diaohuo" type="button" class="btn btn-primary button5"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8;"
						title="添加当前库存">确认</button>
					<button id="nodiaohuo" type="button"
						class="btn btn-primary button6"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #FD3D3D; border-color: #FD3D3D;"
						title="取消添加库存">取消</button>
				</div>
			</div>
		</c:if>
		<div id="upkucun" style="margin-top: 10px; display: none;">
			<div class="row">
				<div class="col-md-12">
					<table
						class="table1 table table-bordered table-hover table-responsive"
						style="text-align: center; border-collapse: collapse; width: 1100px;"
						cellspacing="0" cellpadding="0">
						<tr class="kctr">
							<th style="vertical-align: middle !important;">型号</th>
							<td style="vertical-align: middle !important;"><input
								type="hidden" id="upstock_id"> <input type="text"
								id="upstock_product" class="product" value=""
								name="stock_product"
								style="text-align: center; width: 140px; text-transform: uppercase;">
							</td>
							<th style="vertical-align: middle !important;">品牌</th>
							<td style="vertical-align: middle !important;"><input
								type="text" id="upstock_brand" class="brand" value=""
								name="stock_brand"
								style="text-align: center; width: 140px; text-transform: uppercase;">
							</td>
							<th style="vertical-align: middle !important;">封装</th>
							<td style="vertical-align: middle !important;"><input
								type="text" id="upstock_package" class="package" value=""
								name="stock_package"
								style="text-align: center; width: 140px; text-transform: uppercase;">
							</td>
						</tr>
						<tr class="kctr">
							<th style="vertical-align: middle !important;">批号</th>
							<td style="vertical-align: middle !important;"><input
								type="text" id="upstock_lotnumber" class="pihao" value=""
								style="text-align: center; width: 100px;"></td>
							<th style="vertical-align: middle !important;">数量</th>
							<td style="vertical-align: middle !important;"><input
								type="number" id="upstock_number" class="number" value="0"
								style="text-align: center; width: 100px;" placeholder="数量"
								min="0"></td>
							<th style="vertical-align: middle !important;">进货单价</th>
							<td style="vertical-align: middle !important;"><input
								type="number" id="upstock_price" class="chengben" value="0"
								style="text-align: center; width: 100px;" placeholder="进货单价"
								min="0"></td>
						</tr>
						<tr class="kctr">
							<th style="vertical-align: middle !important;">库存所在</th>
							<td style="vertical-align: middle !important;"><select
								name="stock_position" id="upstock_position"
								style="width: 100px;">
							</select></td>
							<th style="vertical-align: middle !important;">品质</th>
							<td style="vertical-align: middle !important;"><select
								name="cb_quality" id="upstock_quality" style="width: 100px;">
							</select></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<button id="uptijiao" type="button" class="btn btn-primary button5"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8;"
						title="修改当前型号">确认</button>
					<button id="noupkucun" type="button"
						class="btn btn-primary button6"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #FD3D3D; border-color: #FD3D3D;"
						title="取消修改型号">取消</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container"
		style="text-align: center; margin-top: 50px; padding-left: 30px;">
		<div class="row">
			<c:if
				test="${rkreportall ne 'rkreportall' && xiaoshouall ne 'xiaoshouall'}">
				<div class="col-md-4" style="text-align: left;">
					<button type="button"
						class="btn btn-primary btn-sm button7 addbutton glyphicon glyphicon-plus theme-login"
						data-toggle="modal" data-target="#myModal"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8;"
						title="点击添加型号">添加库存</button>
					&emsp;
				</div>
				<div class="col-md-8" style="text-align: left;">
					<div class="form-group">
						<div class="input-group">
							<input type="text"
								style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 280px; padding-left: 20px;"
								placeholder="型号" id="product" name="product" value="${sousuo }"
								style="text-transform:uppercase;">&emsp;&emsp;
							<button id="sousuo" class="btn btn-primary"
								style="padding-top: 4px; height: 30px; background: #912CEE">
								搜索</button>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${rkreportall eq 'rkreportall' }">
				<div class="col-md-12" style="text-align: center;">
					<div class="form-group">
						<div class="input-group">
							<input type="text"
								style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 220px; padding-left: 20px;"
								placeholder="型号" id="product" name="product"
								value="${sousuork }" style="text-transform:uppercase;">&emsp;&emsp;
							<button id="sousuork" class="btn btn-primary"
								style="padding-top: 4px; height: 30px;">搜索</button>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${xiaoshouall eq 'xiaoshouall' }">
				<div class="col-md-2" style="text-align: left;">
					<button type="button"
						class="btn btn-primary btn-sm button7 addbutton glyphicon glyphicon-jpy theme-login1"
						data-toggle="modal" data-target="#myModal"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8;"
						title="点击添加型号">添加订单</button>
				</div>
				<div class="col-md-10" style="text-align: center;">
					<div class="form-group">
						<div class="input-group">
							<input type="text"
								style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 220px; padding-left: 20px;"
								placeholder="可搜索客户，电话" id="product" name="product"
								value="${sousuoxs }" style="text-transform:uppercase;">&emsp;&emsp;
							<button id="sousuoxs" class="btn btn-primary"
								style="padding-top: 4px; height: 30px;">搜索</button>
						</div>
					</div>
				</div>
			</c:if>
			<div class="col-md-6" style="text-align: left; padding-top: 12px;">
				<c:if test="${not empty stockcount }">
					<c:forEach items="${stockcount }" var="stockcount">
						<span style="font-size: 13px; color: blue; font-weight: bold;">${stockcount.stock_position }总库存：${stockcount.stock_number }</span>
						&emsp;
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<c:if test="${stockall eq 'stockall' || diaohuo eq 'diaohuo' }">
		<div class="container" style="margin-top: -10px;">
			<div class="row">
				<div class="col-md-12" style="padding-left: 30px;">
					<table
						class="table1 table table-bordered table-hover table-responsive"
						style="text-align: center; border-collapse: collapse; width: 1100px;"
						cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th style="border: none;">序号</th>
								<th style="border: none;">型号</th>
								<th style="border: none;">品牌</th>
								<th style="border: none;">封装</th>
								<th style="border: none;">包装</th>
								<th style="border: none;">批号</th>
								<th style="border: none;">质量</th>
								<th style="border: none;">数量</th>
								<th style="border: none;">进货单价</th>
								<th style="border: none;">库存所在</th>
								<th style="border: none;">时间</th>
								<th style="border: none;" width="120px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${stock }" var="kclist" varStatus="kcst">
								<tr class="kctr" style="cursor: pointer;"
									onmouseover="tooltip.pop(this, '#sub${kcst.count }', {position:0, offsetX:0,offsetY:20,calloutPosition: 0.1,effect:'slide'})">
									<td>${kcst.count }</td>
									<td>${kclist.stock_product }
										<div style="display: none;">
											<div id="sub${kcst.count }">
												<b style="color: #9B30FF"> 供应商：</b><br> <b
													style="color: #9B30FF">${kclist.stock_supplier}</b><br>
												<b style="color: #1E90FF">${kclist.stock_address}</b><br>
											</div>
										</div>
									</td>
									<td>${kclist.stock_brand }</td>
									<td>${kclist.stock_package }</td>
									<td>${kclist.stock_baozhuangnum }<b
										style="color: #FF8C00;">${kclist.stock_danwei1 }</b> / <b
										style="color: #1E90FF;">${kclist.stock_danwei2 }</b></td>
									<td>${kclist.stock_lotnumber }</td>
									<td>${kclist.stock_quality}</td>
									<td>${kclist.stock_number }</td>
									<td>${kclist.stock_price }</td>
									<td>${kclist.stock_position }</td>
									<td><fmt:formatDate value="${kclist.stock_addtime}"
											pattern="yyyy/MM/dd HH:mm" /></td>
									<td width="120px"><a class="bianji"
										onclick="updateproduct('${kclist.stock_id }',
												'${kclist.stock_product }','${kclist.stock_brand }',
												'${kclist.stock_package }','${kclist.stock_lotnumber }',
												'${kclist.stock_quality }','${kclist.stock_number }','${kclist.stock_price }','${kclist.stock_position }')"
										title="修改型号"> <span
											class="glyphicon glyphicon-edit bianji1" aria-hidden="true"></span>
									</a> <%-- 	<a class="tianjia" href="guitai_kucun?product=${kclist.stock_product }&&pid=${kclist.stock_id }&&pinpai=${kclist.stock_brand }&&fengzhuang=${kclist.stock_package }&&tianjia=tianjia&page=${page}&rows=10&sousuo=${sousuo}" title="添加出库信息" >
												<span class="glyphicon glyphicon-plus shanchu1" aria-hidden="true"></span>
											</a> --%> <a class="diaohuo"
										href="sele_diaohuo?id=${kclist.stock_id }" title="我要调库">
											<span class="glyphicon glyphicon-log-out shanchu1"
											aria-hidden="true"></span>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4" style="padding-left: 30px; width: 410px;">
					<div ng-cloak>
						<nav aria-label="Page navigation" class="clearfix">
							<ul class="pagination pagination-sm pagination1 fr"
								style="margin: 0">
								<li ng-class="{disabled:page==1}"><a
									<c:if test="${page > 1 }">href="stockAll?page=${page-1 }&&rows=10"</c:if>
									aria-label="Previous" ng-click="sub(${page-1 }<1?1:${page-1 })"
									ng-disabled="page==1"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li ng-if="page >= pageNum && lastPage !== pageNum"
									ng-click="sub(1)" ng-class="{active:item==1}"><a
									href="stockAll?page=1&&rows=10">1</a></li>
								<li ng-if="page >= pageNum && lastPage !== pageNum"><a
									href="javascript:void(0)">...</a></li>
								<li ng-click="sub(item)" ng-class="{active:item==page}"
									ng-repeat="item in pages"><a
									href="stockAll?page={{item}}&&rows=10">{{item}}</a></li>
								<li
									ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum">
									<a href="javascript:void(0)">...</a>
								</li>
								<li
									ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum"
									ng-click="sub(lastPage)" ng-class="{active:item==page}"><a
									href="stockAll?page={{lastPage}}&&rows=10&">{{lastPage}}</a></li>
								<li ng-class="{disabled:page==lastPage}"><a
									<c:if test="${page < count }">href="stockAll?page=${page+1 }&&rows=10"</c:if>
									aria-label="Next"
									ng-click="sub(${page+1 }>lastPage?page:${page+1 })"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-md-4" style="height: 30px; line-height: 30px;">
					总共 <span style="font-weight: bold; color: red;">${total }</span>
					条数据&emsp; <input type="text"
						style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 60px; text-align: center; display: inline-block;"
						id="pagemove2" class="form-control" name="pagemove"
						value="${page }">
					<button id="buttonmove2" class="btn btn-primary button2"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: green; border-color: green;"
						title="输入数字，随芯跳转">跳转</button>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${rkreportall eq 'rkreportall' }">
		<div class="container" style="margin-top: 15px;">
			<div class="row">
				<div class="col-md-12" style="padding-left: 30px;">
					<table
						class="table1 table table-bordered table-hover table-responsive"
						style="text-align: center; border-collapse: collapse; width: 1100px;"
						cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th style="border: none;">序号</th>
								<th style="border: none;">型号</th>
								<th style="border: none;">品牌</th>
								<th style="border: none;">封装</th>
								<th style="border: none;">批号</th>
								<th style="border: none;">质量</th>
								<th style="border: none;">数量(±)</th>
								<th style="border: none;">单价</th>
								<th style="border: none;">存放位置</th>
								<th style="border: none; width: 100px;">出/入库方式</th>
								<th style="border: none;">出/入库时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rkreport }" var="rkreport" varStatus="kcst">
								<tr class="kctr" style="cursor: pointer;"
									onmouseover="tooltip.pop(this, '#sub${kcst.count }', {position:0, offsetX:0,offsetY:20,calloutPosition: 0.1,effect:'slide'})">
									<td>${kcst.count }</td>
									<td>${rkreport.stock.stock_product }
										<div style="display: none;">
											<div id="sub${kcst.count }">
												<b style="color: #9B30FF"> 供应商：</b><br> <b
													style="color: #9B30FF">${rkreport.rkreport_supplier}</b><br>
												<b style="color: #1E90FF">${rkreport.rkreport_address}</b><br>
											</div>
										</div>
									</td>
									<td>${rkreport.stock.stock_brand }</td>
									<td>${rkreport.stock.stock_package }</td>
									<td>${rkreport.stock.stock_lotnumber }</td>
									<td>${rkreport.stock.stock_quality}</td>
									<td style="font-weight: bold; color: #CD8500;"><c:if
											test="${rkreport.rkreport_status ==1 }">
											<span style="font-size: 15px; color: #008000">+</span>
										</c:if>
										<c:if test="${rkreport.rkreport_status ==2 }">
											<span style="color: red; font-size: 15px;">-</span>
										</c:if>${rkreport.rkreport_num }</td>
									<td>${rkreport.rkreport_price }</td>
									<td>${rkreport.stock.stock_position }</td>
									<td title="${rkreport.rkreport_fangshi }"><c:if
											test="${rkreport.rkreport_status ==1 }">
											<div
												style="color: #008000; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100px !important;">
												${rkreport.rkreport_fangshi }</div>
										</c:if> <c:if test="${rkreport.rkreport_status ==2 }">
											<div
												style="color: red; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100px !important;">
												${rkreport.rkreport_fangshi }</div>
										</c:if></td>
									<td><fmt:formatDate value="${rkreport.rkreport_time}"
											pattern="yyyy/MM/dd HH:mm" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4" style="padding-left: 30px; width: 410px;">
					<div ng-cloak>
						<nav aria-label="Page navigation" class="clearfix">
							<ul class="pagination pagination-sm pagination1 fr"
								style="margin: 0">
								<li ng-class="{disabled:page==1}"><a
									<c:if test="${page > 1 }">href="rkreportAll?page=${page-1 }&&rows=10"</c:if>
									aria-label="Previous" ng-click="sub(${page-1 }<1?1:${page-1 })"
									ng-disabled="page==1"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li ng-if="page >= pageNum && lastPage !== pageNum"
									ng-click="sub(1)" ng-class="{active:item==1}"><a
									href="rkreportAll?page=1&&rows=10">1</a></li>
								<li ng-if="page >= pageNum && lastPage !== pageNum"><a
									href="javascript:void(0)">...</a></li>
								<li ng-click="sub(item)" ng-class="{active:item==page}"
									ng-repeat="item in pages"><a
									href="rkreportAll?page={{item}}&&rows=10">{{item}}</a></li>
								<li
									ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum">
									<a href="javascript:void(0)">...</a>
								</li>
								<li
									ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum"
									ng-click="sub(lastPage)" ng-class="{active:item==page}"><a
									href="rkreportAll?page={{lastPage}}&&rows=10&">{{lastPage}}</a>
								</li>
								<li ng-class="{disabled:page==lastPage}"><a
									<c:if test="${page < count }">href="rkreportAll?page=${page+1 }&&rows=10"</c:if>
									aria-label="Next"
									ng-click="sub(${page+1 }>lastPage?page:${page+1 })"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-md-4" style="height: 30px; line-height: 30px;">
					总共 <span style="font-weight: bold; color: red;">${total }</span>
					条数据&emsp; <input type="text"
						style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 60px; text-align: center; display: inline-block;"
						id="pagemove2" class="form-control" name="pagemove"
						value="${page }">
					<button id="rktiaozhuan" class="btn btn-primary button2"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: green; border-color: green;"
						title="输入数字，随芯跳转">跳转</button>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${xiaoshouall eq 'xiaoshouall' }">
		<div class="container" style="margin-top: -15px;">
			<div class="row">
				<div class="col-md-12" style="padding-left: 30px;">
					<table
						class="table1 table table-bordered table-hover table-responsive"
						style="text-align: center; border-collapse: collapse; width: 1100px;"
						cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th style="border: none;">序号</th>
								<th style="border: none;">订单类型</th>
								<th style="border: none;">客户</th>
								<th style="border: none;">联系人</th>
								<th style="border: none;">联系电话</th>
								<th style="border: none;">应收金额</th>
								<th style="border: none;">实收金额</th>
								<th style="border: none;">其他费用</th>
								<th style="border: none;">收款方式</th>
								<th style="border: none; width: 100px;">备注</th>
								<th style="border: none;">时间</th>
								<th style="border: none;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${xiaoshou }" var="xslist" varStatus="xsst">
								<tr class="kctr" style="cursor: pointer;"
									onmouseover="tooltip.pop(this, '#sub${kcst.count }', {position:0, offsetX:0,offsetY:20,calloutPosition: 0.1,effect:'slide'})">
									<td>${xsst.count }</td>
									<td>${xslist.xs_type }</td>
									<td>${xslist.xs_kehu }</td>
									<td>${xslist.xs_name }</td>
									<td>${xslist.xs_phone }</td>
									<td><b style="color: #CD8500;">${xslist.xs_yingshou }</b></td>
									<td><b style="color: #9B30FF;">${xslist.xs_shishou }</b></td>
									<td><b style="color: #FF6347;">${xslist.xs_othermoney }</b></td>
									<td width="120px;"><c:if test="${xslist.xs_pay ne '挂欠'}">
												${xslist.xs_pay }
											</c:if> <c:if test="${xslist.xs_pay eq '挂欠'}">
											<p style="margin-top: 0px;">${xslist.xs_pay }</p>
											<p style="margin-top: -10px; color: red; margin-bottom: 0px;">预计收款时间:</p>
											<p style="margin-top: 0px; color: red; margin-bottom: 0px;">
												<fmt:formatDate value="${xslist.xs_shoukuandate}"
													pattern="yyyy/MM/dd" />
											</p>
										</c:if></td>
									<td title="${xslist.xs_beizhu }">
										<div
											style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 100px !important;">
											${xslist.xs_beizhu }</div>
									</td>
									<td><fmt:formatDate value="${xslist.xs_addtime}"
											pattern="yyyy/MM/dd HH:mm" /></td>
									<td><a onclick="xspdetail('${xslist.xs_id}')"
										class="theme-loginx" href="javascript:;">查看详情</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4" style="padding-left: 30px; width: 410px;">
					<div ng-cloak>
						<nav aria-label="Page navigation" class="clearfix">
							<ul class="pagination pagination-sm pagination1 fr"
								style="margin: 0">
								<li ng-class="{disabled:page==1}"><a
									<c:if test="${page > 1 }">href="xiaoshouAll?page=${page-1 }"</c:if>
									aria-label="Previous" ng-click="sub(${page-1 }<1?1:${page-1 })"
									ng-disabled="page==1"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li ng-if="page >= pageNum && lastPage !== pageNum"
									ng-click="sub(1)" ng-class="{active:item==1}"><a
									href="xiaoshouAll?page=1">1</a></li>
								<li ng-if="page >= pageNum && lastPage !== pageNum"><a
									href="javascript:void(0)">...</a></li>
								<li ng-click="sub(item)" ng-class="{active:item==page}"
									ng-repeat="item in pages"><a
									href="xiaoshouAll?page={{item}}">{{item}}</a></li>
								<li
									ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum">
									<a href="javascript:void(0)">...</a>
								</li>
								<li
									ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum"
									ng-click="sub(lastPage)" ng-class="{active:item==page}"><a
									href="xiaoshouAll?page={{lastPage}}">{{lastPage}}</a></li>
								<li ng-class="{disabled:page==lastPage}"><a
									<c:if test="${page < count }">href="xiaoshouAll?page=${page+1 }"</c:if>
									aria-label="Next"
									ng-click="sub(${page+1 }>lastPage?page:${page+1 })"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-md-4" style="height: 30px; line-height: 30px;">
					总共 <span style="font-weight: bold; color: red;">${total }</span>
					条数据&emsp; <input type="text"
						style="height: 30px; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; border: 1px #DDDDDD solid; width: 60px; text-align: center; display: inline-block;"
						id="pagemove2" class="form-control" name="pagemove"
						value="${page }">
					<button id="xstiaozhuan" class="btn btn-primary button2"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: green; border-color: green;"
						title="输入数字，随芯跳转">跳转</button>
				</div>
			</div>
		</div>
	</c:if>
	<div class="theme-popover">
		<div style="height: 40px;">
			<a href="javascript:;" title="关闭" class="theme-close"
				style="margin-right: 10px; margin-top: 10px; font-size: 20px; font-weight: bold;">×</a>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table
					class="table1 table table-bordered table-hover table-responsive"
					style="text-align: center; border-collapse: collapse; width: 1100px;"
					cellspacing="0" cellpadding="0">
					<tr class="kctr">
						<th style="vertical-align: middle !important;">型号</th>
						<td style="vertical-align: middle !important;"><input
							type="text" id="addstock_product" class="product" value=""
							name="stock_product"
							style="text-align: center; width: 140px; text-transform: uppercase;">
						</td>
						<th style="vertical-align: middle !important;">品牌</th>
						<td style="vertical-align: middle !important;"><input
							type="text" id="addstock_brand" class="brand" value=""
							name="stock_brand"
							style="text-align: center; width: 140px; text-transform: uppercase;">
						</td>
						<th style="vertical-align: middle !important;">封装</th>
						<td style="vertical-align: middle !important;"><input
							type="text" id="addstock_package" class="package" value=""
							name="stock_package"
							style="text-align: center; width: 140px; text-transform: uppercase;">
						</td>
					</tr>
					<tr class="kctr">
						<th style="vertical-align: middle !important;">批号</th>
						<td style="vertical-align: middle !important;"><input
							type="text" id="addstock_lotnumber" class="pihao" value=""
							style="text-align: center; width: 100px;"></td>
						<th style="vertical-align: middle !important;">数量</th>
						<td style="vertical-align: middle !important;"><input
							type="number" id="addstock_number" class="number" value="0"
							style="text-align: center; width: 100px;" placeholder="数量"
							min="0"></td>
						<th style="vertical-align: middle !important;">进货单价</th>
						<td style="vertical-align: middle !important;"><input
							type="number" id="addstock_price" class="chengben" value="0"
							style="text-align: center; width: 100px;" placeholder="进货单价"
							min="0"></td>
					</tr>
					<tr class="kctr">
						<th style="vertical-align: middle !important;">总计金额</th>
						<td class="money" style="vertical-align: middle !important;">0</td>
						<th style="vertical-align: middle !important;">库存所在</th>
						<td style="vertical-align: middle !important;"><select
							name="stock_position" id="addstock_position"
							style="width: 100px;">
								<option selected="selected" value="柜台">柜台</option>
								<option value="公司">公司</option>
								<option value="仓库">仓库</option>
						</select></td>
						<th style="vertical-align: middle !important;">品质</th>
						<td style="vertical-align: middle !important;"><select
							name="cb_quality" id="addstock_quality" style="width: 100px;">
								<option selected="selected" value="原装">原装</option>
								<option value="散新">散新</option>
								<option value="国产">国产</option>
						</select></td>
					</tr>
					<tr style="background: rgb(255, 255, 255);">
						<td style="text-align: center; vertical-align: middle !important;"
							class="col-md-1"><b>基本单位</b></td>
						<td class="col-md-3" style="vertical-align: middle !important;">
							<select name="stock_danwei1" id="addstock_danwei1">
								<option selected="selected" value="PCS">PCS</option>
								<option value="个">个</option>
								<option value="只">只</option>
								<option value="束">束</option>
								<option value="千只">千只</option>
						</select>
						</td>
						<td style="text-align: center; vertical-align: middle !important;"
							class="col-md-1"><b>包装量</b></td>
						<td class="col-md-4" style="vertical-align: middle !important;"
							colspan="3"><input id="addstock_baozhuangnum" type="text"
							name="stock_baozhuangnum" placeholder="包装量"> <span
							class="danwei1"
							style="display: inline-block; width: 30px; text-align: center;">PCS</span>/
							<select name="stock_danwei2" id="addstock_danwei2">
								<option selected="selected" value="条">条</option>
								<option value="箱">箱</option>
								<option value="盘">盘</option>
								<option value="包">包</option>
								<option value="管">管</option>
						</select></td>
					</tr>
					<tr class="kctr">
						<th style="vertical-align: middle !important;">供应商</th>
						<td style="vertical-align: middle !important;"><input
							type="text" id="addrkreport_supplier" class="cb_supplier"
							value="" style="text-align: center; width: 300px;"
							placeholder="供应商"></td>
						<th style="vertical-align: middle !important;">详细位置</th>
						<td style="vertical-align: middle !important;" colspan="3"><input
							type="text" id="addrkreport_address" class="cb_place" value=""
							style="text-align: center; width: 500px;" placeholder="详细位置">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7" style="text-align: center;">
				<button id="tianjia" type="button" class="btn btn-primary button5"
					style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8; float: right; margin-right: 25px;"
					title="添加当前库存">确认</button>
				<button id="notianjia" type="button" class="btn btn-primary button6"
					style="cursor: pointer; height: 30px; padding-top: 4px; background: #FD3D3D; border-color: #FD3D3D; float: right; margin-right: 10px;"
					title="取消添加库存">取消</button>
			</div>
		</div>
		<div
			style="width: 100%; border-top: 1px #DDDDDD dashed; margin-bottom: 20px;"></div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover1">
		<div style="height: 40px;">
			<a href="javascript:;" title="关闭" class="theme-close1"
				style="margin-right: 10px; margin-top: 10px; font-size: 20px; font-weight: bold;">×</a>
		</div>
		<form id="xiaoshouform" method="post">
			<table
				class="table table-bordered table-hover table-condensed table-responsive"
				style="text-align: center; border-collapse: collapse; width: 1120px; margin-left: 3px;">
				<tr class="xiaoshoutr">
					<td style="border: none;">订单类型</td>
					<td><select class="xs_type" name="xs_type">
							<option selected="selected" value="销售单">销售单</option>
					</select></td>
					<td>客户</td>
					<td><input type="text" name="xs_kehu" class="xs_kehu">
					</td>
					<td>联系人</td>
					<td><input type="text" name="xs_name" class="xs_name">
					</td>
					<td>联系电话</td>
					<td><input type="text" name="xs_phone" class="xs_tel">
					</td>
				</tr>
				<tr class="xiaoshoutr">
					<td>地址</td>
					<td colspan="5"><input style="width: 500px;" type="text"
						name="xs_address" class="xs_address"></td>
					<td>订单状态</td>
					<td><select class="xs_status" name="xs_status">
							<option selected="selected" value="2">待处理</option>
					</select></td>
				</tr>
				<tr class="xiaoshoutr">
					<td>应收金额</td>
					<td style="background-color: #EBEBE4;" class="xs_yingshou"><input
						type="hidden" name="xs_yingshou" class="xs_yingshou"></td>
					<td>实收金额</td>
					<td><input type="text" name="xs_shishou" class="xs_shishou">&emsp;<input
						class="tongyingshou" type="checkbox" style="margin-top: -2px;"><span
						style="color: red;">同应收</span></td>
					<!-- <td>税点</td>
			    		<td>
			    			<input>
			    		</td> -->
					<td>其他费用</td>
					<td><input type="text" name="xs_othermoney" value="0"
						class="xs_othermoney"></td>
					<td>收款方式</td>
					<td><select class="xs_pay" name="xs_pay" id="xs_pay">
							<option selected="selected" value="1">现金</option>
							<option value="2">银行</option>
							<option value="3">支付宝</option>
							<option value="4">微信</option>
							<option value="5">挂欠</option>
					</select></td>
				</tr>
				<tr class="xiaoshoutr">
					<td id="xsguanri1" style="display: none">预计收款日</td>
					<td id="dateri2" style="display: none"><input type="date"
						name="xs_shoukuandate" class="xs_shoukuandate"></td>
					<!-- <td>销售员</td>
			    		<td>
			    			<select>
			    				<option selected="selected" value="1">name1</option>
			    				<option value="2">name2</option>
			    				<option value="3">name3</option>
			    			</select>
			    		</td> -->
					<!-- <td>收货方式</td>
			    		<td>
			    			<div class="radio radio-info radio-inline">
		                        <input type="radio" id="inlineRadio1" class="songhuocheck" value="送货上门" name="xs_shouhuotype" checked>
		                        <label for="inlineRadio1">送货上门</label>
		                    </div>
		                    <div class="radio radio-inline">
		                        <input type="radio" id="inlineRadio2" class="ziticheck" value="自提" name="xs_shouhuotype">
		                        <label for="inlineRadio2">自提</label>
		                    </div>
			    		</td> -->
					<td>备注</td>
					<td colspan="2"><input style="width: 300px;" type="text"
						name="xs_beizhu" class="xs_beizhu"></td>
				</tr>
			</table>
			<div
				style="width: 100%; border-top: 1px #DDDDDD dashed; margin-bottom: 20px;"></div>
			<table
				class="table table-bordered table-hover table-condensed table-responsive"
				style="text-align: center; border-collapse: collapse; width: 1120px; margin-left: 3px;">
				<thead>
					<tr class="xiaoshoutr">
						<td style="border: none; background: #EED8AE;">序号</td>
						<td style="border: none; background: #EED8AE;">型号</td>
						<td style="border: none; background: #EED8AE;">单位</td>
						<td style="border: none; background: #EED8AE;">售价（未税）</td>
						<td style="border: none; background: #EED8AE;">数量</td>
						<td style="border: none; background: #EED8AE;">总计金额</td>
						<td style="border: none; background: #EED8AE;">品牌</td>
						<td style="border: none; background: #EED8AE;">封装</td>
						<td style="border: none; background: #EED8AE;">批号</td>
						<td style="border: none; background: #EED8AE;">仓库</td>
						<td style="border: none; background: #EED8AE;">操作</td>
					</tr>
				</thead>
				<tbody id="content">
				</tbody>
			</table>
			<button type="button" class="btn btn-primary button5 addline"
				onclick="add_line()"
				style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8; margin-left: 3px;">
				添加行</button>
			<div class="row">
				<div class="col-md-12"
					style="text-align: center; margin-bottom: 20px;">
					<button id="xiaoshou" type="button" class="btn btn-primary button5"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #1296D8; border-color: #1296D8;"
						title="提交当前销售单">确认</button>
					<button id="noxiaoshou" type="button"
						class="btn btn-primary button6"
						style="cursor: pointer; height: 30px; padding-top: 4px; background: #FD3D3D; border-color: #FD3D3D;"
						title="取消">取消</button>
				</div>
			</div>
		</form>
	</div>
	<div class="theme-popoverx">
		<div style="height: 40px;">
			<a href="javascript:;" title="关闭" class="theme-closex"
				style="margin-right: 10px; margin-top: 10px; font-size: 20px; font-weight: bold;">×</a>
		</div>
		<table
			class="table table-bordered table-hover table-condensed table-responsive"
			style="text-align: center; border-collapse: collapse; width: 1120px; margin-left: 3px;">
			<tr class="xiaoshoutr">
				<td style="font-weight: bold;">订单类型<input type="hidden"
					id="upid"></td>
				<td class="xs_typex"></td>
				<td style="font-weight: bold;">客户</td>
				<td class="xs_kehux"></td>
				<td style="font-weight: bold;">联系人</td>
				<td class="xs_namex"></td>
				<td style="font-weight: bold;">联系电话</td>
				<td class="xs_phonex"></td>
			</tr>
			<tr class="xiaoshoutr">
				<td style="font-weight: bold;">地址</td>
				<td colspan="5" class="xs_addressx"></td>
				<td style="font-weight: bold;">订单状态</td>
				<td class="xs_statusx"></td>
			</tr>
			<tr class="xiaoshoutr">
				<td style="font-weight: bold;">应收金额</td>
				<td style="background-color: #EBEBE4;" class="xs_yingshoux"></td>
				<td style="font-weight: bold;">实收金额</td>
				<td class="xs_shishoux"></td>
				<td style="font-weight: bold;">其他费用</td>
				<td class="xs_othermoneyx"></td>
				<td style="font-weight: bold;">收款方式</td>
				<td class="xs_payx"></td>
			</tr>
			<tr class="xiaoshoutr">
				<td class="xs_shoukuandatehide" style="font-weight: bold;">预计收款日</td>
				<td class="xs_shoukuandatex xs_shoukuandatehide"></td>
				<td style="font-weight: bold;">备注</td>
				<td colspan="3" class="xs_beizhux"></td>
			</tr>
		</table>
		<div
			style="width: 100%; border-top: 1px #DDDDDD dashed; margin-bottom: 20px;"></div>
		<table
			class="table table-bordered table-hover table-condensed table-responsive"
			style="text-align: center; border-collapse: collapse; width: 1120px; margin-left: 3px;">
			<thead>
				<tr class="xiaoshoutr">
					<td style="border: none; background: #EED8AE;">序号</td>
					<td style="border: none; background: #EED8AE;">型号</td>
					<td style="border: none; background: #EED8AE;">单位</td>
					<td style="border: none; background: #EED8AE;">售价（未税）</td>
					<td style="border: none; background: #EED8AE;">数量</td>
					<td style="border: none; background: #EED8AE;">品牌</td>
					<td style="border: none; background: #EED8AE;">封装</td>
					<td style="border: none; background: #EED8AE;">批号</td>
					<td style="border: none; background: #EED8AE;">仓库</td>
				</tr>
			</thead>
			<tbody id="xsdetailtbody">
			</tbody>
		</table>
		<div class="row">
			<div class="col-md-12" id="upxs"
				style="text-align: center; margin-bottom: 20px;"></div>
		</div>
	</div>
	<div class="theme-popover-maskx"></div>

	<div class="theme-popover-mask"></div>
	<div class="xsproduct_table"
		style="display: none; position: absolute; z-index: 9999; top: 15px; left: 108px;">
		<table id="xsptable"
			class="table table-bordered table-hover table-condensed table-responsive"
			style="text-align: center; border-collapse: collapse; width: 800px;">
			<thead
				style="display: table; overflow-y: scroll; table-layout: fixed; width: 100%;">
				<tr class="xstabletr">
					<td style="border: none; background-color: #D0DFEF;">型号</td>
					<td style="border: none; background-color: #D0DFEF;">品牌</td>
					<td style="border: none; background-color: #D0DFEF;">封装</td>
					<td style="border: none; background-color: #D0DFEF;">批号</td>
					<td style="border: none; background-color: #D0DFEF;">供应商</td>
					<td style="border: none; background-color: #D0DFEF;">品质</td>
					<td style="border: none; background-color: #D0DFEF;">仓库</td>
				</tr>
			</thead>
			<tbody id="xsproduct_tbody"
				style="max-height: 240px; display: block; overflow-y: scroll;">
			</tbody>
		</table>
	</div>
	<div style="text-align: center; display: none;">
		<div class="ppp" style="text-align: center; margin-left: 10%;">
			<table style="text-align: center; width: 100%;">
				<tr>
					<td colspan="2" style="vertical-align: middle;"><span
						style="height: 60px; margin-top: -10px; display: inline-block; font-size: 32px; font-weight: 100;">力芯周电子商行</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="text-align: left; padding-left: 17%;">
							<p style="line-height: 14px;">
								地&emsp;&emsp;址：<span>深圳市福田区华强北路新华强广场Q2B051房间</span>
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 70%">
						<div
							style="text-align: left; font-weight: inherit; padding-left: 24.5%;">
							<p style="line-height: 14px;">电&emsp;&emsp;话：0755-83250458&emsp;0755-83238648</p>
						</div>
					</td>
					<td style="width: 30%"><p
							style="padding-left: 10%; margin-top: -10px; font-size: 16px;">收据</p></td>
				</tr>
				<tr>
					<td style="text-align: left; width: 50%;">
						<p style="line-height: 14px;">
							<span>客&emsp;&emsp;户：</span><span class="dy_kehu"></span>
						</p>
						<p style="line-height: 14px;">
							<span>联系方式：</span><span class="dy_tel"></span>
						</p>
						<p style="line-height: 14px;">
							<span>地&emsp;&emsp;址：</span><span class="dy_dizhi"></span>
						</p>
					</td>
					<td style="width: 50%;">
						<div style="text-align: left; width: 100%; padding-left: 0%;">
							<p style="line-height: 14px;">
								<span>开单日期：</span><span class="dy_date"></span>
							</p>
							<p style="line-height: 14px;">
								<span>付款方式：</span><span class="dy_pay"></span>
							</p>
							<p style="line-height: 14px;">
								<span>订单编号：</span><span class="xs_bianhao"></span>
							</p>
						</div>
					</td>
				</tr>
			</table>
			<table border="1"
				style="text-align: center; border-collapse: collapse; width: 100%; border: 1px black solid;">
				<thead>
					<tr>
						<td>型号</td>
						<td>品牌</td>
						<td>封装</td>
						<td>批号</td>
						<td>单位</td>
						<td>数量</td>
						<td>单价</td>
						<td>金额</td>
					</tr>
				</thead>
				<tbody class="dy_tbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" style="padding-left: 20px; padding-right: 20px;">
							<span style="float: left;" class="dy_moneyA"></span> <span
							style="float: right;" class="dy_moneya"></span>
						</td>
					</tr>
					<tr>
						<td colspan="9" class="dy_beizhu"
							style="text-align: left; padding-left: 20px; padding-right: 20px;">
						</td>
					</tr>
				</tfoot>
			</table>
			<table
				style="border-collapse: collapse; width: 100%; text-align: left; font-size: 14px;">
				<tr>
					<td>本公司只售原厂原装正品，货物一经售出，恕不退还，敬请谅解！</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
			jQuery(function($) {  
				$(document).on('click','#baocunxiaoshou1',function(){  
					var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
				    var isOpera = userAgent.indexOf("Chrome") > -1;
					if (userAgent.indexOf("Chrome") == -1) {
						layer.alert("请使用谷歌浏览器，否则相关功能将不能正常使用！",5);
					}else {
						$('.dy_kehu').text($('.xs_kehux').html());
						
						var xs_tel = $('.xs_phonex').html();
						
						$('.dy_tel').text(xs_tel);
						
						$('.dy_dizhi').text($('.xs_addressx').html());
						
						var xs_pay = $(".xs_payx").html();
						
						$('.dy_pay').text(xs_pay);
						
						var dy_date = CurentTime();
						
						$('.dy_date').text(dy_date);
						
						//tfoot
						var moneyAll = $('.xs_yingshoux').html();
						moneyAll = parseFloat(moneyAll).toFixed(2);
						$('.dy_moneyA').html("合计人民币(大写)："+smalltoBIG(moneyAll));
						$('.dy_moneya').html("小写：￥"+moneyAll);
						$('.dy_beizhu').html("备注："+$('.xs_beizhux').html());
						
						var content_tr = $('#xsdetailtbody').children("tr");
						var dy_tbody = '';
						
						for (var i = 0; i < content_tr.length; i++) {
							var tdArr = content_tr.eq(i).find("td");
							var dy_danjia = tdArr.eq(3).html();
							dy_danjia = parseFloat(dy_danjia).toFixed(2);
							var number = tdArr.eq(4).html();
							var price = parseInt(number) * dy_danjia;
							price   = parseFloat(price).toFixed(2);
							dy_tbody += '<tr>'+
											'<td>'+tdArr.eq(1).html()+'</td>'+         //型号
											'<td>'+tdArr.eq(5).html()+'</td>'+         //品牌
											'<td>'+tdArr.eq(6).html()+'</td>'+         //封装
											'<td>'+tdArr.eq(7).html()+'</td>'+		   //批号
											'<td>'+tdArr.eq(2).html()+'</td>'+         //单位
											'<td>'+tdArr.eq(4).html()+'</td>'+         //数量
											'<td>'+dy_danjia+'</td>'+                  //单价
											'<td>'+price+'</td>'+                    //金额
										'</tr>';               
						}
						$('.dy_tbody').html(dy_tbody);
						$('.xs_bianhao').text("NO:"+$('.xs_bianhao11').html());
						$.print(".ppp");
					}
				});  
				$(document).on('click','#uponcliickdaying',function(){
					/*点击一次在更新时，无法再被点击*/
					var documentUponcliickdaying = document.getElementById("uponcliickdaying");//保存并打印按钮
					var documentUponcliick = document.getElementById("uponcliick");//保存按钮
					documentUponcliickdaying.disabled=true;
					documentUponcliick.disabled = true;
					var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
				    var isOpera = userAgent.indexOf("Chrome") > -1;
					if (userAgent.indexOf("Chrome") == -1) {
						layer.alert("请使用谷歌浏览器，否则相关功能将不能正常使用！",5);
						documentUponcliickdaying.disabled=false;
						documentUponcliick.disabled = false;
					}else {
						var xs_id = $("#upid").val();
						var xs_type = $("#uptype").val();
						var xs_kehu = $('#upkehu').val();
						var xs_name = $('#upname').val();
						var xs_tel = $('#upphone').val();
						var xs_address = $('#upaddress').val();
						var xs_yingshou = $('#upyingshou').html();
						var xs_shishou = $('#upshishou').val();
						var xs_othermoney = $('#upothermoney').val();
						var xs_pay = $("#uppay option:selected").text();
						var xs_shoukuandate = $('#upshoukuandate').val();
						var xs_beizhu = $('#upbeizhu').val();
						var content_tr = $('#xsdetailtbody').children("tr");
						var xs_status = $('#upstatus').val();
						$('.dy_kehu').text(xs_kehu);
						$('.dy_tel').text(xs_tel);
						$('.dy_dizhi').text(xs_address);
						$('.dy_pay').text(xs_pay);
						var dy_date = CurentTime();
						$('.dy_date').text(dy_date);
						//tfoot
						var moneyAll = xs_yingshou;
						moneyAll = parseFloat(moneyAll).toFixed(2);
						$('.dy_moneyA').html("合计人民币(大写)："+smalltoBIG(moneyAll));
						$('.dy_moneya').html("小写：￥"+moneyAll);
						$('.dy_beizhu').html("备注："+xs_beizhu);
						var content_tr = $('#xsdetailtbody').children("tr");
						var dy_tbody = '';
						var arr_tdstr='';
						var arr_sidstr='';
						var arr_ridstr='';
						var arr_sustr='';
						//将数量  售价  总计金额  kc_id cb_id放到数组里 
						for (var i = 0; i < content_tr.length; i++) {
							var tdArr = content_tr.eq(i).find("td");
							var dy_danjia = tdArr.eq(3).find(".xs_shoujiax").val();
							dy_danjia = parseFloat(dy_danjia).toFixed(2);
							var number = tdArr.eq(4).find(".xs_numberx").val();
							var price = parseInt(number) * dy_danjia;
							price   = parseFloat(price).toFixed(2);
							dy_tbody += '<tr>'+
								'<td>'+tdArr.eq(1).text()+'</td>'+         //型号
								'<td>'+tdArr.eq(5).text()+'</td>'+         //品牌
								'<td>'+tdArr.eq(6).html()+'</td>'+         //封装
								'<td>'+tdArr.eq(7).html()+'</td>'+		   //批号
								'<td>'+tdArr.eq(2).html()+'</td>'+         //单位
								'<td>'+tdArr.eq(4).find(".xs_numberx").val()+'</td>'+         //数量
								'<td>'+dy_danjia+'</td>'+                  //单价
								'<td>'+price+'</td>'+                    //金额
							'</tr>';               
							arr_sustr += tdArr.eq(4).find(".xs_numberx").val()+",";
							arr_tdstr += tdArr.eq(3).find(".xs_shoujiax").val()+",";
							arr_sidstr += tdArr.eq(1).find(".upsid").val()+",";
							arr_ridstr += tdArr.eq(5).find(".uprid").val()+",";
							
						}
						$('.dy_tbody').html(dy_tbody);
						$('.xs_bianhao').text("NO:"+$('.xs_bianhao11').html());
						$.ajax({
							type:"post",
				            url:"upxiaoshou",
				            async:true,
				            dataType: "json",
				            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				            data: {
				            	xs_type:xs_type,
				            	xs_kehu:xs_kehu,
				            	xs_name:xs_name,
				            	xs_phone:xs_tel,
				            	xs_address:xs_address,
				            	xs_yingshou:xs_yingshou,
				            	xs_shishou:xs_shishou,
				            	xs_othermoney:xs_othermoney,
				            	xs_pay:xs_pay,
				            	xs_shoukuandate1:xs_shoukuandate,
				            	xs_beizhu:xs_beizhu,
				            	shoujia:arr_tdstr,
				            	number:arr_sustr,
				            	sid:arr_sidstr,
				            	rid:arr_ridstr,
				            	xs_status:xs_status,
				            	xs_id:xs_id
				            },
							success : function(data){
								$.print(".ppp")
								setTimeout(judage, 3000);
								if(data.result=="login"){
									window.location.href="frontLogin";
				            	}else {
				            		window.location.href="xiaoshouAll";
				            	}
							},
							error: function() {  
				                alert('对不起失败了，请检查订单信息是否有误！'); 
				                documentUponcliickdaying.disabled=false;
								documentUponcliick.disabled = false;
				            }  
				        });
					}
					//0.5秒后改变状态
					setTimeout(changeStatus,500);
				});  
			}); 
			function changeStatus(){
				var documentUponcliickdaying = document.getElementById("uponcliickdaying");//保存并打印按钮
				var documentUponcliick = document.getElementById("uponcliick");//保存按钮
				documentUponcliickdaying.disabled=false;
				documentUponcliick.disabled = false;
			}
			function CurentTime(){   
		        var now = new Date();  
		          
		        var year = now.getFullYear();       //年  
		        var month = now.getMonth() + 1;     //月  
		        var day = now.getDate();            //日  
		          
		        var hh = now.getHours();            //时  
		        var mm = now.getMinutes();          //分  
		          
		        var clock = year + "-";  
		          
		        if(month < 10)  
		            clock += "0";  
		          
		        clock += month + "-";  
		          
		        if(day < 10)  
		            clock += "0";  
		              
		        clock += day + " ";  
		          
		        if(hh < 10)  
		            clock += "0";  
		              
		        clock += hh + ":";  
		        if (mm < 10) clock += '0';   
		        clock += mm;   
		           
		        return(clock);   
			}
		</script>
	<script>
			jQuery(document).ready(function($) {
				$('.theme-login').click(function(){
					$('.theme-popover-mask').fadeIn(100);
					$('.theme-popover').slideDown(200);
				})
				$('.theme-close').click(function(){
					$('.theme-popover-mask').fadeOut(100);
					$('.theme-popover').slideUp(200);
				})
				
				$('.theme-login1').click(function(){
					$('.theme-popover-mask').fadeIn(100);
					$('.theme-popover1').slideDown(200);
				})
				$('.theme-close1').click(function(){
					$('.theme-popover-mask').fadeOut(100);
					$('.theme-popover1').slideUp(200);
				})
				
				$('.theme-loginx').click(function(){
					$('.theme-popover-maskx').fadeIn(100);
					$('.theme-popoverx').slideDown(200);
				})
				$('.theme-closex').click(function(){
					$('.theme-popover-maskx').fadeOut(100);
					$('.theme-popoverx').slideUp(200);
				})
			})
	
		</script>
	<script type="text/javascript">
		$("#xs_pay").click(function (){
			var pay=$("#xs_pay").val();
			if(pay==5){
				$("#xsguanri1").show();
				$("#dateri2").show();
			}else{
				$("#xsguanri1").hide();
				$("#dateri2").hide();
			}
		});
		function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
		    try {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
		        var date = new Date(jsonDate);
		        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
		        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
		        var day = date.getDate();
		        var hh = date.getHours();
		        var mm = date.getMinutes();
		        var ss = date.getSeconds();
		        return date.getFullYear() + "-" + month + "-" + day;
		    } catch (ex) {
		        return "";
		    }
		}
		function xspdetail(xs_id){
			var url = "sele_xspdetail?id="+xs_id;
			$.post(url,
        		function(data){
                	if(data.result=="success"){
                		var xs = data.xsdetail;
                		if(xs.xs_status==2){
                    		var list = xs.rkreportList;
                    		var s = '';
                    		if(xs.xs_pay != '挂欠'){
                    			$('.xs_shoukuandatehide').hide();
                    		}
                    		$('.xs_typex').html(xs.xs_type);
                    		$('.xs_kehux').html('<input type="text" id="upkehu" name="xs_kehu" class="xs_kehu" value="'+xs.xs_kehu+'" >');
                    		$('.xs_namex').html('<input type="text" id="upname" name="xs_name" class="xs_name" value="'+xs.xs_name+'" >');
                    		$('.xs_phonex').html('<input type="text" id="upphone" name="xs_phone" class="xs_phone" value="'+xs.xs_phone+'" >');
                    		$('.xs_addressx').html('<input type="text" style="width:500px;" id="upaddress" name="xs_address" class="xs_address" value="'+xs.xs_address+'" >');
                    		$('.xs_yingshoux').html(xs.xs_yingshou);
                    		$('.xs_statusx').html('<select class="xs_status" id="upstatus" name="xs_status"><option selected="selected" value="2">待处理</option><option value="1">已完成</option><option value="3">已取消</option></select>');
                    		$('.xs_shishoux').html('<input type="text" id="upshishou" name="xs_shishou" class="xs_shishou" value="'+xs.xs_shishou+'" >');
                    		$('.xs_othermoneyx').html('<input type="text" id="upothermoney" name="xs_othermoney" value="'+xs.xs_othermoney+'" class="xs_othermoney" >');
                    		if(xs.xs_pay=='挂欠'){
                    			$('.xs_payx').html('<select class="xs_pay" name="xs_pay" id="uppay"><option value="1">现金</option><option value="2">银行</option><option value="3">支付宝</option><option value="4">微信</option><option selected="selected" value="5">挂欠</option></select>');
       			    			$('.xs_shoukuandatex').html('<input type="date" id="upshoukuandate" name="xs_shoukuandate" value="'+jsonDateFormat(xs.xs_shoukuandate)+'" class="xs_shoukuandate" >');
                    		}
                    		if(xs.xs_pay=='现金'){
                    			$('.xs_payx').html('<select class="xs_pay" name="xs_pay" id="uppay"><option selected="selected value="1">现金</option><option value="2">银行</option><option value="3">支付宝</option><option value="4">微信</option><option" value="5">挂欠</option></select>');
                    		}
                    		if(xs.xs_pay=='银行'){
                    			$('.xs_payx').html('<select class="xs_pay" name="xs_pay" id="uppay"><option value="1">现金</option><option selected="selected value="2">银行</option><option value="3">支付宝</option><option value="4">微信</option><option value="5">挂欠</option></select>');
                    		}
                    		if(xs.xs_pay=='支付宝'){
                    			$('.xs_payx').html('<select class="xs_pay" name="xs_pay" id="uppay"><option value="1">现金</option><option value="2">银行</option><option selected="selected" value="3">支付宝</option><option value="4">微信</option><option value="5">挂欠</option></select>');
                    		}
                    		if(xs.xs_pay=='微信'){
                    			$('.xs_payx').html('<select class="xs_pay" name="xs_pay" id="uppay"><option value="1">现金</option><option value="2">银行</option><option value="3">支付宝</option><option selected="selected" value="4">微信</option><option value="5">挂欠</option></select>');
                    		}
                    		//$('.xs_shoukuandatex').html(xs.xs_shoukuandate.replace(" 00:00:00.0",""));
                    		$('.xs_beizhux').html('<input type="text" style="width:300px;" name="xs_beizhu" id="upbeizhu" value="'+xs.xs_beizhu+'">');
                    		for(var o in list){
                    			var index = parseInt(o)+1
                    			s+= "<tr class='xiaoshoutr' style='cursor: pointer;'>" +
    		    				        "<td>" + index + "</td>" +
    		    				        "<td><input type='hidden' value='"+list[o].stock.stock_id+"' class='upsid'>"+list[o].stock.stock_product+"</td>" +
    		    				        "<td>"+list[o].stock.stock_danwei1+"</td>" +
    		    				        "<td><input type='text' name='shoujia' value='"+list[o].rkreport_price+"' class='xs_shoujiax' onkeyup='clearNoNum(this)' style='width:80px;'></td>" +
    		    				        "<td><input type='text' class='xs_numberx' value='"+list[o].rkreport_num+"' name='shuliang' style='width:80px;' onkeyup='NumCheck(this)' ></td>" +
    		    				        "<td><input type='hidden' value='"+list[o].id+"' class='uprid'>"+list[o].stock.stock_brand+"</td>" +
    		    				        "<td>"+list[o].stock.stock_package+"</td>" +
    		    				        "<td>"+list[o].stock.stock_lotnumber+"</td>" +
    		    				        "<td>"+list[o].stock.stock_position+"</td>" +
    		    				    "</tr>";
                    		}
                    		$("#upid").val(xs_id);
                    		$("#upxs").html("");
                    		$("#upxs").append('<button id="uponcliickdaying" type="button" class="btn btn-primary buttonx" style="cursor: pointer; height: 30px; padding-top: 4px; background: rgb(102, 205, 0); border: 1px solid rgb(102, 205, 0);" title="保存并打印">保存并打印</button>&emsp;<button id="uponcliick" type="button" class="btn btn-primary buttonx" style="cursor: pointer; height: 30px; padding-top: 4px; background: rgb(18, 150, 216); border: 1px solid rgb(18, 150, 216);" title="保存">保存</button>');
                    		$('#xsdetailtbody').html(s);
                		}else{
                    		var list = xs.rkreportList;
                    		var s = '';
                    		if(xs.xs_pay != '挂欠'){
                    			$('.xs_shoukuandatehide').hide();
                    		}
                    		$('.xs_typex').html(xs.xs_type);
                    		$('.xs_kehux').html(xs.xs_kehu);
                    		$('.xs_namex').html(xs.xs_name);
                    		$('.xs_phonex').html(xs.xs_phone);
                    		$('.xs_addressx').html(xs.xs_address);
                    		$('.xs_yingshoux').html(xs.xs_yingshou);
                    		$('.xs_shishoux').html(xs.xs_shishou);
                    		$('.xs_othermoneyx').html(xs.xs_othermoney);
                    		$('.xs_payx').html(xs.xs_pay);
                    		$('.xs_shoukuandatex').html(jsonDateFormat(xs.xs_shoukuandate));
                    		//$('.xs_shoukuandatex').html(xs.xs_shoukuandate.replace(" 00:00:00.0",""));
                    		$('.xs_beizhux').html(xs.xs_beizhu);
                    		for(var o in list){
                    			var index = parseInt(o)+1
                    			s+= "<tr class='xiaoshoutr' style='cursor: pointer;'>" +
    		    						"<td>" + index + "</td>" +
    		    				        "<td>"+list[o].stock.stock_product+"</td>" +
    		    				        "<td>"+list[o].stock.stock_danwei1+"</td>" +
    		    				        "<td>"+list[o].rkreport_price+"</td>" +
    		    				        "<td>"+list[o].rkreport_num+"</td>" +
    		    				        "<td>"+list[o].stock.stock_brand+"</td>" +
    		    				        "<td>"+list[o].stock.stock_package+"</td>" +
    		    				        "<td>"+list[o].stock.stock_lotnumber+"</td>" +
    		    				        "<td>"+list[o].stock.stock_position+"</td>" +
    		    				    "</tr>";
                    		}
                    		$("#upid").val(xs_id);
                    		$("#upxs").html("");
                    		$("#upxs").append('<button id="baocunxiaoshou1" type="button" class="btn btn-primary buttonx" style="cursor: pointer; height: 30px; padding-top: 4px; background: rgb(102, 205, 0); border: 1px solid rgb(102, 205, 0);" title="打印">打印</button>');
                    		$('#xsdetailtbody').html(s);
                		}
                		
      	  			}
                }
			);
		}
		
		$(document).ready(function () {
            $('#addstock_product').bind('input', function () {//给文本框绑定input事件
            	var objectout = $("#addstock_product");  
        		objectout.mouseout(function () {
        		    var expressnumber=$("#addstock_product").val();
        			if(expressnumber==null || expressnumber==''){
        				return false;
        			}else{
        				$.post("seleBystock?product="+expressnumber,function (data){
        					if(data.stock!=null && data.stock!==''){
        						$('#addstock_brand').val(data.stock.stock_brand);
        		        		$('#addstock_package').val(data.stock.stock_package);
        		    			$("#addstock_lotnumber").val(data.stock.stock_lotnumber);
        					}
        				})
        			}
        		    /* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
        		});
            });
        });
		var x;
		
		//点击销售搜索框出现记录
		function search_xsproduct(obj){		
			x = obj;
			var objval = obj.value;
			$("#iframe_box").css({
				"overflow-y":"hidden"
			});
			$(".xsproduct_table").css({
			    "top":"15px"
		    });
			
			var s = "";
			if(objval != ''){
				var url = "sele_xsproduct?product="+objval;
			}else{
				var url = "sele_xsproduct?product="+"";
			}
			$.post(url,
        	  function(data){
            	  if(data.result=="success"){
            		  var list = data.xsproductList;
            		  if(list.length == 0){
            			  $('#xsproduct_tbody').html(
            			  	  '<tr class="xstabletr"><td colspan="5" style="border:none;"><h3>暂无此类型号</h3></td></tr>'
            			  );
            			  //对象1到顶部的距离
          				  var xsp_table_top = $('.xsproduct_table').offset().top;
          				  //对象1的高度
          				  var xsp_table_height = $('.xsproduct_table').height();
          				
          				  //对象2滚动的距离
          				  var scrollTop = $('.theme-popover1').scrollTop();
          				  //对象2到顶部的距离
          				  var thistop = getOffset(obj.parentNode.parentNode).top;
          				
          				  //两个对象之间的距离差
          				  var juli = thistop-xsp_table_top-xsp_table_height;
            			  $(".xsproduct_table").css({
          					  "top":juli+30+"px"
          				  });
            		  }else{
            			  for(o in list){
                			  s+= '<tr style="cursor: pointer;" class="xstabletr xsptr">'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_product+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_brand+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_package+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_lotnumber+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_supplier+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_quality+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_position+'</td>'+
		            			      '<td style="border-bottom: none;border-left: none;display:none;">'+list[o].stock_product+','+list[o].stock_danwei1+','+list[o].stock_brand+','+list[o].stock_package+','+list[o].stock_lotnumber+','+list[o].stock_position+','+list[o].stock_number+','+list[o].stock_id+'</td>'+
		            			  '</tr>';
                		  }
            			  
            			  $('#xsproduct_tbody').html(s);
            			  $('.xsproduct_table').show();
            			  //对象1到顶部的距离
          				  var xsp_table_top = $('.xsproduct_table').offset().top;
          				  //对象1的高度
          				  var xsp_table_height = $('.xsproduct_table').height();
          				
          				  //对象2滚动的距离
          				  var scrollTop = $('.theme-popover1').scrollTop();
          				  //对象2到顶部的距离
          				  var thistop = getOffset(obj.parentNode.parentNode).top;
          				
          				  //两个对象之间的距离差
          				  var juli =thistop-xsp_table_top-xsp_table_height;
          				  $(".xsproduct_table").css({
          					  "top":juli+30+"px"
          				  });
            		  }
  	  		  	  }
              }
		  );
	    }
		
		//输入型号时出现记录
		$(document).on('input propertychange','.searchxsp',function(e){
			$(".xsproduct_table").css({
			    "top":"15px"
		    });
			var $this = e.target;
			x = $this;
			var xsproduct = $this.value;
			var url = "sele_xsproduct?product="+xsproduct;
			var ss = ""; 
			$.post(url,
            	  function(data){
                	  if(data.result=="success"){
                		  var list = data.xsproductList;
                		  if(list.length == 0){
                			  $('#xsproduct_tbody').html(
                			  	  '<tr class="xstabletr"><td colspan="7" style="border:none;"><h3>暂无此类型号</h3></td></tr>'
                			  );
                			  $('.xsproduct_table').show();
                			  //对象1到顶部的距离
              				  var xsp_table_top = $('.xsproduct_table').offset().top;
              				  //对象1的高度
              				  var xsp_table_height = $('.xsproduct_table').height();
              				  
              				  //对象2滚动的距离
              				  var scrollTop = $('.theme-popover1').scrollTop();
              				  //对象2到顶部的距离
              				  var thistop = getOffset(x.parentNode.parentNode).top;
              				
              				  //两个对象之间的距离差
              				  var juli =thistop-xsp_table_top-xsp_table_height;
                			  $(".xsproduct_table").css({
              					  "top":juli+30+"px"
              				  });
                		  }else{
                			  for(o in list){
	                			  ss+= '<tr style="cursor: pointer;" class="xstabletr xsptr">'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_product+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_brand+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_package+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_lotnumber+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_supplier+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_quality+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;">'+list[o].stock_position+'</td>'+
		                			      '<td style="border-bottom: none;border-left: none;display:none;">'+list[o].stock_product+','+list[o].stock_danwei1+','+list[o].stock_brand+','+list[o].stock_package+','+list[o].stock_lotnumber+','+list[o].stock_position+','+list[o].stock_number+','+list[o].stock_id+'</td>'+
		                			  '</tr>';
	                		  }
                			  
                			  $('#xsproduct_tbody').html(ss);
                			  $('.xsproduct_table').show();
                			  //对象1到顶部的距离
              				  var xsp_table_top = $('.xsproduct_table').offset().top;
              				  //对象1的高度
              				  var xsp_table_height = $('.xsproduct_table').height();
              				  //对象2滚动的距离
              				  var scrollTop = $('.theme-popover1').scrollTop();
              				  //对象2到顶部的距离
              				  var thistop = getOffset($this.parentNode.parentNode).top;
              				  //两个对象之间的距离差
              				  var juli =thistop-xsp_table_top-xsp_table_height;
              				  $(".xsproduct_table").css({
              					  "top":juli+30+"px"
              				  });
                		  }
      	  		  	  }
                  }
			  );            
        });
		
		function add_line() {
		    max_line_num = $("#content tr:last-child").children("td").html();
		    if (max_line_num == null) {
		        max_line_num = 1;
		    } else {
		        max_line_num = parseInt(max_line_num);
		        max_line_num += 1;
		    }
		    $('#content').append(
			    "<tr class='xiaoshoutr' id='line" + max_line_num + "'>" +
			        "<td>" + max_line_num + "</td>" +
			        "<td><input type='hidden' name='id' class='id' style='width:80px;'><i class='glyphicon glyphicon-search'></i>&ensp;<input type='text' style='text-transform:uppercase;' class='searchxsp xs_product' onclick='search_xsproduct(this)'></td>" +
			        "<td></td>" +
			        "<td><input type='text' name='shoujia' class='xs_shoujia' onkeyup='clearNoNum(this)' style='width:80px;'></td>" +
			        "<td><input type='text' class='xs_number' name='shuliang' style='width:80px;' onkeyup='NumCheck(this)' ><b style='color:red;' class='maxkucun'></b></td>" +
			        "<td></td>" +
			        "<td></td>" +
			        "<td></td>" +
			        "<td></td>" +
			        "<td></td>" +
			        "<td>" +
			            "<a onclick='remove_line(this);'>删除</a> " +
			        "</td>" +
			        "<td style='display:none;'></td>" +
			    "</tr>"
			);
		}
		
		//删除选择记录
		function remove_line(index) {
		    if (index != null) {
		        currentStep = $(index).parent().parent().find("td:first-child").html();
		    }
		    if (currentStep == 0) {
		        alert('请选择一项!');
		        return false;
		    }
		    if (confirm("确定要删除此记录吗？")) {
		        $("#content tr").each(function () {
		            var seq = parseInt($(this).children("td").html());
		            if (seq == currentStep) { $(this).remove(); }
		            if (seq > currentStep) { $(this).children("td").each(function (i) { if (i == 0) $(this).html(seq - 1); }); }
		        });
		    }
		}
		
		//输入售价时出现记录
		$(document).on('input propertychange','.xs_shoujia',function(e){
			var $this = $(e.target);
			x = e.target;
			var xs_shoujia = $this.val();
			var xs_number = $this.parent().parent().children("td").find(".xs_number").val();
			var xs_othermoney = $('.xs_othermoney').val();
			if(xs_number == null || xs_number == ''){
				xs_number = 0;
			}
			if(xs_othermoney == null || xs_othermoney == ''){
				xs_othermoney = 0;
			}
			var arrobj = $this.parent().parent().children("td");
			arrobj[5].innerHTML = xs_shoujia * xs_number;
				
			var content_tr = $('#content').children("tr");
			var smalltotal = 0;
			for (var i = 0; i < content_tr.length; i++) {
				var tdArr = content_tr.eq(i).find("td");
				var xs_money = tdArr.eq(5).html();
				if(xs_money == null || xs_money == ''){
					xs_money = 0;
				}
				smalltotal += parseInt(xs_money);
			}
			$('.xs_yingshou').html(smalltotal + parseInt(xs_othermoney));
        });
        
        //输入数量时出现记录
		$(document).on('input propertychange','.xs_numberx',function(e){
			var xs_number = $(this).val();
			var xs_shoujia = $(this).parent().parent().children("td").find(".xs_shoujiax").val();
			var xs_othermoney = $('.xs_othermoneyx').val();
			if(xs_shoujia == null || xs_shoujia == ''){
				
				xs_shoujia = 0;
			}
			if(xs_othermoney == null || xs_othermoney == ''){
				xs_othermoney = 0;
			}
			var smalltotal = xs_shoujia * xs_number;
			$('.xs_yingshoux').html(smalltotal + parseInt(xs_othermoney));
        });
		
		//输入售价时出现记录
		$(document).on('input propertychange','.xs_shoujiax',function(e){
			var xs_shoujia = $(this).val();
			var xs_number = $(this).parent().parent().children("td").find(".xs_numberx").val();
			var xs_othermoney = $('.xs_othermoneyx').val();
			if(xs_number == null || xs_number == ''){
				xs_number = 0;
			}
			if(xs_othermoney == null || xs_othermoney == ''){
				xs_othermoney = 0;
			}
			var smalltotal = xs_shoujia * xs_number;
			$('.xs_yingshoux').html(smalltotal + parseInt(xs_othermoney));
        });
        
        //输入数量时出现记录
		$(document).on('input propertychange','.xs_number',function(e){
			var $this = $(e.target);
			x = e.target;
			var xs_number = $this.val();
			var maxkucun = $this.parent().find(".maxkucun").html().replace("（最大）","");
			if(xs_number > parseInt(maxkucun)){
				$this.val(parseInt(maxkucun));
			}
			var xs_shoujia = $this.parent().parent().children("td").find(".xs_shoujia").val();
			var xs_othermoney = $('.xs_othermoney').val();
			if(xs_shoujia == null || xs_shoujia == ''){
				
				xs_shoujia = 0;
			}
			if(xs_othermoney == null || xs_othermoney == ''){
				xs_othermoney = 0;
			}
			var arrobj = $this.parent().parent().children("td");
			arrobj[5].innerHTML = xs_shoujia * xs_number;
			
			var content_tr = $('#content').children("tr");
			var smalltotal = 0;
			for (var i = 0; i < content_tr.length; i++) {
				var tdArr = content_tr.eq(i).find("td");
				var xs_money = tdArr.eq(5).html();
				if(xs_money == null || xs_money == ''){
					xs_money = 0;
				}
				smalltotal += parseInt(xs_money);
			}
			$('.xs_yingshou').html(smalltotal + parseInt(xs_othermoney));
        });
        
		//点击除了指定位置的其他区域   隐藏table
        $('body').click(function(e) {
		   if(e.target.className != 'searchxsp')
		      if ( $('.xsproduct_table').is(':visible') ) {
		         $('.xsproduct_table').hide();
		      }
		});
		
		$(document).on('click','.xsptr',function(e){
            var $this = e.target;
            var arrtd = $($this).parent().children("td");
            var xspdetail = arrtd[arrtd.length-1].innerHTML;
            var arrdetail = xspdetail.split(",");
            /* alert(xspdetail);
            for (var i = 0; i < arrdetail.length; i++) {
				alert(arrdetail[i]);
			} */
            var arrobj = $(x).parent().parent().children("td");
			//将选中的型号信息填充到表格中
            $(x).parent().parent().children("td").find(".xs_product").val(arrdetail[0]);
            $(x).parent().parent().children("td").find(".id").val(arrdetail[7]);
            arrobj[2].innerHTML = arrdetail[1];
            arrobj[6].innerHTML = arrdetail[2];
            arrobj[7].innerHTML = arrdetail[3];
            arrobj[8].innerHTML = arrdetail[4];
            arrobj[9].innerHTML = arrdetail[5];
            $(x).parent().parent().children("td").find(".maxkucun").html(arrdetail[6]+"（最大）");
            //把kc_id 和   cb_id 放到td里面
        });
        
		
		function updateproduct(id ,stock_product,stock_brand,stock_package,stock_lotnumber,
				stock_quality,stock_number,stock_price,stock_position){
			$("#upstock_id").val(id);
			$("#upstock_product").val(stock_product);
			$("#upstock_brand").val(stock_brand);
			$("#upstock_package").val(stock_package);
			$("#upstock_lotnumber").val(stock_lotnumber);
			$("#upstock_number").val(stock_number);
			$("#upstock_price").val(stock_price);
			if(stock_quality=="原装"){
				$("#upstock_quality").html('<option selected="selected" value="原装">原装</option><option value="散新">散新</option><option value="国产">国产</option>');
			}else if(stock_quality=="散新"){
				$("#upstock_quality").html('<option value="原装">原装</option><option selected="selected" value="散新">散新</option><option value="国产">国产</option>');
			}else if(stock_quality=="国产"){
				$("#upstock_quality").html('<option value="原装">原装</option><option value="散新">散新</option><option selected="selected" value="国产">国产</option>');
			}
			if(stock_position=="柜台"){
				$("#upstock_position").html('<option selected="selected" value="柜台">柜台</option><option value="散新">公司</option><option value="国产">仓库</option>');
			}else if(stock_position=='公司'){
				$("#upstock_position").html('<option value="柜台">柜台</option><option selected="selected" value="公司">公司</option><option value="仓库">仓库</option>');
			}else if(stock_position=="仓库"){
				$("#upstock_position").html('<option value="柜台">柜台</option><option value="公司">公司</option><option selected="selected" value="仓库">仓库</option>');
			}
			$("#upkucun").css({"display":"block"})
		}
		
		$("#uptijiao").click(function (){
			var stock_id        = $("#upstock_id").val();
			var stock_product   = $("#upstock_product").val();
			var stock_brand     = $("#upstock_brand").val();
			var stock_package   = $("#upstock_package").val();
			var stock_lotnumber = $("#upstock_lotnumber").val();
			var stock_number    = $("#upstock_number").val();
			var stock_price     = $("#upstock_price").val();
			var stock_quality   = $("#upstock_quality").val();
			var stock_position  = $("#upstock_position").val();
			$.ajax({
				type:"post",
	            url:"updatestock",
	            async:true,
	            dataType: "json",
	            data: {
	            	stock_id:stock_id,
	            	stock_product:stock_product,
	            	stock_brand:stock_brand,
	            	stock_package:stock_package,
	            	stock_lotnumber:stock_lotnumber,
	            	stock_number:stock_number,
	            	stock_price:stock_price,
	            	stock_quality:stock_quality,
	            	stock_position:stock_position
	            },
				success : function(data){
					if(data.result=="login"){
						window.location.href="frontLogin";
	            	}else {
	            		window.location.href="stockAll";
	            	}
				},
				error: function() {  
	                alert('对不起失败了，请检查库存信息是否有误！');  
	            }  
	        });
		})
		
		//提交销售单
		$(document).on('click','#xiaoshou',function(e){
			var xs_type = $(".xs_type").val();
			var xs_kehu = $('.xs_kehu').val();
			var xs_name = $('.xs_name').val();
			var xs_tel = $('.xs_tel').val();
			var xs_address = $('.xs_address').val();
			var xs_yingshou = $('.xs_yingshou').html();
			var xs_shishou = $('.xs_shishou').val();
			var xs_othermoney = $('.xs_othermoney').val();
			var xs_pay = $(".xs_pay option:selected").text();
			var xs_shoukuandate = $('.xs_shoukuandate').val();
			var xs_beizhu = $('.xs_beizhu').val();
			var content_tr = $('#content').children("tr");
			var xs_status = $('.xs_status').val();
			var arr_tdstr='';
			var arr_idstr='';
			var arr_sustr='';
			//将数量  售价  总计金额  kc_id cb_id放到数组里 
			for (var i = 0; i < content_tr.length; i++) {
				var tdArr = content_tr.eq(i).find("td");
				arr_sustr += tdArr.eq(4).find(".xs_number").val()+",";
				arr_tdstr += tdArr.eq(3).find(".xs_shoujia").val()+",";
				arr_idstr += tdArr.eq(1).find(".id").val()+",";
			}
			$.ajax({
				type:"post",
	            url:"addxiaoshou",
	            async:true,
	            dataType: "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            data: {
	            	xs_type:xs_type,
	            	xs_kehu:xs_kehu,
	            	xs_name:xs_name,
	            	xs_phone:xs_tel,
	            	xs_address:xs_address,
	            	xs_yingshou:xs_yingshou,
	            	xs_shishou:xs_shishou,
	            	xs_othermoney:xs_othermoney,
	            	xs_pay:xs_pay,
	            	xs_shoukuandate1:xs_shoukuandate,
	            	xs_beizhu:xs_beizhu,
	            	shoujia:arr_tdstr,
	            	number:arr_sustr,
	            	id:arr_idstr,
	            	xs_status:xs_status
	            },
				success : function(data){
					if(data.result=="login"){
						window.location.href="frontLogin";
	            	}else {
	            		window.location.href="xiaoshouAll";
	            	}
				},
				error: function() {  
	                alert('对不起失败了，请检查订单信息是否有误！');  
	            }  
	        });
           });
		
		$(document).on('click','#uponcliick',function(e){
			var documentUponcliickdaying = document.getElementById("uponcliickdaying");//保存并打印按钮
			var documentUponcliick = document.getElementById("uponcliick");//保存按钮
			documentUponcliick.disabled=true;
			documentUponcliickdaying.disabled = true;
			var xs_id = $("#upid").val();
			var xs_type = $("#uptype").val();
			var xs_kehu = $('#upkehu').val();
			var xs_name = $('#upname').val();
			var xs_tel = $('#upphone').val();
			var xs_address = $('#upaddress').val();
			var xs_yingshou = $('#upyingshou').html();
			var xs_shishou = $('#upshishou').val();
			var xs_othermoney = $('#upothermoney').val();
			var xs_pay = $("#uppay option:selected").text();
			var xs_shoukuandate = $('#upshoukuandate').val();
			var xs_beizhu = $('#upbeizhu').val();
			var content_tr = $('#xsdetailtbody').children("tr");
			var xs_status = $('#upstatus').val();
			var arr_tdstr='';
			var arr_sidstr='';
			var arr_ridstr='';
			var arr_sustr='';
			//将数量  售价  总计金额  kc_id cb_id放到数组里 
			for (var i = 0; i < content_tr.length; i++) {
				var tdArr = content_tr.eq(i).find("td");
				arr_sustr += tdArr.eq(4).find(".xs_numberx").val()+",";
				arr_tdstr += tdArr.eq(3).find(".xs_shoujiax").val()+",";
				arr_sidstr += tdArr.eq(1).find(".upsid").val()+",";
				arr_ridstr += tdArr.eq(5).find(".uprid").val()+",";
			}
			$.ajax({
				type:"post",
	            url:"upxiaoshou",
	            async:true,
	            dataType: "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            data: {
	            	xs_type:xs_type,
	            	xs_kehu:xs_kehu,
	            	xs_name:xs_name,
	            	xs_phone:xs_tel,
	            	xs_address:xs_address,
	            	xs_yingshou:xs_yingshou,
	            	xs_shishou:xs_shishou,
	            	xs_othermoney:xs_othermoney,
	            	xs_pay:xs_pay,
	            	xs_shoukuandate1:xs_shoukuandate,
	            	xs_beizhu:xs_beizhu,
	            	shoujia:arr_tdstr,
	            	number:arr_sustr,
	            	sid:arr_sidstr,
	            	rid:arr_ridstr,
	            	xs_status:xs_status,
	            	xs_id:xs_id
	            },
				success : function(data){
					if(data.result=="login"){
						window.location.href="frontLogin";
	            	}else {
	            		window.location.href="xiaoshouAll";
	            	}
				},
				error: function() {  
	                alert('对不起失败了，请检查订单信息是否有误！');
	                documentUponcliick.disabled=false;
	    			documentUponcliickdaying.disabled = false;
	            }  
	        });
           });
		
			/* $("input").on("keydown",function(e){
			      if(e.key == "Enter"){
			    	  $("#sousuo").trigger("click");
		    		  $("#sousuork").trigger("click");
		    		  $("#sousuoxs").trigger("click");
			      }
			}); */
		
			$('.trtd').hover(function(){
				$(this).css('background','#EFEEF0');
					
			},function(){
				$(this).css('background','white');	
			});
			
			$('.overbutton').hover(function(){
				$(this).css('background','green');	
				$(this).css("border","1px green solid");
			},function(){
				$(this).css('background','red');
				$(this).css("border","1px red solid");
			});
			
			$(".pageMove").hover(function(){
				$(this).css("background","green");
				$(this).css("border","1px green solid");
			},function(){
				$(this).css("background","#337AB7");
				$(this).css("border","1px #337AB7 solid");
			});
			
			$(".button1").hover(function(){
				$(this).css("background","black");
				$(this).css("border","1px black solid");
			},function(){
				$(this).css("background","#A55C08");
				$(this).css("border","1px #A55C08 solid");
			});
			
			$(".button2").hover(function(){
				$(this).css("background","black");
				$(this).css("border","1px black solid");
			},function(){
				$(this).css("background","green");
				$(this).css("border","1px green solid");
			});
			
			$(".button3").hover(function(){
				$(this).css("background","black");
				$(this).css("border","1px black solid");
			},function(){
				$(this).css("background","#AD0397");
				$(this).css("border","1px #AD0397 solid");
			});
			
			$(".button5").hover(function(){
				$(this).css("background","blue");
				$(this).css("border","1px blue solid");
			},function(){
				$(this).css("background","#1296D8");
				$(this).css("border","1px #1296D8 solid");
			});
			
			$(".button6").hover(function(){
				$(this).css("background","red");
				$(this).css("border","1px red solid");
			},function(){
				$(this).css("background","#FD3D3D");
				$(this).css("border","1px #FD3D3D solid");
			});
			
			$(".kai").hover(function(){
				$(this).css("font-size","20px");
			},function(){
				$(this).css("font-size","15px");
			});
			
			$(".button7").hover(function(){
				$(this).css("background","black");
				$(this).css("border","1px black solid");
			},function(){
				$(this).css("background","#1296D8");
				$(this).css("border","1px #1296D8 solid");
			});
			$(".button8").hover(function(){
				$(this).css("background","black");
				$(this).css("border","1px black solid");
			},function(){
				$(this).css("background","#D9534F");
				$(this).css("border","1px #D9534F solid");
			});
			
			$(".button9").hover(function(){
				$(this).css("background","black");
				$(this).css("border","1px black solid");
			},function(){
				$(this).css("background","#912CEE");
				$(this).css("border","1px #912CEE solid");
			});
			
			$(".kctr").hover(function(){
				$(this).find(".bianji").addClass("yuanback");
				$(this).find(".tianjia").addClass("yuanback1");
				$(this).find(".diaohuo").addClass("yuanback2");
				$(this).find(".bianji1").css("color","white");
				$(this).find(".shanchu1").css("color","white");
			},function(){
				$(this).find(".bianji").removeClass("yuanback");
				$(this).find(".tianjia").removeClass("yuanback1");
				$(this).find(".diaohuo").removeClass("yuanback2");
				$(this).find(".bianji1").css("color","blue");
				$(this).find(".shanchu1").css("color","blue");
			});
			
			$('#sousuo').click(function(){
				var product = encodeURIComponent($('#product').val());
				var url="stockAll?product="+product;
				window.location.href=url;
			});
			
			$('#sousuork').click(function(){
				var product = encodeURIComponent($('#product').val());
				var url="rkreportAll?product="+product;
				window.location.href=url;
			});
			
			$('#sousuoxs').click(function(){
				var product = encodeURIComponent($('#product').val());
				var url="xiaoshouAll?product="+product;
				window.location.href=url;
			});
			
			$('#buttonmove1').click(function(){
				var min = 1;
				var max = '${count}';
				var page = $('#pagemove1').val();
				if(page == ''){
					alert("请输入跳转页数");
				}else{
					if(page < min){
						page = min;
					}
					if(page > parseInt(max)){
						page = max;
					}
					window.location.href="stockAll?page="+page+"&&rows=10";		
				}
			});
			
			$('#noxiaoshou').click(function(){
				$('.theme-popover-mask').fadeOut(100);
				
				$('.theme-popover1').slideUp(200);
			});

			$('#buttonmove2').click(function(){
				var min = 1;
				var max = '${count}';
				var page = $('#pagemove2').val();
				if(page == ''){
					alert("请输入跳转页数");
				}else{
					if(parseInt(page) < parseInt(min)){
						page = min;
					}
					if(page > parseInt(max)){
						page = max;
					}
					window.location.href="stockAll?page="+page+"&&rows=10";
				}
			});
			
			$('#rktiaozhuan').click(function(){
				var min = 1;
				var max = '${count}';
				var page = $('#pagemove2').val();
				if(page == ''){
					alert("请输入跳转页数");
				}else{
					if(parseInt(page) < parseInt(min)){
						page = min;
					}
					if(page > parseInt(max)){
						page = max;
					}
					window.location.href="rkreportAll?page="+page+"&&rows=10";
				}
			});
			$('#xstiaozhuan').click(function(){
				var min = 1;
				var max = '${count}';
				var page = $('#pagemove2').val();
				if(page == ''){
					alert("请输入跳转页数");
				}else{
					if(parseInt(page) < parseInt(min)){
						page = min;
					}
					if(page > parseInt(max)){
						page = max;
					}
					window.location.href="xiaoshouAll?page="+page+"&&rows=10";
				}
			});
		</script>

	<!-- 分页跳转 -->
	<script type="text/javascript">
			  var app = angular.module('myApp', []);
			  function setPage(length, amount, num, first) {//创建保存页码数组的函数
			    //length数据总条数
			    //amount每页数据条数
			    //num保留的页码数
			    //first第一页的页码
			    var pages = []; //创建分页数组
			    var page = Math.ceil(length / amount);
			    if (page <= num) {
			      for (var i = 1; i <= page; i++) {
			        pages.push(i);
			      }
			    }
			    if (page > num) {
			      for (var i = first; i < first + num; i++) {
			        pages.push(i);
			      }
			    }
			    return pages;
			  }
			  app.controller('myController', function($scope) {
			    $scope.firstPage = 1;
			    $scope.pageNum = 5;
			    $scope.page = '${page}';
			    var amount = '${total}';//数据总条数
			    var each = '${pageSize}';//每页显示的条数
			    $scope.sub = function(page) {
			        $scope.lastPage = Math.ceil(amount / each);
			        if (page >= $scope.pageNum) {
			          $scope.firstPage = page - Math.floor($scope.pageNum / 2);
			        } else {
			          $scope.firstPage = 1;
			        }
			        if ($scope.firstPage > $scope.lastPage - $scope.pageNum) {
			          $scope.firstPage = $scope.lastPage - $scope.pageNum + 1;
			        }
			        $scope.pages = setPage(amount, each, $scope.pageNum, $scope.firstPage);
			        $scope.page = page;
			    }
			    $scope.sub('${page}');
			  });
			
		</script>
	<script type="text/javascript">  
	        $(document).ready(function () {  
	            $("#btnDel").click(function () {  
	                $(this).parent().parent().parent().parent().find("#mainbody").find(":checked").parent().parent().fadeOut("show"); //隐藏所有被选中的input元素  
	                //parent() 获得当前匹配元素集合中每个元素的父元素,  
	  
	            })  
	  
	            $("tr").mousemove(function () {  
	                $(this).css("background", "#F0F0F0");  //鼠标经过背景颜色变为灰色  
	  
	            })  
	            $("tr").mouseout(function () {  
	                $(this).css("background", "#fff");  //离开后背景颜色回复白色  
	            })  
	  
	            //全选  
	            $("#checkAll").click(function () {  
	  
	                if ($("#checkAll").attr("checked") == false) {  
	  
	                    $("input[name='checkbox']").each(function () {  
	                        $(this).attr("checked", true);  
	                    });  
	                } else {  
	  
	                    $("input[name='checkbox']").each(function () {  
	                        $(this).attr("checked", false);  
	                    });  
	                }  
	  
	            });
	            
	            $('#addstock_danwei1').change(function(){
            		var p1 = $(this).children('option:selected').text();//这就是selected的值 
            		$('.danwei1').html(p1);
            	});
	            
            	$('#dhnumber').bind('input propertychange', function() {
	            	if(!/^[1-9]+\d*$/.test(this.value)){this.value=this.value.replace('.','');}
	            	if($(this).val() == ''){
	            		$(this).val(1);
	            	}
	            	var number=$(this).val();
	            	var chengben = '${s.stock_price}';
	            	$('.money').html(number*chengben);
	            });
            	
	            $('.number').bind('input propertychange', function() {
	            	if(!/^[1-9]+\d*$/.test(this.value)){this.value=this.value.replace('.','');}
	            	if($(this).val() == ''){
	            		$(this).val(1);
	            	}
	            	var number=$(this).val();
	            	var chengben = $('#addstock_price').val();
	            	if(chengben == ''){
	            		chengben = 0;
	            	}
	            	$('.money').html(number*chengben);
	            });
	            
	            $('#addstock_price').bind('input propertychange', function() { 
	            	var chengben = $(this).val();
	            	var number = $('#addstock_number').val();
	            	if(number == ''){
	            		number = 0;
	            	}
	            	$('.money').html(number*chengben);  
	            });
	            
	           /*  $('.g_product').change(function(){
	            	$(this).val($(this).val().toUpperCase());
            	}); */
	            
	            /* $('.g_product').on('input propertychange', function() {
	            	$(this).val($(this).val().toUpperCase());
	            }); */
	            
	            
	            /* $('.pinpai').bind('input propertychange', function() {
	            	$(this).val($(this).val().toUpperCase());
	            });
	            
	            $('.fengzhuang').bind('input propertychange', function() {
	            	$(this).val($(this).val().toUpperCase());
	            }); */
	            
	            /* $('#product').bind('input propertychange', function() {
	            	$(this).val($(this).val().toUpperCase());
	            }); */
	            
	        });  
    	</script>
	<!-- 添加一行新表格数据   -->
	<script>  
	        function append() {  
	  
	            /* var strAppend = '<tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;"><td ><input type="checkbox" value="" editable="false" name="checkbox"></td><td contenteditable="true"></td><td contenteditable="true"></td><td contenteditable="true"></td><td contenteditable="true">0</td><td contenteditable="true">0</td><td>0</td><td contenteditable="true"></td><tr>'; */
	            var strAppend = '<tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;"><td ><input type="checkbox" value="" editable="false" name="checkbox"></td><td contenteditable="true"></td><td contenteditable="true"></td><td contenteditable="true"></td><td contenteditable="true"></td><tr>';
	  
	            $("#AddFamily tbody ").append(strAppend);  
	  
	        }  
	    </script>
	<!--  @*创建表格*@  -->
	<script>  
	        //绑定编辑、回车事件  
	        $(function () {
	        	
	        	$('.danwei1').html($("#addstock_danwei1 option:selected").text());
	        	
	        	$("#addkucun").click(function(){
	        		var rand1      = encodeURIComponent($("#rand1 option:selected").text());
	    			var rand2      = encodeURIComponent($("#rand2 option:selected").text());
	    			var product    = encodeURIComponent($(".g_product").val());
	    			var pinpai     = encodeURIComponent($(".pinpai").val());
	    			var fengzhuang = encodeURIComponent($(".fengzhuang").val());
	    			var pihao      = encodeURIComponent($(".pihao").val());
	    			var danwei1    = encodeURIComponent($("#danwei1 option:selected").text());
	    			var baozhuang  = encodeURIComponent($(".baozhuang").val());
	    			var danwei2    = encodeURIComponent($("#danwei2 option:selected").text());
	    			var huoqi      = encodeURIComponent($(".huoqi").val());
	    			var shoujia    = encodeURIComponent($(".shoujia").val());
	    			var beizhu     = encodeURIComponent($(".beizhu").val());
	        		var url        = "add_guitaikucun?rand1="+rand1+"&rand2="+rand2+"&product="+product+
	        				         "&pinpai="+pinpai+"&fengzhuang="+fengzhuang+"&pihao="+pihao+
	        				         "&danwei1="+danwei1+"&baozhuang="+baozhuang+"&danwei2="+danwei2+
	        				         "&huoqi="+huoqi+"&shoujia="+shoujia+"&beizhu="+beizhu;
	        		window.location.href=url;
	        	});
	        	
	        	$("#addcangku").click(function(){
	        		var sousuo  = encodeURIComponent('${sousuo }');
	        		var page    = encodeURIComponent('${page }');
	        		var cangku  = encodeURIComponent($('.cangku').html());
	    			var beizhu  = encodeURIComponent($(".cangku_beizhu").html());
	        		var url     = "add_cangku?sousuo="+sousuo+"&page="+page+"&cangku="+cangku+
	        				      "&rows=10"+"&beizhu="+beizhu;
	        		window.location.href=url;
	        	});
	        	
	        	$("#tianjia").click(function(){
	        		var stock_product 		= encodeURIComponent($('#addstock_product').val());
	        		var stock_brand   		= encodeURIComponent($('#addstock_brand').val());
	        		var stock_package 		= encodeURIComponent($('#addstock_package').val());
	    			var stock_lotnumber 	= encodeURIComponent($("#addstock_lotnumber").val());
	    			var stock_number 		= encodeURIComponent($("#addstock_number").val());
	    			var stock_price 		= encodeURIComponent($("#addstock_price").val());
	    			var stock_position 		= encodeURIComponent($("#addstock_position").val());
	    			var stock_quality  		= encodeURIComponent($("#addstock_quality").val());
    				var stock_danwei1  		= encodeURIComponent($("#addstock_danwei1").val());
	    			var stock_danwei2  		= encodeURIComponent($("#addstock_danwei2").val());
	    			var stock_baozhuangnum  = encodeURIComponent($("#addstock_baozhuangnum").val());
	    			var rkreport_supplier 	= encodeURIComponent($("#addrkreport_supplier").val());
	    			var rkreport_address    = encodeURIComponent($("#addrkreport_address").val());
        			var url = "addstock?stock_product="+stock_product+"&stock_brand="+stock_brand+
        					"&stock_package="+stock_package+"&stock_lotnumber="+stock_lotnumber+"&stock_number="+stock_number+
        					"&stock_price="+stock_price+"&stock_position="+stock_position+"&&stock_quality="+stock_quality+
        					"&&stock_danwei1="+stock_danwei1+"&&stock_danwei2="+stock_danwei2+
        					"&&stock_baozhuangnum="+stock_baozhuangnum+"&&rkreport_supplier="+rkreport_supplier+
        					"&&rkreport_address="+rkreport_address;
	        		$.post(url, function(data){
	                	if(data.result=="login"){
	                		window.location.href="frontLogin";
	      	  			}else{
	      	  				window.location.href="stockAll";
	      	  			}
	                });
	        	});
	        	
	        	$("#xiaoshouAll").click(function (){
	        		window.location.href="xiaoshouAll";
	        	})
	        	
	        	$("#diaohuo").click(function(){
	        		var stock_id       = '${s.stock_id}';
	        		var stock_number   = encodeURIComponent($('#dhnumber').val());
	    			var stock_position = encodeURIComponent($("#dhstock_position").val());
		            $.post("diaohuostock?stock_id="+stock_id+"&stock_number="+stock_number+"&stock_position="+stock_position,
		            	function(data){
		                	if(data.result=="login"){						
		                		window.location.href="frontLogin";
		      	  			}else{
		      	  				window.location.href="stockAll";
		      	  			}
	            	});		          
	        				          
	        	});
	        	$('#churu').click(function(){
	        		var url = "rkreportAll";
	        		window.location.href=url;
	        	});
	        	
	        	$('.gohome').click(function(){
	        		window.location.href="stockAll";
	        	});
	        	
	        	$('.kucunhome').click(function(){
	        		window.location.href="stockAll";
	        	});
	        	
	        	$('.jiakucun').click(function(){
	        		window.location.href="cangkulist?page=${page}&&rows=10&&sousuo=${sousuo}";
	        	});
	        	
	        	$('#noaddkucun').click(function(){
	        		window.location.href="stockAll";
	        	});
	        	
	        	$('#noupkucun').click(function(){
	        		window.location.href="stockAll?page=${page}";
	        	});
	        	
	        	$('#notianjia').click(function(){
	        		window.location.href="stockAll";
	        	});
	        	
	        	$('#noaddcangku').click(function(){
	        		window.location.href="stockAll";
	        	});
	        	
	        	$('#nodiaohuo').click(function(){
	        		window.location.href="stockAll";
	        	});
	        	
	            //   $('#build').click(build);//实现创建表格  
	            $('#btnEdit').click(edit);  
	  
	            $('#cells, #rows').keyup(function (e) {  
	                if (e.keyCode === 13) {  
	                  //添加存入数据库的代码  
	                }  
	            });  
	            
	          //转成可编辑的表格  
		        /*global $, window*/  
		        $.fn.editableTableWidget = function (options) {  
		            'use strict';  
		            return $(this).each(function () {  
		                var buildDefaultOptions = function () {  
		                    var opts = $.extend({}, $.fn.editableTableWidget.defaultOptions);  
		                    opts.editor = opts.editor.clone();  
		                    return opts;  
		                },  
		                    activeOptions = $.extend(buildDefaultOptions(), options),  
		                    ARROW_LEFT = 37, ARROW_UP = 38, ARROW_RIGHT = 39, ARROW_DOWN = 40, ENTER = 13, ESC = 27, TAB = 9,  
		                    element = $(this),  
		                    editor = activeOptions.editor.css('position', 'absolute').hide().appendTo(element.parent()),  
		                    active,  
		                    showEditor = function (select) {  
		                        active = element.find('td:focus');  
		                        if (active.length) {  
		                            editor.val(active.text())  
		                                .removeClass('error')  
		                                .show()  
		                                .offset(active.offset())  
		                                .css(active.css(activeOptions.cloneProperties))  
		                                .width(active.width())  
		                                .height(active.height())  
		                                .focus();  
		                            if (select) {  
		                                editor.select();  
		                            }  
		                        }  
		                    },  
		                    setActiveText = function () {  
		                        var text = editor.val(),  
		                            evt = $.Event('change'),  
		                            originalContent;  
		                        if (active.text() === text || editor.hasClass('error')) {  
		                            return true;  
		                        }  
		                        originalContent = active.html();  
		                        active.text(text).trigger(evt, text);  
		                        if (evt.result === false) {  
		                            active.html(originalContent);  
		                        }  
		                    },  
		                    movement = function (element, keycode) {  
		                        if (keycode === ARROW_RIGHT) {  
		                            return element.next('td');  
		                        } else if (keycode === ARROW_LEFT) {  
		                            return element.prev('td');  
		                        } else if (keycode === ARROW_UP) {  
		                            return element.parent().prev().children().eq(element.index());  
		                        } else if (keycode === ARROW_DOWN) {  
		                            return element.parent().next().children().eq(element.index());  
		                        }  
		                        return [];  
		                    };  
		                editor.blur(function () {  
		                    setActiveText();  
		                    editor.hide();  
		                }).keydown(function (e) {  
		                    if (e.which === ENTER) {  
		                        setActiveText();  
		                        editor.hide();  
		                        active.focus();  
		                        e.preventDefault();  
		                        e.stopPropagation();  
		                    } else if (e.which === ESC) {  
		                        editor.val(active.text());  
		                        e.preventDefault();  
		                        e.stopPropagation();  
		                        editor.hide();  
		                        active.focus();  
		                    } else if (e.which === TAB) {  
		                        active.focus();  
		                    } else if (this.selectionEnd - this.selectionStart === this.value.length) {  
		                        var possibleMove = movement(active, e.which);  
		                        if (possibleMove.length > 0) {  
		                            possibleMove.focus();  
		                            e.preventDefault();  
		                            e.stopPropagation();  
		                        }  
		                    }  
		                }).on('input paste', function () {  
	                        var evt = $.Event('validate');  
	                        active.trigger(evt, editor.val());  
	                        if (evt.result === false) {  
	                            editor.addClass('error');  
	                        } else {  
	                            editor.removeClass('error');  
	                        }  
	                    })  
		                element.on('click keypress dblclick', showEditor)  
		                    .css('cursor', 'pointer')  
		                    .keydown(function (e) {  
		                        var prevent = true,  
		                            possibleMove = movement($(e.target), e.which);  
		                        if (possibleMove.length > 0) {  
		                            possibleMove.focus();  
		                        } else if (e.which === ENTER) {  
		                            showEditor(false);  
		                        } else if (e.which === 17 || e.which === 91 || e.which === 93) {  
		                            showEditor(true);  
		                            prevent = false;  
		                        } else {  
		                            prevent = false;  
		                        }  
		                        if (prevent) {  
		                            e.stopPropagation();  
		                            e.preventDefault();  
		                        }  
		                    });  
		  
		                element.find('td').prop('tabindex', 1);  
		  
		                $(window).on('resize', function () {  
		                    if (editor.is(':visible')) {  
		                        editor.offset(active.offset())  
		                            .width(active.width())  
		                            .height(active.height());  
		                    }  
		                });  
		            });  
		  
		        };  
		        $.fn.editableTableWidget.defaultOptions = {  
		            cloneProperties: ['padding', 'padding-top', 'padding-bottom', 'padding-left', 'padding-right',  
		                'text-align', 'font', 'font-size', 'font-family', 'font-weight',  
		                'border', 'border-top', 'border-bottom', 'border-left', 'border-right'],  
		            editor: $('<input>')  
		        };  
	        });  
	  
	      	//获取对象到设备顶部的距离
			function getOffset (el) {
				const box = el.getBoundingClientRect();
				return {
			    	top: box.top + window.pageYOffset - document.documentElement.clientTop,
			    	left: box.left + window.pageXOffset - document.documentElement.clientLeft
				}
			}
	        
	        //将表格转成可编辑的表格  
	        function edit(index) {  
	            //  $('#table').editableTableWidget();--效果是单击编辑按钮后，所有的都可以编辑  
	            // $(":checked").editableTableWidget();           
	            $(":checked").parent().parent().editableTableWidget();//整行的可以编辑  
	  
	        }  
	        /* $(document).on('click','#baocunxiaoshou1',function(e){
				
            }); */
	        /** 数字金额大写转换(可以处理整数,小数,负数) */    
		    function smalltoBIG(n) {    
		        var fraction = ['角', '分'];    
		        var digit = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'];    
		        var unit = [ ['元', '万', '亿'], ['', '拾', '佰', '仟']  ];    
		        var head = n < 0? '欠': '';    
		        n = Math.abs(n);    
		      
		        var s = '';    
		      
		        for (var i = 0; i < fraction.length; i++)     
		        {    
		            s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');    
		        }    
		        s = s || '整';    
		        n = Math.floor(n);    
		      
		        for (var i = 0; i < unit[0].length && n > 0; i++)     
		        {    
		            var p = '';    
		            for (var j = 0; j < unit[1].length && n > 0; j++)     
		            {    
		                p = digit[n % 10] + unit[1][j] + p;    
		                n = Math.floor(n / 10);    
		            }    
		            s = p.replace(/(零.)*零$/, '').replace(/^$/, '零')  + unit[0][i] + s;    
		        }    
		        return head + s.replace(/(零.)*零元/, '元').replace(/(零.)+/g, '零').replace(/^整$/, '零元整');    
		    }
	    </script>
</body>
</html>