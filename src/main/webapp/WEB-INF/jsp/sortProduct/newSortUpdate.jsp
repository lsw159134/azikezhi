<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html lang="lang=zh-cmn-Hans">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>在芯间-最专业的电子元器件查询平台</title>
		
		<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/sortAdd.css" />
		<style type="text/css">
			td{
				height: 30px;
				width: 600px;
				background-color: #C1CDC1;
			}
			input {
				width: 120px;
				text-align: center;
			}
			tr input{
				height: 30px;
				width: 600px;
				background-color: #C1CDC1;
				font-weight: bold;
			}
	
		</style>
	</head>
	<body>
		<div style="text-align: center;width: 1200px;height: 100%">
			<form action="update_Sort" method="post">
				<table  cellpadding="3" cellspacing="3" border="1px" style="width: 680px;text-align: center;margin-left: 22%">
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">型号</td>
						<td>
							<input type="text" name="sort_product" value="${sort.sort_product}"/>
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">描述</td>
						<td>
							<input type="text" name="sort_miaoshu" value="${sort.sort_miaoshu}"/>
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">封装</td>
						<td>
							<input type="text" name="sort_encapsulation" value="${sort.sort_encapsulation}"/>
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">连接性</td>
						<td>
							<input type="text" name="sort_lianjie" value="${sort.sort_lianjie}" />
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">外设</td>
						<td>
							<input type="text" name="sort_waishe" value="${sort.sort_waishe}" />
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">IO</td>
						<td>
							<input type="text" name="sort_io" value="${sort.sort_io}" />
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">RAM</td>
						<td>
							<input type="text" name="sort_ram" value="${sort.sort_ram}" />
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">数据转换</td>
						<td>
							<input type="text" name="sort_shujuzhuanhuan" value="${sort.sort_shujuzhuanhuan}" />
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">电压</td>
						<td>
							<input type="text" name="sort_dianya" value="${sort.sort_dianya}" />
						</td>
					</tr>
					<tr>
						<td style="width: 80px;background-color: #87CEEB;font-weight: bold;	">温度</td>
						<td>
							<input type="text" name="sort_wendu" value="${sort.sort_wendu}" />
						</td>
					</tr>
				</table>
				<input type="hidden" name="sort_id" value="${sort.sort_id}" />
				<input type="submit" id="button2" />
			</form>
		</div>
	</body>
	
	
</html>