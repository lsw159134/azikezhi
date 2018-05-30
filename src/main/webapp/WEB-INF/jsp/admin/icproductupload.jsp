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
    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
</head>
<body>
<div id="searchSupplier">
    <input type="text" placeholder="查询供应商" style="width:200px;height:35px;border-color:red;padding:5px;" id="supplier">
    <button style="padding:5px 10px; font-size:15px;" id="search">提交</button>
    <div class="supplier12"></div>
</div>

<textarea cols="50" rows="70" style="width:200px;height: 500px;margin-left: -50px;">
</textarea>
<form action="addHotHelpBuy" method="post">
    <table cellpadding="0" cellspacing="0" border="1" style="margin-left:10px">
        <tr>
            <th>供应商</th>
            <th>型号</th>
            <th>厂家</th>
            <th>批号</th>
            <th>数量</th>
            <th>封装</th>
            <th>QQ</th>
            <th>交易说明</th>
            <th>是否现货</th>
            <th>价格</th>
            <th>质量</th>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select></td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
            <td><input type="text" name="supplier" class="supplier"></td>
            <td><input type="text" name="product" class="product"></td>
            <td><input type="text" name="manufacturer" class="manufacturer"></td>
            <td><input type="text" name="lotnumber" class="lotnumber"></td>
            <td><input type="text" name="keywords" class="keywords"></td>
            <td><input type="text" name="encapsulation" class="encapsulation"></td>
            <td><input type="text" name="qq" class="qq"></td>
            <td><input type="text" name="description" class="description" value="可出售样品"></td>
            <td>
                <select name="isgoodsinstock" style="width:80px;height:25px;">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </td>
            <td><input type="text" name="price" class="price" value="0"></td>
            <td><input type="text" name="quality" class="quality" value="7"></td>
            <td><input type="hidden" name="supplieruuid" class="supplieruuid"></td>
        </tr>
        <tr>
           <td rowspan="10"><input type="button" value="提交" class="submit"></td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function(){

        $(".submit").on("click", function () {
            var tr = $("tr");
            var json = new Array;

            var a;
            for (var i = 1; i <= $(".supplier").length; i++){
                if ($('tr').eq(i).find('.product').val() != "" && $('tr').eq(i).find('.manufacturer').val() != ""){
                    a  = '{"supplier":' + '"' + $('tr').eq(i).find('.supplier').val() + '",';
                    a += '"product":' +  '"' + $('tr').eq(i).find('.product').val() + '",';
                    a += '"manufacturer":' + '"' + $('tr').eq(i).find('.manufacturer').val() + '",';
                    a += '"lotnumber":' + '"' + $('tr').eq(i).find('.lotnumber').val() + '",';
                    a += '"keywords":' + '"' + $('tr').eq(i).find('.keywords').val() + '",';
                    a += '"encapsulation":' + '"' + $('tr').eq(i).find('.encapsulation').val() + '",';
                    a += '"description":' + '"' + $('tr').eq(i).find('.description').val() + '",';
                    a += '"isgoodsinstock":' + '"' + $('tr').eq(i).find('.isgoodsinstock').val() + '",';
                    a += '"price":' + '' + $('tr').eq(i).find('.price').val() + ',';
                    a += '"quality":' + '' + $('tr').eq(i).find('.quality').val() + ',';
                    a += '"qq":'+ '"' + $('tr').eq(i).find('.qq').val() + '",';
                    a += '"supplieruuid":' + '"' + $('tr').eq(i).find('.supplieruuid').val() + '"}'
                    json.push(a);
                }
            }
            $.ajax({
                type:"post",
                url:"addICProduct",
                async:true,
                dataType: "json",
                contentType:"application/x-www-form-urlencoded",
                data: {json:JSON.stringify(json)},
                success : function(data){
                    layer.msg(data.msg);
                }
            })
        })

        $("#search").on("click", function () {

            var supplier = $("#supplier").val();
            $.ajax({
                type:"get",
                url:"searchsupplier",
                async:true,
                dataType: "json",
                data:{
                    keyword:supplier
                },
                success:function(data){
                    for(var i = 0; i < data.size; i++){
                        $(".supplier12").append("<div id='su"+i+"'></div>");
                        $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>供应商名</div>");
                        $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='供应商名' value="+data.supplier[i].suppliername+" id='supplier1' disabled>");
                        $("#su"+i+"").append("<input type='hidden' value="+data.supplier[i].supplieruuid+" name='supplieruuid' class='supplieruuid' disable /><br/>");
                        $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>QQ</div>");
                        $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='QQ' value="+data.supplier[i].qq+" id='qq0' disabled>");
                        $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>地址</div>");
                        $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='地址' value="+data.supplier[i].supplierposition+" disabled>");
                        $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>电话</div>");
                        $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='电话' value="+data.supplier[i].telphone+" disabled>");
                        $("#su"+i+"").append("<div class='input-group'><div class='input-group-addon model'>QQ</div>");
                        $("#su"+i+"").append("<input class='form-control model' type='text' placeholder='QQ' value="+data.supplier[i].qq+" disabled>");
                        $("#su"+i+"").append("<button type='button' class='btn btn-default choosesupplier'>选择</button>");
                    }
                    if(data.size > 6){
                        $(".choose").attr("disabled",true);
                    }

                },error : function () {
                    layer.msg("添加失败,请刷新后添加!");
                }
            })

        });

        $(document).on("click",".choosesupplier",function(){
            $(".supplier").val($(this).siblings("#supplier1").val());
            $(".qq").val($(this).siblings("#qq0").val());
            $(".supplieruuid").val($(this).siblings(".supplieruuid").val());
        });

    });
</script>
<style type="text/css">
    *{
        margin: 0px auto;
        font-size: 10px;
    }
    body{
        width: 1200px;
    }
    table{
        margin-top: 50px;
    }
    th{
        padding: 10px 0px;
    }
    tr{
        width: 80px;;
    }
    input{
        width: 80px;
        height:30px;
    }
    textarea{
        margin-top:50px;
        margin-left: 10px;;
        float: left;
    }
    #searchSupplier{
        margin-top: 50px;
        width: 300px;
        height:20px;

    }
    .supplier12{
        width: 100px;
        margin-left: 700px;
    }
    .supplier12 input{
        width: 200px;
    }
</style>
</html>