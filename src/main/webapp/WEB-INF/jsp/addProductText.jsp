<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-cn">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>添加产品</title>
<link rel="stylesheet" href="<%=basePath%>css/index.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>css/multiple-select.css" />
<script src="<%=contextPath%>/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript"
	src="<%=contextPath%>/js/jquery.validate.min.js"></script>
<!-- <script type="text/javascript">
			$(function) {
				$("[data-toggle='popover']").popover();
				$("#form").validate({meta: "validate"});
			}
		</script> -->
<style type="text/css">
a:hover {
	text-decoration: none
}
</style>
</head>
<body class="container-fluid" style="margin-top: 20px;">
	<div class="row">
		<div class="col-sm-12" style="width: 100%">
			<form id="form" method="post"
				action="<%=basePath%>1019/zai/xin/jian/addProduct"
				enctype="multipart/form-data"
				style="width: 500px; margin-left: 200px; margin-top: 50px;">
				<input type="hidden" name="product_booking"
					value="${booking.booking_id }">
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">产品</div>
							<input type="text" class="form-control" placeholder="产品"
								id="product" name="product" value="${booking.booking_product }"
								required />
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">品牌</div>
							<input type="text" class="form-control" placeholder="品牌"
								id="manufacturer" name="manufacturer" required />
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">封装</div>
							<input type="text" class="form-control" placeholder="封装"
								id="encapsulation" name="encapsulation"
								value="${booking.booking_encapsulation }" required />
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">批号</div>
							<input type="text" class="form-control" placeholder="批号"
								id="lotnumber" name="lotnumber" required />
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">描述</div>
							<input type="text" class="form-control" placeholder="包装"
								required="required" id="description" name="description" value="" />
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">库存</div>
							<input type="text" name="isgoodsinstock"
								value="${booking.booking_number }"
								class="goodinstock input-text" required="required"
								placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">价格</div>
							<input type="text" class="form-control" placeholder="价格(元)"
								id="price" name="price" required />
							<div class="input-group-addon">元</div>
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6">
						<div class="">
							<div class="input-group-addon"
								style="border-right: 1px solid #C3C3C3;">分类</div>
							<c:forEach items="${primaryList}" var="brand">
								&nbsp;&nbsp;<input type="checkbox" name="product_primary"
									value="${brand.primary_id }" />${brand.primary_name }&nbsp;&nbsp;
							</c:forEach>
						</div>
					</div>
				</div>
				<br />
				<div>
					<button type="submit" type="submit" class="btn btn-default">提交</button>
				</div>

				<%--取消在线图片上传 --%>
				<%-- <div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">图片</div>
								<input type="file" name="files" class="goodinstock input-text" id='file'>
								<input style="margin-left: 200px;position: absolute;margin-top: -22px;width: 40px;color: red" type="button" value="预览"  onclick="c()"  />
						</div>
						
						 <div style="margin-left:250px;position: absolute;" >
							<img  id='show'>
						</div>
						
					</div>
				</div> --%>
				<br /> <br />
			</form>
		</div>
	</div>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/jquery.multi-select.js"></script>
<script type="text/javascript">
	$('#product_primary').multiSelect({
		afterSelect : function(values) {
			alert("Select value: " + values);
		},
		afterDeselect : function(values) {
			alert("Deselect value: " + values);
		}
	});
	/* $("#product_primary").change(function(){
		$("#product_second").html("<option value='0'>分类选择</option>");
		var id=$("#product_primary").val();
		 $.post("querySecondAll?id="+id,
			function(data){
				for(var o in data) {
					 $("#product_second").append('<option value="'+data[o].second_id+'">'+data[o].second_name+'</option>');
				}
	    
			}
	   	)
	}) */

	function id1() {
		var pid = document.getElementById("max1").value;
		var min1 = document.getElementById("min1").value;
		if (parseInt(min1) >= parseInt(pid)) {
			$("#max1").val("");
			$("#min2").val("");
			alert("请输入大于" + min1 + "的数");
		} else {
			$("#min2").val(parseInt(pid) + 1);
		}

	}
	function id2() {
		var min2 = document.getElementById("min2").value;
		var pid = document.getElementById("max2").value;
		if (parseInt(min2) >= parseInt(pid)) {
			$("#max2").val("");
			alert("请输入大于" + min2 + "的数");
		} else {
			$("#min3").val(parseInt(pid) + 1);
		}
	}

	function c() {
		var r = new FileReader();
		f = document.getElementById('file').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show');
		document.getElementById('show').style.height = '200px';
		document.getElementById('show').style.width = '200px';
		r.onload = function(e) {
			img.src = this.result;
		};
	}
</script>
</html>
