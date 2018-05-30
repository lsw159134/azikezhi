<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
	<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
    <title>购买记录/快递单号</title>
    <style type="text/css">
        table
        {
            border: black solid 1px;
            border-collapse: collapse;
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
            width: 120px;
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

<body>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
	    <c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
	    		<c:if test="${bom.bom_profit ==null || bom.bom_profit==0}">
	    			<form action="bomorderprofit" method="post">
				    	<span class="l">
				    		<input type="hidden" name=bom_id value="${bom.bom_id }">
				    		<input type="text" style="border:2px double rgb(250,0,255);height: 20px;" class="list-group-item list-group-item-success" placeholder="盈利金额"
										id="bom_profit" name="bom_profit" value="${express.express_profit }" />
							<input type="submit" class="btn radius btn-primary size-S">
						</span>
					</form>
	    		</c:if>
			</c:if>
			<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
				<c:if test="${fn:contains(sessionScope.user.admin_shrio, '1,2,3,4,5')}">
					${bom.bom_profit }
				</c:if>
			</c:if>
		<span class="r">
			<a href="<%=basePath%>1019/zai/xin/jian/bomQueryAll" style="color: red;margin-right: 10px;">
				返回上一页
			</a>
		</span>
    </div>
    <div class="mt-20">
    	<span>订单内容：</span><br>
	    <div style="margin-left: 30px;">
	    	<c:if test="${fn:contains(bom.bom_content, '<tbody>')}">
	    		<table>
					<thead>
			        <tr class="text-c">
			            <td class='td_Item'>型号</td>
			            <td class='td_Item'>封装</td>
			            <td class='td_Item'>品牌</td>
			            <td class='td_Item'>单位</td>
			            <td class='td_Item'>数量</td>
			            <td class='td_Item'>单价</td>
			            <td class='td_Item'>小计</td>
			            <td class='td_Item'>备注</td>
			        </tr>
			        </thead>
			        ${bom.bom_content}
			    </table>
	    	</c:if>
	    	<c:if test="${fn:contains(bom.bom_content, '<br>')}">
	    		${bom.bom_content}
	    	</c:if>
	    </div>
        <div style="width: 100%;">
       		<br />
			<br />
        	<div class="total" style="float: left;margin-left: 40px;">
	        	<strong style="color: red;">
	        		发票：<c:if test="${bom.bom_invoice == 1 }">
							不开
						</c:if>
						<c:if test="${bom.bom_invoice == 2 }">
							普通发票
						</c:if>
						<c:if test="${bom.bom_invoice == 3 }">
							增税发票
						</c:if>
				</strong>&nbsp;&nbsp;&nbsp;
				<c:if test="${sessionScope.user.admin_status eq '1' || user.admin_status eq '3' || user.admin_status eq '' || user.admin_status eq null }">
					支付方式:<strong id="effectivePrice" style="color: red;"><c:if test="${bom.bom_mode eq '1'}">
							微信
						</c:if><c:if test="${bom.bom_mode eq '2'}">
							支付宝
						</c:if><c:if test="${bom.bom_mode ne '2' && bom.bom_mode ne '1'}">
							${bom.bom_mode}
						</c:if></strong>&nbsp;&nbsp;&nbsp;
					 总金额:
					 <strong id="effectivePrice" style="color: red;">￥${bom.bom_price }
					 	<c:if test="${bom.bom_kuaidi == '申通' }">
							（含运费10元）
						</c:if>
						<c:if test="${bom.bom_kuaidi == '顺丰(省内)' }">
							（含运费13元）
						</c:if>
						<c:if test="${bom.bom_kuaidi == '顺丰(省外)' }">
							（含运费23元）
						</c:if>
					</strong>
					<strong><button onclick="shouju()">打印收据</button></strong>
				</c:if>
			</div>
			<c:if test="${sessionScope.user.admin_status eq '2' || user.admin_status eq '' || user.admin_status eq null }">
				<br />
				<br />
				<c:if test="${sessionScope.user.admin_status eq '2' || user.admin_status eq '' || user.admin_status eq null}">
					<div class="total" style="float: left;margin-left: 40px;">
						快递: <strong style="color: red;">${bom.bom_kuaidi}</strong>
					</div>
					<br />
					<br />
				</c:if>
				<div class="total" style="float: left;margin-left: 40px;">
					备注信息: <strong style="color: red;">${bom.bom_remarks }</strong>
				</div>
				<br />
				<br />
				<div class="total" style="float: left;margin-left: 40px;">
					收货信息: <strong style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;
						收货人姓名：${bom.bom_name}&nbsp;&nbsp;&nbsp;
						联系电话：${bom.bom_phone}&nbsp;&nbsp;&nbsp;&nbsp;
						收货地址：${bom.bom_address}</strong>
						<strong><button class="btn radius btn-primary size-S" data-remodal-target="fanli">打印快递单</button></strong>
				</div>
			</c:if>
			<br />
			<br />
			<table class="table">
	            <thead>
		            <tr class="text-c">
		            	<c:if test="${sessionScope.user.admin_status eq '2' || user.admin_status eq '3' || user.admin_status eq '' || user.admin_status eq null }">
		            		<th width="120px;">快递单号</th>
		            	</c:if>
		            	<c:if test="${sessionScope.user.admin_status eq '1' || user.admin_status eq '3' || user.admin_status eq '' || user.admin_status eq null }">
			            	<th width="120px;">返利金额</th>
			            	<th width="120px;">当前状态</th>
		                </c:if>
		                <th width="120px;">操作</th>
		            </tr>
	            </thead>
	            <tbody>
	                <tr class="text-c"
	                	data-help="${bom.bom_help}" data-status="${bom.bom_status}" data-fan="${bom.bom_fan}">
	                    <c:if test="${sessionScope.user.admin_status eq '2' || user.admin_status eq '3' || user.admin_status eq '' || user.admin_status eq null }">
	                    	<td width="120px;" align="center" class="Enumber">${bom.bom_help}</td>
	                    </c:if>
	                    <c:if test="${sessionScope.user.admin_status eq '1' || user.admin_status eq '3' || user.admin_status eq '' || user.admin_status eq null }">
		                    <td width="120px;" align="center" class="fan"><c:if test="${bom.bom_fan != null}">${bom.bom_fan}元</c:if>
		                    	<c:if test="${bom.bom_fan == null}">待添加</c:if>
		                    </td>
		                    <td width="120px;" align="center" class="express-status">
		                       <c:if test="${bom.bom_status == 1}">未付款</c:if>
		                        <c:if test="${bom.bom_status == 2}">已付款</c:if>
		                        <c:if test="${bom.bom_status == 3}">已发货</c:if>
		                        <c:if test="${bom.bom_status == 4}">已完成</c:if>
		                        <c:if test="${bom.bom_status == 5}">已取消</c:if>
		                        <c:if test="${bom.bom_status == 6}">审核中</c:if>
		                    </td>
	                    </c:if>
	                   <c:if test="${express.status != 4}">
	                    	<td width="120px;" align="center" class="update">修改</td>
	                    </c:if>
	                    <c:if test="${express.status == 4}">
	                    	<td></td>
	                    </c:if>
	                </tr>
	            </tbody>
	        </table>
        </div>
    </div>
</div>
<div class="remodal" data-remodal-id="fanli">
	<button data-remodal-action="close" class="remodal-close"></button>
	<table style="width: 200px;margin-left: 200px;">
		<tr class="peisong">
				<td style="">
					<input type="radio"   name="expressname" value="申通"  checked="checked" />申通
				</td>
				<td style="">
					<input type="radio" name="expressname" value="速尔快(广东省内)"  />速尔
				</td>	
			</tr>
	</table>
	<br />
	
	<button data-remodal-action="cancel" class="remodal-cancel">
		取消
	</button>
	<button data-remodal-action="confirm" class="remodal-confirm pay" onclick="expressprint()">
		确定
	</button>
</div>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
function shouju(){
	window.open("adminShoujuBom?bid=${bom.bom_id}"); 
}
function expressprint(){
	var expressname = $('.peisong input:radio:checked').val();
	window.open("<%=contextPath%>/1019/zai/xin/jian/adminprintBomKuai?bom_id=${bom.bom_id}&bom_kuaidi="+expressname);
}
function discount(eid,eprice){
	var preferentialamount = $("#preferentialamount").val();
	var discountdescription = $("#discountdescription").val();
	var a=eprice-preferentialamount;
	if (confirm("你确定提交吗？")) {  
		$.post("upDiscountprice?express="+eid+"&preferentialamount="+preferentialamount+"&discountdescription="+discountdescription+"&eprice="+eprice,
	        function(data){
				if(data.result=="fail"){
					layer.alert("失败", {icon : 5})
				}else if(data.result=="seccuss"){
					layer.alert("成功", {icon : 5})
					document.getElementById('bb').style.display = 'none';
					document.getElementById("aa").innerHTML = a.toFixed(2);
					document.getElementById('ss').style.display = 'none';
					document.getElementById("dd").innerHTML = discountdescription;
				}
			}
		)
	} 
}

$("table").on("click",".update", function(){
	var f = $(this).parents(".text-c").data("fan");
    var h = $(this).parents(".text-c").data("help");
    var s = $(this).parents(".text-c").data("status");
    $(this).html("确定");
    $(this).addClass("sta").removeClass("update");
    var Enumber = $(this).siblings(".Enumber");
    var eh = '<input type="text" id="express_number" value="'+h+'" class="input-text"/>';
    var fan = $(this).siblings(".fan");
    var fh = '<input type="text" id="fan" value="'+f+'" class="input-text"/>';
    var a = $(this).siblings(".express-status");
    if(s==1){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==2){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2" selected="selected">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==3){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3" selected="selected">已发货</option><option value="4">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==4){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4" selected="selected">已完成</option><option value="5">已取消</option><option value="6">审核中</option></select>';
    }else if(s==5){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5" selected="selected">已取消</option><option value="6">审核中</option></select>';
    }else if(s==6){
    	var ht = '<select id="s"><option value="1">未付款</option><option value="2">已付款</option><option value="3">已发货</option><option value="4">已完成</option><option value="5" selected="selected">已取消</option><option value="6" selected="selected">审核中</option></select>';
    }
    Enumber.html(eh);
    fan.html(fh);
    a.html(ht);
});

$("table").on("click", ".sta", function(){
    var id = '${bom.bom_id}';
    var uid = $(this).parents(".text-c").data("uid");
    var s = $("#s option:selected").val();
    var number = $("#express_number").val();
    $(this).siblings(".Enumber").html(number);
    var fan = $("#fan").val();
    $(this).siblings(".fan").html(fan);
    $(this).html("修改");
    $(this).removeClass("sta").addClass("update");
    if(s == 6){
        $(this).siblings(".express-status").html("审核中");
    } else if(s == 5){
        $(this).siblings(".express-status").html("已取消");
    } else if(s == 4){
        $(this).siblings(".express-status").html("已完成");
    } else if(s == 3){
        $(this).siblings(".express-status").html("已发货");
    } else if(s == 2){
        $(this).siblings(".express-status").html("已付款");
    } else if(s == 1){
        $(this).siblings(".express-status").html("未付款");
    }
    $.ajax({
        type:"post",
        url:"AdminupdateBom",
        async:true,
        dataType: "json",
        data: {
            bom_status: s,
            bom_help:number,
            bom_fan:fan,
            bom_id: id
        },
        success : function(data){
        	window.location.reload();
            layer.msg(data.msg);
        }
    });
});
</script>
<style type="text/css">
    #update{
        width: 100px;
        height: 25px;
    }
    #update:hover{
        color: darkred;
    }
</style>
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