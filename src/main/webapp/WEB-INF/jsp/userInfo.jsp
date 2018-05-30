<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>

<html>
	<body>
		<div class="page-container">
			<!--<p>总共登录次数：18次 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 上次登录时间：2014-6-14 11:19:55</p>-->
			<table class="table table-border table-bordered table-bg" id="userinfo">
				<!-- <thead>
					<tr>
						<th colspan="3" scope="col">&nbsp;</th>
					</tr>
				</thead> -->
				<tbody>
					<tr>
						<td width="40%">个人ID</td>
						<td width="50%">${user.u_personalid}</td>
						<c:if test="${user.u_personalid == null}">
							<td>
								<a href="generate">生成ID	</a>
							</td>
						</c:if>
						<c:if test="${user.u_personalid != null}">
						<td></td>
						</c:if>
					</tr>
					<tr>
						<td width="40%">用户昵称:</td>
						<td width="50%" id="nameu">${user.username}</td>
						<td id="username" style= "cursor:pointer;">
							<a href="javascript:;">修改</a>
						</td>
					</tr>
					<tr>
						<td>密码:</td>
						<input type="hidden" id="uid" value="${user.useruid}" />
						<td>********</td>
						<td id="password" style= "cursor:pointer;">
							<a href="javascript:;">修改</a>
						</td>
					</tr>
					<!--<tr>
						<td>公司名称:</td>
						<td>123456</td>
						<td id="company">
							<a href="javascript:;">修改</a>
						</td>
					</tr>-->
					<tr>
						<td>QQ号:</td>
						<td>${user.qq }</td>
						<td id="qq" style= "cursor:pointer;">
							<a href="javascript:;">修改</a>
						</td>
					</tr>
					<tr>
						<td>邮箱:</td>
						<td>${user.mail}</td>
						<td id="mail" style= "cursor:pointer; element:hover{color:#e4393c}">
							<a href="javascript:;">修改</a>
						</td>
					</tr>
					<tr>
						<td>手机:</td>
						<td>${user.telephone}</td>
						<td></td>
					</tr>
					<tr>
						<td>会员星级:</td>
						<td title="会员星级：成交1个订单为'一星用户'；2个为'二星用户'；3~10个订单为'三星用户'；11~50个订单为'四星用户'；50个以上订单为：'五星用户'">
							<div class="clearfix mt-10">
								<!-- background:url(img/iconpic-star-S-default.png) repeat-x 0 0; -->
								<div class="star-bar star-bar-show size-S f-l va-m mr-10" style="width:240px;height:16px;background-size:16px;font-size:0;line-height:0;margin-top: -10px;">
									<c:if test="${star==1 }">
										<span class="star" style="background:url(img/iconpic-star-S.png) repeat-x 0 0;background-size:16px;height:16px;display:inline-block;text-align:center;width: 6.5%;"></span>	
									</c:if>
									<c:if test="${star==2 }">
										<span class="star" style="background:url(img/iconpic-star-S.png) repeat-x 0 0;background-size:16px;height:16px;display:inline-block;text-align:center;width: 13%;"></span>
									</c:if>
									<c:if test="${star>=3 && star<=10}">
										<span class="star" style="background:url(img/iconpic-star-S.png) repeat-x 0 0;background-size:16px;height:16px;display:inline-block;text-align:center;width: 19.5%;"></span>
									</c:if>
									<c:if test="${star>10 && star<=50}">
										<span class="star" style="background:url(img/iconpic-star-S.png) repeat-x 0 0;background-size:16px;height:16px;display:inline-block;text-align:center;width: 26%;"></span>
									</c:if>
									<c:if test="${star>50}">
										<span class="star" style="background:url(img/iconpic-star-S.png) repeat-x 0 0;background-size:16px;height:16px;display:inline-block;text-align:center;width: 32.5%;"></span>
									</c:if>
								</div>
							</div>
						</td>
						<td>
							<!--id="sex" style= "cursor:pointer;" <a href="javascript:;">修改</a> -->
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-border table-bordered table-bg mt-20">
				<thead>
					<tr>
						<th colspan="7" scope="col">信息统计</th>
					</tr>
					<tr class="text-c">
						<th>用户</th>
						<th>评论数</th>
						<th>总搜索次数</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c">
						<td>${user.username}</td>
						<td>${commentCount}</td>
						<td>${user.countsearch}</td>
					</tr>
				</tbody>
			</table>
			<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
				<%@include file="../../../../include/footer.jsp"%>
			</div>
		</div>

			
	</body>
</html>