<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/style.css" />
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<title>在芯间后台系统</title>
</head>

<body>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<span class="logo navbar-logo f-l mr-10 hidden-xs">&nbsp;&nbsp;&nbsp;&nbsp;在芯间后台系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
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
								<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
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
	<aside class="Hui-aside">
		<input type="hidden"  id="supplieruid" value=""/>
		<div class="menu_dropdown bk_2">
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/cont" data-title="首页" >首页</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/cartAll" data-title="购物车" >购物车</a>
				</dt>
			</dl>
			<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryAllProduct" data-title="产品管理" href="javascript:;">产品管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/express" data-title="订单管理" href="javascript:;">订单管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/bomQueryAll" data-title="bom订单" href="javascript:;">bom订单</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/bookingAll" data-title="代售申请" href="javascript:;">代售申请</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/withdrawAL" data-title="提现申请" href="javascript:;">提现申请</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/editsupplier" data-title="供应商管理" href="javascript:;">供应商管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/getPasswd" data-title="Model管理" href="javascript:;">修改用户密码</a>
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
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryByprofit" data-title="盈利记录" href="javascript:;">盈利记录</a>
					</dt>
				</dl>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '1,2,3,4,5')}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryByprofit" data-title="盈利记录" href="javascript:;">盈利记录</a>
						</dt>
					</dl>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 2 }">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryAllProduct" data-title="产品管理" href="javascript:;">产品管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryPrimaryAll" data-title="分类目录" href="javascript:;">分类目录</a>
					</dt>
				</dl>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 3 }">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/express" data-title="订单管理" href="javascript:;">订单管理</a>
					</dt>
				</dl>
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/bomQueryAll" data-title="bom订单" href="javascript:;">bom订单</a>
					</dt>
				</dl>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 4 }">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/bookingAll" data-title="代售申请" href="javascript:;">代售申请</a>
					</dt>
				</dl>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 5 }">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/withdrawAL" data-title="提现申请" href="javascript:;">提现申请</a>
					</dt>
				</dl>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 6 }">
				<dl id="menu-admin">
					<dt>
						<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/editsupplier" data-title="供应商管理" href="javascript:;">供应商管理</a>
					</dt>
				</dl>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '1')}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryAllProduct" data-title="产品管理" href="javascript:;">产品管理</a>
						</dt>
					</dl>
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryPrimaryAll" data-title="分类目录" href="javascript:;">分类目录</a>
						</dt>
					</dl>
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '2')}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/express" data-title="订单管理" href="javascript:;">订单管理</a>
						</dt>
					</dl>
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/bomQueryAll" data-title="bom订单" href="javascript:;">bom订单</a>
						</dt>
					</dl>
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '3')}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/bookingAll" data-title="代售申请" href="javascript:;">代售申请</a>
						</dt>
					</dl>
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '4')}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/withdrawAL" data-title="提现申请" href="javascript:;">提现申请</a>
						</dt>
					</dl>
				</c:if>
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '5')}">
					<dl id="menu-admin">
						<dt>
							<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/editsupplier" data-title="供应商管理" href="javascript:;">供应商管理</a>
						</dt>
					</dl>
				</c:if>
			</c:if>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/purchase" data-title="采购记录" href="javascript:;">采购记录</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/QuotesByadmin" data-title="询价记录" href="javascript:;">bom表询价</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/queryByInquiry" data-title="询价记录" href="javascript:;">询价记录</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/chanpinfankui" data-title="产品反馈" href="javascript:;">产品反馈</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="queryAllnotepad" data-title="记事本" href="javascript:;">记事本</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/newSortList" data-title="选型添加" href="javascript:;">选型添加</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/moduleList" data-title="模块添加" href="javascript:;">模块添加</a>
				</dt>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="<%=basePath%>1019/zai/xin/jian/printrecordAll" data-title="打印记录" href="javascript:;">打印记录</a>
				</dt>
			</dl>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="盈利记录" data-href="home">盈利记录</span><em></em></li>
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
				<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
					<div class="page-container">
					    <div>
							<div class="cl pd-5 bg-1 bk-gray" style="height:50px;border: 1px solid ;">
								<br>
							 	<span style="color: red;margin-left: 20px;">盈利总额：￥ ${totalprofit }       
							 	</span>
							</div>
					    </div>
					    <div class="mt-20">
					        <table class="table">
					            <thead>
					            <tr class="text-c" style="background:#CBE9CF; color:#00060B">
					                <th width="80px;">订单名称</th>
					                <th width="60px;">订单编号</th>
					                <th width="60px;">下单时间</th>
					                <th width="60px;">盈利金额</th>
					            </tr>
					            </thead>
					            <tbody>
					           <c:forEach items="${expressList}" var="items" varStatus="express">
					                <tr class="text-c">
										<td width="40px;">${items.name}</td>
										<td width="40px;">${items.ordernumber}</td>
										<td width="60px;">
											<fmt:formatDate value="${items.edate}" pattern="yyyy/MM/dd"/></td>
										<td width="40px;">
					                   		${items.fan }
										</td>
					                </tr>
					            </c:forEach>
					            </tbody>
					        </table>
					        <%-- <div style="width: 100%;">
					        	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
					        	<button onclick = "first()">首页</button>&nbsp;
					        	<button onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
					        	<button onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
					        	<button onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
					        	<button onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
					        	<button onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
					        	<button onclick = "end()">尾页</button>
					        </div> --%>
					    </div>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
					<c:if test="${fn:contains(sessionScope.user.admin_shrio, '1,2,3,4,5')}">
						<div class="page-container">
						    <div>
								<div class="cl pd-5 bg-1 bk-gray" style="height:50px;border: 1px solid ;">
									<br>
								 	<span style="color: red;margin-left: 20px;">盈利总额：￥ ${totalprofit }       
								 	</span>
								</div>
						    </div>
						    <div class="mt-20">
						        <table class="table">
						            <thead>
						            <tr class="text-c" style="background:#CBE9CF; color:#00060B">
						                <th width="80px;">订单名称</th>
						                <th width="60px;">订单编号</th>
						                <th width="60px;">下单时间</th>
						                <th width="60px;">盈利金额</th>
						            </tr>
						            </thead>
						            <tbody>
						           <c:forEach items="${expressList}" var="items" varStatus="express">
						                <tr class="text-c">
											<td width="40px;">${items.name}</td>
											<td width="40px;">${items.ordernumber}</td>
											<td width="60px;">
												<fmt:formatDate value="${items.edate}" pattern="yyyy/MM/dd"/></td>
											<td width="40px;">
						                   		${items.fan }
											</td>
						                </tr>
						            </c:forEach>
						            </tbody>
						        </table>
						        <%-- <div style="width: 100%;">
						        	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
						        	<button onclick = "first()">首页</button>&nbsp;
						        	<button onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
						        	<button onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
						        	<button onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
						        	<button onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
						        	<button onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
						        	<button onclick = "end()">尾页</button>
						        </div> --%>
						    </div>
						</div>
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