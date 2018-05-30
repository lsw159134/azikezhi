<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在芯间电子查询网</title>
<!-- <style type="text/css">
	.myTb{border-top:1px solid;border-left:1px solid #999;border-spacing:0;}
	.myTb td{border-bottom:1px solid #999;border-right:1px solid #999;}
</style> -->
<style type="text/css">
	table
        {
            border: black solid 1px;
            border-collapse: collapse;
        }
        tr{
        	text-align: center;
        }
        .td_Num
        {
            text-align: center;
        }
        .td_Item
        {
            text-align: center;
        }
        .td_Oper
        {
            text-align: center;
        }
        .td_Oper span
        {
            cursor: pointer;
        }
</style>
</head>
<body>
<div id="myPrintArea" style="margin-left: 30px;">
	<div style="margin-left: 170px;">
		<div style="margin-left: 180px;">
			<div style="margin-left: -15px;font-size: 20px;">在芯间电子查询网</div>
			<div style="margin-left: -48px;font-size: 12px;margin-top: 5px;">
				地址:深圳市福田区华强北华强大厦C座23J
				<div style="font-size: 18px;margin-left: 400px;margin-top: -40px;">
					<span style="font-size: 24px;margin-top: -30px;">收据</span>
				</div>
			</div>
		</div>
	</div>	
	<div style="margin-left: 308px;margin-top: 10px;font-size: 12px;">电话：0755-82720040   18902475806</div><br>							
	<div style="margin-left: 32px;font-size: 12px;">
		<span>客户\公司名： <span id="x1">${bom.bom_name }</span></span>
		<span style="float: right;">日期：&nbsp;&nbsp;<fmt:formatDate value="${dyshijian }" pattern="yyyy-MM-dd"/></span>
	</div>		
	<div style="margin-left: 32px;font-size: 12px;margin-top: 10px;">地址：<span id="x2">${bom.bom_address }</span></div>									
	<div style="margin-left: 32px;font-size: 12px;margin-top: 10px;">电话：<span id="x3">${bom.bom_phone }</span></div>									
	<div style="margin-left: 30px;font-size: 12px;">
		<table class="dayintable" style="width: 800px;font-size: 12px;border-collapse:collapse;" border="1" cellpadding="" cellspacing="0">
			<tr align="center">
				<td>名称/类别</td>
				<td width="80px;">品牌</td>
				<td width="80px;">封装</td>
				<td width="65px;">单位</td>
				<td width="65px;">数量</td>
				<td width="65px;">单价</td>
				<td width="65px;">金额</td>
				<td width="120px;">备注</td>
			</tr>
			${bom.bom_content}
			<c:if test="${kuaidi!=0 }">
          		<tr align="center" class="text-c" style="height: 25px;">
           			<td  align="center" class="01">
           				${yunfei }
           			</td><td></td><td></td>
           			<td  align="center" class="o4">
           				${danwei }
           			</td>
               		<td align="center" class="o6">
               			1
           			</td>
               		<td align="center">${kuaidi }</td>
               		<td align="center" >
               			${kuaidi}
           			</td>
           			<td></td>
           		</tr>
           	</c:if>
           	<tr align="center" class="tr1" style="height: 25px;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr align="center" class="tr1" style="height: 25px;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="tr1">
				<td colspan="9">
					<span style="margin-left: 10px;"> 合计（大写）：</span>
					<span style="margin-left: 60px;" id="daxie"></span>
					<span style="margin-left: 260px;">小写：</span>
					<span style="margin-left: 50px;" id="pxiaoxie">${bom.bom_price}元</span>
				</td>
			</tr>
		</table>
	</div><br>				
	<div style="margin-left: 40px;margin-top: -13px;">在芯间电子元器件查询网 www.zaixinjian.com 最专业的电子查询平台	</div>							
</div>
<div class="page-container">
    <div style="margin-left: 170px;">
		<div style="margin-left: 180px;">
			<div style="margin-left: -15px;font-size: 20px;">在芯间电子查询网</div>
			<div style="margin-left: -48px;font-size: 12px;margin-top: 5px;">
				地址:深圳市福田区华强北华强大厦C座23J
				<div style="font-size: 18px;margin-left: 400px;margin-top: -40px;">
					<span style="font-size: 24px;margin-top: -30px;">收据</span>
				</div>
			</div>
		</div>
	</div>	
	<div style="margin-left: 308px;margin-top: 10px;font-size: 12px;">电话：0755-82720040   18902475806</div><br>							
	<div style="margin-left: 32px;font-size: 12px;">
		<span>客户\公司名：<span id="u1">${bom.bom_name }</span>&nbsp;&nbsp;<span id="uu1" style="color: red;">修改</span><span id="qu1" style="color: red;">确认</span></span>
		<span style="margin-left: 440px;">日期：&nbsp;&nbsp;<fmt:formatDate value="${dyshijian }" pattern="yyyy-MM-dd"/></span>
	</div>
	<div style="margin-left: 32px;font-size: 12px;margin-top: 10px;">地址：<span id="u2">${bom.bom_address }</span>&nbsp;&nbsp;<span id="uu2" style="color: red;">修改</span><span id="qu2" style="color: red;">确认</span></div>									
	<div style="margin-left: 32px;font-size: 12px;margin-top: 10px;">电话：<span id="u3">${bom.bom_phone }</span>&nbsp;&nbsp;<span id="uu3" style="color: red;">修改</span><span id="qu3" style="color: red;">确认</span></div>									
	<div style="margin-left: 30px;font-size: 12px;">
		<table class="dayintable" style="width: 1000px;font-size: 12px;border-collapse:collapse;" border="1" cellpadding="" cellspacing="0">
			<tr align="center">
				<td>名称/类别</td>
				<td width="80px;">品牌</td>
				<td width="80px;">封装</td>
				<td width="65px;">单位</td>
				<td width="65px;">数量</td>
				<td width="65px;">单价</td>
				<td width="65px;">金额</td>
				<td width="120px;">备注</td>
				<td class='td_Oper' width="40px;" colspan="2">
	            	 相关操作
	            </td>
			</tr>
			${bom.bom_content}
			<c:if test="${kuaidi!=0 }">
          		<tr align="center" class="text-c" style="height: 25px;">
           			<td  align="center" class="01">
           				${yunfei }
           			</td><td></td><td></td>
           			<td  align="center" class="o4">
           				${danwei }
           			</td>
               		<td align="center" class="o6">
               			1
           			</td>
               		<td align="center" id="yun7">${kuaidi }</td>
               		<td align="center" >
               			${kuaidi}
           			</td>
               		<td></td>
               		<td  width="60px;"  align="center" >
               			<span id="yun">修改</span><span id="yunq">确认</span>
               		</td>
               		<td width="60px;"  align="center" >
               			<span id="deley">删除</span>
               		</td>
           		</tr>
           	</c:if>
           	<tr align="center" class="tr1" style="height: 25px;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td><td></td><td></td>
				<td></td>
			</tr>
			<tr align="center" class="tr1" style="height: 25px;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td><td></td>
			</tr>
			<tr>
				<td colspan="10" style="margin-top: 30px;">
					<span style="margin-left: 10px;"> 合计（大写）：</span>
					<span style="margin-left: 60px;" id="xianshi"></span>
					<span style="margin-left: 260px;">小写：</span>
					<span style="margin-left: 50px;" id="pxiaoxie">${bom.bom_price}元</span>
				</td>
			</tr>
		</table>
	</div><br>				
	<div style="margin-left: 40px;margin-top: -13px;">在芯间电子元器件查询网 www.zaixinjian.com 最专业的电子查询平台	</div>
</div>

<input id="biuuu_button" type="button" value="打印"></input>  
<script type="text/javascript" src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.PrintArea.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript">

$("#deley").on("click", function(){
	var u1=$("#u1").html();
	var u2=$("#u2").html();
	var u3=$("#u3").html();
	window.location.href="adminShoujuBomxiugai?bom_name="+u1+"&bom_address="+u2+"&bom_phone="+u3+"&yunfei=0"+"&bid="+${bom.bom_id};
	document.getElementById('yun').style.display = '';
	document.getElementById('yunq').style.display = 'none';
});
$("#yun").on("click", function(){
	var u1=$("#yun7").html();
	alert(u1)
	$("#yun7").html("<input text='type' id='nameu' value='"+u1+"'>");
	document.getElementById('yunq').style.display = '';
	document.getElementById('yun').style.display = 'none';
});
$("#yunq").on("click", function(){
	var y2=$("#nameu").val();
	$("#yun7").html(u1);;
	var u1=$("#u1").html();
	var u2=$("#u2").html();
	var u3=$("#u3").html();
	window.location.href="adminShoujuBomxiugai?bom_name="+u1+"&bom_address="+u2+"&bom_phone="+u3+"&yunfei="+y2+"&bid="+${bom.bom_id};
	document.getElementById('yun').style.display = '';
	document.getElementById('yunq').style.display = 'none';
});
$(function(){
	var money='${bom.bom_price}';
   	var ChineseStr=xx(money);
    $("#xianshi").html(ChineseStr);
    $("#daxie").html(ChineseStr);
	document.getElementById('myPrintArea').style.display = 'none';
	document.getElementById('qu1').style.display = 'none';
	document.getElementById('qu2').style.display = 'none';
	document.getElementById('qu3').style.display = 'none';
	document.getElementById('yunq').style.display = 'none';
    
});
$("#uu1").on("click", function(){
	var u1=$("#u1").html();
	$("#u1").html("<input text='type' id='nameu' value='"+u1+"'>");
	document.getElementById('qu1').style.display = '';
	document.getElementById('uu1').style.display = 'none';
});
$("#qu1").on("click", function(){
	var u1=$("#nameu").val();
	$("#u1").html(u1);;
	document.getElementById('uu1').style.display = '';
	document.getElementById('qu1').style.display = 'none';
});
$("#uu2").on("click", function(){
	var u1=$("#u2").html();
	$("#u2").html("<input text='type' id='nameu' value='"+u1+"'>");
	document.getElementById('qu2').style.display = '';
	document.getElementById('uu2').style.display = 'none';
});
$("#qu2").on("click", function(){
	var u1=$("#nameu").val();
	$("#u2").html(u1);;
	document.getElementById('uu2').style.display = '';
	document.getElementById('qu2').style.display = 'none';
});
$("#uu3").on("click", function(){
	var u1=$("#u3").html();
	$("#u3").html("<input text='type' id='nameu' value='"+u1+"'>");
	document.getElementById('qu3').style.display = '';
	document.getElementById('uu3').style.display = 'none';
});
$("#qu3").on("click", function(){
	var u1=$("#nameu").val();
	$("#u3").html(u1);;
	document.getElementById('uu3').style.display = '';
	document.getElementById('qu3').style.display = 'none';
});
$(document).ready(function(){  
	$("input#biuuu_button").click(function(){
		$("#d0").html($("#t0").html());
		$("#d1").html($("#t1").html());
		$("#d2").html($("#t2").html()); 
		$("#d3").html($("#t3").html()); 
		$("#d4").html($("#t4").html()); 
		$("#d5").html($("#t5").html()); 
		$("#d6").html($("#t6").html()); 
		$("#d7").html($("#t7").html()); 
		$("#d8").html($("#t8").html());
		$("#d9").html($("#t9").html());
		$("#x1").html($("#u1").html());
		$("#x2").html($("#u2").html());
		$("#x3").html($("#u3").html());
		$("#daxie").html($("#xianshi").html());
		$("#dyxiaoxie").html($("#pxiaoxie").html());
		$("div#myPrintArea").printArea();
	}); 
}); 

function xx(money){
	var cnNums = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖"); //汉字的数字  
    var cnIntRadice = new Array("","拾","佰","仟"); //基本单位  
    var cnIntUnits = new Array("","万","亿","兆"); //对应整数部分扩展单位  
    var cnDecUnits = new Array("角","分","毫","厘"); //对应小数部分单位  
    //var cnInteger = "整"; //整数金额时后面跟的字符  
    var cnIntLast = "元"; //整型完以后的单位  
    var maxNum = 999999999999999.9999; //最大处理的数字  
      
    var IntegerNum; //金额整数部分  
    var DecimalNum; //金额小数部分  
    var ChineseStr=""; //输出的中文金额字符串  
    var parts; //分离金额后用的数组，预定义  
    if( money == "" ){  
        return "";  
    }  
    money = parseFloat(money);  
    if( money >= maxNum ){  
        $.alert('超出最大处理数字');  
        return "";  
    }  
    if( money == 0 ){  
        //ChineseStr = cnNums[0]+cnIntLast+cnInteger;  
        ChineseStr = cnNums[0]+cnIntLast  
        //document.getElementById("show").value=ChineseStr;  
        return ChineseStr;  
    }  
    money = money.toString(); //转换为字符串  
    if( money.indexOf(".") == -1 ){  
        IntegerNum = money;  
        DecimalNum = '';  
    }else{  
        parts = money.split(".");  
        IntegerNum = parts[0];  
        DecimalNum = parts[1].substr(0,4);  
    }  
    if( parseInt(IntegerNum,10) > 0 ){//获取整型部分转换  
        zeroCount = 0;  
        IntLen = IntegerNum.length;  
        for( i=0;i<IntLen;i++ ){  
            n = IntegerNum.substr(i,1);  
            p = IntLen - i - 1;  
            q = p / 4;  
            m = p % 4;  
            if( n == "0" ){  
                zeroCount++;  
            }else{  
                if( zeroCount > 0 ){  
                    ChineseStr += cnNums[0];  
                }  
                zeroCount = 0; //归零  
                ChineseStr += cnNums[parseInt(n)]+cnIntRadice[m];  
            }  
            if( m==0 && zeroCount<4 ){  
                ChineseStr += cnIntUnits[q];  
            }  
        }  
        ChineseStr += cnIntLast;  
        //整型部分处理完毕  
    }  
    if( DecimalNum!= '' ){//小数部分  
        decLen = DecimalNum.length;  
        for( i=0; i<decLen; i++ ){  
            n = DecimalNum.substr(i,1);  
            if( n != '0' ){  
                ChineseStr += cnNums[Number(n)]+cnDecUnits[i];  
            }  
        }  
    }  
    if( ChineseStr == '' ){  
        //ChineseStr += cnNums[0]+cnIntLast+cnInteger;  
        ChineseStr += cnNums[0]+cnIntLast;  
    }
    return ChineseStr;
}
</script>

</body>
</html>