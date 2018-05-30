<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/Hui-iconfont/1.0.7/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/icheck/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			document.getElementById('tianjia').style.display = 'none';
			document.getElementById('uppurchaseText').style.display = 'none';
		})
	</script>
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
<div class="page-container">
<a name="top"></a>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th>留言内容</th>
					<th>留言时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${messageList}" var="messageList" varStatus="status">
					<tr height="60px;" class="text-c">
						<td>${messageList.message_content}</td>
						<td>
							<fmt:formatDate value="${messageList.message_time}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%-- <div style="width: 100%;height: 27px;margin-top: 3px;">
       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
       </div> --%>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
$("#upquxiao").on("click",function(){
	$("#purchase_id").val("");
	$("#uppurchase_number").val("");
	$("#uppurchase_one").val("");
	$("#uppurchase_model").val("");
	$("#uppurchase_supplier").val("");
	$("#uppurchase_encapsulation").val("");
	document.getElementById('uppurchaseText').style.display = 'none';
})
$("#uppurchase").on("click",function(){
	var id=$("#purchase_id").val();
	var number=$("#uppurchase_number").val();
	var one=$("#uppurchase_one").val();
	var model=$("#uppurchase_model").val();
	var supplier=$("#uppurchase_supplier").val();
	var fenzhuang=$("#uppurchase_encapsulation").val();
	$.post("upPurchase?purchase_number="+number+"&purchase_one="+one+"&purchase_model="+model+"&purchase_supplier="+supplier+"&purchase_encapsulation="+fenzhuang+"&purchase_id="+id,
		function(data){
			if(data.result=="fail"){
				layer.alert("修改失败", {icon : 5})
			}else if(data.result=="seccuss"){
				window.location.href="purchase";
			}else if(data.result=="login"){
				window.location.href="Adminlogin";
			}
		}
   	) 
})
function edit(id,model,encapsulation,number,one,supplier){
	$("#uppurchase_number").val(number);
	$("#purchase_id").val(id);
	$("#uppurchase_one").val(one);
	$("#uppurchase_model").val(model);
	$("#uppurchase_supplier").val(supplier);
	$("#uppurchase_encapsulation").val(encapsulation);
	document.getElementById('uppurchaseText').style.display = 'block';
	document.getElementById('tianjia').style.display = 'none';
}
$("#addquxiao").on("click",function(){
	$("#addpurchase_number").val("");
	$("#addpurchase_one").val("");
	$("#addpurchase_model").val("");
	$("#addpurchase_supplier").val("");
	$("#addpurchase_encapsulation").val("");
	document.getElementById('tianjia').style.display = 'none';
})
$("#addpurchase").on("click",function(){
	var number=$("#addpurchase_number").val();
	var one=$("#addpurchase_one").val();
	var model=$("#addpurchase_model").val();
	var supplier=$("#addpurchase_supplier").val();
	var fenzhuang=$("#addpurchase_encapsulation").val();
	$.post("addPurchase?purchase_number="+number+"&purchase_one="+one+"&purchase_model="+model+"&purchase_supplier="+supplier+"&purchase_encapsulation="+fenzhuang,
		function(data){
			if(data.result=="fail"){
				layer.alert("添加失败", {icon : 5})
			}else if(data.result=="seccuss"){
				window.location.href="purchase";
			}else if(data.result=="login"){
				window.location.href="Adminlogin";
			}
		}
   	) 
})
function search(){
	var product=$("#product").val();
	var name=$("#username").val();
	var edate=$("#edate").val();
	window.location.href='purchase?time='+edate+"&product="+product+"&supplier="+name;
}
$("#yiji").on("click",function(){
	document.getElementById('tianjia').style.display = 'block';
	document.getElementById('uppurchaseText').style.display = 'none';
})

function first(){
	window.location.href='purchase?page=${1}&&rows=${pageSize }';
}
function end(){
	window.location.href='purchase?page=${count == 0 ? 1:count }&&rows=${pageSize }';
}
function er(){
	var page=${page+1 };
	var count=${count };
	if(parseInt(page) >parseInt(count) ){
		return false;
	}else{
		window.location.href='purchase?page=${page+1}&&rows=${pageSize }';
	}
}
function san(){
	var page=${page+2 };
	var count=${count };
	if(parseInt(page) >parseInt(count) ){
		return false;
	}else{
		window.location.href='purchase?page=${page+2}&&rows=${pageSize }';
	}
}
function si(){
	var page=${page+3 };
	var count=${count };
	if(parseInt(page) >parseInt(count) ){
		return false;
	}else{
		window.location.href='purchase?page=${page+3}&&rows=${pageSize }';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='purchase?page=${page-1}&&rows=${pageSize }';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='purchase?page=${page+1}&&rows=${pageSize }';
	}
}
</script>
</body>
</html>