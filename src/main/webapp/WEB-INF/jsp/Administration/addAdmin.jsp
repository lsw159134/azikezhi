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
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-validate.min.js"></script>
	<style type="text/css">
		a:hover{ text-decoration: none} 
	</style>
</head>

<body class="container-fluid" style="margin-top: 20px;">
	<div class="row">
		<div class="col-sm-12" style="width: 100%">
			<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/addAdmin" enctype="multipart/form-data" style="width: 500px;margin-left: 200px;margin-top: 50px;">
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">账号</div>
							<input type="text" class="form-control" placeholder="账号"
								id="admin_adminAccountNumber" onblur="yanzhen();" name="admin_adminAccountNumber" required />
						</div>
					</div>
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">密码</div>
							<input type="password" class="form-control" placeholder="密码"
								id="admin_adminpassword" value="" name="admin_adminpassword" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-6" >
						<div class="input-group">
							<div class="input-group-addon">管理员名称</div>
							<input type="text" class="form-control" placeholder="管理员名称"
								id="admin_adminName" name="admin_adminName" required />
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-12" >
						<div class="input-group">
							<div class="input-group-addon">权限</div>
							<table>
								<tr>
									<td><input type="checkbox" name="admin_shrio" value="m" />购物车</td>
									<td><input type="checkbox" name="admin_shrio" value="a" />在线购产品管理</td>
									<td><input type="checkbox" name="admin_shrio" value="b" />分类</td>
									<td><input type="checkbox" name="admin_shrio" value="c" />订单管理</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="admin_shrio" value="d" />提现管理</td>
									<td><input type="checkbox" name="admin_shrio" value="e" />供应商管理</td>
									<td><input type="checkbox" name="admin_shrio" value="f" />供应商产品</td>
									<td><input type="checkbox" name="admin_shrio" value="g" />被动供应商</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="admin_shrio" value="i" />用户管理</td>
									<td><input type="checkbox" name="admin_shrio" value="j" />询/报价管理</td>
									<td><input type="checkbox" name="admin_shrio" value="k" />留言</td>
									<td><input type="checkbox" name="admin_shrio" value="l" />缺货型号</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="admin_shrio" value="n" />关闭登录ip限制</td>
									<td><input type="checkbox" name="admin_shrio" value="o" />产品删除</td>
									<td><input type="checkbox" name="admin_shrio" value="p" />供应商备注</td>
									<td><input type="checkbox" name="admin_shrio" value="h" />设置在线购用户</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="admin_shrio" value="ab" />贴片电阻管理</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-default">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function (){
	document.getElementById('quanx').style.display = 'none';
});
function id1() {
	var admin_jurisdiction=document.getElementById("admin_jurisdiction").value;
	if(admin_jurisdiction==2){
		document.getElementById('quanx').style.display = 'block'
		document.getElementById('duoxuan').style.display = 'none'
		document.getElementById('xiala').style.display = 'block'
		document.getElementById('admin_status').length = 0;
		var sel = document.getElementById("admin_status");
		var option2 = new Option("产品权限","");
		var option = new Option( "产品添加","1");
		var option1 = new Option("产品修改和删除", "2");
		sel.options.add(option2); 
	    sel.options.add(option); 
	    sel.options.add(option1); 
	}else if(admin_jurisdiction==3){
		document.getElementById('quanx').style.display = 'block'
		document.getElementById('duoxuan').style.display = 'none'
		document.getElementById('xiala').style.display = 'block'
		document.getElementById('admin_status').length = 0;
		var sel = document.getElementById("admin_status");
		var option3 = new Option( "订单权限","");
		var option = new Option( "订单信息查看与操作","1");
		var option1 = new Option("收货信息查看与操作", "2");
		sel.options.add(option3);
	    sel.options.add(option); 
	    sel.options.add(option1);
	}else if(admin_jurisdiction==7){
		document.getElementById('quanx').style.display = 'block';
		document.getElementById('xiala').style.display = 'none';
		document.getElementById('duoxuan').style.display = 'block'
	}
}
function chk(){ 
	var obj=document.getElementsByName('admin_status'); //选择所有name="'test'"的对象，返回数组 
	//取到对象数组后，我们来循环检测它是不是被选中 
	var s=''; 
	for(var i=0; i<obj.length; i++){ 
	if(obj[i].checked) s+=obj[i].value+','; //如果选中，将value添加到变量s中 
	} 
	//那么现在来检测s的值就知道选中的复选框的值了 
	alert(s==''?'你还没有选择任何内容！':s); 
} 
function yanzhen(){
	var name=document.getElementById('admin_adminAccountNumber').value
	$.post("ByAccount?name="+name,
        function(data){
			if(data.result=="fail"){
				layer.alert("账号已有，请重新输入！", {icon : 5})
				$("#admin_adminAccountNumber").val("");
			}else if(data.result=="seccuss"){
			}
		}
   	)
}
</script>
</html>
