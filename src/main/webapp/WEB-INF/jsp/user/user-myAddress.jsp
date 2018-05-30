<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
	.dizhidiv p{
		display: inline-block;
	}
	.morendizhi:hover{
		text-decoration: none;
	}
	.morendizhi1:hover{
		text-decoration: none;
	}
	
	 #dialog {  
          background-color: #fff;  
          border: 5px solid #87CEEB;  
          height: 500px;  
          left: 50%;  
          margin: -200px 0 0 -200px;  
          position: fixed !important; /* 浮动对话框 */  
          position: absolute;  
          top: 43%;  
          width: 500px;  
          z-index: 5;  
          border-radius: 5px;  
          display: none; 
      }  
      #dialog input{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;width: 300px;
      }
      #dialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;
      }
      #dialog p {  
          display: inline-block;font-weight: bold;color: black; 
       }
       
       #updialog {  
          background-color: #fff;  
          border: 5px solid #87CEEB;  
          height: 500px;  
          left: 50%;  
          margin: -200px 0 0 -200px;  
          position: fixed !important; /* 浮动对话框 */  
          position: absolute;  
          top: 43%;  
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
	  .button2 {
		/* General Properties */
		height:35px;
		width:120px;
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
		font-size:20px;
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
					<a  data-title="个人中心" style="font-weight: bold;" >
						用户信息
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd style="display: block;">
					<ul>
					<li>
							<a href="usersystem" style="margin-left: -25px" data-title="我的购物车">
								&emsp;&emsp;个人中心
							</a>
						</li>
						<li>
							<a href="myCart" style="margin-left: -25px" data-title="我的购物车">
								&emsp;&emsp;我的购物车
							</a>
						</li>
					<li>
							<a href="express" style="margin-left: -25px" data-title="主动元器件订单">
								&emsp;&emsp;主动元器件订单 
								 <c:if test="${not empty zdCountNoPay}">
								<font size="1px" color="red">未付款(${zdCountNoPay})</font>
								</c:if>
							</a>
						</li>
						<li>
							<a href="beidongExpress" style="margin-left: -25px" data-title="被动元器件订单">&emsp;&emsp;被动元器件订单 
							    <c:if test="${not empty bdCountNoPay}">
								<font size="1px" color="red">未付款(${bdCountNoPay})</font>
								</c:if>
							 
							 </a>
						</li>
						<li style="background: #D0DFEF;">
							<a href="MyAddress" style="margin-left: -25px" data-title="地址">
								<img style="position: absolute;margin-top: 8px;" src="<%=basePath%>logo/yuan.png?3214">&emsp;&emsp;我的地址
							</a>
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
							<a href="MyAddress" class="selected">地址管理</a>
							
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article" style="margin-top: 50px;">
			<div style="margin-left: 160px;margin-top: 10px;margin-bottom: 20px;">
				<a class="morendizhi1" href="inAdd?bid=${bid }&pid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}&eid=${eid}"
               	   style="color: white;position: relative;background: #EE4000;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
               	      新增加收货地址</a>
            </div>
			<c:forEach items="${uaddress }" var="items" varStatus="express">
				<div class="dizhidiv" style="border: 2px #E5E5E5 solid;width: 850px;margin-left: 160px;margin-bottom: 20px;background: #FFFFE0;">
					<p style="width: 300px;text-align: left;font-weight: bold;font-size: 15px;color: black;margin-left: 50px">
						${items.a_name } </p>&nbsp;&nbsp;&nbsp;
						<c:if test="${items.a_status == 1 }">
							<c:if test="${xuanzhe ne 'xuanzhe' }">
								<p style="width: 80px;">
									<span style="background: #EE4000;color: white;padding: 2px 5px 2px 5px;">默认地址</span>
								</p>
							</c:if>
							<c:if test="${xuanzhe eq 'xuanzhe' }">
								<a class="morendizhi1" href="orderAddress?bid=${bid }&aid=${items.a_id }&pid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}"
			                    	   style="color: white;position: relative;background: #EE4000;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
			                    	      选择</a>
							</c:if>
							
						</c:if>
						<c:if test="${items.a_status != 1 }">
							<c:if test="${sessionScope.panduan == null || sessionScope.panduan == '' }">
								<c:if test="${xuanzhe ne 'xuanzhe' }">
									<p style="width: 80px;">
										<a class="morendizhi" href="tacitly?a_id=${items.a_id }"
				                    	   style="color: white;position: relative;background: #FFA500;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
				                    	      设为默认</a>
									</p>
								</c:if>
							</c:if>
							<c:if test="${xuanzhe eq 'xuanzhe' }">
								<a class="morendizhi1" href="orderAddress?bid=${bid }&aid=${items.a_id }&pid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}"
			                    	   style="color: white;position: relative;background: #EE4000;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
			                    	      选择</a>
							</c:if>
						</c:if>
						<c:if test="${sessionScope.panduan == null || sessionScope.panduan == '' }">
							<c:if test="${xuanzhe ne 'xuanzhe' }">	
								<p style="width: 390px;text-align: right;">
									<a href="javascript:void(0)" onclick="shanchu('${items.a_id }')">
										<img src="<%=basePath%>logo/clearshaixuan.png">
									</a>
									
								</p>
							</c:if>
						</c:if>
					<br>
					<p style="width: 100px;text-align: right;">
						收货人 :
					</p>
					<p>
						${items.a_name }
					</p><br>
					<p style="width: 100px;text-align: right;">
						手&#8195;机 :
					</p>
					<p >
						${items.a_phone }
					</p><br>
					<p style="width: 100px;text-align: right;">
						电&#8195;话 :
					</p>
					<p >
						${items.a_gudingtel }
					</p><br>
					<p style="width: 100px;text-align: right;">
						公&#8195;司 :
					</p>
					<p >
						<c:if test="${items.a_company ==null }">未填写</c:if>
						<c:if test="${items.a_company !=null }">${items.a_company }</c:if>
					</p><br>
					<p style="width: 100px;text-align: right;">
						地&#8195;址 :
					</p>
					<p style="width: 650px;">
						${items.a_address }
					</p>
					<c:if test="${sessionScope.panduan == null || sessionScope.panduan == '' }">
						<c:if test="${xuanzhe ne 'xuanzhe' }">
							<p style="width: 80px;text-align: right;">
								<a class="morendizhi1" href="jumpUp?aid=${items.a_id }"
			                    	   style="color: white;position: relative;background: #EE4000;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
			                    	      编辑</a>
							</p>
						</c:if>
					</c:if>
				</div>
			</c:forEach>
			<c:if test="${not empty uaddress}">
				<div style="margin-left: 160px;">
					<a class="morendizhi1" href="inAdd?bid=${bid }&pid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}&eid=${eid}"
	               	   style="color: white;position: relative;background: #EE4000;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;">
	               	      新增加收货地址</a>
	            </div>
			</c:if>
			
            <div  style="text-align: center;margin-top: 100px;">
		        <p>
		            版权所有 &copy; 2017 自可知 保留所有权利 |
		            <a href="http://www.miibeian.gov.cn/">
		                <img src="img/img/icp.png" />
		                粤ICP备15008173号-2
		            </a>
		            |
		        </p>
			</div>
		</div>
	</section>
	<!-- 地址添加   -->
	<c:if test="${showadd == 'showadd' }">
		<div id="fullbg"></div>  
	    <div id="dialog">  
	    	<div style="height:40px; background:#87CEEB;text-align: center;line-height: 40px;">
	    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">自可知-地址添加</span>
	    		<a href="javascript:;" onclick="closeAdd()">
	   	           <img style="position: absolute;margin-left: 153px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
	   	       </a>
	    	</div>
	    	<form id="Form" style="padding-left: 50px;padding-top: 30px;">
		    	<p>
		    		姓&#8195;&#8195;名&#8195;&#8195;
		    	</p><input onblur="id1()" type="text" id="a_name" name="a_name" placeholder="收货人姓名">
		    	<p id="p1" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p >
		    		手&#8195;&#8195;机&#8195;&#8195;
		    	</p><input onblur="id2()" type="text" id="a_phone" name="a_phone" placeholder="手机号码">
				<p id="p2" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p>
		    		电&#8195;&#8195;话&#8195;&#8195;
		    	</p><input onblur="id5()" type="text" id="a_gudingtel" name="a_gudingtel" placeholder="固定电话（选填）">
				<p id="p3" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p>
		    		公司名称&#8195;&#8195;
		    	</p><input type="text" id="a_company" name="a_company" placeholder="公司名称(选填)">
				<p style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p>
		    		收货地址&#8195;&#8195;
		    	</p><div data-toggle="distpicker" class="adddemo" style="display: inline-block;">
		    			省份&#8195;<select style="width: 124px;" name="province" class="addprovince">
													 </select>
						城市&#8195;<select  name="city" class="addcity">
						    						 </select>
		    		</div>
				<p style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
					
					<p>
			    		详细地址&#8195;&#8195;
			    	</p><input onblur="id3()" type="text" name="xiangxi" id="xiangxi" placeholder="详细地址">
			    	<p id="p4" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
					<br>
			    	<button id="submitForm" type="button" class="button2" style="margin-left: 140px;">
						保存
					</button>
	    	</form>
		</div>
	</c:if>
	
	<!-- 地址修改  -->
	<c:if test="${showup == 'showup' }">
		<div id="upfullbg"></div>  
	    <div id="updialog">  
	    	<div style="height:40px; background:#87CEEB;text-align: center;line-height: 40px;">
	    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">自可知-地址添加</span>
	    		<a href="javascript:;" onclick="upcloseAdd()">
	   	           <img style="position: absolute;margin-left: 153px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
	   	       </a>
	    	</div>
	    	<form  style="padding-left: 50px;padding-top: 30px;">
		    	<p>
		    		姓&#8195;&#8195;名&#8195;&#8195;
		    	</p><input onblur="upid1()" type="text" id="upa_name" name="a_name" value="${upaddress.a_name }">
		    	<p id="upp1" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p >
		    		手&#8195;&#8195;机&#8195;&#8195;
		    	</p><input onblur="upid2()" type="text" id="upa_phone" name="a_phone" value="${upaddress.a_phone }">
				<p id="upp2" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p>
		    		电&#8195;&#8195;话&#8195;&#8195;
		    	</p><input onblur="upid5()" type="text" id="upa_gudingtel" name="a_gudingtel" value="${upaddress.a_gudingtel }">
				<p id="upp3" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p>
		    		公司名称&#8195;&#8195;
		    	</p><input type="text" id="upa_company" name="a_company" value="${upaddress.a_company }">
				<p style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	
		    	<p>
		    		收货地址&#8195;&#8195;
		    	</p><div data-toggle="distpicker"  class="updemo" style="display: inline-block;">
		    			省份&#8195;<select style="width: 124px;" name="province" class="upprovince">
													 </select>
						城市&#8195;<select   name="city" class="upcity" >
						    						 </select>
		    		</div>
				<p style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
					
					<p>
			    		详细地址&#8195;&#8195;
			    	</p><input onblur="upid3()" type="text" name="xiangxi" id="upxiangxi" value="${xiangxi }">
			    	<p id="upp4" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
					<br>
			    	<button id="upsubmitForm" type="button" class="button2" style="margin-left: 140px;">
						保存
					</button>
	    	</form>
		</div>
	</c:if>
	<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
		<%@include file="../../../../include/footer.jsp"%>
	</div>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="js/userinfo.js"></script>
	<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="js/demo/distpicker.data.js"></script>
	<script src="js/demo/distpicker.js"></script>
	<script src="js/demo/main.js"></script>
</body>
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
		function shanchu(a_id){
			layer.confirm('您确定要删除地址吗', {
				  btn: ['确定','取消'] //按钮
				}, function(){
				  layer.msg('地址已删除', {icon: 1});
				  window.location.href="deleteUaddress?a_id="+a_id;
				}, function(){
				});
		}
	
		var eid='${eid}';
		var pid='${pid}';
		var bid='${bid}';
		 var showadd = '${showadd}';
		 var showup = '${showup}';
		 if(showadd == "showadd"){
			 $(".adddemo").attr("id","demo");
			 $(".addprovince").attr("id","province");
			 $(".addcity").attr("id","city");
			 $("#fullbg").css({  
	            display: "block"  
	         });  
	         $("#dialog").show();
		 }
		 if(showup == "showup"){
			 $(".updemo").attr("id","distpicker3");
			 $(".upprovince").attr("id","province");
			 $(".upcity").attr("id","city");
			 $("#distpicker3").distpicker({
					province: '${province}',
					  city: '${city}'
			  });
			 $("#upfullbg").css({  
	            display: "block"  
	         });  
	         $("#updialog").show();
		 }
		 
		 $(".morendizhi").hover(function(){
			 $(this).css("background","red");
		 },function(){
			 $(this).css("background","#FFA500");
		 });
		 
		 $(".morendizhi1").hover(function(){
			 $(this).css("background","red");
		 },function(){
			 $(this).css("background","#EE4000");
		 });
		 
         //关闭灰色 jQuery 遮罩   
         function closeAdd() {  
       	 	if(pid!=null && pid!= ""){
				window.location.href="chooseAddress?pid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}";
			}else if(eid!=null && eid!= ""){
				window.location.href="chooseAddress?eid=${eid }";
			}else if(bid!=null && bid!=""){
				window.location.href="chooseAddress?bid=${bid }&expressname=${expressname}&fapiao=${fapiao}";
			}else{
				window.location.href="MyAddress";
			}
         }
         
         //关闭灰色 jQuery 遮罩   
         function upcloseAdd() {  
        	 window.location.href="MyAddress";
         }
	</script>
	<script type="text/javascript">
		var panduan = '${sessionScope.panduan}';
		function id1() {
		    var id = document.getElementById("a_name").value;
		    if (id == "") {
		        document.getElementById("p1").innerHTML = "*姓名不能为空";
		    }else{
	        	document.getElementById("p1").innerHTML = "";
	        }
		}
		function id2() {
		    var id = document.getElementById("a_phone").value;
		    var idg = document.getElementById("a_gudingtel").value;
		    var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    if(id != ""){
		    	if(!(str.test(id))){
		    		document.getElementById("p2").innerHTML = "*请输入正确的手机号码";
		    	}else{
		    		document.getElementById("p2").innerHTML = "";
		    	}
		    }else{
		    	document.getElementById("p2").innerHTML = "";
		    }
		}
		function id5() {
			var id = document.getElementById("a_phone").value;
			var idg = document.getElementById("a_gudingtel").value;
		    var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    
		    if(idg != ''){
		    	if(!(str.test(idg))){
			    	document.getElementById("p3").innerHTML = "*请输入正确的固定电话";
		    	}else{
			    	document.getElementById("p3").innerHTML = "";
		    	}
		    }else{
		    	document.getElementById("p3").innerHTML = "";
		    }
		}
		function id3() {
		    var id = document.getElementById("xiangxi").value;
		    if (id == "") {
		        //alert("ID不能为空");
		        document.getElementById("p4").innerHTML = "*请填写详细地址";
		    }else{
	        	document.getElementById("p4").innerHTML = "";
	        }
		}
		function quxiao(){
			window.location.href="MyAddress";
		}
		$("#submitForm").click(function(){
			var name=document.getElementById("a_name").value;
			var phone=document.getElementById("a_phone").value;
			var phoneg=document.getElementById("a_gudingtel").value;
			var xiangxi=document.getElementById("xiangxi").value;
			var a_company=document.getElementById("a_company").value;
			var p1 = document.getElementById("p1").innerHTML;
			var p2 = document.getElementById("p2").innerHTML;
			var p3 = document.getElementById("p3").innerHTML;
			var p4 = document.getElementById("p4").innerHTML;
			var city=$("#city").val();
			var province=$("#province").val();
			if(name==""){
				layer.alert("请填写收货人姓名", {icon : 5})
			}else if(phone=="" && phoneg == ""){
				layer.alert("至少填写一个联系方式", {icon : 5})
			}else if(xiangxi == ""){
				layer.alert("请填写详细地址", {icon : 5})
			}else if(p1 == "" && p2 == "" && p3 == "" && p4 == "" ){
				$.ajaxSetup({
					contentType: "application/x-www-form-urlencoded; charset=utf-8"
				});
				$.post("inAddress?a_name="+encodeURI(encodeURI(name))+"&a_phone="+encodeURIComponent(phone)+"&a_gudingtel="+encodeURI(phoneg)+"&xiangxi="+encodeURI(encodeURI(xiangxi))+"&province="+encodeURI(encodeURI(province))+"&city="+encodeURI(encodeURI(city))+"&a_company="+encodeURI(a_company),
		            function(data){
						if(data.result=="fail"){
							swal({
								title: "系统提示",
								text: data.errorMsg,
								type: "success",
								confirmButtonColor: "#007AFF"
							});
						}else if(data.result=="seccuss"){
							var aidback = data.aid;
							$(".adddemo").removeAttr("id");
							$(".addprovince").removeAttr("id");
							$(".addcity").removeAttr("id");
							if(panduan != null && panduan != ""){
								window.location.href="pay?productuid=${pid}&&bid=${bid}&&eid=${eid}&&expressname=${expressname}&&fapiao=${fapiao}&&number=${number}&&beizhu=${beizhu}&&aid="+aidback;
							}else{
								if(pid!=null && pid!= ""){
									window.location.href="chooseAddress?productuid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}";
								}else if(eid!=null && eid!= ""){
									window.location.href="chooseAddress?eid=${eid }";
								}else if(bid!=null && bid!=""){
									window.location.href="chooseAddress?bid=${bid }&expressname=${expressname}&fapiao=${fapiao}";
								}else{
									window.location.href="MyAddress";
								}
							}
						}
					}
			   	)
			}else if( p1 != "" || p2 != "" || p3 != "" || p4 != "" ){
				layer.alert("请核查地址信息", {icon : 5})
			}
			
		})
</script>
<script type="text/javascript">
	function upid1() {
	    var id = document.getElementById("upa_name").value;
	    if (id == "") {
	        document.getElementById("upp1").innerHTML = "*姓名不能为空";
	    }else{
        	document.getElementById("upp1").innerHTML = "";
        }
	}
	function upid2() {
	    var id = document.getElementById("upa_phone").value;
	    var idg = document.getElementById("upa_gudingtel").value;
	    var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
	    if(id != ""){
	    	if(!(str.test(id))){
	    		document.getElementById("upp2").innerHTML = "*请输入正确的手机号码";
	    	}else{
	    		document.getElementById("upp2").innerHTML = "";
	    	}
	    }else{
	    	document.getElementById("upp2").innerHTML = "";
	    }
	}
	function upid5() {
		var id = document.getElementById("upa_phone").value;
		var idg = document.getElementById("upa_gudingtel").value;
	    var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
	    
	    if(idg != ''){
	    	if(!(str.test(idg))){
		    	document.getElementById("upp3").innerHTML = "*请输入正确的固定电话";
	    	}else{
		    	document.getElementById("upp3").innerHTML = "";
	    	}
	    }else{
	    	document.getElementById("upp3").innerHTML = "";
	    }
	}
	function upid3() {
	    var id = document.getElementById("upxiangxi").value;
	    if (id == "") {
	        //alert("ID不能为空");
	        document.getElementById("upp4").innerHTML = "*请填写详细地址";
	    }else{
        	document.getElementById("upp4").innerHTML = "";
        }
	}
	function quxiao(){
		window.location.href="MyAddress";
	}
	$("#upsubmitForm").click(function(){
		var aid = '${upaddress.a_id }';
		var name=document.getElementById("upa_name").value;
		var phone=document.getElementById("upa_phone").value;
		var phoneg=document.getElementById("upa_gudingtel").value;
		var xiangxi=document.getElementById("upxiangxi").value;
		var a_company=document.getElementById("upa_company").value;
		var p1 = document.getElementById("upp1").innerHTML;
		var p2 = document.getElementById("upp2").innerHTML;
		var p3 = document.getElementById("upp3").innerHTML;
		var p4 = document.getElementById("upp4").innerHTML;
		var city=$("#city").val();
		var province=$("#province").val();
		if(name==""){
			layer.alert("请填写收货人姓名", {icon : 5})
		}else if(phone=="" && phoneg == ""){
			layer.alert("至少填写一个联系方式", {icon : 5})
		}else if(xiangxi == ""){
			layer.alert("请填写详细地址", {icon : 5})
		}else if(p1 == "" && p2 == "" && p3 == "" && p4 == "" ){
			$.ajaxSetup({
				contentType: "application/x-www-form-urlencoded; charset=utf-8"
			});
			$.post("upAddress?a_name="+encodeURI(encodeURI(name))+"&a_phone="+encodeURIComponent(phone)+"&a_gudingtel="+encodeURI(phoneg)+"&xiangxi="+encodeURI(encodeURI(xiangxi))+"&province="+encodeURI(encodeURI(province))+"&city="+encodeURI(encodeURI(city))+"&a_company="+encodeURI(a_company)+"&a_id="+aid,
	            function(data){
					if(data.result=="fail"){
						swal({
							title: "系统提示",
							text: data.errorMsg,
							type: "success",
							confirmButtonColor: "#007AFF"
						});
					}else if(data.result=="success"){
						$(".updemo").removeAttr("id");
						$(".upprovince").removeAttr("id");
						$(".upcity").removeAttr("id");
						window.location.href="MyAddress";
					}
				}
		   	)
		}else if( p1 != "" || p2 != "" || p3 != "" || p4 != "" ){
			layer.alert("请核查地址信息", {icon : 5})
		}
	})
</script>
</html>