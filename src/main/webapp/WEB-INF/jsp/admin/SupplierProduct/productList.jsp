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
	#dialog { 
          background-color: #fff;  
          border: 5px solid #8DB6CD;  
          height: 530px;  
          left: 31%;  
          margin: -200px 0 0 -200px;  
          position: fixed !important; /* 浮动对话框 */  
          position: absolute;  
          top: 44%;  
          width: 1000px;  
          z-index: 9999999999999;  
          border-radius: 5px;  
          display: none;  
      }
      #xunjiaForm input{
      	  border: 1px #8DB6CD solid;
      	  -moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;
      	  width: 600px;
      	  height: 40px;
      	  margin-left: 20px;
      	  margin-top:5px;
      	  margin-bottom:5px;
      	  font-weight: bold;
      	  color: blue;		
      }
      .custom_tb{
            /*border-collapse: collapse;*/
            border-spacing:0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #444;
            border:1px solid #ccc;
            border-radius: 6px;
            box-shadow: 0 1px 1px #ccc;
            margin-left: 20px;width: 960px;height: 370px;overflow:auto;
            border-collapse: separate;
        }
        .scrollbar-3 td{
        	border-bottom: 1px solid #ccc;
        }
        .custom_tb tbody {
	        display:block;
	        height:330px;
	        overflow-y:scroll;
	    }
	    .custom_tb thead{
	        display:table;
	        width:960px;
	        height:40px;
	        table-layout:fixed;
	        border-bottom: 1px solid #ccc;
	    }
	    .custom_tb tbody tr {
	    	display:table;
	        width:960px;
	        table-layout:fixed;
	    }
      .custom_tb tr:hover{
		    background-color: #fbf8e9;
		    transition: all 0.1s ease-in-out;
		}
		.custom_tb th,.custom_tb td{
		    border-left: 1px solid #ccc;
		    padding: 10px;
		    text-align: center;
		    height: 20px;
		}
		.custom_tb th{
		    background-color: #dce9f9;
		}
		.custom_tb td:first-child,.custom_tb th:first-child{
		    border-left: none;
		}
		.custom_tb th:first-child{
		    border-radius: 6px 0 0 0;
		}
		.custom_tb th:last-child{
		    border-radius: 0 6px 0 0;
		}
		.custom_tb tr:last-child td:first-child{
		    border-radius: 0 0 0 6px;
		}
		.custom_tb tr:last-child td:last-child{
		    border-radius: 0 0 6px 0;
		}
        .scrollbar-3::-webkit-scrollbar-track {
			-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.9);
			-moz-box-shadow: inset 0 0 6px rgba(0,0,0,0.9);
			-o-box-shadow: inset 0 0 6px rgba(0,0,0,0.9);
			box-shadow: inset 0 0 6px rgba(0,0,0,0.9);
			border-radius: 10px;
			background-color: #272626;
		}
		
		.scrollbar-3::-webkit-scrollbar {
			width: 10px;
			height: 10px;
		}
		
		.scrollbar-3::-webkit-scrollbar-thumb {
			border-radius: 10px;
			background-color: #297ED6;
			background-image: -webkit-linear-gradient(50deg, transparent, rgba(0, 0, 0, 0.6) 50%, transparent, transparent)
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
	<div class="col-sm-12" style="margin-left: 10px;">
		<div class="col-sm-1">
			<a href="<%=basePath %>1019/zai/xin/jian/SupplierAllProduct" class="btn btn-primary">
				产品首页
			</a>
		</div>
		<div class="col-sm-1">
			<a href="<%=basePath %>1019/zai/xin/jian/inSupplierProductAdmin" class="btn btn-primary">
				添加产品
			</a>
		</div>
		<form action="<%=basePath %>1019/zai/xin/jian/SupplierAllProduct" method="get">
			<div class="col-sm-2" style="float: right;">
				<div class="form-group">
					<div class="input-group">
						<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
							商家名称
						</label>
						<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="商家名称"
							id="supplier" name="supplier" />
					</div>
				</div>
			</div>
			<div class="col-sm-2" style="float: right;">
				<div class="form-group">
					<div class="input-group">
						<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
							型号名称
						</label>
						<input type="search" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="产品名称"
							id="product" name="product1" />
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
	<br>
	<br>
	<div class="col-md-12">
		<table class="table table-striped table-hover" style="background:#CBE9CF; color:#00060B;padding-left: 0px;padding-right: 0px;" id="sample-table-2">
			<thead >
				<tr>
					<th width="30px">序号</th>
					<th width="140px;">供应商</th>
					<th width="120px;">型号</th>
					<th width="40px;">厂商</th>
					<th width="40px;">批号</th>
					<th width="40px;">封装</th>
					<th width="40px;">数量</th>
					<th width="40px;">质量</th>
					<th width="40px;">赞</th>
					<th width="40px;">踩</th>
					<th width="70px;">交易说明</th>
					<th width="40px;">添加时间</th>
					<th width="45px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${product}" var="product" varStatus="status">
					<tr height="80px;" style="">
						<td width="30px" style="padding-left: 20px;">${status.count}</td>
						<td width="140px"><p style="width: 140px;overflow: hidden;clear:both;text-overflow:ellipsis;white-space: nowrap;text-align: left" title="${product.supplier }">${product.supplier }</p></td>
						<td width="120px;">${product.product}</td>
						<td width="40px;">${product.manufacturer}</td>
						<td width="40px;">${product.lotnumber }</td>
						<td width="40px;">${product.encapsulation}</td>
						<td width="40px;">${product.isgoodsinstock}</td>
						<td width="40px;">
							<c:if test="${product.quality==3}">
								一级库存
							</c:if>
							<c:if test="${product.quality==4}">
								二级库存
							</c:if>
							<c:if test="${product.quality==5}">
								三级库存
							</c:if>
							<c:if test="${product.quality==6}">
								普通库存
							</c:if>
						</td>
						<td width="40px;">
							${product.product_evaluatezai}
						</td>
						<td width="40px;">
							${product.product_evaluatecai}
						</td>
						<td width="70px;">${product.description}</td>
						<td width="45px;">
							<fmt:formatDate value="${product.time}" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td width="45px;">
							<a href="javascript:;" onclick="xunjia('${product.product}')">替换型号</a><br>
							<a href="updateProductSupplier?productuuid=${product.productuuid }" class="exchange"
								style="padding-right: 0px;width: 20px;color: gray;">修改</a>
							<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
								<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'o')}">
									|<a onclick="deleteproduct('${product.productuuid }')" href="javascript:;" class="exchange"
										style="padding-right: 0px;width: 20px;color: red;" onClick="return confirm('确定删除?');">删除</a>
								</c:if>
							</c:if>
							<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
								|<a onclick="deleteproduct('${product.productuuid }')" href="javascript:;" class="exchange"
									style="padding-right: 0px;width: 20px;color: red;" onClick="return confirm('确定删除?');">删除</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="14">
						 当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
			        	<button onclick = "first()">首页</button>&nbsp;
			        	<button onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
			        	<button onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
			        	<button onclick = "end()">尾页</button>
			        </th>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="fullbg"></div>  
<div id="dialog">  
	<div style="background: #8DB6CD;text-align: center;height: 40px;line-height: 40px;"> 
		   <span style="font-weight: bold;">
		      	替换型号
		   </span> 
	      <a style="float: right;margin-top: -5px;" href="javascript:;" onclick="closeBg()">
	          <img src="<%=basePath %>logo/close.png">
	      </a>
	</div>
	<div id="xunjiaForm">
		<input type="hidden" name="replace_product" id="replace_product" >
	    <input type="text" name="replace_name" id="xunjia_text" style="width: 300px;float: left">
	    <div id="accuracy" class="clickOver" style="float: left;margin-top: 12px;">
			<p style="float: left;">
				<input type="radio" name="replace_status" value="1" class="accuracy_cbox" 
					style="padding-top:5px;float: left;width: 20px;height: 20px;">
			</p>&nbsp;
			<p style="float: left;margin-top: 0px;margin-left: 5px;font: '微软雅黑';margin-top: 5px;">可完全替代型号</p>
			<p style="float: left;margin-top: 0px;">
				<input type="radio" name="replace_status" checked="checked" value="2" class="accuracy_cbox" 
					style="float: left;width: 20px;height: 20px;">
			</p>&nbsp;
			<p style="float: left;margin-top: 0px;margin-left: 5px;font: '微软雅黑';margin-top: 5px;">非完全替代型号</p>
		</div>
	    <input class="hah" onclick="saveXunJia()" type="button" style="color: white;background: #EE4000;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px;width: 75px;padding: 5px 10px 5px 15px;cursor:pointer;font-size: 14px;" value="添&emsp;加">
	</div>
	<table  class="custom_tb">
		<thead>
			<tr>
      			<th style="font-weight: bold;">型号</th>
      			<th style="width: 120px;font-weight: bold;">替换程度</th>
				<th style="width: 120px;font-weight: bold;">添加时间</th>
				<th style="width: 60px;font-weight: bold;">添加人</th>
				<th style="width: 60px;font-weight: bold;">操作</th>
         	</tr>
       	</thead>
        <tbody class="scrollbar-3">
        </tbody>
    </table>
</div>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
    try {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
        var date = new Date(jsonDate);
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var day = date.getDate();
        var hh = date.getHours();
        var mm = date.getMinutes();
        var ss = date.getSeconds();
        return date.getFullYear() + "-" + month + "-" + day + " " + hh + ":" + mm + ":" + ss;
    } catch (ex) {
        return "";
    }
}
function saveXunJia(){
	var s='';
	var product  = $('#replace_product').val();
	var text = $('#xunjia_text').val();
	var status=$('input:radio:checked').val();
	$.post("addreplaceByProduct?replace_name="+encodeURIComponent(text)+"&&replace_product="+encodeURI(product)+"&&replace_status="+status,
		function(data){
			if(data.result!="login"){
		  		for(var o in data.msg) {
		  			s+="<tr><td><input id='id"+data.msg[o].replace_id+"' style='border:1px;height:20px;width:520px;color:red;font-weight:bold;' type='text' name='xunjia_text' value='"+data.msg[o].replace_name+"' ></td><td style='width:120px'>"+data.msg[o].replace_status+"</td><td style='width:120px'>"+jsonDateFormat(data.msg[o].replace_time)+"</td><td style='width:60px'>"+data.msg[o].replace_adminname+"</td><td style='width:60px'>删除</td></tr>"
		  		}
		  		$("#fullbg").show();
	            $("#dialog").show();
	            $('.custom_tb tbody').html(s);
			}else{
				window.location.href="<%=basePath %>1019/zai/xin/jian/cont"
			}
   	    }
	)
}
function xunjia(product){
	var s ='';
	$.post("selereplaceByProduct?product="+product,
		function(data){
			$('#replace_product').val(product);
       	  	if(data.result!="login"){
       	  		for(var o in data.msg) {
       	  			s+="<tr><td><input id='id"+data.msg[o].replace_id+"' style='border:1px;height:20px;width:520px;color:red;font-weight:bold;' type='text' name='xunjia_text' value='"+data.msg[o].replace_name+"' ></td><td style='width:120px'>"+data.msg[o].replace_status+"</td><td style='width:120px'>"+jsonDateFormat(data.msg[o].replace_time)+"</td><td style='width:60px'>"+data.msg[o].replace_adminname+"</td><td class='deleth' data-id='"+data.msg[o].replace_id+"' style='width:60px'>删除</td></tr>"
       	  		}
       	  		$("#fullbg").show();
                $("#dialog").show();
                $('.custom_tb tbody').html(s);
			}else{
				window.location.href="<%=basePath %>1019/zai/xin/jian/cont"
			}
 	    }
    )
}
$(document).on('click', '.deleth', function () {
	var suid = $(this).data("id");
	$.ajax({
		type:"post",
        url:"deletereplace",
        async:true,
        dataType: "json",
        data: {
        	id:suid,
        },
		success : function(data){
			if(data.result=="success"){
        		layer.alert("删除成功",function(){var index = window.location=location;
                parent.layer.close(index);});
        	} 
		},
		error: function() {  
            alert('对不起失败了');  
        }  
    });
});
function closeBg() {
	$('#xunjia_text').val('');
    $("#fullbg,#dialog").hide();  
}
function first(){
	var manufacturer = $("#manufacturer").val();
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='<%=basePath %>1019/zai/xin/jian/SupplierAllProduct?page=${1}&product=${product1}&supplier=${supplier}';
}
function end(){
	var manufacturer = $("#manufacturer").val();
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='<%=basePath %>1019/zai/xin/jian/SupplierAllProduct?page=${count == 0 ? 1:count }&product=${product1}&supplier=${supplier}';
}
function previous(){
	var page=${page == 1};
	var manufacturer = $("#manufacturer").val();
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='<%=basePath %>1019/zai/xin/jian/SupplierAllProduct?page=${page-1}&product=${product1}&supplier=${supplier}';
	}
}
function next(){
	var page=${count <= page};
	var manufacturer = $("#manufacturer").val();
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='<%=basePath %>1019/zai/xin/jian/SupplierAllProduct?page=${page+1}&product=${product1}&supplier=${supplier}';
	}
}
//搜索
function searchProduct() {
	var product = $("#product").val();
	var supplier = $("#supplier").val();
	var url = '<%=basePath %>1019/zai/xin/jian/SupplierAllProduct?product1='+product+'&supplier='+supplier;
	window.location = url;
};
function deleteproduct(pid){
	$.ajax({
        type:"post",
        url:"deleteProductSupplier",
        async:true,
        dataType: "json",
        data: {productuuid:pid},
       success : function(data){
    	   location.reload() 
        }
    });
}

//调用的是这个方法
function ConvertJSONDateToJSDate(jsondate) {
    var date = new Date(parseInt(jsondate.replace("/Date(", "").replace(")/", ""), 10));
    return date;
}
</script>
</body>
</html>