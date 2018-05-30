<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
<title></title>

<style type="text/css">
table {
	text-align: center;
	table-layout: fixed;
}

td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	text-align: center;
	border: 1px solid;
	height: 50px;
}
</style>
</head>

<body>
	<div class="page-container" style="background: #F1F1F1">
		<nav class="breadcrumb">
			<div class="row">
				<form action="express" method="get">
					<c:if
						test="${sessionScope.user.admin_jurisdiction eq '1' || user.admin_jurisdiction eq '3' || user.admin_jurisdiction eq '7' }">
						<div class="col-sm-2" style="float: left;">
							<div class="form-group">
								<div class="input-group">
									<label class="sr-only" style="color: rgb(250, 0, 255)"
										for="r_name"> 会员名称 </label> <input type="text"
										style="border: 2px double rgb(250, 0, 255); height: 30px;"
										class="list-group-item list-group-item-success"
										placeholder="会员名称" id="username" name="name" />
								</div>
							</div>
						</div>
						<div class="col-sm-2" style="float: left;">
							<div class="form-group">
								<div class="input-group">
									<label class="sr-only" style="color: rgb(250, 0, 255)"
										for="r_name"> 产品型号 </label> <input type="text"
										style="border: 2px double rgb(250, 0, 255); height: 30px;"
										class="list-group-item list-group-item-success"
										placeholder="产品型号" id="product" name="product" />
								</div>
							</div>
						</div>
						<div class="col-sm-2" style="float: left;">
							<div class="form-group">
								<div class="input-group">
									<label class="sr-only" style="color: rgb(250, 0, 255)"
										for="r_name"> 下单时间 </label> <input type="date"
										style="border: 2px double rgb(250, 0, 255); height: 30px;"
										class="list-group-item list-group-item-success"
										placeholder="下单时间" id="edate" name="edate" />
								</div>
							</div>
						</div>
						<div class="col-sm-2" style="float: left;">
							<div class="form-group">
								<div class="input-group">
									<label class="sr-only" style="color: rgb(250, 0, 255)"
										for="r_name"> 收货电话 </label> <input type="text"
										style="border: 2px double rgb(250, 0, 255); height: 30px;"
										class="list-group-item list-group-item-success"
										placeholder="收货电话" id="phone" name="telphone" />
								</div>
							</div>
						</div>
						<div class="col-sm-2" style="float: left;">
							<div class="form-group">
								<div class="input-group">
									<label class="sr-only" style="color: rgb(250, 0, 255)"
										for="r_name"> 收货地址 </label> <input type="text"
										style="border: 2px double rgb(250, 0, 255); height: 30px;"
										class="list-group-item list-group-item-success"
										placeholder="收货地址" id="address" name="address" />
								</div>
							</div>
						</div>
					</c:if>
					<div class="col-sm-1" style="float: left;">
						<button onclick="search();" class="btn btn-primary">搜索</button>
					</div>
				</form>
			</div>
		</nav>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <span>本月<a href="express?status=1">未付款订单</a>（${status1}）
			</span>本月<a href="express?status=6">待审核订单</a>（${status6}）<span
				style="color: red;">本月<a href="express?status=5">已取消订单</a>（${status5}）
			</span><span style="color: blue; font-weight: bold;">本月<a
					href="express?status=4">已完成订单</a>（${status4}）
			</span><span style="color: green; font-weight: bold;">本月<a
					href="express?status=3">已交货订单</a>（${status3}）
			</span> <span>本月<a href="express?status=2">已付款订单</a>（${status2}）
			</span><span style="color: red; margin-left: 10px;">本月成交金额：<b>${pricetotal}</b>元
			</span>
			</span> <span class="r"> <a
				href="<%=basePath%>1019/zai/xin/jian/cont"
				style="color: red; margin-right: 10px;"> 返回上一页 </a>
			</span>
		</div>
		<c:if
			test="${sessionScope.user.admin_jurisdiction eq '1' || user.admin_jurisdiction eq '3' || user.admin_jurisdiction eq '7' }">
			<div class="mt-20">
				<table cellpadding="0" cellspacing="0">
					<thead>
						<tr>
							<td style="font-weight: bold;">序号</td>
							<td style="font-weight: bold;">会员名</td>
							<td style="font-weight: bold;">付款金额</td>
							<td style="font-weight: bold;">支付方式</td>
							<td style="font-weight: bold;">快递厂商</td>
							<td style="font-weight: bold;">收货人姓名</td>
							<td style="font-weight: bold;">收货人电话</td>
							<td style="font-weight: bold;">订单编号</td>
							<td style="font-weight: bold;">会员备注</td>
							<td style="font-weight: bold;">下单时间</td>
							<td style="font-weight: bold;">当前状态</td>
							<td style="font-weight: bold;">查看详情</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${express }" var="items" varStatus="status">
							<tr class="text-c" data-uid="${items.useruid}"
								data-id="${items.express}" data-help="${items.help}"
								data-fan="${items.fan}" data-status="${items.status}">
								<td>${status.count}</td>
								<td>${items.user.username}</td>
								<c:if test="${items.preferentialamount==null}">
									<td width="60px;">${items.eprice}</td>
								</c:if>
								<c:if test="${items.preferentialamount!=null}">
									<td width="60px;">${items.preferentialamount}</td>
								</c:if>
								<td>${items.mode}</td>
								<td>${items.expressname}</td>
								<td>${items.name}</td>
								<td>${items.telphone}</td>
								<td title="${items.ordernumber}">${items.ordernumber}</td>
								<td title="${items.beizhu }">${items.beizhu }</td>
								<td
									title="<fmt:formatDate value="${items.edate}" pattern="yyyy/MM/dd HH:mm"/>"><fmt:formatDate
										value="${items.edate}" pattern="yyyy/MM/dd HH:mm" /></td>
								<td><c:if test="${items.status == 1}">未付款</c:if> <c:if
										test="${items.status == 2}">已付款</c:if> <c:if
										test="${items.status == 3}">
										<span style="color: green; font-weight: bold;">已交货</span>
									</c:if> <c:if test="${items.status == 4}">
										<span style="color: blue; font-weight: bold;">已完成</span>
									</c:if> <c:if test="${items.status == 5}">
										<span style="color: red;">已取消</span>
									</c:if> <c:if test="${items.status == 6}">审核中</c:if></td>
								<td><a href="expressAdmin?eid=${items.express}"
									class="btn radius btn-secondary size-S">查看详情</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="width: 100%;">
					当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
					<button onclick="first()">首页</button>
					&nbsp;
					<button onclick="previous()"
						<c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>
					&nbsp;
					<button onclick="er()"
						<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>
					&nbsp;
					<button onclick="san()"
						<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>
					&nbsp;
					<button onclick="si()"
						<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>
					&nbsp;
					<button onclick="next()"
						<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>
					&nbsp;
					<button onclick="end()">尾页</button>
				</div>
			</div>
		</c:if>
	</div>
	<footer class="footer mt-20">
		<div class="container">
			<p>
				版权所有 &copy; 2016 在芯间 保留所有权利 | <a href="http://www.miibeian.gov.cn/">
					<img src="<%=basePath%>img/img/icp.png" /> 粤ICP备15008173号-2
				</a> |
			</p>
		</div>
	</footer>
	<style type="text/css">
#update {
	width: 100px;
	height: 25px;
}

#update:hover {
	color: darkred;
}
</style>
	<script type="text/javascript"
		src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		function first() {
			window.location.href = 'express?page=${1}&&rows=${pageSize }';
		}
		function end() {
			window.location.href = 'express?page=${count == 0 ? 1:count }&&rows=${pageSize }';
		}
		function er() {
			var page = $
			{
				page + 2
			}
			;
			var count = $
			{
				count
			}
			;
			if (page > count) {
				return false;
			} else {
				window.location.href = 'express?page=${page+1}&&rows=${pageSize }';
			}
		}
		function san() {
			var page = $
			{
				page + 1
			}
			;
			var count = $
			{
				count
			}
			;
			if (page > count) {
				return false;
			} else {
				window.location.href = 'express?page=${page+2}&&rows=${pageSize }';
			}
		}
		function si() {
			var page = $
			{
				page
			}
			;
			var count = $
			{
				count
			}
			;
			if (page > count) {
				return false;
			} else {
				window.location.href = 'express?page=${page+3}&&rows=${pageSize }';
			}
		}
		function previous() {
			var page = $
			{
				page == 1
			}
			;
			if (page) {
				return false;
			} else {
				window.location.href = 'express?page=${page-1}&&rows=${pageSize }';
			}
		}
		function next() {
			var page = $
			{
				count <= page
			}
			;
			if (page) {
				return false;
			} else {
				window.location.href = 'express?page=${page+1}&&rows=${pageSize }';
			}
		}

		function search() {
			var product = $("#product").val();
			var name = $("#username").val();
			var phone = $("#phone").val();
			var address = $("#address").val();
			var edate = $("#edate").val();
			window.location.href = 'express?name=' + name + '&telphone='
					+ phone + '&address=' + address + '&edate=' + edate
					+ "&product=" + product;
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
							var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已交货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
							Enumber.html(eh);
							fan.html(fh);
							a.html(ht);
						});

		$("table").on("click", ".sta", function() {
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
				$.ajax({
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
						window.location.reload();
						layer.msg(data.msg);
					}
				});
			}
		);
	</script>
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