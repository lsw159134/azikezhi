<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/style.css" />
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<title>自可知后台系统</title>
</head>

<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl" style="background: #000000">
				<span class="logo navbar-logo f-l mr-10 hidden-xs">&nbsp;&nbsp;&nbsp;&nbsp;自可知后台系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A"><i class="Hui-iconfont">&#xe6d5;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="frontLogin">切换账户</a></li>
								<li><a href="userOut">退出</a></li>
							</ul></li>
						<!--<li id="Hui-msg">
								<a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a>
							</li>-->
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A" title="换肤">
								<i class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="orange" title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
								<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside"  style="background: #BEDEFE">
		<input type="hidden"  id="supplieruid" value=""/>
		<div class="menu_dropdown bk_2">
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/cont" data-title="首页" >首页</a>
				</dt>
			</dl>
			<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
				<!-- 超级管理员模块 -->
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/cartAll" data-title="购物车" >购物车</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryAllProduct" data-title="商城产品管理" href="javascript:;">在线购产品管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryResistinceList" data-title="贴片电阻管理" href="javascript:;">贴片电阻管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/express" data-title="订单管理" href="javascript:;">订单管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/withdrawAL" data-title="提现申请" href="javascript:;">提现申请</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/admin_List" data-title="管理员列表" href="javascript:;">管理员列表</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryPrimaryAll" data-title="分类目录" href="javascript:;">分类目录</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/seleSupplierRemarksAdmin" data-title="供应商备注" href="javascript:;">供应商备注</a>
					</dt>
				</dl>
				<!-- 供应商 -->
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/supplierList" data-title="供应商管理" href="javascript:;">供应商管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/SupplierAllProduct" data-title="用户管理" href="javascript:;">供应商产品</a>
					</dt>
				</dl>
				<!-- end供应商 -->
				
				<!-- 被动供应商 -->
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/classificationList" data-title="被动分类" href="javascript:;">被动分类</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/passiveList" data-title="被动分类" href="javascript:;">被动器件商家</a>
					</dt>
				</dl>
				<!-- end被动供应商 -->
				
				<!-- 用户 -->
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryUserInfoAll" data-title="用户管理" href="javascript:;">用户管理</a>
					</dt>
				</dl>
				<!-- 用户end -->
				 
				<!-- 询/报价 -->
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryByInquiry" data-title="询价记录" href="javascript:;">询价/采购记录</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/quoteAllAdmin" data-title="询价记录" href="javascript:;">报价记录</a>
					</dt>
				</dl>
				<!-- end询/报价 -->
				
				<!-- 公共 -->
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/messageAll" data-title="用户管理" href="javascript:;">留言信息</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/seleProductque" data-title="用户管理" href="javascript:;">缺货型号</a>
					</dt>
				</dl>
				<!-- 公共 -->
				<!-- 超级管理员模块 -->
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'm')}">
					<!-- 购物车 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/cartAll" data-title="购物车" >购物车</a>
						</dt>
					</dl>
					<!-- 购物车end -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'ab')}">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryResistinceList" data-title="贴片电阻管理" href="javascript:;">贴片电阻管理</a>
					</dt>
				</dl>
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'a')}">
					<!-- 在线购产品 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryAllProduct" data-title="产品管理" href="javascript:;">在线购产品管理</a>
						</dt>
					</dl>
					<!-- end在线购产品 -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'b')}">
					<!-- 分类 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryPrimaryAll" data-title="分类目录" href="javascript:;">分类目录</a>
						</dt>
					</dl>
					<!-- 分类end -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'c')}">
					<!-- 订单管理 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/express" data-title="订单管理" href="javascript:;">订单管理</a>
						</dt>
					</dl>
					<!-- end订单管理 -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'd')}">
					<!-- 提现管理 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/withdrawAL" data-title="提现申请" href="javascript:;">提现申请</a>
						</dt>
					</dl>
					<!-- end提现管理 -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'p')}">
					<!-- 供应商 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/seleSupplierRemarksAdmin" data-title="供应商备注" href="javascript:;">供应商备注</a>
						</dt>
					</dl>
					<!-- end供应商 -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'e')}">
					<!-- 供应商 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/supplierList" data-title="供应商管理" href="javascript:;">供应商管理</a>
						</dt>
					</dl>
					<!-- end供应商 -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'f')}">
					<!-- 供应商 产品-->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/SupplierAllProduct" data-title="用户管理" href="javascript:;">供应商产品</a>
						</dt>
					</dl>
					<!-- end供应商产品 -->
				</c:if>
				
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'g')}">
					<!-- 被动供应商分类 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/classificationList" data-title="被动分类" href="javascript:;">被动分类</a>
						</dt>
					</dl>
					<!-- end被动供应商分类 -->
					<!-- 被动供应商 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/passiveList" data-title="被动分类" href="javascript:;">被动器件商家</a>
						</dt>
					</dl>
					<!-- end被动供应商 -->
				</c:if>
				
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'h')}">
					
				</c:if>
				
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'i')}">
					<!-- 用户 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryUserInfoAll" data-title="用户管理" href="javascript:;">用户管理</a>
						</dt>
					</dl>
					<!-- 用户end -->
				</c:if>
				
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'j')}">
					<!-- 询/报价 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryByInquiry" data-title="询价记录" href="javascript:;">询价/采购记录</a>
						</dt>
					</dl>
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/quoteAllAdmin" data-title="询价记录" href="javascript:;">报价记录</a>
						</dt>
					</dl>
					<!-- end询/报价 -->
				</c:if>
				
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'k')}">
					<!-- 留言 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/messageAll" data-title="用户管理" href="javascript:;">留言信息</a>
						</dt>
					</dl>
					<!-- 留言end -->
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'l')}">
					<!-- 缺货型号 -->
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/seleProductque" data-title="用户管理" href="javascript:;">缺货型号</a>
						</dt>
					</dl>
					<!-- 缺货型号end -->
				</c:if>
				<c:if test="${sessionScope.user.admin_adminName eq '钟镇东'}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/admin_List" data-title="管理员列表" href="javascript:;">管理员列表</a>
						</dt>
					</dl>
				</c:if>
			</c:if>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box" style="background: #F1F1F1">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: #BEDEFE">
			<div class="Hui-tabNav-wp" >
				<ul id="min_title_list" class="acrossTab cl">
					<c:if test="${adminHome eq 'adminHome' }">
						<li class="active"><span title="首页" data-href="home">首页</span><em></em></li>
					</c:if>
					<c:if test="${productHome eq 'productHome' }">
						<li class="active"><span title="产品管理" data-href="product">在线购产品管理</span><em></em></li>
					</c:if>
				    <c:if test="${dianzu eq 'dianzu' }">
						<li class="active"><span title="电阻产品管理" data-href="product">贴片电阻管理</span><em></em></li>
					</c:if> 
					<c:if test="${addUser eq 'addUser' }">
						<li class="active"><span title="添加产品" data-href="addProduct">添加产品</span><em></em></li>
					</c:if>
					<c:if test="${addDianzu eq 'addDianzu' }">
						<li class="active"><span title="添加电阻产品" data-href="addResistince">添加电阻产品</span><em></em></li>
					</c:if>
					<c:if test="${updateProduct eq 'updateProduct' }">
						<li class="active"><span title="修改产品" data-href="updateProduct">修改产品</span><em></em></li>
					</c:if>
					<c:if test="${updateDianzu eq 'updateDianzu' }">
						<li class="active"><span title="修改产品" data-href="updateDianzu">修改电阻产品</span><em></em></li>
					</c:if>
					<c:if test="${withdrawAL eq 'withdrawAL' }">
						<li class="active"><span title="修改价格区间" data-href="withdrawAL">提现申请</span><em></em></li>
					</c:if>
					<c:if test="${expressAll eq 'expressAll' }">
						<li class="active"><span title="会员返现" data-href="cashback">所有订单</span><em></em></li>
					</c:if>
					<c:if test="${expressDetails eq 'expressDetails' }">
						<li class="active"><span title="库存寄售" data-href="cashback">订单详情</span><em></em></li>
					</c:if>
					<c:if test="${supplierList eq 'supplierList' }">
						<li class="active"><span title="供应商管理" data-href="cashback">供应商管理</span><em></em></li>
					</c:if>
					<c:if test="${addSupplier eq 'addSupplier' }">
						<li class="active"><span title="添加供应商" data-href="cashback">添加供应商</span><em></em></li>
					</c:if>
					<c:if test="${adminList eq 'adminList' }">
						<li class="active"><span title="管理员列表" data-href="cashback">管理员列表</span><em></em></li>
					</c:if>
					<c:if test="${inadmin eq 'inadmin' }">
						<li class="active"><span title="添加管理员" data-href="cashback">添加管理员</span><em></em></li>
					</c:if>
					<c:if test="${editadmin eq 'editadmin' }">
						<li class="active"><span title="修改管理员" data-href="cashback">修改管理员</span><em></em></li>
					</c:if>

					<c:if test="${primaryAll eq 'primaryAll' }">
						<li class="active"><span title="分类目录" data-href="cashback">分类目录</span><em></em></li>
					</c:if>
					<c:if test="${purchaseAll eq 'purchaseAll' }">
						<li class="active"><span title="采购记录" data-href="cashback">采购记录</span><em></em></li>
					</c:if>
					<c:if test="${inquiryAll eq 'inquiryAll' }">
						<li class="active"><span title="询价记录" data-href="cashback">询价记录</span><em></em></li>
					</c:if>
					<c:if test="${quotesAll eq 'quotesAll' }">
						<li class="active"><span title="bom表询价" data-href="cashback">bom表询价</span><em></em></li>
					</c:if>
				
					<c:if test="${printrecordAll eq 'printrecordAll' }">
						<li class="active"><span title="打印记录" data-href="cashback">打印记录</span><em></em></li>
					</c:if>
					<c:if test="">
						<li class="active"><span title="打印记录" data-href="cashback">供应商产品</span><em></em></li>
					</c:if>
					<c:if test="${upSupplierProduct eq 'upSupplierProduct' }">
						<li class="active"><span title="打印记录" data-href="cashback">供应商修改</span><em></em></li>
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
			<div class="show_iframe" style="background: #F1F1F1">
				<div style="display: none" class="loading"></div>
				<!-- 首页 -->
				<c:if test="${adminHome eq 'adminHome' }">
					<jsp:include page="contText.jsp" />
				</c:if>
				<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
					<!-- 在限购产品 -->
					<c:if test="${productHome eq 'productHome' }">
						<jsp:include page="productList.jsp" />
					</c:if>
					<c:if test="${dianzu eq 'dianzu' }">
						<jsp:include page="dianzu.jsp" />
					</c:if>
					<!-- 添加产品 -->
					<c:if test="${addUser eq 'addUser' }">
						<jsp:include page="addProductText.jsp" />
					</c:if>
						<c:if test="${addDianzu eq 'addDianzu' }">
						<jsp:include page="adddianzu.jsp" />
					</c:if>
					<!-- 修改产品信息 -->
					<c:if test="${updateProduct eq 'updateProduct' }">
						<jsp:include page="updateProductText.jsp" />
					</c:if>
						<c:if test="${updateDianzu eq 'updateDianzu' }">
						<jsp:include page="updateDianzu.jsp" />
					</c:if>
					<!-- 提现申请 -->
					<c:if test="${withdrawAL eq 'withdrawAL' }">
						<jsp:include page="admin/admin-withdrawal.jsp" />
					</c:if>
					<!-- 所有订单 -->
					<c:if test="${expressAll eq 'expressAll' }">
						<jsp:include page="admin/admin-express.jsp" />
					</c:if>
					<!-- 订单详情 -->
					<c:if test="${expressDetails eq 'expressDetails' }">
						<jsp:include page="admin/admin-details.jsp" />
					</c:if>
					
					<!-- 供应商管理 -->
					<c:if test="${supplierList eq 'supplierList' }">
						<jsp:include page="admin/supplier/supplier.jsp" />
					</c:if>
					<!-- 添加供应商 -->
					<c:if test="${addSupplier eq 'addSupplier' }">
						<jsp:include page="admin/supplier/addSupplier.jsp" />
					</c:if>
					<!-- 修改供应商信息 -->
					<c:if test="${upSupplier eq 'upSupplier' }">
						<jsp:include page="admin/supplier/upSupplier.jsp" />
					</c:if>
					<!-- 管理员列表 -->
					<c:if test="${adminList eq 'adminList' }">
						<jsp:include page="Administration/adminList.jsp" />
					</c:if>
					<!-- 管理员添加 -->
					<c:if test="${inadmin eq 'inadmin' }">
						<jsp:include page="Administration/addAdmin.jsp" />
					</c:if>
					<!-- 管理员修改 -->
					<c:if test="${editadmin eq 'editadmin' }">
						<jsp:include page="Administration/upAdmin.jsp" />
					</c:if>
					<!-- 购物车 -->
					<c:if test="${cartAdmin eq 'cartAdmin' }">
						<jsp:include page="cart/admin-cart.jsp" />
					</c:if>
					
					<!-- 分类目录 -->
					<c:if test="${primaryAll eq 'primaryAll' }">
						<jsp:include page="admin/primary/primaryList.jsp" />
					</c:if>
				
					<!-- 询价/采购 -->
					<c:if test="${inquiryAll eq 'inquiryAll' }">
						<jsp:include page="admin/inquiry/inquiryList.jsp" />
					</c:if>
					
					<!-- 打印记录 -->
					<c:if test="${printrecordAll eq 'printrecordAll' }">
						<jsp:include page="admin/printrecordAll/admin-printrecord.jsp" />
					</c:if>
					
					<c:if test="${nullData eq 'nullData' }">
						<jsp:include page="nullData.jsp" />
					</c:if>
					<c:if test="${seleNullData eq 'seleNullData' }">
						<jsp:include page="seleNullData.jsp" />
					</c:if>
					<c:if test="${seleQuality eq 'seleQuality' }">
						<jsp:include page="seleQuality.jsp" />
					</c:if>
					<c:if test="${seleDianzu eq 'seleDianzu' }">
						<jsp:include page="seleDianzu.jsp" />
					</c:if>
					<c:if test="${seleUpdateQuality eq 'seleUpdateQuality' }">
						<jsp:include page="seleUpdateQuality.jsp" />
					</c:if>
					
					<!-- 用户 -->
					<c:if test="${userHome eq 'userHome' }">
						<jsp:include page="admin/userInfo/user.jsp" />
					</c:if>
					
					<!-- 留言 -->
					<c:if test="${messageAll eq 'messageAll' }">
						<jsp:include page="admin/message/message.jsp" />
					</c:if>
					
					<!-- 供应商产品 -->
					<c:if test="${supplierProduct eq 'supplierProduct' }">
						<jsp:include page="admin/SupplierProduct/productList.jsp" />
					</c:if>
					
					<!-- 添加供应商产品 -->
					<c:if test="${addSupplierProduct eq 'addSupplierProduct' }">
						<jsp:include page="admin/SupplierProduct/addProduct.jsp" />
					</c:if>
					
					<!-- 修改供应商产品 -->
					<c:if test="${upSupplierProduct eq 'upSupplierProduct' }">
						<jsp:include page="admin/SupplierProduct/upProduct.jsp" />
					</c:if>
					
					<!-- 缺货型号 -->
					<c:if test="${random eq 'random' }">
						<jsp:include page="admin/random.jsp" />
					</c:if>
					
					<!-- 报价 -->
					<c:if test="${quoteAll eq 'quoteAll' }">
						<jsp:include page="admin/quote/quotesList.jsp" />
					</c:if>
					
					<!-- 被动分类 -->
					<c:if test="${classificationAll eq 'classificationAll' }">
						<jsp:include page="admin/classification/classificationList.jsp" />
					</c:if>
					<!-- 被动商家 -->
					<c:if test="${passiveAll eq 'passiveAll' }">
						<jsp:include page="admin/passive/passiveList.jsp" />
					</c:if>
					<!-- 添加被动商家 -->
					<c:if test="${addpassice eq 'addpassice' }">
						<jsp:include page="admin/passive/addpassive.jsp" />
					</c:if>
					<!-- 修改被动商家 -->
					<c:if test="${uppassice eq 'uppassice' }">
						<jsp:include page="admin/passive/uppassive.jsp" />
					</c:if>
					<c:if test="${remarksAll eq 'remarksAll' }">
						<jsp:include page="admin/remarks/remarks.jsp" />
					</c:if>
				</c:if>
				<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'm')}">
						<!-- 购物车 -->
						<c:if test="${cartAdmin eq 'cartAdmin' }">
							<jsp:include page="cart/admin-cart.jsp" />
						</c:if>
						<!-- 购物车end -->
					</c:if>
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'ab')}">
						 <c:if test="${updateDianzu eq 'updateDianzu' }">
						 <jsp:include page="updateDianzu.jsp" />
					     </c:if>
					     <c:if test="${seleDianzu eq 'seleDianzu' }">
						 <jsp:include page="seleDianzu.jsp" />
					     </c:if>
						 <c:if test="${addDianzu eq 'addDianzu' }">
						 <jsp:include page="adddianzu.jsp" />
					     </c:if>
					     <c:if test="${dianzu eq 'dianzu' }">
						 <jsp:include page="dianzu.jsp" />
					     </c:if>
					</c:if>
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'a')}">
						<c:if test="${addUser eq 'addUser' }">
						<jsp:include page="addProductText.jsp" />
					    </c:if>
						<!-- 产品页面 -->
						<c:if test="${productHome eq 'productHome' }">
							<jsp:include page="productList.jsp" />
						</c:if>
						<!-- 添加产品 -->
						<c:if test="${addUser eq 'addUser' }">
							<jsp:include page="addProductText.jsp" />
						</c:if>
						<!-- 修改产品信息 -->
						<c:if test="${updateProduct eq 'updateProduct' }">
							<jsp:include page="updateProductText.jsp" />
						</c:if>
						<c:if test="${nullData eq 'nullData' }">
							<jsp:include page="nullData.jsp" />
						</c:if>
						<c:if test="${seleNullData eq 'seleNullData' }">
							<jsp:include page="seleNullData.jsp" />
						</c:if>
						<c:if test="${seleQuality eq 'seleQuality' }">
							<jsp:include page="seleQuality.jsp" />
						</c:if>
						<c:if test="${seleUpdateQuality eq 'seleUpdateQuality' }">
							<jsp:include page="seleUpdateQuality.jsp" />
						</c:if>
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'b')}">
						<!-- 分类目录 -->
						<c:if test="${primaryAll eq 'primaryAll' }">
							<jsp:include page="admin/primary/primaryList.jsp" />
						</c:if>
						<!-- 分类end -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'c')}">
						<!-- 所有订单 -->
						<c:if test="${expressAll eq 'expressAll' }">
							<jsp:include page="admin/admin-express.jsp" />
						</c:if>
						<!-- 订单详情 -->
						<c:if test="${expressDetails eq 'expressDetails' }">
							<jsp:include page="admin/admin-details.jsp" />
						</c:if>
						<!-- end订单管理 -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'd')}">
						<!-- 提现申请 -->
						<c:if test="${withdrawAL eq 'withdrawAL' }">
							<jsp:include page="admin/admin-withdrawal.jsp" />
						</c:if>
						<!-- end提现管理 -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'e')}">
						<!-- 供应商管理 -->
						<c:if test="${supplierList eq 'supplierList' }">
							<jsp:include page="admin/supplier/supplier.jsp" />
						</c:if>
						<!-- 添加供应商 -->
						<c:if test="${addSupplier eq 'addSupplier' }">
							<jsp:include page="admin/supplier/addSupplier.jsp" />
						</c:if>
						<c:if test="${upSupplier eq 'upSupplier' }">
							<jsp:include page="admin/supplier/upSupplier.jsp" />
						</c:if>
						<!-- end供应商 -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'f')}">
						<!-- 供应商产品 -->
						<c:if test="${supplierProduct eq 'supplierProduct' }">
							<jsp:include page="admin/SupplierProduct/productList.jsp" />
						</c:if>
						
						<!-- 添加供应商产品 -->
						<c:if test="${addSupplierProduct eq 'addSupplierProduct' }">
							<jsp:include page="admin/SupplierProduct/addProduct.jsp" />
						</c:if>
						
						<!-- 修改供应商产品 -->
						<c:if test="${upSupplierProduct eq 'upSupplierProduct' }">
							<jsp:include page="admin/SupplierProduct/upProduct.jsp" />
						</c:if>
						<!-- end供应商产品 -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'g')}">
						<!-- 被动分类 -->
						<c:if test="${classificationAll eq 'classificationAll' }">
							<jsp:include page="admin/classification/classificationList.jsp" />
						</c:if>
						<!-- end被动供应商分类 -->
						<!-- 被动供应商 -->
						<c:if test="${passiveAll eq 'passiveAll' }">
							<jsp:include page="admin/passive/passiveList.jsp" />
						</c:if>
						<!-- 添加被动商家 -->
						<c:if test="${addpassice eq 'addpassice' }">
							<jsp:include page="admin/passive/addpassive.jsp" />
						</c:if>
						<!-- 修改被动商家 -->
						<c:if test="${uppassice eq 'uppassice' }">
							<jsp:include page="admin/passive/uppassive.jsp" />
						</c:if>
						<!-- end被动供应商 -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'h')}">
						
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'i')}">
						<!-- 用户 -->
						<c:if test="${userHome eq 'userHome' }">
							<jsp:include page="admin/userInfo/user.jsp" />
						</c:if>
						<!-- 用户end -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'j')}">
						<!-- 询价/采购 -->
						<c:if test="${inquiryAll eq 'inquiryAll' }">
							<jsp:include page="admin/inquiry/inquiryList.jsp" />
						</c:if>
						<!-- 报价 -->
						<c:if test="${quoteAll eq 'quoteAll' }">
							<jsp:include page="admin/quote/quotesList.jsp" />
						</c:if>
						<!-- end询/报价 -->
					</c:if>
					
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'k')}">
						<!-- 留言 -->
						<c:if test="${messageAll eq 'messageAll' }">
							<jsp:include page="admin/message/message.jsp" />
						</c:if>
						<!-- 留言end -->
					</c:if>
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'l')}">
						<!-- 缺货型号 -->
						<c:if test="${random eq 'random' }">
							<jsp:include page="admin/random.jsp" />
						</c:if>
						<!-- 缺货型号end -->
					</c:if>
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'p')}">
						<!-- 供应商备注 -->
						<c:if test="${remarksAll eq 'remarksAll' }">
							<jsp:include page="admin/remarks/remarks.jsp" />
						</c:if>
					</c:if>
					<c:if test="${sessionScope.user.admin_adminName eq '钟镇东'}">
						<c:if test="${adminList eq 'adminList' }">
							<jsp:include page="Administration/adminList.jsp" />
						</c:if>
						<!-- 管理员添加 -->
						<c:if test="${inadmin eq 'inadmin' }">
							<jsp:include page="Administration/addAdmin.jsp" />
						</c:if>
						<!-- 管理员修改 -->
						<c:if test="${editadmin eq 'editadmin' }">
							<jsp:include page="Administration/upAdmin.jsp" />
						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>

</html>