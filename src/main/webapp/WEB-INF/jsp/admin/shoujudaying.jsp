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
<title>自可知样品采购网</title>
<!-- <style type="text/css">
	.myTb{border-top:1px solid;border-left:1px solid #999;border-spacing:0;}
	.myTb td{border-bottom:1px solid #999;border-right:1px solid #999;}
</style> -->
<style type="text/css">
	.dayintable td{
		border: 1px solid;
	}
	a,address,b,big,blockquote,body,center,cite,code,dd,del,div,dl,dt,em,fieldset,font,form,h1,h2,h3,h4,h5,h6,html,i,iframe,img,ins,label,legend,li,ol,p,pre,small,span,strong,u,ul,var
	{
		font-family : 微软雅黑,宋体;
	}
</style>
</head>
<body>
<div id="myPrintArea" style="margin-left: 30px;">
	<div style="margin-left: 170px;">
		<div style="margin-left: 180px;">
			<div style="margin-left: -35px;font-size: 20px;">自可知-华强北样品采购</div>
			<div style="margin-left: -48px;font-size: 14px;margin-top: 5px;">
				地址:深圳市福田区华强北华强大厦C座23J
				<div style="font-size: 18px;margin-left: 400px;margin-top: -40px;">
					<span style="font-size: 24px;margin-top: -30px;">收据</span>
				</div>
			</div>
		</div>
	</div>	
	<div style="margin-left: 308px;margin-top: 10px;font-size: 13px;">电话：0755-82720040   18902475806</div><br>							
	<div style="margin-left: 32px;font-size: 13px;">
		<span>会员名： <span id="x1">${express.name }</span></span>
		<span style="float: right;">日期：&nbsp;&nbsp;<fmt:formatDate value="${dyshijian }" pattern="yyyy-MM-dd"/></span>
	</div>											
	<div style="margin-left: 32px;font-size: 13px;margin-top: 10px;">电话：<span id="x3">${express.telphone }</span></div>									
	<div style="margin-left: 30px;font-size: 13px;">
		<table style="width: 800px;font-size: 13px;border-collapse:collapse;" border="1" cellpadding="0" cellspacing="0">
			<tr align="center">
				<td width="40px;">ordinal<p style="margin-top: 0px;">序号</p></td>
				<td>Product <p style="margin-top: -3px;">名称/类别</p></td>
				<td width="80px;">Brand
				<p style="margin-top: 0px;">品牌</p></td>
				<td width="80px;">Pkg<p style="margin-top: 0px;">封装</p></td>
				<td width="65px;">unit<p style="margin-top: 0px;">单位</p></td>
				<td width="65px;">LotNumber<p style="margin-top: 0px;">批号</p></td>
				<td width="65px;">Qty<p style="margin-top: 0px;">数量</p></td>
				<td width="65px;">Price<p style="margin-top: 0px;">单价</p></td>
				<td width="65px;">Amount<p style="margin-top: 0px;">金额</p></td>
				<td width="65px;">Remarks<p style="margin-top: 0px;">备注</p></td>
			</tr>
			<tbody id="content">
               	<c:if test="${express.productuid != null}">
               		<tr class="text-c" style="height: 180px;">
                		<td align="center" valign="top" id="d0">1<p id="dd1">2</p><c:if test="${tax !=0}"><p id="uddyn">3</p></c:if></td>
                		<td align="center" valign="top" id="d1"><span class="p1">${express.product}</span><p id="dd2">运费</p><c:if test="${tax !=0}"><p id="uddyname">税额</p></c:if> </td>
                		<td align="center" valign="top" id="d2"><span class="p2">${product.brand.brand_name}</span></td>
               			<td align="center" valign="top" id="d3"><span class="p3">${product.encapsulation}</span></td>
               			<td align="ce	nter" valign="top" id="d4"><span class="p4">片</span><p id="dd3">个</p></td>
               			<td align="center" valign="top" id="d5"><span class="p5">${product.lotnumber}</span></td>
                   		<td align="center" valign="top" id="d6"><span class="p6">${express.expressnumber}</span><span id="dd4">1</span><c:if test="${tax !=0}"><p id="uddynum">1</p></c:if> </td>
                   		<td align="center" valign="top" id="d7"><span class="p7">${express.one}</span><p class="y1"><c:if test="${express.expressname == '申通' }">
								10
							</c:if>
							<c:if test="${express.expressname == '速尔快(广东省内)' }">
								10
							</c:if>
							<c:if test="${express.expressname == '圆通' }">
								10
							</c:if>
							<c:if test="${express.expressname == '顺丰(省内)' }">
								13
							</c:if>
							<c:if test="${express.expressname == '顺丰到付' }">
								0
							</c:if>
							<c:if test="${express.expressname == '自取' }">
								0
							</c:if>
							<c:if test="${express.expressname == '顺丰(省外)' }">
								23
							</c:if></p></td>
                   		<td align="center" valign="top" id="d8">
                   			<span class="p8">
	                   			<c:if test="${express.expressname == '申通' }">
									${express.eprice-10}
								</c:if>
								<c:if test="${express.expressname == '速尔快(广东省内)' }">
									${express.eprice-10}
								</c:if>
								<c:if test="${express.expressname == '圆通' }">
									${express.eprice-10}
								</c:if>
								<c:if test="${express.expressname == '顺丰(省内)' }">
									${express.eprice-13}
								</c:if>
								<c:if test="${express.expressname == '顺丰到付' }">
									${express.eprice}
								</c:if>
								<c:if test="${express.expressname == '自取' }">
									${express.eprice}
								</c:if>
								<c:if test="${express.expressname == '顺丰(省外)' }">
									${express.eprice-23}
								</c:if>
							</span>
							<p class="y2">
								<c:if test="${express.expressname == '申通' }">
									10
								</c:if>
								<c:if test="${express.expressname == '速尔快(广东省内)' }">
									10
								</c:if>
								<c:if test="${express.expressname == '圆通' }">
									10
								</c:if>
								<c:if test="${express.expressname == '顺丰(省内)' }">
									13
								</c:if>
								<c:if test="${express.expressname == '顺丰到付' }">
									0
								</c:if>
								<c:if test="${express.expressname == '自取' }">
									0
								</c:if>
								<c:if test="${express.expressname == '顺丰(省外)' }">
									23
								</c:if>
							</p>
							<c:if test="${tax !=0}">
								<p id="uddyprice">${tax }</p>
							</c:if>
						</td>
                   		<td align="center" rowspan="2" id="d9">${express.beizhu }</td>
               		</tr>
               	</c:if>
               	<c:if test="${express.productuid == null}">
               		<tr align="center" style="height: 180px;">
               			<td  align="center" valign="top" id="o1">
               				<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${status.index +1}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${status.index +1}</p>
               					</c:if>
               					<c:if test="${fn:length(order)==status.index+1}">
               						<c:if test="${kuaidi!=0 }">
	               						<p>${fn:length(order)+1}</p>
               						</c:if>
               						<c:if test="${tax!=0 }">
               							<c:if test="${kuaidi!=0 }">
			               					${fn:length(order)+2}
			               				</c:if>
			               				<c:if test="${kuaidi==0 }">
			               					${fn:length(order)+1}
			               				</c:if>
               						</c:if>
               					</c:if>
               				</c:forEach>
               			</td>
               			<td  align="center" valign="top" >
               				<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.o_product}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.o_product}</p>
               					</c:if>
               					<c:if test="${fn:length(order)==status.index+1}">
	               					<c:if test="${kuaidi!=0 }">
	               						<p>${yunfei }</p>
               						</c:if>
               						<c:if test="${tax!=0 }">
               							<p>税额</p>
               						</c:if>
               					</c:if>
               				</c:forEach>
               			</td>
               			<td  align="center" valign="top">
               				<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.p.brand.brand_name}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.p.brand.brand_name}</p>
               					</c:if>
               				</c:forEach>
               			</td>
               			<td  align="center" valign="top">
               				<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.p.encapsulation}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.p.encapsulation}</p>
               					</c:if>
               				</c:forEach>
               			</td>
               			<td  align="center" valign="top">
               				<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.danwei }
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.danwei }</p>
               					</c:if>
               					<c:if test="${fn:length(order)==status.index+1}">
	               					<c:if test="${kuaidi!=0 }">
	               						<p>${danwei }</p>
               						</c:if>
               					</c:if>
               				</c:forEach>
               			</td>
               			<td align="center" valign="top">
               				<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.p.lotnumber}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.p.lotnumber}</p>
               					</c:if>
               				</c:forEach>
               			</td>
                   		<td align="center" valign="top">
                   			<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.o_number}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.o_number}</p>
               					</c:if>
               					<c:if test="${fn:length(order)==status.index+1}">
	               					<c:if test="${kuaidi!=0 }">
	               						<p>1</p>
               						</c:if>
               						<c:if test="${tax!=0 }">
               							<p>1</p>
               						</c:if>
               					</c:if>
               				</c:forEach>
               			</td>
                   		<td align="center" valign="top">
                   			<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.o_one}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.o_one}</p>
               					</c:if>
               					<c:if test="${fn:length(order)==status.index +1}">
	               					<c:if test="${kuaidi!=0 }">
	               						<p>${kuaidi }</p>
               						</c:if>
               					</c:if>
               				</c:forEach>
               			</td>
                   		<td align="center" valign="top">
                   			<c:forEach items="${order }" var="items" varStatus="status">
               					<c:if test="${status.index+1 ==1}">
               						${items.o_price}
               					</c:if>
               					<c:if test="${status.index+1 !=1}">
               						<p>${items.o_price}</p>
               					</c:if>
               					<c:if test="${fn:length(order)==status.index+1}">
               						<c:if test="${kuaidi!=0 }">
	               						<p>${kuaidi }</p>
               						</c:if>
               						<c:if test="${tax!=0 }">
               							<p>${tax }</p>
               						</c:if>
               					</c:if>
               				</c:forEach>
               			</td>
                   		<td width="65px;" align="center">${express.beizhu }</td>
               		</tr>
               	</c:if>
            </tbody>
			<tr>
				<td colspan="10">
					<span style="margin-left: 10px;"> 合计（大写）：</span>
					<span style="margin-left: 60px;" id="daxie"></span>
					<span style="margin-left: 320px;">小写：</span>
					<span style="margin-left: 50px;" id="dyxiaoxie">${total}元</span>
				</td>
			</tr>
		</table>
	</div><br>				
	<div style="margin-left: 40px;margin-top: -13px;">自可知  www.zikezhi.com 专注于华强北样品采购（只做原装正品）	</div>							
</div>
<div class="page-container">
    <div style="margin-left: 170px;">
		<div style="margin-left: 180px;">
			<div style="margin-left: -35px;font-size: 20px;">自可知-华强北样品采购</div>
			<div style="margin-left: -48px;font-size: 13px;margin-top: 5px;">
				地址:深圳市福田区华强北华强大厦C座23J
				<div style="font-size: 18px;margin-left: 400px;margin-top: -40px;">
					<span style="font-size: 24px;margin-top: -30px;">收据</span>
				</div>
			</div>
		</div>
	</div>	
	<div style="margin-left: 308px;margin-top: 10px;font-size: 13px;">电话：0755-82720040   18902475806</div><br>							
	<div style="margin-left: 32px;font-size: 14px;">
		<span>会员名：<span id="u1">${express.name }</span>&nbsp;&nbsp;<span id="uu1" style="color: red;">修改</span><span id="qu1" style="color: red;">确认</span></span>
		<span style="margin-left: 440px;">日期：&nbsp;&nbsp;<fmt:formatDate value="${dyshijian }" pattern="yyyy-MM-dd"/></span>
	</div>									
	<div style="margin-left: 32px;font-size: 13px;margin-top: 10px;">电话：<span id="u3">${express.telphone }</span>&nbsp;&nbsp;<span id="uu3" style="color: red;">修改</span><span id="qu3" style="color: red;">确认</span></div>									
	<div style="margin-left: 30px;font-size: 13px;">
		<table class="dayintable" style="width: 1000px;font-size: 13px;border-collapse:collapse;" border="1" cellpadding="" cellspacing="0">
			<tr align="center">
				<td width="40px;">序号</td>
				<td>Part#<p>名称/类别</p></td>
				<td width="80px;">Brand
				<p>品牌</p></td>
				<td width="80px;">Pkg<p>封装</p></td>
				<td width="65px;">unit<p>单位</p></td>
				<td width="65px;">year<p>批号</p></td>
				<td width="65px;">Qty<p>数量</p></td>
				<td width="65px;">Price<p>单价</p></td>
				<td width="65px;">Amount<p>金额</p></td>
				<td width="65px;">Remarks<p>备注</p></td>
				<td class='td_Oper' width="40px;" colspan="2">
	            	 相关操作
	            </td>
			</tr>
			<tbody>
               	<c:if test="${express.productuid != null}">
               		<tr class="text-c" style="height: 180px;" data-product="${express.product}" 
               			data-manufacturer="${product.brand.brand_name}" data-encapsulation="${product.encapsulation}" 
               			data-lotnumber="${product.lotnumber}" data-expressnumber="${express.expressnumber}"
                		data-one="${express.one}" data-numprice="<c:if test="${express.expressname == '申通' }">10</c:if><c:if test="${express.expressname == '速尔快(广东省内)' }">10</c:if><c:if test="${express.expressname == '圆通' }">10</c:if><c:if test="${express.expressname == '顺丰(省内)' }">13</c:if><c:if test="${express.expressname == '顺丰到付' }">0</c:if><c:if test="${express.expressname == '自取' }">0</c:if><c:if test="${express.expressname == '顺丰(省外)' }">23</c:if>">
                		<td align="center" valign="top" id="t0">1<p id="delete1">2</p><c:if test="${tax !=0}"><p id="uddn1">3</p></c:if> </td>
                		<td align="center" valign="top" id="t1"><span id="p1">${express.product}</span><p id="delete2">运费</p><c:if test="${tax !=0}"><p id="uddname">税额</p></c:if> </td>
                		<td align="center" valign="top" id="t2"><span id="p2">${product.brand.brand_name}</span></td>
               			<td align="center" valign="top" id="t3"><span id="p3">${product.encapsulation}</span></td>
               			<td align="center" valign="top" id="t4"><span id="p4">片</span><p id="delete3">个</p></td>
               			<td align="center" valign="top" id="t5"><span id="p5">${product.lotnumber}</span></td>
                   		<td align="center" valign="top" id="t6"><span id="p6">${express.expressnumber}</span><p id="y1">1</p><c:if test="${tax !=0}"><p id="uddnum">1</p></c:if></td>
                   		<td align="center" valign="top" id="t7"><span id="p7">${express.one}</span>
                   			<p id="y2"><c:if test="${express.expressname == '申通' }">
								10
							</c:if>
							<c:if test="${express.expressname == '速尔快(广东省内)' }">
								10
							</c:if>
							<c:if test="${express.expressname == '圆通' }">
								10
							</c:if>
							<c:if test="${express.expressname == '顺丰(省内)' }">
								13
							</c:if>
							<c:if test="${express.expressname == '顺丰到付' }">
								0
							</c:if>
							<c:if test="${express.expressname == '自取' }">
								0
							</c:if>
							<c:if test="${express.expressname == '顺丰(省外)' }">
								23
							</c:if></p></td>
                   		<td align="center" valign="top" id="t8">
                   			<span id="p8">
	                   			<c:if test="${express.expressname == '申通' }">
	                   				<fmt:formatNumber type="number" value="${express.eprice-10}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
								<c:if test="${express.expressname == '速尔快(广东省内)' }">
									<fmt:formatNumber type="number" value="${express.eprice-10}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
								<c:if test="${express.expressname == '圆通' }">
									<fmt:formatNumber type="number" value="${express.eprice-10}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
								<c:if test="${express.expressname == '顺丰(省内)' }">
									<fmt:formatNumber type="number" value="${express.eprice-13}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
								<c:if test="${express.expressname == '顺丰到付' }">
									<fmt:formatNumber type="number" value="${express.eprice}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
								<c:if test="${express.expressname == '自取' }">
									<fmt:formatNumber type="number" value="${express.eprice}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
								<c:if test="${express.expressname == '顺丰(省外)' }">
									<fmt:formatNumber type="number" value="${express.eprice-23}" pattern="0.00" maxFractionDigits="2"/>
								</c:if>
							</span>
							<p id="y3">
								<c:if test="${express.expressname == '申通' }">
									10
								</c:if>
								<c:if test="${express.expressname == '速尔快(广东省内)' }">
									10
								</c:if>
								<c:if test="${express.expressname == '圆通' }">
									10
								</c:if>
								<c:if test="${express.expressname == '顺丰(省内)' }">
									13
								</c:if>
								<c:if test="${express.expressname == '顺丰到付' }">
									0
								</c:if>
								<c:if test="${express.expressname == '自取' }">
									0
								</c:if>
								<c:if test="${express.expressname == '顺丰(省外)' }">
									23
								</c:if>
							</p>
							<c:if test="${tax !=0}">
							<p id="uddprice">${tax }</p></c:if>
						</td>
                   		<td align="center" rowspan="2" id="t9">${express.beizhu }</td>
                   		<td align="center" valign="top" width="60px;" align="center" id="t10"> <span class="upp">修改</span><p><span class="upk">修改</span> <span class="deletep">删除</span> </p><c:if test="${tax !=0}"><p><span class="udddelete">删除</span></p></c:if></td>
               		</tr>
               	</c:if>
               	<c:if test="${express.productuid == null}">
               		<c:forEach items="${order }" var="items" varStatus="status">
	               		<tr align="center" class="text-c" style="height: 30px;" data-product="${items.o_product}" 
               			data-manufacturer="${items.p.brand.brand_name}" data-encapsulation="${items.p.encapsulation}" 
               			data-lotnumber="${items.p.lotnumber}" data-expressnumber="${items.o_number}"
                		data-one="${items.o_one}" data-danwei="${items.danwei }" data-id="${items.o_id }">
	               			<td  align="center">
	               				${status.index +1}
	               			</td>
	               			<td  align="center" class="o1">
	               				${items.o_product}
	               			</td>
	               			<td  align="center" class="o2">
	               				${items.p.brand.brand_name}
	               			</td>
	               			<td  align="center" class="o3">
	               				${items.p.encapsulation}
	               			</td>
	               			<td  align="center" class="o4">
	               				${items.danwei }
	               			</td>
	               			<td align="center" class="o5">
	               				${items.p.lotnumber}
	               			</td>
	                   		<td align="center" class="o6">
	                   			${items.o_number}
	               			</td>
	                   		<td align="center" class="o7">
	                   			${items.o_one}
	               			</td>
	                   		<td align="center">
	                   			${items.o_price}
	               			</td>
	               			<c:if test="${status.index+1 ==1}">
           						<td style="border-bottom: none" width="120px;" align="center" rowspan="${fn:length(order)}" class="o8" >
           							${express.beizhu }
           						</td>
           					</c:if>
	                   		<td width="60px;"  align="center" class="update">
	                   			修改
	                   		</td>
	                   		<td width="60px;"  align="center" class="ordelte">
	                   			删除
	                   		</td>
	               		</tr>
               		</c:forEach>
               		<c:if test="${kuaidi!=0 }">
               			<tr align="center" class="text-c" style="height: 30px;">
	               			<td  align="center">
	               				${fn:length(order)+1}
	               			</td>
	               			<td  align="center" class="01">
	               				${yunfei }
	               			</td><td></td><td></td>
	               			<td  align="center" class="o4">
	               				${danwei }
	               			</td>
	               			<td></td>
	                   		<td align="center" class="o6">
	                   			1
	               			</td>
	                   		<td align="center" id="yun7">${kuaidi }</td>
	                   		<td align="center" >
	                   			${kuaidi}
	               			</td>
	               			<td style="border-top: none"></td>
	                   		<td  width="60px;"  align="center" >
	                   			<span id="yun">修改</span><span id="yunq">确认</span>
	                   		</td>
	                   		<td width="60px;"  align="center" >
	                   			<span id="deley">删除</span>
	                   		</td>
	               		</tr>
	               	</c:if>
	               	<c:if test="${tax!=0 }">
               			<tr align="center" class="text-c" style="height: 30px;">
	               			<td  align="center">
	               				<c:if test="${kuaidi!=0 }">
	               					${fn:length(order)+2}
	               				</c:if>
	               				<c:if test="${kuaidi==0 }">
	               					${fn:length(order)+1}
	               				</c:if>
	               			</td>
	               			<td  align="center" class="01">
	               				税额
	               			</td><td></td><td></td><td></td>
	               			<td></td>
	                   		<td align="center" class="o6">
	                   			1
	               			</td>
	                   		<td align="center"></td>
	                   		<td align="center" >
	                   			${tax}
	               			</td>
	               			<td style="border-top: none"></td>
	                   		<td width="60px;"  align="center" colspan="2">
	                   			<span id="shuidelte">删除</span>
	                   		</td>
	               		</tr>
	               	</c:if>
               	</c:if>
            </tbody>
			<tr>
				<td colspan="12">
					<span style="margin-left: 10px;"> 合计（大写）：</span>
					<span style="margin-left: 60px;" id="xianshi"></span>
					<span style="margin-left: 260px;">小写：</span>
					<span style="margin-left: 50px;" id="pxiaoxie">${total }元</span>
				</td>
			</tr>
		</table>
	</div><br>				
	<div style="margin-left: 40px;margin-top: -13px;">自可知  www.zikezhi.com 专注于华强北样品采购（只做原装正品）	</div>
</div>

<input id="biuuu_button" type="button" value="打印"></input>  
<script type="text/javascript" src="<%=contextPath%>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/jquery.PrintArea.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript">
$("#shuidelte").on("click", function(){
	var u1=$("#u1").html();
	var u2=$("#u2").html();
	var u3=$("#u3").html();
	window.location.href="adminShoujuorder?name="+u1+"&address="+u2+"&telphone="+u3+"&yunfei=${kuaidi}&tax=0";
});
$(function(){
	var money='${total}';
   	var ChineseStr=xx(money);
    $("#xianshi").html(ChineseStr);
    $("#daxie").html(ChineseStr);
	document.getElementById('myPrintArea').style.display = 'none';
	document.getElementById('qu1').style.display = 'none';
	document.getElementById('qu2').style.display = 'none';
	document.getElementById('qu3').style.display = 'none';
	document.getElementById('yunq').style.display = 'none';
    
});
$("#yun").on("click", function(){
	var u1=$("#yun7").html();
	$("#yun7").html("<input text='type' id='nameu' value='"+u1+"'>");
	document.getElementById('yunq').style.display = '';
	document.getElementById('yun').style.display = 'none';
});
$("#deley").on("click", function(){
	var u1=$("#u1").html();
	var u2=$("#u2").html();
	var u3=$("#u3").html();
	window.location.href="adminShoujuorder?name="+u1+"&address="+u2+"&telphone="+u3+"&yunfei=0&tax=${tax}";
	document.getElementById('yun').style.display = '';
	document.getElementById('yunq').style.display = 'none';
});
$("#yunq").on("click", function(){
	var y2=$("#nameu").val();
	$("#yun7").html(u1);;
	var u1=$("#u1").html();
	var u2=$("#u2").html();
	var u3=$("#u3").html();
	var beizhu='${express.beizhu }';
	window.location.href="adminShoujuorder?name="+u1+"&address="+u2+"&telphone="+u3+"&yunfei="+y2+"&beizhu="+beizhu+"&tax=${tax}";
	document.getElementById('yun').style.display = '';
	document.getElementById('yunq').style.display = 'none';
});
$("table").on("click",".ordelte", function(){
	var id = $(this).parents(".text-c").data("id");
	window.location.href=encodeURI("deleteadminShoujuorder?o_id="+id+"&yunfei=${kuaidi}&tax=${tax}");
});
$("table").on("click",".update", function(){
	var product = $(this).parents(".text-c").data("product");
	var danwei = $(this).parents(".text-c").data("danwei");
    var manufacturer = $(this).parents(".text-c").data("manufacturer");
    var encapsulation = $(this).parents(".text-c").data("encapsulation");
    var lotnumber = $(this).parents(".text-c").data("lotnumber");
    var expressnumber = $(this).parents(".text-c").data("expressnumber");
    var one = $(this).parents(".text-c").data("one");
    var beizhu='${express.beizhu }';
    $(this).html("确定");
    $(this).addClass("stao").removeClass("update");
    $(".update").html("");
    var o1 = $(this).siblings(".o1");
    var pd1 = '<input type="text" style="width: 80px;" id="oup1"  value="'+product+'" class="input-text"/>';
    var o2 = $(this).siblings(".o2");
    var pd2 = '<input type="text" style="width: 80px;" id="oup2" value="'+manufacturer+'" class="input-text"/>';
    var o3 = $(this).siblings(".o3");
    var pd3 = '<input type="text" style="width: 65px;" id="oup3" value="'+encapsulation+'" class="input-text"/>';
    var o4 = $(this).siblings(".o4");
    var pd4 = '<input type="text" style="width: 65px;" id="oup4" value="'+danwei+'" class="input-text"/>';
    var o5 = $(this).siblings(".o5");
    var pd5 = '<input type="text" style="width: 65px;" id="oup5" value="'+lotnumber+'" class="input-text"/>';
    var o6 = $(this).siblings(".o6");
    var pd6 = '<input type="text" style="width: 65px;" id="oup6" value="'+expressnumber+'" class="input-text"/>';
    var o7 = $(this).siblings(".o7");
    var pd7 = '<input type="text" style="width: 65px;" id="oup7" value="'+one+'" class="input-text"/>';
    var o8 = $(this).siblings(".o8");
    var pd8 = '<textarea type="text" style="width: 120px;height: 60px;" id="oup8" class="input-text">'+beizhu+'</textarea >';
    o1.html(pd1);
    o2.html(pd2);
    o3.html(pd3);
    o4.html(pd4);
    o5.html(pd5);
    o6.html(pd6);
    o7.html(pd7);
    o8.html(pd8);
});

$("table").on("click", ".stao", function(){
    var id = $(this).parents(".text-c").data("id");
    var p1=$("#oup1").val();
    var p2=$("#oup2").val();
    var p3=$("#oup3").val();
    var p4=$("#oup4").val();
    var p5=$("#oup5").val();
    var p6=$("#oup6").val();
    var p7=$("#oup7").val();
    var p8=$("#oup8").val();
    if (typeof(p8) == "undefined") { 
    	p8="";
    }  
    var u1=$("#u1").html();
    var u2=$("#u2").html();
    var u3=$("#u3").html();
    $(this).html("修改");
    $(this).removeClass("stao").addClass("update");
    $(".update").html("修改");
    window.location.href=encodeURI("adminShoujuorder?o_id="+id+"&o_one="+p7+"&o_number="+p6+"&o_product="+p1+"&manufacturer="+p2+"&encapsulation="+p3+"&danwei="+p4+"&lotnumber="+p5+"&name="+u1+"&address="+u2+"&telphone="+u3+"&yunfei=${kuaidi}&tax=${tax}"+"&beizhu="+p8);
});

$("table").on("click",".deletep", function(){
	$("#delete1").html("");
	$("#delete2").html("");
	$("#delete3").html("");
	$("#delete4").html("");
	$("#y1").html("");
	$("#y2").html("");
	$("#y3").html("");
	$(".upk").html("");
	$(".deletep").html("");
	$("#uddn1").html("2");
	var p8= $("#p8").html();
	var uddprice= $("#uddprice").html();
	alert(uddprice)
	if(uddprice == null){
		$("#pxiaoxie").html(parseFloat(p8)+"元");
	    var s=xx(parseFloat(p8));
	    $("#xianshi").html(s);
	}else{
		var ss=parseFloat(p8)+parseFloat(uddprice);
	    $("#pxiaoxie").html(ss+"元");
	    var s=xx(ss);
	    $("#xianshi").html(s);
	}
	
});

$("table").on("click",".udddelete", function(){
	$("#uddn1").html("");
	$("#uddname").html("");
	$("#uddnum").html("");
	$("#uddprice").html("");
	$("#uddyprice").html("");
	$("#uddyn").html("");
	$("#uddyname").html("");
	$("#uddynum").html("");
	$(".udddelete").html("");
	var p8= $("#p8").html();
	var y3= $("#y3").html();
	if(y3.length==0 || y3 == null){
		$("#pxiaoxie").html(parseFloat(p8)+"元");
	    var s=xx(parseFloat(p8));
	    $("#xianshi").html(s);
	}else{
		var ss=parseFloat(p8)+parseFloat(y3);
	    $("#pxiaoxie").html(ss+"元");
	    var s=xx(ss);
	    $("#xianshi").html(s);
	}
});

$("table").on("click",".upk", function(){
	var numprice = $(this).parents(".text-c").data("numprice");
    $(this).html("确定");
    $(this).addClass("stak").removeClass("upk");
    var y1 = '<input type="text" style="width: 80px;" id="uy1"  value="1" class="input-text"/>';
    var y2 = '<input type="text" style="width: 80px;" id="uy2" value="'+numprice+'" class="input-text"/>';
    $("#y1").html(y1);
    $("#y2").html(y2);
});
$("table").on("click", ".stak", function(){
    var p1=$("#uy1").val();
    var p2=$("#uy2").val();
    var price=parseFloat(p1)*parseFloat(p2);
    $("#y1").html(p1);
    $("#y2").html(p2);
    $("#y3").html(price.toFixed(2));
    var p8= $("#p8").html();
    $("#pxiaoxie").html(price+parseFloat(p8)+"元");
    var s=xx(price+parseFloat(p8));
    $("#xianshi").html(s);
    $(this).html("修改");
    $(this).removeClass("stak").addClass("upk");
});
$("table").on("click",".upp", function(){
	var product = $(this).parents(".text-c").data("product");
    var manufacturer = $(this).parents(".text-c").data("manufacturer");
    var encapsulation = $(this).parents(".text-c").data("encapsulation");
    var lotnumber = $(this).parents(".text-c").data("lotnumber");
    var expressnumber = $(this).parents(".text-c").data("expressnumber");
    var one = $(this).parents(".text-c").data("one");
    var beizhu='${express.beizhu }';
    $(this).html("确定");
    $(this).addClass("sta").removeClass("upp");
    var pd1 = '<input type="text" style="width: 80px;" id="up1"  value="'+product+'" class="input-text"/>';
    var pd2 = '<input type="text" style="width: 80px;" id="up2" value="'+manufacturer+'" class="input-text"/>';
    var pd3 = '<input type="text" style="width: 65px;" id="up3" value="'+encapsulation+'" class="input-text"/>';
    var pd4 = '<input type="text" style="width: 65px;" id="up4" value="片" class="input-text"/>';
    var pd5 = '<input type="text" style="width: 65px;" id="up5" value="'+lotnumber+'" class="input-text"/>';
    var pd6 = '<input type="text" style="width: 65px;" id="up6" value="'+expressnumber+'" class="input-text"/>';
    var pd7 = '<input type="text" style="width: 65px;" id="up7" value="'+one+'" class="input-text"/>';
    var pd9 = '<textarea type="text" style="width: 120px;height: 60px;" id="up9" class="input-text">'+beizhu+'</textarea >';
    $("#p1").html(pd1);
    $("#p2").html(pd2);
    $("#p3").html(pd3);
    $("#p4").html(pd4);
    $("#p5").html(pd5);
    $("#p6").html(pd6);
    $("#p7").html(pd7);
    $("#t9").html(pd9);
});

$("table").on("click", ".sta", function(){
    var p1=$("#up1").val();
    var p2=$("#up2").val();
    var p3=$("#up3").val();
    var p4=$("#up4").val();
    var p5=$("#up5").val();
    var p6=$("#up6").val();
    var p7=$("#up7").val();
    var p9=$("#up9").val();
    var y2=$("#y3").html();
    var uddprice= $("#uddprice").html();
    var price=parseFloat(p6)*parseFloat(p7);
    $("#p1").html(p1);
    $("#p2").html(p2);
    $("#p3").html(p3);
    $("#p4").html(p4);
    $("#p5").html(p5);
    $("#p6").html(p6);
    $("#p7").html(p7);
    $("#p8").html(price.toFixed(2));
    $("#t9").html(p9);
    if(y2 == null || y2.length == 0){
    	if(uddprice == null || uddprice.length==0 ){
    		$("#pxiaoxie").html(parseFloat(price).toFixed(2)+"元");
       	    var s=xx(price);
       	    $("#xianshi").html(s);
    	}else{
    		var ss=price+parseFloat(uddprice);
        	$("#pxiaoxie").html(ss+"元");
       	    var s=xx(price+parseFloat(uddprice));
       	    $("#xianshi").html(s);
    	}
    }else if(uddprice == null || uddprice.length==0){
		if(y2 == null || y2.length == 0){
			$("#pxiaoxie").html(parseFloat(price).toFixed(2)+"元");
			var s=xx(price);
			$("#xianshi").html(s);
		}else{
			var ss=price+parseFloat(y2);
        	$("#pxiaoxie").html(ss+"元");
       	    var s=xx(price+parseFloat(y2));
       	    $("#xianshi").html(s);
		}
	}else{
		$("#pxiaoxie").html(parseFloat(price).toFixed(2)+"元");
		var s=xx(price);
		$("#xianshi").html(s);
	}
    $(this).html("修改");
    $(this).removeClass("sta").addClass("upp");
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