<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
			table {
				text-align:center;
				border: 1px solid;
			}
			td{
				text-align:center;
				border: 1px solid;
			}
		</style>
	</head>
	<body>
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="7">
					下单时间
				</td>
				
			</tr>
			<tr>
				<td>
					序号
				</td>
				<td>
					型号
				</td>
				<td>
					单价				
				</td>
				<td>
					数量				
				</td>
				<td>
					付款金额				
				</td>
				<td>
					支付方式				
				</td>
				<td>
					备注信息				
				</td>
				<td>
					当前状态				
				</td>
			</tr>
			<c:forEach  items="sj_OrderList" var="orderList" varStatus="status">
				<tr>
					<td colspan="7">
						${orderList.product}
					</td>
					
				</tr>
				<tr>
					<td>
						${status.count}
					</td>
					<td>
						1
					</td>
					<td>
						2
					</td>
					<td>
						3
					</td>
					<td>
						4
					</td>
					<td>
						5
					</td>
					<td>
						6
					</td>
					<td>
						7
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>