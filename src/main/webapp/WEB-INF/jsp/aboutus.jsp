<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ include file="../../include/defined.jsp"%>

<jsp:include page="../../include/header.jsp" flush="true">
	<jsp:param value="aboutus" name="header" />
</jsp:include>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?973a46004763863d10483eab2f1ae9b2";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
	<div style="margin-left: 130px;">
		<span id="conarct">
			<span>
				深圳市自可知科技有限公司
			</span>
			<span>
				QQ:
				<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2829795872&amp;site=qq&amp;menu=yes" target="_blank">2829795872</a>
			</span>
			<span>
				邮箱:
				<a href="mailto:ting@zaixinjian.com">ting@zaixinjian.com</a>
			</span>
			<span>QQ交流群:
			<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=e33dbf5666b6dd8a8a3bbe9d5420917613490e4ec21c30cd0c43a26e6a06459e" title="点击可加群">129896199</a>
			</span>
			<span id="aboutus-wechat">
				微信:<img src="img/img/webchat.png"/>
			</span>
			<br />
		</span>
	</div>
	
	
	<%@include file="../../include/footer.jsp"%>
	</body>
	<script type="text/javascript">
		$(function(){
			$('.jiantou').html("<img src='logo/down.png'>");
			 $.ajax({
	            type:"post",
	            url:"queryByrandomOrder",
	            async:true,
	            dataType: "json",
	            success : function(data){
	            	$('#chengjiao').html(data.msg);
	            }
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
</html>