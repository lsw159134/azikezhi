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
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>添加供应商</title>
<link rel="stylesheet" href="<%=basePath %>css/index.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-validate.min.js"></script>
</head>

<header style="height: 50px"> </header>

<body class="container-fluid">
	<div class="col-xs-12">
		<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/AdminAddSupplier" enctype="multipart/form-data" style="width: 500px;">
			<div class="input-group">
				<div class="input-group-addon">供应商</div>
				<input type="text" class="form-control" placeholder="供应商名"
					id="suppliername" name="suppliername" required />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">供应商2</div>
				<input type="text" class="form-control" placeholder="供应商名"
					id="supplier_bieming" name="supplier_bieming" required />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">QQ1</div>
				<input type="text" class="form-control" placeholder="qq号" id="qq"
					name="qq"/>
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">QQ2</div>
				<input type="text" class="form-control" placeholder="qq号" id="qq"
					name="qq2" />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">电话</div>
				<input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^-\d、/\s]/g, '')" placeholder="电话1"
					id="telphone" name="telphone1" />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">电话</div>
				<input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^-\d、/\s]/g, '')" placeholder="电话2"
					id="telphone" name="telphone2" />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">电话</div>
				<input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^-\d、/\s]/g, '')" placeholder="电话3"
					id="telphone" name="telphone3" />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">电话</div>
				<input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^-\d、/\s]/g, '')" placeholder="电话4"
					id="telphone" name="telphone4" />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">手机</div>
				<input type="text" class="form-control" placeholder="手机"
					id="cellphone" name="cellphone"/>
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">供应商位置</div>
				<input type="text" class="form-control" placeholder="地址"
					id="supplierposition" name="supplierposition" required />
			</div>
			<br />
			<div class="input-group">
				<div class="input-group-addon">特色经营</div>
				<textarea rows="12" cols="60" name="brandoperation" id="impro" style="border: 1px solid red" required></textarea>
				<span class="hyxx_remainword">您还可以输入<span id="impro_num" class="orangenumber">150</span>字</span> 
			</div>
			<hr />
			<div class="col-sm-12">
				<button type="submit" class="btn btn-default">提交</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$("#impro").on("input propertychange", function() {  
		    var $this = $(this),  
		        _val = $this.val(),  
		        count = "";  
		    if (_val.length > 150) {  
		        $this.val(_val.substring(0, 150));  
		    }  
		    count = 150 - $this.val().length;  
		    $("#impro_num").text(count);  
		});
	</script>
</body>
</html>