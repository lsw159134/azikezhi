$(document).ready(function() {

	var curIndex = 0, //当前index
		imgLen = $(".imgList li").length; //图片总数

	//定时器自动切图，3秒切一次
	var autoChange = setInterval(function() {
		if(curIndex < imgLen - 1) {
			curIndex++;
		} else {
			curIndex = 0;
		}
		// 调用变换处理函数
		changeTo(curIndex);
	}, 5000);

	//左箭头滑入滑出事件处理
	$("#prev").hover(function() {
		//滑入清除定时器
		clearInterval(autoChange);
	}, function() {
		autoChangeAgain();
	});
	//左箭头点击处理
	$("#prev").click(function() {
		//根据curIndex进行上一个图片处理
		curIndex = (curIndex > 0) ? (--curIndex) : (imgLen - 1);
		changeTo(curIndex);
	});

	//右箭头滑入滑出事件
	$("#next").hover(function() {
		//滑入清除定时器
		clearInterval(autoChange);
	}, function() {
		//滑出则重置定时器
		autoChangAgain();
	});
	//右箭头点击处理
	$("#next").click(function() {
		curIndex = (curIndex < imgLen - 1) ? (++curIndex) : 0;
		changeTo(curIndex);
	});

	//对右下角按钮index进行事件绑定处理等
	$(".indexList").find("li").each(function(item) {
		$(this).hover(function() {
			clearInterval(autoChange);
			changeTo(item);
			curIndex = item;
		}, function() {
			autoChangeAgain();
		});
	});

	//清除定时器时候的重置定时器--封装 
	function autoChangeAgain() {
		autoChange = setInterval(function() {
			if(curIndex < imgLen - 1) {
				curIndex++;
			} else {
				curIndex = 0;
			}
			//调用变换处理函数
			changeTo(curIndex);
		}, 2500);
	}

	//图片切换函数
	function changeTo(num) {
		var goLeft = num * 740;
		$(".imgList").animate({
			left: "-" + goLeft + "px"
		}, 500);
		$(".infoList").find("li").removeClass("infoOn").eq(num).addClass("infoOn");
		$(".indexList").find("li").removeClass("indexOn").eq(num).addClass("indexOn");
	}

	removeGarbled();
	function removeGarbled() {
        var product = $("#searchhistory tbody tr");
        var reg = "?";
        for(var i = 0; i < product.length; i++){
            var d = product.eq(i).find("a").html();
            if(d.indexOf("?") != -1){
                product.eq(i).empty();
                product.eq(i).remove();
            }
        }
    }
	
	removeChinese();
	function removeChinese() {
		var content = $("#searchhistory tbody");
		var d = content.find("tr");
        for(var i = 0; i < d.length; i++){
            var a = d.eq(i).find("a").html();
            if(isChineseChar(a) == true){
                d.eq(i).empty();
                d.eq(i).remove();
			}
        }
    }

    function isChineseChar(str){
        var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
        return reg.test(str);
    }

	//--------------------------------------------- 文字滚动  ---------------------------------------------------------------------
	var doscroll = function(){
		var $parent = $(".scroll");
		var $first = $parent.find("li:first");
		var height = $first.height();
		
		$first.animate({
			marginTop: -height + 'px'
		}, 500, function(){
			$first.css('marginTop', 0).appendTo($parent);
		});
	};
	
	setInterval(function(){doscroll()}, 5000);
//------------------------------------------------------------
    var doscroll1 = function(){
        var $parent = $("#hothelpbuy");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 200, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll1()}, 3000);

//------------------------------------------------------------
    var doscroll2 = function(){
        var $parent = $("#searchhistory");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 200, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll2()}, 3000);

//------------------------------------------------------------
    var doscroll3 = function(){
        var $parent = $("#suppliernew");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 200, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll3()}, 3000);

//------------------------------------------------------------
    var doscroll4 = function(){
        var $parent = $("#comment");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 200, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll4()}, 3000);

//------------------------------------------------------------
    var doscroll5 = function(){
        var $parent = $("#lookproduct");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 200, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll5()}, 3000);

//------------------------------------------------------------
    var doscroll6 = function(){
        var $parent = $("#procurement");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 200, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll6()}, 3000);
});

