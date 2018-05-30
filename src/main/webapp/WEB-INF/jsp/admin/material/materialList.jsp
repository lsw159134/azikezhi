<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
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
	table {
    		text-align:center;
			table-layout: fixed;	
		}
		td{
			text-overflow:ellipsis;
			overflow:hidden;
			white-space: nowrap;
			text-align:center;
    		height:50px;
		}
</style>
</head>
<body>

<div class="page-container">
	<div>
		<div class="cl pd-5 bg-1 bk-gray" style="height:40px;">
			<div class="col-sm-2">
				<a data-remodal-target="yiji" class="btn btn-primary">
					添加资料
				</a>
			</div>
			<div class="col-sm-2">
				<a href="JumpW" class="btn btn-primary">
					添加文章
				</a>
			</div>
		</div>
	</div>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th width="160px;">资料名称</th>
					<th width="120px;">标签</th>
					<th width="40px;">下载次数</th>
					<th width="40px;">时间</th>
					<th width="60px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${material}" var="material" varStatus="status">
					<tr height="60px;" class="text-c">
						<td  align="center">${material.material_name}</td>
						<td width="120px;" title="${material.material_label}">${material.material_label}</td>
						<td >${material.material_frequency}</td>
						<td width="30px;" align="center">
							<fmt:formatDate value="${material.material_time}" pattern="yyyy/MM/dd"/>
						</td>
						<td width="60px;">
							<c:choose>
								<c:when test="${material.material_content!=null && material.material_content!=''}">  
									<a href="queryByID?material_id=${material.material_id}" style="color: red;">修改</a>
								</c:when>
								<c:otherwise> 
									<a data-remodal-target="xiugai" data-id="${material.material_id }" data-label="${material.material_label }" class="xiu" style="color: red;">修改</a>
								</c:otherwise>
							</c:choose>
							| <a href="deleteMaterial?id=${material.material_id}&fileNameOne=${material.material_name}" onClick="return confirm('确定删除?');" style="color: red;">删除</a>
                    		
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty material}">
					<tr height="60px;" class="text-c">
						<td  align="center" colspan="5">暂无资料</td>
					</tr>
				</c:if>
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
<div class="remodal" data-remodal-id="xiugai">
	<button data-remodal-action="close" class="remodal-close"></button>
	<h4 style="float: left;margin-left: 100px;">
		标签:<textarea rows="" cols="" id="upmaterial_label" name="material_label" style="height:80px;width: 400px;margin-left: 8px;"></textarea>
	</h4>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm" id="updata">
		确定
	</button>
</div>
<div class="remodal" data-remodal-id="yiji">
	<button data-remodal-action="close" class="remodal-close"></button>
	<form method="post" id="upload_form" enctype="multipart/form-data">
		<div style="float: left;margin-left: 100px;color: red;">
			资料命名方式：型号+资料名称
		</div>
		<h4 style="float: left;margin-left: 100px;">
			资料:<input id="material_name" name="files" type="file" accept=".doc,.docx,.ppt,.pptx,.wps,.pdf,.rar,.zip">
		</h4>
		<br>
		<h4 style="float: left;margin-left: 100px;">
			标签:<textarea rows="" cols="" id="material_label" name="material_label" style="height:80px;width: 400px;margin-left: 8px;"></textarea>
		</h4>
		<br>
		<button data-remodal-action="cancel" class="remodal-cancel">
			取消
		</button>
		<button data-remodal-action="confirm" class="remodal-confirm" id="upsecond1">
			确定
		</button>
	</form>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
function first(){
	window.location.href='queryAllMaterial?page=${1}&&rows=${pageSize }';
}
function end(){
	window.location.href='queryAllMaterial?page=${count == 0 ? 1:count }&&rows=${pageSize }';
}
function er(){
	var page=${page+1 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='queryAllMaterial?page=${page+1}&&rows=${pageSize }';
	}
}
function san(){
	var page=${page+2 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='queryAllMaterial?page=${page+2}&&rows=${pageSize }';
	}
}
function si(){
	var page=${page+3 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='queryAllMaterial?page=${page+3}&&rows=${pageSize }';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='queryAllMaterial?page=${page-1}&&rows=${pageSize }';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='queryAllMaterial?page=${page+1}&&rows=${pageSize }';
	}
}
var id;
var label;
$(".xiu").on("click", function(){
	id=$(this).data("id");
	label=$(this).data("label");
	$("#upmaterial_label").val(label);
});
$("#updata").on("click", function(){
	var material_label=$("#upmaterial_label").val();
	if(document.getElementById("upmaterial_label").value==""){
	   return false;
	}
	window.location.href="upData?material_id="+id+"&material_label="+encodeURIComponent(material_label);	
});
$("#upsecond1").on("click", function(){
	var formData = new FormData($("#upload_form")[0]);
	if(document.getElementById("material_name").value==""){
	   return false;
	}
	if(document.getElementById("material_label").value==""){
	   return false;
	}
	$.ajax({  
		url: 'addMaterial' ,  
		type: 'POST',  
		data: formData,  
		dataType:"json",
		async: true,  
		cache: false,  
		contentType: false,  
		processData: false,  
		success: function (data) {  
			if(data.result=='seccuss'){
				window.location.href="queryAllMaterial";
			}else if(data.result=='fail'){
				layer.msg(data.msg);
			}else if(data.result=='login'){
				window.location.href="cont";
			}
		}  
	});  	
});
</script>
</body>
</html>