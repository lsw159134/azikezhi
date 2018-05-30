<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@ include file="include/defined.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon" />
<link rel="stylesheet" href="css/slide.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/fudong.css" />
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/css/css/index.css" />
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/css/css/float.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/faguang.css" />
<script src="<%=basePath%>js/jquerybasic.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kxbdSuperMarquee.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>自可知-电子元器件查询网</title>
<style type="text/css">
* {
	font-family: "微软雅黑";
	margin: 0 auto;
}

a {
	text-decoration: none
}

.topimg {
	width: 18px;
	height: 18px;
	margin: -4px 0px -3px 0px
}

.home a font:hover {
	color: #f40;
}
</style>
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?973a46004763863d10483eab2f1ae9b2";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</head>
<script type="text/javascript">
	/* var img = new Image();   
	img.src = "logo/login.jpg";   
	img.onload = function()   
	{//这里是要加载的源图像，document.getElementById('myImage').src = this.src;  img.src 
		document.getElementById('myImage').src = this.src;
	//document.getElementById('showinfo').innerHTML='<img src="http://www.forasp.cn/test/images/smail_showimg.jpg" name="myImage" width="901" height="567" id="myImage"  alt="图片由模糊变清楚" />';   
	} */
	/* $(document).ready(function(){  
	    $("#sItem").scrollQ();  
	}); */
	$(function() {
		$('.marquee5').kxbdSuperMarquee({
			distance : 240,
			time : 4,
			navId : '#mar3Nav',
			direction : 'up'
		});
	})
</script>
<script type="text/javascript">
	$(function() {
		$('#marquee7').kxbdSuperMarquee({
			isMarquee : true,
			isEqual : false,
			scrollDelay : 40,
			controlBtn : {
				up : '#goUM',
				down : '#goDM'
			},
			direction : 'up'
		});

	})
</script>
<html>
<style type="text/css">
* {
	font: '微软雅黑';
	margin: 0 auto;
}

/*表头*/
.nav {
	width: 100%;
	height: 38px;
	margin-top: -8px;
	left: 0;
	background-color: #eeeeee;
}

/*表头底线*/

/* .dixian {
            width: 100%;
            height: 1px;
            margin-top: 0px;
            left: 0;
            background-color: #80ffff;
        } */
.sea_t {
	width: 420px;
	height: 48px;
	margin-left: 450px;
	margin-top: 50px;
	border: 2px solid #c00;
	background-color: #ffffff;
	vertical-align: top;
	color: #8D8D8D;
	outline: none;
}

.sea_b {
	width: 100px;
	height: 48px;
	border: 2px solid #c00;
	margin-left: -25px;
	margin-top: -15px;
	color: #FFFFFF;
	line-height: 5px;
	background-color: #c00;
	vertical-align: top;
	outline: none;
}

/*登录样式*/
.denglu {
	width: 70px;
	height: 25px;
	background-color: #d9FFFF;
	/* Green */
	vertical-align: top;
	border: 1px solid #80ffff;
	margin-left: 1050px;
	margin-top: -30px;
}

.zhuce {
	width: 70px;
	height: 25px;
	border: 1px solid #2894ff;
	background-color: #2894ff;
	/* Green */
	vertical-align: top;
	margin-left: 1130px;
	margin-top: -52px;
}

/*导航栏*/
.nav_bar li a font:hover {
	color: #f40;
}

ul li {
	float: left;
	list-style: none;
	color: #FFFFFF;
	font-size: 17px;
	line-height: 30px;
}

/*竖立的导航栏*/
ul ul li a:hover {
	width: 60px;
	height: 0px;
	border-radius: 2px;
}

ul ul li {
	color: #000000;
	float: none;
	margin: 0px -40px;
	font-size: 15px;
}

/*#dise {
			width: 100%;
			height: 500px;
			background-color: #FFFFFF;
			white-space: nowrap;
			margin-top: 15px;
		}
		
		#xiamian {
			width: 100%;
			white-space: nowrap;
			height: 100px;
			background: #ccc8c8;
			font-size: 20px;
			font-weight: bold;
		}*/
.dise2 {
	width: 260px;
	height: 50px;
	margin-top: -35px;
	margin-left: 70px;
	border-bottom: 1px solid rgb(117, 102, 35);
	background-color: rgb(95, 109, 233);
	line-height: 50px;
	text-align: center;
}
</style>

<body style="clear: both; width: 100%; margin: 0 auto;">
<div style="width: 100%;height: 30px;background-color: #E5E5E5;">
			<div style="width: 1200px;height: 30px;background-color: #E5E5E5;">
				<div style="float: left;text-align: left; width: 50%;padding-top: 7px;padding-left: 2px;">
					<span style="font-size: 12px">客服热线:0755-82720040</span>
					<b>|</b>
					<span style="font-size: 12px">交易时间：9:00-18:00</span>
					<b>|</b> 
					<span style="font-size: 12px">在线客服</span>
					<a href="javascript:void(0)"
						onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
						<img class="topimg" src="<%=contextPath%>/logo/indexQQ1.png"/>
					</a>
					<b>|</b> 
					<span style="font-size: 12px">采购交流群：337260650</span>
				</div>
				<c:if test="${sessionScope.userName == null}">
					<div style="text-align:right;width:48%;padding-top: 7px;float: right;">
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
					<div style="text-align:right;width:45%;padding-top: 7px;float: right;">
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
			<div style="float: left; width: 32%;padding-top: 18px">
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
						style="width: 420px; float: left; height: 48.5px; border: 3px solid #c00; border-color: #c00; border-right: none;margin-top:10px "
						id="keyword" type="text" name="keyword" placeholder="请输入要查找的产品型号">
					<div class="clickOver"
						style="float: left; border-top: 3px solid #c00; border-bottom: 3px solid #c00; height: 48.5px; line-height: 43px; text-align: center;margin-top:10px; padding-right: 5px; margin-left: -55px;">
						<p style="float: left; margin-top: 13px;">
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
				</div>
			</div>
			<div style="float: left; width: 19%; margin-top: 8px;margin-left: 10px">
			
			
			<div
				style="color: f40; font-size: 18px; margin-top: 24px;">专注贸易商元器件查询服务                            </div>
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
					href="<%=basePath%>">首页</a>
			 <a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 80px;"
					href="<%=basePath%>zaixiangouProduct"><font>在线购</font></a> 
				<a
					style="float: left; text-align: center; height: 40px; line-height: 40px;  padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 150px;"
					href="<%=basePath%>beidongProduct"><font>被动器件供应商</font></a> <a
					style="float: left; text-align: center; height: 40px; line-height: 40px; padding: 0 10px; text-decoration: none; position: relative; white-space: nowrap; border-left: none; border-right: none; color: black; font-size: 16px; width: 150px;"
					href="<%=basePath%>resistanceZone"><font>被动器件商城</font></a>
			</div>
		</div>
	</div>
	<div
		style="width: 1200px; height: 2px; background-color: #cc0000; margin-top: -2px; text-align: center">
	</div>


	<div style="width: 1200px; margin: 20px auto; height: 350px">
		<div
			style="width: 250px; height: 348px; float:left; background-color: #ececec">
			<br>
			<p
				style="margin-top:8px;margin-left: 48px; font-size: 20px; font-size: 20px; font-weight: bold; color: bolr;padding-bottom: 10px;">供应商服务
			</p>
			<ul>
				<li><img border="0" src="logo/user-kucun.png" width="20"
					height="20;"> 
					<c:if test="${sessionScope.userName == null}">
						<a
							style="color: #000000; height= 220px;text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 10px;"
							href="javascript:;" class="goLogin">发布库存</a>
					</c:if> 
					<c:if test="${sessionScope.userName != null}">
						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="javascript:;" onclick="usersupplier()">发布库存</a>
					</c:if></li>

				<li style="color: lightblue; ">..................................................</li>
				
				<li><img border="0" src="logo/xunjia.png" width="20"
					height="20;"> <c:if test="${sessionScope.userName == null}">
						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="javascript:;" class="goLogin">询/报价记录</a>
					</c:if> <c:if test="${sessionScope.userName != null}">
						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="queryByInquiryUserid">询/报价记录</a>
					</c:if></li>
					<li style="color: lightblue; margin-top: -5px">..................................................</li>
					<li><img border="0" src="logo/baojia.png" width="20"
					height="20;"> <c:if test="${sessionScope.userName == null}">
						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="javascript:;" class="goLogin">报价记录</a>
					</c:if> <c:if test="${sessionScope.userName != null}">
						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="quoteAllByUser">报价记录</a>
					</c:if></li>
					<li style="color: lightblue; ">..................................................</li>
						<li><img border="0" src="logo/caigou.png" width="20"
					height="20;"> <c:if test="${sessionScope.userName == null}">

						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="javascript:;" class="goLogin">采购记录</a>
					</c:if> <c:if test="${sessionScope.userName != null}">
						<a
							style="color: #000000; text-align: center; text-decoration: none; padding: 5px 30px; margin-top: 5px;"
							href="quoteAllByUser">采购记录</a>
					</c:if></li>
			</ul>
			</div>
			
		<div style="width: 660px; height: 348px;float:left; margin-left: 20px"
			id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li> 
			</ol>

			<!-- Wrapper for slides -->
			<div style="height: 348px;float:left;" class="carousel-inner"
				role="listbox">
			 <div class="item active">
					<img style="height: 348px; width: 660px" src="img\indexshow.png"
						alt="...">
					<div class="carousel-caption">...</div>
				</div> 
				<div class="item ">
					<img style="height: 348px;" src="img\guanggao4.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img style="height: 348px;" src="img\guanggao2.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
    </div>

		
		<div
			style="width: 250px; height: 348px; float:left; background-color: #ececec;margin-left: 20px">
			<br>
			<p
				style="margin-top:8px;margin-left: 48px; font-size: 20px; font-size: 20px; font-weight: bold; color: bolr;">在线购样品热销榜
			</p>
			<ul style="padding-left: 18px">
				<li>
						<p
						style="color: #000000; font-size: 12px; text-align: center; text-decoration: none; padding: 35px 10px; margin-left: 40px; margin-top: -55px; margin-right: 30px;line-height: -10px;"
						href="/zikezhi002.jsp">近三日共交易：${chengjiao }&nbsp;笔</p>

					<p
						style="color: #000000; text-align: center; font-size: 14px; text-decoration: none; margin-left: -10px;margin-top:-35px;margin-bottom: 5px"
						href="/zikezhi002.jsp">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp型号&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp样品价格</p>
					</li>
					<c:forEach items="${deal }" var="product" begin="0" end="4">
							<div class="tab-content active"
						style="width: 254px; padding-top: ; padding-left:-30px;  display: block; overflow: hidden; line-height: 1;">
								<ul class="tab-c" style="margin: 10px 1px 0;">
									<li class="tab-t"
								style="border-bottom: 1px solid #1057a7; display: inline; float: left; cursor: pointer; width: 145px; height: 27px; position: relative; text-align: left; text-overflow: hidden;overflow: hidden;margin-right: 0px;">
										<a style="text-overflow: hidden;overflow: hidden"
								href="search?keyword=${product.product }">${product.product }</a>
							</li>
									<li class="tab-t"
								style="border-bottom: 1px solid #1057a7; display: inline; float: left; cursor: pointer; width: 58px; height: 27px; position: relative; text-align: left; margin-left: 10px;">￥${product.price }</li>
								</ul>
							</div>
						</c:forEach>
			</ul>
		</div>
	</div>
	<br>

 <div
		style="width: 100%; white-space: nowrap; height: 100px; background: #2f3583; font-size: 20px; font-weight: bold; color: #fff; line-height: 60px;text-align: left;padding-left: 6% ">
		  新加入供应商
	</div>
	<div  
		style="width: 1200px; height: 250px; margin-top: -35px; border-bottom: 1px solid rgb(162, 159, 177); background-color: #fcf9f9; line-height: 50px; text-align: center;">
		<div id="colee"
			style="overflow: hidden; height: 240px; width: 1200px; margin-top: 10px" >
			<div class="ck-slide2" style="">
				<ul class="ck-slide-wrapper"
					style="margin-left: -40px; color: black; height: 240px; border-top: none; width: 1185px;">
					<li
						style="color: black; float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; padding: 10px 0 0 0;">
						<c:forEach items="${supplier}" var="brand" varStatus="status"
							begin="0" end="24">
							<p title="${brand.suppliername }"
					 			style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 15px;">${brand.suppliername }</p>
						</c:forEach>
					</li>
					<li
						style="color: black; float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
						<c:forEach items="${supplier}" var="brand" varStatus="status"
							begin="25" end="49">
							<p title="${brand.suppliername }"
								style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
						</c:forEach>
					</li>
					<li
						style="float: left;color: black; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
						<c:forEach items="${supplier}" var="brand" varStatus="status"
							begin="50" end="74">
							<p title="${brand.suppliername }"
								style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
						</c:forEach>
					</li>
					<li
						style="float: left; color: black; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
						<c:forEach items="${supplier}" var="brand" varStatus="status"
							begin="75" end="99">
							<p title="${brand.suppliername }"
								style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
						</c:forEach>
					</li>
					<li
						style="float: left;color: black; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
						<c:forEach items="${supplier}" var="brand" varStatus="status"
							begin="100" end="124">
							<p title="${brand.suppliername }"
								style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
						</c:forEach>
					</li>
					<li
						style="float: left; color: black; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
						<c:forEach items="${supplier}" var="brand" varStatus="status"
							begin="125" end="149">
							<p title="${brand.suppliername }"
								style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
						</c:forEach>
					</li>
				</ul>
			</div>
		</div> 

	</div> 

	<br>
	<br>
<div style="width: 1200px; margin: 20px auto;">
		<div
		style="width: 1200px;margin-top:-20px;white-space: nowrap;height: 80px;font-size: 20px; font-weight: bold; fl
	            color:#f40;
	           line-height:60px;">
		在线购热门型号
	</div>
	<c:forEach begin="0" end="4" items="${productList}" var="p"
		varStatus="status">
	<c:if test="${status.index==0 }">
	<div style="height:40px;margin-top:-10px;">
	<div
					style="width:160px; height:35px;background-color:rgb(53, 233, 149);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:9px;">
					<font color="white" size="2px">型号：<font color="white"
						size="2px">${fn:substring(p.product,0,11)}...</font></font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(50, 204, 132);margin-top:-40px;margin-left:0px;"></div>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				     border-style: solid;border-color: transparent transparent rgb(44, 97, 110) rgb(44, 97, 110) ;">
		
			</div>
		</div>
	</c:if>
		<c:if test="${status.index==1 }">
		<div
				style="height:40px;margin-top:-50px;margin-left:20%;margin-top:-40px;">
		<div
					style="width:160px; height:35px;background-color:rgb(131, 162, 180);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(119, 153, 173);margin-top:-40px;margin-left:0px;"></div>
	<%-- 	<div style="width:160px; height:35px;background-color:rgb(75, 128, 141);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;"><font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font></div>
			<div style="width:75px; height:40px;background-color:rgb(54, 114, 129);margin-top:-40px;margin-left:0px;"></div> --%>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
			   border-style: solid;border-color: transparent transparent rgb(76, 9, 158) rgb(76, 9, 158) ;">
			</div>
		</div>
		</c:if>
		
		<c:if test="${status.index==2 }">
		<div style="height:40px;margin-top:-40px;margin-left:40%;">
		<%-- <div style="width:160px; height:35px;background-color:rgb(131, 162, 180);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;"><font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font></div>
			<div style="width:75px; height:40px;background-color:rgb(119, 153, 173);margin-top:-40px;margin-left:0px;"></div> --%>
			<div
					style="width:160px; height:35px;background-color:rgb(75, 128, 141);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(54, 114, 129);margin-top:-40px;margin-left:0px;"></div>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				                   border-style: solid;border-color: transparent transparent rgb(41, 172, 111) rgb(41, 172, 111) ;">
			</div>
		</div>
		</c:if>
		
		<c:if test="${status.index==3 }">
		<div style="height:40px;margin-top:-40px;margin-left:60%;">
		<div
					style="width:160px; height:35px; background-color:rgb(121, 74, 250);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(90, 40, 207);margin-top:-40px;margin-left:0px;"></div>
		
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				       border-style: solid;border-color: transparent transparent rgb(103, 12, 126) rgb(103, 12, 126) ;">
			</div>
		</div>
		</c:if>
		<c:if test="${status.index==4 }">
		<div style="height:40px;margin-top:-40px;margin-left:80%;">
		
				<div
					style="width:160px; height:35px;background-color:rgb(157, 21, 190);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(139, 15, 170);margin-top:-40px;margin-left:0px;"></div>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				             border-style: solid;border-color: transparent transparent rgb(88, 109, 122) rgb(88, 109, 122) ;">
			</div>
		</div>
		</c:if>
		</c:forEach>
		
		
			<c:forEach begin="0" end="4" items="${productList}" var="p"
		varStatus="status">
		
			<c:if test="${status.index==0 }">
			<div
				style="width: 235px;margin-left:0px;margin-top:-5px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==1 }">
			<div
				style="width: 235px;margin-left:20%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==2 }">
			<div
				style="width: 235px;margin-left:40%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==3 }">
			<div
				style="width: 235px;margin-left:60%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==4 }">
			<div
				style="width: 235px;margin-left:80%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<div class="xiaoge " style="width: 248px;height: 250px; ">
				<br>
				<br>
				
				<span style="margin-left: 50px;"></span>品牌：${p.manufacturer }
			<br> <span style="margin-left: 50px;"></span>批次：${p.lotnumber }
			<br> <span style="margin-left: 50px;"></span>封装：${p.encapsulation }
			<br> <span style="margin-left: 50px;"></span>库存：${p.isgoodsinstock}（一个起售） 
			<br> <span style="margin-left: 50px;"></span>样品价：${p.price }元 <br> <br>
				<a
				style="width: 100px; height: 35px; margin-top: 15px; margin-left: 120px; background-color: #f40; text-decoration: none; color: #fff;"
				data-product="${p.product }" href="javascript:;"
				class="btn btn-default xuanzhe" role="button">立即购买</a>
			</div>
		
	</div>
		
		</c:forEach>
	
	
	<br>
	<br>
    
	<div
		style="width: 100%;margin-top:-20px;white-space: nowrap;height: 80px;font-size: 20px; font-weight: bold;
	            color:#f40;
	           line-height:60px;">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp在线购热门型号
	</div>
	<c:forEach begin="5" end="9" items="${productList}" var="p"
		varStatus="status">
	<c:if test="${status.index==5 }">
	<div style="height:40px;margin-top:-10px;">
	<div
					style="width:160px; height:35px;background-color:rgb(53, 233, 149);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:9px;">
					<font color="white" size="2px">型号：<font color="white"
						size="2px">${fn:substring(p.product,0,11)}...</font></font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(50, 204, 132);margin-top:-40px;margin-left:0px;"></div>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				     border-style: solid;border-color: transparent transparent rgb(44, 97, 110) rgb(44, 97, 110) ;">
		
			</div>
		</div>
	</c:if>
		<c:if test="${status.index==6 }">
		<div
				style="height:40px;margin-top:-50px;margin-left:20%;margin-top:-40px;">
		<div
					style="width:160px; height:35px;background-color:rgb(131, 162, 180);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(119, 153, 173);margin-top:-40px;margin-left:0px;"></div>
	<%-- 	<div style="width:160px; height:35px;background-color:rgb(75, 128, 141);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;"><font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font></div>
			<div style="width:75px; height:40px;background-color:rgb(54, 114, 129);margin-top:-40px;margin-left:0px;"></div> --%>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
			   border-style: solid;border-color: transparent transparent rgb(76, 9, 158) rgb(76, 9, 158) ;">
			</div>
		</div>
		</c:if>
		
		<c:if test="${status.index==7 }">
		<div style="height:40px;margin-top:-40px;margin-left:40%;">
		<%-- <div style="width:160px; height:35px;background-color:rgb(131, 162, 180);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;"><font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font></div>
			<div style="width:75px; height:40px;background-color:rgb(119, 153, 173);margin-top:-40px;margin-left:0px;"></div> --%>
			<div
					style="width:160px; height:35px;background-color:rgb(75, 128, 141);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(54, 114, 129);margin-top:-40px;margin-left:0px;"></div>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				                   border-style: solid;border-color: transparent transparent rgb(41, 172, 111) rgb(41, 172, 111) ;">
			</div>
		</div>
		</c:if>
		
		<c:if test="${status.index==8 }">
		<div style="height:40px;margin-top:-40px;margin-left:60%;">
		<div
					style="width:160px; height:35px; background-color:rgb(121, 74, 250);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(90, 40, 207);margin-top:-40px;margin-left:0px;"></div>
		
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				       border-style: solid;border-color: transparent transparent rgb(103, 12, 126) rgb(103, 12, 126) ;">
			</div>
		</div>
		</c:if>
		<c:if test="${status.index==9 }">
		<div style="height:40px;margin-top:-40px;margin-left:80%;">
		
				<div
					style="width:160px; height:35px;background-color:rgb(157, 21, 190);margin-left:75px; text-align:center; line-height:35px;margin-top:-25px;font-size:7px;">
					<font color="white" size="2px">型号：${fn:substring(p.product,0,11)}...</font>
				</div>
			<div
					style="width:75px; height:40px;background-color:rgb(139, 15, 170);margin-top:-40px;margin-left:0px;"></div>
			<div
					style="width: 0px;height: 0px;  border-width: 3px; margin-left:75px; margin-top:-40px;
				             border-style: solid;border-color: transparent transparent rgb(88, 109, 122) rgb(88, 109, 122) ;">
			</div>
		</div>
		</c:if>
		</c:forEach>
		
		
			<c:forEach begin="5" end="9" items="${productList}" var="p"
		varStatus="status">
		
			<c:if test="${status.index==5 }">
			<div
				style="width: 235px;margin-left:0px;margin-top:-5px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==6 }">
			<div
				style="width: 235px;margin-left:20%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==7 }">
			<div
				style="width: 235px;margin-left:40%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==8 }">
			<div
				style="width: 235px;margin-left:60%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
			
		</c:if>
			<c:if test="${status.index==9 }">
			<div
				style="width: 235px;margin-left:80%;margin-top:-230px;height:230px;border: 1px solid rgb(162, 159, 177); ">
		</c:if>
			<div class="xiaoge " style="width: 248px;height: 250px; ">
				<br>
				<br>
				<span style="margin-left: 50px;"></span>品牌：${p.manufacturer }
			<br> <span style="margin-left: 50px;"></span>批次：${p.lotnumber }
			<br> <span style="margin-left: 50px;"></span>封装：${p.encapsulation }
			<br> <span style="margin-left: 50px;"></span>库存：${p.isgoodsinstock}（一个起售） 
			<br> <span style="margin-left: 50px;"></span>样品价：${p.price }元 <br> <br>
				<a
				style="width: 100px; height: 35px; margin-top: 15px; margin-left: 120px; background-color: #f40; text-decoration: none; color: #fff;"
				data-product="${p.product }" href="javascript:;"
				class="btn btn-default xuanzhe" role="button">立即购买</a>
			</div>
		</div>
		</c:forEach>
		</div>
	<div
		style="width: 1349px; margin-top: 40px;  margin-top: 100px;color:#000;text-align: center">
		<!-- float: left  text-align: left;文本左对齐 -->
		<span style="font-size: 15px; margin-left: 7px;">新手指南</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">注册登陆</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">用户协议</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">支付方式</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">在线支付</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">银行汇款</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">特色服务</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">积分返现</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">加入收藏</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">关于库存</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">关于免费</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">关于自可知</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">联系我们</span> <b
			style="padding-left: 7px;">|</b> <span
			style="font-size: 15px; padding-left: 7px;">在线留言</span>
		<div style="width: 80%; height: 50px; padding-top: 0px;">
			<hr>
		</div>
		<span
			style="width: 1200px; text-align:center; height: 40px; font-size: 15px;  line-height: 20px; padding-top: -100px; line-height: -10px;">版权所有 &copy; 2017 - 2018 自可知 保留所有权利 | <a
			href="http://www.miibeian.gov.cn/"><img src="img/img/icp.png" /> 粤ICP备17040594号-2 </a></span>
	</div>

	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js "></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js "></script>
	<div id="fullbg"></div>
	<div id="dialog" style="z-index: 9999">
		<p class="close">
			<span style="font-weight: bold; padding-right: 120px"> 用户留言 </span> <a
				href="javascript:;" onclick="closeBg()"> <img
				src="logo/close.png">
			</a>
		</p>
		<div style="padding-left: 10px">
			<b>尊敬的自可知客户</b>
			<p
				style="display: block; -webkit-margin-before: 1em; -webkit-margin-after: 1em; -webkit-margin-start: 0px; -webkit-margin-end: 0px; background: white; width: 360px;">&nbsp;&nbsp;&nbsp;我们努力完善网站、商品和服务。请留下您宝贵的意见，以便我们提供更好的服务。</p>
		</div>
		<div style="padding-left: 10px; padding-top: 20px">
			留言内容 :
			<textarea id="fankuiText"
				style="width: 280px; height: 120px; position: absolute; overflow: hidden; margin-top: 5px; margin-left: 10px; text-align: left; word-wrap: break-word; word-break: break-all;"></textarea>
		</div>
		<div style="margin-top: 120px; margin-left: 295px">
			<input type="button" id="button2" value="提交" />
		</div>
	</div>
	<div id="gofullbg"></div>
	<div id="godialog" style="z-index: 1000; border-color: #3A006F">
		<p class="goclose" style="background: #3A006F">
			<span
				style="font-weight: bold; padding-right: 130px; font-size: 15px; color: white;">
				我要进入 </span> <a href="javascript:;" onclick="gocloseBg();"> <img
				src="logo/close.png">
			</a>
		</p>
		<div style="margin-left: 40px;">
			<button type="button" class="button3" id="gobutton1"
				style="width: 129px; height: 40px; background-color: #EEEEE0; font-weight: bold; border: none;">
				密码登录</button>
			<button type="button" class="button4" id="gobutton2"
				style="width: 129px; height: 40px; background-color: #EEEEE0; font-weight: bold; margin-left: 60px; border: none;">
				手机验证码登录</button>
		</div>
		<div id="innerDiv1" style="margin-left: 40px;">
			<form action="userLogin" method="post" class="login form"
				name="submit1" id="submit1">
				<!-- 密码登录  -->
				<div class="group" style="margin-top: 10px;">
					<div class="group-ipt">
						<img alt="" src="logo/loginface.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 323px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="telephone" class="ipt" placeholder="手机号码"
							required>
					</div>

					<div class="group-ipt password">
						<img alt="" src="logo/loginmima.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 323px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="password" name="password" id="password" class="ipt"
							placeholder="输入您的登录密码" required>
					</div>

					<div class="group-ipt verify">
						<img alt="" src="logo/loginyzm.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 226px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="verify" id="verify" class="ipt"
							placeholder="输入验证码" required> <img src="kaptcha.jpg"
							class="imgcode"
							style="position: absolute; height: 40px; border: 1px gray solid; width: 97px;">
					</div>

					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3"
							style="height: 40px; width: 199px; font-size: 15px; font-weight: bold; background: #3A006F">
							登录</button>
					</div>
					<div
						style="margin-top: 20px; font-weight: bold; font-size: 18px; margin-bottom: 30px;">
						<a href="register" style="color: #23A8F6; margin-left: 80px;"
							class="zhu">没有账号，立即注册</a><br> <img src="logo/loginsmile.png">
						<span style="margin-left: 20px; color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
		<div id="innerDiv2" style="margin-left: 40px; display: none;">
			<form action="Loginverification" method="post" class="login form"
				name="submit2" id="submit2">
				<!-- 手机验证码登录   -->
				<div class="group" style="margin-top: 10px;">
					<div class="group-ipt">
						<img src="logo/loginface.png"
							style="position: absolute; margin-top: 2px;"><input
							style="width: 239px; height: 40px; padding-left: 80px;"
							type="text" name="telephone" id="telephonedt" class="ipt"
							placeholder="手机号码" required>
					</div>

					<div class="group-ipt verify">
						<img src="logo/loginyzm.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 139px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="verify" id="verifydt" class="verifydt"
							placeholder="输入验证码" required> <img src="kaptcha.jpg"
							class="imgcodedt"
							style="height: 40px; border: 1px #606c88 solid; width: 97px; position: absolute;">
					</div>

					<div class="group-ipt yanzhen">
						<img src="logo/loginmessage.png"
							style="position: absolute; margin-top: 2px;"> <input
							type="text" placeholder="短信验证码" id="yanzhen" name="yanzhen"
							class="ipt"
							style="width: 239px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							onfocus="clearErro();" required> <input type="button"
							id="hsbtn" value="获取验证码" onclick="time(hsbtn)"
							style="width: 97px; background: #CBE9CF; position: absolute; height: 40px; margin-top: 2px; margin-left: -98px; box-shadow: 40px 40px 40px 40px white inset;" />
					</div>

					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3"
							style="height: 40px; width: 199px; font-size: 15px; font-weight: bold; background: #3A006F">
							登录</button>
					</div>
					<div
						style="margin-top: 20px; font-weight: bold; font-size: 18px; margin-bottom: 30px;">
						<a href="register" style="color: #23A8F6; margin-left: 80px;"
							class="zhu">没有账号，立即注册</a><br> <img src="logo/loginsmile.png">
						<span style="margin-left: 20px; color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="godatuxian"></div>
	<div id="datuxian"
		style="z-index: 1000; background-color: #fff; border: 1px solid #000000; height: 400px; position: absolute; width: 350px; z-index: 5; border-radius: 5px; background: #EEECF7; display: none;">
		<p style="height: 10px; text-align: center;"></p>
		<p id="datu" style="height: 330px; text-align: center;"></p>
		<div id="xuantu"
			style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
		</div>
		<p style="color: red; text-align: center; margin-top: -10px;">
			温馨提醒：图片仅供参考，商品以实物为准。</p>
	</div>
	<form action="pay" method="post" id="payForm">
		<input type="hidden" name="productuid" id="productuid"> <input
			type="hidden" name="number" id="number">
	</form>
</body>
<script type="text/javascript">
	$("#to_top").hide();
	$(window).scroll(function() {
		var scroll_top = $(document).scrollTop();
		if (scroll_top > 100) {
			$("#to_top").show();
		} else {
			$("#to_top").hide();
		}
	});
	$("#to_top").click(function() {
		window.scrollTo(0, 0);
		$("#to_top").hide();
	});
	var src;
	imagePreview = function() {
		xOffset = -220;
		yOffset = 200;
		$(".tu")
				.hover(
						function(e) {
							$("#datu").html("");
							$("#xuantu").html("");
							p_uid = $(this).data("uid");
							var $target = $(e.target);
							src = $target.attr("src");
							var i = 0;
							$
									.post(
											"queryByPImgandPid?pid=" + p_uid,
											function(data) {
												for ( var o in data) {
													if (i == 0) {
														i++;
														$("#datu")
																.append(
																		"<img style='width: 325px;height: 330px;' src='upload/"+data[o].p_imgname+"' />");
														$("#xuantu")
																.append(
																		'<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;border:1px solid red;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
													} else {
														$("#xuantu")
																.append(
																		'<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
													}
												}
											})
							$("#datuxian").css({
								"top" : (e.pageY - yOffset) + "px",
								"left" : "12.5%"
							}).fadeIn("fast");
						}, function() {
							$("#datu").html("");
							$("#xuantu").html("");
							$("#godatuxian,#datuxian").hide();
						});
		$("#datuxian")
				.hover(
						function(e) {

							$("#godatuxian").css({
								display : "block"
							});
							$("#datuxian").show();
							var $target = $(e.target);
							$("#datu")
									.append(
											"<img src='"+ src+"'" +"style='height:330px;width:325px;'"+ "/>");
							var i = 0
							$
									.post(
											"queryByPImgandPid?pid=" + p_uid,
											function(data) {
												for ( var o in data) {
													if (i == 0) {
														i++;
														$("#xuantu")
																.append(
																		'<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;border:1px solid red;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
													} else {
														$("#xuantu")
																.append(
																		'<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
													}
												}
											})
						}, function() {
							$("#datu").html("");
							$("#xuantu").html("");
							$("#godatuxian,#datuxian").hide();
						});
	};
	$(document).ready(function() {
		imagePreview();

	});
	$(document)
			.on(
					'click',
					'.huantu',
					function() {
						$("#datu").html("");
						var img = $(this).data("img");
						$(".huantu").css("border", "none");
						$(this).css("border", "1px solid red");
						$("#datu")
								.append(
										"<img src='upload/"+img+"'"+"style='height:330px;width:325px;'"+ "/>");
					})
	function search() {
		var keyword = $("#keyword").val();
		alert(keyword);
	}
	function sousuo(product) {
		window.location.href = "search?keyword=" + encodeURIComponent(product)
				+ "&amp;value=product&amp;page=1";
	}

	$(function() {
		var td = $(".sort_table .index_tr1 td");
		td.mouseover(function() {
			$(this).css("background-color", "#AEF2E5");
		}).mouseout(function() {
			$(this).css("background-color", "#FFFFFF");
		});

		var weltd = $(".weltable td");
		weltd.mouseover(function() {
			$(this).css("background-color", "#AEF2E5");
		}).mouseout(function() {
			$(this).css("background-color", "#FFFFFF");
		});
	});
	$('.zhu').hover(function() {
		$(this).css('color', 'red');
	}, function() {
		$(this).css('color', '#23A8F6');
	});
	function doSwithTab(pid) {
		$("#number").val("1");
		$("#productuid").val(pid);
		document.getElementById('payForm').submit();
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	}
	$(function() {
		$(".xuanzhe").on("click", function() {
			p_product = $(this).data("product");
			window.location.href = "search?keyword=" + p_product;
		});
		var $subblock = $(".subpage"), $head = $subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul
				.find("li"), $jiantou = $lis.find(".rightjiantou");
		inter = false;
		$ul.show();
		$lis
				.hover(
						function() {
							$jiantou.css({
								"color" : "white"
							})
							var primary = $(this).find('.primary').html();
							var s = '';
							$
									.ajax({
										url : "indexSeleSecond",
										type : "POST",
										data : {
											primary_name : primary
										},
										contentType : "application/x-www-form-urlencoded; charset=utf-8",
										dataType : "json",
										success : function(data) {
											for ( var o in data) {
												if (o % 2 != 0) {
													s += ("<span style='float: left;width:190px;height:15px;margin:-10px 0px 25px 0px;'><em><a href='search?keyword="
															+ data[o].product.product
															+ "'>"
															+ data[o].product.product + "</a></em></span>");
												} else {
													s += ("<span style='float: left;width:190px;height:15px;margin:-10px 0px 25px 0px;'><em><a href='search?keyword="
															+ data[o].product.product
															+ "'>"
															+ data[o].product.product + "</a></em></span>");
												}
											}
											$('.prosmore').html('');
											$('.prosmore').html(s);
										}
									});
							if (!$(this).hasClass('nochild')) {
								$(this).addClass("prosahover");
								$(this).find(".prosmore").removeClass('hide');
							}
						}, function() {
							$jiantou.css({
								"color" : "#000000"
							})
							if (!$(this).hasClass('nochild')) {
								if ($(this).hasClass("prosahover")) {
									$(this).removeClass("prosahover");
								}
								$(this).find(".prosmore").addClass('hide');
							}
						});

	});

	$('.float_qq2').hover(function() {
		$(this).animate({
			"left" : "-70px"
		}, 350)
	}, function() {
		$(this).animate({
			"left" : "0"
		}, 350)
	})

	$('.float_qq3').hover(function() {
		$(this).animate({
			"left" : "-116px"
		}, 350)
	}, function() {
		$(this).animate({
			"left" : "0"
		}, 350)
	})

	$('.float_qq4').hover(function() {
		$(this).animate({
			"left" : "-90px"
		}, 350)
	}, function() {
		$(this).animate({
			"left" : "0"
		}, 350)
	})

	$('.float_qq5').hover(function() {
		$(this).animate({
			"left" : "-75px"
		}, 350)
	}, function() {
		$(this).animate({
			"left" : "0"
		}, 350)
	})
</script> <script type="text/javascript">
	function sps() {
		var sps = $("#sps").html();
		$("#sps").html("");
		if (sps == 1) {
			$("#sps").html("2");
			$("#kucuns").css({
				display : "block"
			});
			$("#zhuces").css({
				display : "none"
			});
		} else if (sps == 2) {
			$("#sps").html("1");
			$("#kucuns").css({
				display : "none"
			});
			$("#zhuces").css({
				display : "block"
			});
		}
	}
	window.setInterval("sps()", 3000);
</script>
<script type="text/javascript">
	function addFavorite2() {
		var url = window.location;
		var title = document.title;
		var ua = navigator.userAgent.toLowerCase();
		if (ua.indexOf("360se") > -1) {
			layer.alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！", 5);
		} else if (ua.indexOf("msie 8") > -1) {
			window.external.AddToFavoritesBar(url, title); //IE8
		} else if (document.all) {
			try {
				window.external.addFavorite(url, title);
			} catch (e) {
				layer.alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!', 5);
			}
		} else if (window.sidebar) {
			window.sidebar.addPanel(title, url, "");
		} else {
			layer.alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!', 5);
		}
	}
	$(function() {
		$("#submit1")
				.validator(
						{
							timely : 2,
							fields : {
								telephone : "required;mobile",
								password : "required;length(6~16)",
							},
							valid : function(form) {
								$
										.post("userLogin", $(form).serialize())
										.done(
												function(d) {
													if (d.code != -1
															&& d.code != -2) {
														window.location
																.reload();
													} else {
														$(".imgcode")
																.attr(
																		'src',
																		'kaptcha.jpg?'
																				+ Math
																						.floor(Math
																								.random() * 100));
														alert(d.msg);
													}
												});
							}
						});
	});

	$('.goLogin').click(
			function() {
				$(".imgcode").attr('src',
						'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				$("#gofullbg").show;
				$("#godialog").show();
			});
	//关闭灰色 jQuery 遮罩   
	function gocloseBg() {
		$("#gofullbg,#godialog").hide();
	}
	function showBg() {
		$('#button2')
				.click(
						function() {
							var fankuiText = document
									.getElementById('fankuiText').value;
							if (fankuiText.replace(/[]/g, "").length == 0) {
								alert("请先填写反馈内容");
							} else {
								$
										.post(
												"messageAdd?message_content="
														+ encodeURIComponent(fankuiText),
												function(data) {
													if (data.result == "success") {
														alert(data.msg);
														$("#fullbg").hide();
														$("#dialog").hide();
														document
																.getElementById('fankuiText').value = "";
													} else if (data.result == "fail") {
														alert(data.msg);
													}
												})
							}

						});
		$("#fullbg").css({
			display : "block"
		});
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩   
	function closeBg() {
		$("#fullbg,#dialog").hide();
	}
	//验证码
	$('.imgcode').hover(function() {
		layer.tips("看不清？点击更换", '.imgcode', {
			time : 6000,
			tips : [ 2, "#3c3c3c" ]
		})
	}, function() {
		layer.closeAll('tips');
	}).click(function() {
		$(this).attr('src', 'kaptcha.jpg?' + Math.floor(Math.random() * 100));
	});

	$('.imgcodedt').hover(function() {
		layer.tips("看不清？点击更换", '.imgcodedt', {
			time : 6000,
			tips : [ 2, "#3c3c3c" ]
		})
	}, function() {
		layer.closeAll('tips');
	}).click(function() {
		$(this).attr('src', 'kaptcha.jpg?' + Math.floor(Math.random() * 100));
	});
	$('#gobutton2').click(function() {
		$('#innerDiv1').hide();
		$('#innerDiv2').show();

		$('#gobutton1').removeClass('button3');
		$('#gobutton1').removeClass('button4');
		$('#gobutton1').addClass('button4');

		$('#gobutton2').removeClass('button3');
		$('#gobutton2').removeClass('button4');
		$('#gobutton2').addClass('button3');
	});
	$('#gobutton1').click(function() {
		$('#innerDiv1').show();
		$('#innerDiv2').hide();

		$('#gobutton1').removeClass('button3');
		$('#gobutton1').removeClass('button4');
		$('#gobutton1').addClass('button3');

		$('#gobutton2').removeClass('button3');
		$('#gobutton2').removeClass('button4');
		$('#gobutton2').addClass('button4');
	});

	$("#telephonedt").on(
			"input propertychange",
			function() {
				$("#erro").html("");
				var phone = document.getElementById("telephonedt").value;
				if (!(/^1[34578]\d{9}$/.test(phone))) {
					return false;
				} else {
					$.post("1019/zai/xin/jian/queryByPhone?phone=" + phone,
							function(data) {
								if (data.result == "fail") {
									$("#telephonedt").val("");
									alert("请先注册该号码");
									window.location.href = "register";
								} else if (data.result == "seccuss") {
								}
							})
				}
			});
	$(document)
			.ready(
					function() {
						$("#submit2")
								.validator(
										{
											timely : 2,
											fields : {
												telephone : "required;mobile",
												password : "required;length(6~16)",
											},
											valid : function(form) {
												var yan = $("#yanzhen").val();
												if (yan == null || yan == '') {
													layer.msg("请输入短信验证码");
													return false;
												}
												$
														.post(
																"Loginverification",
																$(form)
																		.serialize())
														.done(
																function(d) {
																	if (d.code != -1
																			&& d.code != -2) {
																		window.location
																				.reload();
																	} else {
																		$(
																				".imgcode")
																				.attr(
																						'src',
																						'kaptcha.jpg?'
																								+ Math
																										.floor(Math
																												.random() * 100));
																		alert(d.msg);
																	}
																});
											}
										});

					});
</script>
<script type="text/javascript">
	var wait = 60;
	function time(btn) {
		var verify = document.getElementById('verifydt').value;
		var phone = document.getElementById('telephonedt').value;
		if (phone == null || phone == "") {
			layer.msg("请输入手机号码");
			return false;
		} else if (!(/^1[34578]\d{9}$/.test(phone))) {
			layer.msg("手机号码有误，请重填");
			return false;
		} else if (verify == null || verify == "") {
			layer.msg("请输入图形验证码");
			return false;
		} else {
			if (wait == 60) {
				btn.value = "获取验证码";
				var phone = $("#telephonedt").val();
				phone = $.trim(phone);
				$.post("verification", {
					'phone' : phone,
					'login' : 'login'
				}, function(index) {
				}, "json")
				btn.removeAttribute("disabled");
			} else if (wait == 0) {
				dj(btn);
			}
			btn.setAttribute("disabled", true);
			btn.value = "(" + wait + ")重新获取";
			wait--;
			setTimeout(function() {
				if (wait == 0) {
					dj(btn);
					clearTimeout();
				} else {
					time(btn);
				}
			}, 1000)
		}
	}

	function dj(btn) {
		btn.value = "获取验证码";
		btn.removeAttribute("disabled");
		wait = 60;
	}
	function clearErro() {
		$("#erro").html("");
	}
</script>
<script type="text/javascript">
	function usersupplier() {
		$.post("supplierseleuser", function(data) {
			if (data.result == "fail") {
				layer.alert('请先添加公司信息');
				setTimeout(function() {
					window.location.href = "supplierIn";
				}, 1000);
			} else if (data.result == "seccuss") {
				window.location.href = "userSupplierProduct";
			} else if (data.result == "login") {
				window.location.href = "frontLogin";
			}
		})
	}
</script>
<script type="text/javascript" src="js/slide.js"></script>
<script type="text/javascript">
	$('.ck-slide').ckSlide({
		autoPlay : true,//默认为不自动播放，需要时请以此设置
		dir : 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
		interval : 4000
	//默认间隔2000毫秒

	});
	$('.ck-slide2').ckSlide({
		autoPlay : true,//默认为不自动播放，需要时请以此设置
		dir : 'y',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
		interval : 6000
	//默认间隔2000毫秒

	});
	$('.ck-slide3').ckSlide({
		autoPlay : true,//默认为不自动播放，需要时请以此设置
		dir : 'y',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
		interval : 9000
	//默认间隔2000毫秒

	});
</script>
<script type="text/javascript" src="js/myslideup.js"></script>
<script src="layer/layer.js"></script>
<script src="js/dist/jquery.validator.min.js?local=zh-CN"
						type="text/javascript" charset="utf-8"></script>

				</body>

</html>