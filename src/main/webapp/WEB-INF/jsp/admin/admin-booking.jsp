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
    <link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
	<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>代售申请</title>
</head>

<body>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="r">
			<a href="<%=basePath%>1019/zai/xin/jian/cont" style="color: red;margin-right: 10px;">
				返回上一页
			</a>
			</span>
    </div>
    <div class="mt-20">
        <table class="table">
            <thead>
            <tr class="text-c">
                <th>产品型号</th>
                <th>封装</th>
                <th>数量</th>
                <th>单价</th>
                <th>渠道</th>
                <th>联系电话</th>
                <th>时间</th>
                <th width="120px;">备注</th>
                <th>状态</th>
                <th>反馈</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            	<c:forEach items="${bookingList }" var="items" varStatus="express">
	                <tr class="text-c">
	                   <td>${items.booking_product }</td>
						<td>${items.booking_encapsulation }</td>
						<td>${items.booking_number }</td>
						<td>￥${items.booking_price }</td>
						<td>${items.booking_channel }</td>
						<td>${items.booking_phone }</td>
						<td><fmt:formatDate value="${items.booking_date }" pattern="yyyy/MM/dd HH:mm"/></td>
						<td width="120px;">${items.booking_note }</td>
						<td style="color: red;">
							<c:if test="${items.booking_status == 1 }">
								<font size="2.5">审核中</font>
							</c:if>
							<c:if test="${items.booking_status == 2 }">
								<font size="2.5">寄售中</font>
							</c:if>
							<c:if test="${items.booking_status == 3 }">
								<font size="2.5">审核未通过</font>
							</c:if>
							<c:if test="${items.booking_status == 4 }">
								<font size="2.5">待检验</font>
							</c:if>
							<c:if test="${items.booking_status == 5 }">
								<font size="2.5">待付款</font>
							</c:if>
							<c:if test="${items.booking_status == 6 }">
								<font size="2.5">出售中</font>
							</c:if>
						</td>
						<td>${items.booking_feedback }</td>
						<c:if test="${items.booking_status != 6 }">
							<td>
								<a class="fan" data-id="${items.booking_id}" style="color: red;" data-remodal-target="fanli">审核</a>
								<br>
								<a class="xiu" data-id="${items.booking_id}" data-num="${items.booking_number}" data-price="${items.booking_price}" style="color: red;" data-remodal-target="xiu">修改</a>
							</td>
						</c:if>
						<c:if test="${items.booking_status == 6 }">
							<td>
								<a href="javascript:;"  onclick="bookingproduct('${items.booking_id}');" style="color: red;">出售信息</a>
								<br>
								<a class="xiu" data-id="${items.booking_id}" data-num="${items.booking_number}" data-price="${items.booking_price}" style="color: red;" data-remodal-target="xiu">修改</a>
							</td>
						</c:if>
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
<div class="remodal" data-remodal-id="fanli">
	<button data-remodal-action="close" class="remodal-close"></button>
	<h4 style="float: left;margin-left: 100px;">
		审核意见:<input id="booking_feedback" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<h4 style="float: left;margin-left: 100px;width: 480px;">
		初审通过<input type="radio" name="booking_status" value="2" checked="checked"/>&nbsp;&nbsp;&nbsp;
		待检验<input type="radio" name="booking_status" value="4"/>&nbsp;&nbsp;
		待付款<input type="radio" name="booking_status" value="5"/>&nbsp;&nbsp;
		出售中<input type="radio" name="booking_status" value="6"/>&nbsp;&nbsp;
		不通过<input type="radio" name="booking_status" value="3"/>
	</h4>
	<br><p style="clear:both;"></p>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm pay" id="pay">
		确定
	</button>
</div>
<div class="remodal" data-remodal-id="xiu">
	<button data-remodal-action="close" class="remodal-close"></button>
	<h4 style="float: left;margin-left: 100px;">
		数量:<input id="num" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<h4 style="float: left;margin-left: 100px;">
		价格:<input id="price" type="text" style="height:30px;width: 400px;margin-left: 8px;">
	</h4>
	<br><p style="clear:both;"></p>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm pay" id="xiu">
		确定
	</button>
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
	var pid;
	$(".fan").on("click", function(){
	    pid = $(this).data("id");
	});
	var num;
	var price
	$(".xiu").on("click", function(){
	    pid = $(this).data("id");
	    num = $(this).data("num");
	    price = $(this).data("price");
	    $("#num").val(num);
	    $("#price").val(price);
	});
	function bookingproduct(bid){
		$.post("Productadminbooking?booking_id="+bid,
			function(data){
				if(data.result=="fail"){
					if(confirm("未添加出售信息，是否添加!")){
						window.location.href="addBookingProduct?bid="+bid;
					}else{
						window.location.href="bookingAll";
				    }
				}else if(data.result=="success"){
					window.location.href="updateProduct?uid="+data.msg;
				}else if(data.result=="login"){
					window.location.href="cont";
				}
			}
		)
	}
	$("#pay").on("click", function(){
		var booking_feedback=$("#booking_feedback").val();
		var status=$('input:radio:checked').val();
		$.post("updateBookingstatus?booking_status="+status+"&booking_id="+pid+"&booking_feedback="+booking_feedback,
			function(data){
				if(status==6){
					if(confirm("是否添加出售信息")){
						window.location.href="addBookingProduct?bid="+pid;
					}else{
						window.location.href="bookingAll";
				    }
				}else{
					window.location.href="bookingAll";
				}
			}
		)
		/* window.location.href="updateBookingstatus?booking_status="+status+"&booking_id="+pid+"&booking_feedback="+booking_feedback; */
	});
	$("#xiu").on("click", function(){
		var num=$("#num").val();
		var price=$("#price").val();
		$.post("updateBookingstatus?booking_number="+num+"&booking_id="+pid+"&booking_price="+price,
			function(data){
				window.location.href="bookingAll";
			}
		)
		/* window.location.href="updateBookingstatus?booking_status="+status+"&booking_id="+pid+"&booking_feedback="+booking_feedback; */
	});
	
	function first(){
		window.location.href='bookingAll?page=${1}&&rows=${pageSize }';
	}
	function end(){
		window.location.href='bookingAll?page=${count == 0 ? 1:count }&&rows=${pageSize }';
	}
	function er(){
		var page=${page+2 };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='bookingAll?page=${page+1}&&rows=${pageSize }';
		}
	}
	function san(){
		var page=${page+1 };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='bookingAll?page=${page+2}&&rows=${pageSize }';
		}
	}
	function si(){
		var page=${page };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='bookingAll?page=${page+3}&&rows=${pageSize }';
		}
	}
	function previous(){
		var page=${page == 1};
		if(page){
			return false;
		}else{
			window.location.href='bookingAll?page=${page-1}&&rows=${pageSize }';
		}
	}
	function next(){
		var page=${count <= page};
		if(page){
			return false;
		}else{
			window.location.href='bookingAll?page=${page+1}&&rows=${pageSize }';
		}
	}
   

    
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