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
<script src="<%=contextPath %>/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/js/jquery.validate.min.js"></script>
<!-- <script type="text/javascript">
			$(function) {
				$("[data-toggle='popover']").popover();
				$("#form").validate({meta: "validate"});
			}
		</script> -->
		<style type="text/css">
			a:hover{ text-decoration: none} 
		</style>
</head>

<body class="container-fluid" style="margin-top: 20px;">
	<div class="row">
		<div class="col-sm-12" style="width: 100%">
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/insertpassiveS" enctype="multipart/form-data" style="width: 500px;margin-left: 200px;margin-top: 50px;">
				<div class="row">
					<div class="col-md-12" >
						<div class="input-group">
							<div class="input-group-addon">公司名称</div>
							<input type="text" class="form-control" placeholder="公司名称"
								id="name" name="name" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">电话1</div>
							<input type="text" class="form-control" placeholder="请输入固话"
								id="phone1" name="phone1" />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">电话2</div>
							<input type="text" class="form-control" placeholder="请输入固话"
								id="phone2" name="phone2" />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-12" >
						<div class="input-group">
							<div class="input-group-addon">地址1</div>
							<input type="text" class="form-control" placeholder="请输入地址"
								id="address" name="address" value=""/>
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-12" >
						<div class="input-group">
							<div class="input-group-addon">地址2</div>
							<input type="text" name="illustration" class="goodinstock input-text" placeholder="请输入地址">
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">手机</div>
							<input type="text" name="cellphone" class="goodinstock input-text" placeholder="请输入手机号码">
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">排序</div>
							<input type="text" class="form-control" placeholder="排序"
								id="down" name="down" required />
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">QQ1</div>
							<input type="text" name="qq1" class="goodinstock input-text" placeholder="请输入QQ号码">
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">QQ2</div>
							<input type="text" name="qq2" class="goodinstock input-text" placeholder="请输入QQ号码">
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">一级分类</div>
							<select id="product_primary" name="passive_cid" class="form-control" required="required">
								<option value="0">分类选择</option>
							</select>
						</div>
					</div>
					<div class="col-md-6"  id="quanx" >
						<div class="input-group">
							<div class="input-group-addon">二级分类</div>
							<div id="xiala">
								<select id="product_second" name="passive_sid" class="form-control" required="required">
									<option value="0">分类选择</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div >
					<button style="position:fixed; left:300px;top:300px;z-index:999;" type="submit" type="submit" class="btn btn-default">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$.post("classificationAll",
			function(data){
				for(var o in data) {
					 $("#product_primary").append('<option value="'+data[o].classification_id+'">'+data[o].classification_name+'</option>');
				}
			}
	   	) 
	})
	$("#product_primary").change(function(){
		$("#product_second").html("<option value='0'>分类选择</option>");
		var id=$("#product_primary").val();
		 $.post("subcategoryList?subcategory_classification="+id,
			function(data){
				for(var o in data) {
					 $("#product_second").append('<option value="'+data[o].subcategory_id+'">'+data[o].subcategory_name+'</option>');
				}
	    
			}
	   	)
	   	$.post("seleTotalcid?cid="+id,
			function(data){
				$("#down").val(data);
			}
	   	)
	})
	$("#product_second").change(function(){
		var cid=$("#product_primary").val();
		var sid=$("#product_second").val();
		 $.post("selectByCidandSidTotal?cid="+cid+"&sid="+sid,
			function(data){
				$("#down").val(data);
			}
	   	)
	})
	
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
	
	function c () {
		var r= new FileReader();
		f=document.getElementById('file').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show');
		document.getElementById('show').style.height = '200px';
		document.getElementById('show').style.width = '200px';
		r.onload=function  (e) {
			img.src = this.result;
		};
	}

</script>
</html>
