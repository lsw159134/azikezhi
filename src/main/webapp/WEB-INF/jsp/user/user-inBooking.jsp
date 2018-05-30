<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<%
	if(session.getAttribute("uid") == null){
		response.sendRedirect("frontLogin");
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<title>自可知用户系统-库存寄售</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<style type="text/css">
	span,a,div,p,td,th{
   		color:#666;
   		font-size: 13px;
   		font:微软雅黑;
   	}
	.l a:hover{
		text-decoration:none;
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
		background: #A5C9CE linear-gradient(hsla(0,0%,100%,.6), hsla(0,0%,100%,0));
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
	.fan:hover{
		text-decoration: none;
	}
	.button2 {
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

.button2:hover {
	font-size:16px;
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 1);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 1);
	box-shadow:0px 0px 7px rgba(255, 255,255, 1);
}

.button2:focus {
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
	box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
}

.button2:active {
	border-width:2px 1px 1px 2px;
	font-size:16px;
}
</style>
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #222222;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;margin-top: -1px;">
					<a href="index" style="color: white;">
						自可知用户系统
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
			</dl>
			<%-- <dl id="menu_3">
				<dt>
					<img src="<%=basePath%>logo/user_bom.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="querybomuser" data-title="bom表订单" style="font-weight: bold;">bom表订单</a>
				</dt>
			</dl> --%>
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
				<dt style="background: #A5C9CE;">
					<img src="<%=basePath%>logo/user_jishou.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="booking" data-title="库存寄售" style="font-weight: bold;">库存寄售</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user_xunjia.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">库存管理</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="javascript:;" onclick="usersupplier()" data-title="库存管理" >
								&emsp;&emsp;库存上传
							</a>
						</li>
						<li><a href="supplierIn" data-title="公司信息" >&emsp;&emsp;公司信息</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp" >
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 11px;margin-left: 13px;">
							<a href="usersystem">首页</a>
							<a href="bookingproductexpress" class="selected">添加代售</a>
							<a target="blank" href="aboutus">关于我们</a>
							<a href="booking" class="selected">返回上一页</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
				    <div class="row">
						<fieldset style="background:#CBE9CF; color:#00060B">
							<div class="row" style="height: 40px;">
								<div class="col-md-5" >
									<div class="form-group">
										<label class="control-label" for="lastName">
											产品型号：
										</label>
										<input type="text" class="form-control" id="booking_product" name="booking_product" placeholder="产品型号">
										<span id="s" style="color: red;"></span>
									</div>
								</div>
								<div class="col-md-6" style="margin-left: -28px;">
									<div class="form-group">
										<label class="control-label" for="lastName">
											封装（描述）：
										</label>
										<input type="text" class="form-control" id="booking_encapsulation" name="booking_encapsulation" placeholder="封装（描述）">
										<span id="booking_encapsulation" style="color: red;"></span>
									</div>
								</div>
							</div>
							<div class="row" style="height: 40px;">
								<div class="col-md-5" >
									<div class="form-group">
										<label class="control-label" for="lastName">
											产品数量：
										</label>
										<input type="number" class="form-control" id="booking_number" name="booking_number" placeholder="产品数量">
										<span id="s" style="color: red;"></span>
									</div>
								</div>
								<div class="col-md-6" >
									<div class="form-group">
										<label class="control-label" for="lastName">
											产品价格：
										</label>
										<input onkeyup="this.value=this.value.match(/\d+\.?\d{0,2}/)" onafterpaste="this.value=this.value.match(/\d+\.?\d{0,2}/)" type="text" class="form-control" id="booking_price" name="booking_price" placeholder="单价">
									</div>
								</div>
							</div>
							<div class="row" style="height: 40px;">
								<div class="col-md-5" >
									<div class="form-group">
										<label class="control-label" for="lastName">
											产品渠道：
										</label>
										<input type="text" class="form-control" id="booking_channel" name="booking_channel" placeholder="产品渠道">
										<span id="s" style="color: red;"></span>
									</div>
								</div>
								<div class="col-md-6" >
									<div class="form-group">
										<label class="control-label" for="lastName">
											联系手机：
										</label>
										<input type="text" onblur="id2()" class="form-control" id="booking_phone" name="booking_phone" placeholder="联系手机">
										<span id="phone" style="color: red;"></span>
									</div>
								</div>
							</div>
							<div class="row" style="height: 40px;">
								<div class="col-md-12" >
									<div class="form-group">
										<label class="control-label" for="lastName">
											备注信息：
										</label>
										<input type="text" style="width: 400px;" class="form-control" id="booking_note" name="booking_note" placeholder="备注信息">
										<span id="s" style="color: red;"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" >
									<button id="submitForm" style="margin-right: 480px;float: right;" class="btn btn-primary pull-right">
										提交 <i class="fa fa-arrow-circle-right"></i>
									</button>
									<button type="button" onclick="quxiao();" style="margin-right: 20px;float: right;" class="btn btn-primary pull-right">
										取消 
									</button>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
			<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
				<%@include file="../../../include/footer.jsp"%>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
function quxiao(){
	window.location.href="booking";
}
 function usersupplier(){
			$.post("supplierseleuser",
	            function(data){
					if(data.result=="fail"){
						alert("请先添加公司信息");
						window.location.href="supplierIn";
					}else if(data.result=="seccuss"){
						window.location.href="userSupplierProduct";
					}else if(data.result=="login"){
						window.location.href="frontLogin";
					}
				}
		   	)
		}
 function id2() {
	    var ss = document.getElementById("booking_phone").value;
	    var aa =/^0?1[3|4|5|8][0-9]\d{8}$/;
	    if (ss == "") {
	        //alert("ID不能为空");
	        document.getElementById("phone").innerHTML = "号码不能为空";
	    } else{
        	document.getElementById("phone").innerHTML = "";
        }
	}
 $("#submitForm").click(function(){
		var booking_phone=document.getElementById("booking_phone").value;
		var booking_product=document.getElementById("booking_product").value;
		var booking_encapsulation=document.getElementById("booking_encapsulation").value;
		var booking_number=document.getElementById("booking_number").value;
		var booking_price=document.getElementById("booking_price").value;
		var booking_channel=document.getElementById("booking_channel").value;
		var booking_note=document.getElementById("booking_note").value;
		if(booking_phone.length==11){
			$.post("bookingadd?booking_phone="+booking_phone+"&booking_product="+booking_product+"&booking_encapsulation="+booking_encapsulation+"&booking_number="+booking_number+"&booking_price="+booking_price+"&booking_channel="+booking_channel+"&booking_note="+booking_note,
	            function(data){
					if(data.result=="fail"){
					}else if(data.result=="seccuss"){
						window.location.href="booking";
					}else if(data.result=="login"){
						window.location.href="frontLogin";
					}
				}
		   	)
		}else{
			alert("请输入正确的手机号码");
		}
	})
</script>

</body>
</html>