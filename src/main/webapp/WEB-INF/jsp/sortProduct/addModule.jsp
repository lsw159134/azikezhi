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
			#freetable input{
				height: 30px;
				width: 100px;
				border: 1px solid;
			}
			#zidongtable{ 
			   border:#00ffff solid 2px; 
			   border-collapse:collapse;
			   margin-bottom: 200px;
			   position: absolute;
			} 
			#zidongtable td{ 
			   border:#8080ff solid 2px; 
			   padding:10px; 
			} 
		</style>
	</head>

	<body class="container-fluid" style="margin-top: 20px;">
		<div class="row">
			<div class="col-sm-12" style="width: 100%">
				<form id="form" method="post" action="<%=basePath %>1019/zai/xin/jian/module_add" enctype="multipart/form-data" style="width: 500px;margin-left: 200px;margin-top: 50px;">
					<div class="row">
						<div class="col-md-6" >
							<div class="input-group">
								<div class="input-group-addon">产品</div>
								<input type="text" class="form-control" placeholder="产品"
									id="product" name="product" required />
							</div>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-md-6" >
							<div class="input-group">
								<div class="input-group-addon">产品描述</div>
								<input type="text" class="form-control" style="width: 418px"
									id="product_miaoshu" name="product_miaoshu" />
							</div>
						</div>
					</div>
					<br/>
					
					<div class="row">
						<div class="col-md-6" >
							<div class="input-group">
								<div class="input-group-addon">库存</div>
								<input type="text" id="isgoodsinstock" name="isgoodsinstock" class="form-control" required="required" placeholder="请输入产品数量">
							</div>
						</div>
						<div class="col-md-6" >
							<div class="input-group">
								<div class="input-group-addon">图片</div>
									<input type="file" name="files" class="form-control" id='file'>
									<input style="margin-left: 30px;position: absolute;margin-top: 10px;width: 40px;color: red" type="button" value="预览"  onclick="c()"  />
							</div>
							
							 <div style="margin-left:250px;position: absolute;" >
								<img  id='show'>
							</div>
							
						</div>
					</div>
					<br />
					
					<div class="row">
						<div class="col-md-6" >
							<div class="input-group">
								<div class="input-group-addon">一级分类</div>
								<select id="product_primary" name="product_primary" class="form-control">
									<option value="0">分类选择</option>
								</select>
							</div>
						</div>
						<div class="col-md-6"  id="quanx" >
							<div class="input-group">
								<div class="input-group-addon">二级分类</div>
								<div id="xiala">
									<select id="product_second" name="product_second" class="form-control">
										<option value="0">分类选择</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<table cellpadding="0" cellspacing="0"  style="border-collapse:collapse;width: 400px;height: 200px;border:1px #D2B48C solid;text-align: center;margin-bottom: 50px">
						<tr style="background-color: #D2B48C;font-weight: bold;">
							<td style="width: 400px;height: 40px;border: 1px #D2B48C solid;text-align: center;" colspan="4">价格区间</td>
						</tr>
						<tr style="background-color: #8B8970;font-weight: bold;">
							<td style="width: 300px;height: 40px;border: 1px #D2B48C solid;text-align: center;" colspan="3">数量</td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;">价格</td>
						</tr>
						<tr>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input type="number" style="border: 2px #436EEE solid;width: 50px;height: 30px;text-align: center;" id="min1" name="min1" value="1" readonly></td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;">~</td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input onblur="id1()" style="border: 2px #436EEE solid;width: 70px;height: 30px;text-align: center;" required  type="number" id="max1" name="max1" placeholder="结束数量"></td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input type="text" style="border: 2px #436EEE solid;width: 50px;height: 30px;text-align: center;" required  id="price1" name="price1" placeholder="价格"></td>						
						</tr>
						<tr>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input type="number" style="border: 2px #436EEE solid;width: 50px;height: 30px;text-align: center;" id="min2" name="min2" readonly></td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;">~</td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input onblur="id2()" style="border: 2px #436EEE solid;width: 70px;height: 30px;text-align: center;" required type="number" id="max2" name="max2" placeholder="结束数量"></td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input type="text" style="border: 2px #436EEE solid;width: 50px;height: 30px;text-align: center;" required  id="price2" name="price2" placeholder="价格"></td>						
						</tr>
						<tr>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input type="number" style="border: 2px #436EEE solid;width: 50px;height: 30px;text-align: center;" id="min3" name="min3" readonly></td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;">~</td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;">以上</td>
							<td style="width: 100px;height: 40px;border: 1px #D2B48C solid;text-align: center;"><input type="text" style="border: 2px #436EEE solid;width: 50px;height: 30px;text-align: center;" required  id="price3" name="price3" placeholder="价格"></td>						
						</tr>
					</table>
					
					<textarea name="document" style="border: 1px solid;margin-left: 500px;margin-top: -200px;position: absolute;"></textarea>
					<!-- <div id="freetable" style="margin-left: 500px;position: absolute;margin-top: -200px">
						<input type="text" name="row1" placeholder="行"/> 
						 <input type="text" name="cols1" placeholder="列"/> 
						 <input type="button" value="创建表格" onclick="createTable()"/><br/> 
						 <input type="text" name="delrow1"/> 
						 <input type="button" value="删除行" onclick="delRow()"/><br/> 
						   
						 <input type="text" name="delcols1"/> 
						 <input type="button" value="删除列" onclick="delCols()"/><br> 
					</div>
					 
					 <div id="div1"></div> -->
					 
					<div >
						<button style="position:fixed; left:100px;top:100px;z-index:999;" type="submit" class="btn btn-default">提交</button>
						<!-- <button style="position:fixed; left:100px;top:200px;z-index:999;" type="button" class="btn btn-default" onclick="tabletijiao()">提交表格</button> -->
					</div>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			$.post("queryPrimaryProductAll",
				function(data){
					for(var o in data) {
						 $("#product_primary").append('<option value="'+data[o].primary_id+'">'+data[o].primary_name+'</option>');
					}
				}
		   	) 
		})
		$("#product_primary").change(function(){
			$("#product_second").html("<option value='0'>分类选择</option>");
			var id=$("#product_primary").val();
			 $.post("querySecondAll?id="+id,
				function(data){
					for(var o in data) {
						 $("#product_second").append('<option value="'+data[o].second_id+'">'+data[o].second_name+'</option>');
					}
		    
				}
		   	)
		})
		
		function id1() {
			var pid=document.getElementById("max1").value;
			var min1=document.getElementById("min1").value;
			if(parseInt(min1)>=parseInt(pid)){
				$("#max1").val("");
				$("#min2").val("");
				alert("请输入大于"+min1+"的数");
			}else{
				$("#min2").val(parseInt(pid)+1);
			}
		   
		}
		function id2() {
			var min2=document.getElementById("min2").value;
			var pid=document.getElementById("max2").value;
			if(parseInt(min2)>=parseInt(pid)){
				$("#max2").val("");
				alert("请输入大于"+min2+"的数");
			}else{
				$("#min3").val(parseInt(pid)+1);
			}
		}
		
		function c () {
			var r= new FileReader();
			f=document.getElementById('file').files[0];
			r.readAsDataURL(f);
			var img = document.getElementById('show');
			document.getElementById('show').style.height = '200px';
			document.getElementById('show').style.width = '200px';
			r.onload=function  (e) {
				img.src = this.result;
			};
		}
	
	</script>
	<script type="text/javascript"> 
		  /* var tableNode; 
		  function createTable(){ 
			  tableNode=document.createElement("table");//获得对象 
			  tableNode.setAttribute("id","zidongtable");
			  var row=parseInt(document.getElementsByName("row1")[0].value);//获得行号 
			   //alert(row); 
			   if(row<=0 || isNaN(row) ){ 
				    alert("输入的行号错误，不能创建表格，请重新输入："); 
				    return; 
			   } 
			   var cols=parseInt(document.getElementsByName("cols1")[0].value);
			   if(isNaN(cols) || cols<=0){ 
			   alert("输入的列号错误，不能创建表格，请重新输入："); 
			   return; 
			   } 
			   //上面确定了 现在开始创建 
			   for(var x=0;x<row;x++){ 
			      var trNode=tableNode.insertRow(); 
			      for(var y=0;y<cols;y++){ 
				      var tdNode=trNode.insertCell(); 
				      tdNode.innerHTML="<textarea></textarea>"; 
			      } 
			   } 
			   document.getElementById("div1").appendChild(tableNode);//添加到哪个位置 
		  } 
		  function delRow(){ 
		   //要删除行，必须得到table对象才能删除，所以在创建的时候必须要设置table对象的 id 方便操作 
		   var tab=document.getElementById("zidongtable");//获得table对象 
		   if(tab==null){ 
		    alert("删除的表不存在！") 
		    return; 
		   } 
		   var rows=parseInt(document.getElementsByName("delrow1")[0].value);//获得要删除的对象 
		   if(isNaN(rows)){ 
		    alert("输入的行不正确。请输入要删除的行。。。"); 
		    return; 
		   } 
		   if (rows >= 1 && rows <= tab.rows.length) { 
		    tab.deleteRow(rows-1); 
		    }else{ 
		     alert("删除的行不存在！！"); 
		     return ; 
		    } 
		     
		  } 
		  //删除列要麻烦些， 要通过行来进行删除 
		  // 一行的cells的长度就是列的个数 
		  //tab.rows[x].deleteCell(cols-1) 
		  function delCols(){ 
		   //获得table对象 
		   var tab=document.getElementById("zidongtable"); 
		     
		   if(tab==null){ 
		    alert("删除的表不存在！！"); 
		    return ; 
		   } 
		   //获得文本框里面的内容 
		   var cols=parseInt(document.getElementsByName("delcols1")[0].value); 
		   //检查是否可靠 
		   if(isNaN(cols)){ 
		    alert("输入不正确。请输入要输出的列。。"); 
		    return; 
		   } 
		   if(!(cols>=1 && cols<=tab.rows[0].cells.length)){ 
		    alert("您要删除的列不存在！！"); 
		    return; 
		   } 
		   for(var x=0;x<tab.rows.length;x++){//所有的行 
		    tab.rows[x].deleteCell(cols-1); 
		   } 
		  }
		  function tabletijiao(){
			  var product = document
			  var array = new Array();  
			  var aa = $('#zidongtable tr');
			  var bb = $('textarea');
			  for (var i = 0; i < bb.length; i++) {
				  array[i] = bb[i].value;
			  }
			  $.ajax({  
			    type : 'POST',  
			    url: path + '/check/testPost',  
			    contentType : "application/json" ,
			    data : JSON.stringify(array), 
			    success : function(data) {  
					
			    }  
			});
		  } */
	</script>
</html>
