<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--<link rel="Bookmark" href="/favicon.ico">
		<link rel="Icon" href="/favicon.ico" />
		<link rel="Shortcut Icon" href="/favicon.ico" />-->
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="vendor/jquery-file-upload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="assets/css/plugins.css">
<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
<!--[if IE 6]>
		<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<style type="text/css">
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
	.sliderUnlockBtn{
		width: 62px;height: 27px;background: #593f4f;border: none;color: white;
	
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
	input:hover {
	    box-shadow: #ccc 1px 1px 8px;
	}
	body, button, input, select, textarea {
	    font-size: 12px;
	    font-family: "Microsoft Yahei","宋体";
	    color: #000000;
	    margin-right: 4px;
	    border: 1px solid #DED8B9;
	    height: 27px;
	}
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
	 #dialog {  
		box-shadow: #666 1px 1px 15px;
		background-color: #fff;  
        border: 1px solid #BCBFFD;  
        height: 550px;  
        left: 35%;  
        margin: -200px 0 0 -200px;  
        position: fixed !important; /* 浮动对话框 */  
        position: absolute;  
        top: 40%;  
        width: 850px;  
        z-index: 5;  
        border-radius: 5px;  
        display: none; 
      }  
      #dialog input{
      	height: 27px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;;
      }
      #dialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
      }
      #dialog p {  
          display: inline-block;font-weight: bold;color: black; 
       }
       
      #updialog {  
		box-shadow: #666 1px 1px 15px;
		background-color: #fff;  
        border: 1px solid #BCBFFD;  
        height: 400px;  
        left: 50%;  
        margin: -200px 0 0 -200px;  
        position: fixed !important; /* 浮动对话框 */  
        position: absolute;  
        top: 53%;  
        width: 500px;  
        z-index: 5;  
        border-radius: 5px;  
        display: none; 
      }  
      #updialog input{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;width: 300px;
      }
      #updialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;
      }
      #updialog p {  
          display: inline-block;font-weight: bold;color: black; 
       }
</style>
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #222222;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;">
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
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">	
									</c:if>
									<c:if test="${sessionScope.star==2 }">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>50}">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${sessionScope.userName}<i class="Hui-iconfont">&#xe6d5;</i>
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
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >
						个人中心
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="myCart" data-title="我的购物车">
								&emsp;&emsp;我的购物车
							</a>
						</li>
						<li>
							<a href="express" data-title="我的订单">
								&emsp;&emsp;我的订单
							</a>
						</li>
						<li>
							<a href="MyAddress" data-title="地址">&emsp;&emsp;我的地址</a>
						</li>
						<li>
							<a href="cashback" data-title="订单返现">&emsp;&emsp;订单返现</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="产品上传" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dt style="border: none;">
					<ul>
						<li style="background: #D0DFEF;">
							<a href="supplierIn" data-title="公司信息" style="font-weight: normal;" >
								&emsp;&emsp;公司资料
							</a>
						</li>
						<li>
							<a href="userSupplierProduct" style="font-weight: normal;" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="putong" data-title="公司信息" style="font-weight: normal;"><img style="position: absolute;margin-top: 13px;" src="<%=basePath%>logo/yuan.png">&emsp;&emsp;普通库存</a></li>
					</ul>
				</dt>
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
						<nav class="zznav" style="margin-top: 9px;margin-left: 13px;">
							<a href="index">首页</a>
							<a href="putong" class="selected">普通库存</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div id="g-bd" class="g-bd">
					<div id="g-con">
						<div class="g-mh20" id="tabDiv110203" style="display: block;">
							<div class="g-cf g-bd-box g-plr-10 g-o-h" style="background-color: #BDD7DB;">
								<div class="g-f-l g-bdbox" style="color: #3A006F;">
									<b>注意：普通库存只能上传3000个</b>
								</div>
								<div class="g-f-r g-ta-r g-bdbox">
									<a href="javascript:;" style="background-color: #3A006F;color: white;border-radius: 5px;" title="" class="g-btn g-mr-5" id="" onclick="ShowNewStock();"><em id="" title=""
										class="" style="color: white;">添加库存</em><b></b></a><a style="background-color: #3A006F;color: white;border-radius: 5px;"
										id="" rec="" recid="1887" class="g-btn g-mr-5" title=""
										href="uploadExecl" data-toggle="modal" data-target=".bs-example-modal-sm"><em
										class="" title="" id="" style="color: white;">导入库存</em><b></b></a>
								</div>
							</div>
							<table class="g-grid" style="background: #DAFFCB;">
								<thead>
									<tr style="text-align: center;font-weight: bold;font-size: 14px;">
										<th style="text-align: center;" width="20px"><input
											id="g_tmsSelAll2" type="checkbox"></th>
										<th width="" style="text-align: center;">型号</th>
										<th width="" style="text-align: center;">品牌</th>
										<th width="" style="text-align: center;">批号</th>
										<th width="" style="text-align: center;">封装</th>
										<th width="70" style="text-align: center;">数量</th>
										<th width="" style="text-align: center;">说明</th>
										<th width="75" align="center">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${productList }" var="product">
									<tr class="" onmouseout="this.classname='';"
										onmouseover="this.classname='s-msover';">
										<td align="center"><input value="{#0#}^{#1#}^{#16#}"
											name="checkKey2" type="checkbox"></td>
										<td>${product.product }</td>
										<td>${product.manufacturer }</td>
										<td>${product.lotnumber }</td>
										<td>${product.encapsulation }</td>
										<td>${product.isgoodsinstock }</td>
										<td>${product.description }</td>
										<td>
											<a href="javascript:"
											onclick="EditStock('${product.productuuid }','${product.product }','${product.manufacturer }','${product.lotnumber }','${product.isgoodsinstock }','${product.description }','${product.encapsulation }');">修改</a>
											<a href="deleteputongproduct?pid=${product.productuuid }" class="exchange"
									style="padding-right: 0px;width: 20px;color: red;" onClick="return confirm('确定删除?');">删除</a>	
										</td>
									</tr>
								</c:forEach>
									
								</tbody>
							</table>
							<div class="g-cf g-pagerwp g-bd-box g-plr-10 g-o-h">
								<div class="g-pager g-f-r" style="visibility: visible;">
									<span>总记录数：${total }</span>  <span>页数：${page}/${count }</span>
									<c:if test="${page==1}">
										<a class="no">首页</a><a class="no">上一页</a>
									</c:if>
									<c:if test="${page!=1}">
										<a href="putong">首页</a><a href="putong?page=${page-1 }&rows=30">上一页</a>
									</c:if>
									<c:if test="${page==count || count==0}">
										<a class="no">下一页</a><a class="no">尾页</a>
									</c:if>
									<c:if test="${page!=count && count!=0}">
										<a href="putong?page=${page+1 }&rows=30">下一页</a><a href="putong?page=${count }&rows=30">尾页</a>
									</c:if>
								</div>
							</div>
						</div>
						<div id="fullbg"></div>  
					    <div id="dialog">  
					    	<div style="height:40px; background:#05ab58;text-align: center;line-height: 40px;">
					    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">自可知-普通库存添加</span>
					    		<a href="javascript:;" onclick="closeAdd()">
					   	           <img style="position: absolute;margin-left: 138px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
					   	       </a>
					    	</div>
					    	<p style="color: red;margin-left: 20px;margin-top: 10px;">
					    		温馨提示：为了您的交易顺利进行，并提高您的信誉度，请尽量详细的填写库存资料，并避免重复填写。
									每次最多保存10条， *项必填，数量栏只能填写数字。如添加数量较多，请使用Execl<a href="uploadExecl">批量导入库存</a>功能。 
					    	</p>
					    	<form action="addputongduotian" method="post" style="float: left;padding-left: 30px;padding-top: 0px;">
						    	<div style="float: left;width: 170px;">&nbsp;&nbsp;<b style="color: red">*</b>型号</div>
						    	<div style="float: left;width: 140px;">&nbsp;<b style="color: red">*</b>品牌</div>
						    	<div style="float: left;width: 110px;">&nbsp;&nbsp;<b style="color: red">*</b>批号</div>
						    	<div style="float: left;width: 110px;">&nbsp;&nbsp;<b style="color: red">*</b>封装</div>
						    	<div style="float: left;width: 110px;">&nbsp;&nbsp;<b style="color: red">*</b>数量</div>
						    	<div style="float: left;width: 170px;">&nbsp;&nbsp;说明</div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<div style="float: left;width: 160px;margin-top: 7px;"><input type="text" name="product"> </div>
						    	<div style="float: left;width: 150px;margin-top: 7px;"><input type="text" name="manufacturer"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="lotnumber" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="text" name="encapsulation" style="width: 90px;"> </div>
						    	<div style="float: left;width: 110px;margin-top: 7px;"><input type="number" name="isgoodsinstock" style="width: 90px;"> </div>
						    	<div style="float: left;width: 180px;margin-top: 7px;"><input type="text" maxlength="20" name="description"> </div>
						    	<br>
						    	<button type="submit" class="g-btn g-mr-5 tian" style="color:white;border: none;height: 30px;width: 80px;padding: 0px;cursor: pointer;padding-top: 1px\0;float: right; margin-right: 205px;margin-top: 25px;background: rgba(232, 34, 60, 0.78)">
									保存添加
								</button>
					    	</form>
						</div>
						
						<div id="upfullbg"></div>  
					    <div id="updialog">  
					    	<div style="height:40px; background:#BCBFFD;text-align: center;line-height: 40px;">
					    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">自可知-普通库存修改</span>
					    		<a href="javascript:;" onclick="closeAdd()">
					   	           <img style="position: absolute;margin-left: 138px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
					   	       </a>
					    	</div>
					    	<form action="upproductputong" method="post" style="padding-left: 50px;padding-top: 30px;">
						    	<p>
						    		<input type="hidden" name="productuuid" id="productuuid">
						    		型&#8195;&#8195;号&#8195;&#8195;
						    	</p><input onblur="id1()" type="text" id="upa_name" name="product" placeholder="型号" required="required" style="text-transform: uppercase">
						    	<p id="p1" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
						    	
						    	<p >
						    		品&#8195;&#8195;牌&#8195;&#8195;
						    	</p><input onblur="id2()" type="text" id="upa_phone" name="manufacturer" placeholder="品牌" required="required">
								<p id="p2" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
						    	
						    	<p>
						    		批&#8195;&#8195;号&#8195;&#8195;
						    	</p><input onblur="id5()" type="text" id="upa_gudingtel" name="lotnumber" placeholder="批号" required="required">
								<p id="p3" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>

						    	<p>
						    		封&#8195;&#8195;装&#8195;&#8195;
						    	</p><input type="text" id="upencapsulation" name="encapsulation" placeholder="封装" required="required">
								<p style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
						    	
						    	<p>
						    		数&#8195;&#8195;量&#8195;&#8195;
						    	</p><input type="text" id="upisgoodsinstock" name="isgoodsinstock" placeholder="数量" required="required">
								<p style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
						    	<p>
									<p>
							    		说明&#8195;&#8195;
							    	</p><input type="text" name="description" id="upxiangxi" maxlength="20" placeholder="说明"required="required">
							    	<p id="p4" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
									<br>
							    	<button type="submit" class="g-btn g-mr-5" style="border: none;height: 28px;width: 49px;padding: 0px;cursor: pointer;padding-top: 1px\0;float: right; margin-right: 205px;margin-top: -15px;background: #BCBFFD">
										保存
									</button>
					    	</form>
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
	<script type="text/javascript">
		/* $("form").button(function(){
		  alert($("input[name=product]").val())
		 alert($("input[name=description]").val())
		}) */
		$('.tian').hover(function(){
			$(this).css('background','red');			
		},function(){
			$(this).css('color','white');
			$(this).css('background','rgba(232, 34, 60, 0.78)');
		});
		
		//Execl上传
		function submitForm() {
			$("#fileSC").ajaxSubmit({
	            type: 'post',
	            url: 'excel/toLead.do', 
	            success: function(data) {
	            	if(data.result=="2"){
						data.preventDefault
					}else if(data.result=="1"){
						swal({
							title: "导入成功!",
							type: "success",
							confirmButtonColor: "#007AFF"
						},function() {
							window.location.href='ExcelTest.jsp';
						});
						data.preventDefault
					}
	            }
	        });
		}
		function ShowNewStock(){
			$(".adddemo").attr("id","demo");
			$(".addprovince").attr("id","province");
			$(".addcity").attr("id","city");
			$("#fullbg").css({  
	        	display: "block"  
	        });  
	        $("#dialog").show();
		}
		//修改回显
		function EditStock(pid,pname,manufacturer,lotnumber,isgoodsinstock,description,encapsulation){
			$("#productuuid").val(pid);
			$("#upa_name").val(pname);
			$("#upa_phone").val(manufacturer);
			$("#upa_gudingtel").val(lotnumber);
			$("#upisgoodsinstock").val(isgoodsinstock);
			$("#upxiangxi").val(description);
			$("#upencapsulation").val(encapsulation);
			$("#upfullbg").css({  
	            display: "block"  
	         });  
	         $("#updialog").show();
		}
		
		function closeAdd(){
			window.location.href="putong"
		}
		$("#submitForm").click(function(){
			var name=document.getElementById("a_name").value;
			var phone=document.getElementById("a_phone").value;
			var phoneg=document.getElementById("a_gudingtel").value;
			var xiangxi=document.getElementById("xiangxi").value;
			var isgoodsinstock=document.getElementById("isgoodsinstock").value;
			var encapsulation=document.getElementById("encapsulation").value;
			if(name=="" && phone=="" && phoneg == ""){
				layer.alert("请填写完整型号信息", {icon : 5})
			}else if(xiangxi==null && xiangxi == "" && isgoodsinstock == null && isgoodsinstock==""  && encapsulation=="" && encapsulation == null){
				layer.alert("请填写完整型号信息", {icon : 5})
				return false;
			}else{
				$.ajax({
		             type:"post",
		             url:"inproductputong",
		             async:true,
		             dataType: "json",
		             data: $('#Form').serialize(),
		            success : function(data){
		            	if(data.result=="login"){
		            		window.location.href="frontLogin"
		            	}else if(data.result=="success"){
		            		document.getElementById("a_name").value="";
		        			document.getElementById("a_phone").value="";
		        			document.getElementById("a_gudingtel").value="";
		        			document.getElementById("xiangxi").value="";
		        			document.getElementById("isgoodsinstock").value="";
		        			document.getElementById("encapsulation").value="";
		        			window.location.href="putong";
		            	}
		             }
		         });
				
			}
			
		})
		$("#impro").on("input propertychange", function() {  
		    var $this = $(this),  
		        _val = $this.val(),  
		        count = "";  
		    if (_val.length > 2000) {  
		        $this.val(_val.substring(0, 2000));  
		    }  
		    count = 2000 - $this.val().length;  
		    $("#impro_num").text(count);  
		});
		$("#suppliername").on("input propertychange", function() { 
		    var $this = $(this);
		    var expressnumber = $this.val();
		    $(function () {  
			    var objectout = $("#suppliername");  
			    objectout.mouseout(function () {
			    	$.ajax({
			             type:"post",
			             url:"paduansupplier",
			             async:true,
			             dataType: "json",
			             data: {
			            	 suppliername:expressnumber
			            },
			            success : function(data){
			            	if(data.result=="fail"){
			            		for(var o in data.s){
			            			if(data.s[o].suppliername!=suppliername){
				            			layer.alert("该公司名已被添加!");
				            		}
									$("#suppliername").val(data.s[o].suppliername);
			            		}
			            	}else if(data.result=="login"){
			            		layer.alert("请重新登录");
			            	}else{
			            		
			            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
			            	}
			             }
			         });
			    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
			    });
			});
		});
		 $(function () {
		    var objectout = $("#telphone1");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone1").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
		    		if(!(str.test(expressnumber))){
				    	layer.alert("请输入正确的固定电话");
				    	$("#telphone1").val("");
			    	}else if(expressnumber!='${supplier.telphone1}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone1:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone1!=expressnumber){
				            				layer.alert("该号码已被添加!");
					            		}
										$("#telphone1").val(data.s[o].telphone1);
				            		}
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#telphone2");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone2").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	layer.alert("请输入正确的固定电话");
				    	$("#telphone2").val("");
			    	}else{
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone2:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone2!=expressnumber){
				            				layer.alert("该号码已被添加!");
					            		}
										$("#telphone2").val(data.s[o].telphone2);
				            		}
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
				            	}else{
				            		
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#telphone3");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone3").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
			    		layer.alert("请输入正确的固定电话");
				    	$("#telphone3").val("");
			    	}else{
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone3:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="login"){
				            		layer.alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone3!=expressnumber){
				            				layer.alert("该号码已被添加!");
					            		}
										$("#telphone3").val(data.s[o].telphone3);
				            		}
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#cellphone");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#cellphone").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null && expressnumber!=''){
			    	if(!(str.test(expressnumber))){
			    		layer.alert("请输入正确的手机号码");
				    	$("#cellphone").val("");
			    	}else if(expressnumber!='${supplier.cellphone}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 cellphone:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="login"){
				            		layer.alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].cellphone!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#suppliername").val(data.s[o].cellphone);
				            		}
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#supplierposition");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#supplierposition").val();
		    	if(expressnumber!=null&& expressnumber!=''){
		    		var str=/([^\x00-\xff]|[A-Za-z0-9_])+/;
		    		if(!(str.test(expressnumber))){
		    			layer.alert("请输入正确的地址");
				    	$("#supplierposition").val('${supplier.supplierposition}');
			    	}else if(expressnumber!='${supplier.supplierposition}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 supplierposition:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		layer.alert("该地址已被添加!");
									$("#supplierposition").val("");
				            	}else if(data.result=="login"){
				            		layer.alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#repoposition");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#repoposition").val();
		    	if(expressnumber!=null&& expressnumber!=''){
		    		var str=/([^\x00-\xff]|[A-Za-z0-9_])+/;
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的地址");
				    	$("#repoposition").val('${supplier.repoposition}');
			    	}else if(expressnumber!='${supplier.repoposition}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 repoposition:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
			            			alert("该地址已被添加!");
									$("#repoposition").val("");
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		});
	</script>
	<script>
		jQuery(document).ready(function() {
			Main.init();
			UINotifications.init();
		});
	</script>
</body>

</html>