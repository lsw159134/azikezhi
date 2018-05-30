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
<!doctype html>
<html lang="Hans">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
    <title>修改/删除热卖代购</title>
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
<table cellpadding="0" cellspacing="0" border="1" >
    <tr>
        <th>id</th>
        <th>型号</th>
        <th>型号</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <c:forEach var="var" varStatus="status" items="${hotbuy}">
        <tr>
            <td><input type="hidden" class="uid" value="${var.hothelpbuyuid}"></td>
            <td><input type="text" value="${var.product}" class="product"></td>
            <td><input type="text" value="${var.price}"  class="price"></td>
            <td class="edit"><button>修改</button></td>
            <td class="del"><button>删除</button></td>
        </tr>
    </c:forEach>
</table>
</body>
<script type="text/javascript">
    $(function () {
        $(".edit").on("click", function () {
           var tr = $(this).parents("tr");
           var uid = tr.find(".uid").val();
           var product = tr.find(".product").val();
           var price = tr.find(".price").val();
           $.ajax({
               type:"post",
               url:"editHotHelpBuy",
               async:true,
               dataType: "json",
               data:{
                   hothelpbuyuid: uid,
                   product: product,
                   price: price
               },success:function (data) {
                    layer.msg(data.msg);
               }, error:function () {
                   layer.msg("失败");
               }
           })
        });

        $(".del").on("click", function () {
            var tr = $(this).parents("tr");
            var uid = tr.find(".uid").val();
            var product = tr.find(".product").val();
            var price = tr.find(".price").val();
            $.ajax({
                type:"post",
                url:"delHotHelpBuy",
                async:true,
                dataType: "json",
                data:{
                    hothelpbuyuid: uid
                },success:function (data) {
                    layer.msg(data.msg);
                }, error:function () {
                    layer.msg("失败");
                }
            })
        });
    });
</script>
</html>