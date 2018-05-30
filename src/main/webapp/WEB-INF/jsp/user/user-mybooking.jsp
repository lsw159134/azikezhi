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
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user_xunjia.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="supplierIn" data-title="公司信息" >&emsp;&emsp;公司资料</a></li>
						<li>
							<a href="javascript:;" onclick="usersupplier()" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="putong" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu_2">
				<dt>
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">询/报价记录</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="queryByInquiryUserid" data-title="询价记录" >
								&emsp;&emsp;询价记录（采购记录）
							</a>
						</li>
						<li><a href="quoteAllByUser" data-title="报价记录">&emsp;&emsp;报价记录</a></li>
					</ul>
				</dd>
			</dl>
			<c:if test="${sessionScope.supplieruid==1 }">
				<dl id="menu_7">
					<dt>
						<img src="<%=basePath%>logo/zaixiang.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">在线购</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a href="seleonlineProduct" data-title="在线购库存" >
									&emsp;&emsp;在线购库存
								</a>
							</li>
							<li><a href="seleOnlineExpress" data-title="在线购订单">&emsp;&emsp;在线购订单</a></li>
						</ul>
					</dd>
				</dl>
			</c:if>
			<dl id="menu_3">
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
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp" >
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 11px;margin-left: 13px;">
							<a href="usersystem">首页</a>
							<a href="booking" class="selected">库存寄售</a>
							
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
						<p style="position: absolute;margin-top: -10px;">
							<img style="width: 30px;height: 30px;" src="logo/daishouQQ.jpg">
							<span style="font-weight: bold;">
								 <a href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2145885569&site=qq&menu=yes');">QQ : 2145885569</a>
						    </span>
						</p>
						<p style="position: absolute;margin-top: 30px;">
							&nbsp;<img style="width: 26px;height: 26px;" src="logo/daishouTel.png">&nbsp;<span style="font-weight: bold;"><a>TEL : 130-4982-9234</a></span>
						</p>
					<div style="margin-left: 85px">
						<h1 style="text-align: center;margin-left: -90px;font-size: 20px;font-weight: bold;">寄售申请流程</h1>
						<img alt="" src="<%=basePath%>logo/daishou.png">
					</div>
				    <div class="cl pd-5 bg-1 bk-gray mt-20">
					    <p style="margin-left: 60px;height: 30px;line-height: 40px;display: inline-block;">
							<a href="jumpAddbooking" style="font-weight: bold;font-size: 15px;">
								<img src="logo/daishoujia.png">&nbsp;添加代售产品
							</a>
						</p>
						<p style="margin-left: 800px;height: 30px;line-height: 40px;display: inline-block;">
							<a href="bookingproductexpress" style="font-size: 15px;color: red;">
								出售记录
							</a>
						</p>
				    </div>
				    <div class="mt-20">
				    	<table  border="1" style="border: 1px #EEEEEE solid;border-collapse: collapse;">
							<thead  style="background: #F5FAFE">
								<tr >
									<th style="height: 40px;color: black;font-weight: bold;text-align: center;">产品型号</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">封装</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">数量</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">单价</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">渠道</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">联系电话</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">提交时间</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">备注</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">反馈</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">状态</th>
					                <th style="height: 40px;color: black;font-weight: bold;text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach items="${bookingList }" var="items" varStatus="express">
					                <tr class="text-c"  style="height: 50px;">
					                   	<td>${items.booking_product }</td>
										<td>${items.booking_encapsulation }</td>
										<td>${items.booking_number }</td>
										<td>￥${items.booking_price }</td>
										<td>${items.booking_channel }</td>
										<td>${items.booking_phone }</td>
										<td><fmt:formatDate value="${items.booking_date }" pattern="yyyy/MM/dd HH:mm"/></td>
										<td>${items.booking_note }</td>
										<td>${items.booking_feedback }</td>
										<td style="color: red;">
											<c:if test="${items.booking_status == 1 }">
												<font size="2.5">审核中</font>
											</c:if>
											<c:if test="${items.booking_status == 2 }">
												<font size="2.5">待寄售</font>
											</c:if>
											<c:if test="${items.booking_status == 3 }">
												<font size="2.5">审核未通过</font>
											</c:if>
											<c:if test="${items.booking_status == 4 }">
												<font size="2.5">待检验</font>
											</c:if>
											<c:if test="${items.booking_status == 5 }">
												<font size="2.5">待付款</font>
											</c:if>
											<c:if test="${items.booking_status == 6 }">
												<font size="2.5">出售中</font>
											</c:if>
										</td>
										<td>
											<c:if test="${items.booking_status == 5 }">
												<a class="fan" data-remodal-target="fanli" data-id="${items.booking_id}" 
						                    	   style="color: white;position: relative;background: #EE4000;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
						                    	      付款</a>
											</c:if>
										</td>
					                </tr>
				                </c:forEach>
							</tbody>
						</table>
						<div style="width: 100%;margin-top: 20px;">
				        	当前第&ensp;<span style="font-weight: bold;color: black">${page }</span>&ensp;页&ensp;/&ensp;
				        	共&ensp;<span style="font-weight: bold;color: black">${count }</span>&ensp;页
				        	共&ensp;<span style="font-weight: bold;color: black">${total }</span>&ensp;条记录
				        	<button class="button2" onclick = "first()">首页</button>
					       	<c:if test="${count > 1}">
					       		<button class="button2"  onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>
					       		<button class="button2"  onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>
					       		<button class="button2"  onclick = "san()" <c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>
					       		<button class="button2"  onclick = "si()" <c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>
					       	</c:if>
					       	<button class="button2"  onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>
					       	<button class="button2"  onclick = "end()">尾页</button>
				        </div>
				    </div>
				</div>
			</div>
			<div style="margin-left: 85px;margin-top: 30px;margin-bottom: 30px">
				<p style="font-weight: bold;"> 库存寄售格则   :  </p>
				<p style="width: 20px;display: inline-block;">1.</p>
				<p style="width: 600px;display: inline-block;">代售的产品包括自有现货正品库存、自己正规进购渠道（需向我们提供进货渠道证明）。</p>
				<br><p style="width: 20px;display: inline-block;position: absolute;">2.</p>
				<p style="width: 600px;display: inline-block;margin-left: 25px;">自可知平台不参与代售销售利润分成，所有销售利润归代售个人所有，三个代售型号内自可知平台只收取代售会员每年100元的代售费用，三个型号可根据会员自行跟换，超过三个型号每增加一个型号收取100元一年。</p>
				<br><p style="width: 20px;display: inline-block;position: absolute;">3.</p>
				<p style="width: 600px;display: inline-block;margin-left: 25px;">会员代售个人自有库存需把产品发到自可知保管，收到货核实之后，自可知会发电子档收据给代售会员，当产品丢失、损毁由自可知全额赔款（除芯片功能自身损坏），销售发货由在芯片统一发出。</p>
				<br><p style="width: 20px;display: inline-block;">4.</p>
				<p style="width: 600px;display: inline-block;">发放金额方式每笔销售金额实时发送到代售会员。</p>
				<br><p style="width: 20px;display: inline-block;">5.</p>
				<p style="width: 600px;display: inline-block;">代售会员有独立的管理账号实时观测销售情况。</p>
			</div>
			<div class="remodal" data-remodal-id="fanli">
				<button data-remodal-action="close" class="remodal-close"></button>
				<img src="img/pays.jpg" width="240px;" style="margin-top: 10px;" height="280px;" alt="请我支付">
				<br>
				<br>
				<button data-remodal-action="confirm" class="remodal-confirm pay" id="pay">
					付款成功
				</button>
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
	$(".fan").hover(function(){
		 $(this).css("background","red");
	 },function(){
		 $(this).css("background","#EE4000");
	 });
	var pid;
	$(".fan").on("click", function(){
	    pid = $(this).data("id");
	});
	$("#pay").on("click", function(){
		var booking_feedback=$("#booking_feedback").val();
		var status=$('input:radio:checked').val();
		$.post("1019/zai/xin/jian/updateBookingstatus?booking_status=1&booking_id="+pid,
			function(data){
				window.location.href="booking";
			}
		)
		/* window.location.href="updateBookingstatus?booking_status="+status+"&booking_id="+pid+"&booking_feedback="+booking_feedback; */
	});
function first(){
	window.location.href='booking?page=${1}&&rows=${pageSize }';
}
function end(){
	window.location.href='booking?page=${count == 0 ? 1:count }&&rows=${pageSize }';
}
function er(){
	var page=${page+1 };
	var count=${count };
	if(parseInt(page) >parseInt(count) ){
		return false;
	}else{
		window.location.href='booking?page=${page+1}&&rows=${pageSize }';
	}
}
function san(){
	var page=${page+2 };
	var count=${count };
	if(parseInt(page) >parseInt(count) ){
		return false;
	}else{
		window.location.href='booking?page=${page+2}&&rows=${pageSize }';
	}
}
function si(){
	var page=${page+3 };
	var count=${count };
	if(parseInt(page) >parseInt(count) ){
		return false;
	}else{
		window.location.href='booking?page=${page+3}&&rows=${pageSize }';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='booking?page=${page-1}&&rows=${pageSize }';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='booking?page=${page+1}&&rows=${pageSize }';
	}
}
</script>

</body>
</html>