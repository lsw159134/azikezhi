<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在芯间-bom表</title>
	<link rel="shortcut icon" href="img/tu.png" type="image/x-icon"/>
   <link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<style type="text/css">
	span,a,div,p,td,th{
   		color:#666;
   		font-size: 13px;
   		font:微软雅黑;
   	}
	
	:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	    color: rgb(250,0,255);  
	}
	
	::-moz-placeholder { /* Mozilla Firefox 19+ */
	    color: rgb(250,0,255);
	}
	
	input:-ms-input-placeholder,
	textarea:-ms-input-placeholder {
	    color: rgb(250,0,255);
	}
	
	input::-webkit-input-placeholder,
	textarea::-webkit-input-placeholder {
	    color: rgb(250,0,255);
	}
	
	.fix-div{ 
	    margin: 0 auto;
	    position: fixed;
	    width: 80%; 
	    top: 0;     
	    left: 0; 
	    right: 0;
	    z-index: 99999;
	}
	.fukuan:hover{
		text-decoration: none;
	}
	.quxiao:hover{
		text-decoration: none;
		color: red;
	}
	
	.zznav {
		position: relative;
		z-index: 1;
		padding-left: 1em;
	}
	
	.zznav > a {
		position: relative;
		display: inline-block;
		padding: .3em 1em 0;
		color: inherit;
		text-decoration: none;
		margin: 0 -.3em;
	} 
	
	.zznav > a::before,
	
	.zznav a::before {
		content: ''; /* To generate the box */
		position: absolute;
		top: 0; right: 0; bottom: 0; left: 0;
		z-index: -1;
		border-bottom: none;
		border-radius: .5em .5em 0 0;
		background: #CDB38B linear-gradient(hsla(0,0%,100%,.6), hsla(0,0%,100%,0));
		box-shadow: 0 .15em white inset;
		transform: scale(1.1, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom;
	}
	
	.zznav a.selected { z-index: 2;}
	
	.zznav a.selected::before {
		background-color: #CDC8B1;
		margin-bottom: -.08em;
	}
	.zznav.left > a::before {
		transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom left;
	}
	
	.zznav.right { padding-left: 2em; }
	
	.zznav.right > a::before {
		transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom right;
	}
	
	.zznav a:hover {
		color:white;
	}
	span,a,div,p,td{
   		color:#666;
   		font-size: 13px;
   		font:微软雅黑;
   	}
	#bomtd2 td{
		background: none;
	}
	
	#button2 {
	/* General Properties */
	height:25px;
	width:60px;
	border:1px solid #F5FAFE;
	background:#717a77;
	/* CSS3 Styling */
	background:-moz-linear-gradient(bottom, #0a0809, #0a0f0b 50%, #6d7673 50%, #afbdc0);
	background:-webkit-gradient(linear, left bottom, left top, from(#87CEEB), to(#87CEEB), color-stop(0.5, #87CEEB), color-stop(0.5, #87CEEB));
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 0.5);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 0.5);
	box-shadow:0px 0px 7px rgba(255, 255,255, 0.5);
	/* Text Styling */
	color:#ff7d00;
	text-shadow:0px -1px 0px #000;
	font-family:'HighlandGothicFLFRegular', Impact, 'Arial Black', sans-serif;
	font-size:13px;
}

/* Pseudo-classes for interactivity */

#button2:hover {
	font-size:16px;
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 1);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 1);
	box-shadow:0px 0px 7px rgba(255, 255,255, 1);
}

#button2:focus {
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
	box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
}

#button2:active {
	border-width:2px 1px 1px 2px;
	font-size:20px;
}
</style>
</head>
<body>
<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #87CEEB">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #FFA500;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;margin-top: -1px;">
					<a href="index" style="color: white;">
						在芯间用户系统
					</a>
				</div>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<div style="display: inline-block;margin-left: 800px;">
					<nav class="nav navbar-nav">
						<ul class="cl">
							<li style="min-width: 500px;">
							会员星级 : <c:if test="${sessionScope.star == 0 }">
										(星级随着订单交易完成的数量成长)	
									</c:if>
									<c:if test="${sessionScope.star == 1 }">
										<img src="<%=basePath%>logo/user_xingji.png">	
									</c:if>
									<c:if test="${sessionScope.star==2 }">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>50}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${user.username}<i class="Hui-iconfont">&#xe6d5;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="frontLogin">切换账户</a></li>
								<li><a href="userOut">退出</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside" style="background: white;">
		<input type="hidden"  id="supplieruid" value=""/>
		<div class="menu_dropdown bk_2">
			<dl id="menu_1">
				<dt>
					<img src="<%=basePath%>logo/user_geren.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >个人中心</a>
				</dt>
			</dl>
			<dl id="menu_2">
				<dt >
					<img src="<%=basePath%>logo/user_dingdan.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="express" data-title="我的订单" style="font-weight: bold;">我的订单</a>
				</dt>
				<!-- <dd>
					<ul>
						<li><a _href="product-history" data-title="添加订单" href="javascript:;">添加订单</a></li>
						<li><a _href="express" data-title="我的订单" href="javascript:;">我的订单</a></li>
					</ul>
				</dd> -->
			</dl>
			<dl id="menu_3">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user_bom.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="querybomuser" data-title="bom表订单" style="font-weight: bold;">bom表订单</a>
				</dt>
			</dl>
			<dl id="menu_4">
				<dt>
					<img src="<%=basePath%>logo/user_gouwu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="myCart" data-title="我的购物车" style="font-weight: bold;">我的购物车</a>
				</dt>
			</dl>
			 <dl id="menu_5">
				<dt>
					<img src="<%=basePath%>logo/user_dizhi.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="MyAddress" data-title="地址" style="font-weight: bold;">地址管理</a>
				</dt>
			</dl> 
			<dl id="menu_6">
				<dt>
					<img src="<%=basePath%>logo/user_fanxian.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="cashback" data-title="会员返现" style="font-weight: bold;">会员返现</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user_jishou.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="booking" data-title="库存寄售" style="font-weight: bold;">库存寄售</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user_xunjia.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="询价记录" href="javascript:;" style="font-weight: bold;">我的询价</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="queryByInquiryUserid" data-title="普通询价" >普通询价</a></li>
						<li><a href="QuotesByuser" data-title="bom表询价" >bom表询价</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 11px;margin-left: 13px;">
							<a href="usersystem">首页</a>
							<a href="querybomuser" class="selected">bom表订单</a>
							<a target="blank" href="aboutus">关于我们</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
					<div style="margin-bottom: 20px;float: right;">
					<table style="border: 1px #EEEEEE solid;height: 80px;width: 200px;text-align: center;" border="1">
						<tr>
							<td style="font-size: 15px;font-weight: bold;color: red;">
								返现金额
							</td>
							<td style="font-size: 15px;font-weight: bold;color: red;">
								￥ 
								<c:if test="${fanTotal-price > 0}">
									${fanTotal-price }
								</c:if>
								<c:if test="${fanTotal-price <= 0}">
									0
								</c:if>
								
							</td>
						</tr>
						<tr>
							<td colspan="2" style="font-weight: bold;color: #87CEEB">
								返现金额满一百
								<a href="cashback"
								   style="font-weight: bold;color: red;">点我提现</a>
							</td>
						</tr>
					</table>
			    </div>
					<div class="mt-20" style="color:#00060B">
						<table class="table table-striped table-hover" id="sample-table-2" border="1" style="border: 1px #EEEEEE solid;border-collapse: collapse;">
							<thead  style="background: #F5FAFE">
								<tr align="center" class="text-c">
									<th>订单名称</th>
									<th>订单编号</th>
									<th>金额</th>
									<th>订单状态</th>
									<th>返利</th>
									<th width="70px;">时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach items="${bomList}" var="bom" varStatus="status">
									<tr id="bomtd2" height="60px;" class="text-c" align="center" >
										<td style="background: none;">bom订单</td>
										<td>${bom.bom_identifier }</td>
										<td>￥ ${bom.bom_price}</td>
										<td>
											<c:if test="${bom.bom_status == 1}">未付款</c:if>
					                        <c:if test="${bom.bom_status == 2}">已付款</c:if>
					                        <c:if test="${bom.bom_status == 3}">已发货</c:if>
					                        <c:if test="${bom.bom_status == 4}">已完成</c:if>
					                        <c:if test="${bom.bom_status == 5}">已取消</c:if>
					                        <c:if test="${bom.bom_status == 6}">审核中</c:if>
										</td>
										<c:if test="${bom.bom_fan==null}"><td>审核中</td></c:if>
										<c:if test="${bom.bom_fan!=null}"><td>${bom.bom_fan}</td></c:if>
										<td width="25px;">
											<fmt:formatDate value="${bom.bom_date}" pattern="yyyy/MM/dd HH:mm"/>
											<c:if test="${bom.bom_date == null}">
												0000-00-00 00:00:00
											</c:if>
										</td>
										<td>
											<form action="queryByBomIduser?id=${bom.bom_id}" method="post">
					                    		<button id="button2" >详情</button>
					                    	</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
						<%@include file="../../../../include/footer.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</section>

<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
$(function(){
	var td = $("#bomtd2 td");  
    td.mouseover(function () {  
        $(this).css("background-color", "#AEF2E5");  
    }).mouseout(function () {  
        $(this).css("background-color", "#FFFFFF");  
    });
});
function first(){
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${1}&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
}
function end(){
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${count == 0 ? 1:count }&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
}
function previous(){
	var page=${page == 1};
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${page-1}&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
	}
}
function next(){
	var page=${count <= page};
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${page+1}&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
	}
}
//搜索
function searchProduct() {
	var search = $("#search").val();
	var supplier = $("#supplier").val();
	var url = '<%=basePath %>1019/zai/xin/jian/queryAllProduct?product=' + search+'&supplier='+supplier ;
	window.location = url;
};

</script>
</body>
</html>