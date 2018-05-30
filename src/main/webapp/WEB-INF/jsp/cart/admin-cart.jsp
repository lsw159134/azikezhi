<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="t11ext/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>购买记录/快递单号</title>
</head>

<body>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="r">
		</span>
    </div>
    <div class="mt-20">
        <table class="table">
            <thead>
	            <tr class="text-c">
	            	<th width="60px;">会员名称</th>
	            	<th width="60px;">产品型号</th>
	            	<th width="60px;">数量</th>
	            	<th width="80px;">时间</th>
	            </tr>
            </thead>
            <tbody>
            	<c:forEach items="${cartList }" var="items" varStatus="express">
            		<tr class="text-c">
	           			<td width="60px;" align="center" >${items.user.username}</td>
	           			<td width="60px;" align="center" ><a href="javascript:window.open('<%=contextPath %>/1019/zai/xin/jian/queryAllProduct?product=${items.p.product}')">${items.p.product}</a></td>
	           			<td width="60px;" align="center">${items.cart_number}</td>
	               		<td width="60px;" align="center"><fmt:formatDate value="${items.cart_date}" pattern="yyyy/MM/dd HH:mm"/></td>
	           		</tr>
            	</c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">

function discount(eid,eprice){
	var preferentialamount = $("#preferentialamount").val();
	var discountdescription = $("#discountdescription").val();
	var a=eprice-preferentialamount;
	if (confirm("你确定提交吗？")) {  
		$.post("upDiscountprice?express="+eid+"&preferentialamount="+preferentialamount+"&discountdescription="+discountdescription+"&eprice="+eprice,
	        function(data){
				if(data.result=="fail"){
					layer.alert("失败", {icon : 5})
				}else if(data.result=="seccuss"){
					layer.alert("成功", {icon : 5})
					document.getElementById('bb').style.display = 'none';
					document.getElementById("aa").innerHTML = a.toFixed(2);
				}
			}
		)
	} 
}

$("table").on("click",".update", function(){
	var f = $(this).parents(".text-c").data("fan");
    var h = $(this).parents(".text-c").data("help");
    var s = $(this).parents(".text-c").data("status");
    $(this).html("确定");
    $(this).addClass("sta").removeClass("update");
    var Enumber = $(this).siblings(".Enumber");
    var eh = '<input type="text" id="express_number" value="'+h+'" class="input-text"/>';
    var fan = $(this).siblings(".fan");
    var fh = '<input type="text" id="fan" value="'+f+'" class="input-text"/>';
    var a = $(this).siblings(".express-status");
    if(s==1){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==2){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2" selected="selected">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==3){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3" selected="selected">已发货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==4){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4" selected="selected">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==5){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5" selected="selected">已取消</option><option value="6">审核中</option></select>';
    }else if(s==6){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5" selected="selected">已取消</option><option value="6" selected="selected">审核中</option></select>';
    }
    
    Enumber.html(eh);
    fan.html(fh);
    a.html(ht);
});

$("table").on("click", ".sta", function(){
    var id = $(this).parents(".text-c").data("id");
    var uid = $(this).parents(".text-c").data("uid");
    var s = $("#s option:selected").val();
    var number = $("#express_number").val();
    $(this).siblings(".Enumber").html(number);
    var fan = $("#fan").val();
    $(this).siblings(".fan").html(fan);
    $(this).html("修改");
    $(this).removeClass("sta").addClass("update");
    if(s == 6){
        $(this).siblings(".express-status").html("审核中");
    } else if(s == 5){
        $(this).siblings(".express-status").html("已取消");
    } else if(s == 4){
        $(this).siblings(".express-status").html("已完成");
    } else if(s == 3){
        $(this).siblings(".express-status").html("已发货");
    } else if(s == 2){
        $(this).siblings(".express-status").html("已付款");
    } else if(s == 1){
        $(this).siblings(".express-status").html("未付款");
    }
    $.ajax({
        type:"post",
        url:"updateexpressstatus",
        async:true,
        dataType: "json",
        data: {
            status: s,
            fan:fan,
            number:number,
            uid: uid,
            id: id
        },
        success : function(data){
        	window.location.reload();
            layer.msg(data.msg);
        }
    });
});
</script>
<style type="text/css">
    #update{
        width: 100px;
        height: 25px;
    }
    #update:hover{
        color: darkred;
    }
</style>
<script type="text/javascript">
    $('.table-sort').dataTable({
        //				"aaSorting": [
        //					[1, "desc"]
        //				], //默认第几个排序
        //				"iDisplayLength": 10,
        //				"bStateSave": true, //状态保存
        //				"aoColumnDefs": [
        //					//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        //					{
        //						"orderable": false,
        //						"aTargets": [0, 8]
        //					} // 不参与排序的列
        //				]
    });
</script>
</body>

</html>