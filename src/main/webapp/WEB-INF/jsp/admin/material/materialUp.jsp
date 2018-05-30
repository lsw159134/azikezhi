<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<script type="text/javascript" charset="utf-8" src="<%=contextPath %>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=contextPath %>/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=contextPath %>/ueditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
    div{
        width:100%;
    }
</style>
</head>
<body><br>
<div style="margin-left: 60px;">
	标题：<input type="text" name="biaoti" id="biaoti" value="${material.material_name }" style="width: 300px;height: 27px;"><br><br>
	标签：<input type="text" name="biaoqian" id="biaoqian" value="${material.material_label }" style="width: 700px;height: 27px;">
	<button onclick="getContent()" style="float:right;margin-right: 240px;">提交文章</button>
</div>
<p style="clear:both;"></p>
<div>
    <script id="editor" type="text/plain" style="width:1024px;height:300px;margin-left: 60px;"></script>
</div>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" defer="defer">
	$(function(){
		var editor = UE.getEditor('editor');        
		var content ='${material.material_content}';       
		setUeditorContext(content);
		function setUeditorContext(context){
			editor.addListener("ready", function () {
				editor.setContent(context);            
			});                   
		}
		var content=editor.getContent();    
	});
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');

	function getContent() {
		var id='${material.material_id}';
		var s=UE.getEditor('editor').getContent();
		var biaoti=document.getElementById("biaoti").value;
		var biaoqian=document.getElementById("biaoqian").value;
		$.ajax({
			  url:"upMaterialwen",
			  type:"POST",
			  data:{
				  material_content:s,
				  material_name:biaoti,
				  material_label:biaoqian,
				  material_id:id
			  },
			  contentType:"application/x-www-form-urlencoded; charset=utf-8",
			  dataType:"json",
			  success: function(data){
				  if(data.result=='seccuss'){
						window.location.href="queryAllMaterial";
					}else if(data.result=='fail'){
						layer.msg(data.msg);
					}else if(data.result=='login'){
						window.location.href="cont";
					}
			  }
			});
	}
</script>	
</body>
</html>