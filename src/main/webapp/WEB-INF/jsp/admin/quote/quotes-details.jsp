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
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/skin/default/skin.css" id="skin" />
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
    <title>购买记录/快递单号</title>
    <style type="text/css">
        table
        {
            border: black solid 1px;
            border-collapse: collapse;
        }
        td
        {
            border: black solid 1px;
            padding: 3px;
        }
        .td_Num
        {
            width: 40px;
            text-align: center;
        }
        .td_Item
        {
            width: 120px;
            text-align: center;
        }
        .td_Oper
        {
            width: 120px;
            text-align: center;
        }
        .td_Oper span
        {
            cursor: pointer;
        }
    </style>
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
							</ul></li>
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
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="bom表询价" data-href="QuotesByuser">bom表询价</span><em></em></li>
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
				    <div class="cl pd-5 bg-1 bk-gray mt-20">
						<span class="r">
							<a href="QuotesByadmin" style="color: red;margin-right: 10px;">
								返回上一页
							</a>
						</span>
				    </div>
				    <div class="mt-20">
				    	<textarea name='part' cols="50" rows="15" class="tex" style="height:346px;width: 600px;margin-left: 200px;" id="formData" readonly="readonly">${quotesDatil.quotes_wenben }</textarea>
				    </div>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
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