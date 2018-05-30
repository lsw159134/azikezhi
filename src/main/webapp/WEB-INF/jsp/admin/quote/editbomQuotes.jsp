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
				$("#form").validate({meta: "validate"});
			}
		</script>
		<style type="text/css">
			a:hover{ text-decoration: none} 
		</style>
</head>

<body class="container-fluid" style="margin-top: 20px;">
	<div class="row">
		<div class="col-sm-12" style="width: 100%">
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/upQuotes" enctype="multipart/form-data" style="width: 500px;margin-left: 200px;margin-top: 50px;">
				<input type="hidden" name="quotes_id" value="${id }">
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<input type="file" name="files" accept=".xls,.xlsx" class="goodinstock input-text" id='file' required="required">
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">报价说明</div>
							<input type="text" name="quotes_description" class="goodinstock input-text" placeholder="">
						</div>
					</div>
				</div>
				<br />
				<br />
				<div >
					<input style="position:fixed; left:300px;top:300px;z-index:999;" type="submit" type="submit" class="btn btn-default" value="提交">
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	

</script>
</html>
