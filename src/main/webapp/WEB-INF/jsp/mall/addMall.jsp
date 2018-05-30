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
</head>

<body>

<div>
    <form action="addMallProduct" method="post">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>图</th>
                <th>型号</th>
                <th>封装/规格</th>
                <th>品牌</th>
                <th>单价</th>
                <th>年份</th>
                <th>总数</th>
                <th>看货</th>
                <th>拍照</th>
                <th>锁货</th>
                <th>不加价</th>
                <th>限购</th>
                <th>限购数量</th>
                <th>相关型号1</th>
                <th>相关型号2</th>
                <th>相关型号3</th>
                <th>说明1</th>
                <th>说明2</th>
                <!--<th>说明3</th>-->
                <!--<th>说明4</th>-->
                <!--<th>说明5</th>-->
            </tr>
            <tr>
                <td><input type="file" name="productimgmall" class="img"></td>
                <td><input type="text" name="productnamemall" class="product"></td>
                <td><input type="text" name="productencapsulationmall" class="encapsulation"></td>
                <td><input type="text" name="brand" class="brand"></td>
                <td><input type="text" name="productpricemall" class="price"></td>
                <td><input type="text" name="year" class="year"></td>
                <td><input type="text" name="productcountmall" class="productcountmall"></td>
                <td>
                    <select name="supportseethegoodsmall" class="isLookGoods">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
                <td>
                    <select name="supporttackingpicturesmall" class="isPhotograph">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
                <td>
                    <select name="supportlockgoodsmall" class="isLockGoods">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
                <td>
                    <select name="productoriginalpricemall" class="isNotIncrease">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
                <td>
                    <select name="productpurchaselimitmall" class="isPurchaseRestrictions">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
                <td><input type="text" name="purchasechannelmall" class="isPurchaseNumber" disabled></td>
                <td><input type="text" name="relatedProduct" class="aboutProduct1"></td>
                <td><input type="text" name="relatedproduct1" class="aboutProduct2"></td>
                <td><input type="text" name="relatedproduct2" class="aboutProduct3"></td>
                <td><input type="text" name="relatedproduct3" class="explain1"></td>
                <td><input type="text" name="relatedproduct4" class="explain2"></td>
                <!--<td><input type="text" name="explain3" class="explain3"></td>-->
                <!--<td><input type="text" name="explain4" class="explain4"></td>-->
                <!--<td><input type="text" name="explain5" class="explain5"></td>-->
                <td><button class="button button-primary button-square button-small" id="add"><i class="fa fa-plus">+</i></button></td>
            </tr>

        </table>
        <button id="submit">提交</button>
    </form>
</div>



<%@include file="../../../include/footer.jsp" %>

</body>
</html>