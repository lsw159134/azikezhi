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
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="t11ext/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
	<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
    <title>在芯间用户系统-bom询价-查看询价</title>
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
	html{
		font: 微软雅黑;
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
    </style>
</head>

<body>
<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #87CEEB">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #FFA500;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;">
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
				<dt>
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
			<!-- <dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="QuotesByuser" data-title="bom订单" href="javascript:;">bom表询价</a>
				</dt>
			</dl> -->
			<dl id="menu-admin">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user_xunjia.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="询价记录" href="javascript:;" style="font-weight: bold;">我的询价</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dt>
					<ul>
						<li >
							<a href="queryByInquiryUserid" data-title="普通询价" >
								&emsp;&emsp;普通询价
							</a>
						</li>
						<li style="background: #D0DFEF;">
							<a href="QuotesByuser" data-title="bom表询价" >
								<img style="position: absolute;margin-top: 13px;" src="<%=basePath%>logo/yuan.png">&emsp;&emsp;bom表询价
							</a>
						</li>
					</ul>
				</dt>
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
							<a href="javascript:void(0)" class="selected">查看询价</a>
							<a target="blank" href="aboutus">关于我们</a>
							<a href="QuotesByuser" class="selected">返回上一页</a>
						</nav>
					</li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;">
					<i class="Hui-iconfont">&#xe6d4;</i>
				</a>
				<a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;">
					<i class="Hui-iconfont">&#xe6d7;</i>
				</a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="margin-top: 50px;margin-left: 80px;">
			    	<textarea name='part' cols="50" rows="15" class="tex" style="height:346px;width: 600px;margin-left: 200px;text-align: center;" id="formData" readonly="readonly">${quotesDatil.quotes_wenben }</textarea>
			    </div>
			    <div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
					<%@include file="../../../../include/footer.jsp"%>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
/* $(function(){
	var val='${quotesDatil.quotes_wenben }'
	val=val.replace(/\n/g,"<br>");
	val=val.replace(/\t/g,"<tr>");
	
}) */
$("#pay").on("click", function(){
	var id='${bom.bom_id}';
	var bom_status='${bom.bom_status}';
	if(bom_status!=1){
		window.location.href="queryByBomIduser?id=${bom.bom_id}"
	}else{
		window.location.href="bomOrderPay?fapiao=1&expressname=2&id="+id;
	}
	
});
</script>
<style type="text/css">
    #update{
        width: 100px;
        height: 25px;
    }
    #update:hover{
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