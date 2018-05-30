<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi" />
<meta charset="UTF-8">
<title>在芯间-电子元器件查询平台</title>
<link rel="stylesheet" href="<%=basePath %>css/index.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jqPaginator.js"></script>
<style type="text/css">
	a:hover{ text-decoration: none} 
</style>
<script type="text/javascript">
	$(function() {
		$('#navigationBar').affix({
			offset : {
				top : $('#navigationBar').offset().top
			}
		});
		$("#navigationBar").css("z-index", 100);

		//Input的回车事件，提交数据
		$("#search").on('keypress', function(event) {
			if (event.keyCode == '13') {
				var search = $("#search").val();
				var url = '<%=basePath %>1019/zai/xin/jian/searchEditSupplier?keyword=' + search + '&value=product&page=1';
				alert(url);
				window.location = url;
			}
		});
		//点击 事件提交产品
		$("#searchProduct").click(function() {
			alert("123");
			var search = $("#search").val();
			var url = '<%=basePath %>1019/zai/xin/jian/searchEditSupplier?keyword=' + search + '&value=product&page=1';
			alert(url);
			window.location = url;
		});

		//点击提交供应商
		$("#searchSupplier").click(
				function() {
					var search = $("#search").val();
					window.location.href = '<%=basePath %>1019/zai/xin/jian/searchEditSupplier?keyword=' + search
							+ '&value=supplier&page=1'
		});
		
		//分页
		var currentpage = $("#currentpage").val();
		if(currentpage == ""){
			currentpage = 1;
		}
		currentpage = parseInt(currentpage);
		$.jqPaginator('#pagination', {
	        totalPages: ${pageSize},
	        visiblePages: 10,
	        currentPage: currentpage,
	        first: '<li class="first"><a href="<%=basePath %>1019/zai/xin/jian/editsupplier?page=1">首页</a></li>',
	        last: '<li class="last"><a href="<%=basePath %>1019/zai/xin/jian/editsupplier?page=${pageSize}">尾页</a></li>',
	        page: '<li class="page"><a href="<%=basePath %>1019/zai/xin/jian/editsupplier?page={{page}}">{{page}}</a></li>',
	        onPageChange: function (num, type) {
	        	if(type == "change"){
	        		window.location.href="<%=basePath %>1019/zai/xin/jian/editsupplier?page="+num;
	        	}
        	}
    		});
	});
</script>
</head>

<body>
	<!--搜索-->
	<div class="header" style="margin-top: 20px;margin-left: 40px;">
		<form method="GET" class="form-inline" id="form" action="?">
			<div class="form-group">
				<input type="search" class="form-control input-lg" placeholder="搜索"
					id="search" name="search" />
			</div>
			<input type="button" class="btn btn-primary btn-lg" value="搜型号"
				id="searchProduct" name="product" /> <input type="button"
					class="btn btn-primary btn-lg" value="搜商家" id="searchSupplier"
				name="supplier" />
		</form>
		<a href="<%=basePath%>1019/zai/xin/jian/shenHe" class="btn btn-primary" style="margin-top: 10px;">
			供应商审核
		</a>
		<a href="<%=basePath%>1019/zai/xin/jian/supplier" class="btn btn-primary" style="margin-top: 10px;">
			添加供应商
		</a>
	</div>
	<div class="container" style="padding-left: 0px; padding-right: 0px;margin-top: -60px;">
		<!--模式选择-->
		<div class="navbar navbar-default" id="navigationBar">
			<ul class="nav navbar-nav">
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 100px">供应商</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 100px">供应商位置</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 60px">仓库位置</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 80px">场地有效期</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 120px">电话</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 88px">手机</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 88px">传真</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 100px">邮箱 </a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 110px">经营品牌</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 55px">公司相册</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 55px">资质证书</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 55px">相关文件</a></li>
				<li><a href="javascript:void(0)"
					style="padding-right: 0px; width: 120px">QQ</a></li>
					<li><a href="javascript:void(0)" style="padding-right:0px;width: 20px">修改</a></li>
			</ul>
		</div>
		<!--搜索结果-->
		<div class="navbar navbar-default">
			<c:forEach items="${supplier}" var="supplier" varStatus="status">
				<c:if test="${status.count%2==0}">
					<ul class="nav navbar-nav">
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 100px">${supplier.suppliername }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 100px">${supplier.supplierposition }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 60px">${supplier.repoposition }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 80px">${supplier.validityperiod }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 120px">${supplier.telphone }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 88px">${supplier.cellphone }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 88px">${supplier.fax }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 100px">${supplier.email }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 110px">${supplier.brandoperation }</a></li>
						<li><a href="<%=basePath %>${supplier.supplierphotos }"
							style="padding-right: 0px; width: 50px">公司相册</a></li>
						<li><a href="<%=basePath %>${supplier.qualification }"
							style="padding-right: 0px; width: 55px">资质证书</a></li>
						<li><a href="<%=basePath %>${supplier.supplierprefile }"
							style="padding-right: 0px; width: 55px">相关文件</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 120px">${supplier.qq }</a></li>
					<li><a href="updatesupplier?uid=${supplier.supplieruuid }" style="padding-right:0px;width: 20px">修改</a></li>
					</ul>
				</c:if>
				<c:if test="${status.count%2!=0}">
					<ul class="nav navbar-nav">
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 100px">${supplier.suppliername }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 100px">${supplier.supplierposition }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 60px">${supplier.repoposition }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 80px">${supplier.validityperiod }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 120px">${supplier.telphone }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 88px">${supplier.cellphone }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 88px">${supplier.fax }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 100px">${supplier.email }</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 110px">${supplier.brandoperation }</a></li>
						<li><a href="<%=basePath %>${supplier.supplierphotos }"
							style="padding-right: 0px; width: 50px">公司相册</a></li>
						<li><a href="<%=basePath %>${supplier.qualification }"
							style="padding-right: 0px; width: 55px">资质证书</a></li>
						<li><a href="<%=basePath %>${supplier.supplierprefile }"
							style="padding-right: 0px; width: 55px">相关文件</a></li>
						<li><a href="javascript:void(0)"
							style="padding-right: 0px; width: 120px">${supplier.qq }</a></li>
					<li><a href="updatesupplier?uid=${supplier.supplieruuid }" style="padding-right:0px;width: 20px">修改</a></li>
					</ul>
				</c:if>
			</c:forEach>
		</div>
		<!-- 
		<nav>
			<ul class="pagination pagination-lg">
				<li><a href="editsupplier?page=1">首页</a></li>
				<c:forEach var="page" begin="1" end="${pageSize}">
					<li><a href="editsupplier?page=${page }">${page}</a></li>
				</c:forEach>
				<li><a href="editsupplier?page=${pageSize }">尾页</a></li>
			</ul>
		</nav>
		 -->
		 <input type="hidden" value="${param.page}" id="currentpage"/>
		<ul class="pagination" id="pagination"></ul>
	</div>

	<!-- Modal 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">请点击你要投诉的内容</h4>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-default" id="complaintPrice">
						价格不真实 x<span id="complaintPriceNum">111</span>
					</button>
					<button type="button" class="btn btn-default" id="complaintActuals">
						没有现货 x<span id="complaintActualsNum">121</span>
					</button>
					<button type="button" class="btn btn-default"
						id="complaintOriginal">
						非原装货报原装货 x<span id="complaintOriginalNum">11</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
-->

	<footer class="container-fluid">
		<div class="container"></div>
	</footer>
</body>
</html>