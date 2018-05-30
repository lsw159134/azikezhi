<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" /> 
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在芯间电子查询网</title>
</head>
<body>
<div id="myPrintArea" style="margin-top: 40px;margin-left: 30px;background:url(<%=contextPath%>/img/suer.png);width: 860px;height: 485px;">
	<div style="margin-left: 60px;margin-top: 80px;float: left;">
		<span style="margin-left: 20px;">张小茹</span>
		<span style="margin-left: 95px;">0755-82720040</span>
		<div style="margin-left: 10px;margin-top: 10px;">
			<div style="margin-left: 15px;"><span>在芯间电子查询网</span></div>
			<div style="margin-left: -18px;margin-top: 15px;">
				<span style="margin-left: 30px;">广东省深圳市福田区华强北街道华强广场C座23j</span>
			</div>
		</div>
		<div style="margin-left: 10px;margin-top: 17px;">
			<span style="margin-left: 10px;" id="name">${express.name }</span>
			<span style="margin-left: 120px;" id="telphone">${express.telphone }</span>
		</div>
		<div style="margin-left: 40px;margin-top: 15px;">
			<span id="gongsi"></span><br>
		</div>
		<div style="margin-left: 10px;margin-top: 15px;">
			<span style="" id="province">${province }</span>
			<span style="margin-left: 30px;" id="city">${city }</span>
			<span style="margin-left: 20px;" id="area"></span>
		</div>
		<div style="margin-top: 12px;">
			<span style="" id="xiangxi">${xiangxi }</span>
		</div><br>
		<div style="margin-top: 8px;">
			<span style="">电子元器件</span>
		</div>
		<br>
		<div style="margin-left: -20px;margin-top: 50px;">
			<span style="">张小茹</span>
			<span style=""><fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" /></span>
		</div>
	</div>
	<div style="margin-left: 100px;margin-top: 20px;float: left;">
		<div style="margin-left: 20px;margin-top: 6px;">
			<span style="margin-left: 120px;">广东省</span>
			<span style="margin-left: 10px;"id="mudi">${province }</span>
			<br>
			<span style="margin-left: 120px;">深圳市</span>
			<span style="margin-left: 10px;"id="mudicity">${city }</span>
		</div>
	</div>
</div>
<div id="aa" style="margin-top: 40px;margin-left: 30px;background:url(<%=contextPath%>/img/suer.png);width: 860px;height: 485px;">
	<div style="margin-left: 60px;margin-top: 80px;float: left;">
		<span style="margin-left: 20px;">张小茹</span>
		<span style="margin-left: 95px;">0755-82720040</span>
		<div style="margin-left: 10px;margin-top: 10px;">
			<div style="margin-left: 15px;"><span>在芯间电子查询网</span></div>
			<div style="margin-left: -18px;margin-top: 15px;">
				<span style="margin-left: 30px;">广东省深圳市福田区华强北街道华强广场C座23j</span>
			</div>
		</div>
		<div style="margin-left: 10px;margin-top: 17px;">
			<span style="margin-left: 10px;" id="name1">${express.name }</span><span id="up1" style="color: red;">修改</span><span id="qu1" style="color: red;">确定</span>
			<span style="margin-left: 120px;" id="telphone1">${express.telphone }</span><span id="up6" style="color: red;">修改</span><span id="qu6" style="color: red;">确定</span>
		</div>
		<div style="margin-left: 40px;margin-top: 10px;">
			<span id="gongsi1"></span><span id="up0" style="color: red;">修改</span><span id="qu0" style="color: red;">确定</span><br>
		</div>
		<div style="margin-left: 10px;margin-top: 12px;">
			<span style="" id="province1">${province }</span><span id="up3" style="color: red;">修改</span><span id="qu3" style="color: red;">确定</span>
			<span style="margin-left: 30px;" id="city1">${city }</span><span id="up4" style="color: red;">修改</span><span id="qu4" style="color: red;">确定</span>
			<span style="margin-left: 20px;" id="area1"></span><span id="up8" style="color: red;">修改</span><span id="qu8" style="color: red;">确定</span>
		</div>
		<div style="margin-top: 12px;">
			<span style="" id="xiangxi1">${xiangxi }</span><span id="up5" style="color: red;">修改</span><span id="qu5" style="color: red;">确定</span>
		</div><br>
		<div style="margin-top: 8px;">
			<span style="">电子元器件</span>
		</div>
		<br>
		<div style="margin-left: -20px;margin-top: 50px;">
			<span style="">张小茹</span>
			<span style=""><fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" /></span>
		</div>
	</div>
	<div style="margin-left: 100px;margin-top: 20px;float: left;">
		<div style="margin-left: 20px;margin-top: 6px;">
			<span style="margin-left: 120px;">广东省</span>
			<span style="margin-left: 10px;" id="mudi1">${province }</span><span id="up2" style="color: red;">修改</span><span id="qu2" style="color: red;">确定</span>
			<br>
			<span style="margin-left: 120px;">深圳市</span>
			<span style="margin-left: 10px;" id="mudicity1">${city }</span><span id="up7" style="color: red;">修改</span><span id="qu7" style="color: red;">确定</span>
		</div>
	</div>
</div>
<p style="clear:both;"></p>
<input id="biuuu_button" type="button" value="打印"></input>  
<script type="text/javascript" src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.PrintArea.js"></script>
<script>
$("#up0").on("click", function(){
	var u1=$("#gongsi1").html();
	$("#gongsi1").html("<input text='type' style='width:80px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu0').style.display = '';
	document.getElementById('up0').style.display = 'none';
});
$("#qu0").on("click", function(){
	var y2=$("#nameu").val();
	$("#gongsi1").html(y2);;
	document.getElementById('up0').style.display = '';
	document.getElementById('qu0').style.display = 'none';
});
$("#up1").on("click", function(){
	var u1=$("#name1").html();
	$("#name1").html("<input text='type' style='width:60px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu1').style.display = '';
	document.getElementById('up1').style.display = 'none';
});
$("#qu1").on("click", function(){
	var y2=$("#nameu").val();
	$("#name1").html(y2);;
	document.getElementById('up1').style.display = '';
	document.getElementById('qu1').style.display = 'none';
});
$("#up2").on("click", function(){
	var u1=$("#mudi1").html();
	$("#mudi1").html("<input text='type' style='width:60px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu2').style.display = '';
	document.getElementById('up2').style.display = 'none';
});
$("#qu2").on("click", function(){
	var y2=$("#nameu").val();
	$("#mudi1").html(y2);;
	document.getElementById('up2').style.display = '';
	document.getElementById('qu2').style.display = 'none';
});
$("#up3").on("click", function(){
	var u1=$("#province1").html();
	$("#province1").html("<input text='type' style='width:120px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu3').style.display = '';
	document.getElementById('up3').style.display = 'none';
});
$("#qu3").on("click", function(){
	var y2=$("#nameu").val();
	$("#province1").html(y2);;
	document.getElementById('up3').style.display = '';
	document.getElementById('qu3').style.display = 'none';
});
$("#up4").on("click", function(){
	var u1=$("#city1").html();
	$("#city1").html("<input text='type' style='width:120px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu4').style.display = '';
	document.getElementById('up4').style.display = 'none';
});
$("#qu4").on("click", function(){
	var y2=$("#nameu").val();
	$("#city1").html(y2);;
	document.getElementById('up4').style.display = '';
	document.getElementById('qu4').style.display = 'none';
});
$("#up5").on("click", function(){
	var u1=$("#xiangxi1").html();
	$("#xiangxi1").html("<input text='type' style='width:280px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu5').style.display = '';
	document.getElementById('up5').style.display = 'none';
});
$("#qu5").on("click", function(){
	var y2=$("#nameu").val();
	$("#xiangxi1").html(y2);;
	document.getElementById('up5').style.display = '';
	document.getElementById('qu5').style.display = 'none';
});
$("#up6").on("click", function(){
	var u1=$("#telphone1").html();
	$("#telphone1").html("<input text='type' style='width:120px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu6').style.display = '';
	document.getElementById('up6').style.display = 'none';
});
$("#qu6").on("click", function(){
	var y2=$("#nameu").val();
	$("#telphone1").html(y2);;
	document.getElementById('up6').style.display = '';
	document.getElementById('qu6').style.display = 'none';
});
$("#up7").on("click", function(){
	var u1=$("#mudicity1").html();
	$("#mudicity1").html("<input text='type' style='width:60px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu7').style.display = '';
	document.getElementById('up7').style.display = 'none';
});
$("#qu7").on("click", function(){
	var y2=$("#nameu").val();
	$("#mudicity1").html(y2);;
	document.getElementById('up7').style.display = '';
	document.getElementById('qu7').style.display = 'none';
});
$("#up8").on("click", function(){
	var u1=$("#area1").html();
	$("#area1").html("<input text='type' style='width:80px; ' id='nameu' value='"+u1+"'>");
	document.getElementById('qu8').style.display = '';
	document.getElementById('up8').style.display = 'none';
});
$("#qu8").on("click", function(){
	var y2=$("#nameu").val();
	$("#area1").html(y2);;
	document.getElementById('up8').style.display = '';
	document.getElementById('qu8').style.display = 'none';
});
$(function(){
	document.getElementById('myPrintArea').style.display = 'none';
	document.getElementById('qu1').style.display = 'none';
	document.getElementById('qu2').style.display = 'none';
	document.getElementById('qu3').style.display = 'none';
	document.getElementById('qu4').style.display = 'none';
	document.getElementById('qu5').style.display = 'none';
	document.getElementById('qu6').style.display = 'none';
	document.getElementById('qu7').style.display = 'none';
	document.getElementById('qu8').style.display = 'none';
	document.getElementById('qu0').style.display = 'none';
    
});
$(document).ready(function(){  
  $("input#biuuu_button").click(function(){  
	$("#name").html($("#name1").html());
	$("#mudi").html($("#mudi1").html());
	$("#province").html($("#province1").html()); 
	$("#city").html($("#city1").html()); 
	$("#xiangxi").html($("#xiangxi1").html()); 
	$("#telphone").html($("#telphone1").html());
	$("#mudicity").html($("#mudicity1").html());
	$("#gongsi").html($("#gongsi1").html());
	$("#area").html($("#area1").html());
	if (confirm("是否打印")==true){ 
		$("div#myPrintArea").printArea();
		$.post("kuaididayinjilv?printrecord_eid=${express.express}&printrecord_kuaidi=速尔快&printrecord_expressorder=${express.ordernumber}",
	        function(data){
				
			}
		)
	}
    
  
});  
});  
   
</script> 
</body>
</html>