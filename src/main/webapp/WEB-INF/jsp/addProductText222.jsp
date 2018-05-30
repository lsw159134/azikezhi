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
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/addProduct" enctype="multipart/form-data" style="width: 500px;margin-left: 200px;margin-top: 50px;">
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">产品</div>
							<input type="text" class="form-control" placeholder="产品"
								id="product" name="product" required />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">生产厂商</div>
							<input type="text" class="form-control" placeholder="生产厂商"
								id="manufacturer" name="manufacturer" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">封装</div>
							<input type="text" class="form-control" placeholder="封装"
								id="encapsulation" name="encapsulation" required />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">批号</div>
							<input type="text" class="form-control" placeholder="批号"
								id="lotnumber" name="lotnumber" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">交易说明</div>
							<input type="text" class="form-control" placeholder="交易说明"
								id="description" name="description" value="可出售样品" required />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">资料</div>
							<input type="text" class="form-control"
								id="p_data" name="p_data" />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">库存</div>
							<input type="text" name="isgoodsinstock" class="goodinstock input-text" required="required" placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6" >
					
					</div>
				</div>
				<br />
				
				<div class="row">
						<div class="col-md-12">
							价格区间：
						</div>
					</div>
					<div class="row" style="height: 40px;">
						<div class="col-md-12" >
							<div class="form-group">
								<label class="control-label" for="lastName">
									数量：
								</label>
								<input type="number" class="goodinstock input-text" style="width: 80px;" id="min1" name="min1" value="1" readonly>
								~<input onblur="id1()" class="goodinstock input-text" required style="width: 80px;" type="number" id="max1" name="max1" placeholder="结束数量">
								<label class="control-label" for="lastName">
									价格：
								</label>
								<input type="text" class="goodinstock input-text" required style="width: 100px;" id="price1" name="price1" placeholder="价格">
							</div>
						</div>
					</div>
					<div class="row" style="height: 40px;">
						<div class="col-md-12" >
							<div class="form-group">
								<label class="control-label" for="lastName">
									数量：
								</label>
								<input type="number" class="goodinstock input-text" id="min2" name="min2" readonly>
								~<input onblur="id2()" class="goodinstock input-text" required type="number" id="max2" name="max2" placeholder="结束数量">
								<label class="control-label" for="lastName">
									价格：
								</label>
								<input type="text" class="goodinstock input-text" required style="width:100px;" id="price2" name="price2" placeholder="价格">
							</div>
						</div>
					</div>
					<div class="row" style="height: 40px;">
						<div class="col-md-12" >
							<div class="form-group">
								<label class="control-label" for="lastName">
									数量：
								</label>
								<input type="number" class="goodinstock input-text" id="min3" name="min3" readonly>
								<span style="color: red;">~以上</span>
								<label class="control-label" for="lastName"  style="margin-left: 55px;">
									价格：
								</label>
								<input type="text" class="goodinstock input-text" required style="width:100px;" id="price3" name="price3" placeholder="价格">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" >
							 <div class="form-group" style="float: left;">
								<label class="control-label" for="lastName">
									数量单位：
								</label>
								<input type="text" class="goodinstock input-text" style="width: 100px;" id="discount_unit" name="discount_unit" value="片" placeholder="数量单位">
							</div>
						</div>
					</div>
				<br />
				<br />
				<div class="col-sm-6">
					<button type="submit" class="btn btn-default">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function id1() {
		var pid=document.getElementById("max1").value;
		var min1=document.getElementById("min1").value;
		if(parseInt(min1)>=parseInt(pid)){
			$("#max1").val("");
			$("#min2").val("");
			alert("请输入大于"+min1+"的数");
		}else{
			$("#min2").val(parseInt(pid)+1);
		}
	   
	}
	function id2() {
		var min2=document.getElementById("min2").value;
		var pid=document.getElementById("max2").value;
		if(parseInt(min2)>=parseInt(pid)){
			$("#max2").val("");
			alert("请输入大于"+min2+"的数");
		}else{
			$("#min3").val(parseInt(pid)+1);
		}
	}
	$(document).ready(function() {
		//Ajax 搜索型号
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
				$("#product").val($(this).siblings(".model").val());
				$("#encapsulation").val($(this).siblings(".encapsulation").val());
				$("#manufacturer").val($(this).siblings(".firm").val());
			})
		});
		//Ajax搜索供应商
		$("#searchSupplier").click(function() {
			var modelName = $("#supplierName").val();
			$.ajax({
				type: "get",
				contentType: "application/json; charset=utf-8",
				url: "<%=basePath%>1019/zai/xin/jian/searchsupplier?keyword=" + modelName,
				dataType: "json",
				async: true,	
				success:function(data){
					for(var i = 0; i < data.size; i++){
						$(".supplier").append("<div id='su"+i+"'></div>");
						$("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>供应商名</div>");
						$("#su"+i+"").append("<input class='form-control model' type='text' placeholder='供应商名' value="+data.supplier[i].suppliername+" class='supplier1' disabled>");
						$("#su"+i+"").append("<input type='hidden' value="+data.supplier[i].supplieruuid+" name='supplieruuid' class='supplieruuid' disable /><br/>");
						$("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>QQ</div>");
						$("#su"+i+"").append("<input class='form-control model' type='text' placeholder='QQ' value="+data.supplier[i].qq+" id='qq0' disabled>");
                              $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>地址</div>");
                              $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='地址' value="+data.supplier[i].supplierposition+" disabled>");
                              $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>电话</div>");
							$("#su"+i+"").append("<input class='form-control model' type='text' placeholder='电话' value="+data.supplier[i].telphone+" disabled>");
                              $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>QQ</div>");
                              $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='QQ' value="+data.supplier[i].qq+" disabled>");
						$("#su"+i+"").append("<button type='button' class='btn btn-default choosesupplier'>选择</button>");
					}
					if(data.size > 6){
						$(".choose").attr("disabled",true); 
					}
				}
			});
			$(document).on("click",".choosesupplier",function(){
				$("#supplier").val($(this).siblings(".supplier1").val());
			
				$("#qq").val($(this).siblings("#qq0").val());
				$("#supplieruuid").val($(this).siblings(".supplieruuid").val());
			});
		});
	});
</script>
</html>
