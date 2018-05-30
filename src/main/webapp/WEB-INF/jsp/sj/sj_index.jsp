<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Template Name: Clip-Two - Responsive Admin Template build with Twitter Bootstrap 3.x | Author: ClipTheme -->
<!--[if IE 8]><html class="ie8" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<head>
		<title>在芯间-供应商系统</title>
		<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
		<!-- start: META -->
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<!-- start: GOOGLE FONTS -->
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<!-- end: GOOGLE FONTS -->
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<!-- end: MAIN CSS -->
		<!-- start: CLIP-TWO CSS -->
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		<!-- end: CLIP-TWO CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		
		<style type="text/css">
		
			table{
				text-align:center;
				borde:2px solid;
				table-layout:fixed;
			}
			td{
				border:1px solid;
				width: 400px;
				height: 40px;
				text-align: center;
			}
			h1{
				font-size: 20px;
				color: #4876FF;
				font-weight: bold;
			}
			h2{
				font-size: 20px;
			}
			#cpqd{
				color: #4876FF;
				font-size: 20px;
				font-weight: bold;
				
			}
			#cpSearch{
				margin-left: 35px;
				width: 158px;
			}
		
			.sjinput{
				width:400px;
				height: 40px;
				border:none;
				
			}
			#anniu{
				width: 100px;
				color: #4876FF;
				font-weight: bold;
			}
			.color{
				background-color: red;
			}
			P{
				margin: 0 auto;
			}					
		</style>
	</head>
	
	<body>
		<div id="app">
			<!-- sidebar -->
			<div class="sidebar app-aside" id="sidebar">
				<div class="sidebar-container perfect-scrollbar">
					<nav>
						<!-- start: SEARCH FORM -->
					 	<!-- <div class="search-form">
							<a class="s-open" href="#">
								<i class="ti-search"></i>
							</a>
							<form class="navbar-form" role="search">
								<a class="s-remove" href="#" target=".navbar-form">
									<i class="ti-close"></i>
								</a>
								<div class="form-group">
									<input type="text" id="cpSearch1" class="form-control" placeholder="Search...">
									<button class="btn search-button" onclick="sjCpSearch1()" >
										<i  class="ti-search"></i>
									</button>
								</div>
							</form>
						</div> -->
						<div id="kuaisuSearch">
							<input style="width:205px;color: red" type="text" id="cpSearch1" placeholder="快捷搜索型号..." />
							<button style="font-weight: bold;color: #4876FF" onclick="sjCpSearch1()">搜索</button>
						</div>
					    
						<!-- end: SEARCH FORM -->
						<!-- start: MAIN NAVIGATION MENU -->
						<div class="navbar-title">
							<span style="color:orange;margin-left: 30px;font-size: 20px">ZAIXINJIAN.COM</span>
						</div>
						<ul class="main-navigation-menu"	>
							<li class="active open">
								<a href="#">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-home"></i>
										</div>
										<div class="item-inner">
											<span class="title"> 导航栏 </span>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="sj_ziliao">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-settings"></i>
										</div>
										<div class="item-inner">
											<span class="title">商家资料</span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
							</li>
								<c:if test="${sessionScope.sjLogin.shiro == 1}">
									<li>
										<a href="java:;" onclick="alert('请耐心等候,我们会在一个工作日之内给你答复')">
											<div class="item-content">
												<div class="item-media">
													<i class="ti-layout-grid2"></i>
												</div>
												<div class="item-inner">
													<span class="title">产品上传</span><i class="icon-arrow"></i>
												</div>
											</div>
										</a>
									</li>
									<li>
										<a href="java:;" onclick="alert('请耐心等候,我们会在一个工作日之内给你答复')">
											<div class="item-content">
												<div class="item-media">
													<i class="ti-pencil-alt"></i>
												</div>
												<div class="item-inner">
													<span class="title"> 产品查询 </span><i class="icon-arrow"></i>
												</div>
											</div>
										</a>
									</li>
									<li>
										<a href="java:;" onclick="alert('请耐心等候,我们会在一个工作日之内给你答复')">
											<div class="item-content">
												<div class="item-media">
													<i class="ti-user"></i>
												</div>
												<div class="item-inner">
													<span class="title"> 我的订单 </span><i class="icon-arrow"></i>
												</div>
											</div>
										</a>
									</li>
								</c:if>
								<c:if test="${sessionScope.sjLogin.shiro == 2}">	
									<li>
										<a href="tianJiaSp">
											<div class="item-content">
												<div class="item-media">
													<i class="ti-layout-grid2"></i>
												</div>
												<div class="item-inner">
													<span class="title">产品上传</span><i class="icon-arrow"></i>
												</div>
											</div>
										</a>
									</li>
									<li>
										<a href="sj_searchProduct">
											<div class="item-content">
												<div class="item-media">
													<i class="ti-pencil-alt"></i>
												</div>
												<div class="item-inner">
													<span class="title"> 产品查询 </span><i class="icon-arrow"></i>
												</div>
											</div>
										</a>
									</li>
								<li>
									<a href="javascript:void(0)">
										<div class="item-content">
											<div class="item-media">
												<i class="ti-user"></i>
											</div>
											<div class="item-inner">
												<span class="title"> 我的订单 </span><i class="icon-arrow"></i>
											</div>
										</div>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			
			<!-- / sidebar -->
			<div class="app-content">
				<!-- start: TOP NAVBAR -->
				<header class="navbar navbar-default navbar-static-top">
					<!-- start: NAVBAR HEADER -->
					<div class="navbar-header">
						<a href="#" class="sidebar-mobile-toggler pull-left hidden-md hidden-lg" class="btn btn-navbar sidebar-toggle" data-toggle-class="app-slide-off" data-toggle-target="#app" data-toggle-click-outside="#sidebar">
							<i class="ti-align-justify"></i>
						</a>
						<a href="java:;" onclick="window.open('index')" id="zxj_hidden">
							<img style="width: 50px;height: 50px;margin-top: -15px" src="logo/heart.png" alt=""/>
							<span style="font-size: 30px;margin-left: 20px;">在芯间</span>
						</a>
						<a  href="java:;" onclick="zxj_hidden()" class="sidebar-toggler pull-right visible-md visible-lg" data-toggle-class="app-sidebar-closed" data-toggle-target="#app">
							<i class="ti-align-justify"></i>
						</a>
						<a class="pull-right menu-toggler visible-xs-block" id="menu-toggler" data-toggle="collapse" href=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<i class="ti-view-grid"></i>
						</a>
					</div>
					<!-- end: NAVBAR HEADER -->
					<!-- start: NAVBAR COLLAPSE -->
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-right">
							<!-- start: MESSAGES DROPDOWN -->
							<li class="dropdown">
								<a href="java:;" onclick="window.open('index')">
									<span class="dot-badge partition-red"></span> <i class="ti-comment"></i> <span>首页</span>
								</a>
							</li>
							<!-- end: MESSAGES DROPDOWN -->
							<!-- start: ACTIVITIES DROPDOWN -->
							<li class="dropdown">
								<a href="java:;" onclick="window.open('aboutus')" class="dropdown-toggle" data-toggle="dropdown">
									<i class="ti-check-box"></i> <span>联系我们</span>
								</a>
							</li>
							<!-- end: ACTIVITIES DROPDOWN -->
							<!-- start: LANGUAGE SWITCHER -->
							<li class="dropdown">
								<a href="java:;" onclick="window.location = 'sjOut'" class="dropdown-toggle" data-toggle="dropdown">
									<i class="ti-world"></i> 退出
								</a>
							</li>
							<!-- start: LANGUAGE SWITCHER -->
							<!-- start: USER OPTIONS DROPDOWN -->
							<li class="dropdown current-user">
								<a href class="dropdown-toggle" data-toggle="dropdown">
									<img src="logo/face.png" alt="Peter"> <span style="margin-top: 20px" class="username">${sessionScope.sjLogin.userName} 
								</a>
							</li>
							<!-- end: USER OPTIONS DROPDOWN -->
						</ul>
						<!-- start: MENU TOGGLER FOR MOBILE DEVICES -->
						<div class="close-handle visible-xs-block menu-toggler" data-toggle="collapse" href=".navbar-collapse">
							<div class="arrow-left"></div>
							<div class="arrow-right"></div>
						</div>
						<!-- end: MENU TOGGLER FOR MOBILE DEVICES -->
					</div>
					<!-- end: NAVBAR COLLAPSE -->
				</header>
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: DASHBOARD TITLE -->
						<!-- <section id="page-title" class="padding-top-15 padding-bottom-15">
							<div class="row">
								<div class="col-sm-7">
									<h1 class="mainTitle">ZAIXINJIAN</h1>
									<span class="mainDescription">供应商 &amp;系统 </span>
								</div>
								<div class="col-sm-5">
									start: MINI STATS WITH SPARKLINE
									<ul class="mini-stats pull-right">
										<li>
											<div class="sparkline-1">
												<span ></span>
											</div>
											<div class="values">
												<img alt="" src="logo/zp.png">
												<p style="font-weight: bold;color: #4876FF;" class="text-small no-margin">
													正品保障
												</p>
											</div>
										</li>
										<li>
											<div class="sparkline-2">
												<span ></span>
											</div>
											<div class="values">
												<img alt="" src="logo/sd.png">
												<p style="font-weight: bold;color: #EE0000;" class="text-small no-margin">
													闪电上传
												</p>
											</div>
										</li>
										<li>
											<div class="sparkline-3">
												<span ></span>
											</div>
											<div class="values">
												<img alt="" src="logo/xh.png">
												<p style="font-weight: bold;color: #76EE00;" class="text-small no-margin">
													随时现货
												</p>
											</div>
										</li>
									</ul>
									end: MINI STATS WITH SPARKLINE
								</div>
							</div>
						</section> -->
						<!-- end: DASHBOARD TITLE -->
						<!-- start: FEATURED BOX LINKS -->
						<%-- <div class="container-fluid container-fullw bg-white">
							<div class="row">
								
									<div  class="col-sm-4">
										<div class="panel panel-white no-radius text-center">
											<div class="panel-body">
												<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-smile-o fa-stack-1x fa-inverse"></i> </span>
												<h2 class="StepTitle">商家资料</h2>
												<p class="text-small">
													您在这里可以查看/修改个人信息.
												</p>
												<p class="links cl-effect-1">
													<a href="sj_ziliao" >
														点我进入
													</a>
												</p>
											</div>
										</div>
									</div>
								<c:if test="${sessionScope.sjLogin.shiro == 1}">
									<div class="col-sm-4">
										<div class="panel panel-white no-radius text-center">
											<div class="panel-body">
												<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-paperclip fa-stack-1x fa-inverse"></i> </span>
												<h2 class="StepTitle">产品上传</h2>
												<p class="text-small">
													您在这里可以随时上传自己所需要的产品.
												</p>
												<p class="cl-effect-1">
													<a href="java:;" onclick="alert('请耐心等候,我们会在一个工作日之内给你答复')">
														点我进入
													</a>
												</p>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="panel panel-white no-radius text-center">
											<div class="panel-body">
												<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-terminal fa-stack-1x fa-inverse"></i> </span>
												<h2 class="StepTitle">产品查询</h2>
												<p class="text-small">
													您在这里可以查看已经上传过的产品.
												</p>
												<p class="links cl-effect-1">
													<a href="java:;" onclick="alert('请耐心等候,我们会在一个工作日之内给你答复')">
														点我进入
													</a>
												</p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${sessionScope.sjLogin.shiro == 2}">
									<div class="col-sm-4">
										<div class="panel panel-white no-radius text-center">
											<div class="panel-body">
												<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-paperclip fa-stack-1x fa-inverse"></i> </span>
												<h2 class="StepTitle">产品上传</h2>
												<p class="text-small">
													您在这里可以随时上传自己所需要的产品.
												</p>
												<p class="cl-effect-1">
													<a href="tianJiaSp">
														点我进入
													</a>
												</p>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="panel panel-white no-radius text-center">
											<div class="panel-body">
												<span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-terminal fa-stack-1x fa-inverse"></i> </span>
												<h2 class="StepTitle">产品查询</h2>
												<p class="text-small">
													您在这里可以查看已经上传过的产品.
												</p>
												<p class="links cl-effect-1">
													<a href="sj_searchProduct">
														点我进入
													</a>
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div> --%>
						
						<c:if test="${sj_ziliao == 1}">
							<div >
								<table  cellpadding="0" cellspacing="0" border="1px solid" id="updateSjIndex">
								<!--id;comPany公司;tel手机号;userName昵称;passWord密码;shiro审核;faDingRen法定人;zuoJiOne座机1;
									zuoJiTwo座机2;zuoJiThree座机3;zuoJiFour座机4;address地址;email邮箱;qq;chuanZhen传真;	
											createTime创建时间;lastTime更新时间; -->
									<h1>商家资料</h1>	
									
										<tr>
											<td>公司名称</td>
											<td>${sessionScope.sjLogin.comPany}</td>
											<td><a href="javascript:void(0)"
											onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">如有问题,请联系客服</a></td>
										</tr>
									
										<tr>
											<td>法定人</td>								
											<td>${sessionScope.sjLogin.faDingRen}</td>
											<c:if test="${sessionScope.sjLogin.faDingRen == null}">	
												<td id = "faDingRen">
													<a href="javascript:;">
														添加
													</a>
												</td>
											</c:if>
											<c:if test="${sessionScope.sjLogin.faDingRen != null}">
												<td>
													<a href="javascript:void(0)"onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
														如有问题,请联系客服
													</a>
												</td>
											</c:if> 
										</tr>
														
										<tr>
											<td>手机号</td>
											<td>${sessionScope.sjLogin.tel}</td>
											<td>
												<a href="javascript:void(0)"onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
													如有问题,请联系客服
												</a>
											</td>
										</tr>
										
										<tr>
											<td>地址</td>								
											<td>${sessionScope.sjLogin.address}</td>
											<c:if test="${sessionScope.sjLogin.address == null}">	
												<td id = "address">
													<a href="javascript:;">
														添加
													</a>
												</td>
											</c:if>
											<c:if test="${sessionScope.sjLogin.address != null}">
												<td>
													<a href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
														如有问题,请联系客服
													</a>
												</td>
											</c:if> 
										</tr>
									
										<tr>
											<td>座机1</td>
											<td>${sessionScope.sjLogin.zuoJiOne}</td>
											<td id="zuoJiOne">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>座机2</td>
											<td>${sessionScope.sjLogin.zuoJiTwo}</td>
											<td id="zuoJiTwo">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>座机3</td>
											<td>${sessionScope.sjLogin.zuoJiThree}</td>
											<td id="zuoJiThree">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>座机4</td>
											<td>${sessionScope.sjLogin.zuoJiFour}</td>
											<td id="zuoJiFour">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>邮箱</td>
											<td>${sessionScope.sjLogin.email}</td>
											<td id="email">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>企业QQ</td>
											<td>${sessionScope.sjLogin.qq}</td>
											<td id="qq">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>昵称</td>
											<td>${sessionScope.sjLogin.userName}</td>
											<td id="userName">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>密码</td>
											<td>${sessionScope.sjLogin.passWord}</td>
											<td id="passWord">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>传真</td>
											<td>${sessionScope.sjLogin.chuanZhen}</td>
											<td id="chuanZhen">
												<a href="javascript:;">修改/添加</a>
											</td>
										</tr>
										
										<tr>
											<td>入驻时间</td>
											<td>${sessionScope.sjLogin.createTime}</td>
											<td id="createTime">
												<a href="javascript:;">如有问题,请联系客服</a>
											</td>
										</tr>
										
								</table>
							</div>
						</c:if>
						
						<c:if test="${sj_addcp == 1}">
							<div >
								<form action="addNewProduct" id="zh_form" method="post">
									<table cellpadding="0" cellspacing="0" >
										<h1>产品添加</h1>
										<tr>
											<td>型号</td><td><input type="text" id="aa" name="product" required></td>
											<td>厂商</td><td><input type="text" id="bb" name="manufacturer" /></td>
										</tr>
										<tr>
											<td>封装</td><td><input type="text" id="cc" name="encapsulation"  /></td>
											<td>批号</td><td><input type="text" id="dd" name="lotnumber"  /></td>
										</tr>
										<tr>
											<td> 
												库存:<input style="width: 80px" type="text" id="ee" name="isgoodsinstock"   placeholder="数量" /><br>
												单位:<input style="width: 80px" type="text" id="discount_unit" name="discount_unit" value="片" placeholder="单位">
											</td>       
											<td colspan="3">
												<input style="width: 80px;" type="number"  id="min1" name="min1" value="1" readonly />
												<span style="color: blue;font-weight: bold;">
													------
												</span>
												
												<input style="width: 80px" onblur="id1()" type="number" id="max1" name="max1" placeholder="结束数量" />
												<span style="color: blue;font-weight: bold;">
													------
												</span>
												<input style="width: 80px;color: green;" type="text" id="price1" name="price1" placeholder="价格" />
												<span style="color: green;font-weight: bold;">
													元
												</span>
												<br>
												<input style="width: 80px" type="number"  id="min2" name="min2" onblur="min2()" readonly  />
												<span style="color: blue;font-weight: bold;">
													------
												</span>
												<input style="width: 80px" type="number" onblur="id2()" id="max2" name="max2" placeholder="结束数量"  />
												<span style="color: blue;font-weight: bold;">
													------
												</span>
												<input style="width: 80px;color: green;" type="text"  id="price2" name="price2" placeholder="价格" />
												<span style="color: green;font-weight: bold;">
													元
												</span>
												<br>
												<input style="width: 80px;margin-left: -4px" type="number"  id="min3" name="min3" readonly  />
												<span style="color: blue;font-weight: bold;">
													------
												</span>
												<input type="text" value="以上" style="width: 80px;text-align: center;color: red" readonly />
												<span style="color: blue;font-weight: bold;">
													------
												</span>
												<input style="width: 80px;color: green;" type="text"  id="price3" name="price3" placeholder="价格" />
												<span style="color: green;font-weight: bold;">
													元
												</span>
										    </td>
											
										</tr>
										<tr>
											<td>描述</td><td><input id="ff" type="text" name="description"  /></td>
											<td>质量</td><td><select name="quality" >
																<option  value="2">原装</option>
																<option  value="17">国产</option>
																<option  value="27">散新</option>
															</select><img src="<%=basePath%>logo/xiala.png" /></td>
										</tr>
									</table>
									<input type="hidden" name="productuuid" >
									<input type="hidden" name="supplier" value="${sessionScope.sjLogin.comPany}"  />
									<input type="hidden" name="supplieruuid" value="${sessionScope.sj_id}"/>
									<div style="text-align: center;">
										<input id="anniu" type="button"  value="添加" />
									</div>
								</form>		
							</div>
						</c:if>
						<c:if test="${supplier_searchCP == 1}">
							<div >
								<form action="supplier_updateCp" id="update_form" method="post">
									<table cellpadding="0" cellspacing="0" >
										<h1>产品修改</h1>
										
										<tr>
											<td>型号</td><td>
												<input type="hidden" name="productuuid" value="${sj_product.productuuid}">
												<input type="text" id="aa" name="product" value="${sj_product.product}">
											</td>
											<td>厂商</td><td><input type="text" id="bb" name="manufacturer"  value="${sj_product.manufacturer}"/></td>
										</tr>
										<tr>
											<td>封装</td><td><input type="text" id="cc" name="encapsulation" value="${sj_product.encapsulation}" /></td>
											<td>批号</td><td><input type="text" id="dd" name="lotnumber" value="${sj_product.lotnumber}" /></td>
										</tr>
										<tr>
											<td> 
												库存:<input style="width: 80px" type="text" id="ee" name="isgoodsinstock"   placeholder="数量"  value="${sj_product.isgoodsinstock}"/><br>
												<c:forEach items="${sj_product.discountList}" var="order">
													<c:if test="${order.discount_status == 1 }">
														单位:<input style="width: 80px" type="text" id="discount_unit" name="discount_unit" value="${order.discount_unit}" placeholder="单位">
													</c:if>
												</c:forEach>
												
												
											</td>       
											<td colspan="3">
												<c:forEach items="${sj_product.discountList}" var="order">
													<c:if test="${order.discount_status == 1 }">
														<input type="hidden" name="d_id1" value="${order.discount_id}" />
														<input style="width: 80px;" type="number"  id="min1" name="min1" value="${order.discount_numbermin}" readonly />
														<span style="color: blue;font-weight: bold;">
															------
														</span>
														
														<input style="width: 80px" onblur="id1()" type="number" id="max1" name="max1" value="${order.discount_numbermax}" placeholder="结束数量" />
														<span style="color: blue;font-weight: bold;">
															------
														</span>
														<input style="width: 80px;color: green;" type="text" id="price1" name="price1" value="${order.discount_price}" placeholder="价格" />
														<span style="color: green;font-weight: bold;">
															元
														</span>
														<br>
													</c:if>
													<c:if test="${order.discount_status == 2}">
														<input type="hidden" name="d_id2" value="${order.discount_id}" />
														<input style="width: 80px" type="number"  id="min2" name="min2" onblur="min2()" value="${order.discount_numbermin}" readonly  />
														<span style="color: blue;font-weight: bold;">
															------
														</span>
														<input style="width: 80px" type="number" onblur="id2()" id="max2" name="max2" placeholder="结束数量" value="${order.discount_numbermax}"  />
														<span style="color: blue;font-weight: bold;">
															------
														</span>
														<input style="width: 80px" type="text"  id="price2" name="price2" value="${order.discount_price}" placeholder="价格" />
														<span style="color: green;font-weight: bold;">
															元
														</span>
														<br>
													</c:if>
													<c:if test="${order.discount_status == 3}">
														<input type="hidden" name="d_id3" value="${order.discount_id}" />
														<input style="width: 80px;margin-left: -4px" type="number"  id="min3" name="min3" value="${order.discount_numbermin}" readonly  />
														<span style="color: blue;font-weight: bold;">
															------
														</span>
														<input type="text" value="以上" style="width: 80px;text-align: center;color: red" readonly />
														<span style="color: blue;font-weight: bold;">
															------
														</span>
														<input style="width: 80px" type="text"  id="price3" name="price3" value="${order.discount_price}" placeholder="价格" />
														<span style="color: green;font-weight: bold;">
															元
														</span>
													</c:if>
												</c:forEach>
										    </td>
											
										</tr>
										<tr>
											<td>描述</td><td><input id="ff" type="text" name="description" value="${sj_product.description}" /></td>
											<td>质量</td><td><select name="quality" >
																<c:if test="${sj_product.quality == 2}">
																	<option  value="2" selected="selected">原装</option>
																	<option  value="17">国产</option>
																	<option  value="27">散新</option>
																</c:if>
																<c:if test="${sj_product.quality == 17}">
																	<option  value="2" >原装</option>
																	<option  value="17" selected="selected">国产</option>
																	<option  value="27">散新</option>
																</c:if>
																<c:if test="${sj_product.quality == 27}">
																	<option  value="2" >原装</option>
																	<option  value="17">国产</option>
																	<option  value="27" selected="selected">散新</option>
																</c:if>
																
															</select><img src="<%=basePath%>logo/xiala.png" /></td>
										</tr>
									</table>
									<div style="text-align: center;">
										<input id="update_anniu" type="button"  value="修改" />
									</div>
								</form>		
							</div>
						</c:if>
						<c:if test="${sj_searchcp == 1}">
							<div >
								<table cellpadding="0" cellspacing="0" border="1px solid">
									<span id="cpqd">
										产品清单
									</span>
									<span>
										<input type="text" name="product" id="cpSearch" placeholder="请输入产品型号" /><button onclick="sjCpSearch()" style="color: orange">搜索</button>
									</span>
									
									<tr>
										<td>序号</td>
										<td>型号</td><!-- product -->
										<td>厂商</td><!-- manufacturer -->
										<td>批号</td><!-- lotnumber -->
										<td>封装</td><!-- encapsulation -->
										<td>库存</td><!-- isgoodsinstock -->
										<td>价格区间</td>
										<td>价格(元)</td><!-- price -->
										<td>质量</td><!-- quality -->
										<td>操作</td>
									</tr>
									<c:forEach items="${sj_product}" var="sjProduct" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${sjProduct.product}</td>
											<td>${sjProduct.manufacturer}</td>
											<td>${sjProduct.lotnumber}</td>
											<td>${sjProduct.encapsulation}</td>
											<td>${sjProduct.isgoodsinstock}</td>
											<td style="height: 150px">
												<c:if test="${not empty sjProduct.discountList}">
													<c:forEach items="${sjProduct.discountList}" var="order" varStatus="status">
  														<p style="padding-top: 10px">
															${order.discount_numbermin}
															<c:if test="${order.discount_numbermax != 0  }">
																~${order.discount_numbermax}
															</c:if>
															<c:if test="${order.discount_numbermax == 0  }">
																<span style="color: red;">
																	+
																</span>
															</c:if>
															${order.discount_unit}
														</p>		
													</c:forEach>
												</c:if>
												<c:if test="${empty sjProduct.discountList}">
													<p>
														1+
													</p>
													
												</c:if>
											</td>
											<td >
												<c:if test="${ not empty sjProduct.discountList}">
													<c:forEach items="${sjProduct.discountList}" var="order" varStatus="status">
														<p style="padding-top: 10px">
															${order.discount_price}元
														</p>
													</c:forEach>
												</c:if>
												<c:if test="${empty sjProduct.discountList}">
													<p >
														${sjProduct.price}元
													</p>
												</c:if>
											</td>
											
											<c:if test="${sjProduct.quality == 2 }">
												<td>原装</td>
											</c:if>
											<c:if test="${sjProduct.quality == 17 }">
												<td>国产</td>
											</c:if>
											<c:if test="${sjProduct.quality == 27 }">
												<td>散新</td>
											</c:if>
											<td>
												<button  onclick="deleCp('${sjProduct.productuuid}')" style="color: red;font-weight: bold;">
													删除
												</button>
												<br>&nbsp;<br>
												<button onclick="updateCp('${sjProduct.productuuid}')" style="color: green;font-weight: bold;">
													修改
												</button>
											</td>
										</tr>
									</c:forEach>
								</table>
									<div style="width: 100%;">
							        	当前第${page }页/共${count }页&nbsp;&nbsp;共${total}条记录&nbsp;&nbsp;
							        	<button onclick = "first()">首页</button>&nbsp;
							        	<button onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
							        	<button onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
							        	<button onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
							        	<button onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
							        	<button onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
							        	<button onclick = "end()">尾页</button>
						       		</div>
							</div>
						</c:if>
						<!-- end: FEATURED BOX LINKS -->
						<!-- start: FIRST SECTION -->
						<!-- end: FIRST SECTION -->
						<!-- start: SECOND SECTION -->
						<!-- end: SECOND SECTION -->
						<!-- start: THIRD SECTION -->
						<!-- end: THIRD SECTION -->
						<!-- start: FOURTH SECTION -->
						<!-- end: FOURTH SECTION -->
					</div>
				</div>
			</div>
			<!-- start: FOOTER -->
			<div style="height: 100px"></div>
			
			<footer >
				<div class="footer-inner">
					<div  class="pull-left">
						<%@ include file="footer.jsp"%>
					</div>
					<div class="pull-right">
						<span class="go-top"><i class="ti-angle-up"></i></span>
					</div>
				</div>
			</footer>
			<!-- end: FOOTER -->
			<!-- start: OFF-SIDEBAR -->
			<!-- end: OFF-SIDEBAR -->
			<!-- start: SETTINGS -->
			<div class="settings panel panel-default hidden-xs hidden-sm" id="settings">
				<button ct-toggle="toggle" data-toggle-class="active" data-toggle-target="#settings" class="btn btn-default">
					<i class="fa fa-spin fa-gear"></i>
				</button>
				<div class="panel-heading">
					Style Selector
				</div>
				<div class="panel-body">
					<!-- start: FIXED HEADER -->
					<div class="setting-box clearfix">
						<span class="setting-title pull-left"> Fixed header</span>
						<span class="setting-switch pull-right">
							<input type="checkbox" class="js-switch" id="fixed-header" />
						</span>
					</div>
					<!-- end: FIXED HEADER -->
					<!-- start: FIXED SIDEBAR -->
					<div class="setting-box clearfix">
						<span class="setting-title pull-left">Fixed sidebar</span>
						<span class="setting-switch pull-right">
							<input type="checkbox" class="js-switch" id="fixed-sidebar" />
						</span>
					</div>
					<!-- end: FIXED SIDEBAR -->
					<!-- start: CLOSED SIDEBAR -->
					<!-- <div class="setting-box clearfix">
						<span class="setting-title pull-left">Closed sidebar</span>
						<span class="setting-switch pull-right">
							<input type="checkbox" class="js-switch" id="closed-sidebar" />
						</span>
					</div> -->
					<!-- end: CLOSED SIDEBAR -->
					<!-- start: FIXED FOOTER -->
					<div class="setting-box clearfix">
						<span  class="setting-title pull-left">Fixed footer</span>
						<span  class="setting-switch pull-right">
							<input type="checkbox" class="js-switch" id="fixed-footer" />
						</span>
					</div>
					<!-- end: FIXED FOOTER -->
					<!-- start: THEME SWITCHER -->
					<div class="colors-row setting-box">
						<div class="color-theme theme-1">
							<div class="color-layout">
								<label>
									<input type="radio" name="setting-theme" value="theme-1">
									<span class="ti-check"></span>
									<span class="split header"> <span class="color th-header"></span> <span class="color th-collapse"></span> </span>
									<span class="split"> <span class="color th-sidebar"><i class="element"></i></span> <span class="color th-body"></span> </span>
								</label>
							</div>
						</div>
						<div class="color-theme theme-2">
							<div class="color-layout">
								<label>
									<input type="radio" name="setting-theme" value="theme-2">
									<span class="ti-check"></span>
									<span class="split header"> <span class="color th-header"></span> <span class="color th-collapse"></span> </span>
									<span class="split"> <span class="color th-sidebar"><i class="element"></i></span> <span class="color th-body"></span> </span>
								</label>
							</div>
						</div>
					</div>
					<div class="colors-row setting-box">
						<div class="color-theme theme-3">
							<div class="color-layout">
								<label>
									<input type="radio" name="setting-theme" value="theme-3">
									<span class="ti-check"></span>
									<span class="split header"> <span class="color th-header"></span> <span class="color th-collapse"></span> </span>
									<span class="split"> <span class="color th-sidebar"><i class="element"></i></span> <span class="color th-body"></span> </span>
								</label>
							</div>
						</div>
						<div class="color-theme theme-4">
							<div class="color-layout">
								<label>
									<input type="radio" name="setting-theme" value="theme-4">
									<span class="ti-check"></span>
									<span class="split header"> <span class="color th-header"></span> <span class="color th-collapse"></span> </span>
									<span class="split"> <span class="color th-sidebar"><i class="element"></i></span> <span class="color th-body"></span> </span>
								</label>
							</div>
						</div>
					</div>
					<div class="colors-row setting-box">
						<div class="color-theme theme-5">
							<div class="color-layout">
								<label>
									<input type="radio" name="setting-theme" value="theme-5">
									<span class="ti-check"></span>
									<span class="split header"> <span class="color th-header"></span> <span class="color th-collapse"></span> </span>
									<span class="split"> <span class="color th-sidebar"><i class="element"></i></span> <span class="color th-body"></span> </span>
								</label>
							</div>
						</div>
						<div class="color-theme theme-6">
							<div class="color-layout">
								<label>
									<input type="radio" name="setting-theme" value="theme-6">
									<span class="ti-check"></span>
									<span class="split header"> <span class="color th-header"></span> <span class="color th-collapse"></span> </span>
									<span class="split"> <span class="color th-sidebar"><i class="element"></i></span> <span class="color th-body"></span> </span>
								</label>
							</div>
						</div>
					</div>
					<!-- end: THEME SWITCHER -->
				</div>
			</div>
			<!-- end: SETTINGS -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/Chart.js/Chart.min.js"></script>
		<script src="vendor/jquery.sparkline/jquery.sparkline.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/index.js"></script>
		
		<script src="js/sjzhuce/sjIndexUpdate.js" type="text/javascript"></script>
		<script src="js/sjzhuce/sj_index.js" type="text/javascript"></script>
		<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
		
		<script type="text/javascript" src="<%=basePath %>js/jquery-validate.min.js"></script>
		<script type="text/javascript">
			function first(){
				window.location.href='sj_searchProduct?page=${1}&&rows=${pageSize}';
			}
			function end(){
				window.location.href='sj_searchProduct?page=${count == 0 ? 1:count }&&rows=${pageSize }';
			}
			function er(){
				var page=${page+1 };
				var count=${count };
				if(page > count){
					return false;
				}else{
					window.location.href='sj_searchProduct?page=${page+1}&&rows=${pageSize }';
				}
			}
			function san(){
				var page=${page+2 };
				var count=${count };
				if(page > count){
					return false;
				}else{
					window.location.href='sj_searchProduct?page=${page+2}&&rows=${pageSize }';
				}
			}
			function si(){
				var page=${page };
				var count=${count };
				if(page > count){
					return false;
				}else{
					window.location.href='sj_searchProduct?page=${page+3}&&rows=${pageSize }';
				}
			}
			function previous(){
				var page=${page == 1};
				if(page){
					return false;
				}else{
					window.location.href='sj_searchProduct?page=${page-1}&&rows=${pageSize }';
				}
			}
			function next(){
				var page=${count <= page};
				if(page){
					return false;
				}else{
					window.location.href='sj_searchProduct?page=${page+1}&&rows=${pageSize }';
				}
			}
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
