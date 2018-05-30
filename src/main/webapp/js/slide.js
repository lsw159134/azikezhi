(function($){
    $.fn.ckSlide = function(opts){
		//.extend() 鎵╁睍jQuery绫伙紝娣诲姞ckSlide鏂规硶锛屽弬鏁版槸瀵硅薄绫诲瀷{}
        opts = $.extend({}, $.fn.ckSlide.opts, opts);
        this.each(function(){
            var slidewrap = $(this).find('.ck-slide-wrapper');//杞挱鍏冪礌鐖跺璞�
            var slide = slidewrap.find('li');//鑾峰彇<li>瀵硅薄闆�
            var count = slide.length;//璁＄畻瀵硅薄闆嗛暱搴�
            var that = this;//瀛樻斁鐖跺璞�
            var index = 0;//璧峰浣嶇疆
            var time = null;
            $(this).data('opts', opts);//缁欒疆鎾璞℃坊鍔犲弬鏁� 鏁版嵁
            // next
            $(this).find('.ck-next').on('click', function(){
                if(opts['isAnimate'] == true){
                    return;
                }
                
                var old = index;
                if(index >= count - 1){
                    index = 0;
                }else{
                    index++;
                }
                change.call(that, index, old);//璋冪敤鍥剧墖鍒囨崲鏂规硶锛�.call() 姣忎釜JS鍑芥暟閮藉寘鍚殑涓€涓潪缁ф壙鑰屾潵鐨勬柟娉曪紝涓昏鐢ㄦ潵鎸囧畾鍑芥暟鐨勪綔鐢ㄥ煙 that 锛岄€氬父涓嶄弗璋ㄥ啓娉曟槸change()锛屾湁鍙兘浼氬嚱鏁板啿绐併€�
            });
            // prev
            $(this).find('.ck-prev').on('click', function(){
                if(opts['isAnimate'] == true){
                    return;
                }
                
                var old = index;
                if(index <= 0){
                    index = count - 1;
                }else{                                      
                    index--;
                }
                change.call(that, index, old);
            });
			//鐐瑰嚮鍒囨崲鐩稿簲搴忓彿鐨勫浘鐗�
            $(this).find('.ck-slidebox li').each(function(cindex){
                $(this).on('click.slidebox', function(){
                    change.call(that, cindex, index);
                    index = cindex;
                });
            });
			//鑷繁娣诲姞鈥斺€旈紶鏍囩Щ鍏ュ皬鍦嗙偣鍒囨崲杞挱鍥剧墖
			$(this).find('.ck-slidebox li').each(function(cindex){
                $(this).on('mouseover.slidebox', function(){
                    change.call(that, cindex, index);
                    index = cindex;
                });
            });
            
            // 榧犳爣鎮仠鍋滄鑷姩鎾斁锛屾樉绀哄乏鍙冲垏鎹㈡寜閽�
            $(this).on('mouseover', function(){
                if(opts.autoPlay){
                    clearInterval(time);
                }
                $(this).find('.ctrl-slide').css({opacity:0.6});
            });
            //  榧犳爣绂诲紑杞挱鐣岄潰锛屽紑濮嬭嚜鍔ㄦ挱鏀撅紝鍚屾椂闅愯棌鎸夐挳
            $(this).on('mouseleave', function(){
                if(opts.autoPlay){
                    startAtuoPlay(opts.interval);
                }
                $(this).find('.ctrl-slide').css({opacity:0.1});
            });
            startAtuoPlay(opts.interval);
            // 鑷姩婊氬姩鎾斁
            function startAtuoPlay(inum){
                if(opts.autoPlay){
                    time  = setInterval(function(){
                        var old = index;
                        if(index >= count - 1){
                            index = 0;
                        }else{
                            index++;
                        }
                        change.call(that, index, old);
                    }, inum);//2绉�
                }
            }
            // 淇box  鏍囪灞呬腑
            var box = $(this).find('.ck-slidebox');
            box.css({
                'margin-left':-(box.width() / 2)
            })
            // dir  绉诲姩鏂瑰悜鍙傛暟
            switch(opts.dir){
                case "x":
                    opts['width'] = $(this).width();
                    slidewrap.css({
                        'width':count * opts['width']
                    });
                    slide.css({
                        'float':'left',
                        'position':'relative',
						'margin-left':'0px'
                    });
					//.wrap()鍖呰９椤甸潰宸茬粡瀹氫箟鐨�.ck-slide-wrapper浠ュ強瀛愬厓绱�
                    slidewrap.wrap('<div class="ck-slide-dir"></div>');
                    slide.show();
                    break;
				case "y":  //娣诲姞鍨傜洿绉诲姩鍙傛暟
                    opts['height'] = $(this).height();
                    slidewrap.css({
                        'height':count * opts['height']
                    });
                    slide.css({
                        'float':'left',
                        'position':'relative',
						'margin-top':'0px'
                    });
                    slidewrap.wrap('<div class="ck-slide-dir"></div>');
                    slide.show();
                break;
            }
        });
    };
    function change(show, hide){
		//鑾峰彇涔嬪墠璁剧疆鍦╟kSlide瀵硅薄涓婄殑鍙傛暟 鏁版嵁
        var opts = $(this).data('opts');
		//姘村钩绉诲姩
        if(opts.dir == 'x'){
            var x = show * opts['width'];
			//animate() 涓巆ss()鎵ц缁撴灉鐩稿悓锛屼絾鏄繃绋嬩笉鍚岋紝鍓嶈€呮湁娓愬彉鍔ㄧ敾鏁堟灉
            $(this).find('.ck-slide-wrapper').stop().animate({'margin-left':-x}, function(){opts['isAnimate'] = false;});
            opts['isAnimate'] = true;//鍥剧墖鍦ㄧЩ鍔ㄨ繃绋嬩腑璁剧疆鎸夐挳鐐瑰嚮涓嶅彲鐢紝纭繚姣忎竴娆¤疆鎾瑙変笂鎵ц瀹屾垚锛�
        }else if(opts.dir == 'y'){//鍨傜洿绉诲姩鈥斺€旇嚜宸辨坊鍔�
            var y = show * opts['height'];
            $(this).find('.ck-slide-wrapper').stop().animate({'margin-top':-y}, function(){opts['isAnimate'] = false;});
            opts['isAnimate'] = true;
        }
		else{
			//榛樿鐨勬贰闅愭贰鍑烘晥鏋�
            $(this).find('.ck-slide-wrapper li').eq(hide).stop().animate({opacity:0});
            $(this).find('.ck-slide-wrapper li').eq(show).show().css({opacity:0}).stop().animate({opacity:1});
        }
       //鍒囨崲瀵瑰簲鏍囪鐨勯鑹�
        $(this).find('.ck-slidebox li').removeClass('current');
        $(this).find('.ck-slidebox li').eq(show).addClass('current');
    }
    $.fn.ckSlide.opts = {
		autoPlay: false,//榛樿涓嶈嚜鍔ㄦ挱鏀�
        dir: null,//榛樿娣￠殣娣″嚭鏁堟灉
        isAnimate: false,//榛樿鎸夐挳鍙敤
		interval:2000//榛樿鑷姩2绉掑垏鎹� 
		 };
})(jQuery);