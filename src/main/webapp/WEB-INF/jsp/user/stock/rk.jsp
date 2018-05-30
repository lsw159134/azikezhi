<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<title>在芯间-开票信息</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>js/angular.js"></script>
		<script src="<%=basePath %>js/tooltip.js"></script>
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/tooltip.css" />
		<style>
			body{
				margin: 0 auto;
			}
			a:HOVER {
				text-decoration: none;
			}
			table input{
				border:1px #DDDDDD solid;
				padding:5px 10px 5px 10px;
				-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;
			}
			table input:hover{
				border-color: #CD6600;
			}
			table select{
				width: 153px;
				padding:5px 10px 5px 10px;
				-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;
			}
			table select:hover{
				border-color: #CD6600;
			}
			table textarea {
				padding:5px 10px 5px 10px;
				min-width: 700px;
				-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;
			}
			table textarea:hover{
				border-color: #CD6600;
			}
			.g_product,.pihao{
				width: 230px;
			}
			.table1 th,.table1 td{
				text-align: center;
			}
			.yuanback{
				border-radius: 50%;
				background-color: #1296D8;
				padding: 5px 8px;
				display:inline-block;
				text-align: center;
			}
			.yuanback1{
				border-radius: 50%;
				background-color: red;
				padding: 5px 7px 5px 8px;
				display:inline-block;
				text-align: center;
			}
			.yuanback2{
				border-radius: 50%;
				background-color: #4D994D;
				padding: 5px 7px 5px 8px;
				display:inline-block;
				text-align: center;
			}
			.kctr td{
				height: 50px;
				vertical-align: middle!important;
			}
			.theme-popover-mask {
				z-index: 9998;
				position:fixed;
				top:0;
				left:0;
				width:100%;
				height:100%;
				background:#000;
				opacity:0.4;
				filter:alpha(opacity=40);
				display:none
			}
			.theme-popover {
				z-index:9999;
				position:fixed;
				top:40%;
				left:40%;
				width:1130px;
				height:560px;
				margin:-180px 0 0 -330px;
				border-radius:5px;
				border:solid 2px #666;
				background-color:#fff;
				display:none;
				box-shadow: 0 0 10px #666;
				overflow:auto;
			}
			
			.theme-close {
				float:right;
				color:#999;
				padding:5px;
				margin:-2px -5px -5px;
				font:bold 14px/14px simsun;
				text-shadow:0 1px 0 #ddd
			}
			.theme-close:hover {
				color:#444;
			}
		</style>
	</head>
	<body ng-app="myApp" ng-controller="myController">
		<div class="container" style="margin: 20px 0 0px 0 "></div>
		<div class="container" style="text-align: center;">
			<div class="row">
				<div class="col-md-12" style="text-align: left;padding-left: 30px;">
					<button id="churu" class="btn btn-primary button9 glyphicon glyphicon-home gohome" style="padding-top: 4px;height:30px;background: #912CEE;">库存管理</button>&emsp;
					<button type="button" class="btn btn-primary button7 addbutton glyphicon glyphicon-plus theme-login" data-toggle="modal" data-target="#myModal" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加型号">添加库存</button>
					<!-- <button type="button" class="btn btn-primary button7 jiakucun glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加仓库">添加仓库</button> -->
				</div>
			</div>
			<c:if test="${diaohuo eq 'diaohuo' }">
				<div class="row">
					<div class="col-md-12" style="text-align: left;padding-left: 30px;">
						<button type="button" class="btn btn-primary glyphicon button7 kucunhome glyphicon-home" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="库存管理首页">库存管理</button>&emsp;
						<button type="button" class="btn btn-primary button7 addbutton glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加型号">添加型号</button>&emsp;
						<button type="button" class="btn btn-primary glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: black;border-color: black;" title="库存调货">库存调货</button>
					</div>
				</div>
				<div class="container" style="margin-top: 15px;">
					<div class="row">
						<div class="col-md-12">
							<table class="table1 table table-bordered table-hover table-responsive" style="text-align: center;border-collapse: collapse;width: 1100px;" cellspacing="0" cellpadding="0">
								<tr class="kctr">
									<th style="vertical-align: middle!important;">型号</th>
									<td style="vertical-align: middle!important;">${product }</td>
									<th style="vertical-align: middle!important;">品牌</th>
									<td style="vertical-align: middle!important;">${pinpai }</td>
									<th style="vertical-align: middle!important;">封装</th>
									<td style="vertical-align: middle!important;">${fengzhuang }</td>
								</tr>
								<tr class="kctr">
									<th style="vertical-align: middle!important;">批号</th>
									<td style="vertical-align: middle!important;" class="pihao">${dh.cangku.pihao }</td>
									<th style="vertical-align: middle!important;">数量</th>
									<td style="vertical-align: middle!important;">
										<input type="number" class="number" value="${dh.cangku.number }" placeholder="数量" min="0"
										 style="text-align: center;width: 100px;color: #CD8500;font-weight: bold;">
									</td>
									<th style="vertical-align: middle!important;">进货单价</th>
									<td style="vertical-align: middle!important;color: #9B86FB;font-weight: bold;" class="chengben">${dh.cangku.chengben }</td>
								</tr>
								<tr class="kctr">
									<th style="vertical-align: middle!important;">总计金额</th>
									<td class="money" style="vertical-align: middle!important;color: #FC7947;font-weight: bold;">${dh.cangku.money }</td>
									<th style="vertical-align: middle!important;">供应商</th>
									<td style="vertical-align: middle!important;" class="cb_supplier">${dh.cangku.cb_supplier }</td>
									<th style="vertical-align: middle!important;">品质</th>
									<td style="vertical-align: middle!important;" class="cb_quality">${dh.cangku.cb_quality}</td>
								</tr>
								<tr class="kctr">
									<th style="vertical-align: middle!important;">仓库</th>
									<td style="vertical-align: middle!important;">
										<b>${dh.cangku.cangku_name}</b>&ensp;<span class="glyphicon glyphicon-log-out" style="color: red;"></span>&ensp;
										<select name="cangku_name" id="cangku_name" style="width: 100px;">
											<c:if test="${dh.cangku.cangku_name ne '柜台' }"><option value="0">柜台</option></c:if>
											<c:if test="${dh.cangku.cangku_name ne '公司' }"><option value="1">公司</option></c:if>
											<c:if test="${dh.cangku.cangku_name ne '仓库' }"><option value="2">仓库</option></c:if>
										</select>
									</td>
									<th style="vertical-align: middle!important;">详细位置</th>
									<td style="vertical-align: middle!important;" colspan="3">
										<input type="text" class="cb_place" value="${dh.cangku.cb_place}" style="text-align: center;width: 500px;color: #4D994D;font-weight: bold;" placeholder="详细位置">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<button id="diaohuo" type="button" class="btn btn-primary button5" style="cursor:pointer;height: 30px;padding-top: 4px;background: #1296D8;border-color: #1296D8;" title="添加当前库存">确认</button>
						<button id="nodiaohuo" type="button" class="btn btn-primary button6" style="cursor:pointer;height: 30px;padding-top: 4px;background: #FD3D3D;border-color: #FD3D3D;" title="取消添加库存">取消</button>
					</div>
				</div>
			</c:if>
			<c:if test="${upkucun eq 'upkucun' }">
				<div class="row">
					<div class="col-md-12" style="text-align: left;padding-left: 30px;">
						<button type="button" class="btn btn-primary glyphicon button7 kucunhome glyphicon-home" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="库存管理首页">库存管理</button>&emsp;
						<button type="button" class="btn btn-primary button7 addbutton glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加型号">添加型号</button>&emsp;
						<!-- <button type="button" class="btn btn-primary button7 jiakucun glyphicon glyphicon-plus" style="cursor:pointer;height: 30px;padding-top: 4px;background: #5CB85C;border-color: #5CB85C;" title="点击添加仓库">添加仓库</button> -->
						<button type="button" class="btn btn-primary glyphicon glyphicon-edit" style="cursor:pointer;height: 30px;padding-top: 4px;background: black;border-color: black;" title="修改型号">修改型号</button>
					</div>
				</div>
				<div class="upkucun" style="margin-top: 10px;">
					<div class="row">
						<div class="col-md-12" style="text-align: left;padding-left: 30px;">
							<table class="table table-bordered table-hover table-condensed table-responsive" style="text-align: center;border-collapse: collapse;width: 1100px;">
								<tr>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>型号</b></td>
									<td class="col-md-3" style="vertical-align: middle!important;">
										<input class="g_product" type="text" name="product" placeholder="请输入型号" value="${kucun.product }" style="text-transform:uppercase;">
									</td>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>品牌</b></td>
									<td class="col-md-4" style="vertical-align: middle!important;">
										<input class="pinpai" type="text" name="pinpai" placeholder="请输入品牌" style="text-transform:uppercase;" value="${kucun.pinpai }">
									</td>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>封装</b></td>
									<td class="col-md-2" style="vertical-align: middle!important;">
										<input class="fengzhuang" type="text" name="fengzhuang" placeholder="请输入封装" style="text-transform:uppercase;" value="${kucun.fengzhuang }">
									</td>
								</tr>
								<tr>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>基本单位</b></td>
									<td class="col-md-3" style="vertical-align: middle!important;">
										<select name="danwei1" id="danwei1">
											<option <c:if test="${kucun.danwei1 eq 'PCS' }">selected="selected"</c:if> value="0">PCS</option>
											<option <c:if test="${kucun.danwei1 eq '个' }">selected="selected"</c:if> value="1">个</option>
											<option <c:if test="${kucun.danwei1 eq '只' }">selected="selected"</c:if> value="2">只</option>
											<option <c:if test="${kucun.danwei1 eq '束' }">selected="selected"</c:if> value="3">束</option>
											<option <c:if test="${kucun.danwei1 eq '千只' }">selected="selected"</c:if> value="4">千只</option>
										</select>
									</td>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>包装量</b></td>
									<td class="col-md-4" style="vertical-align: middle!important;">
										<input class="baozhuang" type="text" name="baozhuang" placeholder="包装量" value="${kucun.baozhuang }">
										<span class="danwei1" style="display: inline-block;width: 30px;text-align: center;"></span>/
										<select name="danwei2" id="danwei2">
											<option <c:if test="${kucun.danwei2 eq '条' }">selected="selected"</c:if> value="0">条</option>
											<option <c:if test="${kucun.danwei2 eq '箱' }">selected="selected"</c:if> value="1">箱</option>
											<option <c:if test="${kucun.danwei2 eq '盘' }">selected="selected"</c:if> value="2">盘</option>
											<option <c:if test="${kucun.danwei2 eq '包' }">selected="selected"</c:if> value="3">包</option>
											<option <c:if test="${kucun.danwei2 eq '管' }">selected="selected"</c:if> value="4">管</option>
										</select>
									</td>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>货期</b></td>
									<td class="col-md-2" style="vertical-align: middle!important;">
										<input class="huoqi" type="text" name="huoqi" placeholder="请输入货期" value="${kucun.huoqi }">
									</td>
								</tr>
								<tr>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>建议售价</b></td>
									<td class="col-md-3" style="vertical-align: middle!important;">
										<input class="shoujia" type="number" name="shoujia" placeholder="请输入销售价" value="${kucun.shoujia }">
									</td>
									<td style="text-align: right;vertical-align: middle!important;" class="col-md-1"><b>备注信息</b></td>
									<td  colspan="3" class="col-md-7" style="vertical-align: middle!important;">
										<textarea class="beizhu" name="beizhu">${kucun.beizhu }</textarea>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<button id="upkucun" type="button" class="btn btn-primary button5" style="cursor:pointer;height: 30px;padding-top: 4px;background: #1296D8;border-color: #1296D8;" title="修改当前型号">确认</button>
							<button id="noupkucun" type="button" class="btn btn-primary button6" style="cursor:pointer;height: 30px;padding-top: 4px;background: #FD3D3D;border-color: #FD3D3D;" title="取消修改型号">取消</button>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		
		<div class="container" style="text-align: center;margin-top: 30px;padding-left: 30px;">
			<div class="row">
				<div class="col-md-12" style="text-align: center;">
					<div class="form-group">
						<div class="input-group">
							<input type="text" style="height: 30px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px #DDDDDD solid;width: 220px;padding-left: 20px;" placeholder="型号"
								id="product" name="product" value="${sousuo }" style="text-transform:uppercase;">&emsp;&emsp;
							<button id="sousuo" class="btn btn-primary" style="padding-top: 4px;height:30px;">
								搜索
							</button>
						</div>
					</div>
				</div>
				<div class="col-md-12" style="text-align: left;">
					<button type="button" class="btn btn-primary glyphicon glyphicon-log-out" style="cursor:pointer;height: 30px;padding-top: 4px;background: black;border-color: black;" title="库存管理首页">出/入库记录</button>&emsp;
				</div>
			</div>
		</div>
		<div class="container" style="margin-top: 15px;">
			<div class="row">
				<div class="col-md-12" style="padding-left: 30px;">
					<table class="table1 table table-bordered table-hover table-responsive" style="text-align: center;border-collapse: collapse;width: 1100px;" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th style="border:none;">序号</th>
								<th style="border:none;">型号</th>
								<th style="border:none;">品牌</th>
								<th style="border:none;">封装</th>
								<th style="border:none;">批号</th>
								<th style="border:none;">质量</th>
								<th style="border:none;">数量(±)</th>
								<th style="border:none;">单价</th>
								<th style="border:none;">存放位置</th>
								<th style="border:none;width: 100px;">出/入库方式</th>
								<th style="border:none;">出/入库时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rkreport }" var="rkreport" varStatus="kcst">
								<tr class="kctr" style="cursor: pointer;" onmouseover="tooltip.pop(this, '#sub${kcst.count }', {position:0, offsetX:0,offsetY:20,calloutPosition: 0.1,effect:'slide'})">
									<td>${kcst.count }</td>
									<td >
										${rkreport.stock.stock_product }
										<div style="display:none;">
									        <div id="sub${kcst.count }">
									       		<b style="color: #9B30FF"> 供应商：</b><br>
									        	<b style="color: #9B30FF">${rkreport.rkreport_supplier}</b><br>
								        		<b style="color: #1E90FF">${rkreport.rkreport_address}</b><br>
									        </div>
									    </div>
									</td>
									<td>${rkreport.stock.stock_brand }</td>
									<td>${rkreport.stock.stock_package }</td>
									<td>${rkreport.stock.stock_lotnumber }</td>
									<td>${rkreport.stock.stock_quality}</td>
									<td style="font-weight: bold;color: #CD8500;">
										<c:if test="${rkreport.rkreport_status ==1 }"><span style="font-size: 15px;color: #008000">+</span></c:if><c:if test="${rkreport.rkreport_status ==2 }"><span style="color: red;font-size: 15px;">-</span></c:if>${rkreport.rkreport_num }
									</td>
									<td>${rkreport.rkreport_price }</td>
									<td>${rkreport.stock.stock_position }</td>
									<td title="${rkreport.rkreport_fangshi }">
										<div style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 100px!important;">
											${rkreport.rkreport_fangshi }
										</div>
									</td>
									<td>
										<fmt:formatDate value="${rkreport.rkreport_time}" pattern="yyyy/MM/dd HH:mm"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4" style="padding-left: 30px;width:410px;">
					<div ng-cloak>
						<nav aria-label="Page navigation" class="clearfix">
						    <ul class="pagination pagination-sm pagination1 fr" style="margin: 0">
						      <li ng-class="{disabled:page==1}">
						        <a <c:if test="${page > 1 }">href="rkreportAll?page=${page-1 }&&rows=10"</c:if>
						           aria-label="Previous" ng-click="sub(${page-1 }<1?1:${page-1 })" ng-disabled="page==1">
						          <span aria-hidden="true">&laquo;</span>
						        </a>
						      </li>
						      <li ng-if="page >= pageNum && lastPage !== pageNum" ng-click="sub(1)" ng-class="{active:item==1}">
						        <a href="rkreportAll?page=1&&rows=10">1</a>
						      </li>
						      <li ng-if="page >= pageNum && lastPage !== pageNum">
						        <a href="javascript:void(0)">...</a>
						      </li>
						      <li ng-click="sub(item)" ng-class="{active:item==page}" ng-repeat="item in pages">
						        <a href="rkreportAll?page={{item}}&&rows=10">{{item}}</a>
						      </li>
						      <li ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum">
						        <a href="javascript:void(0)">...</a>
						      </li>
						      <li ng-if="lastPage > pageNum && firstPage <= lastPage - pageNum" ng-click="sub(lastPage)" ng-class="{active:item==page}">
						        <a href="rkreportAll?page={{lastPage}}&&rows=10&">{{lastPage}}</a>
						      </li>
						      <li ng-class="{disabled:page==lastPage}">
						        <a <c:if test="${page < count }">href="rkreportAll?page=${page+1 }&&rows=10"</c:if>
						           aria-label="Next" ng-click="sub(${page+1 }>lastPage?page:${page+1 })">
						          <span aria-hidden="true">&raquo;</span>
						        </a>
						      </li>
						    </ul>
						</nav>
					</div>
				</div>
				<div class="col-md-4" style="height: 30px;line-height: 30px;">
					总共 <span style="font-weight: bold;color: red;">${total }</span> 条数据&emsp;
					<input type="text" style="height: 30px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px #DDDDDD solid;width: 60px;text-align: center;display: inline-block;"
						   id="pagemove2" class="form-control" name="pagemove" value="${page }" >
				    <button id="buttonmove2" class="btn btn-primary button2" style="cursor:pointer;height: 30px;padding-top: 4px;background: green;border-color: green;" title="输入数字，随芯跳转">跳转</button>
				</div>
			</div>
		</div>
		<div class="theme-popover">
			 <div style="height: 40px;">
			 	<a href="javascript:;" title="关闭" class="theme-close" style="margin-right: 10px;margin-top: 10px;font-size: 20px;font-weight: bold;">×</a>
			 </div>
			 <div class="row">
				<div class="col-md-12">
					<table class="table1 table table-bordered table-hover table-responsive" style="text-align: center;border-collapse: collapse;width: 1100px;" cellspacing="0" cellpadding="0">
						<tr class="kctr">
							<th style="vertical-align: middle!important;">型号</th>
							<td style="vertical-align: middle!important;">
								<input type="text" id="addstock_product" class="product" value="" name="stock_product" style="text-align: center;width: 140px;text-transform: uppercase;" >
							</td>
							<th style="vertical-align: middle!important;">品牌</th>
							<td style="vertical-align: middle!important;">
								<input type="text" id="addstock_brand" class="brand" value="" name="stock_brand" style="text-align: center;width: 140px;text-transform: uppercase;" >
							</td>
							<th style="vertical-align: middle!important;">封装</th>
							<td style="vertical-align: middle!important;">
								<input type="text" id="addstock_package" class="package" value="" name="stock_package" style="text-align: center;width: 140px;text-transform: uppercase;" >
							</td>
						</tr>
						<tr class="kctr">
							<th style="vertical-align: middle!important;">批号</th>
							<td style="vertical-align: middle!important;">
								<input type="text" id="addstock_lotnumber" class="pihao" value="" style="text-align: center;width: 100px;" >
							</td>
							<th style="vertical-align: middle!important;">数量</th>
							<td style="vertical-align: middle!important;">
								<input type="number" id="addstock_number" class="number" value="0" style="text-align: center;width: 100px;" placeholder="数量" min="0">
							</td>
							<th style="vertical-align: middle!important;">进货单价</th>
							<td style="vertical-align: middle!important;">
								<input type="number" id="addstock_price" class="chengben" value="0" style="text-align: center;width: 100px;" placeholder="进货单价" min="0">
							</td>
						</tr>
						<tr class="kctr">
							<th style="vertical-align: middle!important;">总计金额</th>
							<td class="money" style="vertical-align: middle!important;">0</td>
							<th style="vertical-align: middle!important;">库存所在</th>
							<td style="vertical-align: middle!important;">
								<select name="stock_position" id="addstock_position" style="width: 100px;">
									<option selected="selected" value="柜台">柜台</option>
									<option value="公司">公司</option>
									<option value="仓库">仓库</option>
								</select>
							</td>
							<th style="vertical-align: middle!important;">品质</th>
							<td style="vertical-align: middle!important;">
								<select name="cb_quality" id="addstock_quality" style="width: 100px;">
									<option selected="selected" value="原装">原装</option>
									<option value="散新">散新</option>
									<option value="国产">国产</option>
								</select>
							</td>
						</tr>
						<tr style="background: rgb(255, 255, 255);">
							<td style="text-align: center;vertical-align: middle!important;" class="col-md-1"><b>基本单位</b></td>
							<td class="col-md-3" style="vertical-align: middle!important;">
								<select name="stock_danwei1" id="addstock_danwei1">
									<option selected="selected" value="PCS">PCS</option>
									<option value="个">个</option>
									<option value="只">只</option>
									<option value="束">束</option>
									<option value="千只">千只</option>
								</select>
							</td>
							<td style="text-align: center;vertical-align: middle!important;" class="col-md-1"><b>包装量</b></td>
							<td class="col-md-4" style="vertical-align: middle!important;"  colspan="3">
								<input id="addstock_baozhuangnum" type="text" name="stock_baozhuangnum" placeholder="包装量">
								<span class="danwei1" style="display: inline-block;width: 30px;text-align: center;">PCS</span>/
								<select name="stock_danwei2" id="addstock_danwei2">
									<option selected="selected" value="条">条</option>
									<option value="箱">箱</option>
									<option value="盘">盘</option>
									<option value="包">包</option>
									<option value="管">管</option>
								</select>
							</td>
						</tr>
						<tr class="kctr">
							<th style="vertical-align: middle!important;">供应商</th>
							<td style="vertical-align: middle!important;">
								<input type="text" id="addrkreport_supplier" class="cb_supplier" value="" style="text-align: center;width: 300px;" placeholder="供应商">
							</td>
							<th style="vertical-align: middle!important;">详细位置</th>
							<td style="vertical-align: middle!important;" colspan="3">
								<input type="text" id="addrkreport_address" class="cb_place" value="" style="text-align: center;width: 500px;" placeholder="详细位置">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<button id="tianjia" type="button" class="btn btn-primary button5" style="cursor:pointer;height: 30px;padding-top: 4px;background: #1296D8;border-color: #1296D8;float: right;margin-right: 25px;" title="添加当前库存">确认</button>
					<button id="notianjia" type="button" class="btn btn-primary button6" style="cursor:pointer;height: 30px;padding-top: 4px;background: #FD3D3D;border-color: #FD3D3D;float: right;margin-right: 10px;" title="取消添加库存">取消</button>
				</div>
			</div>
		    <div style="width: 100%;border-top:1px #DDDDDD dashed;margin-bottom: 20px;"></div>  
		</div>
		<div class="theme-popover-mask"></div>
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
			})
	
		</script>
		<script type="text/javascript">
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
			}else if(stock_position=="公司"){
				$("#upstock_quality").html('<option value="柜台">柜台</option><option selected="selected" value="公司">公司</option><option value="仓库">仓库</option>');
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
	            	}else {
	            		window.location.href="stockAll";
	            	}
				},
				error: function() {  
	                alert('对不起失败了');  
	            }  
	        });
		})
		
		$("input").on("keydown",function(e){
		      if(e.key == "Enter"){
		    	  if(($('#time1').val() != "" && $('#time2').val() != "") || ($('#overtime1').val() != null && $('#overtime2').val() != null) || $('#product').val() != null){
		    		  $("#sousuo").trigger("click");
		    	  }
		      }
		});
		
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
				$(this).css("background","#5CB85C");
				$(this).css("border","1px #5CB85C solid");
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
	            
	            $('.number').bind('input propertychange', function() {
	            	var old = parseInt('${dh.cangku.number }');
	            	if(!/^[1-9]+\d*$/.test(this.value)){this.value=this.value.replace('.','');}
	            	if($(this).val() == ''){
	            		$(this).val(1);
	            	}
	            	if($(this).val() > old){
	            		alert("数量不可以大于现货数量"+old);
	            		$(this).val(old);
	            	}
	            	var number = $(this).val();
	            	if('${tianjia}' == 'tianjia'){
	            		var chengben = $('.chengben').val();
	            	}
	            	if('${diaohuo}' == 'diaohuo'){
	            		var chengben = $('.chengben').html();
	            	}
	            	if(chengben == ''){
	            		chengben = 0;
	            	}
	            	$('.money').html(number*chengben);
	            });
	            
	            $('.chengben').bind('input propertychange', function() { 
	            	if($(this).val() == ''){
	            		$(this).val(0);
	            	}
	            	var chengben = $(this).val();
	            	var number = $('.number').val();
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
	      	  			}else{
	      	  				window.location.href="stockAll";
	      	  			}
	                });
	        	});
	        	
	        	$("#diaohuo").click(function(){
	        		var stock_id       = '${s.stock_id}';
	        		var stock_number   = encodeURIComponent($('#dhnumber').val());
	    			var stock_position = encodeURIComponent($("#dhstock_position").val());
		            $.post("diaohuostock?stock_id="+stock_id+"&stock_number="+stock_number+"&stock_position="+stock_position,
		            	function(data){
		                	if(data.result=="login"){						
		      					
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
	        		window.location.href="guitai_kucun?guitai_index=guitai_index&page=${page}&rows=10&sousuo=${sousuo}";
	        	});
	        	
	        	$('#noupkucun').click(function(){
	        		window.location.href="stockAll?page=${page}";
	        	});
	        	
	        	$('#notianjia').click(function(){
	        		window.location.href="guitai_kucun?guitai_index=guitai_index&page=${page}&rows=10&sousuo=${sousuo}";
	        	});
	        	
	        	$('#noaddcangku').click(function(){
	        		window.location.href="guitai_kucun?guitai_index=guitai_index&page=${page}&rows=10&sousuo=${sousuo}";
	        	});
	        	
	        	$('#nodiaohuo').click(function(){
	        		window.location.href="guitai_kucun?guitai_index=guitai_index&page=${page}&rows=10&sousuo=${sousuo}";
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
		                })
	                    .on('input paste', function () {  
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
	  
	        //将表格转成可编辑的表格  
	        function edit(index) {  
	            //  $('#table').editableTableWidget();--效果是单击编辑按钮后，所有的都可以编辑  
	            // $(":checked").editableTableWidget();           
	            $(":checked").parent().parent().editableTableWidget();//整行的可以编辑  
	  
	        }  
	  
	    </script>
	</body>
</html>