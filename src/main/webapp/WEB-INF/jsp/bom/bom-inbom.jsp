<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!doctype html>
<html lang="zh-cn">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>添加产品</title>
<link rel="stylesheet" href="<%=basePath %>css/index.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/js/bootstrap.min.js"></script>
		<style type="text/css">
		a:hover{ text-decoration: none} 
        table
        {
            border: black solid 1px;
            border-collapse: collapse;
            width: 100%;
        }
        td
        {
            border: black solid 1px;
            padding: 3px;
        }
        .td_Num
        {
            width: 40px;
            text-align: center;
        }
        .td_Item
        {
           
            text-align: center;
        }
        .td_Oper
        {
            width: 120px;
            text-align: center;
        }
        .td_Oper span
        {
            cursor: pointer;
        }
    </style>
</head>

<body class="container-fluid" style="margin-top: 20px;">
	<div class="row">
		<div class="col-sm-12" style="width: 100%">
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/addBom" enctype="multipart/form-data" style="margin-left: 100px;margin-top: 20px;">
				<div class="row">
					<div class="col-md-12" >
						<div>Bom表内容</div>
							<input type="hidden" name="bom_content" id="bom_content">
							<table style="width: 1000px;">
								<thead>
						        <tr>
						            <td class='td_Num' width="40px;"> 序号</td>
						            <td class='td_Item'>型号</td>
						            <td class='td_Item'>封装</td>
						            <td class='td_Item'>品牌</td>
						            <td class='td_Item' width="65px;">单位</td>
						            <td class='td_Item' width="65px;">数量</td>
						            <td class='td_Item' width="65px;">单价</td>
						            <td class='td_Item' width="65px;">小计</td>
						            <td class='td_Item'>备注</td>
						            <td class='td_Oper' width="120px;">
						            	 相关操作 <a href="#" onclick="add_line();">添加</a>
						            </td>
						        </tr>
						        </thead>
						        <tbody id="content">
						        </tbody>
						    </table>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">用户号码：</div>
							<input onblur="id2()" style="width: 200px;" type="text" class="form-control" id="bom_userphone" name="bom_userphone" placeholder="手机" required>
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">金额：</div>
							<input type="text" class="form-control" id="bom_price" name="bom_price" placeholder="" style="width: 200px;" required>
						</div>
					</div>
				</div>
				<br />
				<div class="col-sm-6">
					<button type="submit" onclick="SaveData()" style="margin-left: 140px;" class="btn btn-default">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=basePath %>js/jquerybasic.js"></script>
<script language="javascript" src="<%=contextPath %>/js/jquery.table.tr.js"></script>
<script type="text/javascript">

$("#bom_userphone").click(function(){
	var data=0;
	$('#content tr').each(function () {
		var a= $(this).find("td:eq(7)").find("input").val();
		data=parseFloat(data)+parseFloat(a);
    });
	$("#bom_price").val(parseFloat(data).toFixed(2));
});
function id2() {
    var phone = document.getElementById("bom_userphone").value;
    $.post("queryByPhone?phone="+phone,
        function(data){
			if(data.result=="fail"){
				$("#bom_userphone").val("");
				layer.alert("没有该用户，请先注册", {icon : 5})
			}else if(data.result=="seccuss"){
			}
		}
   	)
}
var currentStep = 0;
var max_line_num = 0;
//添加新记录
function add_line() {
    max_line_num = $("#content tr:last-child").children("td").html();
    if (max_line_num == null) {
        max_line_num = 1;
    }
    else {
        max_line_num = parseInt(max_line_num);
        max_line_num += 1;
    }
    $('#content').append(
    "<tr id='line" + max_line_num + "'>" +
        "<td class='td_Num' width='60px'>" + max_line_num + "</td>" +
        "<td class='td_Item' width='120px'><input type='text' class='form-control' value=''></input></td>" +
        "<td class='td_Item' width='80px'><input type='text' class='form-control' value=''></td>" +
        "<td class='td_Item' width='80px'><input type='text' class='form-control' value=''width='120px'></input></td>" +
        "<td class='td_Item' width='65px'><input type='text' class='form-control' value=''width='120px'></td>" +
        "<td class='td_Item' width='65px'><input type='text' class='form-control' value=''width='120px'></td>" +
        "<td class='td_Item' width='65px'><input type='text' class='form-control' value=''width='120px'></input></td>" +
        "<td class='td_Item' width='65px'><input type='text' class='form-control' value=''width='120px'></td>" +
        "<td class='td_Item' width='120px'><input type='text' class='form-control' value=''width='120px'></input></td>" +
        "<td class='td_Oper' width='120px'>" +
            "<span onclick='up_exchange_line(this);'>上移</span> " +
            "<span onclick='down_exchange_line(this);'>下移</span> " +
            "<span onclick='remove_line(this);'>删除</span> " +
        "</td>" +
    "</tr>");
}
$(function () {
    $(document).on("input propertychange",".form-control",function(){
    	$('#content tr').each(function () {
            var stepDescription1 = $(this).find("td:eq(5)").find("input").val();
            var stepName2 = $(this).find("td:eq(6)").find("input").val();
            var stepDescription2 = $(this).find("td:eq(7)").find("input").val();
            var b=parseFloat(stepName2)*parseFloat(stepDescription1);
        	if(parseFloat(b)>0){
        		$(this).find("td:eq(7)").find("input").val(b.toFixed(2))
        	}else{
        		$(this).find("td:eq(7)").find("input").val("")
        	}
        });
    });
});
//删除选择记录
function remove_line(index) {
    if (index != null) {
        currentStep = $(index).parent().parent().find("td:first-child").html();
    }
    if (currentStep == 0) {
        alert('请选择一项!');
        return false;
    }
    if (confirm("确定要删除改记录吗？")) {
        $("#content tr").each(function () {
            var seq = parseInt($(this).children("td").html());
            if (seq == currentStep) { $(this).remove(); }
            if (seq > currentStep) { $(this).children("td").each(function (i) { if (i == 0) $(this).html(seq - 1); }); }
        });
    }
}
//上移
function up_exchange_line(index) {
    if (index != null) {
        currentStep = $(index).parent().parent().find("td:first-child").html();
    }
    if (currentStep == 0) {
        alert('请选择一项!');
        return false;
    }
    if (currentStep <= 1) {
        alert('已经是最顶项了!');
        return false;
    }
    var upStep = currentStep - 1;
    //修改序号
    $('#line' + upStep + " td:first-child").html(currentStep);
    $('#line' + currentStep + " td:first-child").html(upStep);
    //取得两行的内容
    var upContent = $('#line' + upStep).html();
    var currentContent = $('#line' + currentStep).html();
    $('#line' + upStep).html(currentContent);
    //交换当前行与上一行内容
    $('#line' + currentStep).html(upContent);
    $('#content tr').each(function () { $(this).css("background-color", "#ffffff"); });
    $('#line' + upStep).css("background-color", "yellow");
    event.stopPropagation(); //阻止事件冒泡
}
//下移
function down_exchange_line(index) {
    if (index != null) {
        currentStep = $(index).parent().parent().find("td:first-child").html();
    }
    if (currentStep == 0) {
        alert('请选择一项!');
        return false;
    }
    if (currentStep >= max_line_num) {
        alert('已经是最后一项了!');
        return false;
    }
    var nextStep = parseInt(currentStep) + 1;
    //修改序号
    $('#line' + nextStep + " td:first-child").html(currentStep);
    $('#line' + currentStep + " td:first-child").html(nextStep);
    //取得两行的内容
    var nextContent = $('#line' + nextStep).html();
    var currentContent = $('#line' + currentStep).html();
    //交换当前行与上一行内容
    $('#line' + nextStep).html(currentContent);
    $('#line' + currentStep).html(nextContent);
    $('#content tr').each(function () { $(this).css("background-color", "#ffffff"); });
    $('#line' + nextStep).css("background-color", "yellow");
    event.stopPropagation(); //阻止事件冒泡
}
//保存数据
function SaveData() {
	var bom_userphone=$("#bom_userphone").val();
	if(bom_userphone==null ||bom_userphone==""){
		alert("请输入号码");
		return false;
	}
    var data = "<tbody>";
    $('#content tr').each(function () {
        data += "<tr class='text-c' align='center'>";
        var stepName = $(this).find("td:eq(1)").find("input").val();
        var stepDescription = $(this).find("td:eq(2)").find("input").val();
        var stepName1 = $(this).find("td:eq(3)").find("input").val();
        var stepDescription1 = $(this).find("td:eq(4)").find("input").val();
        var stepName2 = $(this).find("td:eq(5)").find("input").val();
        var stepDescription2 = $(this).find("td:eq(6)").find("input").val();
        var stepName3 = $(this).find("td:eq(7)").find("input").val();
        var stepDescription3 = $(this).find("td:eq(8)").find("input").val();
        data += "   <td><a href='search?keyword="+stepName.replace("%","")+"&amp;value=product&amp;page=1'>" + stepName + "</a></td>";
        data += "   <td>" + stepDescription + "</td>";
        data += "   <td>" + stepName1 + "</td>";
        data += "   <td>" + stepDescription1 + "</td>";
        data += "   <td>" + stepName2 + "</td>";
        data += "   <td>" + stepDescription2 + "</td>";
        data += "   <td>" + stepName3 + "</td>";
        data += "   <td class='beizhu'>" + stepDescription3 + "</td>";
        data += "</tr>";
    });
    data += "</tbody>";
    $("#bom_content").val(data.toString());
    document.getElementById("form").submit();
}
</script>
</html>
