<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@ include file="include/defined.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="include/header.jsp" flush="true">
	<jsp:param value="index" name="header" />
</jsp:include>

<link rel="stylesheet" href="css/slide.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/faguang.css" />
<script src="<%=basePath%>js/jquerybasic.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kxbdSuperMarquee.js"></script>
<style type="text/css">
html {
	font-family: 微软雅黑;
}

.product_table {
	border: 1px #3D8E97 solid;
	table-layout: fixed;
	text-align: center;
	width: 1200px;
}

.product_table td {
	font-size: 13px;
	word-wrap: break-word;
	height: 150px;
	border: 1px #3D8E97 solid;
	text-align: center;
}

.ulPage {
	margin-top: 30px;
	list-style: none;
}

p {
	margin: 0 auto;
}

.product_miaoshua:hover {
	color: blue;
}

.shaixuan a:hover {
	text-decoration: underline;
}

.miaoshutd a:hover {
	color: red;
	text-decoration: underline;
}

.product_table {
	border: 1px #E56804 solid;
	text-align: center;
	width: 1200px;
}

.product_table td {
	font-size: 13px;
	word-wrap: break-word;
	height: 120px;
	border: 1px #E56804 solid;
	text-align: center;
}

.index_tr1 td {
	border: 1px solid #4B0091;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.index_tr2 td {
	border: 1px solid #4B0091;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

a:hover {
	color: red
}

;
}
.index_tr3 td {
	border: 1px solid #E56804;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.zhu a:hover {
	color: red;
}

.ck-slide {
	width: 630px;
	height: 300px;
	margin: 0 auto;
}

.ck-slide ul.ck-slide-wrapper {
	height: 300px;
}

.shortcut li {
	text-align: center;
	font-size: 14px;
	width: 133px;
	border-right: 1px solid #eddada;
	float: left;
	line-height: 52px;
	height: 52px;
}

.shortcut li a {
	display: block;
	height: 52px;
	overflow: hidden;
}

.service-tab .tab-content li {
	float: left;
	width: 59px;
	text-align: center;
	position: relative;
}

.service-tab .tab-content a .ico-service {
	margin: 0px 7px 0px 18px;
	width: 40px;
	height: 40px;
}

.total ul.countNum li {
	float: left;
	height: 27px;
	line-height: 27px;
	width: 24px;
	text-align: center;
	padding-left: 0;
	margin: 0 5px 0 0;
	font-size: 18px;
	font-weight: 700;
	color: #c00;
	background: #f5f5f5;
	display: inline;
	overflow: hidden;
}

.total ul.countNum span {
	height: auto;
	-webkit-transition: all 2s ease-out;
	transition: all 2s ease-out;
}

.total ul.countNum span, .total ul.countNum span i {
	width: 24px;
	display: inline-block;
}

.total ul.countNum .num-8 {
	margin-top: -216px;
}

.total ul.countNum .comma {
	width: 5px;
	background: #fff;
}
</style>
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
<body style="width: 100%; margin: 0 auto">
	<div id="contro1">
		<br> <a href="javascript:void(0);" class="goL"></a> <a
			href="javascript:void(0);" class="goR"></a>
	</div>
	<div style="width: 100%">
		<div style="width: 1200px; margin: 0 auto;">
			<div style="float: left;">
				<div class="service-menu"
					style="display: inline; float: right; width: 270px; height: 290px; border-bottom: 1px solid #e4e4e4; 、overflow: hidden; border-left: 1px solid #e2e2e2; border-right: 1px solid #e2e2e2;">
					<ul
						style="border: 1px solid #eddada; height: 52px; background: #F4F4F4; overflow: hidden;">
						<li
							style="text-align: center; font-size: 16px; padding-top: 5px; padding-bottom: 2px; color: #3A006F; font-weight: bold;">
							在线样品购热销榜</li>
						<li
							style="font-size: 11px; margin-top: 0px; float: right; margin-right: 18px;">近三日成交：${chengjiao }&nbsp;笔</li>
					</ul>
					<div class="service-tab tab" id="J_serviceTab"
						style="padding: 14px 15px 6px; overflow: hidden; width: 238px;">
						<ul class="tab-title" style="height: 27px;">
							<li class="tab-t"
								style="color: #333; display: inline; float: left; cursor: pointer; width: 148px; height: 27px; position: relative; text-align: left; margin-right: 18px; font-size: 14px; font-weight: bold;">型号</li>
							<li class="tab-t"
								style="color: #333; display: inline; float: left; cursor: pointer; width: 58px; height: 27px; position: relative; text-align: center; margin-right: 10px; font-size: 14px; font-weight: bold;">样品价格</li>
						</ul>
						<c:forEach items="${deal }" var="product" begin="0" end="3">
							<div class="tab-content active"
								style="width: 254px; padding-top: 10px; display: block; overflow: hidden; line-height: 1;">
								<ul class="tab-c" style="margin: 10px 1px 0;">
									<li class="tab-t"
										style="border-bottom: 1px solid #1057a7; display: inline; float: left; cursor: pointer; width: 148px; height: 27px; position: relative; text-align: left; margin-right: 18px;"><a
										href="search?keyword=${product.product }">${product.product }</a></li>
									<li class="tab-t"
										style="border-bottom: 1px solid #1057a7; display: inline; float: left; cursor: pointer; width: 58px; height: 27px; position: relative; text-align: left; margin-right: 10px;">￥${product.price }</li>
								</ul>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="ck-slide"
				style="float: left; margin-left: 10px; margin-top: -10px;">
				<ul class="ck-slide-wrapper">
					<li><a href="javascript:"><img
							style="height: 300px; width: 630px; margin-top: 10px;"
							src="logo/login.jpg" /></a></li>
					<li style="display: none"><a href="javascript:"><img
							style="height: 300px; width: 630px; margin-top: 10px;"
							src="img/guanggao2.jpg" /></a></li>
					<li style="display: none"><a href="javascript:"><img
							style="height: 300px; width: 630px; margin-top: 10px;"
							src="img/guanggao2.png" /></a></li>
					<li style="display: none"><a href="javascript:"><img
							style="height: 300px; width: 630px; margin-top: 10px;"
							src="img/guanggao4.jpg" /></a></li>
				</ul>
				<a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a
					href="javascript:;" class="ctrl-slide ck-next">下一张</a>
				<div class="ck-slidebox">
					<div class="slideWrap">
						<ul class="dot-wrap">
							<li class="current"><em>1</em></li>
							<li><em>2</em></li>
							<li><em>3</em></li>
							<li><em>4</em></li>
						</ul>
					</div>
				</div>
			</div>
			<div style="float: left; margin-left: 10px;">
				<div class="service-menu"
					style="display: inline; float: right; width: 270px; height: 290px; border-bottom: 1px solid #e4e4e4; 、overflow: hidden;">
					<ul class="shortcut"
						style="border: 1px solid #eddada; height: 52px; background: #F4F4F4; overflow: hidden;">
						<li><c:if test="${sessionScope.userName == null}">
								<a rel="nofollow" href="javascript:;" class="goLogin"> <i
									class="ico-write"></i><span>发布库存</span>
								</a>
							</c:if> <c:if test="${sessionScope.userName != null}">
								<a rel="nofollow" href="javascript:;" onclick="usersupplier()">
									<i class="ico-write"></i><span>发布库存</span>
								</a>
							</c:if></li>
						<li class="last" style="border-right: none;"><c:if
								test="${sessionScope.userName == null}">
								<a rel="nofollow" href="javascript:;" class="goLogin"> <i
									class="ico-text"></i><span>询/报价记录</span>
								</a>
							</c:if> <c:if test="${sessionScope.userName != null}">
								<a rel="nofollow" href="queryByInquiryUserid"> <i
									class="ico-text"></i><span>询/报价记录</span>
								</a>
							</c:if></li>
					</ul>
					<div class="service-tab tab" id="J_serviceTab"
						style="padding: 14px 15px 6px; overflow: hidden; height: 115px; border-left: 1px solid #e2e2e2; border-right: 1px solid #e2e2e2; width: 238px;">
						<ul class="tab-title"
							style="height: 27px; border-bottom: 1px solid #e5e5e5;">
							<li class="tab-t"
								style="border-bottom: 1px solid #1057a7; color: #333; display: inline; float: left; cursor: pointer; width: 68px; height: 27px; position: relative; text-align: center; margin-right: 18px; color: #999;">供应商服务</li>
						</ul>
						<div class="tab-content active"
							style="width: 254px; padding-bottom: 10px; display: block; height: 80px; overflow: hidden; line-height: 1;">
							<ul class="tab-c" style="margin: 10px 1px 0; height: 65px;">
								<li><c:if test="${sessionScope.userName == null}">
										<a style="width: 100%; float: left;" rel="nofollow"
											href="javascript:;" class="goLogin"> <span
											style="background-image: url(logo/user-kucun.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service4"></span> <span>发布库存</span>
										</a>
									</c:if> <c:if test="${sessionScope.userName != null}">
										<a style="width: 100%; float: left;" rel="nofollow"
											href="javascript:;" onclick="usersupplier()"> <span
											style="background-image: url(logo/user-kucun.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service4"></span> <span>发布库存</span>
										</a>
									</c:if></li>
								<li><c:if test="${sessionScope.userName == null}">
										<a rel="nofollow" href="javascript:;" class="goLogin"> <i
											style="background-image: url(logo/xunjia.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service11"></i> <span>询价记录</span>
										</a>
									</c:if> <c:if test="${sessionScope.userName != null}">
										<a rel="nofollow" href="queryByInquiryUserid"> <i
											style="background-image: url(logo/xunjia.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service11"></i> <span>询价记录</span>
										</a>
									</c:if></li>
								<li><c:if test="${sessionScope.userName == null}">
										<a rel="nofollow" href="javascript:;" class="goLogin"> <i
											style="background-image: url(logo/baojia.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service5"></i> <span class="highlight">报价记录</span>
										</a>
									</c:if> <c:if test="${sessionScope.userName != null}">
										<a rel="nofollow" href="quoteAllByUser"> <i
											style="background-image: url(logo/baojia.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service5"></i> <span class="highlight">报价记录</span>
										</a>
									</c:if></li>
								<li><c:if test="${sessionScope.userName == null}">
										<a rel="nofollow" href="javascript:;" class="goLogin"> <i
											style="background-image: url(logo/caigou.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service6"></i> <span>采购记录</span>
										</a>
									</c:if> <c:if test="${sessionScope.userName != null}">
										<a rel="nofollow" href="queryByInquiryUserid"> <i
											style="background-image: url(logo/caigou.png); background-repeat: no-repeat; display: inline-block; overflow: hidden;"
											class="ico-service ico-service6"></i> <span>采购记录</span>
										</a>
									</c:if></li>
							</ul>
						</div>
					</div>
					<div id="kucuns" class="total"
						style="padding: 10px 15px; height: 80px; width: 238px; overflow: hidden; border: 1px solid #e4e4e4; border-bottom: none;">
						<h2
							style="padding: 8px 0 10px; font-size: 12px; font-weight: 400;">
							今日·<span id="J_countName">库存总数</span>
						</h2>
						<ul
							style="height: 26px; overflow: hidden; width: 240px; margin-left: 10px; margin-top: 5px;"
							class="countNum" id="J_countNum"
							data-count="102325426,1298418,1055">
							<li><span class="num-0"><i>0</i><i>1</i><i>2</i><i>3</i><i>4</i><i>5</i><i>6</i><i>7</i><i>8</i><i>9</i></span></li>
							<li class="comma">,</li>
							<li><span class="num-0">${pshiwan }</span></li>
							<li><span class="num-0">${pwan }</span></li>
							<li><span class="num-1">${pqian }</span></li>
							<li class="comma">,</li>
							<li><span class="num-0">${pbei }</span></li>
							<li><span class="num-5">${pshi }</span></li>
							<li><span class="num-5">${pgew }</span></li>
						</ul>
					</div>
					<div id="sps" style="display: none">1</div>
					<div id="zhuces" class="total"
						style="padding: 10px 15px; height: 80px; width: 238px; overflow: hidden; border: 1px solid #e4e4e4; border-bottom: none; display: none">
						<h2
							style="padding: 8px 0 10px; font-size: 12px; font-weight: 400;">
							注册·<span id="J_countName">企业数量</span>
						</h2>
						<ul
							style="height: 26px; overflow: hidden; width: 240px; margin-left: 10px; margin-top: 5px;"
							class="countNum" id="J_countNum"
							data-count="102325426,1298418,1055">
							<li><span class="num-0"><i>0</i><i>1</i><i>2</i><i>3</i><i>4</i><i>5</i><i>6</i><i>7</i><i>8</i><i>9</i></span></li>
							<li class="comma">,</li>
							<li><span class="num-0"><i>0</i><i>1</i><i>2</i><i>3</i><i>4</i><i>5</i><i>6</i><i>7</i><i>8</i><i>9</i></span></li>
							<li><span class="num-0">${wan }</span></li>
							<li><span class="num-1">${qian }</span></li>
							<li class="comma">,</li>
							<li><span class="num-0">${bei }</span></li>
							<li><span class="num-5">${shi }</span></li>
							<li><span class="num-5">${gew }</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- 缺货型号，已删除start --%>
	<%-- <div style="width: 100%">
		<div style="width: 1200px; margin: 0 auto;">
			<div id=""
				style="margin-top: 20px; float: left; height: 38px; width: 1187px; font-size: 20px; border-bottom: none; background-color: #DDDDDD;">
				<p
					style="display: inline-block; padding: 8px 80px 0 50px; height: 34px; font-size: 20px; background-color: white; border-top: 3px #E4E4E4 solid; border-left: 1px #DDDDDD solid;">缺货型号
				</p>
				<p style="margin-top: -37px; font-size: 9px; margin-left: 130px;"
					class="zheng">
					<img alt="" style="width: 45px;" src="logo/top100g.gif">
				</p>
			</div>
			<div
				style="float: left; width: 1185px; height: 300px; border: 1px #E4E4E4 solid; border-top: none;">
				<div class="ck-slide3"
					style="float: left; width: 1185px; height: 300px; overflow: hidden; margin-left: 10px;">
					<ul class="ck-slide-wrapper"
						style="height: 300px; border-top: none; width: 1185px;">
						<li
							style="float: left; width: 1185px; height: 300px; border-top: none; text-overflow: hidden; padding: 10px 0 0 0;">
							<c:forEach items="${rand}" var="brand" varStatus="status"
								begin="0" end="49">
								<p title="${brand.timertask }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 15px;">${brand.timertask }</p>
							</c:forEach>
						</li>
						<li
							style="float: left; width: 1185px; border-top: none; height: 300px; text-overflow: hidden; display: none;">
							<c:forEach items="${rand}" var="brand" varStatus="status"
								begin="51" end="100">
								<p title="${brand.timertask }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 15px;">${brand.timertask }</p>
							</c:forEach>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div> --%>
	<%-- 缺货型号，已删除end --%>
	<div style="width: 100%">
		<div style="width: 1200px; margin: 0 auto;">
			<div id=""
				style="margin-top: 20px; float: left; width: 1187px; font-size: 20px; border-bottom: none; background-color: #DDDDDD;">
				<span
					style="display: inline-block; padding: 0 30px; line-height: 34px; font-size: 20px; background-color: white; border-top: 3px #E4E4E4 solid; border-left: 1px #DDDDDD solid;">新加入供应商</span>
			</div>
			<div
				style="float: left; width: 1185px; height: 240px; border: 1px #E4E4E4 solid; border-top: none;">
				<div class="ck-slide2"
					style="float: left; width: 1185px; height: 240px; overflow: hidden; margin-left: 10px;">
					<ul class="ck-slide-wrapper"
						style="height: 240px; border-top: none; width: 1185px;">
						<li
							style="float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; padding: 10px 0 0 0;">
							<c:forEach items="${supplier}" var="brand" varStatus="status"
								begin="0" end="39">
								<p title="${brand.suppliername }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 15px;">${brand.suppliername }</p>
							</c:forEach>
						</li>
						<li
							style="float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
							<c:forEach items="${supplier}" var="brand" varStatus="status"
								begin="41" end="80">
								<p title="${brand.suppliername }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
							</c:forEach>
						</li>
						<li
							style="float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
							<c:forEach items="${supplier}" var="brand" varStatus="status"
								begin="81" end="120">
								<p title="${brand.suppliername }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
							</c:forEach>
						</li>
						<li
							style="float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
							<c:forEach items="${supplier}" var="brand" varStatus="status"
								begin="121" end="160">
								<p title="${brand.suppliername }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
							</c:forEach>
						</li>
						<li
							style="float: left; width: 1185px; height: 240px; border-top: none; text-overflow: hidden; display: none">
							<c:forEach items="${supplier}" var="brand" varStatus="status"
								begin="161" end="200">
								<p title="${brand.suppliername }"
									style="width: 210px; text-align: left; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 20px;">${brand.suppliername }</p>
							</c:forEach>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<br>
	<p style="clear: both;"></p>
	<div style="margin-top: 20px;">
		<div style="margin-top: 30px"></div>
		<div style="margin-top: 30px;">
			<table
				style="border-collapse: collapse; width: 1185px; text-align: center;"
				class="sort_table" cellpadding="0" cellspacing="0">
				<tr class="index_tr" style="text-align: left;">
					<td class="index_td" style="border: none;" colspan="6">
						<div id="oval"
							style="float: left; width: 160px; height: 30px; background: #28004D; -webkit-border-radius: 100px/50px; -moz-border-radius: 100px/50px; border-radius: 100px/50px;">
							<span
								style="margin-left: 30px; font-weight: bold; color: white; margin-top: 3px; position: absolute;">
								在线购最新上架 </span>
						</div>
					</td>
				</tr>
				<tr style="font-size: 16px; border: 1px solid #3A006F;">
					<td style="background-color: #3A006F; color: white;">图片</td>
					<td style="background-color: #3A006F; color: white;">型号</td>
					<td style="background-color: #3A006F; color: white;">品牌</td>
					<td style="background-color: #3A006F; color: white;">批号</td>
					<td style="background-color: #3A006F; color: white;">封装</td>
					<td style="background-color: #3A006F; color: white;">库存</td>
					<td style="background-color: #3A006F; color: white;">样品价格</td>
					<td style="background-color: #3A006F; color: white;">购买/购物车</td>
				</tr>
				<tr class="index_tr1" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('ENC28J60/SS')"> <img
							class="tu" data-uid="760c01b4dd7c4aae95fcb07dbd0f5974"
							style="width: 50px; height: 50px;"
							src="http://www.zikezhi.com:80/upload/760c01b4dd7c4aae95fcb07dbd0f5974ENC28J60%20SS.png" />
					</a></td>
					<td width="215px;"><a title="ENC28J60/SS" target="_target"
						href="javascript:;" onclick="sousuo('ENC28J60/SS')">ENC28J60/SS</a>
					</td>
					<td width="120px;">MICROCHIP</td>
					<td width="120px;">17+</td>
					<td width="120px;">SSOP28</td>
					<td width="120px;">200（一个起售）</td>
					<td width="120px;">8.3元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('760c01b4dd7c4aae95fcb07dbd0f5974')">
									立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="50.0" data-uid="760c01b4dd7c4aae95fcb07dbd0f5974"
									data-product="ENC28J60/SS"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>

				<tr class="index_tr1" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('SHT20')"> <img class="tu"
							data-uid="9341f907f13c40ca9699ea9734a24dbb"
							style="width: 50px; height: 50px;"
							src="http://www.zikezhi.com:80/upload/9341f907f13c40ca9699ea9734a24dbbSHT20.png" />
					</a></td>
					<td width="215px;"><a title="SHT20" target="_target"
						href="javascript:;" onclick="sousuo('SHT20')">SHT20</a></td>
					<td width="120px;">SENSIRION</td>
					<td width="120px;">17+</td>
					<td width="120px;">DFN6</td>
					<td width="120px;">300（一个起售）</td>
					<td width="120px;">6.3元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('9341f907f13c40ca9699ea9734a24dbb')">
									立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="7.5" data-uid="9341f907f13c40ca9699ea9734a24dbb"
									data-product="SHT20"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>

				<tr class="index_tr1" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('NRF52832-QFAA-R')"> <img
							class="tu" data-uid="b8f24dd8ddea4105a9270eb89c0c854c"
							style="width: 50px; height: 50px;"
							src="http://www.zikezhi.com:80/upload/b8f24dd8ddea4105a9270eb89c0c854cNRF52832-QFAA-R.png" />
					</a></td>
					<td width="215px;"><a title="NRF52832-QFAA-R" target="_target"
						href="javascript:;" onclick="sousuo('NRF52832-QFAA-R')">NRF52832-QFAA-R</a>
					</td>
					<td width="120px;">NORDIC</td>
					<td width="120px;">17+</td>
					<td width="120px;">QFN48</td>
					<td width="120px;">155（一个起售）</td>
					<td width="120px;">10.5元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('b8f24dd8ddea4105a9270eb89c0c854c')">
									立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="10.8" data-uid="b8f24dd8ddea4105a9270eb89c0c854c"
									data-product="NRF52832-QFAA-R"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>

				<tr class="index_tr1" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('QMC5883L')"> <img
							class="tu" data-uid="e9356d5868ab40c38c36e65026f41755"
							style="width: 50px; height: 50px;"
							src="http://www.zikezhi.com:80/upload/e9356d5868ab40c38c36e65026f41755QMC5883L.png" />
					</a></td>
					<td width="215px;"><a title="QMC5883L" target="_target"
						href="javascript:;" onclick="sousuo('QMC5883L')">QMC5883L</a></td>
					<td width="120px;">QST</td>
					<td width="120px;">17+</td>
					<td width="120px;">QFN16</td>
					<td width="120px;">770（一个起售）</td>
					<td width="120px;">5.5元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('e9356d5868ab40c38c36e65026f41755')">
									立即购买 </a>

							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="0.95" data-uid="e9356d5868ab40c38c36e65026f41755"
									data-product="QMC5883L"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>
			</table>
		</div>
		<div style="margin-top: 30px;">
			<table
				style="border-collapse: collapse; width: 1185px; text-align: center;"
				class="sort_table" cellpadding="0" cellspacing="0">
				<tr class="index_tr" style="text-align: left;">
					<td class="index_td" style="border: none;" colspan="6">
						<div id="oval"
							style="float: left; width: 160px; height: 30px; background: #28004D; -webkit-border-radius: 100px/50px; -moz-border-radius: 100px/50px; border-radius: 100px/50px;">
							<span
								style="margin-left: 30px; font-weight: bold; color: white; margin-top: 3px; position: absolute;">
								在线购热门型号 </span>
						</div>
					</td>
				</tr>
				<tr style="font-size: 16px; border: 1px solid #3A006F;">
					<td style="background-color: #3A006F; color: white;">图片</td>
					<td style="background-color: #3A006F; color: white;">型号</td>
					<td style="background-color: #3A006F; color: white;">品牌</td>
					<td style="background-color: #3A006F; color: white;">批号</td>
					<td style="background-color: #3A006F; color: white;">封装</td>
					<td style="background-color: #3A006F; color: white;">库存</td>
					<td style="background-color: #3A006F; color: white;">样品价格</td>
					<td style="background-color: #3A006F; color: white;">购买/购物车</td>
				</tr>
				<tr class="index_tr2" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('SSD1963QL9')"> <img
							class="tu" data-uid="25a46c760e8e45e0b0a7155f6d1bcf6b"
							style="width: 50px; height: 50px;"
							src="upload/25a46c760e8e45e0b0a7155f6d1bcf6bSSD1963QL9.png" />
					</a></td>
					<td width="215px;"><a title="SSD1963QL9" target="_target"
						href="javascript:;" onclick="sousuo('SSD1963QL9')">SSD1963QL9</a>
					</td>
					<td width="120px;">SOLOMON</td>
					<td width="120px;">17+</td>
					<td width="120px;">LQFP128</td>
					<td width="120px;">3480（一个起售）</td>
					<td width="120px;">14.9元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('25a46c760e8e45e0b0a7155f6d1bcf6b')">
									立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="14.89" data-uid="25a46c760e8e45e0b0a7155f6d1bcf6b"
									data-product="SSD1963QL9"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>
				<tr class="index_tr2" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('STM32F103C8T6')"> <img
							class="tu" data-uid="a0c996ceff134bba88b60e06f35420fa"
							style="width: 50px; height: 50px;"
							src="upload/a0c996ceff134bba88b60e06f35420faSTM32F103C8T6.png" />
					</a></td>
					<td width="215px;"><a title="STM32F103C8T6" target="_target"
						href="javascript:;" onclick="sousuo('STM32F103C8T6')">STM32F103C8T6</a>
					</td>
					<td width="120px;">ST</td>
					<td width="120px;">17+</td>
					<td width="120px;">LQFP48</td>
					<td width="120px;">370（一个起售）</td>
					<td width="120px;">6.9元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('a0c996ceff134bba88b60e06f35420fa')">
									立即购买 </a>

							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="7.05" data-uid="a0c996ceff134bba88b60e06f35420fa"
									data-product="STM32F103C8T6"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>
				<tr class="index_tr2" style="height: 80px; width: 1185px;">
					<td width="120px;"><a class="apreview" target="_target"
						href="javascript:;" onclick="sousuo('STM32F405RGT6')"> <img
							class="tu" data-uid="c883538f9437409eafc43ec51804d7ec"
							style="width: 50px; height: 50px;"
							src="upload/c883538f9437409eafc43ec51804d7ecSTM32F405RGT6 (1).png" />
					</a></td>
					<td width="215px;"><a title="STM32F405RGT6" target="_target"
						href="javascript:;" onclick="sousuo('STM32F405RGT6')">STM32F405RGT6</a>
					</td>
					<td width="120px;">ST</td>
					<td width="120px;">17+</td>
					<td width="120px;">LQFP64</td>
					<td width="120px;">60（一个起售）</td>
					<td width="120px;">22.5 元</td>
					<td width="110px;"><c:if
							test="${sessionScope.userName == null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;" class="goLogin"> 立即购买 </a>
							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="goLogin"> 加入购物车 </a>
							</p>
						</c:if> <c:if test="${sessionScope.userName != null}">
							<p>
								<a
									style="position: relative; padding: 5px 14px; background: #2E2E2E; color: #fff; height: 25px; line-height: 25px; vertical-align: middle; border-right: 1px #B4B4B4 solid;"
									href="javascript:;"
									onclick="doSwithTab('c883538f9437409eafc43ec51804d7ec')">
									立即购买 </a>

							</p>
							<p style="margin-top: 6px;">
								<a href="javascript:;"
									style="position: relative; padding: 5px 8px; background: #5D5D5D; color: #fff; height: 25px; line-height: 25px; vertical-align: middle;"
									class="xuanzhe" data-remodal-target="xuanzheli"
									data-price="23.0" data-uid="c883538f9437409eafc43ec51804d7ec"
									data-product="STM32F405RGT6"> 加入购物车 </a>
							</p>
						</c:if></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="to_top"
		style="display: none; position: fixed; right: 45px; bottom: 110px; background-color: #aaa; cursor: hand; height: 30px; width: 30px; font-size: 12px; color: white; display: inline-block; background-image: url(img/fding.png);"
		title="返回顶端"></div>
	<div style="width: 1185px; margin-top: 30px; text-align: center;">
		<span>新手指南&#8195;</span> <span>|&#8195;<a href="frontLogin">注册登录</a>&#8195;
		</span> <span>|&#8195;用户协议&#8195;</span> <span>|&#8195;支付方式&#8195;</span> <span>|&#8195;在线支付&#8195;</span>
		<span>|&#8195;银行汇款&#8195;</span> <span>|&#8195;特色服务&#8195;</span> <span>|&#8195;积分返现&#8195;</span>
		<span>|&#8195;<a href="javasctipt:;" onclick="addFavorite2()"
			title='自可知电子查询网' rel="sidebar">加入收藏</a>&#8195;
		</span> <span>|&#8195;关于库存&#8195;</span> <span>|&#8195;关于免费&#8195;</span> <span>|&#8195;关于自可知&#8195;</span>
		<span>|&#8195;联系我们&#8195;</span> <span>|&#8195;<a
			href="javascript:showBg();">在线留言</a></span>
		<hr
			style="border: 1px solid #3A006F; margin-top: 0px;; width: 1185px;" />
	</div>
	<div style="margin-top: -130px;">
		<%@ include file="include/footer.jsp"%>
	</div>
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
							style="width: 239px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="text" name="telephone" class="ipt" placeholder="手机号码"
							required>
					</div>

					<div class="group-ipt password">
						<img alt="" src="logo/loginmima.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 239px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
							type="password" name="password" id="password" class="ipt"
							placeholder="输入您的登录密码" required>
					</div>

					<div class="group-ipt verify">
						<img alt="" src="logo/loginyzm.png"
							style="position: absolute; margin-top: 2px;"> <input
							style="width: 139px; height: 40px; padding-left: 80px; box-shadow: 40px 40px 40px 40px white inset;"
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
			p_uid = $(this).data("uid");
			$.post("addCart?pid=" + p_uid, function(data) {
				if (data.result == "fail") {
					swal({
						title : "系统提示",
						text : data.errorMsg,
						type : "success",
						confirmButtonColor : "#007AFF"
					});
				} else if (data.result == "seccuss") {
					window.location.href = "cartback?pid=" + p_uid;
				}
			})
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
</script>
<script type="text/javascript">
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
<script>
	$('.ck-slide').ckSlide({
		autoPlay : true,//默认为不自动播放，需要时请以此设置
		dir : 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
		interval : 4000
	//默认间隔2000毫秒

	});
	$('.ck-slide2').ckSlide({
		autoPlay : true,//默认为不自动播放，需要时请以此设置
		dir : 'y',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
		interval : 13000
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
</html>