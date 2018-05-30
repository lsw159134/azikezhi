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
<div class="row">
	<br>
	<br>
	<div class="col-sm-12">
		<div class="col-sm-1">
			<a href="<%=basePath %>1019/zai/xin/jian/inbom" class="btn btn-primary">
				添加bom订单
			</a>
		</div>
	</div>
	<br>
	<br>
	<div class="col-sm-2" style="float: left;">
		<div class="form-group">
			<div class="input-group">
				<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
					会员名称
				</label>
				<input type="text" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="会员名称"
					id="username" name="username" />
			</div>
		</div>
	</div>
	<div class="col-sm-2" style="float: left;">
		<div class="form-group">
			<div class="input-group">
				<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
					产品型号
				</label>
				<input type="text" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="产品型号"
					id="product" name="product" />
			</div>
		</div>
	</div>
	<div class="col-sm-2" style="float: left;">
		<div class="form-group">
			<div class="input-group">
				<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
					下单时间
				</label>
				<input type="date" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="下单时间"
					id="edate" name="edate" />
			</div>
		</div>
	</div>
	<div class="col-sm-2" style="float: left;">
		<div class="form-group">
			<div class="input-group">
				<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
					收货电话
				</label>
				<input type="text" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="收货电话"
					id="phone" name="phone" />
			</div>
		</div>
	</div>
	<div class="col-sm-2" style="float: left;">
		<div class="form-group">
			<div class="input-group">
				<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
					收货地址
				</label>
				<input type="text" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="收货地址"
					id="address" name="address" />
			</div>
		</div>
	</div>
	<div class="col-sm-1" style="float: left;">
		<button onclick="search();" class="btn btn-primary">
			搜索
		</button>
	</div>
	<br>
	<br>
	<div class="col-md-12 margin-top-5" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<!-- <th width="60px;">订单名称</th> -->
					<th width="60px;">订单编号</th>
					<th width="40px;">金额</th>
					<th width="60px;">支付方式</th>
					<th width="100px;">备注</th>
					<th width="60px;">会员名称</th>
					<th width="60px;">收货人</th>
					<th width="80px;">收货人联系方式</th>
					<th width="120px;">收货地址</th>
					<th width="60px;">状态</th>
					<th width="60px;">返利</th>
					<th width="60px;">时间</th>
					<th width="60px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bomList}" var="bom" varStatus="status">
					<tr height="60px;" class="text-c">
						<!-- <td width="60px;">bom订单</td> -->
						<td width="70px;">${bom.bom_identifier }</td>
						<td width="40px;">${bom.bom_price}</td>
						<td width="40px;"><c:if test="${bom.bom_mode eq '1'}">
							微信
						</c:if><c:if test="${bom.bom_mode eq '2'}">
							支付宝
						</c:if><c:if test="${bom.bom_mode ne '2' && bom.bom_mode ne '1'}">
							${bom.bom_mode}
						</c:if> </td>
						<td width="40px;">${bom.bom_remarks}</td>
						<td width="60px;">
							${bom.user.username }
						</td>
						<td width="60px;">
							${bom.bom_name}
						</td>
						<td width="40px;">
							${bom.bom_phone}
						</td>
						<td width="60px;">${bom.bom_address}</td>
						<td width="40px;">
							<c:if test="${bom.bom_status == 1}">未付款</c:if>
	                        <c:if test="${bom.bom_status == 2}">已付款</c:if>
	                        <c:if test="${bom.bom_status == 3}">已发货</c:if>
	                        <c:if test="${bom.bom_status == 4}">已完成</c:if>
	                        <c:if test="${bom.bom_status == 5}">已取消</c:if>
	                        <c:if test="${bom.bom_status == 6}">审核中</c:if>
						</td>
						<c:if test="${bom.bom_fan==null}"><td>未添加</td></c:if>
						<c:if test="${bom.bom_fan!=null}"><td width="30px;">${bom.bom_fan}</td></c:if>
						<td width="30px;">
							<fmt:formatDate value="${bom.bom_date}" pattern="yyyy/MM/dd HH:mm"/>
							<c:if test="${bom.bom_date == null}">
								0000-00-00 00:00:00
							</c:if>
						</td>
						<td width="60px;">
							<form action="queryByBomId?id=${bom.bom_id}" method="post">
	                    		<button style="color: red;">查看详情</button>
	                    	</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
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
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
function first(){
	window.location.href='bomQueryAll?page=${1}&&rows=${pageSize }';
}
function end(){
	window.location.href='bomQueryAll?page=${count == 0 ? 1:count }&&rows=${pageSize }';
}
function er(){
	var page=${page+2 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='bomQueryAll?page=${page+1}&&rows=${pageSize }';
	}
}
function san(){
	var page=${page+1 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='bomQueryAll?page=${page+2}&&rows=${pageSize }';
	}
}
function si(){
	var page=${page };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='bomQueryAll?page=${page+3}&&rows=${pageSize }';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='bomQueryAll?page=${page-1}&&rows=${pageSize }';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='bomQueryAll?page=${page+1}&&rows=${pageSize }';
	}
}

function search(){
	var product=$("#product").val();
	var name=$("#username").val();
	var phone=$("#phone").val();
	var address=$("#address").val();
	var edate=$("#edate").val();
	window.location.href='bomQueryAll?name='+name+'&telphone='+phone+'&address='+address+'&edate='+edate+"&product="+product;
}

</script>
</body>
</html>