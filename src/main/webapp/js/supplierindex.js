$(document).ready(function() {

	//---------- Ajax换一批进行评论  -------------
	
	$("#change").on("click", function(){
		$.ajax({
			url: "change",
			type: 'post',
			dataType: "json",
			data: {
			},
			success: function(data) {
				var data = data.supplier;
				$(".newLeft").remove();
				$(".newRirght").remove();
				for(var i = 0; i < data.length; i++){
					if(i % 2 == 0){
						$("#new").after("<div class='newLeft'><a href='searchSupplierResult?id="+data[i].supplieruuid+"'>"+data[i].suppliername+"</a></div>");
					}else{
						$("#new").after("<div class='newRirght'><a href='searchSupplierResult?id="+data[i].supplieruuid+"'>"+data[i].suppliername+"</a></div>");
					}
				}
			}
		});
	});
	//----------- 正则  -------------
	$("p").each(function(){
		var comment = $(this).html();
		$(this).replaceWith(comment);
	});
	//----------- 文字滚动  -------------
	var doscroll = function(){
		var $parent = $("#list");
		var $first = $parent.find(".comments:first");
		console.log($first.height());
		var height = $first.height();
		$first.animate({
			marginTop: -height + 'px'
		}, 500, function(){
			$first.css('marginTop', 0).appendTo($parent);
		});
	};
	
	setInterval(function(){doscroll()}, 3000);
	
});