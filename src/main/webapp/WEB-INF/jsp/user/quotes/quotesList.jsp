<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>在芯间用户系统-bom询价</title>
	<link rel="shortcut icon" href="img/tu.png" type="image/x-icon"/>
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/Hui-iconfont/1.0.7/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/icheck/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
	<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
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
				<dt style="border: none;">
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
					<c:if test="${biaozi==2 }">
						<li class="active"><span title="个人信息" data-href="userinfo">个人信息</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==1 }">
						<li class="active"><span title="我的订单" data-href="express">我的订单</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==3 }">
						<li class="active"><span title="我的购物车" data-href="myCart">我的购物车</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==4 }">
						<li class="active"><span title="收货地址" data-href="MyAddress">地址管理</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==5 }">
						<li class="active"><span title="添加地址" data-href="MyAddress">添加地址</span><em></em></li>
					</c:if>
					<c:if test="${upaddress eq 'upaddress' }">
						<li class="active"><span title="修改地址" data-href="MyAddress">修改地址</span><em></em></li>
					</c:if>
					<c:if test="${cashback eq 'cashback' }">
						<li class="active"><span title="会员返现" data-href="cashback">会员返现</span><em></em></li>
					</c:if>
					<c:if test="${booking eq 'booking' }">
						<li class="active"><span title="库存寄售" data-href="cashback">库存寄售</span><em></em></li>
					</c:if>
					<c:if test="${addbooking eq 'addbooking' }">
						<li class="active"><span title="添加代售" data-href="cashback">添加代售</span><em></em></li>
					</c:if>
					<c:if test="${bomuserAll eq 'bomuserAll' }">
						<li class="active"><span title="bom表订单" data-href="querybomuser">bom订单</span><em></em></li>
					</c:if>
					<c:if test="${inquiryAll eq 'inquiryAll' }">
						<li class="active"><span title="询价记录" data-href="cashback">询价记录</span><em></em></li>
					</c:if>
					<c:if test="${quotesAll eq 'quotesAll' }">
						<li >
							<nav class="zznav" style="margin-top: 11px;margin-left: 13px;">
								<a href="usersystem">首页</a>
								<a href="QuotesByuser" class="selected">bom表询价</a>
								<a target="blank" href="aboutus">关于我们</a>
							</nav>
						</li>
					</c:if>
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
				<div style="display: none" class="loading"></div>
				<div class="page-container">
				<a name="top"></a>
					<div style="margin-top: 40px;"></div>
					<div class="mt-20" >
						<table  border="1" style="border: 1px #EEEEEE solid;border-collapse: collapse;">
							<thead  style="border-bottom:2px solid #EEEEEE;background-color: #BCBFFD;">
								<tr >
									<th style="border-right: 2px solid #EEEEEE;height: 40px;color: black;font-weight: bold;text-align: center;">标题</th>
									<th style="border-right: 2px solid #EEEEEE;height: 40px;color: black;font-weight: bold;text-align: center;">bom表</th>
									<th style="border-right: 2px solid #EEEEEE;height: 40px;color: black;font-weight: bold;text-align: center;">说明</th>
									<th style="border-right: 2px solid #EEEEEE;height: 40px;color: black;font-weight: bold;text-align: center;">状态</th>
									<th style="border-right: 2px solid #EEEEEE;height: 40px;color: black;font-weight: bold;text-align: center;">时间</th>
									<th style="border-right: 2px solid #EEEEEE;height: 40px;color: black;font-weight: bold;text-align: center;">操作</th>
								</tr>
								<tr style="height: 20px;"></tr>
							</thead>
							<tbody >
								<c:forEach items="${quotes}" var="quotes" varStatus="status">
									<tr class="hello" >
										<td style="height: 40px;text-align: center;">bom表询价</td>
										<td style="height: 40px;text-align: center;">
											<c:if test="${quotes.quotes_name !=null }">
												<c:if test="${quotes.quotes_status ==1 }">
													<a style="text-decoration:none" class="ml-5" onClick="window.location='download?quotes_name=${quotes.quotes_name}'" href="javascript:;" title="查看询价">
														<img alt="查看询价" src="img/bom_ic03.png" style="width: 50px;height: 50px;">
													</a>
												</c:if>
												<c:if test="${quotes.quotes_status ==2 }">
													<a style="text-decoration:none" class="ml-5" onClick="window.location='download?quotes_name=${quotes.quotes_name}'" href="javascript:;" title="查看询价">
														<img alt="查看询价" src="img/bom.png" style="width: 50px;height: 50px;">
													</a>
												</c:if>
											</c:if>
											<c:if test="${quotes.quotes_name ==null }">
												<a style="text-decoration:none" class="ml-5" onClick="window.location='quotesDatil?quotes_id=${quotes.quotes_id}'" href="javascript:;" title="查看询价">
													多型号拷贝
												</a>
											</c:if>
										</td>
										<td style="height: 40px;text-align: center;">
											<c:if test="${quotes.quotes_description !=null }">
												${quotes.quotes_description}
											</c:if>
											<c:if test="${quotes.quotes_description ==null }">
												审核中
											</c:if>
										</td>
										<td class="fan" style="height: 40px;text-align: center;">
											<c:if test="${quotes.quotes_status ==1 }">
												审核中
											</c:if>
											<c:if test="${quotes.quotes_status ==2 }">
												已报价
											</c:if>
										</td>
										<td style="height: 40px;text-align: center;">
											<fmt:formatDate value="${quotes.quotes_date}" pattern="yyyy-MM-dd"/>
										</td>
										<td style="height: 40px;text-align: center;">
											<c:if test="${quotes.quotes_name !=null }">
												<c:if test="${quotes.quotes_status ==1 }">
													<a style="text-decoration:none" class="ml-5" onClick="window.location='download?quotes_name=${quotes.quotes_name}'" href="javascript:;" title="查看询价">
														查看询价
													</a>
												</c:if>
												<c:if test="${quotes.quotes_status ==2 }">
													<a style="text-decoration:none" class="ml-5" onClick="window.location='download?quotes_name=${quotes.quotes_connet}'" href="javascript:;" title="查看报价">
														查看报价
													</a>
												</c:if>
											</c:if>
											<c:if test="${quotes.quotes_name ==null }">
												<c:if test="${quotes.quotes_status ==1 }">
													<a style="text-decoration:none" class="ml-5" onClick="window.location='quotesDatil?quotes_id=${quotes.quotes_id}'" href="javascript:;" title="查看询价">
														查看询价
													</a>
												</c:if>
												<c:if test="${quotes.quotes_status ==2 }">
													<a style="text-decoration:none" class="ml-5" onClick="window.location='download?quotes_name=${quotes.quotes_connet}'" href="javascript:;" title="查看报价">
														查看报价
													</a>
												</c:if>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
						<%@include file="../../../../include/footer.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%-- <div style="width: 100%;height: 27px;margin-top: 3px;">
       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
       </div> --%>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
$(function(){
	var td = $(".hello td");  
    td.mouseover(function () {  
        $(this).css("background-color", "#AEF2E5");  
    }).mouseout(function () {  
        $(this).css("background-color", "#FFFFFF");  
    });
});
</script>
</body>
</html>