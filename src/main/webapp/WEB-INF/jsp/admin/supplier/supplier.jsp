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
	#updialog {  
		box-shadow: #666 1px 1px 15px;
		background-color: #fff;  
        border: 1px solid #1057A7;  
        height: 360px;  
        left: 50%;  
        margin: -200px 0 0 -200px;  
        position: fixed !important; /* 浮动对话框 */  
        position: absolute;  
        top: 53%;  
        width: 380px;  
        z-index: 5;  
        border-radius: 5px;  
        display: none; 
	}  
	#updialog input{
		height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
	}
	#updialog select{
		height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;text-align: center;
	}
	#updialog p {  
	    display: inline-block;font-weight: bold;color: black; 
	}
</style>
</head>
<body>
<div class="page-container">
<a name="top"></a>
	<div>
		<div class="cl pd-5 bg-1 bk-gray" style="height:40px;">
				<!-- <div class="col-sm-2" style="float: left;">
					<form id="upload_form" enctype="multipart/form-data">
						<input id="material_name" onchange="fileChange(this);" style="width: 160px;" name="files" type="file" accept=".xls">
					</form>
				</div>
				<div class="col-sm-2" style="float: left;">
					<a title="" href="javascript:;" class="g-btn g-mr-5"
										onclick="AddAUIFileLog()"><em>确定</em><b></b></a>
				</div> -->
			<form action="<%=basePath %>1019/zai/xin/jian/supplierList" method="get">
				<div class="col-sm-1" style="float: left;">
					<a href="addSupplierAdmin" class="btn btn-primary">
						添加供应商
					</a>
				</div>
				<div class="col-sm-2" style="float: right;">
					<div class="form-group">
						<div class="input-group">
							<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
								会员名称
							</label>
							<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="会员名称"
								id="username" name="username" />
						</div>
					</div>
				</div>
				<div class="col-sm-2" style="float: right;">
					<div class="form-group">
						<div class="input-group">
							<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
								商家名称
							</label>
							<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="商家名称"
								id="suppliername" name="suppliername" />
						</div>
					</div>
				</div>
				<div class="col-sm-1" style="float: right;">
					<button type="submit" class="btn btn-primary">
						搜索
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr>
					<th>公司名称</th>
					<th>联系方式</th>
					<th>地址1</th>
					<th>所属会员</th>
					<th>库存</th>
					<th>注册时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${supplierAll}" var="supplier" varStatus="status">
					<tr height="60px;">
						<td>${supplier.suppliername}</td>
						<td>${supplier.telphone1}</td>
						<td>
							<c:if test="${supplier.supplierposition !=null}">
							<p style="width: 200px;overflow: hidden;clear:both;text-overflow:ellipsis;white-space: nowrap;text-align: left;" title="${supplier.supplierposition}">${supplier.supplierposition}</p>
							</c:if>
						<c:if test="${supplier.supplierposition ==null}">
							<p style="width: 200px;overflow: hidden;clear:both;text-overflow:ellipsis;white-space: nowrap;text-align: left" title="${supplier.repoposition}">${supplier.repoposition}</p>
						</c:if>
						</td>
						<td class="fan">${supplier.user.username}</td>
						<td align="center">
							${supplier.validityperiod}
						</td>
						<td>
							<fmt:formatDate value="${supplier.time}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td align="center">
							<p><a href="javascript:;" class="labeladd" data-supplieruuid="${supplier.supplieruuid }" data-label1="${supplier.supplier_label1}" data-label2="${supplier.supplier_label2}" data-label3="${supplier.supplier_label3}" data-label4="${supplier.supplier_label4}" data-label5="${supplier.supplier_label5}">添加标签</a></p>
							<a href="updateSupplierAdmin?sid=${supplier.supplieruuid}">修改</a>
							<a href="deleteSupplierAdmin?sid=${supplier.supplieruuid}"  onClick="return confirm('确定删除?');" >删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="width: 100%;height: 27px;margin-top: 3px;">
       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page+3}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
	</div>
	<div id="upfullbg"></div>  
    <div id="updialog">  
    	<div style="height:40px; background:#1057A7;text-align: center;line-height: 40px;">
    		<span style="font-weight: bold;font-size: 17px;color: white;line-height: 40px;">报价记录添加</span>
    		<a href="javascript:;" onclick="closeAdd()">
   	           <img style="position: absolute;margin-left: 78px;margin-top: 3px;" src="<%=basePath %>logo/close.png">
   	       </a>
    	</div>
    	<form id="quoteForm" action="supplierupdateByAdmin" method="post" style="padding-left: 20px;padding-top: 20px;">
	    	<input type="hidden" id="supplieruuid" name="supplieruuid">
	    	<p>
	    		标&#8195;签&#8195;1&#8195;
	    	</p><input onblur="id1()" type="text" id="supplier_label1" name="supplier_label1" placeholder="标签" style="text-transform: uppercase;width: 240px;color:#000000;">
	    	<p style="display: block;margin-left: 80px;height: 5px;color: red;"></p>
	    	<p>
	    		标&#8195;签&#8195;2&#8195;
	    	</p><input onblur="id1()" type="text" id="supplier_label2" name="supplier_label2" placeholder="标签" style="text-transform: uppercase;width: 240px;color:#000000;">
	    	<p style="display: block;margin-left: 80px;height: 5px;color: red;"></p>
	    	<p>
	    		标&#8195;签&#8195;3&#8195;
	    	</p><input onblur="id1()" type="text" id="supplier_label3" name="supplier_label3" placeholder="标签" style="text-transform: uppercase;width: 240px;color:#000000;">
	    	<p style="display: block;margin-left: 80px;height: 5px;color: red;"></p>
	    	<p>
	    		标&#8195;签&#8195;4&#8195;
	    	</p><input onblur="id1()" type="text" id="supplier_label4" name="supplier_label4" placeholder="标签" style="text-transform: uppercase;width: 240px;color:#000000;">
	    	<p style="display: block;margin-left: 80px;height: 5px;color: red;"></p>
	    	<p>
	    		标&#8195;签&#8195;5&#8195;
	    	</p><input onblur="id1()" type="text" maxlength="4" id="supplier_label5" name="supplier_label5" placeholder="标签" style="text-transform: uppercase;width: 240px;color:#000000;">
    		<br>
	    	<button id="quote_add" type="submit" class="g-btn g-mr-5 tian" style="border: none;height: 30px;width: 70px;padding: 0px;cursor: pointer;padding-top: 1px\0;float: right; margin-right: 205px;margin-top: 15px;background: #1057A7;color:white">
				添加保存
			</button>
    	</form>
	</div>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
$(".labeladd").on("click",function(){
	var label1=$(this).data("label1");
	var label2=$(this).data("label2");
	var label3=$(this).data("label3");
	var label4=$(this).data("label4");
	var label5=$(this).data("label5");
	var supplieruuid=$(this).data("supplieruuid");
	$("#supplieruuid").val(supplieruuid);
	$("#supplier_label1").val(label1);
	$("#supplier_label2").val(label2);
	$("#supplier_label3").val(label3);
	$("#supplier_label4").val(label4);
	$("#supplier_label5").val(label5);
	$("#upfullbg").css({  
        display: "block"  
	});  
	$("#updialog").show();
})

function AddAUIFileLog(){
	var formData = new FormData($("#upload_form")[0]);
	if(document.getElementById("material_name").value==""){
	   return false;
	}
	alert(document.getElementById("material_name").value)
	$.ajax({  
		url: 'suppliernamelist' ,  
		type: 'POST',  
		data: formData,  
		dataType:"json",
		async: true,  
		cache: false,  
		contentType: false,  
		processData: false,
		beforeSend:function()
           { //触发ajax请求开始时执行
			layer.msg('上传成功，系统处理中', {
				  icon: 1,
				  time: 1200 //2秒关闭（如果不配置，默认是3秒）
				}, function(){
				  //do something
				}); /* layer.msg("文件上传中请等待！"); */
           $('.checkout-submit').attr('onclick','javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
           }, 
		success: function (data) {  
			if(data.result=='success'){
				layer.alert("成功："+data.chengong+"\n失败："+data.shibai+"\n重复："+data.chongfu+"<br>数量、单价栏必须为数字，其他栏不得为空", {icon : 6});
			}else if(data.result=='fail'){
				layer.alert("成功："+data.chenggong+"<br>"+data.msg, {icon : 6});
			}else if(data.result=='login'){
				window.location.href="frontLogin";
			}
		}  
	});  	
}

function searchProduct() {
	var supplier = $("#suppliername").val();
	var username = $("#username").val();
	var url = '<%=basePath %>1019/zai/xin/jian/supplierList?suppliername='+supplier+"&username="+username;
	window.location = url;
};
$("table").on("click",".update", function(){
	var price = $(this).parents(".text-c").data("price");
    var h = $(this).parents(".text-c").data("beizhu");
    $(this).html("确定");
    var Enumber = $(this).siblings(".Enumber");
    var eh = '<input type="text" id="express_number" value="'+h+'" class="input-text"/>';
    $(this).addClass("sta").removeClass("update");
    var fan = $(this).siblings(".fan");
    var fh = '<input type="text" id="fan" value="'+price+'" class="input-text"/>';
    fan.html(fh);
    Enumber.html(eh);
});
function closeAdd(){
	window.location=location;
}
$("table").on("click", ".sta", function(){
    var id = $(this).parents(".text-c").data("id");
    var fan = $("#fan").val();
    $(this).siblings(".fan").html(fan);
    var number = $("#express_number").val();
    $(this).siblings(".Enumber").html(number);
    $(this).html("修改");
    $(this).removeClass("sta").addClass("update");
    $.ajax({
        type:"post",
        url:"upInquiry",
        async:true,
        dataType: "json",
        data: {
        	inquiry_price:fan,
        	inquiry_beizhu:number,
            inquiry_id: id
        },
        success : function(data){
        	window.location.reload();
            layer.msg(data.msg);
        }
    });
});
function first(){
	window.location.href='supplierList?page=${1}&suppliername=${suppliername}';
}
function end(){
	window.location.href='supplierList?page=${count == 0 ? 1:count }&suppliername=${suppliername}';
}
function er(){
	var page=${page+1 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='supplierList?page=${page+1}&suppliername=${suppliername}';
	}
}
function san(){
	var page=${page+2 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='supplierList?page=${page+2}&suppliername=${suppliername}';
	}
}
function si(){
	var page=${page+3 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='supplierList?page=${page+3}&suppliername=${suppliername}';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='supplierList?page=${page-1}&suppliername=${suppliername}';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='supplierList?page=${page+1}&suppliername=${suppliername}';
	}
}
</script>
</body>
</html>