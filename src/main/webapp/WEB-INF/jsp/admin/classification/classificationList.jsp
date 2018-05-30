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
					添加一级分类
				</a>
			</div>
			<div class="col-sm-2">
				<a data-remodal-target="erji" id="erji" class="btn btn-primary">
					添加二级分类
				</a>
			</div>
		</div>
	</div>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th width="60px;">序号</th>
					<th width="60px;">一级分类名称</th>
					<th width="60px;">添加时间</th>
					<th width="60px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${classification}" var="classification" varStatus="status">
					<tr height="60px;" class="text-c">
						<td  align="center">${classification.classification_sort}</td>
						<td  align="center">${classification.classification_name}</td>
						<td width="30px;" align="center">
							<fmt:formatDate value="${classification.classification_time}" pattern="yyyy/MM/dd"/>
						</td>
						<td width="60px;">
                    		<a class="up" data-remodal-target="upprimary" data-name="${classification.classification_name}" data-id="${classification.classification_id}" data-sorting="${classification.classification_sort}">修改</a>
                    		| <a href="classificationdelete?id=${classification.classification_id}" onClick="return confirm('确定删除?');" style="color: red;">删除</a>
                    		<br/>
                    		<a class="chakaner" data-remodal-target="erjiList" data-id="${classification.classification_id}" style="color: red;">查看下属分类</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="remodal" data-remodal-id="upsecond">
	<p style="float: left;font-size: 16px;font-weight: bold;margin-top: -30px;margin-left: 300px;">二级分类修改</p>
	<button data-remodal-action="close" class="remodal-close"></button>
	<h4 style="float: left;margin-left: 100px;margin-top: 0px;">
		<input type="hidden" id="ups_id">
		分类名称:<input id="ups_name" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<br>
	<h4 style="float: left;width: 520px;">
		排序:<input id="ups_sort" type="text" class="second_name" style="height:30px;width: 200px;margin-left: 8px;">
	</h4>
	<p style="clear: both;"></p>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm" id="upsecond1">
		确定
	</button>
</div>
<div class="remodal" data-remodal-id="erji">
	<p style="float: left;font-size: 16px;font-weight: bold;margin-top: -30px;margin-left: 300px;">二级分类添加</p>
	<button data-remodal-action="close" class="remodal-close"></button>
	<h4 style="float: left;margin-left: 65px;margin-top: 0px;">所属分类:
		<select id="addcid" style="width: 180px;height: 30px;" name="second_primaryid" >
			
		</select>
	</h4>
	<h4 style="float: left;margin-left: 100px;">
		排序:<input id="adds_sort" type="text" class="second_name" style="height:30px;width: 200px;margin-left: 8px;">
	</h4>
	<br>
	<br />
	<h4 style="float: left;margin-left: 65px;">
		分类名称:<input id="adds_name" type="text" class="second_name" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm" id="addSecond1">
		确定
	</button>
</div>
<div class="remodal" data-remodal-id="erjiList">
	<button data-remodal-action="close" class="remodal-close"></button>
	<table class="table table-striped table-hover" id="sample-table-2">
		<thead>
			<tr class="text-c">
				<th width="60px;">排序</th>
				<th width="60px;">分类名称</th>
				<th width="60px;">添加时间</th>
				<th width="60px;">操作</th>
			</tr>
		</thead>
		<tbody id="er">
		</tbody>
	</table>
</div>
<div class="remodal" data-remodal-id="yiji" style="background-color: #DDDDDD">
	<p style="float: left;font-size: 14px;font-weight: bold;margin-top: -30px;">一级分类添加</p>
	<button data-remodal-action="close" class="remodal-close" style="margin-left: 660px;"></button>
	<form action="addClassification" method="post" enctype="application/x-www-form-urlencoded">
		<h5 style="float: right;margin-right: 145px;">
			<input type="hidden" name="sort" value="${fn:length(classification)+1}">
			<b>分类名称:</b><input class="primary_name" name="classification_name" type="text" style="height:30px;width: 400px;margin-left: 8px;border: 2px solid #97CBDD;" required="required">
		</h5>
		<br>
		<h5 style="float: right;margin-right: 140px;width: 450px;text-align: left;">
			<b>排序:</b><input id="addclassification_sort" class="classification_sort" value="${fn:length(classification)+1}" name="classification_sort" type="text" required="required" style="height:30px;border: 2px solid #97CBDD;width: 120px;margin-left: 8px;">
		</h5>
		<br>
		<button data-remodal-action="cancel" class="remodal-cancel">
			取消
		</button>
		<button class="remodal-confirm" type="submit">
			确定
		</button>
	</form>
</div>
<div class="remodal" data-remodal-id="upprimary"style="background-color: #DDDDDD">
	<p style="float: left;font-size: 14px;font-weight: bold;margin-top: -30px;">一级分类修改</p>
	<button data-remodal-action="close" class="remodal-close" style="margin-left: 660px;"></button>
	<form action="upClassification" method="post" enctype="application/x-www-form-urlencoded">
		<h5 style="float: right;margin-right: 145px;">
			<b>分类名称:</b><input id="upclassification_name" class="primary_name" name="classification_name" type="text" style="height:30px;width: 400px;margin-left: 8px;border: 2px solid #97CBDD;" required="required">
		</h5><input type="hidden" id="upclassification_id" name="classification_id">
		<br>
		<h5 style="float: right;margin-right: 140px;width: 450px;text-align: left;">
			<b>排序:</b><input id="upclassification_sort" class="upclassification_sort" name="classification_sort" type="text" required="required" style="height:30px;border: 2px solid #97CBDD;width: 120px;margin-left: 8px;">
		</h5>
		<br>
		<button data-remodal-action="cancel" class="remodal-cancel">
			取消
		</button>
		<button class="remodal-confirm" type="submit">
			确定
		</button>
	</form>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>

$("#upsecond1").on("click", function(){
	var s_id=$("#ups_id").val();
	var s_name=$("#ups_name").val();
	var ups_sort=$("#ups_sort").val();
	if(s_name!=null && s_name!=""){
		$.ajax({
			url:"upSubcategory",
			type:"POST",
			data:{
				name:s_name,
				sort:ups_sort,
				id:s_id
			},
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType:"json",
			success: function(data){
				if(data=="fail"){
					layer.alert("添加失败", {icon : 5})
				}else if(data=="seccuss"){
					layer.alert("添加成功")
					window.location.href="queryPrimaryAll";
				}else if(data.result=="login"){
					window.location.href="Adminlogin";
				}
			}
		});
	}else{
		layer.alert("请输入名称", {icon : 5})
	}
});
$(document).on("click",".edit",function(){
	var a = $(this).data("name");
    var b = $(this).data("id");
    var c = $(this).data("sort");
    $("#ups_name").val(a);
    $("#ups_id").val(b);
    $("#ups_sort").val(c);
});


$("#addSecond1").on("click", function(){
	var addcid=$("#addcid").val();
	var adds_name=$("#adds_name").val();
	var adds_sort=$("#adds_sort").val();
	if(adds_name!=null && adds_name!=""){
		$.ajax({
			url:"addSubcategory",
			type:"POST",
			data:{
				name:adds_name,
				sort:adds_sort,
				cid:addcid
			},
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType:"json",
			success: function(data){
				if(data=="fail"){
					layer.alert("添加失败", {icon : 5})
				}else if(data=="seccuss"){
					layer.alert("添加成功")
					window.location.href="queryPrimaryAll";
				}else if(data.result=="login"){
					window.location.href="Adminlogin";
				}
			}
		});
	}else{
		layer.alert("请输入名称", {icon : 5})
	}
});

$(".chakaner").on("click", function(){
    var b = $(this).data("id");
    $("#er").html("");
    $.post("subcategoryList?subcategory_classification="+b,
		function(data){
			for(var o in data) {
				 $("#er").append('<tr height="60px;" class="text-c">'
				   	 	+'<td  align="center">'+data[o].subcategory_sort+'</td>'
				   	 	+'<td  align="center">'+data[o].subcategory_name+'</td>'
				   	 	+'<td width="30px;" align="center">'+new Date(data[o].subcategory_time).toLocaleDateString()+'</td>'
				   	 	+' <td width="60px;"> <a data-remodal-target="upsecond" data-name="'+data[o].subcategory_name+'"data-sort="'+data[o].subcategory_sort+'" data-id="'+data[o].subcategory_id+'" class="edit">修改</a> '
				   		+'| <a onClick="seconddelete('+data[o].subcategory_id+');" style="color: red;">删除</a>'
				   	 	+' <br/> </td> </tr>');
			}
    
		}
   	) 
});

function seconddelete(id){
	var msg = "您真的确定要删除吗？\n\n请确认！";
	if (confirm(msg)==true){
		window.location.href='deleteSubcategory?id='+id;
	}else{
		return false;
	}
	
}

$("#adds_sort").on("input propertychange", function() {
	var objectout = $("#adds_sort");  
	objectout.mouseout(function () {
		var adds_sort=$("#adds_sort").val();
		var addcid=$("#addcid").val();
		$.post("selectBySortSubcategory?subcategory_sort="+adds_sort+"&subcategory_classification="+addcid,
			function(data){
				if(data.result=="fail"){
					layer.alert("该排序已有", {icon : 5})
				}else if(data.result=="seccuss"){
					
				}
			}
	   	)
	});
});

$(".up").on("click", function(){
    var a = $(this).data("name");
    var b = $(this).data("id");
    var c = $(this).data("sorting");
    $("#upclassification_name").val(a);
    $("#upclassification_id").val(b);
    $("#upclassification_sort").val(c);
});

$("#erji").on("click", function(){
	<c:forEach var="yanan" items="${classification}"> 
	 $("#addcid").append("<option value=${yanan.classification_id}>${yanan.classification_name}</option>");
	</c:forEach>
});

$("#addclassification_sort").on("input propertychange", function() {
	var objectout = $("#addclassification_sort");  
	objectout.mouseout(function () {
		var addclassification_sort=$("#addclassification_sort").val();
		$.post("selectBySortClassification?sort="+addclassification_sort,
			function(data){
				if(data.result=="fail"){
					layer.alert("该排序已有", {icon : 5})
				}else if(data.result=="seccuss"){
					
				}
			}
	   	)
	});
});

</script>
</body>
</html>