<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
	标题：${material.material_name }<br>
	标签：${material.material_label }
</div><br>
<div style="margin-left: 160px;">
    ${material.material_content }
</div>
</body>
</html>