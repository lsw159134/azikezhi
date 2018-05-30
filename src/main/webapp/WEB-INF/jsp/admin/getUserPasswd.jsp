<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/layer/2.4/layer.js"></script>
    <title>找回密码</title>
</head>
<body>
<div id="tel" style="margin-left: 100px;margin-top: 20px;">
    <input type="text" name="telphone" id="telphone"/>
    <button>提交</button>
</div>
<div id="username" style="margin-top: 10px;">

</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tel button").on("click", function () {
           var tel = $("#telphone").val();
           $.ajax({
               type: 'post',
               async: 'true',
               url: 'getpassword',
               dataType: 'json',
               contentType:'application/x-www-form-urlencoded;charset=utf-8',
               data:{
                   telphone: tel
               },
               success: function (data){
                   if(data.code == 1){
                    chage(data.user);
                   } else if (data.code == -2){
                       layer.msg(data.msg);
                   } else if(data.code == -1){
                       layer.msg(data.msg);
                   }
               },
               error: function(data){
                   layer.msg("添加不成功,请重新添加!");
                   return false;
               }
           })
        });

        function chage(data){
            for (var i = 0; i < data.length; i++) {
                var html = '用户名:<input type="text" disabled value="' + data[i].username + '" /><br>' +
                    '邮箱:<input type="text" disabled value="' + data[i].mail + '"><br>' +
                    '手机号: <input type="text" disabled value="' + data[i].telephone + '"><br>' +
                    '注册IP: <input type="text" disabled value="' + data[i].regip + '"><br>'  +
                        '支付宝号: <input type="text" disabled value="'+data[i].alipay+'"> ' +
                    '<button data-uid="'+data[i].useruid+'" class="submit">修改</button><br>';
                $("#username").append(html + '<br/>');
            }
        }

        $("#username").on("click", ".submit", function () {
            var uid = $(this).data("uid");
            console.log(uid);
            $.ajax({
                type: 'post',
                async: 'true',
                url: 'updateUserPasswd',
                dataType: 'json',
                contentType:'application/x-www-form-urlencoded;charset=utf-8',
                data:{
                    uid: uid
                },
                success: function (data){
                    layer.msg(data.msg);
                },
                error: function(data){
                    layer.msg("失败!");
                    return false;
                }
            });
        });
    });
</script>
</body>
</html>