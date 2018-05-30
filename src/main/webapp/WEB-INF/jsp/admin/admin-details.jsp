<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css"
	rel="stylesheet">
<link
	href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css"
	rel="stylesheet">
<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css"
	rel="stylesheet">
<link
	href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css"
	rel="stylesheet">
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script
	src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
<title>购买记录/快递单号</title>
</head>

<body>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
				<c:if
					test="${express.express_profit ==null || express.express_profit==0}">
					<form action="expressprofit" method="post">
						<span class="l"> <input type="hidden" name="express"
							value="${express.express }"> <input type="text"
							style="border: 2px double rgb(250, 0, 255); height: 20px;"
							class="list-group-item list-group-item-success"
							placeholder="盈利金额" id="express_profit" name="express_profit"
							value="${express.express_profit }" /> <input type="submit"
							class="btn radius btn-primary size-S">
						</span>
					</form>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
				<c:if
					test="${fn:contains(sessionScope.user.admin_shrio, '1,2,3,4,5')}">
				${express.express_profit }
			</c:if>
			</c:if>
			<span class="r"> <a
				href="<%=basePath%>1019/zai/xin/jian/express"
				style="color: red; margin-right: 10px;"> 返回上一页 </a>
			</span>
		</div>
		<div class="mt-20">
			<table class="table">
				<thead>
					<tr class="text-c">
						<th width="60px;">会员名称</th>
						<th width="60px;">公司</th>
						<th width="60px;">产品型号</th>
						<th width="60px;">封装</th>
						<th width="60px;">产品单价</th>
						<th width="60px;">购买数量</th>
						<th width="60px;">金额</th>
						<th width="80px;">下单时间</th>
						<th width="60px;">快递公司</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${express.productuid == null}">
						<c:forEach items="${order }" var="items">
							<tr class="text-c">
								<td width="60px;" align="center">${express.user.username}</td>
								<td width="60px;" align="center"><c:if
										test="${items.p.supplier eq '样品商城'}">
	               					深圳市力芯周电子商行
	               				</c:if> <c:if test="${items.p.supplier ne '样品商城'}">
	               					${items.p.supplier}
	               				</c:if></td>
								<td width="60px;" align="center">${items.o_product}</td>
								<td width="60px;">${items.p.encapsulation}</td>
								<td width="60px;" align="center">${items.o_one}</td>
								<td width="60px;" align="center">${items.o_number}</td>
								<td width="60px;" align="center">${items.o_price}</td>
								<td width="80px;" align="center"><fmt:formatDate
										value="${express.edate}" pattern="yyyy/MM/dd HH:mm" /></td>
								<td width="60px;" align="center">${express.expressname}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${express.productuid != null}">
						<tr class="text-c">
							<td width="60px;">${express.user.username}</td>
							<td width="60px;"><c:if test="${product.supplier eq '样品商城'}">
               					深圳市力芯周电子商行
               				</c:if> <c:if test="${product.supplier ne '样品商城'}">
               					${product.supplier}
               				</c:if></td>
							<td width="60px;" align="center">${express.product}</td>
							<td width="60px;">${product.encapsulation}</td>
							<td width="60px;" align="center">${express.one}</td>
							<td width="60px;" align="center">${express.expressnumber}</td>
							<td width="60px;" align="center">${express.eprice}</td>
							<td width="80px;" align="center"><fmt:formatDate
									value="${express.edate}" pattern="yyyy/MM/dd HH:mm" /></td>
							<td width="60px;" align="center">${express.expressname}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div style="width: 100%;">
				<br /> <br />
				<div class="total" style="float: left; margin-left: 40px;">
					<strong style="color: red;"> 发票：<c:if
							test="${express.e_invoice == 1 }">
							不开
						</c:if> <c:if test="${express.e_invoice == 2 }">
							普通发票
						</c:if> <c:if test="${express.e_invoice == 3 }">
							增税发票
						</c:if>
					</strong>&nbsp;&nbsp;&nbsp; 支付方式:<strong id="effectivePrice"
						style="color: red;">${express.mode }</strong>&nbsp;&nbsp;&nbsp;
					总金额: <strong id="effectivePrice" style="color: red;">￥${express.eprice }
						<c:if test="${express.expressname == '申通' }">
						（含运费10元）
					</c:if> <c:if test="${express.expressname == '顺丰(省内)' }">
						（含运费13元）
					</c:if> <c:if test="${express.expressname == '顺丰(省外)' }">
						（含运费23元）
					</c:if>
					</strong>
					<c:if test="${express.status != 1 }">
					付款金额:
					<c:if test="${express.preferentialamount==null}">
							<strong id="effectivePrice" style="color: red;">￥${express.eprice}
							</strong>
						</c:if>
						<c:if test="${express.preferentialamount!=null}">
							<strong id="effectivePrice" style="color: red;">￥${express.preferentialamount}
							</strong>
						</c:if>
					</c:if>
					<c:if test="${express.status == 1 }">
						<strong> <input type="text"
							style="border: 2px double rgb(250, 0, 255); height: 20px;"
							class="list-group-item list-group-item-success"
							placeholder="付款金额" id="preferentialamount"
							name="preferentialamount" value="${express.preferentialamount }" />
							&nbsp;&nbsp;&nbsp;<input type="text" name="discountdescription"
							id="discountdescription" value="${express.discountdescription }"
							placeholder="优惠说明"
							style="border: 2px double rgb(250, 0, 255); height: 20px;">
							<button style="height: 20px;"
								onclick="discount('${express.express}','${express.eprice }');">修改付款金额</button>
						</strong>
					</c:if>
					<strong><button onclick="shouju()">打印收据</button></strong>
				</div>
				<br /> <br />
				<div class="total" style="float: left; margin-left: 40px;">
					优惠金额：<strong style="color: red;"> <span id="aa"></span> <span
						id="bb">${express.discountprice}</span>
					</strong>
				</div>
				<div class="total" style="float: left; margin-left: 40px;">
					优惠说明：<strong style="color: red;"> <span id="dd"></span> <span
						id="ss">${express.discountdescription}</span>
					</strong>
				</div>
				<br /> <br />
				<c:if test="${sessionScope.user.admin_status eq '2'}">
					<div class="total" style="float: left; margin-left: 40px;">
						快递: <strong style="color: red;">${express.expressname}</strong>
					</div>
					<br />
					<br />
				</c:if>
				<c:if test="${biaoqian!=null }">
					<p style="margin-left: 40px; width: 1000px; background: #EFEEF0">
						<b style="font-size: 16px; color: blue;">标签信息</b><br>
						<c:if test="${biaoqian.b_content!=null }">
							<b style="font-size: 13px; color: #666; margin-left: 2px;">
								公&nbsp; 司&nbsp; 名&nbsp; 称：&emsp; </b>
							<span style="color: red;"> ${biaoqian.b_content } </span>
							<br>
						</c:if>
						<c:if test="${biaoqian.b_img!=null }">
							<img alt="" src="<%=basePath%>biaoqian/${biaoqian.b_img}">
							<br>
						</c:if>
					</p>
				</c:if>
				<div class="total" style="float: left; margin-left: 40px;">
					备注信息: <strong style="color: red;">${express.beizhu }</strong>
				</div>
				<br /> <br />
				<div class="total" style="float: left; margin-left: 40px;">
					收货信息: <strong style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;
						收货人姓名：${express.name}&nbsp;&nbsp;&nbsp;
						联系电话：${express.telphone}&nbsp;&nbsp;&nbsp;&nbsp;
						收货地址：${express.address}</strong> <strong><button
							class="btn radius btn-primary size-S" data-remodal-target="fanli">打印快递单</button></strong>
					<!-- data-remodal-target="fanli" -->
				</div>
				<br /> <br />
				<table class="table">
					<thead>
						<tr class="text-c">
							<th width="120px;">快递单号</th>
							<th width="120px;">返利金额</th>
							<th width="120px;">当前状态</th>
							<th width="120px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-c" data-uid="${express.useruid}"
							data-id="${express.express}" data-help="${express.help}"
							data-fan="${express.fan}" data-status="${express.status}">
							<td width="120px;" align="center" class="Enumber">${express.help}</td>
							<td width="120px;" align="center" class="fan"><c:if
									test="${express.fan != null}">${express.fan}元</c:if> <c:if
									test="${express.fan == null}">待添加</c:if></td>
							<td width="120px;" align="center" class="express-status"><c:if
									test="${express.status =='1'}">未付款</c:if> <c:if
									test="${express.status =='2'}">已付款</c:if> <c:if
									test="${express.status =='3'}">已交货</c:if> <c:if
									test="${express.status =='4'}">已完成</c:if> <c:if
									test="${express.status =='5'}">已取消</c:if> <c:if
									test="${express.status =='6'}">审核中</c:if></td>
							<c:if test="${express.status !='4' && express.status !='5' }">
								<td width="120px;" align="center" class="update">修改</td>
							</c:if>
							<c:if test="${express.status =='4'}">
								<td>订单已完成</td>
							</c:if>
							<c:if test="${express.status =='5'}">
								<td>订单已取消</td>
							</c:if>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="remodal" data-remodal-id="fanli">
		<button data-remodal-action="close" class="remodal-close"></button>
		<table style="width: 200px; margin-left: 200px;">
			<tr class="peisong">
				<td style=""><input type="radio" name="expressname" value="申通"
					checked="checked" />申通</td>
				<td style=""><input type="radio" name="expressname"
					value="速尔快(广东省内)" />速尔</td>
			</tr>
		</table>
		<br />

		<button data-remodal-action="cancel" class="remodal-cancel">
			取消</button>
		<button data-remodal-action="confirm" class="remodal-confirm pay"
			onclick="expressprint()">确定</button>
	</div>
	<script type="text/javascript"
		src="<%=contextPath%>/user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/user/lib/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="<%=contextPath%>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		function shouju() {
			window.open("adminShouju?eid=${express.express}");
		}
		function expressprint() {
			var expressname = $('.peisong input:radio:checked').val();
			window
					.open("${pageContext.request.contextPath}/1019/zai/xin/jian/adminprintexpress?express=${express.express}&expressname="
							+ expressname);
		}
		function discount(eid, eprice) {
			var preferentialamount = $("#preferentialamount").val();
			var discountdescription = $("#discountdescription").val();
			var a = eprice - preferentialamount;
			if (confirm("你确定提交吗？")) {
				$
						.post(
								"upDiscountprice?express=" + eid
										+ "&preferentialamount="
										+ preferentialamount
										+ "&discountdescription="
										+ discountdescription + "&eprice="
										+ eprice,
								function(data) {
									if (data.result == "fail") {
										layer.alert("失败", {
											icon : 5
										})
									} else if (data.result == "seccuss") {
										layer.alert("成功", {
											icon : 5
										})
										document.getElementById('bb').style.display = 'none';
										document.getElementById("aa").innerHTML = a
												.toFixed(2);
										document.getElementById('ss').style.display = 'none';
										document.getElementById("dd").innerHTML = discountdescription;
									}
								})
			}
		}

		$("table")
				.on(
						"click",
						".update",
						function() {
							var f = $(this).parents(".text-c").data("fan");
							var h = $(this).parents(".text-c").data("help");
							var s = $(this).parents(".text-c").data("status");
							$(this).html("确定");
							$(this).addClass("sta").removeClass("update");
							var Enumber = $(this).siblings(".Enumber");
							var eh = '<input type="text" id="express_number" value="'+h+'" class="input-text"/>';
							var fan = $(this).siblings(".fan");
							var fh = '<input type="text" id="fan" value="'+f+'" class="input-text"/>';
							var a = $(this).siblings(".express-status");
							if (s == 1) {
								var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已交货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
							} else if (s == 2) {
								var ht = '<select id="s"><option value="1">未付款</option><option value="2" selected="selected">已付款</option><option value="3">已交货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
							} else if (s == 3) {
								var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3" selected="selected">已交货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
							} else if (s == 4) {
								var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已交货</option><option value="4" selected="selected">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
							} else if (s == 5) {
								var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已交货</option><option value="4">已完成</option><option value="5" selected="selected">已取消</option><option value="6">审核中</option></select>';
							} else if (s == 6) {
								var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已交货</option><option value="4">已完成</option><option value="5" selected="selected">已取消</option><option value="6" selected="selected">审核中</option></select>';
							}

							Enumber.html(eh);
							fan.html(fh);
							a.html(ht);
						});

		$("table")
				.on(
						"click",
						".sta",
						function() {
							var id = $(this).parents(".text-c").data("id");
							var uid = $(this).parents(".text-c").data("uid");
							var s = $("#s option:selected").val();
							var number = $("#express_number").val();
							$(this).siblings(".Enumber").html(number);
							var fan = $("#fan").val();
							$(this).siblings(".fan").html(fan);
							$(this).html("修改");
							$(this).removeClass("sta").addClass("update");
							if (s == 6) {
								$(this).siblings(".express-status").html("审核中");
							} else if (s == 5) {
								$(this).siblings(".express-status").html("已取消");
							} else if (s == 4) {
								$(this).siblings(".express-status").html("已完成");
							} else if (s == 3) {
								$(this).siblings(".express-status").html("已交货");
							} else if (s == 2) {
								$(this).siblings(".express-status").html("已付款");
							} else if (s == 1) {
								$(this).siblings(".express-status").html("未付款");
							}
							$
									.ajax({
										type : "post",
										url : "updateexpressstatus",
										async : true,
										dataType : "json",
										data : {
											status : s,
											fan : fan,
											number : number,
											uid : uid,
											id : id
										},
										success : function(data) {
											if (data.result == "success") {
												layer.open({
													title : [ '提示' ],
													content : data.msg,
													btn : [ '确认' ],
													shadeClose : true,
													//回调函数  
													yes : function(index,
															layero) {
														window.location
																.reload();
													},
													cancel : function(index,
															layero) { //按右上角“X”按钮  
														window.location
																.reload();
													}
												});
											} else if (data.result == "notlogin") {
												window.location.href = '${pageContext.request.contextPath}/1019/zai/xin/jian/Adminlogin';
												window.locatin.herf();
											} else if (data.result == "fail") {
												layer.open({
													title : [ '提示' ],
													content : data.msg,
													btn : [ '确认' ],
													shadeClose : true,
													//回调函数  
													yes : function(index,
															layero) {
														window.location
																.reload();
													},
													cancel : function(index,
															layero) { //按右上角“X”按钮  
														window.location
																.reload();
													}
												});
											}
										}
									});
						});
	</script>
	<style type="text/css">
#update {
	width: 100px;
	height: 25px;
}

#update:hover {
	color: darkred;
}
</style>
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