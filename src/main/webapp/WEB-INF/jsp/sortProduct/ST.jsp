	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
		contentType="text/html; charset=utf-8"%>
	<%@ include file="../../../include/defined.jsp"%>
	<jsp:include page="../../../include/header.jsp" flush="true">
		<jsp:param value="ST" name="header" />
	</jsp:include>
	<script type="text/javascript">
		var x = 0;
		
		//接收选型参数
		var m , n , p,sort_miaoshu;
		$(function(){
			$('.chulishu div').hide();
			$('.sudu div').hide();
			$.ajax({
	            type:"post",
	            url:"queryByrandomOrder",
	            async:true,
	            dataType: "json",
	            success : function(data){
	            	$('#chengjiao').html(data.msg);
	            }
	        });
		});
		$(function(){
			/* var w1 = $('.STM3-1');
			var w2 = $('.STM3-2');
			var w3 = $('.STM3-3');
			var w4 = $('.STM3-4');
			var w5 = $('.STM3-5');
			var w6 = $('.STM3-6');
			var w = [w1,w2,w3,w4,w5,w6]; */
			var c1 = $('.chulishu .STM8');
			var c2 = $('.chulishu .STM8A');
			var c3 = $('.chulishu .Cortex-M0');
			var c4 = $('.chulishu .Cortex-M0+');
			var c5 = $('.chulishu .Cortex-M3');
			var c6 = $('.chulishu .Cortex-M4');
			var c7 = $('.chulishu .Cortex-M4F');
			var c8 = $('.chulishu .Cortex-M7');
			var c = [c1,c2,c3,c4,c5,c6,c7,c8];
			
			var d1 = $('.chulishu .STM8 p');
			var d2 = $('.chulishu .STM8A p');
			var d3 = $('.chulishu .Cortex-M0 p');
			var d4 = $('.chulishu .Cortex-M0+ p');
			var d5 = $('.chulishu .Cortex-M3 p');
			var d6 = $('.chulishu .Cortex-M4 p');
			var d7 = $('.chulishu .Cortex-M4F p');
			var d8 = $('.chulishu .Cortex-M7 p');
			var d = [d1,d2,d3,d4,d5,d6,d7,d8];
			
			var f1 = $('.STM8-1');
			var f2 = $('.STM8-2');
			var f3 = $('.STM8A-1');
			var f4 = $('.STM8A-2');
			var f5 = $('.Cortex-M0-1');
			var f6 = $('.Cortex-M0+-1');
			var f7 = $('.Cortex-M3-1');
			var f8 = $('.Cortex-M3-2');
			var f9 = $('.Cortex-M3-3');
			var f10 = $('.Cortex-M3-4');
			var f11 = $('.Cortex-M3-5');
			var f12 = $('.Cortex-M3-6');
			var f13 = $('.Cortex-M4-1');
			var f14 = $('.Cortex-M4-2');
			var f15 = $('.Cortex-M4-3');
			var f16 = $('.Cortex-M4-4');
			var f17 = $('.Cortex-M4-5');
			var f18 = $('.Cortex-M4-6');
			var f19 = $('.Cortex-M4F-1');
			var f20 = $('.Cortex-M7-1');
			var f = $('.sudu div'); 
			
			$('.pinpai p').click(function(){
				$('.sudu div').hide();
				$('.pinpai p').css({background:'none'});
				$(this).css("background-color", "#C7C7C7");
				var a = $(this).html();
				m = a;
				var b = $('.pinpai p');
				for (var i = 0; i < b.length; i++) {
					if(a == b[i].innerHTML){
						$('.chulishu div').hide();
						if(i == 0){
							c[2].show();
						}
						if(i == 1){
							c[4].show();
						}
						if(i == 2){
							c[6].show();
						}
						if(i == 3){
							c[7].show();
						}
						x = i;
					}
				}
				document.getElementById('span1').innerHTML = '> '+m;
			});
			$('.chulishu p').click(function(){
				$('.chulishu p').css({background:'none'});
				$(this).css("background-color", "#C7C7C7");
				$('.sudu div').hide();
				var e = $(this).html();
				n = e;
				if(x == 0){
					for (var i = 0; i < d3.length; i++) {
						if(e == d3[i].innerHTML){
							if(i == 0){
								f5.show();
							}
						}
					}
				}
				if(x == 1){
					for (var i = 0; i < d5.length; i++) {
						if(e == d5[i].innerHTML){
							if(i == 0){
								f7.show();
							}
							if(i == 1){
								f8.show();
							}
							if(i == 2){
								f9.show();
							}
							if(i == 3){
								f10.show();
							}
							if(i == 4){
								f11.show();
							}
							if(i == 5){
								f12.show();
							}
						}
					}
				}
				/* if(x == 1){
					for (var i = 0; i < d2.length; i++) {
						if(e == d2[i].innerHTML){
							if(i == 0){
								f3.show();
							}
							if(i == 1){
								f4.show();
							}
						}
					}
				}
				if(x == 2){
					for (var i = 0; i < d3.length; i++) {
						if(e == d3[i].innerHTML){
							if(i == 0){
								f5.show();
							}
						}
					}
				}
				if(x == 3){
					for (var i = 0; i < d4.length; i++) {
						if(e == d4[i].innerHTML){
							if(i == 0){
								f6.show();
							}
						}
					}
				}
				if(x == 4){
					for (var i = 0; i < d5.length; i++) {
						if(e == d5[i].innerHTML){
							if(i == 0){
								f7.show();
							}
							if(i == 1){
								f8.show();
							}
							if(i == 2){
								f9.show();
							}
							if(i == 3){
								f10.show();
							}
							if(i == 4){
								f11.show();
							}
							if(i == 5){
								f12.show();
							}
						}
					}
				}
				if(x == 5){
					for (var i = 0; i < d6.length; i++) {
						if(e == d6[i].innerHTML){
							if(i == 0){
								f13.show();
							}
							if(i == 1){
								f14.show();
							}
							if(i == 2){
								f15.show();
							}
							if(i == 3){
								f16.show();
							}
							if(i == 4){
								f17.show();
							}
							if(i == 5){
								f18.show();
							}
						}
					}
				}
				if(x == 6){
					for (var i = 0; i < d7.length; i++) {
						if(e == d7[i].innerHTML){
							if(i == 0){
								f19.show();
							}
						}
					}
				} */
				if(x == 2){
					for (var i = 0; i < d7.length; i++) {
						if(e == d7[i].innerHTML){
							if(i == 0){
								f19.show();
							}
						}
					}
				}
				if(x == 3){
					for (var i = 0; i < d8.length; i++) {
						if(e == d8[i].innerHTML){
							if(i == 0){
								f20.show();
							}
						}
					}
				}
				document.getElementById('span2').innerHTML = '> '+n;
			});
			$('.sudu p').click(function(){
				$('.sudu p').css({background:'none'});
				$(this).css("background-color", "#C7C7C7");
				var a = $(this).html();
				p = a;
				sort_miaoshu = 'ST'+','+m+','+n+','+p;
				window.location.href='sortList?sort_miaoshu='+sort_miaoshu+'&m='+m+'&n='+n+'&p='+p;
				document.getElementById('span3').innerHTML = '> '+p;
			});
			
		});
		
	</script>
	<body >
		<p style="padding-top: 10px;padding-left: 10px;font-size: 15px;font-weight: bold;">
			当前位置   : 选型指导 	> ST  
			<c:if test="${m != null}">
				<span >> ${m}</span> <span >> ${n}</span> <span >> ${p}</span>
			</c:if>
			<c:if test="${m == null}">
				<span id="span1"></span> <span id="span2"></span> <span id="span3"></span>
			</c:if>
			
		</p>
		<p style="padding-top: 10px;padding-left: 10px;font-size: 15px;font-weight: bold;">
				符合条件的记录数 : ${total}
		</p>
		<div class="div1" style="background-color: ;margin-top: 30px;" >
			<table id="table1" cellpadding="0" cellspacing="10" style="text-align: center;width: 1200px;"  >
				<tr class="Cortex-M3tr1" style="background-color: #C7C7C7">
					<td>类别</td>
					<td>品牌</td>
					<td>核心处理数</td>
					<td>速度</td>
					<td>程序储存容量</td>
				</tr>
				
				<tr class="Cortex-M3tr2">
					<td>
						<div>
							<p>
								单片机/处理器/DSP/FPGA
							</p>
						</div>
					</td>
					<td >
						<div>
							<p>
								ST
							</p>
						</div>
					</td>
					<td class="pinpai">
						<div>
							<!-- <a href="javascript:void(0)">
								<p>STM8</p>
							</a>
							<a href="javascript:void(0)">
								<p>STM8A</p>
							</a>
							<a href="javascript:void(0)">
								<p>Cortex-M0+</p>
							</a> -->
							<a href="javascript:void(0)">
								<p>Cortex-M0</p>
							</a>
							<a href="javascript:void(0)">
								<p>Cortex-M3</p>
							</a>
							<!-- <a href="javascript:void(0)">
								<p>Cortex-M4</p>
							</a> -->
							<a href="javascript:void(0)">
								<p>Cortex-M4F</p>
							</a>
							
							<a href="javascript:void(0)">
								<p>Cortex-M7</p>
							</a>
						</div>
					</td>
					<td class="chulishu">
						<div class="STM8">
							<a href="javascript:void(0)">
								<p >16M</p>
							</a>
							<a href="javascript:void(0)">
								<p >24M</p>
							</a>
						</div>
						<div class="STM8A">
							<a href="javascript:void(0)">
								<p >16M</p>
							</a>
							<a href="javascript:void(0)">
								<p >24M</p>
							</a>
						</div>
						<div class="Cortex-M0">
							<a  href="javascript:void(0)">
								<p >48M</p>
							</a>
						</div>
						<div class="Cortex-M0+">
							<a  href="javascript:void(0)">
								<p >32M</p>	
							</a>
						</div>
						<div class="Cortex-M3">
							<a href="javascript:void(0)">
								<p >24M</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32M</p>	
							</a>
							<a  href="javascript:void(0)">
								<p >36M</p>
							</a>
							<a  href="javascript:void(0)">
								<p >48M</p>
							</a>
							<a  href="javascript:void(0)">
								<p  >72M</p>
							</a>
							<a  href="javascript:void(0)">
								<p >120M</p>
							</a>
						</div>
						<div class="Cortex-M4">
							<a href="javascript:void(0)">
								<p >72M</p>
							</a>
							<a  href="javascript:void(0)">
								<p >80M</p>	
							</a>
							<a  href="javascript:void(0)">
								<p >84M</p>
							</a>
							<a  href="javascript:void(0)">
								<p >100M</p>
							</a>
							<a  href="javascript:void(0)">
								<p  >168M</p>
							</a>
							<a  href="javascript:void(0)">
								<p >180M</p>
							</a>
						</div>
						<div class="Cortex-M4F">
							<a href="javascript:void(0)">
								<p >72M</p>
							</a>
						</div>
						<div class="Cortex-M7">
							<a href="javascript:void(0)">
								<p >216M</p>
							</a>
						</div>
					</td>
					<td class="sudu">
						<div class="STM8-1">
							<a href="javascript:void(0)">
								<p >2KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >4KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >8KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
						</div>
						<div class="STM8-2">
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
						</div>
						<div class="STM8A-1">
							<a href="javascript:void(0)">
								<p >2KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >4KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >8KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
						</div>
						<div class="STM8A-2">
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
						</div>
						<div class="Cortex-M0-1">
							<a href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
						</div>
						<div class="Cortex-M0+-1">
							<a href="javascript:void(0)">
								<p >8KB</p>
							</a>
							<a href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >192KB</p>
							</a>
						</div>
						<div class="Cortex-M3-1">
							<a href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >384KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
						</div>
						<div class="Cortex-M3-2">
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >384KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
						</div>
						<div class="Cortex-M3-3">
							<a  href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >384KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >768KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
						</div>
						<div class="Cortex-M3-4">
							<a  href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
						</div>
						<div class="Cortex-M3-5">
							<a  href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >384KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >768KB</p>
							</a>
						</div>
						<div class="Cortex-M3-6">
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >768KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
						</div>
						<div class="Cortex-M4-1">
							<a href="javascript:void(0)">
								<p >16KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >32KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >384KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
						</div>
						<div class="Cortex-M4-2">
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
						</div>
						<div class="Cortex-M4-3">
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >384KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
						</div>
						<div class="Cortex-M4-4">
							<a  href="javascript:void(0)">
								<p >64KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >128KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1.5M</p>
							</a>
						</div>
						<div class="Cortex-M4-5">
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >2048KB</p>
							</a>
						</div>
						<div class="Cortex-M4-6">
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >2048KB</p>
							</a>
						</div>
						<div class="Cortex-M4F-1">
							<a  href="javascript:void(0)">
								<p >256KB</p>
							</a>
						</div>
						<div class="Cortex-M7-1">
							<a  href="javascript:void(0)">
								<p >512KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >1024KB</p>
							</a>
							<a  href="javascript:void(0)">
								<p >2048KB</p>
							</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div style="width: 100%;margin-top: 30px">
	       	当前第 <span style="font-weight:bold">${page }</span> 页 / 共 <span style="font-weight:bold">${count}</span> 页&nbsp;&nbsp; 共 <span style="font-weight:bold">${total}</span> 条记录&nbsp;&nbsp;
	       	<button class="button1" style="width: 40px;font-size: 13px;height: 20px" onclick = "first()">首页</button>&nbsp;
	       	<c:if test="${count > 1}">
	       		<button class="button1" style="width: 50px;font-size: 13px;height: 20px" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
	       		<button class="button2"  onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
	       		<button class="button2"  onclick = "san()" <c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
	       		<button class="button2"  onclick = "si()" <c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
	       	</c:if>
	       	<button class="button1" style="width: 50px;font-size: 13px;height: 20px" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
	       	<button class="button1" style="width: 40px;font-size: 13px;height: 20px" onclick = "end()">尾页</button>
	       	<input style="margin-left: 300px" type="text" id="sort_product" value="${sort_product}" /><input style="width: 60px;height: 25px" type="button" id="sousuo" class="button1" value="搜索" />
	    	</div>
		<div class="div2" >
			<table id="table2" class="table2" cellpadding="2" cellspacing="2" border="1px">
				<tr style="background-color: #C7C7C7;font-weight: bold;">
					<td style="width: 40px">序号</td>
					<td style="width: 150px">型号</td>
					<td style="width: 120px;">描述</td>
					<td style="width: 50px">封装</td>
					<td style="width: 200px">连接性</td>
					<td style="width: 180px">外设</td>
					<td style="width: 40px">IO</td>
					<td style="width: 70px">RAM</td>
					<td style="width: 150px">数据转换</td>
					<td style="width: 70px">电压</td>
					<td>温度</td>
				</tr>
			</table>
			<table id="table3" cellpadding="2" cellspacing="2" border="1px" >
				<c:forEach items="${sortList}" var="sortList" varStatus="status">
					<tr class="zxc">
						<td style="width: 40px;font-weight: bold;">${status.count}</td>
						<td style="width: 150px;">
							<a style="color: blue;" title="${sortList.sort_product}" href="javascript:window.open('search?keyword=${sortList.sort_product}&amp;value=product&amp;page=1')">
								${sortList.sort_product}
							</a>
						</td>
						<td style="width: 120px;">${sortList.sort_miaoshu}</td>
						<td style="width: 50px">${sortList.sort_encapsulation}</td>
						<td style="width: 200px">${sortList.sort_lianjie}</td>
						<td style="width: 180px">${sortList.sort_waishe}</td>
						<td style="width: 40px">${sortList.sort_io}</td>
						<td style="width: 70px">${sortList.sort_ram}</td>
						<td style="width: 150px">${sortList.sort_shujuzhuanhuan}</td>
						<td style="width: 70px">${sortList.sort_dianya}</td>
						<td >${sortList.sort_wendu}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="margin-top: -100px">
			<%@ include file="../../../include/footer.jsp"%>
		</div>
		
		<script type="text/javascript">
			$(function(){
				window.onscroll=function(){
					var bodyTop = document.body.scrollTop;
					var dxTop = $(".table2").offset().top;
					var dxTop2 = $("#table3").offset().top;
					var sumTop = dxTop - bodyTop;
					var sumTop2 = dxTop2 - bodyTop;
					if(sumTop <= 30){
						$('.table2').css({
                            'position':'fixed',
                            'top':'0px'
                        });
					}
					if(sumTop2 >= 30){
						$(".table2").css("position","");
					}
				}
			});
			
			$(function () {
				
				$('#sousuo').click(function(){
					var sort_product = document.getElementById('sort_product').value;
					window.location.href="sortList?sort_miaoshu=${sort_miaoshu}&sort_product="+sort_product;
				});
				
			    var tr = $("#table3 tr");  
			    tr.mouseover(function () {  
			        $(this).children("td").css("background-color", "#AEF2E5");  
			    }).mouseout(function () {  
			        $(this).children("td").css("background-color", "#FFFFFF");  
			    }); 
			    
			    window.onbeforeunload = function(){
				    var scrollPos;    
				    if (typeof window.pageYOffset != 'undefined') {
				        scrollPos = window.pageYOffset;
				    }
				    else if (typeof document.compatMode != 'undefined' &&
				        document.compatMode != 'BackCompat') {
				        scrollPos = document.documentElement.scrollTop;
				    }
				    else if (typeof document.body != 'undefined') {
				        scrollPos = document.body.scrollTop;
				    }
				    document.cookie="scrollTop="+scrollPos; //存储滚动条位置到cookies中
				}

				window.onload = function()
				{ 
				    if(document.cookie.match(/scrollTop=([^;]+)(;|$)/)!=null){
				        var arr=document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
				        document.documentElement.scrollTop=parseInt(arr[1]);
				        document.body.scrollTop=parseInt(arr[1]);
				    }
				}
			});
			
		</script>
		<script type="text/javascript">
			function first(){
				window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${1}&&rows=${pageSize}';
			}
			function end(){
				window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${count == 0 ? 1:count}&&rows=${pageSize}';
			}
			function er(){
				var page=${page+1 };
				var count=${count };
				if(page > count){
					return false;
				}else{
					window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${page+1}&&rows=${pageSize }';
				}
			}
			function san(){
				var page=${page+2 };
				var count=${count };
				if(parseInt(page) > parseInt(count)){
					return false;
				}else{
					window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${page+2}&&rows=${pageSize }';
				}
			}
			function si(){
				var page=${page+3 };
				var count=${count };
				if(parseInt(page) > parseInt(count)){
					return false;
				}else{
					window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${page+3}&&rows=${pageSize }';
				}
			}
			function previous(){
				var page=${page == 1};
				if(page){
					return false;
				}else{
					window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${page-1}&&rows=${pageSize }';
				}
			}
			function next(){
				var page=${count <= page};
				if(page){
					return false;
				}else{
					window.location.href='sortList?sort_miaoshu=${sort_miaoshu}&&page=${page+1}&&rows=${pageSize }';
				}
			}
		</script>
		<script type="text/javascript">
		$(function(){
			
			var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;
			
			$('.jiantou').html("<img src='logo/down.png'>");
			var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;
			$head.click(function(e){
				e.stopPropagation();
				if(!inter){
					$('.jiantou').html("<img style='margin-top:-7px;position:absolute;' src='logo/up.png'>");
					$ul.show();
				}else{
					$('.jiantou').html("<img src='logo/down.png'>");
					$ul.hide();
				}
				inter=!inter;
			});
			
			$ul.click(function(event){
				event.stopPropagation();
			});
			
			$(document).click(function(){
				$ul.hide();
				inter=!inter;
			});
	
			$lis.hover(function(){
				var primary = $(this).find('.primary').html();
				var s = '';
				$.ajax({
					  url:"indexSeleSecond",
					  type:"POST",
					  data:{
						  primary_name:primary
					  },
					  contentType:"application/x-www-form-urlencoded; charset=utf-8",
					  dataType:"json",
					  success: function(data){
						  for(var o in data) {
								if(o % 2 != 0){
									s+=("<span><em><a style='margin-left:90px' href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span></br>");
								}else{
									s+=("<span><em><a href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span>");
								}
							}
							$('.prosmore').html('');
							$('.prosmore').html(s);
					  }
					});
				if(!$(this).hasClass('nochild')){
					$(this).addClass("prosahover");
					$(this).find(".prosmore").removeClass('hide');
				}
			},function(){
				if(!$(this).hasClass('nochild')){
					if($(this).hasClass("prosahover")){
						$(this).removeClass("prosahover");
					}
					$(this).find(".prosmore").addClass('hide');
				}
			});
			
		});
	</script>
	</body>
</html>