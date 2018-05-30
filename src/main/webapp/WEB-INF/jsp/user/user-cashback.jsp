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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<style type="text/css">
	html{
		font: 微软雅黑;
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
.fan:hover{
	text-decoration: none;
}
.fanmao:hover{
	text-decoration: none;
}
.dianwotixian{
	display: none;
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
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >
						个人中心
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd style="display: block;">
					<ul>
						<li>
							<a href="myCart" data-title="我的购物车">
								&emsp;&emsp;我的购物车
							</a>
						</li>
					    <li>
							<a href="express" data-title="主动元器件订单">
								&emsp;&emsp;主动元器件订单
							</a>
						</li>
						<li>
							<a href="beidongExpress" data-title="被动元器件订单">&emsp;&emsp;被动元器件订单</a>
						</li>
						<li>
							<a href="MyAddress" data-title="地址">
								&emsp;&emsp;我的地址
							</a>
						</li>
						<li style="background: #D0DFEF;">
							<a href="cashback" data-title="订单返现"><img style="position: absolute;margin-top: 8px;" src="<%=basePath%>logo/yuan.png?3214">&emsp;&emsp;订单返现</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="supplierIn" data-title="公司信息" >&emsp;&emsp;公司资料</a></li>
						<li>
							<a href="javascript:;" onclick="usersupplier()" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="javascript:;" onclick="usersupplierpt();" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu_2">
				<dt>
					<img src="<%=basePath%>logo/jilu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">资源管理</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="queryByInquiryUserid" data-title="询价记录" >
								&emsp;&emsp;询价记录（采购记录）
							</a>
						</li>
						<li><a href="quoteAllByUser" data-title="报价记录">&emsp;&emsp;报价记录</a></li>
						<li>
							<a href="stockAll" data-title="库存管理">
								&emsp;&emsp;库存管理（销售订单）
							</a>
						</li>
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
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 11px;margin-left: 13px;">
							<a href="usersystem">首页</a>
							<a href="cashback" class="selected">会员返现</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
					<div style="margin-bottom: 20px;float: left;">
						<table style="border: 1px #EEEEEE solid;height: 80px;width: 260px;text-align: center;" border="1">
							<tr>
								<td style="font-weight: bold;color: black;">
									已提现金额
								</td>
								<td style="font-weight: bold;color: red;">
									￥ 
									<c:if test="${price != null}">
										${price }
									</c:if>
									<c:if test="${price == null}">
										0
									</c:if>
								</td>
								<td rowspan="2" style="width: 100px;text-align: center;">
									<c:if test="${fanTotal-price >= 100 }">
										<a class="fan" id="dianwo"
						                   style="color: white;position: relative;background: #EE4000;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">
						                                            点我提现</a>
									</c:if>
									<c:if test="${fanTotal-price < 100 }">
										<a href="javascript:;" onclick="aa()" class="fanmao"
						                   style="color: white;position: relative;background: #EE4000;padding: 6px 14px 6px 14px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: -3px;">
						                                            点我提现</a>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold;color: black;">
									可提现金额
								</td>
								<td style="font-weight: bold;color: red;">
									￥ 
									<c:if test="${fanTotal-price > 0}">
										${fanTotal-price }
									</c:if>
									<c:if test="${fanTotal-price <= 0}">
										0
									</c:if>
								</td>
							</tr>
						</table>
				    </div>
				    <div class="dianwotixian" style="width: 800px;height: 30px;margin-left: 280px;height: 40px;text-align: center;padding-top: 25px;">
				    	<span  style="font-weight: bold;color: black;">提现金额&emsp;</span>
						<input style="text-align:center;width:120px;height: 29px;border: 1px #FFA500 solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;"
							   id="w_price" name="w_price" type="text"  required="required" placeholder="如100、200">
						<span  style="font-weight: bold;color: black;">&emsp;支付宝账号&emsp;</span>
						<input style="text-align:center;width:120px;height: 29px;border: 1px #FFA500 solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;"
							   id="w_account" name="w_account" type="text"  required="required">
						<span  style="font-weight: bold;color: black;">&emsp;支付宝用户名称&emsp;</span>
						<input style="text-align:center;width:120px;height: 29px;border: 1px #FFA500 solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;"
							   id="w_alipayName" name="w_alipayName" type="text"  required="required">
						<button  style="width: 55px;margin-left: 20px;" id="quxiaowo"
								data-remodal-action="cancel" class="btn btn-danger radius">取消</button>
						<button  data-remodal-action="confirm" class="btn btn-success radius"  id="pay"
								type="submit">确定</button>
				    </div>
				    <div class="mt-20">
				    	<table  border="1" style="border: 1px #EEEEEE solid;border-collapse: collapse;">
							<thead  style="background: #F5FAFE">
								<tr >
									<th style="text-align: center;font-weight: bold;color: black;height: 40px;">获得时间</th>
									<th style="text-align: center;font-weight: bold;color: black;height: 40px;">来源</th>
									<th style="text-align: center;font-weight: bold;color: black;height: 40px;">返现金额</th>
								</tr>
							</thead>
							<tbody >
								<c:forEach items="${expressList}" var="items" varStatus="express">
					                <tr class="hello">
					                   <td style="height: 40px;text-align: center;"><fmt:formatDate value="${items.edate}" pattern="yyyy/MM/dd"/></td>
					                   <td style="height: 40px;text-align: center;">${items.name}</td>
					                   <td style="height: 40px;text-align: center;"> 
					                   		<c:if test="${items.fan != null}">￥${items.fan }</c:if>
					                    	<c:if test="${items.fan == null}">审核中</c:if>
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
				<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
					<%@include file="../../../../include/footer.jsp"%>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="js/userinfo.js"></script>
	<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
<script type="text/javascript">
function usersupplier(){
	$.post("supplierseleuser",
		function(data){
			if(data.result=="fail"){
				layer.alert('请先添加公司信息');   
				setTimeout(function(){window.location.href="supplierIn";},1000);
			}else if(data.result=="seccuss"){
				window.location.href="userSupplierProduct";
			}else if(data.result=="login"){
				window.location.href="frontLogin";
			}
		}
	)
}
function usersupplierpt(){
	$.post("supplierseleuser",
        function(data){
			if(data.result=="fail"){
				layer.alert('请先添加公司信息');   
				setTimeout(function(){window.location.href="supplierIn";},1000);
			}else if(data.result=="seccuss"){
				window.location.href="putong";
			}else if(data.result=="login"){
				window.location.href="frontLogin";
			}
		}
   	)
}
	$('#dianwo').click(function(){
		$('.dianwotixian').css('display','block')
	});
	$('#quxiaowo').click(function(){
		$('.dianwotixian').css('display','none');
	});
$(function(){
	var td = $(".hello td");  
    td.mouseover(function () {  
        $(this).css("background-color", "#AEF2E5");  
    }).mouseout(function () {  
        $(this).css("background-color", "#FFFFFF");  
    });
    
    $(".fan").hover(function(){
		$(this).css("background","red");
	},function(){
		$(this).css("background","#EE4000");
	});
    $(".fanmao").hover(function(){
		$(this).css("background","red");
	},function(){
		$(this).css("background","#EE4000");
	});
});
$("#pay").on("click", function(){
	var w_price=$("#w_price").val();
 	var w_account = $("#w_account").val();
	var w_alipayName=$("#w_alipayName").val();
	var tixian='${fanTotal-price}';
	if(parseFloat(w_price) % 100 != 0){
		layer.alert("请输入正确金额！");
	}else if(parseFloat(w_price)>parseFloat(tixian)){
		layer.alert("可提现金额不足！");
	}else{
		$.post("addwithdrawal?w_price="+w_price+"&w_account="+w_account+"&w_alipayName="+w_alipayName,
	           function(data){
				if(data.result=="fail"){
				}else if(data.result=="seccuss"){
					layer.alert("提现成功！将在1~3个工作日内到账");
					window.location.href="cashback";
				}
			}
	   	)
	}
});
function aa(){
	layer.alert("可提现金额不足￥100");
}
function first(){
	window.location.href='cashback?page=${1}&&rows=${pageSize }';
}
function end(){
	window.location.href='cashback?page=${count == 0 ? 1:count }&&rows=${pageSize }';
}
function er(){
	var page=${page+2 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='cashback?page=${page+1}&&rows=${pageSize }';
	}
}
function san(){
	var page=${page+1 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='cashback?page=${page+2}&&rows=${pageSize }';
	}
}
function si(){
	var page=${page };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='cashback?page=${page+3}&&rows=${pageSize }';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='cashback?page=${page-1}&&rows=${pageSize }';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='cashback?page=${page+1}&&rows=${pageSize }';
	}
}
</script>
</body>
</html>