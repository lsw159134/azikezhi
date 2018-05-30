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
    <title></title>
    
    
</head>

<body>
<div class="page-container">
	<nav class="breadcrumb">
   <div class="row">
	   	<c:if test="${sessionScope.user.admin_jurisdiction eq '1' || user.admin_jurisdiction eq '3' || user.admin_jurisdiction eq '7' }">
			<c:if test="${sessionScope.user.admin_status eq '1' || user.admin_status eq '3' || user.admin_status eq '' || user.admin_status eq null }">
				<div class="col-sm-2" style="float: left;">
					<div class="form-group">
						<div class="input-group">
							<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
								快递
							</label>
							<input type="text" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="快递"
								id="product" name="product" />
						</div>
					</div>
				</div>
				<div class="col-sm-2" style="float: left;">
					<div class="form-group">
						<div class="input-group">
							<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
								时间
							</label>
							<input type="date" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="时间"
								id="edate" name="edate" />
						</div>
					</div>
				</div>
			</c:if>
		</c:if>
		<div class="col-sm-1" style="float: left;">
			<button onclick="search();" class="btn btn-primary">
				搜索
			</button>
		</div>
	</div>
   		
</nav>
    <c:if test="${sessionScope.user.admin_jurisdiction eq '1' || user.admin_jurisdiction eq '3' || user.admin_jurisdiction eq '7' }">
	    <div class="mt-20">
	        <table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th width="60px;">订单编号</th>
					<th width="60px;">快递</th>
					<th width="60px;">时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${printrecordList}" var="inquiry" varStatus="status">
					<tr height="60px;" class="text-c">
						<td>${inquiry.printrecord_expressorder}</td>
						<td class="Enumber">${inquiry.printrecord_kuaidi}</td>
						<td width="27px;">
							<fmt:formatDate value="${inquiry.printrecord_time}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
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
    </c:if>
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
		window.location.href='printrecordAll?page=${1}&&rows=${pageSize }';
	}
	function end(){
		window.location.href='printrecordAll?page=${count == 0 ? 1:count }&&rows=${pageSize }';
	}
	function er(){
		var page=${page+2 };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='printrecordAll?page=${page+1}&&rows=${pageSize }';
		}
	}
	function san(){
		var page=${page+1 };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='printrecordAll?page=${page+2}&&rows=${pageSize }';
		}
	}
	function si(){
		var page=${page };
		var count=${count };
		if(page > count){
			return false;
		}else{
			window.location.href='printrecordAll?page=${page+3}&&rows=${pageSize }';
		}
	}
	function previous(){
		var page=${page == 1};
		if(page){
			return false;
		}else{
			window.location.href='printrecordAll?page=${page-1}&&rows=${pageSize }';
		}
	}
	function next(){
		var page=${count <= page};
		if(page){
			return false;
		}else{
			window.location.href='printrecordAll?page=${page+1}&&rows=${pageSize }';
		}
	}
	
	function search(){
		var product=$("#product").val();
		var edate=$("#edate").val();
		window.location.href='printrecordAll?printrecord_time='+edate+"&printrecord_kuaidi="+product;
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