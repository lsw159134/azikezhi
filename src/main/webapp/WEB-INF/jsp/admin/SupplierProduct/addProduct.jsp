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
	<div id="dialog">
		<div
			style="float: left; width: 1000px; margin-top: 7px; margin-left: 50px;">
			<textarea rows="12" cols="60" id="impro"
				style="border: 1px solid red; width: 600px; height: 150px;"></textarea>
			<%-- 上传产品数据文件 --%>
			<div id="upproducrdata_form" class="upproducrdata_form"
				style="margin-left: 50px; float: left; font-size: 25px;">
				<form id="pldr_form" name="pldr_form" method="post"
					enctype="multipart/form-data">
					批量导入<br />请选择要导入的数据文件：<br /> <input id="upProductDataForExcel"
						class="upProductDataForExcel" name="excelDataFile"
						accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
						type="file" /> <input id="upExcel" class="upExcel"
						onclick="uploadSupplierProductByExcel();"
						style="border: 1px solid gray; height: 25px; width: 60px; background-color: #E1E1E1; color: #000000"
						type="button" value="提交" />
				</form>
				<span style="color: red;">注意事项：
					<p>1.上传需要时间，请耐心等待导入成功提醒！</p>
					<p>2.只接受扩展名为 .xls和.xlsx的EXCEL 文件，文件大小不能超过2M！</p>
					<p>3.批量导入默认质量为普通库存，如果是其它库存，请单个添加!</p>
				</span>
			</div>
		</div>
		<p style="clear: both;"></p>
		<form action="<%=basePath%>1019/zai/xin/jian/addProductSupplier"
			method="post"
			style="float: left; padding-left: 30px; padding-top: 0px;">
			<div style="float: left; width: 170px;">
				&nbsp;&nbsp;<b style="color: red">*</b>型号
			</div>
			<div style="float: left; width: 140px;">
				&nbsp;<b style="color: red">*</b>品牌
			</div>
			<div style="float: left; width: 110px;">
				&nbsp;&nbsp;<b style="color: red">*</b>批号
			</div>
			<div style="float: left; width: 110px;">
				&nbsp;&nbsp;<b style="color: red">*</b>封装
			</div>
			<div style="float: left; width: 110px;">
				&nbsp;&nbsp;<b style="color: red">*</b>数量
			</div>
			<div style="float: left; width: 170px;">&nbsp;&nbsp;说明</div>
			<div style="float: left; width: 70px;">&nbsp;&nbsp;质量</div>
			<div style="float: left; width: 140px;">&nbsp;&nbsp;</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p1" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m1" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l1" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e1" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n1" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d1" type="text" maxlength="20"
					name="description" list="category">
				<datalist id="category">
					<option value="全新原装柜台现货">
					<option value="原装现货假一赔十">
					<option value="优势原装现货，支持实单">
				</datalist>
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="quality" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo" class="btn btn-default">搜索</button>
				</div>
				<div id="gong" style="clear: both;"></div>
				<input type="hidden" id="s1" name="supplier"> <input
					type="hidden" id="su1" name="supplieruuid"> <input
					type="hidden" id="c1" name="cellphone"> <input
					type="hidden" id="b1" name="supplier_bieming"> <input
					type="hidden" id="u1" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p2" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m2" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l2" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e2" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n2" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d2" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q2" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername2" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo2" class="btn btn-default">搜索</button>
				</div>
				<div id="gong2" style="clear: both;"></div>
				<input type="hidden" id="s2" name="supplier"> <input
					type="hidden" id="su2" name="supplieruuid"> <input
					type="hidden" id="c2" name="cellphone"> <input
					type="hidden" id="b2" name="supplier_bieming"> <input
					type="hidden" id="u2" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p3" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m3" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l3" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e3" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n3" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d3" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q3" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername3" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo3" class="btn btn-default">搜索</button>
				</div>
				<div id="gong3" style="clear: both;"></div>
				<input type="hidden" id="s3" name="supplier"> <input
					type="hidden" id="su3" name="supplieruuid"> <input
					type="hidden" id="c3" name="cellphone"> <input
					type="hidden" id="b3" name="supplier_bieming"> <input
					type="hidden" id="u3" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p4" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m4" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l4" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e4" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n4" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d4" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q4" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername4" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo4" class="btn btn-default">搜索</button>
				</div>
				<div id="gong4" style="clear: both;"></div>
				<input type="hidden" id="s4" name="supplier"> <input
					type="hidden" id="su4" name="supplieruuid"> <input
					type="hidden" id="c4" name="cellphone"> <input
					type="hidden" id="b4" name="supplier_bieming"> <input
					type="hidden" id="u4" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p5" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m5" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l5" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e5" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n5" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d5" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q5" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername5" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo5" class="btn btn-default">搜索</button>
				</div>
				<div id="gong5" style="clear: both;"></div>
				<input type="hidden" id="s5" name="supplier"> <input
					type="hidden" id="su5" name="supplieruuid"> <input
					type="hidden" id="c5" name="cellphone"> <input
					type="hidden" id="b5" name="supplier_bieming"> <input
					type="hidden" id="u5" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p6" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m6" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l6" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e6" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n6" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d6" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q6" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername6" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo6" class="btn btn-default">搜索</button>
				</div>
				<div id="gong6" style="clear: both;"></div>
				<input type="hidden" id="s6" name="supplier"> <input
					type="hidden" id="su6" name="supplieruuid"> <input
					type="hidden" id="c6" name="cellphone"> <input
					type="hidden" id="b6" name="supplier_bieming"> <input
					type="hidden" id="u6" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p7" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m7" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l7" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e7" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n7" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d7" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q7" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername7" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo7" class="btn btn-default">搜索</button>
				</div>
				<div id="gong7" style="clear: both;"></div>
				<input type="hidden" id="s7" name="supplier"> <input
					type="hidden" id="su7" name="supplieruuid"> <input
					type="hidden" id="c7" name="cellphone"> <input
					type="hidden" id="b7" name="supplier_bieming"> <input
					type="hidden" id="u7" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p8" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m8" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l8" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e8" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n8" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d8" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q8" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername8" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo8" class="btn btn-default">搜索</button>
				</div>
				<div id="gong8" style="clear: both;"></div>
				<input type="hidden" id="s8" name="supplier"> <input
					type="hidden" id="su8" name="supplieruuid"> <input
					type="hidden" id="c8" name="cellphone"> <input
					type="hidden" id="b8" name="supplier_bieming"> <input
					type="hidden" id="u8" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p9" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m9" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l9" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e9" type="text" name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n9" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d9" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q9" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername9" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo9" class="btn btn-default">搜索</button>
				</div>
				<div id="gong9" style="clear: both;"></div>
				<input type="hidden" id="s9" name="supplier"> <input
					type="hidden" id="su9" name="supplieruuid"> <input
					type="hidden" id="c9" name="cellphone"> <input
					type="hidden" id="b9" name="supplier_bieming"> <input
					type="hidden" id="u9" name="supplier_uid">
			</div>
			<br>
			<div style="float: left; width: 160px; margin-top: 7px;">
				<input class="form-control" id="p10" type="text" name="product"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<input class="form-control" id="m10" type="text" name="manufacturer"
					style="text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="l10" type="text" name="lotnumber"
					style="width: 90px;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="e10" type="text"
					name="encapsulation"
					style="width: 90px; text-transform: uppercase;">
			</div>
			<div style="float: left; width: 110px; margin-top: 7px;">
				<input class="form-control" id="n10" type="number"
					name="isgoodsinstock" style="width: 90px;">
			</div>
			<div style="float: left; width: 180px; margin-top: 7px;">
				<input class="form-control" id="d10" type="text" maxlength="20"
					name="description">
			</div>
			<div style="float: left; width: 80px; margin-top: 7px;">
				<select id="q10" class="form-control" name="quality"></select>
			</div>
			<div style="float: left; width: 150px; margin-top: 7px;">
				<div>
					<input type="text" class="form-control" placeholder="供应商名"
						id="suppliername10" name="aa" value=""
						style="float: left; width: 120px;" />
					<button style="float: left; margin-left: 20px" type="button"
						id="sousuo10" class="btn btn-default">搜索</button>
				</div>
				<div id="gong10" style="clear: both;"></div>
				<input type="hidden" id="s10" name="supplier"> <input
					type="hidden" id="su10" name="supplieruuid"> <input
					type="hidden" id="c10" name="cellphone"> <input
					type="hidden" id="b10" name="supplier_bieming"> <input
					type="hidden" id="u10" name="supplier_uid">
			</div>
			<br>
			<button type="submit" class="g-btn g-mr-5 tian"
				style="color: white; border: none; height: 30px; width: 80px; padding: 0px; cursor: pointer; padding-top: 1px\0; float: right; margin-right: 205px; margin-top: 25px; background: rgba(232, 34, 60, 0.78)">
				保存添加</button>
		</form>
	</div>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/jquery.multi-select.js"></script>
<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	
<%--通过Excel（.xls和.xlsx）文档导入供应商产品--%>
	function uploadSupplierProductByExcel() {
		var formData = new FormData($("#pldr_form")[0]);
		if (document.getElementById("upProductDataForExcel").value == "") {
			alert("请选择数据文件");
			return false;
		} else {
			$.ajax({
				url : 'addProductForExcel',
				type : 'POST',
				data : formData,
				dataType : "json",
				async : true,
				cache : false,
				contentType : false,
				processData : false,
				beforeSend : function() { //触发ajax请求开始时执行
					layer.msg('正在上传并处理数据，请勿关闭当前页面！', {
						icon : 1,
						time : 5000
					//2秒关闭（如果不配置，默认是3秒）
					}, function() {
						//do something
					}); /* layer.msg("文件上传中请等待！"); */
					var index = layer.load(1, {
						shade : [ 0.1, '#fff' ]
					//0.1透明度的白色背景
					});
					$('.upExcel').attr('onclick', 'javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
				},
				success : function(data) {
					if (data.result.indexOf("success") > -1) {
						var str = data.result.split(".");
						alert("本次有条" + str[1] + "数据添加成功！");
						location.reload();
					} else if (data.result == 'fail') {
						layer.msg('数据添加失败，请检查数据文件！', {
							icon : 1,
							time : 3000
						//2秒关闭（如果不配置，默认是3秒）
						}, function() {
							//do something
						}); /* layer.msg("文件上传中请等待！"); */
					} else if (data.result == 'login') {
						location.reload();
					}
				}
			});
		}
	}

	$(function() {
		/* $.post("queryBrandProductAll",
		function(data){
			for(var o in data) {
				$("#manufacturer").append('<option value="'+data[o].brand_id+'">'+data[o].brand_name+'</option>');
			}
		}
		) */
	});
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
	$("#sousuo")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername").val();
						$("#gong").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}
										})
					});
	$(document).on(
			'click',
			'.prev',
			function() {
				$("#gong").html("");
				var id = $(this).data("id");
				var name = $(this).data("name");
				var shouji = $(this).data("shouji");
				var bieming = $(this).data("bieming");
				var uid = $(this).data("uid");
				$("#u1").val(uid);
				$("#b1").val(bieming);
				$("#c1").val(shouji);
				$("#su1").val(id);
				$("#s1").val(name);
				var i = 0;
				var q1;
				var q2;
				var q3;
				var q4;
				$("#quality").html("");
				$.post("queryByGroup?keyword=" + id, function(data) {
					if (data == '') {
						$("#quality").append('<option value="3">优势</option>');
						$("#quality").append('<option value="4">热卖</option>');
						$("#quality").append('<option value="5">现货</option>');
						$("#quality").append('<option value="6">普通</option>');
					} else {
						for ( var o in data) {
							i++;
							if (i == 1) {
								q1 = data[o].quality;
								$("#d1").val(data[o].description);
							}
							if (i == 2) {
								q2 = data[o].quality;
							} else if (i == 3) {
								q3 = data[o].quality;
							} else if (i == 4) {
								q4 = data[o].quality;
							}
							if (data[o].quality == 3
									&& data[o].isgoodsinstock < 2) {
								$("#quality").append(
										'<option value="3">优势</option>');
							} else if (data[o].quality == 4
									&& data[o].isgoodsinstock < 10) {
								$("#quality").append(
										'<option value="4">热卖</option>');
							} else if (data[o].quality == 5
									&& data[o].isgoodsinstock < 20) {
								$("#quality").append(
										'<option value="5">现货</option>');
							} else if (data[o].quality == 6
									&& data[o].isgoodsinstock < 3000) {
								$("#quality").append(
										'<option value="6">普通</option>');
							} else if (data[o].quality == 6
									&& data[o].isgoodsinstock >= 3000) {
								$("#quality").append(
										'<option value="6">普通</option>');
							}
						}
						if (i == 1 && q1 == 3) {
							$("#quality").append(
									'<option value="4">热卖</option>');
							$("#quality").append(
									'<option value="5">现货</option>');
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 1 && q1 == 4) {
							$("#quality").append(
									'<option value="3">优势</option>');
							$("#quality").append(
									'<option value="5">现货</option>');
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 1 && q1 == 5) {
							$("#quality").append(
									'<option value="3">优势</option>');
							$("#quality").append(
									'<option value="4">热卖</option>');
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 1 && q1 == 6) {
							$("#quality").append(
									'<option value="3">优势</option>');
							$("#quality").append(
									'<option value="4">热卖</option>');
							$("#quality").append(
									'<option value="5">现货</option>');
						} else if (i == 2 && q1 == 3 && q2 == 4) {
							$("#quality").append(
									'<option value="5">现货</option>');
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 2 && q1 == 3 && q2 == 5) {
							$("#quality").append(
									'<option value="4">热卖</option>');
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 2 && q1 == 3 && q2 == 6) {
							$("#quality").append(
									'<option value="4">热卖</option>');
							$("#quality").append(
									'<option value="5">现货</option>');
						} else if (i == 2 && q1 == 4 && q2 == 5) {
							$("#quality").append(
									'<option value="3">优势</option>');
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 2 && q1 == 4 && q2 == 6) {
							$("#quality").append(
									'<option value="3">优势</option>');
							$("#quality").append(
									'<option value="5">现货</option>');
						} else if (i == 2 && q1 == 5 && q2 == 6) {
							$("#quality").append(
									'<option value="3">优势</option>');
							$("#quality").append(
									'<option value="4">热卖</option>');
						} else if (i == 3 && q1 == 3 && q2 == 4 && q3 == 5) {
							$("#quality").append(
									'<option value="6">普通</option>');
						} else if (i == 3 && q1 == 4 && q2 == 5 && q3 == 6) {
							$("#quality").append(
									'<option value="3">优势</option>');
						} else if (i == 3 && q1 == 3 && q2 == 4 && q3 == 6) {
							$("#quality").append(
									'<option value="5">现货</option>');
						} else if (i == 3 && q1 == 3 && q2 == 5 && q3 == 6) {
							$("#quality").append(
									'<option value="4">热卖</option>');
						}
					}
				})
			});

	$("#sousuo2")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername2").val();
						$("#gong2").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong2")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev2" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}
										})
					});

	$(document)
			.on(
					'click',
					'.prev2',
					function() {
						$("#gong2").html("");
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u2").val(uid);
						$("#b2").val(bieming);
						$("#c2").val(shouji);
						$("#su2").val(id);
						$("#s2").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q2").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '' || data == null) {
												$("#q2")
														.append(
																'<option value="3">优势</option>');
												$("#q2")
														.append(
																'<option value="4">热卖</option>');
												$("#q2")
														.append(
																'<option value="5">现货</option>');
												$("#q2")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d2")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q2")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q2")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q2")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q2")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q2")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q2")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q2")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q2")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q2")
															.append(
																	'<option value="4">热卖</option>');
												}
											}
										})
					});

	$("#sousuo3")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername3").val();
						$("#gong3").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong3")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev3" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev3',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u2").val(uid);
						$("#b3").val(bieming);
						$("#c3").val(shouji);
						$("#su3").val(id);
						$("#s3").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q3").html("");
						$("#gong3").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q3")
														.append(
																'<option value="3">优势</option>');
												$("#q3")
														.append(
																'<option value="4">热卖</option>');
												$("#q3")
														.append(
																'<option value="5">现货</option>');
												$("#q3")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d3")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q3")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q3")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q3")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q3")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q3")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q3")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q3")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q3")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q3")
															.append(
																	'<option value="4">热卖</option>');
												}
											}
										})
					});

	$("#sousuo4")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername4").val();
						$("#gong4").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong4")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev4" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev4',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u4").val(uid);
						$("#b4").val(bieming);
						$("#c4").val(shouji);
						$("#su4").val(id);
						$("#s4").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q4").html("");
						$("#gong4").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q4")
														.append(
																'<option value="3">优势</option>');
												$("#q4")
														.append(
																'<option value="4">热卖</option>');
												$("#q4")
														.append(
																'<option value="5">现货</option>');
												$("#q4")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d4")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q4")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q4")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q4")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q4")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q4")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q4")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q4")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q4")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q4")
															.append(
																	'<option value="4">热卖</option>');
												}
											}
										})
					});

	$("#sousuo5")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername5").val();
						$("#gong5").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong5")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev5" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev5',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u5").val(uid);
						$("#b5").val(bieming);
						$("#c5").val(shouji);
						$("#su5").val(id);
						$("#s5").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q5").html("");
						$("#gong5").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q5")
														.append(
																'<option value="3">优势</option>');
												$("#q5")
														.append(
																'<option value="4">热卖</option>');
												$("#q5")
														.append(
																'<option value="5">现货</option>');
												$("#q5")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d5")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q5")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q5")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q5")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q5")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q5")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q5")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q5")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q5")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q5")
															.append(
																	'<option value="4">热卖</option>');
												}
											}
										})
					});

	$("#sousuo6")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername6").val();
						$("#gong6").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong6")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev6" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev6',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u6").val(uid);
						$("#b6").val(bieming);
						$("#c6").val(shouji);
						$("#su6").val(id);
						$("#s6").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q6").html("");
						$("#gong6").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q6")
														.append(
																'<option value="3">优势</option>');
												$("#q6")
														.append(
																'<option value="4">热卖</option>');
												$("#q6")
														.append(
																'<option value="5">现货</option>');
												$("#q6")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d6")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q6")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q6")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q6")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q6")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q6")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q6")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q6")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q6")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q6")
															.append(
																	'<option value="4">热卖</option>');
												}
											}
										})
					});

	$("#sousuo7")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername7").val();
						$("#gong7").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong7")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev7" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev7',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u7").val(uid);
						$("#b7").val(bieming);
						$("#c7").val(shouji);
						$("#su7").val(id);
						$("#s7").val(name);
						var i = 0;
						var q1 = 0;
						var q2 = 0;
						var q3 = 0;
						var q4 = 0;
						$("#q7").html("");
						$("#gong7").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q7")
														.append(
																'<option value="3">优势</option>');
												$("#q7")
														.append(
																'<option value="4">热卖</option>');
												$("#q7")
														.append(
																'<option value="5">现货</option>');
												$("#q7")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d7")
																.val(
																		data[o].description);
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														q1++;
														$("#q7")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														q2++;
														$("#q7")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														q3++;
														$("#q7")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														q4++;
														$("#q7")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q7")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (q1 == 0) {
													$("#q7")
															.append(
																	'<option value="3">优势</option>');
												}
												if (q2 == 0) {
													$("#q7")
															.append(
																	'<option value="4">热卖</option>');
												}
												if (q3 == 0) {
													$("#q7")
															.append(
																	'<option value="5">现货</option>');
												}
												if (q4 == 0) {
													$("#q7")
															.append(
																	'<option value="6">普通</option>');
												}
											}
										})
					});

	$("#sousuo8")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername8").val();
						$("#gong8").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong8")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev8" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev8',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u8").val(uid);
						$("#b8").val(bieming);
						$("#c8").val(shouji);
						$("#su8").val(id);
						$("#s8").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q8").html("");
						$("#gong8").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q8")
														.append(
																'<option value="3">优势</option>');
												$("#q8")
														.append(
																'<option value="4">热卖</option>');
												$("#q8")
														.append(
																'<option value="5">现货</option>');
												$("#q8")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d8")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q8")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q8")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q8")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q8")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q8")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q8")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q8")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q8")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q8")
															.append(
																	'<option value="6">普通</option>');
												}
											}
										})
					});

	$("#sousuo9")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername9").val();
						$("#gong9").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong9")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev9" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document)
			.on(
					'click',
					'.prev9',
					function() {
						var id = $(this).data("id");
						var name = $(this).data("name");
						var shouji = $(this).data("shouji");
						var bieming = $(this).data("bieming");
						var uid = $(this).data("uid");
						$("#u9").val(uid);
						$("#b9").val(bieming);
						$("#c9").val(shouji);
						$("#su9").val(id);
						$("#s9").val(name);
						var i = 0;
						var q1;
						var q2;
						var q3;
						var q4;
						$("#q9").html("");
						$("#gong9").html("");
						$
								.post(
										"queryByGroup?keyword=" + id,
										function(data) {
											if (data == '') {
												$("#q9")
														.append(
																'<option value="3">优势</option>');
												$("#q9")
														.append(
																'<option value="4">热卖</option>');
												$("#q9")
														.append(
																'<option value="5">现货</option>');
												$("#q9")
														.append(
																'<option value="6">普通</option>');
											} else {
												for ( var o in data) {
													i++;
													if (i == 1) {
														q1 = data[o].quality;
														$("#d9")
																.val(
																		data[o].description);
													}
													if (i == 2) {
														q2 = data[o].quality;
													} else if (i == 3) {
														q3 = data[o].quality;
													} else if (i == 4) {
														q4 = data[o].quality;
													}
													if (data[o].quality == 3
															&& data[o].isgoodsinstock < 2) {
														$("#q9")
																.append(
																		'<option value="3">优势</option>');
													} else if (data[o].quality == 4
															&& data[o].isgoodsinstock < 10) {
														$("#q9")
																.append(
																		'<option value="4">热卖</option>');
													} else if (data[o].quality == 5
															&& data[o].isgoodsinstock < 20) {
														$("#q9")
																.append(
																		'<option value="5">现货</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock < 3000) {
														$("#q9")
																.append(
																		'<option value="6">普通</option>');
													} else if (data[o].quality == 6
															&& data[o].isgoodsinstock >= 3000) {
														$("#q9")
																.append(
																		'<option value="6">普通</option>');
													}
												}
												if (i == 1 && q1 == 3) {
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 4) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 5) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 1 && q1 == 6) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 4) {
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 5) {
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 3
														&& q2 == 6) {
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 5) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 2 && q1 == 4
														&& q2 == 6) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 2 && q1 == 5
														&& q2 == 6) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 5) {
													$("#q9")
															.append(
																	'<option value="6">普通</option>');
												} else if (i == 3 && q1 == 4
														&& q2 == 5 && q3 == 6) {
													$("#q9")
															.append(
																	'<option value="3">优势</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 4 && q3 == 6) {
													$("#q9")
															.append(
																	'<option value="5">现货</option>');
												} else if (i == 3 && q1 == 3
														&& q2 == 5 && q3 == 6) {
													$("#q9")
															.append(
																	'<option value="4">热卖</option>');
												}
											}
										})
					});

	$("#sousuo10")
			.on(
					"click",
					function() {
						var suppliername = $("#suppliername10").val();
						$("#gong10").html("");
						$
								.post(
										"supplierListname?keyword="
												+ suppliername,
										function(data) {
											for ( var o in data) {
												$("#gong10")
														.append(
																'<p style="margin-top:30px;">'
																		+ data[o].suppliername
																		+ '<button class="prev10" type="button" data-name="'+data[o].suppliername+'" data-id="'+data[o].supplieruuid+'" data-shouji="'+data[o].cellphone+'" data-bieming="'+data[o].supplier_bieming+'" data-uid="'+data[o].supplier_uid+'" style="color: #333333;background-color: #ffffff;border-color: #adadad;width: 40px;height: 30px;">选择</button></p>');
											}

										})
					});

	$(document).on(
			'click',
			'.prev10',
			function() {
				var id = $(this).data("id");
				var name = $(this).data("name");
				var shouji = $(this).data("shouji");
				var bieming = $(this).data("bieming");
				var uid = $(this).data("uid");
				$("#u10").val(uid);
				$("#b10").val(bieming);
				$("#c10").val(shouji);
				$("#su10").val(id);
				$("#s10").val(name);
				var i = 0;
				var q1;
				var q2;
				var q3;
				var q4;
				$("#q10").html("");
				$("#gong10").html("");
				$.post("queryByGroup?keyword=" + id, function(data) {
					if (data == '') {
						$("#q10").append('<option value="3">优势</option>');
						$("#q10").append('<option value="4">热卖</option>');
						$("#q10").append('<option value="5">现货</option>');
						$("#q10").append('<option value="6">普通</option>');
					} else {
						for ( var o in data) {
							i++;
							if (i == 1) {
								q1 = data[o].quality;
								$("#d10").val(data[o].description);
							}
							if (i == 2) {
								q2 = data[o].quality;
							} else if (i == 3) {
								q3 = data[o].quality;
							} else if (i == 4) {
								q4 = data[o].quality;
							}
							if (data[o].quality == 3
									&& data[o].isgoodsinstock < 2) {
								$("#q10").append(
										'<option value="3">优势</option>');
							} else if (data[o].quality == 4
									&& data[o].isgoodsinstock < 10) {
								$("#q10").append(
										'<option value="4">热卖</option>');
							} else if (data[o].quality == 5
									&& data[o].isgoodsinstock < 20) {
								$("#q10").append(
										'<option value="5">现货</option>');
							} else if (data[o].quality == 6
									&& data[o].isgoodsinstock < 3000) {
								$("#q10").append(
										'<option value="6">普通</option>');
							} else if (data[o].quality == 6
									&& data[o].isgoodsinstock >= 3000) {
								$("#q10").append(
										'<option value="6">普通</option>');
							}
						}
						if (i == 1 && q1 == 3) {
							$("#q10").append('<option value="4">热卖</option>');
							$("#q10").append('<option value="5">现货</option>');
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 1 && q1 == 4) {
							$("#q10").append('<option value="3">优势</option>');
							$("#q10").append('<option value="5">现货</option>');
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 1 && q1 == 5) {
							$("#q10").append('<option value="3">优势</option>');
							$("#q10").append('<option value="4">热卖</option>');
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 1 && q1 == 6) {
							$("#q10").append('<option value="3">优势</option>');
							$("#q10").append('<option value="4">热卖</option>');
							$("#q10").append('<option value="5">现货</option>');
						} else if (i == 2 && q1 == 3 && q2 == 4) {
							$("#q10").append('<option value="5">现货</option>');
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 2 && q1 == 3 && q2 == 5) {
							$("#q10").append('<option value="4">热卖</option>');
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 2 && q1 == 3 && q2 == 6) {
							$("#q10").append('<option value="4">热卖</option>');
							$("#q10").append('<option value="5">现货</option>');
						} else if (i == 2 && q1 == 4 && q2 == 5) {
							$("#q10").append('<option value="3">优势</option>');
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 2 && q1 == 4 && q2 == 6) {
							$("#q10").append('<option value="3">优势</option>');
							$("#q10").append('<option value="5">现货</option>');
						} else if (i == 2 && q1 == 5 && q2 == 6) {
							$("#q10").append('<option value="3">优势</option>');
							$("#q10").append('<option value="4">热卖</option>');
						} else if (i == 3 && q1 == 3 && q2 == 4 && q3 == 5) {
							$("#q10").append('<option value="6">普通</option>');
						} else if (i == 3 && q1 == 4 && q2 == 5 && q3 == 6) {
							$("#q10").append('<option value="3">优势</option>');
						} else if (i == 3 && q1 == 3 && q2 == 4 && q3 == 6) {
							$("#q10").append('<option value="5">现货</option>');
						} else if (i == 3 && q1 == 3 && q2 == 5 && q3 == 6) {
							$("#q10").append('<option value="4">热卖</option>');
						}
					}
				})
			});

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
	var A = 0, B = 0, C = 0, D = 0, E = 0, F = 0, G = 0, H = 0, I = 0, J = 0, K = 0;
	$("#p1").on("input propertychange", function() {
		var $this = $(this);
		var expressnumber = $this.val();
		$("#p2").val(expressnumber);
		$("#p3").val(expressnumber);
		$("#p4").val(expressnumber);
		$("#p5").val(expressnumber);
		$("#p6").val(expressnumber);
		$("#p7").val(expressnumber);
		$("#p8").val(expressnumber);
		$("#p9").val(expressnumber);
		$("#p10").val(expressnumber);
	});
	$("#m1").on("input propertychange", function() {
		var $this = $(this);
		var expressnumber = $this.val();
		$("#m2").val(expressnumber);
		$("#m3").val(expressnumber);
		$("#m4").val(expressnumber);
		$("#m5").val(expressnumber);
		$("#m6").val(expressnumber);
		$("#m7").val(expressnumber);
		$("#m8").val(expressnumber);
		$("#m9").val(expressnumber);
		$("#m10").val(expressnumber);
	});
	/* $("#l1").on("input propertychange", function() { 
	    var $this = $(this);
	    var expressnumber = $this.val();
	    $("#l2").val(expressnumber);
		$("#l3").val(expressnumber);
		$("#l4").val(expressnumber);
		$("#l5").val(expressnumber);
		$("#l6").val(expressnumber);
		$("#l7").val(expressnumber);
		$("#l8").val(expressnumber);
		$("#l9").val(expressnumber);
		$("#l10").val(expressnumber);
	}); */
	$("#e1").on("input propertychange", function() {
		var $this = $(this);
		var expressnumber = $this.val();
		$("#e2").val(expressnumber);
		$("#e3").val(expressnumber);
		$("#e4").val(expressnumber);
		$("#e5").val(expressnumber);
		$("#e6").val(expressnumber);
		$("#e7").val(expressnumber);
		$("#e8").val(expressnumber);
		$("#e9").val(expressnumber);
		$("#e10").val(expressnumber);
	});
	/* $("#n1").on("input propertychange", function() { 
	    var $this = $(this);
	    var expressnumber = $this.val();
	    $("#n2").val(expressnumber);
		$("#n3").val(expressnumber);
		$("#n4").val(expressnumber);
		$("#n5").val(expressnumber);
		$("#n6").val(expressnumber);
		$("#n7").val(expressnumber);
		$("#n8").val(expressnumber);
		$("#n9").val(expressnumber);
		$("#n10").val(expressnumber);
	}); */
</script>
</html>
