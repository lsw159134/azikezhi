<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
         contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>添加样品</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/layer/2.4/skin/layer.css" id="layui_layer_skinlayercss">
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>mall/css/addMall.css">
    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
    <script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
    <script src="<%=basePath%>mall/js/addMall.js" type="text/javascript"></script>
    <style>
        *{
            font-size: 15px;
        }
        table{
            margin: 0px auto;
        }
        th,td{
            padding: 10px;
        }
    </style>
</head>
<body>
<form action="addHotHelpBuy" method="post">
<table cellpadding="0" cellspacing="0" border="1" >
    <tr>
        <th>型号</th>
        <th>价格</th>
        <th></th>
    </tr>
        <tr>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="price" class="price"></td>
            <td><input type="submit" value="提交"></td>
        </tr>
</table>
</form>



<%@include file="../../../include/footer.jsp" %>

</html>