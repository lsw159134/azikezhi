<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="<%=basePath %>js/jquerybasic.js"></script>
<style type="text/css">
	a:hover{ text-decoration: none} 
	.file1 {
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 27px;
	    margin-top: 10px;
	}
	.file1 input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
	.file1:hover {
	    background: #AADFFD;
	    border-color: #78C3F3;
	    color: #004974;
	    text-decoration: none;
	}
	.file2 {
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 27px;
	    margin-top: 10px;
	}
	.file2 input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
	.file2:hover {
	    background: #AADFFD;
	    border-color: #78C3F3;
	    color: #004974;
	    text-decoration: none;
	}
	.file3{
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 27px;
	    margin-top: 10px;
	}
	.file3 input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
	.file3:hover {
	    background: #AADFFD;
	    border-color: #78C3F3;
	    color: #004974;
	    text-decoration: none;
	}
	#button1 {
	/* General Properties */
	height:34px;
	width:250px;
	border:1px solid #000;
	background:#717a77;
	/* CSS3 Styling */
	background:-moz-linear-gradient(bottom, #0a0809, #0a0f0b 50%, #6d7673 50%, #afbdc0);
	background:-webkit-gradient(linear, left bottom, left top, from(#0a0809), to(#afbdc0), color-stop(0.5, #0a0f0b), color-stop(0.5, #6d7673));
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 0.5);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 0.5);
	box-shadow:0px 0px 7px rgba(255, 255,255, 0.5);
	/* Text Styling */
	color:#ff7d00;
	text-shadow:0px -1px 0px #000;
	font-family:'HighlandGothicFLFRegular', Impact, 'Arial Black', sans-serif;
	font-size:20px;
	padding-bottom:5px;
}

/* Pseudo-classes for interactivity */
 #button1:hover {
	font-size:21px;
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 1);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 1);
	box-shadow:0px 0px 7px rgba(255, 255,255, 1);
}

 #button1:focus {
	-moz-box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
	-webkit-box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
	box-shadow:0px 0px 7px rgba(255, 255,255, 0.75);
}

 #button1:active {
	border-width:2px 1px 1px 2px;
	font-size:20px;
}
.fixed{
 position:fixed; 
 left:50px; 
 top:100px; 
 width:200px; 
 height:50px; 
 background-color:#000;
  z-index:999;
}
</style>
</head>

<body class="container-fluid" style="margin-top: 20px;">
	<div class="row">
		<div class="col-xs-6" style="width:600px">
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/updateModule" enctype="multipart/form-data" style="width: 500px;margin-left: 200px;margin-top: 50px;">
				<input type="hidden" name="productuuid"
					value="${product.productuuid }" />
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">产品</div>
							<input type="text" class="form-control" placeholder="产品"
								id="product" name="product" value="${product.product }" required />
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">库存</div>
							<input type="text" name="isgoodsinstock" value="${product.isgoodsinstock}" class="goodinstock input-text" required="required" placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">产品描述</div>
							<input type="text" name="product_miaoshu" value="${product.product_miaoshu}" class="goodinstock input-text"  placeholder="请输入产品数量">
						</div>
					</div>
				</div>				
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">一级分类</div>
							<select id="product_primary" name="product_primary" class="form-control">
								<option value="0">分类选择</option>
							</select>
						</div>
					</div>
					<div class="col-md-6"  id="quanx" >
						<div class="input-group">
							<div class="input-group-addon">二级分类</div>
							<div id="xiala">
								<select id="product_second" name="product_second" class="form-control">
									<option value="0">分类选择</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-12">
						价格区间：
					</div>
				</div>
					<c:forEach items="${product.discountList}" var="order" varStatus="status">
						<div class="row" style="height: 40px;">
							<div class="col-md-12" >
								<div class="form-group">
									<c:if test="${order.discount_status == 1 }">
										<input type="hidden" id="d_id1" name="d_id1" value="${order.discount_id }" />
										<label class="control-label" for="lastName">
											数量：
										</label>
										<input type="number" value="${order.discount_numbermin }" class="goodinstock input-text" style="width: 80px;" id="min1" name="min1" value="1" readonly>
										~<input onblur="id1()" value="${order.discount_numbermax }" class="goodinstock input-text" style="width: 80px;" type="number" id="max1" name="max1" placeholder="结束数量">
										<label class="control-label" for="lastName">
											价格：
										</label>
										<input type="text" value="${order.discount_price }" class="goodinstock input-text" style="width: 100px;" id="price1" name="price1" placeholder="价格">
									</c:if>
									<c:if test="${order.discount_status == 2 }">
										<input type="hidden" id="d_id2" name="d_id2" value="${order.discount_id }" />
										<label class="control-label" for="lastName">
											数量：
										</label>
										<input type="number" value="${order.discount_numbermin }" class="goodinstock input-text" id="min2" name="min2" readonly>
										~<input onblur="id2()" value="${order.discount_numbermax }" class="goodinstock input-text" type="number" id="max2" name="max2" placeholder="结束数量">
										<label class="control-label" for="lastName">
											价格：
										</label>
										<input type="text" value="${order.discount_price }" class="goodinstock input-text" style="width:100px;" id="price2" name="price2" placeholder="价格">
									</c:if>
									<c:if test="${order.discount_status == 3 }">
										<input type="hidden" id="d_id3" name="d_id3" value="${order.discount_id }" />
										<label class="control-label" for="lastName">
											数量：
										</label>
										<input type="number" value="${order.discount_numbermin }" class="goodinstock input-text" id="min3" name="min3" readonly>
										<span style="color: red;">~以上</span>
										<label class="control-label" for="lastName" style="margin-left: 55px;">
											价格：
										</label>
										<input type="text" value="${order.discount_price }" class="goodinstock input-text" style="width:100px;" id="price3" name="price3" placeholder="价格">
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<c:if test="${empty product.discountList}">
						<div class="row" style="height: 40px;">
							<div class="col-md-12" >
								<div class="form-group">
									<label class="control-label" for="lastName">
											数量：
									</label>
									<input type="number" class="goodinstock input-text" style="width: 80px;" id="min1" name="min1" value="1" readonly>
									~<input onblur="id1()" class="goodinstock input-text" style="width: 80px;" type="number" id="max1" name="max1" placeholder="结束数量">
									<label class="control-label" for="lastName">
										价格：
									</label>
									<input type="text" class="goodinstock input-text" style="width: 100px;" id="price1" name="price1" placeholder="价格">
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
									~<input onblur="id2()" class="goodinstock input-text" type="number" id="max2" name="max2" placeholder="结束数量">
									<label class="control-label" for="lastName">
										价格：
									</label>
									<input type="text" class="goodinstock input-text" style="width:100px;" id="price2" name="price2" placeholder="价格">
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
									<label class="control-label" for="lastName" style="margin-left: 55px;">
										价格：
									</label>
									<input type="text" class="goodinstock input-text" style="width:100px;" id="price3" name="price3" placeholder="价格">
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
					</c:if>
					<div class="row">
						<div class="col-md-12" >
							 <div class="form-group" style="float: left;">
							 <c:forEach items="${product.discountList}" var="order" varStatus="status">
							 	<c:if test="${order.discount_status == 3 }">
							 		<label class="control-label" for="lastName">
										数量单位：
									</label>
									<input type="text" value="${order.discount_unit }" class="goodinstock input-text" style="width: 100px;" id="discount_unit" name="discount_unit" value="片" placeholder="数量单位">
							 	
							 	</c:if>
							 </c:forEach>
							</div>
						</div>
					</div>
					<textarea name="document" style="border: 1px solid;margin-left: 500px;margin-top: -200px;position: absolute;">${product.document}</textarea>
					<div class="row">
						<div class="col-md-12" >
							 <div class="form-group" style="float: left;">
							 
						 		<label style="position: absolute;margin-top: 50px" class="control-label" for="lastName">
									图片1:
										<div style="border: 1px #99D3F5 solid;width: 200px;height: 35px;text-align: center;" >
											<span class="fileerrorTip1"></span>
										</div>
										<div style="border: 1px #99D3F5 solid;width: 200px;height: 35px;text-align: center;position: absolute;margin-top: -35px;" >
											<span class="showFileName1"></span>
										</div>
								</label>
								<a style="margin-left: 200px;margin-top: 67px" class="file1">选择文件
									<input id="img1"  type="file"  name="img1">
								</a>
								<c:if test="${imgCount >= 1}">
									<input type="button" style="margin-top: 20px" id="button1" value="查看原图" onclick="imgoneBasic()" />
								</c:if>
								<input type="button" style="margin-top: 20px" id="button1" value="预览" onclick="imgone()" />
							</div>
							<div id="show111" style="margin-left: 400px;position: absolute;">
								<img id="show1">
							</div>
							<div style="margin-left: 600px;position: absolute;">
								<img id="show11">
							</div>
						</div>
					</div>
					<div style="margin-top: 30px" class="row">
						<div class="col-md-12" >
							 <div class="form-group" style="float: left;">
						 		<label style="position: absolute;margin-top: 50px" class="control-label" for="lastName">
									图片2:
										<div style="border: 1px #99D3F5 solid;width: 200px;height: 35px;text-align: center;" >
											<span class="fileerrorTip2"></span>
										</div>
										<div style="border: 1px #99D3F5 solid;width: 200px;height: 35px;text-align: center;position: absolute;margin-top: -35px" >
											<span class="showFileName2"></span>
										</div>
								</label>
								<a style="margin-left: 200px;margin-top: 67px" class="file2">选择文件
									<input id="img2"  type="file"  name="img2">
								</a>
								<c:if test="${imgCount >1 && imgCount <= 3}">
									<input type="button" id="button1" value="查看原图" onclick="imgtwoBasic()" />
								</c:if>
								<input type="button" id="button1" value="预览" onclick="imgtwo()" />
							</div>
							<div id="show222" style="margin-left: 400px;position: absolute;">
								<img id="show2">
							</div>
							<div style="margin-left: 600px;position: absolute;">
								<img id="show22">
							</div>
						</div>
					</div>
					<div style="margin-top: 50px" class="row">
						<div class="col-md-12" >
							 <div class="form-group" style="float: left;">
						 		<label style="position: absolute;margin-top: 50px" class="control-label" for="lastName">
									图片3:
										<div style="border: 1px #99D3F5 solid;width: 200px;height: 35px;text-align: center;" >
											<span class="fileerrorTip3"></span>
										</div>
										<div style="border: 1px #99D3F5 solid;width: 200px;height: 35px;text-align: center;position: absolute;margin-top: -35px" >
											<span class="showFileName3"></span>
										</div>
								</label>
								<a style="margin-left: 200px;margin-top: 67px" class="file3">选择文件
									<input id="img3"  type="file"  name="img3">
								</a>
								<c:if test="${ imgCount == 3}">
									<input type="button" id="button1" value="查看原图" onclick="imgthreeBasic()" />
								</c:if>
								<input type="button" id="button1" value="预览" onclick="imgthree()" />
							</div>
							<div id="show333" style="margin-left: 400px;position: absolute;">
								<img id="show3">
							</div>
							<div style="margin-left: 600px;position: absolute;">
								<img id="show33">
							</div>
						</div>
					</div>
				<br />
				<br />
				<button style="position:fixed; left:300px;top:100px;z-index:999;" type="submit" class="btn btn-default">提交</button>
			</form>
		</div>
	</div>
	<div>
		${product.document}
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var primaryid='${product.product_primary}';
		$.post("queryPrimaryProductAll",
			function(data){
				for(var o in data) {
					if('${product.product_primary}'!=data[o].primary_id){
						$("#product_primary").append('<option value="'+data[o].primary_id+'">'+data[o].primary_name+'</option>');
					}else{
						$("#product_primary").append('<option value="'+data[o].primary_id+'" selected="selected" >'+data[o].primary_name+'</option>');
					}
				}
			}
	   	)
	   	$.post("querySecondAll?id="+primaryid,
			function(data){
				for(var o in data) {
					if('${product.product_second}'!=data[o].second_id){
						$("#product_second").append('<option value="'+data[o].second_id+'">'+data[o].second_name+'</option>');
					}else{
						$("#product_second").append('<option value="'+data[o].second_id+'" selected="selected">'+data[o].second_name+'</option>');
					}
					 
				}
	    
			}
	   	)
	})
	$("#product_primary").change(function(){
		$("#product_second").html("<option value='0'>分类选择</option>");
		var id=$("#product_primary").val();
		 $.post("querySecondAll?id="+id,
			function(data){
				for(var o in data) {
					$("#product_second").append('<option value="'+data[o].second_id+'">'+data[o].second_name+'</option>');
				}
	    
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
			$("#min3").val("");
			alert("请输入大于"+min2+"的数");
		}else{
			$("#min3").val(parseInt(pid)+1);
		}
	}
	
	function imgone(){
		var r = new FileReader();
		f = document.getElementById('img1').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show1');
		document.getElementById('show1').style.height = '200px';
		document.getElementById('show1').style.width = '200px';
		r.onload = function  (e) {
			img.src = this.result;
		};
	}
	
	function imgoneBasic(){
		var filename = '${imgStauts1}';
		
		f = getRealPath()+'/upload/' + filename;
		var file_input_obj = document.getElementById("img1");
		file_input_obj.focus();
		$(".showFileName1").html(filename);
		$(".fileerrorTip1").html("");
		
		var img = document.getElementById('show11');
		document.getElementById('show11').style.height = '200px';
		document.getElementById('show11').style.width = '200px';
        img.src = f;
	}
	
	function imgtwo(){
		var r = new FileReader();
		f = document.getElementById('img2').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show2');
		document.getElementById('show2').style.height = '200px';
		document.getElementById('show2').style.width = '200px';
		r.onload = function  (e) {
			img.src = this.result;
		};
	}
	
	function imgtwoBasic(){
		var filename = '${imgStauts2}';
		f = getRealPath()+'/upload/' + filename;
		var file_input_obj = document.getElementById("img2");
		file_input_obj.focus();
		$(".showFileName2").html(filename);
		$(".fileerrorTip2").html("");
		
		var img = document.getElementById('show22');
		document.getElementById('show22').style.height = '200px';
		document.getElementById('show22').style.width = '200px';
        img.src = f;
		
	}
	
	function imgthree(){
		var r = new FileReader();
		f = document.getElementById('img3').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show3');
		document.getElementById('show3').style.height = '200px';
		document.getElementById('show3').style.width = '200px';
		r.onload = function  (e) {
			img.src = this.result;
		};
	}
	
	function imgthreeBasic(){
		var filename = '${imgStauts3}';
		f = getRealPath()+'/upload/' + filename;
		var file_input_obj = document.getElementById("img3");
		file_input_obj.focus();
		$(".showFileName3").html(filename);
		$(".fileerrorTip3").html("");
		
		var img = document.getElementById('show33');
		document.getElementById('show33').style.height = '200px';
		document.getElementById('show33').style.width = '200px';
        img.src = f;
	}
	
	$(".file1").on("change","input[type='file']",function(){
	    var filePath = $(this).val();
	    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
	        var arr = filePath.split('\\');
	        var fileName = arr[arr.length-1];
	        document.getElementById('show111').style.display = "";
	        $(".showFileName1").html(fileName);
	        $(".fileerrorTip1").html("");
	    }else{
	        $(".showFileName1").html("");
			if('${imgStauts1}' != ''){
				$(".fileerrorTip1").html("${imgStauts1}").show();
	    	}else{
	    		$(".fileerrorTip1").html("当前文件为空").show();
	    	}
			document.getElementById('show111').style.display = "none";
	        return false 
	    }
	})
	$(".file2").on("change","input[type='file']",function(){
	    var filePath = $(this).val();
	    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
	        var arr = filePath.split('\\');
	        var fileName = arr[arr.length-1];
	        document.getElementById('show222').style.display = "";
	        $(".showFileName2").html(fileName);
	        $(".fileerrorTip2").html("");
	    }else{
	        $(".showFileName2").html("");
	        if('${imgStauts2}' != ''){
				$(".fileerrorTip2").html("${imgStauts2}").show();
	    	}else{
	    		$(".fileerrorTip2").html("当前文件为空").show();
	    	}
	        document.getElementById('show222').style.display = "none";
	        return false 
	    }
	})
	$(".file3").on("change","input[type='file']",function(){
	    var filePath = $(this).val();
	    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
	        var arr = filePath.split('\\');
	        var fileName = arr[arr.length-1];
	        document.getElementById('show333').style.display = "";
	        $(".showFileName3").html(fileName);
	        $(".fileerrorTip3").html("");
	    }else{
	        $(".showFileName3").html("");
	        if('${imgStauts3}' != ''){
				$(".fileerrorTip3").html("${imgStauts3}").show();
	    	}else{
	    		$(".fileerrorTip3").html("当前文件为空").show();
	    	}
	        document.getElementById('show333').style.display = "none";
	        return false 
	    }
	})
	
	function getRealPath(){
        var localObj = window.location;
  		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host ;//    + "/"+ contextPath
        return basePath ;
    }
	
</script>
</html>
