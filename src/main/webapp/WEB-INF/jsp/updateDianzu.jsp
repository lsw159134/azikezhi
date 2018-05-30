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
<link rel="stylesheet" href="<%=basePath%>css/index.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=contextPath%>/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.validate.min.js"></script>
<style type="text/css">
a:hover {
	text-decoration: none
}

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

.file3 {
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
	height: 34px;
	width: 250px;
	border: 1px solid #000;
	background: #717a77;
	/* CSS3 Styling */
	background: -moz-linear-gradient(bottom, #0a0809, #0a0f0b 50%, #6d7673 50%, #afbdc0);
	background: -webkit-gradient(linear, left bottom, left top, from(#0a0809),
		to(#afbdc0), color-stop(0.5, #0a0f0b), color-stop(0.5, #6d7673));
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 20px;
	-moz-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.5);
	box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.5);
	/* Text Styling */
	color: #ff7d00;
	text-shadow: 0px -1px 0px #000;
	font-family: 'HighlandGothicFLFRegular', Impact, 'Arial Black',
		sans-serif;
	font-size: 20px;
	padding-bottom: 5px;
}

/* Pseudo-classes for interactivity */
#button1:hover {
	font-size: 21px;
	-moz-box-shadow: 0px 0px 7px rgba(255, 255, 255, 1);
	-webkit-box-shadow: 0px 0px 7px rgba(255, 255, 255, 1);
	box-shadow: 0px 0px 7px rgba(255, 255, 255, 1);
}

#button1:focus {
	-moz-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.75);
	-webkit-box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.75);
	box-shadow: 0px 0px 7px rgba(255, 255, 255, 0.75);
}

#button1:active {
	border-width: 2px 1px 1px 2px;
	font-size: 20px;
}

.fixed {
	position: fixed;
	left: 50px;
	top: 100px;
	width: 200px;
	height: 50px;
	background-color: #000;
	z-index: 999;
}
</style>
</head>
<body class="container-fluid" style="margin-top: 20px;">
<%-- 	<c:if test="${request.result eq 'fail'  }">
		<script type="text/javascript">
			alert("修改失败");
		</script>
	</c:if> --%>
	<c:if test="${result ne '' || result eq 1}">
		<script type="text/javascript">
			alert("a"+requestScope.result);
		</script>
	</c:if>
	<div class="row">
		<div class="col-xs-6" style="width: 600px">
			<form id="form" method="post"
				action="<%=basePath%>1019/zai/xin/jian/updateDianzuByPrimaryKey"
				enctype="multipart/form-data"
				style="width: 500px; margin-left: 200px; margin-top: 50px;">
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
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">品牌</div>
							<input type="text" class="form-control" placeholder="品牌"
								id="manufacturer" name="manufacturer"
								value="${product.manufacturer }" required />
						</div>
					</div>
					<div class="col-md-6"
						style="position: absolute; margin-left: 600px;">
						<div class="input-group">
							<div class="input-group-addon">标记是否打电话</div>
							<select style="font-weight: bold; font-size: 20px; color: red;"
								class="form-control" id="complaintprice" name="complaintprice">
								<c:if test="${product.complaintprice == 0}">
									<option selected="selected" value="0"
										style="color: green; font-weight: bold;">√</option>
									<option value="1" style="color: red; font-weight: bold;">×</option>
								</c:if>
								<c:if test="${product.complaintprice == 1}">
									<option value="0" style="color: green; font-weight: bold;">√</option>
									<option selected="selected" value="1"
										style="color: red; font-weight: bold;">×</option>
								</c:if>
							</select>
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
								value="${product.encapsulation }" required />
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">描述</div>
							<input type="text" class="form-control" placeholder="包装"
								id="description" name="description"
								value="${product.description }" />
						</div>
					</div>
				</div>
				<br />
				<div class="row">
				<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">阻值</div>
							<input type="text" name="zhuzhi"
								value="${product.zhuzhi}" class="goodinstock input-text"
								required="required" placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">精确度</div>
							<input type="text" class="form-control" placeholder="价格(元)"
								id="price" name="jingquedu" value="${product.jingquedu}" required />
							<div class="input-group-addon">元</div>
						</div>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">库存</div>
							<input type="text" name="isgoodsinstock"
								value="${product.isgoodsinstock}" class="goodinstock input-text"
								required="required" placeholder="请输入产品数量">
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">价格</div>
							<input type="text" class="form-control" placeholder="价格(元)"
								id="price" name="price" value="${product.price}" required />
							<div class="input-group-addon">元</div>
						</div>
					</div>
				</div>
				<br />
		<div class="row">
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">单位</div>
							 <select name="danwei"  class="form-control" style="width: 140px"> 
							     <option>---请选择---</option>
							 <c:if test="${product.danwei eq '片'}">
							  <option >盘</option>
							     <option selected="selected">片</option>
							 </c:if>
							    <c:if test="${product.danwei eq '盘'}">
							     <option >片</option>
							     <option selected="selected">盘</option>
							 </c:if>
							 </select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group">
							<div class="input-group-addon">包装</div>
							 <select name="baozhuang"  class="form-control" style="width: 140px"> 
							     <option>---请选择---</option>
							 <c:if test="${product.baozhuang eq '样品'}">
							 <option>整盘</option>
							     <option selected="selected">样品</option>
							 </c:if>
							    <c:if test="${product.baozhuang eq '整盘'}">
							     <option selected="selected">整盘</option>
							       <option>样品</option>
							  </c:if>
							 </select>
						</div>
					</div>
				</div>
				<br />
				<br />
		
				<button
					type="submit" class="btn btn-default">提交</button>
			</form>
		</div>
	</div>

</body>
<script type="text/javascript">
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
			$("#min3").val("");
			alert("请输入大于" + min2 + "的数");
		} else {
			$("#min3").val(parseInt(pid) + 1);
		}
	}

	function imgone() {
		var r = new FileReader();
		f = document.getElementById('img1').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show1');
		document.getElementById('show1').style.height = '200px';
		document.getElementById('show1').style.width = '200px';
		r.onload = function(e) {
			img.src = this.result;
		};
	}

	function imgoneBasic() {
		var filename = '${imgStauts1}';

		f = getRealPath() + '/upload/' + filename;
		var file_input_obj = document.getElementById("img1");
		file_input_obj.focus();
		$(".showFileName1").html(filename);
		$(".fileerrorTip1").html("");

		var img = document.getElementById('show11');
		document.getElementById('show11').style.height = '200px';
		document.getElementById('show11').style.width = '200px';
		img.src = f;
	}

	function imgtwo() {
		var r = new FileReader();
		f = document.getElementById('img2').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show2');
		document.getElementById('show2').style.height = '200px';
		document.getElementById('show2').style.width = '200px';
		r.onload = function(e) {
			img.src = this.result;
		};
	}

	function imgtwoBasic() {
		var filename = '${imgStauts2}';
		f = getRealPath() + '/upload/' + filename;
		var file_input_obj = document.getElementById("img2");
		file_input_obj.focus();
		$(".showFileName2").html(filename);
		$(".fileerrorTip2").html("");

		var img = document.getElementById('show22');
		document.getElementById('show22').style.height = '200px';
		document.getElementById('show22').style.width = '200px';
		img.src = f;

	}

	function imgthree() {
		var r = new FileReader();
		f = document.getElementById('img3').files[0];
		r.readAsDataURL(f);
		var img = document.getElementById('show3');
		document.getElementById('show3').style.height = '200px';
		document.getElementById('show3').style.width = '200px';
		r.onload = function(e) {
			img.src = this.result;
		};
	}

	function imgthreeBasic() {
		var filename = '${imgStauts3}';
		f = getRealPath() + '/upload/' + filename;
		var file_input_obj = document.getElementById("img3");
		file_input_obj.focus();
		$(".showFileName3").html(filename);
		$(".fileerrorTip3").html("");

		var img = document.getElementById('show33');
		document.getElementById('show33').style.height = '200px';
		document.getElementById('show33').style.width = '200px';
		img.src = f;
	}

	$(".file1").on("change", "input[type='file']", function() {
		var filePath = $(this).val();
		if (filePath.indexOf("jpg") != -1 || filePath.indexOf("png") != -1) {
			var arr = filePath.split('\\');
			var fileName = arr[arr.length - 1];
			document.getElementById('show111').style.display = "";
			$(".showFileName1").html(fileName);
			$(".fileerrorTip1").html("");
		} else {
			$(".showFileName1").html("");
			if ('${imgStauts1}' != '') {
				$(".fileerrorTip1").html("${imgStauts1}").show();
			} else {
				$(".fileerrorTip1").html("当前文件为空").show();
			}
			document.getElementById('show111').style.display = "none";
			return false
		}
	})
	$(".file2").on("change", "input[type='file']", function() {
		var filePath = $(this).val();
		if (filePath.indexOf("jpg") != -1 || filePath.indexOf("png") != -1) {
			var arr = filePath.split('\\');
			var fileName = arr[arr.length - 1];
			document.getElementById('show222').style.display = "";
			$(".showFileName2").html(fileName);
			$(".fileerrorTip2").html("");
		} else {
			$(".showFileName2").html("");
			if ('${imgStauts2}' != '') {
				$(".fileerrorTip2").html("${imgStauts2}").show();
			} else {
				$(".fileerrorTip2").html("当前文件为空").show();
			}
			document.getElementById('show222').style.display = "none";
			return false
		}
	})
	$(".file3").on("change", "input[type='file']", function() {
		var filePath = $(this).val();
		if (filePath.indexOf("jpg") != -1 || filePath.indexOf("png") != -1) {
			var arr = filePath.split('\\');
			var fileName = arr[arr.length - 1];
			document.getElementById('show333').style.display = "";
			$(".showFileName3").html(fileName);
			$(".fileerrorTip3").html("");
		} else {
			$(".showFileName3").html("");
			if ('${imgStauts3}' != '') {
				$(".fileerrorTip3").html("${imgStauts3}").show();
			} else {
				$(".fileerrorTip3").html("当前文件为空").show();
			}
			document.getElementById('show333').style.display = "none";
			return false
		}
	})

	function getRealPath() {
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host;//    + "/"+ contextPath
		return basePath;
	}
</script>
</html>
