<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<style type="text/css">
	:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	    color: rgb(250,0,255);  
	}
	
	::-moz-placeholder { /* Mozilla Firefox 19+ */
	    color: rgb(250,0,255);
	}
	
	input:-ms-input-placeholder,
	textarea:-ms-input-placeholder {
	    color: rgb(250,0,255);
	}
	
	input::-webkit-input-placeholder,
	textarea::-webkit-input-placeholder {
	    color: rgb(250,0,255);
	}
</style>
</head>
<body>

<section id="page-title" class="padding-top-15 padding-bottom-15">
	<div class="row">
    	<div class="col-sm-7">
		</div>
		<div class="col-sm-12">
   			
		</div>
	</div>
</section>
<div class="page-container">
	<br>
	<br>
	<div class="col-sm-12">
		<div class="col-sm-1">
			<a href="<%=basePath %>1019/zai/xin/jian/inAdmin" class="btn btn-primary">
				添加管理员
			</a>
		</div>
		<div class="col-sm-2" style="float: right;">
			<div class="form-group">
				<div class="input-group">
					<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
						ip3
					</label>
					<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="ip3"
						id="ip3" value="${ip.admin_loginIp3 }" name="manufacturer" />
				</div>
			</div>
		</div>
		<div class="col-sm-2" style="float: right;">
			<div class="form-group">
				<div class="input-group">
					<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
						ip2
					</label>
					<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="ip2"
						id="ip2" value="${ip.admin_loginIp2 }" name="manufacturer" />
				</div>
			</div>
		</div>
		<div class="col-sm-2" style="float: right;">
			<div class="form-group">
				<div class="input-group">
					<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
						ip1
					</label>
					<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="ip1"
						id="ip1" value="${ip.admin_loginIp1 }" name="manufacturer" />
				</div>
			</div>
		</div>
		<div class="col-sm-1" style="float: right;">
			<button onclick="searchProduct();" class="btn btn-primary">
				设置
			</button>
		</div>
	</div>
	<br>
	<br>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th width="120px;">管理员名称</th>
					<th width="120px;">添加时间</th>
					<th width="120px;">修改时间</th>
					<th width="120px;">修改人</th>
					<th width="120px;">对应权限</th>
					<th width="120px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${admin}" var="admin" varStatus="status">
					<tr height="60px;" class="text-c">
						<td width="60px;">${admin.admin_adminName}</td>
						<td width="45px;">
							<fmt:formatDate value="${admin.admin_addtime}" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td width="45px;">
							<fmt:formatDate value="${admin.admin_uptime}" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td width="60px;">
							${admin.up }
						</td>
						<td width="60px;">
							${admin.admin_Explain}
						</td>
						<td width="20px;"><br><a href="editAdmin?aid=${admin.admin_id }" class="exchange"
							style="padding-right: 0px;width: 20px;color: blue;">修改</a><c:if test="${admin.admin_jurisdiction != 1}">|<a href="deleteAdmin?aid=${admin.admin_id }" class="exchange"
							style="padding-right: 0px;width: 20px;color: red;" onClick="return confirm('确定删除?');">删除</a></c:if>
						</td>
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
<script>
function first(){
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${1}&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
}
function end(){
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${count == 0 ? 1:count }&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
}
function previous(){
	var page=${page == 1};
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${page-1}&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
	}
}
function next(){
	var page=${count <= page};
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='<%=basePath %>1019/zai/xin/jian/queryAllProduct?page=${page+1}&&rows=${pageSize }&supplier=' + supplier+'&product=' + search;
	}
}
//搜索
function searchProduct() {
	var ip1 = $("#ip1").val();
	var ip2 = $("#ip2").val();
	var ip3 = $("#ip3").val();
	var id = '${ip.admin_id}';
	var url = '<%=basePath %>1019/zai/xin/jian/shezhiip?admin_loginIp1=' +ip1+'&admin_loginIp2='+ip2+'&admin_loginIp3='+ip3+'&admin_id='+id;
	window.location = url;
};

</script>
</body>
</html>