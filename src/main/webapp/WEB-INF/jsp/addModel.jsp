<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!doctype html>
<html lang="zh-cn">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>添加产品</title>
<link rel="stylesheet" href="<%=basePath %>css/index.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-validate.min.js"></script>
<script type="text/javascript">
			$(function) {
				$("[data-toggle='popover']").popover();
				$("#form").validate({meta: "validate"});;
			}
		</script>
		<style type="text/css">
			a:hover{ text-decoration: none} 
		</style>
</head>

<header style="height: 50px"> </header>

<body class="container">
	<div class="row">
		<div class="col-xs-6">
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/addModel" enctype="multipart/form-data" style="width: 500px;">
				<div class="input-group">
					<div class="input-group-addon">型号</div>
					<input type="text" class="form-control" placeholder="型号" id="model"
						name="model" required />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">封装</div>
					<input type="text" class="form-control" placeholder="封装"
						id="encapsulation" name="encapsulation" required />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">厂商</div>
					<input type="text" class="form-control" placeholder="厂商" id="firm"
						name="firm" required />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">描述</div>
					<input type="text" class="form-control" placeholder="描述"
						id="synopsis" name="synopsis" />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">图片</div>
					<input type="file" class="form-control" placeholder="图片" id="photo"
						name="photofile" />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">资料</div>
					<input type="file" class="form-control" placeholder="资料" id="data"
						name="datafile" />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">替代型号</div>
					<input type="text" class="form-control" placeholder="替代型号"
						id="replacement" name="replacement"
						value="${model.replacement}" />
				</div>
				<br />
				<div class="input-group">
					<div class="input-group-addon">说明</div>
					<input type="text" class="form-control" placeholder="资料"
						id="explanation" name="explanation"
						value="${model.explanation }" />
				</div>
				<br/>
				<div class="col-sm-12">
					<button type="submit" class="btn btn-default">提交</button>
				</div>
			</form>
		</div>

		<div class="col-xs-6 num">
				<input type="text" class="form-control " placeholder="搜索 "
					id="modelName" name="modelName" /> <br />
				<button type="button" class="btn btn-default btn-lg" id="search">搜索</button>
			</div>
	</div>
</body>
<script type="text/javascript">
			$(document).ready(function() {
				$("#search").click(function() {
					var modelName = $("#modelName").val();
					$.ajax({
						type: "get",
						contentType: "application/json; charset=utf-8",
						url: "<%=basePath%>1019/zai/xin/jian/searchModel?modelName=" + modelName,
						dataType: "json",
						async: true,
						success:function(data){
							for(var i = 0; i < data.size; i++){
								$(".num").after("<div class='col-xs-3' id='result"+i+"'></div>")
								if(i < data.size/2){
									$("#result"+i+"").append("<div><br /><div class='input-group'><div class='input-group-addon'>型号</div>");
									$("#result"+i+"").append("<input class='form-control model' id='disabledInput' type='text'  placeholder='型号' value="+data.data[i].model+" disabled>");
									$("#result"+i+"").append("</div><br /><div class='input-group'><div class='input-group-addon'>封装</div>");
									$("#result"+i+"").append("<input class='form-control encapsulation' id='disabledInput' type='text' placeholder='封装 ' value="+data.data[i].encapsulation+" disabled>");
									$("#result"+i+"").append("</div><br /><div class='input-group'><div class='input-group-addon'>厂商</div>");
									$("#result"+i+"").append("<input class='form-control firm' id='disabledInput' type='text' placeholder='厂商' value="+data.data[i].firm+" disabled>");
									$("#result"+i+"").append("</div><br /><button type='button' class='btn btn-default choose'>选择</button></div>");
								}else{
									$("#result"+i+"").append("<div><br /><div class='input-group'><div class='input-group-addon model'>型号</div>");
									$("#result"+i+"").append("<input class='form-control model' id='disabledInput' type='text'  placeholder='型号' value="+data.data[i].model+" disabled>");
									$("#result"+i+"").append("</div><br /><div class='input-group'><div class='input-group-addon'>封装</div>");
									$("#result"+i+"").append("<input class='form-control encapsulation' id='disabledInput' type='text' placeholder='封装 ' value="+data.data[i].encapsulation+" disabled>");
									$("#result"+i+"").append("</div><br /><div class='input-group'><div class='input-group-addon'>厂商</div>");
									$("#result"+i+"").append("<input class='form-control firm' id='disabledInput' type='text' placeholder='厂商' value="+data.data[i].firm+" disabled>");
									$("#result"+i+"").append("</div><br /><button type='button' class='btn btn-default choose'>选择</button></div>");
								}
							}
							//当内容有很多时大于6条数据时，不允许添加内容
							if(data.size > 6){
								$(".choose").attr("disabled",true); 
							}
						}
					});
					$(document).on("click",".choose",function(){
						$("#model").val($(this).siblings(".model").val());
						$("#encapsulation").val($(this).siblings(".encapsulation").val());
						$("#firm").val($(this).siblings(".firm").val());
					});
				});
			});
		</script>
</html>