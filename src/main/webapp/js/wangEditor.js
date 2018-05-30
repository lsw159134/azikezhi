$(document).ready(function() {
	
	//投诉
	$(".user-complaint").on("click",function(){
	layer.open({
		type: 1,
		title: ['投诉','background-color:rgba(46, 64, 86, 0.75);color:#fff;'],
		area: ['300px','130px'],
		resize: false,
		shadeClose: true,
		content: '<span class="user-complaint-layer">如果您发现这条评价属于恶意评价,请第一时间联系我们删除<div class="user-complaint-layer-qq">QQ号:2938492659</div></span>'
		});     
	});
	
	//踩
	$(".comments-downvote").click(function(){
		var id = $(this).data("id");
		var downvote = $(this).find(".downvote");
		$(".comments-downvote").unbind("click");
		$.ajax({
			url: "downvote",
			type: 'post',
			dataType: "json",
			data: {
				comment: id,
				adownvote: downvote.html(),
				downvote: parseInt(downvote.html())+1,
			},
			success: function(data) {
				downvote.html(parseInt(downvote.html())+1);
			}
		});
	});
	
	//赞
	$(".comments-like").click(function(){
		var id = $(this).data("id");
		var like = $(this).find(".like");
		console.log($(this).find(".like").html());
		$(".comments-like").unbind("click");
		$.ajax({
			url: "userlike",
			type: 'post',
			dataType: "json",
			data: {
				comment: id,
				alike: like.html(),
				like: parseInt(like.html())+1,
			},
			success: function(data) {
				like.html(parseInt(like.html())+1);
				console.log(like);
				editor.clear();
//					layer.msg(data.msg),
//					editor.$txt.html('<p><br></p>');
			}
		});
	});

	var editor2;
	$("#comment").on("click",".comments-reply", function() {
		$(".editor1").remove();
		$(this).parent().append("<div class='editor1'><div id='wangEditor1'></div><button class='replysubmit'>提交</button></div>");
		editor2 = new wangEditor("wangEditor1");
		editor2.config.menus = [
			'bold',
			'italic',
			'forecolor',
			'bgcolor',
			'|',
			'fontfamily',
			'fontsize',
			'unorderlist',
			'orderlist',
			'alignleft',
			'aligncenter',
			'alignright',
			'|',
			'emotion',
			'insertcode',
		];
	     editor2.config.emotions = {
	    	     'default': {
	    		     title: '默认',
	    		     data: [{
	    'icon': 'http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7a/shenshou_thumb.gif','value': '[草泥马]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif','value':'[可爱]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/af/kl_thumb.gif','value':'[可怜]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/wabi_thumb.gif','value':'[挖鼻]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f4/cj_thumb.gif','value':'[吃惊]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/shamea_thumb.gif','value':'[害羞]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c3/zy_thumb.gif','value':'[挤眼]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/bz_thumb.gif','value':'[闭嘴]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/71/bs2_thumb.gif','value':'[鄙视]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/lovea_thumb.gif','value':'[爱你]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/sada_thumb.gif','value':'[泪]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/19/heia_thumb.gif','value':'[偷笑]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8f/qq_thumb.gif','value':'[亲亲]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c3/zy_thumb.gif','value':'[挤眼]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/bz_thumb.gif','value':'[闭嘴]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/71/bs2_thumb.gif','value':'[鄙视]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/lovea_thumb.gif','value':'[爱你]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/sada_thumb.gif','value':'[泪]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/19/heia_thumb.gif','value':'[偷笑]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8f/qq_thumb.gif','value':'[亲亲]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b6/sb_thumb.gif','value':'[生病]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/58/mb_thumb.gif','value':'[太开心]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/landeln_thumb.gif','value':'[白眼]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/98/yhh_thumb.gif','value':'[右哼哼]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/zhh_thumb.gif','value':'[左哼哼]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a6/x_thumb.gif','value':'[嘘]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/af/cry.gif','value':'[衰]',
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/73/wq_thumb.gif','value':'[委屈]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9e/t_thumb.gif','value':'[吐]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cc/haqianv2_thumb.gif','value':'[哈欠]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/27/bba_thumb.gif','value':'[抱抱_旧]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7c/angrya_thumb.gif','value':'[怒]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/yw_thumb.gif','value':'[疑问]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a5/cza_thumb.gif','value':'[馋嘴]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/70/88_thumb.gif','value':'[拜拜]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e9/sk_thumb.gif','value':'[思考]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/24/sweata_thumb.gif','value':'[汗]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/kunv2_thumb.gif','value':'[困]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/96/huangliansj_thumb.gif','value':'[睡]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/90/money_thumb.gif','value':'[钱]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0c/sw_thumb.gif','value':'[失望]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/cool_thumb.gif','value':'[酷]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/20/huanglian_thumb.gif','value':'[色]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/49/hatea_thumb.gif','value':'[哼]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/36/gza_thumb.gif','value':'[鼓掌]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/dizzya_thumb.gif','value':'[晕]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1a/bs_thumb.gif','value':'[悲伤]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/62/crazya_thumb.gif','value':'[抓狂]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/91/h_thumb.gif','value':'[黑线]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/yx_thumb.gif','value':'[阴险]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/60/numav2_thumb.gif','value':'[怒骂]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/89/hufen_thumb.gif','value':'[互粉]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/hearta_thumb.gif','value':'[心]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ea/unheart.gif','value':'[伤心]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/58/pig.gif','value':'[猪头]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/panda_thumb.gif','value':'[熊猫]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/81/rabbit_thumb.gif','value':'[兔子]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d6/ok_thumb.gif','value':'[ok]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/ye_thumb.gif','value':'[耶]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d8/good_thumb.gif','value':'[good]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ae/buyao_org.gif','value':'[NO]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d0/z2_thumb.gif','value':'[赞]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/come_thumb.gif','value':'[来]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d8/sad_thumb.gif','value':'[弱]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7a/shenshou_thumb.gif','value':'[草泥马]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/60/hor2_thumb.gif','value':'[神马]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/15/j_thumb.gif','value':'[囧]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/bc/fuyun_thumb.gif','value':'[浮云]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1e/geiliv2_thumb.gif','value':'[给力]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f2/wg_thumb.gif','value':'[围观]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/70/vw_thumb.gif','value':'[威武]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9f/huatongv2_thumb.gif','value':'[话筒]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/lazhuv2_thumb.gif','value':'[蜡烛]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3a/cakev2_thumb.gif','value':'[蛋糕]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ec/eventtravel_thumb.gif','value':'[带着微博去旅行]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7e/qlx_thumb.gif','value':'[去旅行]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/60/ad_new0902_thumb.gif','value':'[广告]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b6/doge_thumb.gif','value':'[doge]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/4a/mm_thumb.gif','value':'[喵喵]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/74/moren_hashiqi_thumb.png','value':'[二哈]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f0/dorachijing_thumb.gif','value':'[哆啦A梦吃惊]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9e/jqmweixiao_thumb.gif','value':'[哆啦A梦微笑]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/08/dorahao_thumb.gif','value':'[哆啦A梦花心]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/34/xiaoku_thumb.gif','value':'[笑cry]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/09/pcmoren_tanshou_thumb.png','value':'[摊手]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/70/pcmoren_baobao_thumb.png','value':'[抱抱]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/35/bhsj5_nainai_thumb.gif','value':'[冰川时代希德奶奶]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7e/xman_kuaiyin_org.gif','value':'[快银]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7b/xman_baofengnv_thumb.gif','value':'[暴风女]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/64/mango_07_thumb.gif','value':'[芒果流口水]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/mango_12_thumb.gif','value':'[芒果点赞]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9f/mango_02_thumb.gif','value':'[芒果大笑]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ee/mango_03_thumb.gif','value':'[芒果得意]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/49/mango_11_thumb.gif','value':'[芒果萌萌哒]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cc/yangniandj_thumb.gif','value':'[羊年大吉]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6b/watermelon.gif','value':'[西瓜]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c0/football.gif','value':'[足球]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/46/mothersday_thumb.gif','value':'[老妈我爱你]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/36/carnation_thumb.gif','value':'[母亲节]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e5/soap_thumb.gif','value':'[肥皂]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e6/youqian_thumb.gif','value':'[有钱]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/dc/earth1r_thumb.gif','value':'[地球一小时]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/dc/flag_thumb.gif','value':'[国旗]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/87/lxhxuyuan_thumb.gif','value':'[许愿]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/92/fan.gif','value':'[风扇]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f4/zhaji_thumb.gif','value':'[炸鸡和啤酒]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/00/snow_thumb.gif','value':'[雪]'
	    },{
	    'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ee/mashangyouduixiang_thumb.gif','value':'[马上有对象]'
	    }
	    ]
	    }
	    };
		editor2.create();
		editor2.$editorContainer.css('z-index', 10);
		//		$(this).unbind("click");
		console.log(editor2);
	});
	
	$("#comment").on("click",".replysubmit",function(){
		console.log(editor2);
		var comments = $(this);
		//内容
		var text1= editor2.$txt.html();
		//回复的用户
		var pkey = $("#name").val();
		//回复用户的uid
		var uid = $("#userUid").val();
		//回复的是哪个Id
		var parentUid = comments.parents(".comments").find(".comments-userName").data("commentsid");
		//被回复的用户的名字
		var replyuser = comments.parents(".comments").find(".comments-userName").data("reply");
		// 等级
		console.log("t" + comments.parents(".comments").find(".comments-userName").data("level"));
		var levelPath = parseInt(comments.parents(".comments").find(".comments-userName").data("level")) + 1;
//		console.log($(".comments-userName").data("level"));
		var topic = $("#contentTitleText").data("uid");
		if (text1.length > 1000) {
            layer.msg('长度太长，请删除几个表情或文字');
            return false;
        }else if(editor2.$txt.text() == 0){
        	layer.msg('请输入评论');
        	return false;
        }
		$.ajax({
			url: "commentQuanzi",
			type: 'post',
			dataType: "json",
			data: {
				path : replyuser,
                anonymous: "",
				parentuid: parentUid,
				postkey: pkey,
				comment: text1,
				level: levelPath,
				topictype: topic,
				useruid: uid
			},
			success: function(data) {
				comments.parents(".comments").after("<div class='comments'>" +
						"<div class='comments-userName' data-commentsid='"+data.sid+"' data-reply='"+pkey+"' data-level='"+levelPath+"'>"+pkey+"</div>" +
						"<div class='comments-content'>"+text1+"</div><span class='comments-time'>"+getMyDate(data.time)+"</span><span class='comments-reply'>&nbsp;回复</span>" +
								"<span class='comments-like' data-id='"+data.uid+"'>&nbsp;赞(<span class='like'>"+data.like+"</span>)</span>" +
										"<span class='comments-downvote' data-id='"+data.uid+"'>&nbsp;踩(<span class='downvote'>"+data.downvote+"</span>)</span></div>"),
					layer.msg(data.msg),
					$(".editor1").remove(),
//					editor.$txt.html('<p></p>');
					editor.clear();
			}
		});
		console.log(text1);
	});
	


    $("#wangEditor").on("blur", function() {
        var text = editor.$txt.html();
        console.log("长度为:" + text.length);
        if (text.length > 1000) {
            layer.msg('长度太长，请删除几个表情或文字');
            return false;
        }
    });

    $("#submitComment").on("click",function() {
    		var anonymous = $("#anonymous").is(':checked');
    		if(anonymous == true){
    			anonymous = 'anonymous';
    		}else{
    			anonymous = 'false';
    		}
    		console.log(anonymous);
            var uid = $("#userUid").val();
            
            if (uid == "") {
                layer.msg('你还没有登录,请登录再试!', {
                    icon: 5
                });
                return false;
            }

            var topicType = $("#contentTitleText").data("uid");
            var pkey = $("#name").val();
            var levelPath = 1;
            var text = editor.$txt.html();
            if (text.length > 1000) {
                layer.msg('长度太长，请删除几个表情或文字');
                return false;
            }else if(editor.$txt.text() == 0){
            	layer.msg('请输入评论');
            	return false;
            }
            $.ajax({
                url: "commentQuanzi",
                type: 'post',
                dataType: "json",
                data: {
                    postkey: pkey,
                    anonymous: anonymous,
                    comment: editor.$txt.html(),
                    level: levelPath,
                    topictype: topicType,
                    path: '',
                    parentuid: '',
                    useruid: uid
                },
                success: function(data) {
                	var str = '';
                	if(anonymous == 'anonymous'){
                		pkey = '匿名用户';
                		str = "<div class='comments-userName' data-commentsid='"+data.sid+"' data-reply='"+pkey+"' data-level='"+levelPath+"'><span class='str'>"+pkey+"</span></div>";
                	}else{
                		str = "<div class='comments-userName' data-commentsid='"+data.sid+"' data-reply='"+pkey+"' data-level='"+levelPath+"'>"+pkey+"</div>";
                	}
                	$("#comment").append("<div class='comments'>" +
    					str + "<div class='comments-content'>"+editor.$txt.html()+"</div><span class='comments-time'>"+getMyDate(data.time)+"</span><span class='comments-reply'>&nbsp;回复</span>" +
    						"<span class='comments-like' data-id='"+data.uid+"'>&nbsp; 赞(<span class='like'>"+data.like+"</span>)</span>" +
    							"<span class='comments-downvote' data-id='"+data.uid+"'>&nbsp; 踩(<span class='downvote'>"+data.downvote+"</span>)</span>&nbsp;<span class='user-complaint'>投诉</span></div>");
                    console.log(data.code), layer.msg(data.msg),
					editor.clear();
                }
            });
        });

    var editor = new wangEditor('wangEditor');
    // 自定义菜单
    editor.config.menus = [
		'bold',
		'italic',
		'forecolor',
		'bgcolor',
		'|',
		'fontfamily',
		'fontsize',
		'unorderlist',
		'orderlist',
		'alignleft',
		'aligncenter',
		'alignright',
		'|',
		'emotion',
		'insertcode',
    ];
     editor.config.emotions = {
	     'default': {
		     title: '默认',
		     data: [{
'icon': 'http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7a/shenshou_thumb.gif','value': '[草泥马]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/tza_thumb.gif','value':'[可爱]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/af/kl_thumb.gif','value':'[可怜]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/wabi_thumb.gif','value':'[挖鼻]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f4/cj_thumb.gif','value':'[吃惊]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/shamea_thumb.gif','value':'[害羞]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c3/zy_thumb.gif','value':'[挤眼]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/bz_thumb.gif','value':'[闭嘴]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/71/bs2_thumb.gif','value':'[鄙视]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/lovea_thumb.gif','value':'[爱你]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/sada_thumb.gif','value':'[泪]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/19/heia_thumb.gif','value':'[偷笑]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8f/qq_thumb.gif','value':'[亲亲]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c3/zy_thumb.gif','value':'[挤眼]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/bz_thumb.gif','value':'[闭嘴]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/71/bs2_thumb.gif','value':'[鄙视]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/lovea_thumb.gif','value':'[爱你]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/sada_thumb.gif','value':'[泪]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/19/heia_thumb.gif','value':'[偷笑]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8f/qq_thumb.gif','value':'[亲亲]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b6/sb_thumb.gif','value':'[生病]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/58/mb_thumb.gif','value':'[太开心]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/landeln_thumb.gif','value':'[白眼]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/98/yhh_thumb.gif','value':'[右哼哼]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/zhh_thumb.gif','value':'[左哼哼]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a6/x_thumb.gif','value':'[嘘]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/af/cry.gif','value':'[衰]',
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/73/wq_thumb.gif','value':'[委屈]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9e/t_thumb.gif','value':'[吐]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cc/haqianv2_thumb.gif','value':'[哈欠]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/27/bba_thumb.gif','value':'[抱抱_旧]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7c/angrya_thumb.gif','value':'[怒]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/yw_thumb.gif','value':'[疑问]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a5/cza_thumb.gif','value':'[馋嘴]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/70/88_thumb.gif','value':'[拜拜]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e9/sk_thumb.gif','value':'[思考]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/24/sweata_thumb.gif','value':'[汗]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/kunv2_thumb.gif','value':'[困]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/96/huangliansj_thumb.gif','value':'[睡]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/90/money_thumb.gif','value':'[钱]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0c/sw_thumb.gif','value':'[失望]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/cool_thumb.gif','value':'[酷]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/20/huanglian_thumb.gif','value':'[色]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/49/hatea_thumb.gif','value':'[哼]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/36/gza_thumb.gif','value':'[鼓掌]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/dizzya_thumb.gif','value':'[晕]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1a/bs_thumb.gif','value':'[悲伤]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/62/crazya_thumb.gif','value':'[抓狂]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/91/h_thumb.gif','value':'[黑线]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/yx_thumb.gif','value':'[阴险]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/60/numav2_thumb.gif','value':'[怒骂]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/89/hufen_thumb.gif','value':'[互粉]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/hearta_thumb.gif','value':'[心]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ea/unheart.gif','value':'[伤心]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/58/pig.gif','value':'[猪头]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/panda_thumb.gif','value':'[熊猫]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/81/rabbit_thumb.gif','value':'[兔子]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d6/ok_thumb.gif','value':'[ok]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/ye_thumb.gif','value':'[耶]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d8/good_thumb.gif','value':'[good]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ae/buyao_org.gif','value':'[NO]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d0/z2_thumb.gif','value':'[赞]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/come_thumb.gif','value':'[来]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d8/sad_thumb.gif','value':'[弱]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7a/shenshou_thumb.gif','value':'[草泥马]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/60/hor2_thumb.gif','value':'[神马]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/15/j_thumb.gif','value':'[囧]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/bc/fuyun_thumb.gif','value':'[浮云]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1e/geiliv2_thumb.gif','value':'[给力]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f2/wg_thumb.gif','value':'[围观]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/70/vw_thumb.gif','value':'[威武]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9f/huatongv2_thumb.gif','value':'[话筒]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d9/lazhuv2_thumb.gif','value':'[蜡烛]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3a/cakev2_thumb.gif','value':'[蛋糕]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ec/eventtravel_thumb.gif','value':'[带着微博去旅行]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7e/qlx_thumb.gif','value':'[去旅行]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/60/ad_new0902_thumb.gif','value':'[广告]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b6/doge_thumb.gif','value':'[doge]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/4a/mm_thumb.gif','value':'[喵喵]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/74/moren_hashiqi_thumb.png','value':'[二哈]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f0/dorachijing_thumb.gif','value':'[哆啦A梦吃惊]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9e/jqmweixiao_thumb.gif','value':'[哆啦A梦微笑]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/08/dorahao_thumb.gif','value':'[哆啦A梦花心]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/34/xiaoku_thumb.gif','value':'[笑cry]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/09/pcmoren_tanshou_thumb.png','value':'[摊手]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/70/pcmoren_baobao_thumb.png','value':'[抱抱]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/35/bhsj5_nainai_thumb.gif','value':'[冰川时代希德奶奶]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7e/xman_kuaiyin_org.gif','value':'[快银]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7b/xman_baofengnv_thumb.gif','value':'[暴风女]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/64/mango_07_thumb.gif','value':'[芒果流口水]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/mango_12_thumb.gif','value':'[芒果点赞]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9f/mango_02_thumb.gif','value':'[芒果大笑]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ee/mango_03_thumb.gif','value':'[芒果得意]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/49/mango_11_thumb.gif','value':'[芒果萌萌哒]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cc/yangniandj_thumb.gif','value':'[羊年大吉]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6b/watermelon.gif','value':'[西瓜]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c0/football.gif','value':'[足球]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/46/mothersday_thumb.gif','value':'[老妈我爱你]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/36/carnation_thumb.gif','value':'[母亲节]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e5/soap_thumb.gif','value':'[肥皂]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e6/youqian_thumb.gif','value':'[有钱]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/dc/earth1r_thumb.gif','value':'[地球一小时]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/dc/flag_thumb.gif','value':'[国旗]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/87/lxhxuyuan_thumb.gif','value':'[许愿]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/92/fan.gif','value':'[风扇]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f4/zhaji_thumb.gif','value':'[炸鸡和啤酒]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/00/snow_thumb.gif','value':'[雪]'
},{
'icon':'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ee/mashangyouduixiang_thumb.gif','value':'[马上有对象]'
}
]
}
};
    editor.config.pasteText = true;
    editor.create();
});

function getMyDate(str){  
    var oDate = new Date(str),  
    oYear = oDate.getFullYear(),  
    oMonth = oDate.getMonth()+1,  
    oDay = oDate.getDate(),  
    oHour = oDate.getHours(),  
    oMin = oDate.getMinutes(),  
    oSen = oDate.getSeconds(),  
    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间  
    return oTime;  
}; 
//补0操作  
function getzf(num){  
    if(parseInt(num) < 10){  
        num = '0'+num;  
    }  
    return num;  
}  
