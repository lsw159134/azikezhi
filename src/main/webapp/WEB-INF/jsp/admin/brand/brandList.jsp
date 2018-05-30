<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>Insert title here</title>
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
</style>
</head>
<body>

<div class="page-container">
	<div>
		<div class="cl pd-5 bg-1 bk-gray" style="height:40px;">
			<div class="col-sm-2">
				<a data-remodal-target="yiji" class="btn btn-primary">
					添加品牌
				</a>
			</div>
		</div>
	</div>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th width="60px;">序号</th>
					<th width="60px;">名称</th>
					<th width="60px;">添加时间</th>
					<th width="60px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${brandList}" var="brand" varStatus="status">
					<tr height="60px;" class="text-c">
						<td  align="center">${status.index+1}</td>
						<td  align="center"><a href="<%=basePath %>1019/zai/xin/jian/queryAllProduct?manufacturer=${brand.brand_name}">${brand.brand_name}</a></td>
						<td width="30px;" align="center">
							<fmt:formatDate value="${brand.brand_time}" pattern="yyyy/MM/dd"/>
						</td>
						<td width="60px;">
                    		<a class="up" data-remodal-target="upprimary" data-name="${brand.brand_name}" data-id="${brand.brand_id}" data-sortimg="${brand.brand_sortimg}">修改</a>
                    		| <a href="deleteBrand?id=${brand.brand_id}" onClick="return confirm('确定删除?');" style="color: red;">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="remodal" data-remodal-id="yiji">
	<button data-remodal-action="close" class="remodal-close"></button>
	<h4 style="float: left;margin-left: 100px;">
		名称:<input id="addprimary_name" class="primary_name" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm" id="addprimary1">
		确定
	</button>
</div>
<div class="remodal" data-remodal-id="upprimary">
	<button data-remodal-action="close" class="remodal-close"></button>
	<input type="hidden" id="upprimary_id">
	<h4 style="float: left;margin-left: 100px;">
		排序:<input id="upprimary_sorting" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<br>
	<h4 style="float: left;margin-left: 100px;">
		<input type="hidden" id="upprimary_id">
		名称:<input id="upprimary_name" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm" id="upprimary1">
		确定
	</button>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
$(".primary_name").on("input propertychange", function() {
	var primary_name=$("#addprimary_name").val();
	$.post("queryBrandname?brand_name="+primary_name,
		function(data){
			if(data.result=="fail"){
			}else if(data.result=="seccuss"){
				$("#addprimary_name").val("");
				layer.alert("该分类已有", {icon : 5})
			}
		}
   	)
});
$("#upprimary1").on("click", function(){
	var primary_id=$("#upprimary_id").val();
	var primary_name=$("#upprimary_name").val();
	var primary_sorting=$("#upprimary_sorting").val();
	if(primary_name!=null && primary_name!=""){
		$.post("addorUpDateBrand?brand_name="+primary_name+"&brand_id="+primary_id+"&brand_sortimg="+primary_sorting,
			function(data){
				if(data.result=="fail"){
					layer.alert("修改失败", {icon : 5})
				}else if(data.result=="seccuss"){
					window.location.href="queryBrandAll";
				}else if(data.result=="login"){
					window.location.href="Adminlogin";
				}
			}
	   	) 
	}else{
		layer.alert("请输入名称", {icon : 5})
	}
});


$(".up").on("click", function(){
    var a = $(this).data("name");
    var b = $(this).data("id");
    var c = $(this).data("sortimg");
    $("#upprimary_name").val(a);
    $("#upprimary_id").val(b);
    $("#upprimary_sorting").val(c);
});

$("#addprimary1").on("click", function(){
	var primary_sorting='${fn:length(primaryList)+1}'
	var primary_name=$("#addprimary_name").val();
	if(primary_name!=null && primary_name!=""){
		$.post("addorUpDateBrand?brand_name="+primary_name,
			function(data){
				if(data.result=="fail"){
					layer.alert("添加失败", {icon : 5})
				}else if(data.result=="seccuss"){
					alert("添加成功")
					window.location.href="queryBrandAll";
				}else if(data.result=="login"){
					window.location.href="Adminlogin";
				}
			}
	   	) 
	}else{
		layer.alert("请输入名称", {icon : 5})
	}
});

</script>
</body>
</html>