<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
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
<script src="<%=basePath%>assets/dist/bootstrapValidator.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>assets/dist/bootstrapValidator.min.css">
<link href="<%=basePath%>vendor/sweetalert/sweet-alert.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>vendor/sweetalert/ie9.css" rel="stylesheet" media="screen">

</head>
<body>
	<section id="page-title" class="padding-top-15 padding-bottom-15">
	  <div class="row">
	    <div class="col-sm-7">
	      <h1 class="mainTitle">新增产品</h1>
	
	    </div>
	    <div class="col-sm-12">
	    	<fieldset style="background:#CBE9CF; color:#00060B">
		    	<form id="userForm" action="" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									产品名称：
								</label>
								<input type="text" class="form-control" id="product" name="product" placeholder="请输入名称">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									生产厂商：
								</label>
								<input type="text" class="form-control" id="manufacturer" name="manufacturer">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									封装：
								</label>
								<input type="text" class="form-control" id="encapsulation" name="encapsulation">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									批号：
								</label>
								<input type="text" class="form-control" id="lotnumber" name="lotnumber">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									库存：
								</label>
								<input type="text" class="form-control" style="float: top;" id="isgoodsinstock" name="isgoodsinstock" >
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<a onClick="xuanzhe();" href="javascript:;" style="margin-top: 10%;">
									<label class="control-label" for="lastName">
										供应商：
									</label>
									<input type="text" class="form-control" readonly="readonly" id="supplier" name="supplier" value="正品商城">
								</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									交易说明：
								</label>
								<input type="text" class="form-control" value="可出售样品" id="description" name="description" placeholder="请输入身份证号码">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label" for="lastName">
									资料：
								</label>
								<input type="text" class="form-control" value="可出售样品" id="p_data" name="p_data" placeholder="请输入身份证号码">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							价格区间：
						</div>
					</div>
					<div class="row" style="height: 40px;">
						<div class="col-md-6" >
							<div class="form-group">
								<label class="control-label" for="lastName">
									数量：
								</label>
								<input type="number" style="width: 80px;" id="min1" name="min1" value="1" readonly>
								~<input onblur="id1()" style="width: 80px;" type="number" id="max1" name="max1" placeholder="结束数量">
							</div>
						</div>
						<div class="col-md-3">
							 <div class="form-group">
								<label class="control-label" for="lastName">
									价格：
								</label>
								<input type="text" style="width: 100px;" id="price1" name="price1" placeholder="价格">
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
								<input type="number" id="min2" name="min2" readonly>
								~<input onblur="id2()" type="number" id="max2" name="max2" placeholder="结束数量">
							</div>
						</div>
						<div class="col-md-3">
							 <div class="form-group">
								<label class="control-label" for="lastName">
									价格：
								</label>
								<input type="text" style="width: 100px;" id="price2" name="price2" placeholder="价格">
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
								<input type="number" id="min3" name="min3" readonly>
								<span style="color: red;">~以上</span>
							</div>
						</div>
						<div class="col-md-3">
							 <div class="form-group">
								<label class="control-label" for="lastName">
									价格：
								</label>
								<input type="text" style="width: 100px;" id="price3" name="price3" placeholder="价格">
								<span id="price" style="color: red;"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" >
							 <div class="form-group" style="float: left;">
								<label class="control-label" for="lastName">
									数量单位：
								</label>
								<input type="text" style="width: 100px;" id="discount_unit" name="discount_unit" value="片" placeholder="数量单位">
							</div>
						</div>
					</div>
					<input id="editU" name="editU" type="hidden" value="1"/><!-- 添加页面选择 -->
					<input id="u_id" name="u_id" type="hidden" value=""/><!-- 仓库id -->
					<button type="button" onclick="quxiao();" class="btn btn-primary pull-right" style="margin-left: 20px;">
							取消 
					</button>
					<button type="button" id="submitForm" class="btn btn-primary pull-right">
							提交 <i class="fa fa-arrow-circle-right"></i>
					</button>
			</form>
	    	
	    	</fieldset>
	    </div>
	  </div>
	</section>
	
	<script src="<%=basePath%>vendor/modernizr/modernizr.js"></script>
	<script src="<%=basePath%>vendor/jquery-cookie/jquery.cookie.js"></script>
	<script src="<%=basePath%>vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="<%=basePath%>vendor/bootstrap-fileinput/jasny-bootstrap.js"></script>
	<script src="<%=basePath%>vendor/sweetalert/sweet-alert.min.js"></script>
	
<script type="text/javascript">
function id1() {
	var pid=document.getElementById("max1").value;
   	$("#min2").val(parseInt(pid)+1);
}
function id2() {
	var pid=document.getElementById("max2").value;
   	$("#min3").val(parseInt(pid)+1);
}
	function xuanzhe(){
		$('#container').load('<%=path%>/room/queryByRoom.do',$("#userForm").serialize());
	}
	function quxiao(){
		$('#container').load('pages/home.jsp');
	}
	$(function(){
		var date = new Date();
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    var hour=date.getHours();
	    var min=date.getMonth();
	    var sec=date.getSeconds();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = "cg"+date.getFullYear() + month  + strDate + hour + min + sec;
	    document.getElementById("u_id").value=currentdate;
	});
	$("#submitForm").click(function(){
		$.post("<%=path %>/1019/zai/xin/jian/addProduct",
   			$("#userForm").serialize(),
  	            function(data){
  					if(data.result=="fail"){
  						swal({
						title: "系统提示",
						text: data.errorMsg,
						type: "success",
						confirmButtonColor: "#007AFF"
					});
  					}else if(data.result=="seccuss"){
  						swal({
						title: "系统提示",
						text: "添加成功。",
						type: "success",
						confirmButtonColor: "#007AFF"
					},function() {
						$('#container').load('<%=path %>/1019/zai/xin/jian/editproduct');
					});
  					}
  				}
   	  	)
	})
</script>
</body>
</html>