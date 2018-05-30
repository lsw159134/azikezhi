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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>提现申请</title>
</head>

<body>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="r">
			<a href="<%=basePath%>1019/zai/xin/jian/cont" class="dropDown_A" target="_blank" style="color: red;margin-right: 10px;">
				返回上一页
			</a>
			</span>
    </div>
    <div class="mt-20">
        <table class="table">
            <thead>
            <tr class="text-c">
            	<th>会员名</th>
                <th>会员电话</th>
                <th>收款人账号</th>
                <th>收款人名称</th>
                <th>提现金额</th>
                <th>申请时间</th>
                <th>剩余返现金额</th>
                <th>当前状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${withdrawALList }" var="items" varStatus="withdrawAL">
                <tr class="text-c" data-uid="${items.w_uid}" data-id="${items.w_id}"
                	data-status="${items.w_status}">
                    <td>${items.username}</td>
                    <td>${items.telephone}</td>
                    <td>${items.w_account}</td>
                    <td>${items.w_alipayName}</td>
                    <td>￥${items.w_price}</td>
                    <td width="70px;"><fmt:formatDate value="${items.w_date}" pattern="yyyy/MM/dd HH:mm"/></td>
                    <td>￥${fanTotal-price }</td>
                    <td class="w_status">
                       <c:if test="${items.w_status eq '1'}">未打款</c:if>
                        <c:if test="${items.w_status eq '2'}"><span style="color: red;">已打款</span></c:if>
                    </td>
                    <td width="120px;" align="center" class="update">修改</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style="width: 100%;">
        	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
        	<button onclick = "first()">首页</button>&nbsp;
        	<button onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
        	<button onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
        	<button onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
        	<button onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
        	<button onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
        	<button onclick = "end()">尾页</button>
        </div>
    </div>
</div>
<footer class="footer mt-20">
    <div class="container">
        <p>
            版权所有 &copy; 2016 在芯间 保留所有权利 |
            <a href="http://www.miibeian.gov.cn/">
                <img src="<%=basePath%>img/img/icp.png" />
                粤ICP备15008173号-2
            </a>
            |
        </p>
    </div>
</footer>
<style type="text/css">
    #update{
        width: 100px;
        height: 25px;
    }
    #update:hover{
        color: darkred;
    }
</style>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
	function first(){
		window.location.href='withdrawAL?page=${1}&&rows=${pageSize }';
	}
	function end(){
		window.location.href='withdrawAL?page=${count == 0 ? 1:count }&&rows=${pageSize }';
	}
	function er(){
		var page=${page+2 };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='withdrawAL?page=${page+1}&&rows=${pageSize }';
		}
	}
	function san(){
		var page=${page+1 };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='withdrawAL?page=${page+2}&&rows=${pageSize }';
		}
	}
	function si(){
		var page=${page };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='withdrawAL?page=${page+3}&&rows=${pageSize }';
		}
	}
	function previous(){
		var page=${page == 1};
		if(page){
			return false;
		}else{
			window.location.href='withdrawAL?page=${page-1}&&rows=${pageSize }';
		}
	}
	function next(){
		var page=${count <= page};
		if(page){
			return false;
		}else{
			window.location.href='withdrawAL?page=${page+1}&&rows=${pageSize }';
		}
	}
    $("table").on("click",".update", function(){
        var s = $(this).parents(".text-c").data("status");
        $(this).html("确定");
        $(this).addClass("sta").removeClass("update");
        var a = $(this).siblings(".w_status");
        if(s==1){
        	var ht = '<select id="s"><option value="1">未打款</option><option value="2">已打款</option></select>';
        }else if(s==2){
        	var ht = '<select id="s"><option value="1">未打款</option><option value="2" selected="selected">已打款</option></select>';
        }
        a.html(ht);
    });

    $("table").on("click",".sta", function(){
    	var id = $(this).parents(".text-c").data("id");
        var s = $("#s option:selected").val();
        $(this).removeClass("sta").addClass("update");
        $(this).html("修改");
        if(s == 2){
            $(this).siblings(".express-status").html("未打款");
        } else if(s == 1){
            $(this).siblings(".express-status").html("已打款");
        }
        $.ajax({
            type:"post",
            url:"updatewithdrawALstatus",
            async:true,
            dataType: "json",
            data: {
                w_status: s,
                w_id: id
            },
            success : function(data){
            	window.location.reload();
                layer.msg(data.msg);
            }
        });
    });
</script>
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