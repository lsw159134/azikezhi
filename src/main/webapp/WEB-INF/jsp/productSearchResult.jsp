<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/defined.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   
response.setHeader("Cache-Control","no-store");//HTTP 1.1   
response.setHeader("Pragma","no-cache");//HTTP 1.0   
response.setDateHeader("Expires",-10);//prevents caching at the proxy server   
%>

<!DOCTYPE html>
<html >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<head>
		<title>自可知-电子元器件查询网</title>
		<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
		<link rel="stylesheet" type="text/css" href="css/css/HeaderSearch.css" />
		<link rel="stylesheet" type="text/css" href="css/css/productSearchResult.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/shangpinfenlei.css">
		<script src="<%=basePath %>js/tooltip.js?5665856"></script>
   		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/tooltip.css?12245" />
   		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/faguang.css" />
		<script src="<%=basePath%>js/jquerybasic.js"></script>
		<script src="js/paging.js" type="text/javascript"></script>
		<script>
			var _hmt = _hmt || [];
			(function() {
		  		var hm = document.createElement("script");
		  		hm.src = "https://hm.baidu.com/hm.js?afc08fe83fbfc520487e2d11da429cc7";
		  		var s = document.getElementsByTagName("script")[0]; 
		  		s.parentNode.insertBefore(hm, s);
			})();
		</script>
		<style type="text/css">
			input,a,address,b,big,blockquote,body,center,cite,code,dd,del,div,dl,dt,em,fieldset,font,form,h1,h2,h3,h4,h5,h6,html,i,iframe,img,ins,label,legend,li,ol,p,pre,small,span,strong,u,ul,var
			{
				font-family : 微软雅黑,宋体;
			}
			#updialog {  
				box-shadow: #666 1px 1px 15px;
				background-color: #fff;  
		        border: 1px solid #1057A7;  
		        height: 380px;  
		        left: 50%;  
		        margin: -200px 0 0 -200px;  
		        position: fixed !important; /* 浮动对话框 */  
		        position: absolute;  
		        top: 53%;  
		        width: 460px;  
		        z-index: 5;  
		        border-radius: 5px;  
		        display: none; 
			}  
			#updialog input{
				height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
			}
			#updialog select{
				height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
			}
			#updialog p {  
			    display: inline-block;font-weight: bold;color: black; 
			}
			#cgdialog {  
				box-shadow: #666 1px 1px 15px;
				background-color: #fff;  
		        border: 1px solid #1057A7;  
		        height: 380px;  
		        left: 50%;  
		        margin: -200px 0 0 -200px;  
		        position: fixed !important; /* 浮动对话框 */  
		        position: absolute;  
		        top: 53%;  
		        width: 460px;  
		        z-index: 5;  
		        border-radius: 5px;  
		        display: none; 
			}  
			#cgdialog input{
				height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
			}
			#cgdialog select{
				height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
			}
			#cgdialog p {  
			    display: inline-block;font-weight: bold;color: black; 
			}
			#mcTooltipWrapper{
				display: none;
			}
			*{
				font-family:"微软雅黑";
				margin: 0 auto;
			}
			a{
				text-decoration:none
			}
			.topimg{
				width: 18px;
				height: 18px; 
				margin: 0px 0px -3px 0px
			}
			.home a font:hover {
	            color: #f40;
            }
		</style>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	    <meta name="format-detection" content="telephone=no" />  
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
	    <meta name="format-detection" content="telephone=no" />
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		<!-- <script type="text/javascript" src="js/inputprompt.js"></script> -->
		<!--[if IE 7]> <link href="css/ie7fix.css" rel="stylesheet" type="text/css" /> <![endif]-->
		<link type="text/css" href="css/search_result.css?20171201" rel="stylesheet">
		<link type="text/css" href="css/search_ad.css" rel="stylesheet">
		<title>自可知-电子元器件采购网</title>
		<style type="text/css">
			html,*{
				font-family: 微软雅黑 ;
				margin: 0 auto;
			}
		</style>
		<script type="text/javascript">
			$.fn.smartFloat = function() {
				var position = function(element) {
					var top = element.position().top, pos = element.css("position");
					$(window).scroll(function() {
						var scrolls = $(this).scrollTop();
						if (scrolls > top) {
							$("#guding").css({"box-shadow":"#999999 0px 0px 15px"});
							$("#guding").css({"background":"#F4F4F4"});
							if (window.XMLHttpRequest) {
								element.css({
				      				position: "fixed",
				      				top: 0,
				     			}); 
				    		} else {
				     			element.css({
				      				top: scrolls
				     			}); 
				    		}
				   		}else {
				   			$("#guding").css({"background":"none"});
				   			$("#guding").css({"box-shadow":"#999 0px 0px 0px"});
				    		element.css({
				     			position: pos,
				     			top: top
				    		}); 
				   		}
					});
				};
				return $(this).each(function() {
					position($(this));      
				});
			};
		</script>
	</head>
	<body style="clear: both;width: 100%;margin: 0 auto;">
		<div style="width: 100%;height: 30px;background-color: #E5E5E5;">
			<div style="width: 1200px;height: 30px;background-color: #E5E5E5;">
				<div style="float: left;text-align: left; width: 50%;padding-top: 5px;padding-left: 2px;">
					<span style="font-size: 10px">客服热线:0755-82720040</span>
					<b>|</b>
					<span style="font-size: 10px">交易时间：9:00-18:00</span>
					<b>|</b> 
					<span style="font-size: 10px">在线客服</span>
					<a href="javascript:void(0)"
						onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
						<img class="topimg" src="<%=contextPath%>/logo/indexQQ1.png"/>
					</a>
					<b>|</b> 
					<span style="font-size: 10px">采购交流群：337260650</span>
				</div>
				<c:if test="${sessionScope.userName == null}">
					<div style="text-align:right;width:48%;padding-top: 5px;float: right;">
						<span id="login"> 
							<img class="topimg" src="<%=basePath%>img/login.png" alt=""/>
							<a style="color: black" href="javascript:void(0)" class="goLogin">登录</a>
						</span>
						<span id="register" style="margin-left: 20px;"> <img class="topimg" src="<%=basePath%>img/register.png"/>
							<a style="color: black" href="register">注册</a>
						</span> 
					</div>
				</c:if>
				<c:if test="${sessionScope.userName != null}">
					<div style="text-align:right;width:48%;padding-top: 5px;float: right;">
						<span id="userName"> <img class="topimg" src="<%=contextPath%>/img/userIcon.png" />
							<a style="color: black;" href="usersystem"><%=session.getAttribute("userName")%></a>
						</span> 
						<span style="padding-left: 22px;">
							<img class="topimg" src="<%=contextPath%>/logo/mydingdan.png">
							<a href="express" style="color: #000000">
								我的订单
							</a>
						</span>
						<span style="padding-left: 22px;">
							<img class="topimg" src="<%=contextPath%>/logo/user-kucun.png">
							<a href="javascript:;" onclick="usersupplier()" style="color: #000000">
								免费上传库存
							</a>
						</span>
						<span style="padding-left: 22px;">
							<img class="topimg" src="<%=contextPath%>/logo/userout.png">
							<a style="color: black;" href="userOut">退出</a>
						</span>	
					</div>
				</c:if>
			</div>
		</div>
		<div style="width: 100%; height: 110px; margin-top: 22px;">
		<div style="width: 1200px;">
			<div style="float: left; width: 32%;padding-top: 30px">
				<a href="index"> <span style="float: left;">  <span
						style="color: #28004D; font-size: 35px; font-weight: bold; margin-top: 100px;">
							自可知 </span> <span
						style="color: #28004D; color: #28004D; font-size: 18px; font-weight: bold;">
							|&nbsp; 电子查询网 </span>
				</span>
				</a>
				
			</div>
			<div style="float: left; width: 48%; margin-top: 9px;margin-left: -15px">
				<form
					action="search?product_second=${product_second }&&manufacturer=${manufacturer}&&encapsulation=${encapsulation}"
					method="get">
					<input
						style="width: 420px; float: left; height: 43px; border: 3px solid #c00; border-color: #c00; border-right: none;margin-top:10px "
						id="keyword" type="text" name="keyword" placeholder="请输入要查找的产品型号">
					<div class="clickOver"
						style="float: left; border-top: 3px solid #c00; border-bottom: 3px solid #c00; height: 43px; line-height: 43px; text-align: center;margin-top:10px; padding-right: 5px; margin-left: -55px;">
						<p style="float: left; margin-top: 16px;">
							<input type="checkbox" name="isExact" value="isExact"
								style="float: left;">
						</p>
						&nbsp;
						<p
							style="float: left; margin-top: 1px; margin-left: 5px; font-size: 12px; font: '微软雅黑'">精确</p>
					</div>
					<button
						style="background-color: #c00; color: #FFF; font-size: 15px; width: 100px; height: 49px;margin-top:10px; padding: 10px 30px; border: none"
						id="submit" type="submit" value="搜索">搜索</button>
				</form>
				<div
					style="height: 20px; width: 88%; clear: both; margin-top: 5px; line-height: 25px; font-size: 11px;margin-right: 60px">
					<span style="font-weight: bold; color: red;"><img
						src="logo/hot.gif">热搜型号 :&nbsp;&nbsp;</span> <a
						href="search?keyword=STM32F103C8T6&amp;value=product&amp;page=1">STM32F103C8T6</a>&nbsp;
					&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="search?keyword=PIC16F690-I/P&amp;value=product&amp;page=1">PIC16F690-I/P</a>&nbsp;
					&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="search?keyword=STM8S003F3P6TR&amp;value=product&amp;page=1">STM8S003F3P6TR</a>&nbsp;
					&nbsp;
					<!-- <span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="shaixuanse?primary_name=二极管">二极管</a>&nbsp;
							&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;<a
						href="shaixuanse?primary_name=继电器">继电器</a>&nbsp;&nbsp;<span style="color: #B7B7B7">|</span>&nbsp;&nbsp;
						<a href="shaixuanse?primary_name=电感和磁珠">电感和磁珠</a> -->
				</div>
			</div>
			<div style="float: left; width: 19%; margin-top: 8px;margin-left: 10px">
			
			
			<div
				style="color: f40; font-size: 18px; margin-top: 25px;">专注贸易商元器件查询服务                            </div>
				<!-- <div style="margin-top: 8px; float: right;">
					<b style="color: #3A006F; font-size: 16px;">终身免费上传库存</b>
					<p
						style="margin-top: 0px; color: #3A006F; font-weight: bold; font-size: 16px;">终身免费使用ERP</p>
				</div>
				<div style="width: 55px; float: right; margin-right: 10px;">
					<img alt="自可知" src="img/indexazikezi.png"
						style="width: 55px; height: 55px;">
				</div> -->
			</div>
		</div>
	</div>
		<div
		style="width: 100%; background: #fff; height: 40px; background-color: #fff">
		<div id="nav"
			style="width: 1200px; height: 40px; position: relative; padding: 0;">
			<div class="home"
				style="float: left; height: 40px; position: relative;">
				<a
					style="float: left; text-align: center; height: 40px; line-height: 40px; background: -webkit-linear-gradient(top, #f62521, #cc0000); padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: white; font-size: 16px; width: 80px;"
					href="<%=basePath%>">首页</a>  <a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 80px;"
					href="<%=basePath%>zaixiangouProduct"><font>在线购</font></a>  <a
					style="float: left; text-align: center; height: 40px; line-height: 40px; padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 120px;"
					href="<%=basePath%>beidongProduct"><font>被动器件供应商</font></a>
					<a style="float: left;text-align: center;height: 40px;line-height: 40px;padding: 0 10px;text-decoration: none;position: relative;white-space: nowrap;border-left: none;border-right: none;color:black;font-size: 16px;width: 120px;" href="<%=basePath%>resistanceZone"><font>被动器件商城</font></a>
			</div>
		</div>
	</div> 
	<div style="width: 1200px;height: 2px;background-color: #cc0000;margin-top: -2px;text-align: center" >
	</div>
		<div  id="guding" style=" width: 100%;z-index:20000;">
			<div style="width:1200px;margin: 0 auto;">
				<div class="shaixuan" style="width:1050px;background: #F4F4F4;padding:10px 0px 5px 150px;border-bottom: 1px solid #E4E4E4;">
					<c:if test="${!empty replace }">
						<div style="border-bottom: 1px dotted #C0C0C0;margin-left: -150px;padding:0px 0px 0px 20px;margin-top: -5px;">
							<p style="display: inline-block;position: absolute;line-height: 30px;color: red;font-weight: bold;">
								可完全替换型号推荐  : 
							</p>
							<div style="margin-left: 130px;">
								<c:forEach items="${replace }" var="replace" varStatus="status">
									<p  title="${replace.replace_name }" style="display: inline-block;width: 170px;line-height: 30px;margin-left: 10px;">
										<a class="endiva" data-encapsulation="${replace.replace_name }" 
										   href="search?keyword=${replace.replace_name }" 
										   style="color: blue;">${replace.replace_name }</a>
									</p>
								</c:forEach>
							</div>
						</div>
					</c:if>
					<c:if test="${!empty replacef }">
						<div style="border-bottom: 1px dotted #C0C0C0;margin-left: -150px;padding:5px 0px 0px 20px;margin-top: -5px;">
							<p style="display: inline-block;position: absolute;line-height: 30px;color: red;font-weight: bold;">
								非完全替换型号推荐  : 
							</p>
							<div style="margin-left: 130px;">
								<c:forEach items="${replacef }" var="replace" varStatus="status">
									<p title="具体信息请查阅相关资料" style="display: inline-block;width: 170px;line-height: 30px;margin-left: 10px;">
										<a class="endiva" data-encapsulation="${replace.replace_name }" 
										   href="search?keyword=${replace.replace_name }" 
										   style="color: blue;">${replace.replace_name }</a>
									</p>
								</c:forEach>
							</div>
						</div>
					</c:if>
					<p style="clear:both;font-weight: bold;font-size: 16px;color: #4B0091;margin-left: -130px;margin-top: 5px;">${keyword }<c:if test="${encapsulation!=null && encapsulation ne ''}">&gt;${encapsulation }</c:if>&nbsp;&nbsp;搜索结果</p>
				<ul class="ulPage" style="float: right;margin-top: -25px; margin-right: 1%">
				<li id="page"></li>
			</ul>
				</div>
				<ul id="resultList">
					<li id="resultList_title" style="border-bottom-right-radius:5px;border-bottom-left-radius:5px;background-color: #F9F9F9">
						<div class="result_check"></div>
						<div class="result_supply" style="color: #000000;margin-top: -5px;">供货商</div>
						<div class="result_id" style="color: #000000;margin-top: -5px;"><span style="margin-left: 20px;color: #000000;">型号</span></div>
						<div class="result_factory" style="color: #000000;margin-top: -5px;width: 125px;">品牌</div>
						<div class="result_batchNumber" style="color: #000000;margin-top: -5px;">批号</div>
						<div class="result_pakaging" style="color: #000000;margin-top: -5px;">封装</div>
						<div class="result_totalNumber" style="color: #000000;margin-top: -5px;">库存</div>
						<div class="result_prompt" style="color: #000000;margin-top: -5px;">说明</div>
						<div class="result_askPrice" style="color: #000000;margin-top: -5px;"><span style="margin-left: 40px;color:#000000;">询价</span></div>
						<div class="result_date" title="" style="margin-top: -5px;width: 70px;padding-right: 2px;float: right;">操作</div>
					</li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
			$("#guding").smartFloat();
		</script>
		<br>
		<div style="margin-top: 20px;">
			<div class="right_results">
			<c:forEach items="${supplierlist}" var="product" varStatus="status">
				<c:if test="${product.quality == 1}">
					<ul id="ss${status.count }">
						<li class="stair_tr" style="height: 60px;border-top:1px solid #E3E3E3;border-left:1px solid #E3E3E3;border-right: 1px solid #E3E3E3">
							<!-- 奇行样式class="stair_tr gray_bg" 偶行样式class="stair_tr" -->
							<div class="result_check" style="margin-top: 9px;">
								<input class="result_ckb"  onclick="checkOne(this);" value="bxsdz"
									type="checkbox">
							</div>
							<div class="result_supply" style="position: static;margin-top: 18px;">
								<a href="javascript:;" title="力芯周电子商行在线购"
									class="result_goCompany">
									<c:if test="${product.supplier eq '样品商城'}">力芯周电子商行</c:if>
									<c:if test="${product.supplier ne '样品商城'}">${product.supplierlist.suppliername}</c:if>
									(<b class="zheng" style="color:white;height: 50px;">在线购</b>)
								</a>
								<div class="detailLayer" style="display: none;">
									<h4 class="layer_companyName" style="background: #FFA500;"><c:if test="${product.supplier eq '样品商城'}">力芯周电子商行</c:if>
									<c:if test="${product.supplier ne '样品商城'}">${product.supplierlist.suppliername}</c:if></h4>
									<div class="layer_mainContent" style="background-color: #FFFFEB;">
										<div class="layer_line2">
											<div class="layer_tel">电话：</div>
											<ul class="layer_contact">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone1}</span></li>
												<c:if test="${product.supplierlist.telphone2!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone2}</span></li>
												</c:if>
												<c:if test="${product.supplierlist.telphone3!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone3}</span></li>
												</c:if>
												<c:if test="${product.supplierlist.telphone4!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone4}</span></li>
												</c:if>
											</ul>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">手机：</span><span
												class="layer_otherContent layer_otherContentphone">${product.supplierlist.cellphone}</span>
										</div><br>
										<div class="layer_line">
											<span class="layer_otherTitle">QQ：</span><span
												class="layer_otherContent company_address">
												<a href="javascript:void(0)"
													onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
													${product.supplierlist.qq}
												</a>
												<c:if
													test="${product.supplierlist.qq2 != null && product.supplierlist.qq2 ne '' }">
													<a href="javascript:void(0)"
														onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq2}&site=qq&menu=yes');">
														${product.supplierlist.qq2}
													</a>
												</c:if>
											 </span>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">地址：</span>
											<span class="layer_otherContent company_address">${product.supplierlist.supplierposition}</span>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">主要经营：</span><span
												class="layer_otherContent company_address2">${product.supplierlist.brandoperation}</span>
										</div>
									</div>
								</div>
							</div>
							<div class="result_id" style="margin-top: 17px;" title="${product.product}">
								<span class="product_number"><c:if test="${product.complaintprice>1}">
									<img class="jiazaigengduo" data-supplieruid="${product.supplieruuid }" data-quality="${product.quality}" data-supplier="${product.supplier }" data-pid="${product.productuuid }" src="img/gengduo.png" />
								</c:if>
								<c:if test="${product.complaintprice==1}">
									<span style="margin-left:20px;"></span>
								</c:if>
									<span class="tooltip" onmouseover="tooltip.pop(this, '#sub${status.count }', {position:1, offsetX:-10, effect:'slide'})" data-uid="${product.productuuid}">${product.product}
										<c:if test="${!empty product.pimgList }">
											<div style="display:none;background-color: #EEECF7;" >
												<div id="sub${status.count }" >
													<p class="datu" style="height: 340px;text-align: center;">
														<c:forEach items="${product.pimgList }" var="img" begin="0" end="0">
															<img style="width: 325px;height: 330px;" src="upload/${img.p_imgname }" />
														</c:forEach>
													</p>
													<div class="xuantu" style="text-align: center;margin-top: 5px;margin-bottom: 5px;">
														<c:forEach items="${product.pimgList }" var="img" begin="0" end="0">
															<img class="huantu" data-img="${img.p_imgname }" style="width: 30px;height: 30px;border:1px solid red;" src="upload/${img.p_imgname }" />&nbsp;&nbsp;&nbsp;
														</c:forEach>
														<c:forEach items="${product.pimgList }" var="img" begin="1">
															<img class="huantu" data-img="${img.p_imgname }" style="width: 30px;height: 30px;" src="upload/${img.p_imgname }" />&nbsp;&nbsp;&nbsp;
														</c:forEach>
													</div>
													<p style="color:red; text-align: center;margin-top: -10px;">温馨提醒：图片仅供参考，商品以实物为准。
													</p>
												</div>
											</div>
										</c:if>
									</span>
								</span>
								<a href="javascript:;"><span class="icon_xianHuo" title=""></span></a>
							</div>
							<div class="result_factory" style="margin-top: 17px;width: 125px;" title="${product.manufacturer }">${product.manufacturer }</div>
							<div class="result_batchNumber" style="margin-top: 17px;" title="${product.lotnumber }">${product.lotnumber }</div>
							<div class="result_pakaging" style="margin-top: 17px;" title="${product.encapsulation}">${product.encapsulation}</div>
							<div class="result_totalNumber" style="margin-top: 17px;" title="${product.isgoodsinstock}">${product.isgoodsinstock}</div>
							<div class="result_prompt" style="margin-top: 17px;">
								<div class="result_explain"
									title="一个起售">样品价格：<b style="color:red;">￥${product.price}</b></div>
									<p>(仅限在线购)</p>
							</div>
		
							<div class="result_askPrice" style="padding-top: 18px;padding-left: 45px;">
								<p>
									<a href="javascript:void(0)"
										onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
										<img src="logo/indexQQ1.png"
										style="width: 23px; height: 23px;" />
									</a>
								</p>
							</div>
							<div class="result_date" title="" style="margin-top: 3px;width: 70px;padding-right: 2px;float: right;">
								<%
									if (session.getAttribute("userName") == null) {
								%>
								<p>
									<a
										style="position: relative;padding: 2px 9px;background: #DF3033; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-radius: 2px;font-size: 9px;"
										href="javascript:void(0)" class="goLogin"> <!-- 购买logo -->
										立即购买
									</a>
								</p>
								<p style="margin-top: 1px;">
									<a
										style="position: relative; padding: 2px 3px; background: #DF9433; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
										href="javascript:void(0)" class="goLogin"> 加入购物车 </a>
								</p> <%
								 	} else {
								 %>

								<p>
									<c:if test="${product.isgoodsinstock eq '0'}">
										<a
											style="position: relative;padding: 2px 9px;background: #DF3033; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-radius: 2px;font-size: 9px;"
											href="javascript:;" onclick="alert('库存不足,无法购买')"> 立即购买 </a>
									</c:if>
									<c:if test="${product.isgoodsinstock ne '0'}">
										<a
											style="position: relative;padding: 2px 9px;background: #DF3033; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
											href="javascript:;"
											onclick="doSwithTab('${product.productuuid}')"> 立即购买 </a>
									</c:if>
								</p>
								<p style="margin-top: 6px;">
									<c:if
										test="${product.isgoodsinstock eq '0' || product.isgoodsinstock eq '1'}">
										<a
											style="position: relative; padding: 2px 3px; background: #DF9433; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
											href="javascript:;" onclick="alert('库存不足,无法购买')"> 加入购物车 </a>
									</c:if>
									<c:if
										test="${product.isgoodsinstock ne '0' || product.isgoodsinstock ne '1'}">
										<a href="javascript:;"
											style="position: relative; padding: 2px 3px; background: #DF9433; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
											class="xuanzhe" data-remodal-target="xuanzheli"
											data-price="${product.price}"
											data-uid="${product.productuuid}"
											data-product="${product.product}"> 加入购物车 </a>
									</c:if>

								</p> <%
								 	}
								 %>
							</div>
						</li>
					</ul>
				</c:if>
				<c:if test="${product.quality !=1 && product.quality != 8}">
					<ul>
						<li class="stair_tr <c:if test='${status.count%2==0 }'>gray_bg</c:if>" style="height: 55px;border-top:1px solid #E3E3E3;border-left:1px solid #E3E3E3;border-right: 1px solid #E3E3E3">
							<!-- 奇行样式class="stair_tr gray_bg" 偶行样式class="stair_tr" -->
							<div class="result_check">
								<input class="result_ckb" onclick="checkOne(this);" value="bxsdz"
									type="checkbox">
							</div>
							<div class="result_supply" style="position: static;">
								<a href="javascript:;" data-suid="${product.supplierlist.supplieruuid}" title="${product.supplierlist.suppliername}"
									class="result_goCompany">
									${product.supplierlist.suppliername}
								</a>
								<c:if test="${product.supplierlist.supplier_label1 !=null && product.supplierlist.supplier_label1 ne ''}">
									<p style="clear: both;">
										<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
  												background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
  												-webkit-font-smoothing:antialiased;font-size: 10px;font-family: 微软雅黑,宋体;">${product.supplierlist.supplier_label1 }
										</span>
									</p>
								</c:if>
								<!-- 公司名片 begin -->
								<div class="detailLayer" style="display: none;z-index: 30000">
									<h4 class="layer_companyName" style="background: #FFA500;">${product.supplierlist.suppliername}</h4>
									<div class="layer_mainContent" style="background-color: #FFFFEB;">
										<div class="layer_line2">
											<div class="layer_tel">电话：</div>
											<ul class="layer_contact">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone1}</span></li>
												<c:if test="${product.supplierlist.telphone2!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone2}</span></li>
												</c:if>
												<c:if test="${product.supplierlist.telphone3!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone3}</span></li>
												</c:if>
												<c:if test="${product.supplierlist.telphone4!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone4}</span></li>
												</c:if>
											</ul>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">手机：</span><span
												class="layer_otherContent layer_otherContentphone">${product.supplierlist.cellphone}</span>
										</div><br>
										<div class="layer_line">
											<span class="layer_otherTitle">QQ：</span><span
												class="layer_otherContent company_address">
												<a href="javascript:void(0)"
													onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
													${product.supplierlist.qq}
												</a>
												<c:if
													test="${product.supplierlist.qq2 != null && product.supplierlist.qq2 ne '' }">
													<a href="javascript:void(0)"
														onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq2}&site=qq&menu=yes');">
														${product.supplierlist.qq2}
													</a>
												</c:if>
											 </span>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">地址：</span>
											<span class="layer_otherContent company_address">${product.supplierlist.supplierposition}</span>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">主要经营：</span><span
												class="layer_otherContent company_address2">${product.supplierlist.brandoperation}</span>
										</div>${product.supplierlist.supplier_label1 }
										<c:if test="${product.supplierlist.supplier_label1!=null && product.supplierlist.supplier_label1 ne ''}">
											<div class="layer_line">
												<span class="layer_otherTitle">标签：</span>
												<span class="layer_otherContent company_address2">
													<ul class="layer_contact">
														<li style="float: left;white-space: nowrap;">
															<span class="layer_telNumber">
																<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
				    												background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D,);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
				    												-webkit-font-smoothing:antialiased;">${product.supplierlist.supplier_label1 }
																</span>
															</span>
														</li>
														<c:if test="${product.supplierlist.supplier_label2 !=null && product.supplierlist.supplier_label2 ne ''}">
															<li style="margin-left:6px; float: left;white-space: nowrap;">
																<span class="layer_telNumber">
																	<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
					    												background: -o-radial-gradient(#FF2D2D, #CB0201 );background: -moz-radial-gradient(#CB0201, #FF2D2D,);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
					    												-webkit-font-smoothing:antialiased;">${product.supplierlist.supplier_label2 }
																	</span>
																</span>
															</li>
														</c:if>
														<c:if test="${product.supplierlist.supplier_label3 !=null && product.supplierlist.supplier_label3 ne ''}">
															<li style="margin-left:6px; float: left;white-space: nowrap;">
																<span class="layer_telNumber">
																	<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
					    												background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D,);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
					    												-webkit-font-smoothing:antialiased;">${product.supplierlist.supplier_label3 }
																	</span>
																</span>
															</li>
														</c:if>
														<c:if test="${product.supplierlist.supplier_label4 !=null && product.supplierlist.supplier_label4 ne ''}">
															<li style="margin-left:6px; float: left;white-space: nowrap;">
																<span class="layer_telNumber">
																	<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
					    												background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D,);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
					    												-webkit-font-smoothing:antialiased;">${product.supplierlist.supplier_label4 }
																	</span>
																</span>
															</li>
														</c:if>
														<c:if test="${product.supplierlist.supplier_label5 !=null && product.supplierlist.supplier_label5 ne ''}">
															<li style="margin-left:6px; float: left;white-space: nowrap;">
																<span class="layer_telNumber">
																	<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
					    												background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D,);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
					    												-webkit-font-smoothing:antialiased;">${product.supplierlist.supplier_label5 }
																	</span>
																</span>
															</li>
														</c:if>
													</ul>
												</span>
											</div>
										</c:if>
										<div class="layer_line"style="margin-bottom: 5px;height: 25px;">
											<span class="layer_otherTitle remarksname"></span>
											<span class="layer_otherContent company_address remarkscontest">
											</span>
										</div><br>
									</div>
								</div>
								<!-- 公司名片 end -->
								
							</div>
							<div class="result_id" title="${product.product}">
								<span class="product_number">
									<c:if test="${product.complaintprice>1}">
										<img class="jiazaigengduo" data-zan="${product.product_evaluatezai }" data-supplieruid="${product.supplieruuid }" data-supplier="${product.supplier }" data-quality="${product.quality }" data-pid="${product.productuuid }" src="img/gengduo.png" />
									</c:if>
									<c:if test="${product.complaintprice==1}">
										<span style="margin-left: 20px;"></span>
									</c:if>
									<span data-uid="${product.productuuid}">${product.product}</span>
								</span>
								<a href="javascript:;">
									<span class="icon_xianHuo" style="padding-left:20px;" title="">
										<c:if test="${product.quality==3}">
											<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D); /* Safari 5.1 - 6.0 */
   												background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
   												-webkit-font-smoothing:antialiased;font-size: 11px;">优势推荐
											</span>
											<!-- <img style="margin-left: 18px;" src="logo/you.png" /> -->
										</c:if>
										<c:if test="${product.quality==4}">
											<span style="background: -webkit-radial-gradient(#009999, #59C5C5); /* Safari 5.1 - 6.0 */
   												background: -o-radial-gradient(#59C5C5, #009999);background: -moz-radial-gradient(#009999, #59C5C5);background: radial-gradient(#59C5C5, #009999); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
   												-webkit-font-smoothing:antialiased;font-size: 11px;">热卖推荐
											</span>
											<!-- <img style="margin-left: 18px;" src="logo/re.png"  /> -->
										</c:if>
										<c:if test="${product.quality==5}">
											<span style="background: -webkit-radial-gradient(#8470FF, #6A5ACD); /* Safari 5.1 - 6.0 */
   												background: -o-radial-gradient(#6A5ACD, #8470FF);background: -moz-radial-gradient(#8470FF, #6A5ACD);background: radial-gradient(#6A5ACD, #8470FF); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
   												-webkit-font-smoothing:antialiased;font-size: 11px;">现货推荐
											</span>
										</c:if>
										<c:if test="${product.product_evaluatezai>=100 && product.quality==6}">
											<span style="background: -webkit-radial-gradient(#FF9459, #FF5A00); /* Safari 5.1 - 6.0 */
   												background: -o-radial-gradient(#FF5A00, #FF9459);background: -moz-radial-gradient(#FF9459, #FF5A00);background: radial-gradient(#FF5A00, #FF9459); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;
   												-webkit-font-smoothing:antialiased;font-size: 11px;">热
											</span>
										</c:if>
									</span>
								</a>
							</div>
							<div class="result_factory" style="color: #000000;width: 125px;" title="${product.manufacturer }">${product.manufacturer }</div>
							<div class="result_batchNumber" style="color: #000000" title="${product.lotnumber }">${product.lotnumber }</div>
							<div class="result_pakaging" style="color: #000000" title="${product.encapsulation}">${product.encapsulation}</div>
							<div class="result_totalNumber" style="color: #000000" title="${product.isgoodsinstock}">${product.isgoodsinstock}</div>
							<div class="result_prompt">
								<div class="result_explain" style="color: #000000"
									title="${product.description}">${product.description}</div>
							</div>
							<div class="result_batchNumber" style="color: #000000;width: 120px;display:table-cell;text-align:center;vertical-align:middle;">
								<p style="width: 100%;margin:0; padding:0;">
									<a href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
										<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />
									</a>
									<c:if test="${product.supplierlist.qq2 != null && product.supplierlist.qq2 ne '' }">
										<a href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq2}&site=qq&menu=yes');">
											<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />
										</a>
									</c:if>
								</p>
								<p style="width: 100%;margin:0; padding:0;">
									<img class="zan" style="" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="logo/zan.png" />
									<span class="zz">(${product.product_evaluatezai })</span>&nbsp;
									<img class="cai" style="" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="logo/cai.png" />
									<span class="cc">(${product.product_evaluatecai })</span>
								</p>
							</div>
							<div class="result_date" title=""style="margin-top: 3px;padding-right: 5px;float:right;">
								<c:if test="${sessionScope.userName != null}">
						    		<button onclick="EditStock('${product.productuuid }','${product.product }','${product.manufacturer }','${product.lotnumber }','${product.isgoodsinstock }','${product.description }','${product.encapsulation }','${product.supplier }','${product.supplieruuid }');" style="width: 55px;height: 20px;font-size: 11px;background-color: " value="询价">询价记录</button>
								</c:if>
								<c:if test="${sessionScope.userName == null}">
						    		<button class="goLogin" style="width: 55px;height: 20px;font-size: 11px;border: 1px silver #E4E4E4;" value="询价">询价记录</button>
								</c:if>
								<c:if test="${sessionScope.userName != null}">
						    		<button onclick="cgEditStock('${product.productuuid }','${product.product }','${product.manufacturer }','${product.lotnumber }','${product.isgoodsinstock }','${product.description }','${product.encapsulation }','${product.supplier }','${product.supplieruuid }');" style="width: 55px;height: 20px;font-size: 11px;margin-top: 3px;" value="询价">采购记录</button>
								</c:if>
								<c:if test="${sessionScope.userName == null}">
						    		<button class="goLogin" style="width: 55px;height: 20px;font-size: 11px;margin-top: 5px;border: 1px silver #E4E4E4;" value="询价">采购记录</button>
								</c:if>
							</div>
						</li>
					</ul>	
				</c:if>
				
				
				
				
				<c:if test="${product.quality == 8}">
					<ul id="ss${status.count }">
						<li class="stair_tr" style="height: 60px;border-top:1px solid #E3E3E3;border-left:1px solid #E3E3E3;border-right: 1px solid #E3E3E3">
							<!-- 奇行样式class="stair_tr gray_bg" 偶行样式class="stair_tr" -->
							<div class="result_check" style="margin-top: 9px;">
								<input class="result_ckb"  onclick="checkOne(this);" value="bxsdz"
									type="checkbox">
							</div>
							<div class="result_supply" style="position: static;margin-top: 18px;">
								<a href="javascript:;" title="力芯周电子商行在线购"
									class="result_goCompany">
									<c:if test="${product.supplier eq '样品商城'}">力芯周电子商行</c:if>
									<c:if test="${product.supplier ne '样品商城'}">${product.supplierlist.suppliername}</c:if>
									<!-- (<b class="zheng" style="color:white;height: 50px;">在线购</b>) -->
								</a>
								<div class="detailLayer" style="display: none;">
									<h4 class="layer_companyName" style="background: #FFA500;"><c:if test="${product.supplier eq '样品商城'}">力芯周电子商行</c:if>
									<c:if test="${product.supplier ne '样品商城'}">${product.supplierlist.suppliername}</c:if></h4>
									<div class="layer_mainContent" style="background-color: #FFFFEB;">
										<div class="layer_line2">
											<div class="layer_tel">电话：</div>
											<ul class="layer_contact">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone1}</span></li>
												<c:if test="${product.supplierlist.telphone2!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone2}</span></li>
												</c:if>
												<c:if test="${product.supplierlist.telphone3!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone3}</span></li>
												</c:if>
												<c:if test="${product.supplierlist.telphone4!=null}">
												<li class="layer_contacts"><span class="layer_telNumber">${product.supplierlist.telphone4}</span></li>
												</c:if>
											</ul>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">手机：</span><span
												class="layer_otherContent layer_otherContentphone">${product.supplierlist.cellphone}</span>
										</div><br>
										<div class="layer_line">
											<span class="layer_otherTitle">QQ：</span><span
												class="layer_otherContent company_address">
												<a href="javascript:void(0)"
													onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
													${product.supplierlist.qq}
												</a>
												<c:if
													test="${product.supplierlist.qq2 != null && product.supplierlist.qq2 ne '' }">
													<a href="javascript:void(0)"
														onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq2}&site=qq&menu=yes');">
														${product.supplierlist.qq2}
													</a>
												</c:if>
											 </span>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">地址：</span>
											<span class="layer_otherContent company_address">${product.supplierlist.supplierposition}</span>
										</div>
										<div class="layer_line">
											<span class="layer_otherTitle">主要经营：</span><span
												class="layer_otherContent company_address2">${product.supplierlist.brandoperation}</span>
										</div>
									</div>
								</div>
							</div>
							<div class="result_id" style="margin-top: 17px;" title="${product.product}">
								<span class="product_number"><c:if test="${product.complaintprice>1}">
									<img class="jiazaigengduo" data-supplieruid="${product.supplieruuid }" data-quality="${product.quality}" data-supplier="${product.supplier }" data-pid="${product.productuuid }" src="img/gengduo.png" />
								</c:if>
								<c:if test="${product.complaintprice==1}">
									<span style="margin-left:20px;"></span>
								</c:if>
									<span class="tooltip" onmouseover="tooltip.pop(this, '#sub${status.count }', {position:1, offsetX:-10, effect:'slide'})" data-uid="${product.productuuid}">${product.product}
										<c:if test="${!empty product.pimgList }">
											<div style="display:none;background-color: #EEECF7;" >
												<div id="sub${status.count }" >
													<p class="datu" style="height: 340px;text-align: center;">
														<c:forEach items="${product.pimgList }" var="img" begin="0" end="0">
															<img style="width: 325px;height: 330px;" src="upload/${img.p_imgname }" />
														</c:forEach>
													</p>
													<div class="xuantu" style="text-align: center;margin-top: 5px;margin-bottom: 5px;">
														<c:forEach items="${product.pimgList }" var="img" begin="0" end="0">
															<img class="huantu" data-img="${img.p_imgname }" style="width: 30px;height: 30px;border:1px solid red;" src="upload/${img.p_imgname }" />&nbsp;&nbsp;&nbsp;
														</c:forEach>
														<c:forEach items="${product.pimgList }" var="img" begin="1">
															<img class="huantu" data-img="${img.p_imgname }" style="width: 30px;height: 30px;" src="upload/${img.p_imgname }" />&nbsp;&nbsp;&nbsp;
														</c:forEach>
													</div>
													<p style="color:red; text-align: center;margin-top: -10px;">温馨提醒：图片仅供参考，商品以实物为准。
													</p>
												</div>
											</div>
										</c:if>
									</span>
								</span>
								<a href="javascript:;"><span class="icon_xianHuo" title=""></span></a>
							</div>
							<div class="result_factory" style="margin-top: 17px;width: 125px;" title="${product.manufacturer }">${product.manufacturer }</div>
							<div class="result_batchNumber" style="margin-top: 17px;" title="${product.lotnumber }">${product.lotnumber }</div>
							<div class="result_pakaging" style="margin-top: 17px;" title="${product.encapsulation}">${product.encapsulation}</div>
							<div class="result_totalNumber" style="margin-top: 17px;" title="${product.isgoodsinstock}">${product.isgoodsinstock}</div>
							<div class="result_prompt" style="margin-top: 17px;">
								<div class="result_explain"
									title="一个起售">样品价格：<b style="color:red;">￥${product.price}</b></div>
								<!-- 	<p>(仅限在线购)</p> -->
							</div>
		
							<div class="result_askPrice" style="padding-top: 18px;padding-left: 45px;">
								<p>
									<a href="javascript:void(0)"
										onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
										<img src="logo/indexQQ1.png"
										style="width: 23px; height: 23px;" />
									</a>
								</p>
							</div>
							<div class="result_date" title="" style="margin-top: 3px;width: 70px;padding-right: 2px;float: right;">
								<%
									if (session.getAttribute("userName") == null) {
								%>
								<p>
									<a
										style="position: relative;padding: 2px 9px;background: #DF3033; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-radius: 2px;font-size: 9px;"
										href="javascript:void(0)" class="goLogin"> <!-- 购买logo -->
										立即购买
									</a>
								</p>
								<p style="margin-top: 1px;">
									<a
										style="position: relative; padding: 2px 3px; background: #DF9433; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
										href="javascript:void(0)" class="goLogin"> 加入购物车 </a>
								</p> <%
								 	} else {
								 %>

								<p>
									<c:if test="${product.isgoodsinstock eq '0'}">
										<a
											style="position: relative;padding: 2px 9px;background: #DF3033; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-radius: 2px;font-size: 9px;"
											href="javascript:;" onclick="alert('库存不足,无法购买')"> 立即购买 </a>
									</c:if>
									<c:if test="${product.isgoodsinstock ne '0'}">
										<a
											style="position: relative;padding: 2px 9px;background: #DF3033; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-radius: 2px;font-size: 9px;"
											href="javascript:;"
											onclick="doSwithTab('${product.productuuid}')"> 立即购买 </a>
									</c:if>
								</p>
								<p style="margin-top: 6px;">
									<c:if
										test="${product.isgoodsinstock eq '0' || product.isgoodsinstock eq '1'}">
										<a
											style="position: relative; padding: 2px 3px; background: #DF9433; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
											href="javascript:;" onclick="alert('库存不足,无法购买')"> 加入购物车 </a>
									</c:if>
									<c:if
										test="${product.isgoodsinstock ne '0' || product.isgoodsinstock ne '1'}">
										<a href="javascript:;"
											style="position: relative; padding: 2px 3px; background: #DF9433; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 9px;"
											class="xuanzhe" data-remodal-target="xuanzheli"
											data-price="${product.price}"
											data-uid="${product.productuuid}"
											data-product="${product.product}"> 加入购物车 </a>
									</c:if>

								</p> <%
								 	}
								 %>
							</div>
						</li>
					</ul>
				</c:if>
			</c:forEach>
			<ul class="ulPage" style="float: right;margin-right: 1%;margin-top:12px;margin-bottom:18px;">
				<li id="page1"></li>
			</ul>
		</div>
		</div>
		<br>
		<div id="to_top" style="display:none;position:fixed;right:35px;bottom:110px;background-color:#aaa;cursor:hand;height: 30px;width: 30px;font-size: 12px;color:white;display: inline-block;background-image:url(img/fding.png);" title="返回顶端"></div>
		<div style="width: 1185px;margin-top: 50px;text-align: center;clear: both;">
			<span>新手指南&#8195;</span>
			<span>|&#8195;<a href="frontLogin">注册登录</a>&#8195;</span>
			<span>|&#8195;用户协议&#8195;</span>
			<span>|&#8195;支付方式&#8195;</span>
			<span>|&#8195;在线支付&#8195;</span>
			<span>|&#8195;银行汇款&#8195;</span>
			<span>|&#8195;特色服务&#8195;</span>
			<span>|&#8195;积分返现&#8195;</span>
			<span>|&#8195;<a href="javasctipt:;" onclick="addFavorite2()" title='自可知电子查询网' rel="sidebar">加入收藏</a>&#8195;</span>
			<span>|&#8195;关于库存&#8195;</span>
			<span>|&#8195;关于免费&#8195;</span>
			<span>|&#8195;关于自可知&#8195;</span>
			<span>|&#8195;联系我们</span>
			<hr style="border: 1px solid #3A006F; margin-top: 0px;; width: 1185px;" />
		</div>
  		<!-- <div id="godatuxian"></div>  
        <div id="datuxian" style="z-index: 9999;background-color: #fff; border:1px solid #9D9FA0; height: 240px; position: absolute; width: 350px;border: none;">
  		</div> -->
		<div id="gofullbg"></div>  
        <div id="godialog" style="z-index: 1000;border-color: #3A006F">  
	         <p class="goclose" style="background: #3A006F"> 
	         	   <span style="font-weight: bold;padding-right: 130px;font-size: 15px;color: white;">
	         	      	我要进入
	         	   </span> 
        	       <a href="javascript:;" onclick="gocloseBg();">
        	           <img src="logo/close.png">
        	       </a>
	         </p>
	         <div style="margin-left: 40px;">
				<button type="button" class="button3" id="gobutton1" style="width: 129px;height: 40px;background-color: #EEEEE0;font-weight: bold;border: none;">
					密码登录
				</button>
				<button type="button" class="button4" id="gobutton2" style="width: 129px;height: 40px;background-color: #EEEEE0;font-weight: bold;margin-left: 60px;border: none;">
					验证码登录
				</button>
			</div>
	         <div id="innerDiv1" style="margin-left: 40px;">
				<form action="userLogin" method="post" class="login form" name="submit1" id="submit1">
					<!-- 密码登录  -->
					<div  class="group" style="margin-top: 10px;">
						<div class="group-ipt" >
							<img alt="" src="logo/loginface.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 239px;height: 40px;padding-left: 80px;box-shadow: 40px 40px 40px 40px white inset;" type="text" name="telephone" class="ipt" placeholder="手机号码" required>
						</div>
						
						<div class="group-ipt password">
							<img alt="" src="logo/loginmima.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 239px;height: 40px;padding-left: 80px;box-shadow: 40px 40px 40px 40px white inset;" type="password" name="password" id="password" class="ipt" placeholder="输入您的登录密码" required>
						</div>
						
						<div class="group-ipt verify" >
							<img alt="" src="logo/loginyzm.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 139px;height: 40px;padding-left: 80px;box-shadow: 40px 40px 40px 40px white inset;" type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
							<img src="kaptcha.jpg" class="imgcode" style="position: absolute;height:40px;border:1px gray solid;width:97px;">
						</div>
						
						<div class="button" style="margin-top: 20px;text-align: center;margin-left: -20px;">
							<button type="submit" class="button3" style="height: 40px;width: 199px;font-size: 15px;font-weight: bold;background: #3A006F">
								登录
							</button>
						</div>
						<div style="margin-top: 20px;font-weight: bold;font-size: 18px;margin-bottom: 30px;">
							<a href="register" style="color: #23A8F6;margin-left: 80px;" class="zhu">没有账号，立即注册</a><br>
							<img src="logo/loginsmile.png">
							<span style="margin-left: 20px;color: #3A006F">自可知——不一样的客户体验</span>
						</div>
					</div>
				</form>
			</div>
			<div id="innerDiv2" style="margin-left: 40px;display: none;">
				<form action="Loginverification" method="post"  class="login form" name="submit2" id="submit2">
					<!-- 手机验证码登录   -->
					<div class="group" style="margin-top: 10px;">
						<div class="group-ipt" >
							<img  src="logo/loginface.png" style="position: absolute;margin-top: 2px;"><input style="width: 239px;height: 40px;padding-left: 80px;" type="text" name="telephone" id="telephonedt" class="ipt" placeholder="手机号码" required>
						</div>
						
						<div class="group-ipt verify" >
							<img  src="logo/loginyzm.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 139px;height: 40px;padding-left: 80px;box-shadow: 40px 40px 40px 40px white inset;" type="text" name="verify" id="verifydt" class="verifydt" placeholder="输入验证码" required>
							<img src="kaptcha.jpg" class="imgcodedt" style="height:40px;border:1px #606c88 solid;width: 97px;position: absolute;">
						</div>
						
						<div class="group-ipt yanzhen">
							<img  src="logo/loginmessage.png" style="position: absolute;margin-top: 2px;">
							<input type="text" placeholder="短信验证码" id="yanzhen" name="yanzhen" class="ipt" style="width: 239px;height: 40px;padding-left: 80px;box-shadow: 40px 40px 40px 40px white inset;" onfocus="clearErro();" required>
  	   	     	   	    	<input type="button" id="hsbtn" value="获取验证码" onclick="time(hsbtn)" style="width: 97px;background:#CBE9CF;position: absolute;height: 40px;margin-top: 2px;margin-left: -98px;box-shadow: 40px 40px 40px 40px white inset;" />
						</div>
						
						<div class="button" style="margin-top: 20px;text-align: center;margin-left: -20px;">
							<button type="submit" class="button3"  style="height: 40px;width: 199px;font-size: 15px;font-weight: bold;background: #3A006F">
								登录
							</button>
						</div>
						<div style="margin-top: 20px;font-weight: bold;font-size: 18px;margin-bottom: 30px;">
							<a href="register" style="color: #23A8F6;margin-left: 80px;" class="zhu">没有账号，立即注册</a><br>
							<img src="logo/loginsmile.png">
							<span style="margin-left: 20px;color: #3A006F">自可知——不一样的客户体验</span>
						</div>
					</div>
				</form>
			</div>
  		</div>
  		<div id="upfullbg"></div>  
	    <div id="updialog">  
	    	<div style="height:40px; background:#1057A7;text-align: center;line-height: 40px;">
	    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">自可知-询价记录添加</span>
	    		<a href="javascript:;" onclick="closeAdd()">
	   	           <img style="position: absolute;margin-left: 78px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
	   	       </a>
	    	</div>
	    	<form id="inquiryForm" style="padding-left: 20px;padding-top: 15px;">
	    		<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<input type="hidden" name="inquiry_supplieruuid" id="supplieruuid">
		    		<span style="color:red;margin-left: -5px;">*</span>供&#8195;应&#8195;商&#8195;
		    	</p><input onblur="id1()" type="text" id="inquiry_supplier" name="inquiry_supplier" placeholder="供应商" readonly="readonly" style="text-transform: uppercase;width: 320px;color:#000000;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<span style="color:red;margin-left: -5px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
		    	</p><input onblur="id2()" type="text" id="inquiry_product" name="inquiry_product" placeholder="型号" required="required" style="width: 320px;margin-top: 5px;color: #000000;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<span style="color:red;margin-left: -5px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;
		    	</p><input onblur="id5()" type="text" id="inquiry_brand" name="inquiry_brand" placeholder="批号" required="required" style="width: 120px;">

		    	<p>
		    		&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;margin-left: -5px;">*</span>封&#8195;装&#8195;
		    	</p><input type="text" id="inquiry_package" name="inquiry_package" placeholder="封装" required="required" style="width: 128px;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<span style="color:red;margin-left: -5px;">*</span>批&#8195;&#8195;&#8195;号&#8195;
		    	</p><input type="text" id="lotnumber" name="inquiry_lotnumber" placeholder="批号" required="required" style="width: 120px;">
		    	<p>
		    		&nbsp;&nbsp;<span style="color:red;">*</span>数&#8195;量&#8195;
		    	</p><input type="text" id="inquiry_number" name="inquiry_number" placeholder="可输入英文，汉字" required="required" style="width: 128px;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
				<span style="color:red;margin-left: -5px;">*</span><p>
		    		价&#8195;&#8195;&#8195;格&#8195;
		    	</p><input type="number" step="0.01" name="inquiry_price" id="inquiry_price" placeholder="价格" required="required">
		    	-&nbsp;<select id="inquiry_priceutil" name="inquiry_priceutil" style="height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;">
		    	<option selected="selected">人民币</option>
		    	<option>美元</option>
		    	</select>
		    	<p id="p4" style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		质&#8195;&#8195;&#8195;量&#8195;
		    	</p><input type="text" name="inquiry_quality" id="inquiry_quality" placeholder="质量" style="width: 100px;">
				<p id="p4" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
				<br>
		    	<a id="inquiry_add" href="javascript:;" class="g-btn g-mr-5 tian" style="border: none;height: 27px;width: 70px;cursor: pointer;padding-top: 1px\0;float: right; margin-right: 205px;margin-top: -15px;background: #1057A7;color:white;text-align: center;padding-top: 5px;">
					添加保存
				</a>
	    	</form>
		</div>
		<div id="cgfullbg"></div>  
	    <div id="cgdialog">  
	    	<div style="height:40px; background:#1057A7;text-align: center;line-height: 40px;">
	    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">采购记录添加</span>
	    		<a href="javascript:;" onclick="closeAdd()">
	   	           <img style="position: absolute;margin-left: 78px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
	   	       </a>
	    	</div>
	    	<form id="cgForm" style="padding-left: 20px;padding-top: 15px;">
	    		<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<input type="hidden" name="cg_supplieruuid" id="cg_supplieruuid">
		    		<span style="color:red;margin-left: -5px;">*</span>供&#8195;应&#8195;商&#8195;
		    	</p><input onblur="id1()" type="text" id="cg_supplier" name="inquiry_supplier" placeholder="供应商" readonly="readonly" style="text-transform: uppercase;width: 320px;color:#000000;">
		    		<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<span style="color:red;margin-left: -5px;">*</span>型&#8195;&#8195;&#8195;号&#8195;
		    	</p><input onblur="id2()" type="text" id="cg_product" name="inquiry_product" placeholder="型号" required="required" style="width: 320px;margin-top: 5px;color: #000000;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<span style="color:red;margin-left: -5px;">*</span>品&#8195;&#8195;&#8195;牌&#8195;
		    	</p><input onblur="id5()" type="text" id="cg_brand" name="inquiry_brand" placeholder="品牌" required="required" style="width: 120px;">

		    	<p>
		    		&nbsp;&nbsp;&nbsp;<span style="color:red;margin-left: -5px;">*</span>封&#8195;装&#8195;
		    	</p><input type="text" id="cg_package" name="inquiry_package" placeholder="封装" required="required" style="width: 128px;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
		    	<p>
		    		<span style="color:red;margin-left: -5px;">*</span>批&#8195;&#8195;&#8195;号&#8195;
		    	</p><input type="text" id="cg_lotnumber" name="inquiry_lotnumber" placeholder="批号" required="required" style="width: 120px;">
		    	<p>
		    		&nbsp;&nbsp;<span style="color:red;margin-left: -1px;">*</span>数&#8195;量&#8195;
		    	</p><input type="text" id="cg_number" name="inquiry_number" placeholder="数量(可输入英文，汉字)" required="required" style="width: 128px;">
		    	<p style="display: block;margin-left: 80px;height: 8px;color: red;"></p>
				<p>
		    		<span style="color:red;margin-left: -5px;">*</span>价&#8195;&#8195;&#8195;格&#8195;
		    	</p><input type="number" step="0.01" name="inquiry_price" id="cg_price" placeholder="价格" required="required">
		    	-&nbsp;<select id="cg_inquiry_priceutil" name="inquiry_priceutil" style="height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;">
		    	<option selected="selected">人民币</option>
		    	<option>美元</option>
		    	</select>
		    	<p id="p4" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
		    	<p>
		    		质&#8195;&#8195;&#8195;量&#8195;
		    	</p><input type="text" name="inquiry_quality" id="cg_inquiry_quality" placeholder="质量" style="width: 100px;">
				<p id="p4" style="display: block;margin-left: 80px;height: 13px;color: red;"></p>
				<br>
		    	<a id="cg_add" href="javascript:;" class="g-btn g-mr-5 tian" style="border: none;height: 27px;width: 70px;cursor: pointer;padding-top: 1px\0;float: right; margin-right: 205px;margin-top: -15px;background: #1057A7;color:white;text-align: center;padding-top: 5px;">
					添加保存
				</a>
	    	</form>
		</div>
		<form action="pay" method="post" id="payForm">
			<input type="hidden" name="productuid" id="productuid">
			<input type="hidden" name="number" id="number">
		</form>
	<script type="text/javascript">
	$("#to_top").hide();
	$(window).scroll(function () {  
        var scroll_top = $(document).scrollTop();  
        if (scroll_top > 100) {  
            $("#to_top").show();}  
          else{$("#to_top").hide();}             
    });  
    $("#to_top").click(function () {  
    	window.scrollTo(0, 0);
        $("#to_top").hide();  
    });  
	$('.tian').hover(function(){
		$(this).css('background','#3878C0');			
	},function(){
		$(this).css('color','white');
		$(this).css('background','#1057A7');
	});
	$(".beizhus").hover(function(){
		$(this).css('background','#D22111');	
	},function(){
		$(this).css('background','#F9572B');
	});
	
	$(document).on('click', '.beizhus', function () {
		var suid=$(this).data("suid");
		var me=$(this).parents(".remarkscontest");
		$.ajax({
			type:"post",
            url:"selectSupplierremarks",
            async:true,
            dataType: "json",
            data: {
            	suid:suid
            },
			success : function(data){
				if(data.result=="login"){
					$(".imgcode").attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
					$("#gofullbg").show;  
			        $("#godialog").show();
            	}else if(data.result=="success"){
            		$(me).html("");
            		if(data.msg!=null){
	            		$(me).html('<input type="text" class="remarkscon" style="width:140px;height: 20px;" maxlength="10" value="'+data.msg.remarks_contest+'"><button data-suid="'+suid+'" class="addremarks">提交</button');
            		}else{
	            		$(me).html('<input type="text" class="remarkscon" style="width:140px;height: 20px;" maxlength="10" value="">&nbsp;<button data-suid="'+suid+'" class="addremarks">提交</button');
            		}
            	}
			},
			error: function() {  
                alert('对不起失败了');  
            }  
        });
	});

	$(document).on('click', '.addremarks', function () {
		var suid = $(this).data("suid");
		var t=$(this).parents("li").find(".remarkscon").val();
		$.ajax({
			type:"post",
            url:"addSupplierremarks",
            async:true,
            dataType: "json",
            data: {
            	suid:suid,
            	remarks_contest:t
            },
			success : function(data){
				if(data.result=="login"){
					$(".imgcode").attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
					$("#gofullbg").show;  
			        $("#godialog").show();
            	}else if(data.result=="success"){
            		layer.alert("保存成功",function(){var index = window.location=location;
	                parent.layer.close(index);});
            	}
			},
			error: function() {  
                alert('对不起失败了');  
            }  
        });
	});

	function closeAdd(){
		window.location=location;
	}
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
	function EditStock(pid,pname,manufacturer,lotnumber,isgoodsinstock,description,encapsulation,supplier,supplieruuid){
		$("#inquiry_supplier").val(supplier);
		$("#supplieruuid").val(supplieruuid);
		$("#inquiry_product").val(pname);
		$("#inquiry_brand").val(manufacturer);
		$("#inquiry_package").val(encapsulation);
		$("#lotnumber").val(lotnumber);
		$("#upfullbg").css({  
            display: "block"  
         });  
         $("#updialog").show();
	}

	function cgEditStock(pid,pname,manufacturer,lotnumber,isgoodsinstock,description,encapsulation,supplier,supplieruuid){
		$("#cg_supplier").val(supplier);
		$("#cg_supplieruuid").val(supplieruuid);
		$("#cg_product").val(pname);
		$("#cg_brand").val(manufacturer);
		$("#cg_package").val(encapsulation);
		$("#cg_lotnumber").val(lotnumber);
		$("#cgfullbg").css({  
            display: "block"  
         });  
         $("#cgdialog").show();
	}
	$('.zhu').hover(function(){
		$(this).css('color','red');			
	},function(){
		$(this).css('color','#23A8F6');	
	});
	function ziliao(name){
		window.open("ziliao?name="+encodeURIComponent(name));
	}
	function doSwithTab(pid){
		$("#number").val("1");
		$("#productuid").val(pid);
		document.getElementById('payForm').submit();
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	}

	var a;
	var p_uid = "";
	var p_price = 0;
	var p_product = "";
	var expressname;

	$(function () {
		$("#page").paging({
			total: '${pageSize}',
			showPage: 10,
			currentPage: '${page}',
            animation: false,
            centerBgColor: "#fff",
            centerFontColor: "#000",
            centerBorder: "1px solid #ddd",
            transition: "all .2s",
            centerHoverBgColor: "#25dd3d",
            centerHoverBorder: "1px solid #25dd3d",
            centerFontHoverColor: "#fff",
            otherFontHoverColor: "#fff",
            otherBorder: "1px solid #ddd",
            otherHoverBorder: "1px solid #25dd3d",
            otherBgColor: "#fff",
            otherHoverBgColor: "#25dd3d",
            currentFontColor: "#fff",
            currentBgColor: "#f79898",
            currentBorder: "1px solid #f79898",
            fontSize: 13,
            currentFontSize: 13,
            cormer: 2,
            gapWidth: 3,
            showJump: false,
            jumpBgColor: "#fff",
            jumpFontHoverColor: "#fff",
            jumpHoverBgColor: "#25dd3d",
            jumpBorder: "1px solid #ddd",
            jumpHoverBorder: "1px solid #25dd3d",
            simpleType: 1,
            idParameter: 'page',
            submitStyle: 'href',
            url: '<%=basePath%>search?keyword=${keyword}&product_second=${product_second}&value=product&manufacturer=${manufacturer}&encapsulation=${encapsulation}'
		});
		if('${pageSize}'==1){
			$("#page1").paging({
				total: '${pageSize}',
				showPage: 8,
				height: 25,    //高
	            animation: false,
				currentPage: '${page}',
	            centerBgColor: "#fff",
	            centerFontColor: "#000",
	            centerBorder: "1px solid #ddd",
	            transition: "all .2s",
	            centerHoverBgColor: "#25dd3d",
	            centerHoverBorder: "1px solid #25dd3d",
	            centerFontHoverColor: "#fff",
	            otherFontHoverColor: "#fff",
	            otherBorder: "1px solid #ddd",
	            otherHoverBorder: "1px solid #25dd3d",
	            otherBgColor: "#fff",
	            otherHoverBgColor: "#25dd3d",
	            currentFontColor: "#fff",
	            currentBgColor: "#f79898",
	            currentBorder: "1px solid #f79898",
	            beforeBtnString: "上一页",
	            nextBtnString: "下一页",   //下一页按钮内显示的文字
	            firstBtnString: "首页",   //首页按钮内显示的内容
	            lastBtnString: "尾页",   //尾页按钮内显示的内容
	            fontSize: 13,
	            currentFontSize: 13,
	            cormer: 2,
	            gapWidth: 3,
	            showJump: false,
	            jumpBgColor: "#fff",
	            jumpFontHoverColor: "#fff",
	            jumpHoverBgColor: "#25dd3d",
	            jumpBorder: "1px solid #ddd",
	            jumpHoverBorder: "1px solid #25dd3d",
	            idParameter: 'page',
	            submitStyle: 'href',
				url: '<%=basePath%>search?keyword=${keyword}&product_second=${product_second}&value=product&manufacturer=${manufacturer}&encapsulation=${encapsulation}'
			});
		}else{
			$("#page1").paging({
				total: '${pageSize}',
				showPage: 8,
				height: 25,    //高
	            animation: false,
				currentPage: '${page}',
	            centerBgColor: "#fff",
	            centerFontColor: "#000",
	            centerBorder: "1px solid #ddd",
	            transition: "all .2s",
	            centerHoverBgColor: "#25dd3d",
	            centerHoverBorder: "1px solid #25dd3d",
	            centerFontHoverColor: "#fff",
	            otherFontHoverColor: "#fff",
	            otherBorder: "1px solid #ddd",
	            otherHoverBorder: "1px solid #25dd3d",
	            otherBgColor: "#fff",
	            otherHoverBgColor: "#25dd3d",
	            currentFontColor: "#fff",
	            currentBgColor: "#f79898",
	            currentBorder: "1px solid #f79898",
	            beforeBtnString: "&lt;",
	            nextBtnString: "&gt;",   //下一页按钮内显示的文字
	            firstBtnString: "",   //首页按钮内显示的内容
	            lastBtnString: "",   //尾页按钮内显示的内容
	            fontSize: 13,
	            currentFontSize: 13,
	            cormer: 2,
	            gapWidth: 3,
	            showJump: false,
	            jumpBgColor: "#fff",
	            jumpFontHoverColor: "#fff",
	            jumpHoverBgColor: "#25dd3d",
	            jumpBorder: "1px solid #ddd",
	            jumpHoverBorder: "1px solid #25dd3d",
	            idParameter: 'page',
	            submitStyle: 'href',
	            url: '<%=basePath%>search?keyword=${keyword}&product_second=${product_second}&value=product&manufacturer=${manufacturer}&encapsulation=${encapsulation}'
			});
		}
		
	});
	    
	$(function () {
		var diyihigth=0;
    	var A={links:"",layer:$(".detailLayer"),target:"",windowHight:600,mouseY:0,height:0};
    	function showCard(objCard){
			objCard.mouseenter(function(event){
				var me=$(this).parents("li").find(".remarksname");
				var mecon=$(this).parents("li").find(".remarkscontest");
				var suid=$(this).data("suid");
				$.ajax({
					type:"post",
		            url:"selectSupplierremarks",
		            async:true,
		            dataType: "json",
		            data: {
		            	suid:suid
		            },
					success : function(data){
						if(data.result=="login"){
							$(me).html("");
		            		$(mecon).html("");
							$(me).html("备注：");
		            		$(mecon).html('<a href="javascript:;"  title="可备注该商家经营品质，如（主营ST,原装,散新）！该备注只能自己登录可见，只能备注10字以内"><span class="beizhus" data-suid="'+suid+'" style="padding:0 3px;font-size: 11px;-webkit-font-smoothing:antialiased;border: 1px ridge #F9572B;background-color: #F9572B;color: white;border-radius: 3px;font-weight: lighter;text-align: center;">添加私人备注</span></a>');
		            	}else if(data.result=="success"){
		            		$(me).html("");
		            		$(mecon).html("");
		            		if(data.msg!=null){
			            		$(me).html("备注：");
			            		$(mecon).html('<span style="padding:0 3px;font-size: 11px;-webkit-font-smoothing:antialiased;border: 2px ridge #51C332;background-color: #51C332;color: white;border-radius: 3px;font-weight: lighter;text-align: center;">'+data.msg.remarks_contest+'</span>&nbsp;&nbsp;&nbsp;<a href="javascript:;" title="可备注该商家经营品质，如（主营ST,原装,散新）！该备注只能自己登录可见，只能备注10字以内"><span class="beizhus" data-suid="'+suid+'" style="padding:0 3px;font-size: 11px;-webkit-font-smoothing:antialiased;border: 1px ridge #F9572B;background-color: #F9572B;color: white;border-radius: 3px;font-weight: lighter;text-align: center;">添加私人备注</span></a>');
		            		}else{
		            			$(me).html("备注：");
			            		$(mecon).html('<a href="javascript:;"  title="可备注该商家经营品质，如（主营ST,原装,散新）！该备注只能自己登录可见，只能备注10字以内"><span class="beizhus" data-suid="'+suid+'" style="padding:0 3px;font-size: 11px;-webkit-font-smoothing:antialiased;border: 1px ridge #F9572B;background-color: #F9572B;color: white;border-radius: 3px;font-weight: lighter;text-align: center;">添加私人备注</span></a>');
		            		}
		            	}
					},
					error: function() {  
		                alert('对不起失败了');  
		            }  
		        });
				var w=$(document).width();
				var x=$(document).height();
				A.target=$(this).parents("li").find(".result_supply");
				A.target.css("position","relative");
				A.layer=A.target.find(".detailLayer");
				thisLayer=A.layer;A.height=A.layer.height();
				A.windowHight=$(window).height();
				A.mouseY=event.clientY;
				$("#sift_bar").css("position","static");
				if((A.windowHight-A.mouseY)<A.height && A.height<=A.mouseY){
					A.layer.css("top",-A.height);
				}else {
					A.layer.css("top","20px");
				}
				A.layer.show();
				A.target.mouseleave(function(){
					$("#sift_bar").css("position","relative");
					A.layer.hide();
					A.target.css("position","static");
				});
			});
		}
		showCard($(".result_goCompany"));
	});
	
	$(document).on('click', '.xuanzhe', function () {
		p_uid = $(this).data("uid");
		 $.post("addCart?pid="+p_uid,
           function(data){
				if(data.result=="fail"){
					swal({
						title: "系统提示",
						text: data.errorMsg,
						type: "success",
						confirmButtonColor: "#007AFF"
					});
				}else if(data.result=="seccuss"){
					window.location.href="cartback?pid="+p_uid;
				}
			}
	   	)
	});
	
	$(document).on('click', '.zan', function () {
		var suid = $(this).data("supplieruid");
		var pid = $(this).data("pid");
		var t=$(this).parents("li").find(".zz");
		 $.post("inZan?evaluate_pid="+pid,
           function(data){
				if(data.result=="login"){
					$(".imgcode").attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
					$("#gofullbg").show;  
			        $("#godialog").show();
				}else if(data.result=="success"){
					$(t).html("("+data.msg+")");
				}else if(data.result=="fail"){
					layer.msg("超出可点赞数");
				}
			}
	   	)
	});
	
	$(document).on('click', '.cai', function () {
		var suid = $(this).data("supplieruid");
		var pid = $(this).data("pid");
		var t=$(this).parents("li").find(".cc");
		 $.post("inCai?evaluate_pid="+pid,
           function(data){
				if(data.result=="login"){
					$("#gofullbg").show;  
			        $("#godialog").show();
				}else if(data.result=="success"){
					$(t).html("("+data.msg+")");
				}else if(data.result=="fail"){
					
				}
			}
	   	)
	});
	
	$(document).on('click', '#inquiry_add', function () {
		var inquiry_supplieruuid=document.getElementById("supplieruuid").value;
		var inquiry_supplier=document.getElementById("inquiry_supplier").value;
		var inquiry_product=document.getElementById("inquiry_product").value;
		var inquiry_brand=document.getElementById("inquiry_brand").value;
		var inquiry_package=document.getElementById("inquiry_package").value;
		var inquiry_lotnumber=document.getElementById("lotnumber").value;
		var inquiry_number=document.getElementById("inquiry_number").value;
		var inquiry_price=document.getElementById("inquiry_price").value;
		/* var inquiry_utilnumber=document.getElementById("inquiry_utilnumber").value; */
		var inquiry_priceutil=document.getElementById("inquiry_priceutil").value;
		var inquiry_quality=document.getElementById("inquiry_quality").value;
		if(inquiry_number=="" || inquiry_price==""){
			alert("请询价数量和价格为必填项!");
			return;
		}else{
			$.ajax({
				type:"post",
	            url:"addInquiry",
	            async:true,
	            dataType: "json",
	            data: {
	            	inquiry_supplieruuid:inquiry_supplieruuid,
	            	inquiry_supplier:inquiry_supplier,
	            	inquiry_product:inquiry_product,
	            	inquiry_brand:inquiry_brand,
	            	inquiry_package:inquiry_package,
	            	inquiry_lotnumber:inquiry_lotnumber,
	            	inquiry_number:inquiry_number,
	            	inquiry_price:inquiry_price,
	            	/* inquiry_utilnumber:inquiry_utilnumber,  */
	            	inquiry_priceutil:inquiry_priceutil,
	            	inquiry_quality:inquiry_quality
	            },
				success : function(data){
					if(data.result=="login"){
	            		$("#gofullbg").show;
	                    $("#godialog").show();
	            	}else if(data.result=="success"){
	            		alert("保存成功！");
	            		window.location=location;
	            	}
				}
	        });
		}
	});
	
	$(document).on('click', '#cg_add', function () {
		var inquiry_supplieruuid=document.getElementById("cg_supplieruuid").value;
		var inquiry_supplier=document.getElementById("cg_supplier").value;
		var inquiry_product=document.getElementById("cg_product").value;
		var inquiry_brand=document.getElementById("cg_brand").value;
		var inquiry_package=document.getElementById("cg_package").value;
		var inquiry_lotnumber=document.getElementById("cg_lotnumber").value;
		var inquiry_number=document.getElementById("cg_number").value;
		var inquiry_price=document.getElementById("cg_price").value;
	/* 	var inquiry_utilnumber=document.getElementById("cg_inquiry_utilnumber").value; */
		var inquiry_priceutil=document.getElementById("cg_inquiry_priceutil").value;
		var inquiry_quality=document.getElementById("cg_inquiry_quality").value;
		if(inquiry_number=="" || inquiry_price==""){
			alert("请询价数量和价格为必填项!");
			return;
		}else{
			$.ajax({
				type:"post",
	            url:"addCaigou",
	            async:true,
	            dataType: "json",
	            data: {
	            	inquiry_supplieruuid:inquiry_supplieruuid,
	            	inquiry_supplier:inquiry_supplier,
	            	inquiry_product:inquiry_product,
	            	inquiry_brand:inquiry_brand,
	            	inquiry_package:inquiry_package,
	            	inquiry_lotnumber:inquiry_lotnumber,
	            	inquiry_number:inquiry_number,
	            	inquiry_price:inquiry_price,
	            	/* inquiry_utilnumber:inquiry_utilnumber, */
	            	inquiry_priceutil:inquiry_priceutil,
	            	inquiry_quality:inquiry_quality
	            },
				success : function(data){
					if(data.result=="login"){
	            		$("#gofullbg").show;
	                    $("#godialog").show();
	            	}else if(data.result=="success"){
	            		alert("保存成功！");
	            		window.location=location;
	            	}
				}
	        });
		}
	});
	
	$("ul").on("click",".jiazaigengduo", function(){
		$(this).attr('src','logo/shouqi.png');
		var table=$(this).parents("ul");
		var sid=$(this).data("supplieruid");
		var sname=$(this).data("supplier");
		var quality=$(this).data("quality");
		var zan=$(this).data("zan");
		var you;
		if(quality==3){
			you='<span style="background: -webkit-radial-gradient(#CB0201, #FF2D2D);background: -o-radial-gradient(#FF2D2D, #CB0201);background: -moz-radial-gradient(#CB0201, #FF2D2D);background: radial-gradient(#FF2D2D, #CB0201); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;-webkit-font-smoothing:antialiased;font-size: 11px;">优势推荐</span>';
		}else if(quality==4){
			you='<span style="background: -webkit-radial-gradient(#009999, #59C5C5);background: -o-radial-gradient(#59C5C5, #009999);background: -moz-radial-gradient(#009999, #59C5C5);background: radial-gradient(#59C5C5, #009999); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;-webkit-font-smoothing:antialiased;font-size: 11px;">热卖推荐</span>';
		}else if(quality==5){
			you='<span style="background: -webkit-radial-gradient(#8470FF, #6A5ACD);background: -o-radial-gradient(#6A5ACD, #8470FF);background: -moz-radial-gradient(#8470FF, #6A5ACD);background: radial-gradient(#6A5ACD, #8470FF); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;-webkit-font-smoothing:antialiased;font-size: 11px;">现货推荐</span>';
		}else if(quality==6 && zan>=100){
			you='<span style="background: -webkit-radial-gradient(#FF9459, #FF5A00);background: -o-radial-gradient(#FF5A00, #FF9459);background: -moz-radial-gradient(#FF9459, #FF5A00);background: radial-gradient(#FF5A00, #FF9459); color: white;padding: 1px 3px 1px 3px;border-radius: 3px;-webkit-font-smoothing:antialiased;font-size: 11px;">热</span>';
		}else{
			you='';
		}
		var pid=$(this).data("pid");
		var keyword='${keyword}';
		$.ajax({  
            type: 'post', //可选get  
            url: 'showcontent', //这里是接收数据的程序  
            data: {
            	sid:sid,
            	quality:quality,
            	pid:pid,
            	keyword:keyword
            }, //传给后台的数据，多个参数用&连接  
            dataType: 'json', //服务器返回的数据类型 可选XML ,Json jsonp script html text等  
            success: function(data) {  
               if(quality==1){
            	   var i=1;
            	   for(var o in data){
            		   i++;
            		   var obj='<li class="result_son" style="width: 1197px;height: 63px;border-left:1px solid #E3E3E3;border-right: 1px solid #E3E3E3;">'
   						+'<div class="result_check"></div>'
						+'<div class="result_supply" style="position: static;margin-top: 22px;">'
							+'<a href="javascript:;" title="" class="result_goCompany">'
    						+'</a>'
   						+'</div>'
						+'<div class="result_id" title="'+data[o].product+'" style="margin-top: 22px;">'
							+'<span class="product_number" style="margin-left: 20px;">'
    							+'<span class="tooltip" onmouseover="tooltip.pop(this, \'#sub'+i+'\', {position:1, offsetX:-10, effect:\'slide\'})" data-uid="'+data[o].product+'">'+data[o].product+''
	        						
                   				+'</span>'
               				+'</span>'
           				+'</div>'
        				+'<div class="result_factory" style="margin-top: 22px;width: 125px;" title="'+data[o].manufacturer+'">'+data[o].manufacturer+'</div>'
        				+'<div class="result_batchNumber" style="margin-top: 22px;" title="'+data[o].lotnumber+'">'+data[o].lotnumber+'</div>'
        				+'<div class="result_pakaging" style="margin-top: 22px;" title="'+data[o].encapsulation+'">'+data[o].encapsulation+'</div>'
        				+'<div class="result_totalNumber" style="margin-top: 22px;" title="'+data[o].isgoodsinstock+'">'+data[o].isgoodsinstock+'</div>'
        				+'<div class="result_prompt" style="margin-top: 22px;">'
            				+'<div class="result_explain" title="一个起售">样品价格：<b style="color:red;">￥'+data[o].price+'</b></div>'
                   			+'<p>(仅限在线购)</p>'
                 		+'</div>'
            			+'<div class="result_askPrice" style="padding-top: 22px;padding-left: 45px;">'
            				+'<p>'
                				+'<a href="javascript:void(0)"'
                        			+'onclick="javascript:window.open(\'http://wpa.qq.com/msgrd?v=3&uin='+data[o].supplierlist.qq+'&site=qq&menu=yes\');">'
                        			+'<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />'
                         		+'</a>'
                   			+'</p>'
               			+'</div>'
            			+'<div class="result_date" title="" style="margin-top: 8px;width: 70px;padding-right: 2px;float: right;">'
            				+'<c:if test="${sessionScope.userName==null}">'
                				+'<p>'
                    				+'<a style="position: relative;padding: 2px 9px;background: #2E2E2E; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-right: 1px #2E2E2E solid;border-radius: 2px;font-size: 6px;"'
                               			+'href="javascript:void(0)" class="goLogin">'
                            			+'立即购买'
                            		+'</a>'
                          		+'</p>'
                    			+'<p style="margin-top: 1px;">'
                    				+'<a style="position: relative; padding: 2px 3px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 6px;"'
                               			+'href="javascript:void(0)" class="goLogin"> 加入购物车 </a>'
                        		+'</p>'
                   			+'</c:if>'
                			+'<c:if test="${sessionScope.userName!=null}">'
                				+'<p>'
                    				+'<c:if test="${'+data[o].isgoodsinstock+' eq \'0\'}">'
                        				+'<a style="position: relative;padding: 2px 9px;background: #2E2E2E; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-right: 1px #2E2E2E solid;border-radius: 2px;font-size: 6px;"'
                                			+'href="javascript:;" onclick="alert(\'库存不足,无法购买\')"> 立即购买 </a>'
                           			+'</c:if>'
                        			+'<c:if test="${'+data[o].isgoodsinstock+' ne \'0\'}">'
                        				+'<a style="position: relative;padding: 2px 9px;background: #2E2E2E; color: #fff; width: 25px;height:80px; line-height: 25px; vertical-align: middle; border-right: 1px #2E2E2E solid;border-radius: 2px;font-size: 6px;"'
           	                    			+'href="javascript:;"'
           	                    			+'onclick="doSwithTab(\''+data[o].productuuid+'\')"> 立即购买</a>'
                           			+'</c:if>'
                       			+'</p>'
                    			+'<p style="margin-top: 6px;">'
                    				+'<c:if test="${'+data[o].isgoodsinstock+' eq \'0\'}">'
                            			+'<a style="position: relative; padding: 2px 3px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 6px;"'
                                   			+'href="javascript:;" onclick="alert(\'库存不足,无法购买\')"> 加入购物车 </a>'
       		            			+'</c:if>'
                        			+'<c:if test="${'+data[o].isgoodsinstock+' ne \'0\'}">'
            	            			+'<a href="javascript:;"'
            		            			+'style="position: relative; padding: 2px 3px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;border-radius: 2px;font-size: 6px;"'
           			            			+'class="xuanzhe" data-remodal-target="xuanzheli"'
           			            			+'data-price="'+data[o].price+'"'
           			            			+'data-uid="'+data[o].productuuid+'"'
           			            			+'data-product="'+data[o].product+'"> 加入购物车 </a>'
           		            			+'</c:if>'
                        			+'</p> '
                    			+'</c:if>'
                			+'</div>'
            			+'</li>'
            			$(table).append(obj);
            	   }
               }else{
            	   var i=0;
            	   var a='<a href="javascript:void(0)" onclick="javascript:window.open(\'http://wpa.qq.com/msgrd?v=3&uin=';
            	   var b='&site=qq&menu=yes\');"><img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" /></a>';
            	   for(var o in data){
            		   i++;
            		   var obj='<li class="result_son" style="background-color: #F1FBFD;width:1197px;height: 55px;border-left:1px solid #E3E3E3;border-right: 1px solid #E3E3E3">'
                  			+'<div class="result_check"> </div>'
               				+'<div class="result_supply" style="position: static;"></div>'
               				+'<div class="result_id" title="'+data[o].product+'">'
               					+'<span class="product_number" style="margin-left: 20px;">'+data[o].product+'</span> '
                   				+'<a href="javascript:;">'
                   					+'<span class="icon_xianHuo" title="" style="margin-left: 20px;">';
	                       				
                           			var qobj='</span>'
                       			+'</a>'
                   			+'</div>'
               			+'<div class="result_factory" style="width: 125px;" title="'+data[o].manufacturer+'">'+data[o].manufacturer+'</div>'
               			+'<div class="result_batchNumber" title="'+data[o].lotnumber+'">'+data[o].lotnumber+'</div>'
               			+'<div class="result_pakaging" title="'+data[o].encapsulation+'">'+data[o].encapsulation+'</div>'
               			+'<div class="result_totalNumber" title="'+data[o].isgoodsinstock+'">'+data[o].isgoodsinstock+'</div>'
               				+'<div class="result_prompt">'
               					+'<div class="result_explain" title="'+data[o].description+'">'+data[o].description+'</div>'
                       		+'</div>'
                   			+'<div class="result_batchNumber" style="color: #000000;width: 120px;display:table-cell;text-align:center;vertical-align:middle;">'
                       			+'<p style="width: 100%;margin:0; padding:0;">'
                           			+'<a href="javascript:void(0)" onclick="javascript:window.open(\'http://wpa.qq.com/msgrd?v=3&uin='+data[o].supplierlist.qq+'&site=qq&menu=yes\');">'
                                   		+'<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />'
                                	+'</a>';
                                	var qq2='';
                                	if(data[o].supplierlist.qq2!=null && data[o].supplierlist.qq2!=''){
                                		qq2='<a href="javascript:void(0)" onclick="javascript:window.open(\'http://wpa.qq.com/msgrd?v=3&uin='+data[o].supplierlist.qq2+'&site=qq&menu=yes\');">'
                                   		+'<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />'
                                    	+'</a>';
                                	}
                       var objec='</p> <p style="width: 100%;margin:0; padding:0;"><img class="zan" style="" data-supplieruid="'+data[o].supplieruuid+'"'
                           		+'data-pid="'+data[o].productuuid+'" src="logo/zan.png" /><span class="zz">('+data[o].product_evaluatezai+')</span>&nbsp;&nbsp;<img class="cai" style="" data-supplieruid="'+data[o].supplieruuid+'"'
                            	+'data-pid="${product2.productuuid }" src="logo/cai.png" /><span class="cc">('+data[o].product_evaluatecai+')</span></p>'
                        	+'</div>'
                		+'<div class="result_date" title=""style="margin-top: 3px;padding-right: 5px;float:right;">'
                			+'<c:if test="${sessionScope.userName != null}">'
                    			+'<button onclick="EditStock(\''+data[o].productuuid+'\',\''+data[o].product+'\',\''+data[o].manufacturer+'\',\''+data[o].lotnumber+'\',\''+data[o].isgoodsinstock+'\',\''+data[o].description+'\',\''+data[o].encapsulation+'\',\''+data[o].supplier+'\',\''+data[o].supplieruuid+'\');" style="width: 55px;height: 20px;font-size: 11px;" value="询价">询价记录</button>'
                    		+'</c:if>'
                    		+'<c:if test="${sessionScope.userName == null}">'
                    			+'<button class="goLogin" style="width: 55px;height: 20px;font-size: 11px;" value="询价">询价记录</button>'
                    		+'</c:if>'
                    		+'<c:if test="${sessionScope.userName != null}">'
                    			+'<button onclick="cgEditStock(\''+data[o].productuuid+'\',\''+data[o].product+'\',\''+data[o].manufacturer+'\',\''+data[o].lotnumber+'\',\''+data[o].isgoodsinstock+'\',\''+data[o].description+'\',\''+data[o].encapsulation+'\',\''+data[o].supplier+'\',\''+data[o].supplieruuid+'\');" style="width: 55px;height: 20px;font-size: 11px;margin-top: 3px;" value="询价">采购记录</button>'
                    		+'</c:if>'
                    		+'<c:if test="${sessionScope.userName == null}">'
                    			+'<button class="goLogin" style="width: 55px;height: 20px;font-size: 11px;" value="询价">询价记录</button>'
                    		+'</c:if>'
                    		+'</div>'
            			+'</li>';
            			 obj=obj+you+qobj+qq2+objec;
            			$(table).append(obj);
            	   }
               }
            },  
            error: function() {  
                alert('对不起失败了');  
            }  
        })  
		$(this).addClass("sta").removeClass("jiazaigengduo");
	});
	$("ul").on("click", ".sta", function(){
		var table=$(this).parents("ul").find(".result_son").css({ display: "none"});
		$(this).attr('src','img/gengduo.png');
	    $(this).removeClass("sta").addClass("jiazaigengduo");
	});
	
	$(".huantu").click(function () {
		var img=$(this).data("img");
		$(".huantu").css("border", "none");
		$(this).css("border", "1px solid red");
		$(this).parent().parent().find(".datu").html("<img src='upload/"+img+"'"+"style='height:330px;width:325px;'"+ "/>");
	})
</script>
	
	<script type="text/javascript">
		$(function(){
			$("#submit1").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					$.post("userLogin", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.reload();
						}else{
							alert(d.msg);
						}
					});
				}
			});	
		});
		
	   /* $('.goLogin').click(function(){
           
      }); */
	   $(document).on('click', '.goLogin', function() {
		   $(".imgcode").attr('src',
					'kaptcha.jpg?' + Math.floor(Math.random() * 100));
	   	$("#gofullbg").show;  
          $("#godialog").show();  
     });
      //关闭灰色 jQuery 遮罩   
      function gocloseBg() {  
          $("#gofullbg,#godialog").hide();  
      }
      
      //验证码
      $('.imgcode').hover(function() {
			layer.tips("看不清？点击更换", '.imgcode', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      
      $('.imgcodedt').hover(function() {
			layer.tips("看不清？点击更换", '.imgcodedt', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      $('#gobutton2').click(function(){
    	  $('#innerDiv1').hide();
    	  $('#innerDiv2').show();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
    	  $('#gobutton1').addClass('button4');
    	  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button3');
      });
      $('#gobutton1').click(function(){
    	  $('#innerDiv1').show();
    	  $('#innerDiv2').hide();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
		  $('#gobutton1').addClass('button3');
		  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button4');
      });

		
		$("#telephonedt").on("input propertychange", function() { 
			$("#erro").html("");
			var phone = document.getElementById("telephonedt").value;
			if(!(/^1[34578]\d{9}$/.test(phone))){
		    	return false; 
		    }else{
		    	$.post("1019/zai/xin/jian/queryByPhone?phone="+phone,
			        function(data){
						if(data.result=="fail"){
							$("#telephonedt").val("");
							alert("请先注册该号码");
							window.location.href="register";
						}else if(data.result=="seccuss"){
						}
					}
			   	) 
		    }
		});
		$(document).ready(function() {

			$("#submit2").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					var yan=$("#yanzhen").val();
					if(yan==null||yan==''){
						layer.msg("请输入短信验证码");
						return false;
					}
					$.post("Loginverification", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.reload();
						}else{
							alert(d.msg);
						}
					});
				}
			})
		});
	</script>
	<script type="text/javascript">
	
		var wait = 60;
		function time(btn) {
			var verify = document.getElementById('verifydt').value;
		  	var phone = document.getElementById('telephonedt').value;
		    if(phone == null || phone == "" ){
		    	layer.msg("请输入手机号码");
		        return false; 
		    }else if(!(/^1[34578]\d{9}$/.test(phone))){
		    	layer.msg("手机号码有误，请重填");
		    	return false; 
		    }else if(verify == null || verify == "" ){
		    	layer.msg("请输入图形验证码");
		    	return false; 
		    }else{
			    if (wait == 60) {
			        btn.value = "获取验证码";
			        var phone = $("#telephonedt").val(); 
				    phone = $.trim(phone); 
				    $.post("verification",{'phone':phone,'login':'login'},function(index){ 
				    },"json") 
			        btn.removeAttribute("disabled"); 
			    }else if(wait == 0){
			    	dj(btn);
			    }
			    btn.setAttribute("disabled", true); 
			    btn.value ="("+ wait + ")重新获取"; 
			    wait--; 
			    setTimeout(function () { 
			    	if(wait==0){
			    		dj(btn);
			    		clearTimeout();
			    	}else{
			            time(btn); 	
			    	}
			    },1000)
		    }
		}
		
		function dj(btn){
		    btn.value = "获取验证码";
		    btn.removeAttribute("disabled"); 
		    wait = 60;
		}
		function clearErro(){
			$("#erro").html("");
		}
	</script>
	<script src="layer/layer.js"></script>
	<script src="js/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript" charset="utf-8"></script>
<%@include file="../../include/footer.jsp"%>
</body>
</html> 

