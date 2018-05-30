<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/js/dist/jquery.validator.css"/>
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link href="//cdn.bootcss.com/layer/2.4/skin/layer.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
    <title>提示</title>
</head>
<body>
<div class="page-container">
    <div class="row">
		<form class="form-login" id="Form" action="">
			<fieldset style="background:#CBE9CF; color:#00060B">
				<div class="row" style="height: 40px;">
					<div class="col-md-6" >
						<div class="form-group">
							<input type="hidden" id="pid" name="pid" value="${pid }" />
							<label class="control-label" for="lastName">
								数量：
							</label>
							<input type="number" class="form-control" id="min1" name="min1" value="1" readonly>
							~<input onblur="id1()" type="number" class="form-control" id="max1" name="max1" placeholder="结束数量">
							<span id="s" style="color: red;"></span>
						</div>
					</div>
					<div class="col-md-3">
		                 <div class="form-group">
							<label class="control-label" for="lastName">
								价格：
							</label>
							<input type="text" class="form-control" id="price1" name="price1" placeholder="价格">
							<span id="price" style="color: red;"></span>
						</div>
					</div>
				</div>
				<div class="row" style="height: 40px;">
					<div class="col-md-6" >
						<div class="form-group">
							<input type="hidden" id="pid" name="pid" value="${pid }" />
							<label class="control-label" for="lastName">
								数量：
							</label>
							<input type="number" class="form-control" id="min2" name="min2" readonly>
							~<input onblur="id2()" type="number" class="form-control" id="max2" name="max2" placeholder="结束数量">
							<span id="s" style="color: red;"></span>
						</div>
					</div>
					<div class="col-md-3">
		                 <div class="form-group">
							<label class="control-label" for="lastName">
								价格：
							</label>
							<input type="text" class="form-control" id="price2" name="price2" placeholder="价格">
							<span id="price" style="color: red;"></span>
						</div>
					</div>
				</div>
				<div class="row" style="height: 40px;">
					<div class="col-md-6" >
						<div class="form-group">
							<input type="hidden" id="pid" name="pid" value="${pid }" />
							<label class="control-label" for="lastName">
								数量：
							</label>
							<input type="number" class="form-control" id="min3" name="min3" readonly>
							<span style="color: red;">~以上</span>
						</div>
					</div>
					<div class="col-md-3">
		                 <div class="form-group">
							<label class="control-label" for="lastName">
								价格：
							</label>
							<input type="text" class="form-control" id="price3" name="price3" placeholder="价格">
							<span id="price" style="color: red;"></span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3" >
		                 <div class="form-group">
							<label class="control-label" for="lastName">
								数量单位：
							</label>
							<input type="text" class="form-control" id="discount_unit" name="discount_unit" value="片" placeholder="数量单位">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" >
						<button type="button" id="submitForm" style="margin-right: 480px;float: right;" class="btn btn-primary pull-right">
							提交 <i class="fa fa-arrow-circle-right"></i>
						</button>
						<button type="button" onclick="quxiao();" style="margin-right: 20px;float: right;" class="btn btn-primary pull-right">
							取消 
						</button>
					</div>
				</div>
				
			</fieldset>
		</form>
	</div>
</div>
	
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script type="text/javascript">
	function id1() {
		var pid=document.getElementById("max1").value;
	   	$("#min2").val(parseInt(pid)+1);
	}
	function id2() {
		var pid=document.getElementById("max2").value;
	   	$("#min3").val(parseInt(pid)+1);
	}

	function quxiao(){
		window.location.href="productList";
	}
	
	$("#submitForm").click(function(){
		var pid=document.getElementById("pid").value;
		var min1=document.getElementById("min1").value;
		var max1=document.getElementById("max1").value;
		var min2=document.getElementById("min2").value;
		var max2=document.getElementById("max2").value;
		var min3=document.getElementById("min3").value;
		var price1=document.getElementById("price1").value;
		var price2=document.getElementById("price2").value;
		var price3=document.getElementById("price3").value;
		var discount_unit=document.getElementById("discount_unit").value;
		if(max1==""){
			layer.alert("请正确填写信息", {icon : 5})
		}else if(max2==0){
			layer.alert("请正确填写信息", {icon : 5})
		}else if(price1 == "" && price2 == ""&&price3 == ""){
			layer.alert("请添加价格", {icon : 5})
		}else if(parseInt(max2)<=parseInt(min2)){
			layer.alert("请正确填写信息", {icon : 5})
		}else{
			$.post("DiscountAdd?discount_pid="+pid+"&min1="+min1+"&max1="+max1+"&min2="+min2+"&max2="+max2+"&min3="+min3+"&price1="+price1+"&price2="+price2+"&price3="+price3+"&discount_unit="+discount_unit,
	            function(data){
					if(data.result=="fail"){
					}else if(data.result=="seccuss"){
						window.location.href="<%=basePath%>1019/zai/xin/jian/queryByPid?pid="+pid;
					}
				}
		   	)
		}
	})
</script>
</body>
</html>