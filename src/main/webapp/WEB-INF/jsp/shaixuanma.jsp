<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/defined.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../../include/searchHeader.jsp" flush="true">
	<jsp:param value="productSearchResult" name="header" />
</jsp:include>

<!DOCTYPE html>
<html lang="lang=zh-cmn-Hans">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta http-equiv="pragma" content="no-cache" />
	    <meta http-equiv="cache-control" content="no-cache" />
	    <meta http-equiv="expires" content="0" /> 
	    <meta name="format-detection" content="telephone=no" />  
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
	    <meta name="format-detection" content="telephone=no" />
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>自可知-最专业的电子元器件查询平台</title>
		<style type="text/css">
			html{
				font-family: 微软雅黑 ;
			}
			body {
				width: 1200px;
			}
			.product_table {
				border:1px #EEE0E5 solid;
				table-layout:fixed;
				text-align:center;
				width: 1200px;
			}
			.product_table td{
				font-size: 13px ;
				word-wrap:break-word;
				border: 1px #EEE0E5 solid;
			}
			.ulPage{
				margin-top:30px;
				list-style:none;
			}
			p{
				margin: 0 auto;
			}
			.product_miaoshua:hover{
				color: blue;
			}
			.shaixuan a:hover{
				text-decoration: underline;
			}
			.miaoshutd a:hover{
				color: red;
				text-decoration: underline;
			}
		</style>
	</head>
	<body >
		
		<div class="shaixuan" style="background: #F5F5F5;padding:20px 0px 20px 150px;">
			<c:if test="${ manufacturer != null }">
				<p style="margin-left: -130px">
					 您当前的筛选条件 
					<span style="font-weight: bold;"><a href="shaixuanma?keyword=${keyword }&&manufacturer=${manufacturer }"> - (品牌)${manufacturer } </a></span>
				</p>
				<div style="width: 1200px;height: 0;border-bottom: #A1A1A1 1px dashed;margin-left: -150px;margin-bottom: 10px;margin-top: 10px;"></div>
			</c:if>
			<c:if test="${enSize > 0 }">
				<p style="display: inline-block;position: absolute;margin-left: -130px;line-height: 30px;">
					按<封装/规格>选择  : 
				</p>
				<c:forEach items="${encapsulationList }" var="enList" varStatus="status">
					<c:if test="${status.count <= 24 }">
						<p  title="${enList.encapsulation }" style="display: inline-block;width: 170px;line-height: 30px;">
							<a class="endiva" data-encapsulation="${enList.encapsulation }" 
							   href="shaixuanenma?keyword=${keyword }&&manufacturer=${manufacturer}&&encapsulation=${enList.encapsulation}" 
							   style="color: blue;">${enList.encapsulation } (${enList.product_primary })</a>
						</p>
					</c:if>
					<c:if test="${status.count > 24 }">
						<p class="moreEn" title="${enList.encapsulation }" style="display: none;width: 170px;line-height: 30px;">
							<a class="endiva" data-encapsulation="${enList.encapsulation }" 
							   href="shaixuanenma?keyword=${keyword }&&manufacturer=${manufacturer}&&encapsulation=${enList.encapsulation}" 
							   style="color: blue;">${enList.encapsulation } (${enList.product_primary })</a>
						</p>
					</c:if>
				</c:forEach>
				<c:if test="${enSize > 24 }">
					<p>
						<a href="javascript:void(0)" class="moreEnShow">更多<img style="position: absolute;" src="logo/moredown.png"></a>
					</p>
				</c:if>
			</c:if>
			<div style="width: 1200px;height: 0;border-bottom: #A1A1A1 1px dashed;margin-left: -150px;margin-bottom: 10px;margin-top: 10px;"></div>
			<p style="display: inline-block;position: absolute;margin-left: -130px;line-height: 30px;">
				按<品牌/产地>选择  : 
			</p>
			<c:forEach items="${manufacturerList }" var="maList" varStatus="status">
				<p title="${manufacturer }" style="min-width: 160px;line-height: 30px;border: 1px #FFA500 solid;text-align: center;display: inline-block;">
					${manufacturer } (${maList.product_primary })&nbsp;&nbsp;
				</p>
				<a href="search?keyword=${keyword }">
					<img style="position: absolute;margin-top: 2px;" src="logo/clearshaixuan.png">
				</a>
			</c:forEach>
		</div>
			
		<p style="font-weight: bold;font-size: 16px;color: #4B0091">符合条件的所有商品</p>
		<div id="navigationBar" style="z-index: 99999">
			<ul style="width: 1200px;background: #4B0091;" >
				<li style="width: 20px;"></li>
				<li class="exchange" style="width: 220px;color: white;font-size: 16px;text-align: left;margin-left: 20px;"><span style="margin-left: 40px;">供应商</span></li>
				<li class="model" style="width: 220px;color: white;font-size: 16px;">型号</li>		
				<li class="manufacturer" style="width: 125px;color: white;font-size: 16px;">品牌</li>
				<li class="batchNumber" style="width: 100px;color: white;font-size: 16px;">批号</li>
				<li style="width: 125px;color: white;font-size: 16px;" class="encapsulation">封装</li>
				<li style="width: 100px;color: white;font-size: 16px;" class="storehouse">库存</li>
				<li class="appraise" style="width: 145px;color: white;font-size: 16px;">交易说明</li>
				<li  style="margin: 0 0 0 20px;color: white;font-size: 16px;" class="complaint">购买/询价</li>
			</ul>
		</div>
		
		<div style="width: 1200px">
			<c:forEach items="${product}" var="product" varStatus="status">
				<tbody>
					<table class="product_table" style="margin-top: 0px;" cellpadding="0" cellspacing="0">
						<c:if test="${status.count%2==0}">
							<c:if test="${product.supplier==null}">
								<tr class="product_tabletr " style="background: #F5F5F5;text-align: center;height: 80px;">
							</c:if>
							<c:if test="${product.supplier!=null}">
								<tr class="product_tabletr" data-suid="${product.supplieruuid }" style="background: #F5F5F5;height: 50px;text-align: center;padding-top: -20px;">
							</c:if>
						</c:if>
						<c:if test="${status.count%2!=0}">
							<c:if test="${product.supplier==null}">
								<tr class="product_tabletr trcalss" style="text-align: center;height: 80px;">
							</c:if>
							<c:if test="${product.supplier!=null}">
								<tr class="product_tabletr trcalss" style="height: 50px;text-align: center;padding-top: -20px;">
							</c:if>
							
						</c:if>
							<td style="width: 20px;border-right:none;text-align: center;">
								<input 
								name="checkKey3" style="text-align: center;" type="checkbox">
							</td>
							<c:if test="${product.supplier==null}">
								<td style="width: 220px;border-right:none;text-align: left;">
									<p title="正品商城" style="width: 180px;">
										<span style="margin-left: 20px;">正品商城<img style="margin-top: -5px;position: absolute;margin-left: 3px;" src="logo/zhengpin.png" /></span>
									</p>
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" style="width: 220px;border-right:none;text-align: left;">
									<p title="${product.supplier}" style="width: 180px;margin-left: 40px;"  class="supplierpid" data-suid="${product.supplieruuid }">
										${product.supplier}
									</p>
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td style="width: 220px;border-left: none;border-right:none;">
									<c:if test="${not empty product.pimgList}">
										<c:if test="${product.complaintprice>1 }">
											<p style=""><span data-uid="${product.productuuid }" class="tu">${product.product}</span>&nbsp;&nbsp;&nbsp;<img class="jiazaigengduo" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="img/gengduo.png" /></p>
										</c:if>
										<c:if test="${product.complaintprice==1 }">
											${product.product}
										</c:if>
									</c:if>
									<c:if test="${empty product.pimgList}">
										<c:if test="${product.complaintprice>1 }">
											<p>${product.product}&nbsp;&nbsp;&nbsp;<img class="jiazaigengduo" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="img/gengduo.png" /></p>
										</c:if>
										<c:if test="${product.complaintprice==1 }">
											${product.product}
										</c:if>
									</c:if>
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" style="width: 220px;border-left: none;border-right:none;">
									<c:if test="${product.complaintprice>1 }">
										<p style="">${product.product}&nbsp;&nbsp;&nbsp;<img class="jiazaigengduo" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="img/gengduo.png" /></p>
									</c:if>
									<c:if test="${product.complaintprice==1 }">
										${product.product}
									</c:if>
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td style="width: 120px;border-left: none;border-right:none;">
									<c:if test="${product.brand.brand_name==null}">
										${product.manufacturer}
									</c:if>
									${product.brand.brand_name}
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" style="width: 120px;border-left: none;border-right:none;">
									<c:if test="${product.brand.brand_name==null}">
										${product.manufacturer}
									</c:if>
									${product.brand.brand_name}
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td style="width: 100px;border-left: none;border-right:none;">
									<c:if test="${product.complaintprice>1 }">
										<p>${product.lotnumber}</p>
									</c:if>
									<c:if test="${product.complaintprice==1 }">
										${product.lotnumber}
									</c:if>
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" style="width: 100px;border-left: none;border-right:none;">
									<c:if test="${product.complaintprice>1 }">
										<p style="">${product.lotnumber}</p>
									</c:if>
									<c:if test="${product.complaintprice==1 }">
										${product.lotnumber}
									</c:if>
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td style="width: 120px;border-left: none;border-right:none;">
									${product.encapsulation}
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" style="width: 120px;border-left: none;border-right:none;">
									${product.encapsulation}
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td width="120px;" style="border-left: none;border-right:none;">
									<c:if test="${product.supplier ==null}">
										<c:if test="${sessionScope.userName == null }">
											请<a href="javascript:void(0)" class="goLogin">登录</a>查看
										</c:if>
										<c:if test="${sessionScope.userName != null }">
												${product.isgoodsinstock}
										</c:if>
									</c:if>
									<c:if test="${product.supplier !=null}">
										${product.isgoodsinstock}
									</c:if>
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" width="120px;" style="border-left: none;border-right:none;">
									<c:if test="${product.supplier ==null}">
										<c:if test="${sessionScope.userName == null }">
											请<a href="javascript:void(0)" class="goLogin">登录</a>查看
										</c:if>
										<c:if test="${sessionScope.userName != null }">
												${product.isgoodsinstock}
										</c:if>
									</c:if>
									<c:if test="${product.supplier !=null}">
										${product.isgoodsinstock}
									</c:if>
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td class="miaoshutd" style="width: 160px;border-left: none;border-right:none;">
									${product.description}
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" class="miaoshutd" style="width: 160px;border-left: none;border-right:none;">
									${product.description}
								</td>
							</c:if>
							<c:if test="${product.supplier==null}">
								<td style="border-left: none;">
									<%
										if (session.getAttribute("userName") == null) {
									%>
										<p>
											<a style="position: relative;padding:5px 14px;background: #2E2E2E;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;border-right: 1px #e4393c solid;"
											 href="javascript:void(0)" class="goLogin">
	<!-- 购买logo -->										立即购买
											</a>
										</p>
										<p style="margin-top: 6px;">
											<a style="position: relative;padding:5px 8px;background: #5D5D5D;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;"
											href="javascript:void(0)" class="goLogin">
												加入购物车
											</a>
										</p>
									<%
									}else{
									%>
										
										<p>
											<c:if test="${product.isgoodsinstock eq '0'}">
												<a style="position: relative;padding:5px 14px;background: #2E2E2E;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;border-right: 1px #e4393c solid;"
												href="javascript:;" onclick="alert('库存不足,无法购买')">
													立即购买
												</a>
											</c:if>
											<c:if test="${product.isgoodsinstock ne '0'}">
												<a style="position: relative;padding:5px 14px;background: #2E2E2E;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;border-right: 1px #e4393c solid;"
												href="javascript:;" onclick="doSwithTab('${product.productuuid}')">
													立即购买
												</a>
											</c:if>
										</p>
										<p style="margin-top: 6px;">	
											<c:if test="${product.isgoodsinstock eq '0' || product.isgoodsinstock eq '1'}">
												<a style="position: relative;padding:5px 8px;background: #5D5D5D;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;"
												href="javascript:;" onclick="alert('库存不足,无法购买')">
													加入购物车
												</a>
											</c:if>
											<c:if test="${product.isgoodsinstock ne '0' || product.isgoodsinstock ne '1'}">
												<a href="javascript:;" style="position: relative;padding:5px 8px;background: #5D5D5D;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;"
												class="xuanzhe" data-remodal-target="xuanzheli" data-price="${product.price}"  data-uid="${product.productuuid}" data-product="${product.product}">
													加入购物车
												</a>
											</c:if>
											
										</p>
									<%
										}
									%>
								</td>
							</c:if>
							<c:if test="${product.supplier!=null}">
								<td valign="top" style="border-left: none;">
									<p style="margin-top: 6px;">	
										<a href="javascript:void(0)"
												onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq}&site=qq&menu=yes');">
											<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />
										</a>
										<c:if test="${product.supplierlist.qq2 != null && product.supplierlist.qq2 ne '' }">
											<a href="javascript:void(0)"
													onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=${product.supplierlist.qq2}&site=qq&menu=yes');">
												<img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" />
											</a>
										</c:if>
									</p>
									<img class="zan" style="" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="logo/zan.png" /><span class="zz">（${product.evaluate.evaluate_zan }）</span>
									<img class="cai"  style="" data-supplieruid="${product.supplieruuid }" data-pid="${product.productuuid }" src="logo/cai.png" /><span class="cc">（${product.evaluate.evaluate_cai }）</span>
								</td>
							</c:if>
						</tr>
					</table>
				</tbody>
			</c:forEach>
			<ul class="ulPage" style="margin-bottom: 100px;float: right;">
				<li id="page"></li>
			</ul>
		</div>
		<div id="fullbg"></div>  
        <div id="dialog" style="z-index: 9999;">
        	<p style="height: 10px;text-align: center;"></p>
			<p id="datu" style="height: 330px;text-align: center;">
			</p>
         	<div id="xuantu" style="text-align: center;margin-top: 5px;margin-bottom: 5px;">
         	</div>
         	<p style="color:red; text-align: center;margin-top: -10px;">温馨提醒：图片仅供参考，商品以实物为准。
			</p>    
  		</div>
  		<div id="godatuxian"></div>  
        <div id="datuxian" style="z-index: 9999;background-color: #fff; border:1px solid #9D9FA0; height: 240px; position: absolute; width: 350px;border: none;">
  		</div>
		<div id="gofullbg"></div>  
        <div id="godialog" style="z-index: 1000;border-color: #3A006F">  
	         <p class="goclose" style="background: #3A006F"> 
	         	   <span style="font-weight: bold;padding-right: 130px;font-size: 15px;color: white;">
	         	      	我要进入
	         	   </span> 
        	       <a href="javascript:;" onclick="gocloseBg();">
        	           <img src="logo/close.png">
        	       </a>
	         </p>
	         <div style="margin-left: 40px;">
				<button type="button" class="button3" id="gobutton1" style="width: 129px;height: 40px;background-color: #EEEEE0;font-weight: bold;border: none;">
					密码登录
				</button>
				<button type="button" class="button4" id="gobutton2" style="width: 129px;height: 40px;background-color: #EEEEE0;font-weight: bold;margin-left: 60px;border: none;">
					手机验证码登录
				</button>
			</div>
	         <div id="innerDiv1" style="margin-left: 40px;">
				<form action="userLogin" method="post" class="login form" name="submit1" id="submit1">
					<!-- 密码登录  -->
					<div  class="group" style="margin-top: 10px;">
						<div class="group-ipt" >
							<img alt="" src="logo/loginface.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 239px;height: 40px;padding-left: 80px;" type="text" name="telephone" class="ipt" placeholder="手机号码" required>
						</div>
						
						<div class="group-ipt password">
							<img alt="" src="logo/loginmima.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 239px;height: 40px;padding-left: 80px;" type="password" name="password" id="password" class="ipt" placeholder="输入您的登录密码" required>
						</div>
						
						<div class="group-ipt verify" >
							<img alt="" src="logo/loginyzm.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 139px;height: 40px;padding-left: 80px;" type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
							<img src="kaptcha.jpg" class="imgcode" style="position: absolute;height:40px;border:1px gray solid;width:97px;">
						</div>
						
						<div class="button" style="margin-top: 20px;">
							<button type="submit" class="button3" style="height: 40px;width: 199px;font-size: 15px;font-weight: bold;background: #3A006F">
								登录
							</button>
							
						</div>
						<div style="margin-top: 20px;font-weight: bold;font-size: 18px;margin-bottom: 30px;">
							<a href="register" style="color: #23A8F6;margin-left: 80px;" class="zhu">没有账号，立即注册</a><br>
							<img src="logo/loginsmile.png">
							<span style="margin-left: 20px;color: #3A006F">自可知——不一样的客户体验</span>
						</div>
					</div>
				</form>
			</div>
			<div id="innerDiv2" style="margin-left: 40px;display: none;">
				<form action="Loginverification" method="post"  class="login form" name="submit2" id="submit2">
					<!-- 手机验证码登录   -->
					<div class="group" style="margin-top: 10px;">
						<div class="group-ipt" >
							<img  src="logo/loginface.png" style="position: absolute;margin-top: 2px;"><input style="width: 239px;height: 40px;padding-left: 80px;" type="text" name="telephone" id="telephonedt" class="ipt" placeholder="手机号码" required>
						</div>
						
						<div class="group-ipt verify" >
							<img  src="logo/loginyzm.png" style="position: absolute;margin-top: 2px;">
							<input style="width: 139px;height: 40px;padding-left: 80px;" type="text" name="verify" id="verifydt" class="verifydt" placeholder="输入验证码" required>
							<img src="kaptcha.jpg" class="imgcodedt" style="height:40px;border:1px #606c88 solid;width: 97px;position: absolute;">
						</div>
						
						<div class="group-ipt yanzhen">
							<img  src="logo/loginmessage.png" style="position: absolute;margin-top: 2px;">
							<input type="text" placeholder="短信验证码" id="yanzhen" name="yanzhen" class="ipt" style="width: 239px;height: 40px;padding-left: 80px;" onfocus="clearErro();" required>
  	   	     	   	    	<input type="button" id="hsbtn" value="获取验证码" onclick="time(hsbtn)" style="width: 97px;background:#CBE9CF;position: absolute;height: 40px;margin-top: 2px;margin-left: -98px;" />
						</div>
						
						<div class="button" style="margin-top: 20px;">
							<button type="submit" class="button3"  style="height: 40px;width: 199px;font-size: 15px;font-weight: bold;background: #3A006F">
								登录
							</button>
						</div>
						<div style="margin-top: 20px;font-weight: bold;font-size: 18px;margin-bottom: 30px;">
							<a href="register" style="color: #23A8F6;margin-left: 80px;" class="zhu">没有账号，立即注册</a><br>
							<img src="logo/loginsmile.png">
							<span style="margin-left: 20px;color: #3A006F">自可知——不一样的客户体验</span>
						</div>
					</div>
				</form>
			</div>
  		</div>
		<form action="pay" method="post" id="payForm">
			<input type="hidden" name="productuid" id="productuid">
			<input type="hidden" name="number" id="number">
			<input type="hidden" name="fapiao" id="fapiao">
			<input type="hidden" name="expressname" id="expressname">
		</form>
		
		<div class="float_qq" style="top: 280px;">
			<ul>
				<li class="float_qq1">
					<a href="#">
						<img width="24" height="24" src="logo/indextop.png" />
					</a>
				</li>
				<li class="float_qq2" style="left: 0px;">
					<a title="点击在线客服" href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
						<img width="24" height="24" src="logo/indexQQ.png" />在线客服
					</a>
				</li>
				<li class="float_qq3" style="left: 0px;">
					<a href="javascript:void(0)" title="拨打客服热线">
						<img width="24" height="24" src="logo/indextel.png">0755-82720040
					</a>
				</li>
				<li class="float_qq4"  style="left: 0px;background: #7A6E6E">
					<a href="//shang.qq.com/wpa/qunwpa?idkey=fa106a5105e98a0e3f34ed1bf45b9a6af2f9670b6c570ff57e8cb4f559a0fc4a">
						<img width="24" height="24" src="logo/indexqqun.png">337260650
					</a>
				</li>
				<!-- <li class="float_qq4"  style="left: 0px;">
					<a href="//shang.qq.com/wpa/qunwpa?idkey=e33dbf5666b6dd8a8a3bbe9d5420917613490e4ec21c30cd0c43a26e6a06459e" title="点击可加群">
						<img width="24" height="24" src="logo/indexqqun.png" />129896199		
					</a>
				</li>
				<li class="float_qq5">
					<a title="扫码加微信" href="javascript:void(0)">
						<img width="24" height="24" src="logo/indexweixin.png" />				
					</a>
					<div class="float_shwx" style="display: none;">
						<img width="188" height="188" alt="微信" src="img/img/webchat.png" />				
					</div>            
				</li> -->
			</ul>
		</div>
	<script type="text/javascript">
	$('.zhu').hover(function(){
		$(this).css('color','red');			
	},function(){
		$(this).css('color','#23A8F6');	
	});
	function ziliao(name){
		window.open("ziliao?name="+encodeURIComponent(name));
	}
	function doSwithTab(pid){
		$("#expressname").val("2");
    	$("#fapiao").val("1");
    	$("#number").val("1");
    	$("#productuid").val(pid);
    	document.getElementById('payForm').submit();
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	}
		$(document).ready(function(){
			$("#keyword").val('${param.keyword}')
		});
	
		var a;
		var p_uid = "";
		var p_price = 0;
		var p_product = "";
		var expressname;
		
		$(function () {
			$("#page").paging({
				total: ${pageSize},
				showPage: 10,
				currentPage: ${page},
	            animation: false,
	            centerBgColor: "#fff",
	            centerFontColor: "#000",
	            centerBorder: "1px solid #ddd",
	            transition: "all .2s",
	            centerHoverBgColor: "#25dd3d",
	            centerHoverBorder: "1px solid #25dd3d",
	            centerFontHoverColor: "#fff",
	            otherFontHoverColor: "#fff",
	            otherBorder: "1px solid #ddd",
	            otherHoverBorder: "1px solid #25dd3d",
	            otherBgColor: "#fff",
	            otherHoverBgColor: "#25dd3d",
	            currentFontColor: "#fff",
	            currentBgColor: "#f79898",
	            currentBorder: "1px solid #f79898",
	            fontSize: 13,
	            currentFontSize: 13,
	            cormer: 2,
	            gapWidth: 3,
	            showJump: false,
	            jumpBgColor: "#fff",
	            jumpFontHoverColor: "#fff",
		        jumpHoverBgColor: "#25dd3d",
	            jumpBorder: "1px solid #ddd",
	            jumpHoverBorder: "1px solid #25dd3d",
	            simpleType: 1,
	            idParameter: 'page',
	            submitStyle: 'href',
				url: '<%=basePath%>search?keyword=${keyword}&product_second=${product_second}&value=product&manufacturer=${manufacturer}&encapsulation=${encapsulation}'
			});
		});
		    
	    $(function () {  
	    	var td = $(".table1 td");  
		    td.mouseover(function () {  
		        $(this).css("background-color", "#AEF2E5");  
		    }).mouseout(function () {  
		        $(this).css("background-color", "#FFFFFF");  
		    });
		});
		$(function () {  
	    	var tr = $(".product_tabletr");  
	    	tr.mouseover(function () {  
		        $(this).css("background-color", "#AEF2E5");
		        $(this).find('.product_tabletr table').css("background-color", "#AEF2E5");
		    }).mouseout(function () {  
		        $(this).css("background-color", "#FFFFFF");
		        $(this).find('.product_tabletr table').css("background-color", "#AEF2E5");
		    });
		});
		$(document).on('click', '.xuanzhe', function () {
			p_uid = $(this).data("uid");
			 $.post("addCart?pid="+p_uid,
	           function(data){
					if(data.result=="fail"){
						swal({
							title: "系统提示",
							text: data.errorMsg,
							type: "success",
							confirmButtonColor: "#007AFF"
						});
					}else if(data.result=="seccuss"){
						window.location.href="cartback?pid="+p_uid;
					}
				}
		   	)
		});
		
		$(document).on('click', '.zan', function () {
			var suid = $(this).data("supplieruid");
			var pid = $(this).data("pid");
			var t=$(this).parents("span");
			 $.post("inZan?evaluate_pid="+pid,
	           function(data){
					if(data.result=="login"){
						window.location.href="frontLogin";
					}else if(data.result=="success"){
						$(t).html("（"+data.msg+"）");
					}else if(data.result=="fail"){
						
					}
				}
		   	)
		});
		
		$(document).on('click', '.cai', function () {
			var suid = $(this).data("supplieruid");
			var pid = $(this).data("pid");
			var t=$(this).parents("td").find(".cc");
			 $.post("inCai?evaluate_pid="+pid,
	           function(data){
					if(data.result=="login"){
						window.location.href="frontLogin";
					}else if(data.result=="success"){
						$(t).html("（"+data.msg+"）");
					}else if(data.result=="fail"){
						
					}
				}
		   	)
		});
		
		$("table").on("click",".jiazaigengduo", function(){
			$(this).attr('src','logo/shouqi.png');
			$(this).addClass("sta").removeClass("jiazaigengduo");
			var pid = $(this).data("pid");
			var suid = $(this).data("supplieruid");
			var keyword='${keyword}';
			var table=$(this).parents("table");
			if(suid ===undefined || suid=="" || suid==null){
				$.ajax({
					type: 'POST',
					async : false,
					url: 'seleGengduo',
					data: {
						productuuid:pid,
						product:keyword
					},
					error:function(){
		                alert('请求错误');
		            },
					success:function(data){
						for(var o in data){
							$(table).append('<tr class="product_tabletr trcalss" style="text-align: center;height:80px;">'
									+'<td></td><td style="width: 220px;border-right:none;border-top:none;border-bottom:none;">'
									+'<p title="正品商城" style="width: 180px;"></p></td>'
									+'<td style="width: 220px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+'<c:if test="${not empty '+data[o].pimgList+'}">'
									+'<p title="'+data[o].product+'" style="width: 220px;margin-left: -12px;">'
									+'<span data-uid="'+data[o].productuuid+'" class="tu">'+data[o].product+'</span>'
									+'</p>'
									+'</c:if>'
									+'<c:if test="${empty '+data[o].pimgList+'}">'
									+'<p title="'+data[o].product+'" style="width: 220px;">'
									+'<img style="position: absolute;margin-top: -5px;" src="logo/zhengpin.png" />'
									+data[o].product
									+'	</p>'
									+'</c:if>'
									+'</td>'
									+'<td style="width: 120px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].brand.brand_name
									+'</td>'
									+'<td style="width: 100px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].lotnumber
									+'</td>'
									+'<td style="width: 120px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].encapsulation
									+'</td>'
									+'<td width="120px;" style="border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+'<c:if test="${sessionScope.userName == null }">'
										+'请<a href="javascript:void(0)" class="goLogin">登录</a>查看'
									+'</c:if>'
									+'<c:if test="${sessionScope.userName != null }">'
									+data[o].isgoodsinstock
									+'</c:if>'
									+'</td>'
									+'<td class="miaoshutd" style="width: 160px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+	data[o].description
									+'</td>'
									+'<td style="border-left: none;border-top:none;border-bottom:none;">'
									+'<c:if test="${sessionScope.userName == null }"><p><a style="position: relative;padding:5px 14px;background: #2E2E2E;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;border-right: 1px #e4393c solid;" href="javascript:void(0)" class="goLogin">立即购买</a></p><p style="margin-top: 6px;"><a style="position: relative;padding:5px 8px;background: #5D5D5D;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;" href="javascript:void(0)" class="goLogin">加入购物车</a></p></c:if><c:if test="${sessionScope.userName != null }"><p><c:if test="${'+${data[o].isgoodsinstock+' eq '0'}"><a style="position: relative;padding:5px 14px;background: #2E2E2E;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;border-right: 1px #e4393c solid;" href="javascript:;" onclick="alert(&quot;库存不足,无法购买&quot;)">立即购买 </a> </c:if> <c:if test="${'+${data[o].isgoodsinstock+' ne '0'}"> <a style="position: relative;padding:5px 14px;background: #2E2E2E;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;border-right: 1px #e4393c solid;" href="javascript:;" onclick="doSwithTab(&quot;'+data[o].productuuid+'&quot;)"> 立即购买 </a> </c:if> </p> <p style="margin-top: 6px;"> <c:if test="${'+data[o].isgoodsinstock+' eq '0' || '+data[o].isgoodsinstock+' eq '1'}"> <a style="position: relative;padding:5px 8px;background: #5D5D5D;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;" href="javascript:;" onclick="alert(&quot;库存不足,无法购买&quot;)"> 加入购物车 </a> </c:if> <c:if test="${'+${data[o].isgoodsinstock+' ne '0' || '+${data[o].isgoodsinstock+' ne '1'}"> <a href="javascript:;" style="position: relative;padding:5px 8px;background: #5D5D5D;color: #fff;height: 25px;line-height: 25px;vertical-align: middle;" class="xuanzhe" data-remodal-target="xuanzheli" data-price="'+data[o].price+'"  data-uid="'+data[o].productuuid+'" data-product="'+data[o].product+'"> 加入购物车 </a> </c:if> </p> </c:if>'
								+'</td>');
						}						
					}
		        })
			}else{
				$.ajax({
					type: 'POST',
					async : false,
					url: 'seleGengduoBysuid',
					data: {
						productuuid:pid,
						product:keyword,
						supplieruuid:suid
					},
					error:function(){
		                alert('请求错误');
		            },
					success:function(data){
						for(var o in data){
							$(table).append('<tr class="product_tabletr trcalss" style="text-align: center;height:50px;">'
									+'<td></td><td style="width: 220px;border-right:none;border-top:none;border-bottom:none;">'
									+'<p title="" style="width: 180px;"></p></td>'
									+'<td style="width: 220px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+'<p title="'+data[o].product+'" style="width: 220px;margin-left: -12px;">'
									+data[o].product
									+'	</p>'
									+'</td>'
									+'<td style="width: 120px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].manufacturer
									+'</td>'
									+'<td style="width: 100px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].lotnumber
									+'</td>'
									+'<td style="width: 120px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].encapsulation
									+'</td>'
									+'<td width="120px;" style="border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+data[o].isgoodsinstock
									+'</td>'
									+'<td class="miaoshutd" style="width: 160px;border-left: none;border-right:none;border-top:none;border-bottom:none;">'
									+	data[o].description
									+'</td>'
									+'<td valign="top" style="border-left: none;border-top:none;border-bottom:none;"><p style="margin-top: 6px;"><a href="javascript:void(0)" onclick="javascript:window.open(&quot;http://wpa.qq.com/msgrd?v=3&uin='+data[o].supplierlist.qq+'&site=qq&menu=yes &quot;);"><img src="logo/indexQQ1.png" style="width: 23px; height: 23px;" /></a></p><img class="zan" style="" data-supplieruid="'+data[o].supplieruuid+'" data-pid="'+data[o].productuuid+'" src="logo/zan.png" /><span class="zz">（'+data[o].evaluate.evaluate_zan+'）</span>&nbsp;&nbsp;<img class="cai"  style="" data-supplieruid="'+data[o].supplieruuid+'" data-pid="'+data[o].productuuid+'" src="logo/cai.png" /><span class="cc">（'+data[o].evaluate.evaluate_cai+'）</span>'
							+'</td>');
						}						
					}
		        })
			}
			
		});
		$("table").on("click", ".sta", function(){
			$(this).parents("table").find("tr:not(:first)").remove();
			$(this).attr('src','img/gengduo.png');
		    $(this).removeClass("sta").addClass("jiazaigengduo");
		});
		var src;
		imagePreview = function () {  
			xOffset = -220;  
			yOffset = 130;  
			$("table").on('mouseover', ".tu", function(e) {
				$("#datu").html("");
	    		$("#xuantu").html("");
				p_uid = $(this).data("uid");
				var $target=$(e.target);
	         	src = $target.attr("src");
	         	var i=0
	         	$.post("queryByPImgandPid?pid="+p_uid,
	       			function(data){
	         			if(data.length!=0){
	         				for(var o in data) {
	           					if(i==0){
	           						i++;
	           						$("#datu").append("<img style='width: 325px;height: 330px;' src='upload/"+data[o].p_imgname+"' />");
	           						$("#xuantu").append('<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;border:1px solid red;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
	           					}else{
	           						$("#xuantu").append('<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
	           					}
	           				}
	           				$("#dialog").css({
	           					"top":(e.clientY + 0 - 0) + "px",
	           		           	"left":"48%"
	           				}).fadeIn("fast"); 
	         			}
	       			}
	       	   	)
				
	        }).on('mouseout', ".tu", function(e) {
	        	$("#datu").html("");
	    		$("#xuantu").html("");
	        	$("#fullbg,#dialog").hide();
	        })
	        $("#dialog").hover(function (e) {
	        	$("#fullbg").css({  
	    	        display: "block"  
	    	    });  
	    	    $("#dialog").show();
				var $target=$(e.target);
	            var i=0
	         	$.post("queryByPImgandPid?pid="+p_uid,
	       			function(data){
	       				for(var o in data) {
	       					if(i==0){
	       						i++;
	       						$("#datu").append("<img src='upload/"+data[o].p_imgname+"'" +"style='height:330px;width:325px;'"+ "/>");
	       						$("#xuantu").append('<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;border:1px solid red;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
	       					}else{
	       						$("#xuantu").append('<img class="huantu" data-img="'+data[o].p_imgname+'" style="width: 30px;height: 30px;" src="upload/'+data[o].p_imgname+'" />&nbsp;&nbsp;&nbsp;');
	       					}
	       				}
	       			}
	       	   	)
			},  
	        function () {
				$("#datu").html("");
				$("#xuantu").html("");
	        	$("#fullbg,#dialog").hide();
			});
		};  
		$(document).ready(function () {  
			imagePreview();
			var suid;
			$(".supplierpid").hover(function (e) {
				$("#godatuxian").css({  
	    	        display: "block"  
	    	    });
				$("#datuxian").css({  
					border:"1px solid #9D9FA0"
	    	    });
				$("#datuxian").html("");
	    	    $("#datuxian").show();
				suid = $(this).data("suid");
				var $target=$(e.target);
				var windowheight = $(window).height();//当前窗口高度
				var docheight = $(document).height();
	         	$.post("seleSupplierXinxi?supplieruuid="+suid,
	       			function(data){
	         			$("#datuxian").append('<div style="border: none;width: 350px;height: 35px;background: #3A006F;color: white;font-size: 20px;"><span style="margin-left: 10px;"><p style="margin-left: 10px;margin-top: -23px;" id="suppliername">'+data.suppliername+'</p></span></div><p style="margin-left: 20px;margin-top: 2px;font-size: 16px;" id="lianxi"><b>联系方式：</b><span>'+data.telphone1+'</span><p style="margin-left: 100px;margin-top: -18px;font-size: 16px;"><span>'+data.telphone2+'</span></p><p style="margin-left: 100px;margin-top: -18px;font-size: 16px;"><span>'+data.telphone3+'</span></p></p><p style="margin-left: 50px;margin-top: 25px;font-size: 16px;width: 320px;word-break:normal; width:auto; display:block; white-space:pre-wrap;word-wrap : break-word ;overflow: hidden ;" id="dizi"><b>地址：</b><span>'+data.supplierposition+'</span></p>');
	         		}
	       	   	)
	         	
	         	if(windowheight-e.clientY>260){
	         		$("#datuxian").css({"left":180,"top":windowheight-20}).fadeIn("fast");
	         	}else{
	         		$("#datuxian").css({"left":180,"top":windowheight-280}).fadeIn("fast");
	         	}
			},  
	        function () { 
				$("#datuxian").html("");
				$("#godatuxian,#datuxian").hide();
			}); 
			$("#datuxian").hover(function (e) {
				$("#godatuxian").css({  
	    	        display: "block"  
	    	    });
				$("#datuxian").css({  
					border:"1px solid #9D9FA0"
	    	    });
				$("#datuxian").show();
				$.post("seleSupplierXinxi?supplieruuid="+suid,
		    		function(data){
						$("#datuxian").html("");
		      			$("#datuxian").append('<div style="border: none;width: 350px;height: 35px;background: #3A006F;color: white;font-size: 20px;"><span style="margin-left: 10px;"><p style="margin-left: 10px;margin-top: -23px;" id="suppliername">'+data.suppliername+'</p></span></div><p style="margin-left: 20px;margin-top: 2px;font-size: 16px;" id="lianxi"><b>联系方式：</b><span>'+data.telphone1+'</span><p style="margin-left: 100px;margin-top: -18px;font-size: 16px;"><span>'+data.telphone2+'</span></p><p style="margin-left: 100px;margin-top: -18px;font-size: 16px;"><span>'+data.telphone3+'</span></p></p><p style="margin-left: 50px;margin-top: 25px;font-size: 16px;width: 320px;word-break:normal; width:auto; display:block; white-space:pre-wrap;word-wrap : break-word ;overflow: hidden ;" id="dizi"><b>地址：</b><span>'+data.supplierposition+'</span></p>');
		      		}
				)
			},  
	        function () {  
				$("#datuxian").html("");
	        	$("#godatuxian,#datuxian").hide();
			});
		});
		$(document).on('click', '.huantu', function () {
			$("#datu").html("");
			var img=$(this).data("img");
			$(".huantu").css("border", "none");
			$(this).css("border", "1px solid red");
			$("#datu").append("<img src='upload/"+img+"'"+"style='height:330px;width:325px;'"+ "/>");
		})
	        function getRealPath(){
               /*  var localObj = window.location;
				var basePath = localObj.protocol + "//" + localObj.host;
                return basePath ; */
				
                var localObj = window.location;
                var contextPath = localObj.pathname.split("/")[1];
				var basePath = localObj.protocol + "//" + localObj.host+ "/"+ contextPath;//   + "/"+ contextPath
                return basePath ;
            }
	        

	        function showBg(pid,product) {
	        	$('#button2').click(function(){
	        		var fankuiText = document.getElementById('fankuiText').value;
	        		if(fankuiText.replace(/[]/g,"").length == 0){
	        			alert("请先填写反馈内容");
	        		}else{
	        			$.post("fankui?productuuid="+pid+"&product="+product+"&fankuitext="+fankuiText,
	            	            function(data){
	            					if(data.result=="success"){
	            						alert(data.msg);
	            						$("#fullbg").hide(); 
	            						$("#dialog").hide(); 
	            						document.getElementById('fankuiText').value = "";
	            					}else if(data.result=="fail"){
	            						alert(data.msg);
	            					}
	            				}
	            		   	)
	        		}
	        		
	        	});
	        	document.getElementById('chanpinbianhao').innerHTML = '${fankuiPid}';
	        	document.getElementById('chanpinxinghao').innerHTML = product;
                $("#fullbg").css({  
                    display: "block"  
                });  
                $("#dialog").show();  
            }  
            //关闭灰色 jQuery 遮罩   
            function closeBg() {  
                $("#fullbg,#dialog").hide();  
            }
            
            //限制反馈字数
            $("#fankuiText").on("input propertychange", function() {  
                var $this = $(this),  
                    _val = $this.val(),  
                    count = "";  
                if (_val.length > 200) {  
                    $this.val(_val.substring(0, 200));  
                }  
                count = 200 - $this.val().length;  
                $("#text-count").text(count);  
            });
	</script>
	<script type="text/javascript">
		$(function(){
			$('.float_qq2').hover(function(){
				
				$(this).animate({"left":"-70px"},350)
				
				},function(){
					
					$(this).animate({"left":"0"},350)
					
					})	
			
			$('.float_qq3').hover(function(){
				
				$(this).animate({"left":"-116px"},350)
				
				},function(){
					
					$(this).animate({"left":"0"},350)
					
					})	
			
			$('.float_qq4').hover(function(){
				
				$(this).animate({"left":"-90px"},350)
				
				},function(){
					
					$(this).animate({"left":"0"},350)
					
					})
			
			
			$('.float_qq5').hover(function(){
				
				$(this).find('.float_shwx').show();
				
				},function(){
					
					$(this).find('.float_shwx').hide();
					
					})
			
			var enflag = false;
			$('.moreEnShow').click(function(){
				if(!enflag){
					$('.moreEn').css('display','inline-block');
					$('.moreEnShow').html("收起"+"<img style='position:absolute' src='logo/moreup.png' >");
				}else{
					$('.moreEn').css('display','none');
					$('.moreEnShow').html("更多"+"<img style='position:absolute' src='logo/moredown.png' >");
				}
				enflag = !enflag;
			});
			
			var maflag = false;
			$('.moreMaShow').click(function(){
				if(!maflag){
					$('.moreMa').css('display','inline-block');
					$('.moreMaShow').html("收起"+"<img style='position:absolute' src='logo/moreup.png' >");
				}else{
					$('.moreMa').css('display','none');
					$('.moreMaShow').html("更多"+"<img style='position:absolute' src='logo/moredown.png' >");
				}
				maflag = !maflag;
			});
			
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
				$.post("indexSeleSecond?primary_name="+primary,
					function(data){
						for(var o in data) {
							if(o % 2 != 0){
								s+=("<span><em><a style='margin-left:90px' href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span></br>");
							}else{
								s+=("<span><em><a href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span>");
							}
							 
							 /* "<span><a href='search?product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></span>" */
						}
						$('.prosmore').html('');
						$('.prosmore').html(s);
					}
			   	)
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
	<script type="text/javascript">
		$(function(){
			$("#submit1").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					$.post("userLogin", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.reload();
						}else{
							alert(d.msg);
						}
					});
				}
			});	
		});
		
	   $('.goLogin').click(function(){
           $("#gofullbg").show;  
           $("#godialog").show();  
      });
      //关闭灰色 jQuery 遮罩   
      function gocloseBg() {  
          $("#gofullbg,#godialog").hide();  
      }
      
      //验证码
      $('.imgcode').hover(function() {
			layer.tips("看不清？点击更换", '.imgcode', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      
      $('.imgcodedt').hover(function() {
			layer.tips("看不清？点击更换", '.imgcodedt', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      $('#gobutton2').click(function(){
    	  $('#innerDiv1').hide();
    	  $('#innerDiv2').show();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
    	  $('#gobutton1').addClass('button4');
    	  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button3');
      });
      $('#gobutton1').click(function(){
    	  $('#innerDiv1').show();
    	  $('#innerDiv2').hide();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
		  $('#gobutton1').addClass('button3');
		  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button4');
      });

		
		$("#telephonedt").on("input propertychange", function() { 
			$("#erro").html("");
			var phone = document.getElementById("telephonedt").value;
			if(!(/^1[34578]\d{9}$/.test(phone))){
		    	return false; 
		    }else{
		    	$.post("1019/zai/xin/jian/queryByPhone?phone="+phone,
			        function(data){
						if(data.result=="fail"){
							$("#telephonedt").val("");
							alert("请先注册该号码");
							window.location.href="register";
						}else if(data.result=="seccuss"){
						}
					}
			   	) 
		    }
		});
		$(document).ready(function() {

			$("#submit2").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					var yan=$("#yanzhen").val();
					if(yan==null||yan==''){
						layer.msg("请输入短信验证码");
						return false;
					}
					$.post("Loginverification", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.reload();
						}else{
							alert(d.msg);
						}
					});
				}
			})
		});
	</script>
	<script type="text/javascript">
	
		var wait = 60;
		function time(btn) {
			var verify = document.getElementById('verifydt').value;
		  	var phone = document.getElementById('telephonedt').value;
		    if(phone == null || phone == "" ){
		    	layer.msg("请输入手机号码");
		        return false; 
		    }else if(!(/^1[34578]\d{9}$/.test(phone))){
		    	layer.msg("手机号码有误，请重填");
		    	return false; 
		    }else if(verify == null || verify == "" ){
		    	layer.msg("请输入图形验证码");
		    	return false; 
		    }else{
			    if (wait == 60) {
			        btn.value = "获取验证码";
			        var phone = $("#telephonedt").val(); 
				    phone = $.trim(phone); 
				    $.post("verification",{'phone':phone,'login':'login'},function(index){ 
				    },"json") 
			        btn.removeAttribute("disabled"); 
			    }else if(wait == 0){
			    	dj(btn);
			    }
			    btn.setAttribute("disabled", true); 
			    btn.value ="("+ wait + ")重新获取"; 
			    wait--; 
			    setTimeout(function () { 
			    	if(wait==0){
			    		dj(btn);
			    		clearTimeout();
			    	}else{
			            time(btn); 	
			    	}
			    },1000)
		    }
		}
		
		function dj(btn){
		    btn.value = "获取验证码";
		    btn.removeAttribute("disabled"); 
		    wait = 60;
		}
		function clearErro(){
			$("#erro").html("");
		}
	</script>
	<script src='js/background.min.js' type="text/javascript"></script>
	<script src="layer/layer.js"></script>
	<script src="js/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript" charset="utf-8"></script>
<%@include file="../../include/footer.jsp"%>
</body>
</html> 
