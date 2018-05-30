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
<link rel="stylesheet" href="<%=basePath %>css/index.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
    <link rel="stylesheet" href="<%=basePath %>css/multiple-select.css" />
<script src="<%=contextPath %>/js/jquery-2.2.3.min.js"></script>
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
			<form id="form" method="post" enctype="multipart/form-data" style="width: 500px;margin-left: 160px;margin-top: 100px;float: left">
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">产品</div>
							<input type="hidden" name="productuuid" value="${product.productuuid }">
							<input type="text" class="form-control" placeholder="产品"
								id="product" name="product" value="${product.product }" style="text-transform:uppercase;" required />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">品牌</div>
							<input type="text" class="form-control" placeholder="品牌"
								id="manufacturer" name="manufacturer" value="${product.manufacturer }" style="text-transform:uppercase;" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">封装</div>
							<input type="text" class="form-control" placeholder="封装"
								id="encapsulation" name="encapsulation" value="${product.encapsulation }" style="text-transform:uppercase;" required />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">批号</div>
							<input type="text" class="form-control" placeholder="批号"
								id="lotnumber" name="lotnumber" value="${product.lotnumber }" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">库存</div>
							<input type="text" name="isgoodsinstock" value="${product.isgoodsinstock }" class="goodinstock input-text" required="required" placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">说明</div>
							<input type="text" class="form-control" placeholder="说明"
								id="description" name="description" value="${product.description }"/>
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">赞</div>
							<input type="text" name="product_evaluatezai" value="${product.product_evaluatezai }" class="goodinstock input-text" required="required" placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">踩</div>
							<input type="text" class="form-control" placeholder="踩"
								id="description" name="product_evaluatecai" value="${product.product_evaluatecai }"/>
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">质量</div>
							<select name="quality" class="form-control">
								<c:if test="${product.quality ==3 }">
									<option value="3" selected="selected">优质</option>
									<c:if test="${quality4 == 4 }">
										<option value="4">热卖</option>
									</c:if>
									<c:if test="${quality5 ==5 }">
										<option value="5">现货</option>
									</c:if>
									<c:if test="${quality6 ==6 }">
										<option value="6">普通</option>
									</c:if>
								</c:if>
								<c:if test="${product.quality ==4 }">
									<c:if test="${quality3 ==3 }">
										<option value="3">优质</option>
									</c:if>
									<option value="4" selected="selected">热卖</option>
									<c:if test="${quality5 ==5 }">
										<option value="5">现货</option>
									</c:if>
									<c:if test="${quality6 ==6 }">
										<option value="6">普通</option>
									</c:if>
								</c:if>
								<c:if test="${product.quality ==5 }">
									<c:if test="${quality3 ==3 }">
										<option value="3">优质</option>
									</c:if>
									<c:if test="${quality4 ==4 }">
										<option value="4">热卖</option>
									</c:if>
									<option value="5" selected="selected">现货</option>
									<c:if test="${quality6 ==6 }">
										<option value="6">普通</option>
									</c:if>
								</c:if>
								<c:if test="${product.quality ==6 }">
									<c:if test="${quality3 ==3 }">
										<option value="3">优质</option>
									</c:if>
									<c:if test="${quality4 ==4 }">
										<option value="4">热卖</option>
									</c:if>
									<c:if test="${quality5 ==5 }">
										<option value="5">现货</option>
									</c:if>
									<option value="6" selected="selected">普通</option>
								</c:if>
							</select>
						</div>
					</div>
				</div>
				<br/>
				<div>
					<button style="position:fixed; left:280px;top:300px;z-index:999;" id="submit" type="button" class="btn btn-default">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
<script src="<%=basePath %>js/jquery.min.js"></script>
<script src="<%=basePath %>js/jquery.multi-select.js"></script>
<script type="text/javascript">
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
	$("#submit").click(function(){
		$.ajax({
			type:"post",
            url:"<%=basePath %>1019/zai/xin/jian/upProductSupplierByAdmin",
            async:true,
            dataType: "json",
            data:  $("#form").serialize(),
			success : function(data){
				if(data.result=='success'){
					self.location=document.referrer;
				}
			}
        });
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
