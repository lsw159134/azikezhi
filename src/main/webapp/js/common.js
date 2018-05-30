
/**
 * 娣诲姞OPENX骞垮憡
 * @param  {[type]} posterid [description]
 * @param  {[type]} htmlid   [description]
 * @param  {[type]} width    [description]
 * @param  {[type]} height   [description]
 * @return {[type]}          [description]
 */
function openX_ad(posterid, htmlid, width, height) {
    if ($(htmlid).length > 0) {
        var randomnumber = Math.random();
        var ga = document.createElement('iframe');
        ga.src = 'http://www1.elecfans.com/www/delivery/myafr.php?target=_blank&cb=' + randomnumber + '&zoneid=' + posterid;
        ga.width = width;
        ga.height = height;
        ga.frameBorder = 0;
        ga.scrolling = 'no';
        var s = $(htmlid).append(ga);
    }
}

// 璺殰骞垮憡***************************************/
$(function(){
    // 鏄剧ず璺殰骞垮憡
    var showTdkAd = function(ad_url) {
        var docHeight = $(document).height(),docWidth = $(document).width();
        var setStyle=
        '<style type="text/css">'+
        '/*2015-07-20 tdk寮圭獥骞垮憡*/'+
        '#fix-tdkad{position: fixed;z-index: 99999;width: 640px;height: 480px;top: 50%;left: 50%;margin:-240px 0 0 -320px;}'+
        '#tdk-close{ background: url(http://www.elecfans.com/images2013/close.png) no-repeat 0 0; cursor: pointer; width: 24px; height: 24px; position: absolute; display: block; right: -12px; top: -12px; z-index: 101;}'+
        '#road-block-bg { background: #999; display: block; position: absolute; left: 0; top: 0; z-index: 99; opacity: 0.5; }'+
        '</style>'
        ;
        $('body').append(setStyle+'<div id="fix-tdkad"><iframe width="640" height="480" frameborder="0" src="'+ad_url+'" scrolling="no"></iframe><span id="tdk-close" title="鐐瑰嚮鍏抽棴"></span></div><div id="road-block-bg"></div>');
        $(document).on("click", "#tdk-close", function(){
            closeTdkAd();
        });
    }
    // 鍏抽棴璺殰骞垮憡
    var closeTdkAd = function(){
        if($('#fix-tdkad').length){
            $('#fix-tdkad').animate({
                "opacity" : 0
            }, 500, function(){
                $('#fix-tdkad').remove();
                $('#road-block-bg').hide();
            });
        }
    }
    // cookie 璁剧疆鍑芥暟
    $.extend({
        cookieHelper: function(name, value, options) {
            if (typeof value != 'undefined') { // name and value given, set cookie
                options = options || {};
                if (value === null) {
                    value = '';
                    options.expires = -1;
                }
                var expires = '';
                if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                    var date;
                    if (typeof options.expires == 'number') {
                        date = new Date();
                        date.setTime(date.getTime() + (options.expires * 60 * 60 * 1000));
                    } else {
                        date = options.expires;
                    }
                    expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
                }
                var path = options.path ? '; path=' + options.path : '';
                var domain = options.domain ? '; domain=' + options.domain : '';
                var secure = options.secure ? '; secure' : '';
                document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
            } else { // only name given, get cookie
                var cookieValue = null;
                if (document.cookie && document.cookie != '') {
                    var cookies = document.cookie.split(';');
                    for (var i = 0; i < cookies.length; i++) {
                        var cookie = jQuery.trim(cookies[i]);
                        // Does this cookie string begin with the name we want?
                        if (cookie.substring(0, name.length + 1) == (name + '=')) {
                            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                            break;
                        }
                    }
                }
                return cookieValue;
            }
        }
    });
    // 鑾峰彇褰撳墠鏍忕洰ID
    var get_current_typeid = function() {
        var ad_id = 0;
        if( $('#adChannel').length > 0 ) {
            ad_id = $('#adChannel').val();
        } else if ($('#typeid').length > 0) {
            ad_id = $('#typeid').val();
        }
        return ad_id;
    }

    if($.cookieHelper("roadblockad") !== "yes"){
        var ad_id = get_current_typeid();
        // 鏍忕洰ID涓�0鐨勯〉闈㈡病鏈夊搴旂殑璺殰骞垮憡
        if (ad_id == 0) {
            return false;
        }
        $.ajax({
            type:'GET',
            url:'/webapi/advertisement/roadblock',
            data: {site_name:'www', typeid: ad_id},
            dataType:'json',
            success: function(response) {
                if (response.error_code != 0) {
                    return false;
                }
                var data = response.data;
                $.cookieHelper("roadblockad", "yes", {expires:data['frequency'], path:"/"});
                showTdkAd(data['ad_url']);
                setTimeout(function(){closeTdkAd();}, 30000);
            }
        });
    }
});

// 璺殰骞垮憡 end***************************************/

$(function(){//document.ready
        $.ajaxSetup ({
            cache: false
        });

        CheckLogin();

        $(document).on('click', 'a.btn-login',function(){
//          var dialog = new LoginDialog({});
//          dialog.show();
$.ssoDialogLogin();//鍗曠偣鐧诲綍
            return false;
        });
        //淇敼娉ㄥ唽鐧诲綍鎸夐挳閾炬帴
        $(".btn-login").attr("href",loginUrl);
        $(".register").attr("href",regUrl);
        $("#J_Btn-commentLogin").next().attr("href",regUrl);
        // 鎼滅储 ------
        if ( $("#min-search").length > 0) {}
        // 鎼滅储缁撴潫-----

        //IE6鑳屾櫙鍥剧墖缂撳瓨
        if($.browser.msie&&($.browser.version == "6.0")&&!$.support.style){
                document.execCommand("BackgroundImageCache",false,true);
        };

        if ($('#page').length > 0 && $('.data-channel').length > 0) {
            $("#content").prepend('<div class="content-ad group"><div id="cttad-left"></div><div id="cttad-right"><iframe src="/templets/default/elecfans/homehtml/adright.html" border="0" width="260" height="85" scrolling="no" frameborder="no" border="0" charset="utf-8"></iframe></div></div>');
            openX_ad(16,"#cttad-left",728,90);
        }
        // 鏂板紡骞垮憡浣嶅箍鍛婃柟寮�  <div class="openx_ad_zone" ad-id="325" ad-width="270" ad-height="14"></div>
        $('.openx_ad_zone').each(function(){
            var posterid = $(this).attr('ad-id');

            //涓存椂灞忚斀ID涓�513鐨勫箍鍛�
            if(posterid==513){
                return false;
            }


            var width = $(this).attr('ad-width');
            var height = $(this).attr('ad-height');
            var randomnumber = Math.random();
            var ga = document.createElement('iframe');
            ga.src = 'http://www1.elecfans.com/www/delivery/myafr.php?target=_blank&cb='+randomnumber+'&zoneid='+posterid;
            ga.width = width;
            ga.height = height;
            ga.frameBorder = 0;
            ga.scrolling = 'no';
            $(this).html(ga);
        });

    // 2015-07-23 璧勬枡涓嬭浇棣栭〉鎼滅储妗嗘敼涓虹櫨搴︽悳绱�
    if(location.href.indexOf("soft") > -1){
        // 纭鏄笅杞介〉闈�
        var bdsearch = '<div id="bdcs"><div class="bdcs-container"><meta http-equiv="x-ua-compatible" content="IE=9"><div class="bdcs-main bdcs-clearfix" id="default-searchbox"><div class="bdcs-search bdcs-clearfix" id="bdcs-search-inline"><form action="http://s.elecfans.com/cse/search" method="get" target="_blank" class="bdcs-search-form" id="bdcs-search-form"><input type="hidden" name="s" value="6298135183618923127"><input type="hidden" name="entry" value="1"><input type="hidden" name="nsid" value="4"><input type="text" name="q" class="bdcs-search-form-input" id="bdcs-search-form-input" placeholder="" autocomplete="off"><input type="submit" class="bdcs-search-form-submit " id="bdcs-search-form-submit" value="鎼滅储"></form></div><div class="bdcs-search-sug" id="bdcs-search-sug" style="top: 29px; width: 400px; display: none;"><ul class="bdcs-search-sug-list" id="bdcs-search-sug-list"></ul></div></div></div></div><script charset="utf-8" src="http://znsv.baidu.com/customer_search/api/js?sid=6298135183618923127&amp;plate_url=http%3A%2F%2Fwww.elecfans.com%2F&amp;t=395479"></script>';
        if ($(".search").length > 0) {
            $(".search").empty().html(bdsearch);
        } else if($('.min-search').length > 0) {
            $(".min-search").empty().html(bdsearch);
            $('.min-search').css({top:'0px',width:'auto'});
        }
        setTimeout(function(){if($('#bdcs-search-form-input').length){$('<input type="hidden" name="nsid" value="4">').insertBefore('#bdcs-search-form-input')}}, 4000);
    }

});// End document.ready

$(window).load(function(){

        // 瀵艰埅  ---------------------------------
        var $nav = $("#nav");
        var $nav_li = $nav.find("li");
        var $nav_a = $nav.find(".nav-a");
        //杩藉姞婊戝姩鍧椼€佹粦鍔ㄧ數璺疍OM鍒板鑸�
        var nav_slide_html = '<div id="nav-slide" class="nav-slide"></div>';
        var nav_cir_html = '<div id="nav-cir" class="nav-cir" ><div class="nav-cir-left"></div><div class="nav-cir-right"></div><div class="nav-cir-line"></div></div>';
        var nav_slide_cir =  nav_slide_html + nav_cir_html;
        $nav.after(nav_slide_cir);
        var $nav_slide = $("#nav-slide");
        var $nav_cir = $("#nav-cir");
        $nav_a.mouseDelay().hover(function(){
                //鑾峰彇鍧愭爣
                var $this_parent = $(this).parent();
                var page_left = $("#page").offset().left;
                var this_left = $this_parent.offset().left;
                var this_width = $this_parent.width();
                //----- 婊戝姩鍧�+鐢佃矾 -----
                $nav_slide.stop(true,true).show().animate({ left : this_left - page_left - 1 , width : this_width + 1 },300);
                //----- 婊戝姩鐢佃矾 -----
                if( $(this).is("#navHome .nav-a") ){
                   $nav_cir.stop(true,true).animate({width:10},300).fadeOut(200);
                }else{
                   $nav_cir.stop(true,true).show().animate({ width : this_left - page_left + 1 },600);
                };
        },function(){
                $nav_slide.stop(true,true).fadeOut(800);
                $nav_cir.stop(true,true).animate({width:10},800).fadeOut(600);
        });

});//End window.load -------------

//瀹氫箟Dialog寮瑰嚭妗嗗璞� 2011.09.22 by linan
function Dialog(options) {
        this.title   = options.title || "鎻愮ず";
        this.content = options.content || "";
        this.top     = options.top || "30%";
        this.width   = options.width || 350;
        this.height  = options.height || 280;
        this.timeOut = options.timeOut || null;//瀹氫箟瀵硅瘽妗嗕粠鍑虹幇鍒版秷澶辩殑鏃堕棿
        this.motai   = options.motai || "no";
}
Dialog.prototype = {
        //寮瑰嚭瀵硅瘽妗嗭紝鍔犺浇涓姸鎬�...
        pop : function(){
                var html = '';
                    html += '<div class="dialog">';
                    html += '       <div class="dialog-hd" id="J_DialogTitle">'+this.title+'</div>';
                    html += '       <div class="dialog-bd" id="J_DialogContent">';
                    html += '               <div class="dialog-loading"><img src="img/login.jpg" width="16" height="16" />姝ｅ湪鍔犺浇,璇风◢鍚�...</div>';
                    html += '       </div>';
                    html += '       <div class="close-dialog">X</div>';
                    html += '</div>';
                var motai = this.motai;
                //blockUI
                $.blockUI({
                        message : html,//瀵硅瘽妗咲OM
                        css : {
                                top: this.top,
                                width: this.width + "px",
                                height: "120px",
                                marginLeft: "-"+this.width/2+"px",
                                color: "#000",
                                border: "8px solid #d8d8d8",
                                background: "#fff",
                                borderRadius: "3px"
                        },
                        timeout : this.timeOut,
                        overlayCSS : {
                                cursor: "pointer",
                                backgroundColor: '#111',
                                opacity:         0.3
                        },
                        showOverlay: true,
                        fadeIn: 200,
                        fadeOut: 400,
                        onBlock: function() {
                                if( motai == "no" ){
                                        //寤舵椂400缁欓伄缃╁眰銆佸叧闂寜閽坊鍔爐itle灞炴€э紝浠ュ強click鍏抽棴瀵硅瘽妗嗕簨浠躲€�
                                        setTimeout(function(){
                                                $(".blockOverlay,.close-dialog").attr('title','鐐瑰嚮鍏抽棴').on('click',$.unblockUI);
                                        },400);
                                }else{
                                        $(".close-dialog").hide();
                                }
                        }
                });
        },
        //鏄剧ず鐧诲綍妗� -----------------
        showLogin : function(title,tipContent){
                var title = title ? title : this.title;
                var content = tipContent ? tipContent : "";
                //鏀瑰彉鏍囬
                $("#J_DialogTitle").html(title);
                //鐧诲綍琛ㄥ崟DOM
                var loginForm_dom = '';
                    loginForm_dom += '<div class="login-form">';
                    loginForm_dom += '<form method="post" action="'+ElecfansApi_login+'" name="userlogin" id="J_LoginForm">';
                    loginForm_dom += '      <fieldset>';
                    loginForm_dom += '              <legend>鐢ㄦ埛鐧诲綍</legend>';
                    loginForm_dom += '              <input type="hidden" name="fmdo" value="login" />';
                    loginForm_dom += '              <input type="hidden" name="dopost" value="login" />';
                    loginForm_dom += '              <div class="login-form-item">';
                    loginForm_dom += '                      <div class="login-form-wrap group">';
                    loginForm_dom += '                              <label class="login-label" for="username">璐﹀彿锛�</label>';
                    loginForm_dom += '                              <input class="login-input" type="text" id="username" name="userid" />';
                    loginForm_dom += '                      </div>';
                    loginForm_dom += '                      <div class="login-form-tip tip-show"></div>';
                    loginForm_dom += '              </div>';
                    loginForm_dom += '              <div class="login-form-item">';
                    loginForm_dom += '                      <div class="login-form-wrap group">';
                    loginForm_dom += '                              <label class="login-label" for="password">瀵嗙爜锛�</label>';
                    loginForm_dom += '                              <input class="login-input" type="password" id="password" name="pwd" maxlength="100" />';
                    loginForm_dom += '                      </div>';
                    loginForm_dom += '                      <div class="login-form-tip">6-16浣嶈嫳鏂囨垨鏁板瓧锛屽尯鍒嗗ぇ灏忓啓</div>';
                    loginForm_dom += '              </div>';
                    loginForm_dom += '              <div class="btn-area login-btn-area group">';
                    loginForm_dom += '                      <span class="btn-hasLoading-wrap"><span class="loading"><img src="http://skin.elecfans.com/images/loading.gif" /></span><button type="submit" id="J_LoginSubmit" class="btn login-submit">鐧诲綍</button></span> <a rel="nofollow" href="'+forgetPwUrl+'" class="grey9 ml20">蹇樿瀵嗙爜锛�</a> <a rel="nofollow" href="'+regUrl+'" class="blue ml10">鍏嶈垂娉ㄥ唽</a>';
                    loginForm_dom += '              </div>';
                    loginForm_dom += '      </fieldset>';
                    loginForm_dom += '</form>';
                    loginForm_dom += '</div>';

                //瀵硅瘽妗嗗睍寮€锛屾樉绀虹櫥褰曡〃鍗� ------------------------------------------------------------
                $(".blockPage").animate({ "height": "240px" },200,function(){
                        $("#J_DialogContent").html(loginForm_dom);
                        //琛ㄥ崟楠岃瘉 -------------------------------------------------
                        var $username = $("#username");
                        var $password = $("#password");
                        var $loading = $("span.loading");
                        //鎻愮ず鏂囨湰
                        var username_empty = '璇疯緭鍏ヨ处鍙�';
                        var username_err = '璐﹀彿涓嶅瓨鍦�';
                        var password_err = '瀵嗙爜閿欒,璇烽噸鏂拌緭鍏�';
                        var password_lenErr =  '脳瀵嗙爜涓嶇鍚堣姹傦細<span class="grey9">6-16浣�,鑻辨枃鎴栨暟瀛�</span>';
                        var password_empty = '璇疯緭鍏ョ櫥褰曞瘑鐮侊細<span class="grey9">6-16浣�,鑻辨枃鎴栨暟瀛�</span>';
                        //楠岃瘉璐﹀彿
                        $username.blur(function(){
                                var thisVal = $(this).val();
                                if( thisVal.length > 0 ){
                                        tipErr( $(this) , "" , "none" );
                                }else{
                                        tipErr( $(this) , username_empty );
                                }
                        });
                        //瀵嗙爜鎻愮ず
                        $password.focus(function(){
                                $(this).parent("div").next("div.login-form-tip").css("display","block");
                        });
                        //瀵嗙爜楠岃瘉
                        $password.blur(function(){
                                var len = $(this).val().length;//鑾峰彇瀵嗙爜闀垮害
                                if( len > 0 ){
                                        if( len < 3 || len > 16 ){//瀵嗙爜闀垮害涓嶈兘灏忎簬6锛屽ぇ浜�16
                                                tipErr( $(this), password_lenErr );
                                        }else{
                                                tipErr( $(this),"","none");
                                        }
                                }else{
                                        tipErr( $(this), password_empty );
                                }
                        })//end 瀵嗙爜妫€娴�
                        //琛ㄥ崟楠岃瘉 End -------------------------------------------------

                        //鐧诲綍閿欒鎻愮ず
                        function tipErr(obj,text,display){
                                var display = display ? display : "block";
                                obj.parent("div").next("div.login-form-tip").html(text).css({"display":display,"color": "#c00" });

                        }

                        //琛ㄥ崟鎻愪氦 -----------------------------------------------------
                        var successTip = this.successTip;
                        var tipContent = this.tipContent;
                        //鎻愪氦鍓嶉獙璇�
                        function loginRequest(formData, jqForm, options) {
                                //璐﹀彿
                                var usernameVal = $username.val();
                                if(  usernameVal.length > 0 ){
                                        tipErr( $(this) , "" , "none" );
                                }else{
                                        tipErr( $username , username_empty );
                                        $username.focus().select();
                                        return false;
                                }
                                //瀵嗙爜
                                var len = $password.val().length;//鑾峰彇瀵嗙爜闀垮害
                                if( len > 0 ){
                                        if( len < 3 || len > 16 ){//瀵嗙爜闀垮害涓嶈兘灏忎簬6锛屽ぇ浜�16
                                                tipErr( $password, password_lenErr );
                                                $password.focus().select();
                                                return false;
                                        }else{
                                                tipErr( $password,"","none");
                                        }
                                }else{
                                        tipErr( $password, password_empty );
                                        $password.focus().select();
                                        return false;
                                }
                                //鏄剧ずloading
                                $loading.show();
                                $("#log-tip").hide();
                                var queryString = $.param(formData);
                                return true;
                        }
                        /*ajax鐧诲綍*/
                        $("#J_LoginForm").ajaxForm({
                                beforeSubmit:loginRequest,
                                success:function(responseText,statusText){
                                        //闅愯棌loading
                                        $loading.hide();
                                        if( responseText == "鐢ㄦ埛鍚嶄笉瀛樺湪"){
                                                tipErr( $username , username_err );
                                                $username.focus().select();
                                                return false;
                                        }
                                        if( responseText == "瀵嗙爜閿欒"){
                                                tipErr( $password , password_err );
                                                $password.focus().select();
                                                return false;
                                        }
                                        //鎵ц鍚屾鐧诲綍
                                        eval("urlarr = " + responseText);
                                        for(var i=0;i<urlarr.length;i++){
                                            $.getScript(urlarr[i]);
                                        }

                                        //鎵ц鐧诲綍妫€鏌�
                                        CheckLogin();

                                        //鎻愮ず鐧诲綍鎴愬姛 --------------------
                                        var loginSuccessTip = new SubmitSuccessTip({
                                                title : "鐧诲綍鎴愬姛",
                                                content : content
                                        })
                                        loginSuccessTip.show();

                                }//end success:function
                        });//end ajaxForm

                });//End $(".blockPage").animate()
        },
        //鏄剧ず鑷畾涔夊唴瀹� --------------
        showCustom : function(title,content,width,height,top){
                var title  = title ? title : this.title;
                var content  = content ? content : this.content;
                var width  = width ? width : this.width;
                var height = height ? height : this.height;
                var top = top ? top : this.top;
                //鏀瑰彉鏍囬
                $("#J_DialogTitle").html(title);
                //鏀瑰彉鍐呭
                $(".blockPage").animate({ "height": height+"px","width": width + "px" },300).animate({"top":top},400);
                $("#J_DialogContent").html( content );
        }
}

//瀹氫箟琛ㄥ崟鎻愪氦鎴愬姛鍚庢墽琛岀殑鎿嶄綔
function SubmitSuccessTip( options ){
        this.title = options.title;
        this.content = options.content || "";
        this.height = options.height || 190;
        this.timeOut = options.timeOut || 1600;
}
SubmitSuccessTip.prototype = {
        show : function(){
                var successTip_dom = '';
                    successTip_dom += '<div class="success-tip">';
                    successTip_dom += '     <h3 class="tip-title">'+ this.title +'</h3>';
                    successTip_dom += '     <div class="tip-content">'+ this.content +'</div>';
                    successTip_dom += '</div>';

                var timeOut = this.timeOut;
                var $dialogContent = $("#J_DialogContent");
                    $dialogContent.hide();//闅愯棌鍘熸湁鍏冪礌
                $(".blockPage").animate({ "height": this.height + "px" },200,function(){
                        //鎻愮ず鎶ュ悕鎴愬姛 ---------------
                        $dialogContent.html( successTip_dom ).show();
                        //绉婚櫎瀵硅瘽妗� ----------------
                        if( !(timeOut == "no") ){
                            setTimeout(function(){ $.unblockUI(); },timeOut);
                        }
                });
        }
}

//FormTip锛屾樉绀烘椂4绉嶇姸鎬侊紝鍊间负绌猴細empty锛岄敊璇細err锛屾纭細ok锛屾甯革細normal(鏄剧ず榛樿鐨勬彁绀�)
function FormTip(obj,text){
        this.obj = obj;
        this.target = this.obj.parent("div").next("div");
        this.text = text || this.target.html() ;
}
FormTip.prototype = {
        constructor : FormTip,
        show : function(state){
                switch (state) {
                        case "empty" :
                            var tipColor = "#c00";
                            var label_text = this.obj.siblings("label").text(); //鑾峰彇label鍊�
                                this.text = "璇疯緭鍏�"+label_text.slice(0,label_text.length-1);//鎻愮ず鏂囨湰锛屽幓鎺塴abel鏈€鍚庣殑":"
                        case "err" :
                                var tipColor = "#c00";
                                break;
                        case "ok" :
                                var tipColor = "#090";
                                break;
                        case "normal" :
                                var tipColor = "#999";
                                break;
                }
                this.target.html( this.text ).css({"display":"block","color": tipColor });
        },
        hide : function(){
                this.target.css("display","none");
        }
}

//瀹氫箟鍏ㄥ眬鍙橀噺 ------------------------
var ie6 = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
var ie678 = $.browser.msie && ($.browser.version == "6.0" || $.browser.version == "7.0" || $.browser.version == "8.0");
//娉ㄥ唽鍦板潃
var loginUrl = 'http://home.elecfans.com/do.php?ac=synclogin';
var regUrl = 'http://home.elecfans.com/do.php?ac=syncregister';
var forgetPwUrl = 'http://home.elecfans.com/do.php?ac=lostpasswd';

var loginTitle = '鐢ㄦ埛鐧诲綍';
var loginTitle_hasRegister = '鐢ㄦ埛鐧诲綍 <span>(<a href="'+regUrl+'" class="ml5">杩樻病鏈夋敞鍐岋紵</a>)</span>';
/*鏃堕棿*/
var myDate = new Date();
var m = myDate.getMonth()+1;
var d = myDate.getDate();
var nowDate = m+"鏈�"+d+"鏃�";



//婊氬姩鍒伴〉闈㈡寚瀹氫綅缃� ------------------------
function windowScroll(o,target){
        $(o).live('click',function(){
                var target_top = $(target).offset().top;
                $("html,body").animate({ scrollTop : target_top },800);
                return false;
        });
};
//浠垮井鍗氬悜涓嬫粴鍔紝obj:ul澶栧洿鍏冪礌锛宯um:鏈€灏憀i鐨勬暟閲忥紝height:obj璁惧畾鐨勯珮搴�
function weiboScroll(obj,num,height){
        var $obj = $(obj);
        var oNum = num ? num : 5;
        var oHeight = height ? height : "295px";


        $obj.each(function(){
                var $ul = $(this).find("ul");
                var liNum = $ul.find("li").length;
                $(this).hover(function(){
                        clearInterval(scrtime);
                },function(){
                        scrtime = setInterval(function(){
                                if( liNum > oNum ){
                                        //鎵ц婊氬姩
                                        var liHeight = $ul.find("li:last").height();
                                        $ul.animate({ marginTop : liHeight + 20 +"px"},1000,function(){
                                                $ul.find("li:last").prependTo($ul);
                                                $ul.find("li:first").hide();
                                                $ul.css({marginTop:0});
                                                $ul.find("li:first").fadeIn(1000);
                                        });
                                }
                        },3000);
                }).trigger("mouseleave");
        });

}
//妫€鏌ョ櫥褰�  ---------------------------
function CheckLogin(){
        $.get(ElecfansApi_checkloginsz,function(data,textStatus){
                if( data != "" ){
                        //闅愯棌椤堕儴鏈櫥褰曚俊鎭�
                        $("#J_topLogout").hide();
                        //椤堕儴娣诲姞鐧诲綍鍚庝俊鎭�
                        $("#J_topLog").append(data);
                        //鏀瑰彉涓嬭浇鎸夐挳涓嬫柟鐧诲綍鐘舵€�
                        $("#J_DownloadLogout").hide();
                        var downloadLogin = '<div id="J_DownloadLogin" ><a href="http://www.hqpcb.com/pcbjishu/?tid=30" target="_blank" title="鍗庡己PCB鎶€鏈腑蹇冿紝娴烽噺PCB杞欢鏁欑▼涓嬭浇锛�" style="font-size:14px;color:#000000;font-weight:bold;text-decoration:underline;">娴烽噺PCB杞欢鏁欑▼涓嬭浇 <img src="/images/pcb_ad_arrow.gif" alt="鍗庡己PCB鎶€鏈腑蹇冿紝娴烽噺PCB杞欢鏁欑▼涓嬭浇锛�" style="vertical-align:middle;"></a></div>';
                        if($("#J_DownloadLogin").length === 1){
                            //
                        }else{
                            $("#J_DownloadLog").append(downloadLogin);
                        }
                        //鏄剧ず鍙戣〃璇勮鐨勮〃鍗曪紝闅愯棌璇勮鍖哄煙鏈櫥褰曚俊鎭�
                        if( $("#comment").length > 0 ){
                                $("#J_CommentLogout").hide();
                                $("#J_CommentLogin").show();
                                //娌欏彂
                                //$("#comment-list").html('<li class="pt30 tc grey9">杩樻病鏈変汉鍙戣〃璇勮 <a id="J_Shafa" href="#comment" class="blue">鏉ュ潗绗竴涓矙鍙�</a></li>');
                                $("#J_Shafa").on('click',function(){
                                        $("#cmtMsg").focus().select();
                                        return false;
                                });
                        }
                        // 妫€娴嬫槸鍚︽槸vip鐢ㄦ埛
                        if(data.indexOf("myvip") === (-1)){
                            // 涓嶆槸vip鐢ㄦ埛浣嗗凡鐧婚檰銆佹彁绀篤IP涓嬭浇鐩稿叧淇℃伅
                            var zcontent = '<div id="thevipad">寮€閫歏IP浼氬憳鏃犻渶绉垎鍗冲彲涓嬭浇锛�<a href="/vipdownload/pay" class="red" target="_blank">鐜板湪寮€閫�>></a></div>';
                            if($("#thevipad").length === 1){
                                //
                            }else{
                                $("#J_DownloadLog").prepend(zcontent);
                            }
                        }
                }
        });
}

// 閫夐」鍗� seo tab ---------------
function seoTab(obj){
        $(obj).hover(function(){
                var $this = $(this);
                if( $this.is(".tab-cur") ){
                        return false;
                }
                var tab_show_height = $this.siblings(".tab-show").height();
                delayTime = setTimeout(function() {
                        $this.siblings(".tab-content").css({ position : "absolute",top : "-9999em"}).removeClass("tab-show").end()
                                .next(".tab-content").css({position : "static",height : tab_show_height}).addClass("tab-show").end()
                                .addClass("tab-cur").siblings(".tab-title").removeClass("tab-cur");
                },150)
        },function(){
                if( !$(this).is(".tab-cur") ){
                        clearTimeout(delayTime);
                }
        });
}

// 2015-07-08
var ELECFANS_HOST = window.location.host;
var ELECFANS_DOMAIN_ARR = ELECFANS_HOST.split('.');
var ELECFANS_DOMAIN_LEN = ELECFANS_DOMAIN_ARR.length;
var ELECFANS_DOMAIN = ELECFANS_DOMAIN_ARR[(ELECFANS_DOMAIN_LEN-2)]+'.'+ELECFANS_DOMAIN_ARR[(ELECFANS_DOMAIN_LEN-1)];
var ELECFANS_BBS = 'http://bbs.'+ELECFANS_DOMAIN;
var ELECFANS_HOME = 'http://home.'+ELECFANS_DOMAIN;
//瀹氫箟鐧诲綍寮瑰嚭妗嗏€斺€旈棬鎴锋柊鐗堢櫥褰曟
function LoginDialog(options) {
    this.top = options.top || "30%";
    this.width = options.width || 370;
    this.height = options.height || 410;
    this.tipContent = options.tipContent || "";
}

var cqm_login = '';
cqm_login += '<div class="other-Login"><p><a class="other-login-link sina-login-link" target="_self" href="/thirdparty/weibo/index.php">浣跨敤寰崥璐﹀彿鐧诲綍</a></p><p><a class="other-login-link qq-login-link" target="_self" href="/thirdparty/qq/login.php">浣跨敤QQ璐﹀彿鐧诲綍</a></p></div>';
cqm_login += '<div class="login-form">';
cqm_login += '<span class="login-line">鎴栬€�</span>';
cqm_login += '<form method="post" action="/member/index_do_ajax.php" name="userlogin" id="J_LoginForm" autocomplete="off">';
cqm_login += '<fieldset>';
cqm_login += '<legend>鐢ㄦ埛鐧诲綍</legend>';
cqm_login += '<input type="hidden" name="fmdo" value="login" />';
cqm_login += '<input type="hidden" name="dopost" value="login" />';
cqm_login += '<div class="login-form-tip">6-36浣嶈嫳鏂囨垨鏁板瓧锛屽尯鍒嗗ぇ灏忓啓</div>';
cqm_login += '<div class="login-form-item">';
cqm_login += '<input class="login-input login-input-username" type="text" id="username" name="userid" placeholder="璇疯緭鍏ョ敤鎴峰悕"/>';
cqm_login += '</div>';
cqm_login += '<div class="login-form-item">';
cqm_login += '<input class="login-input" type="password" id="password" name="pwd" maxlength="100"  placeholder="璇疯緭鍏ュ瘑鐮�"/>';
cqm_login += '</div>';
cqm_login += '<div class="btn-area login-btn-area group">';
cqm_login += '<span class="btn-hasLoading-wrap"><span class="loading"><img src="http://skin.elecfans.com/images/loading.gif" /></span><button type="submit" id="J_LoginSubmit" class="btn login-submit">鐧� 褰�</button></span> <span style="font-size:14px;display:inline-block;margin-left:20px;"><a href="' + ELECFANS_BBS + '/member.php?mod=reg" target="_blank" style="text-decoration:underline;margin-right:10px;color:#1ea3e4;float:left;margin-top:10px;">娉ㄥ唽</a>  <a rel="nofollow" target="_self" class="forgetPw" href="javascript:;" style="text-decoration:underline;margin-left:10px;">鎵惧洖瀵嗙爜</a></span>';
cqm_login += '</div>';
cqm_login += '</fieldset>';
cqm_login += '</form>';
cqm_login += '</div>';

LoginDialog.prototype = {
    //寮瑰嚭瀵硅瘽妗嗭紝鍔犺浇涓姸鎬�...
    show: function() {
        //鐧诲綍琛ㄥ崟DOM
        var loginForm_dom = cqm_login;
        //瀵硅瘽妗咲OM
        var html = '';
        html += '<div class="dialog1">';
        html += '<div class="dialog-hd1" id="J_DialogTitle">鐧� 褰�</div>';
        html += '<div class="dialog-bd1" id="J_DialogContent">';
        html += loginForm_dom;
        html += '</div>';
        html += '<div class="close-dialog1">X</div>';
        html += '</div>';
        //blockUI ----------------------
        $.blockUI({
            message: html, //瀵硅瘽妗咲OM
            css: {
                top: "12%",
                width: this.width + "px",
                height: this.height + "px",
                marginLeft: "-" + this.width / 2 + "px",
                left: "50%",
                color: "#000",
                border: "8px solid #d8d8d8",
                background: "#fff",
                borderRadius: "5px"
            },
            overlayCSS: {
                cursor: "pointer",
                backgroundColor: '#111',
                opacity: 0.3
            },
            showOverlay: true,
            fadeIn: 200,
            fadeOut: 400,
            onBlock: function() {
                $(".blockOverlay,.close-dialog1").attr('title', '鐐瑰嚮鍏抽棴').on('click', $.unblockUI);
            }
        });
        //琛ㄥ崟楠岃瘉
        var $username = $("#username");
        var $password = $("#password");
        var $loading = $("span.loading");
        //鎻愮ず鏂囨湰
        var username_empty = '璇疯緭鍏ヨ处鍙�';
        var username_err = '璐﹀彿涓嶅瓨鍦�';
        var password_err = '瀵嗙爜閿欒,璇烽噸鏂拌緭鍏�';
        var password_lenErr = '脳瀵嗙爜涓嶇鍚堣姹傦細<span class="grey9">6-36浣�,鑻辨枃鎴栨暟瀛�</span>';
        var password_empty = '璇疯緭鍏ョ櫥褰曞瘑鐮侊細<span class="grey9">6-36浣�,鑻辨枃鎴栨暟瀛�</span>';
        //琛ㄥ崟楠岃瘉 End
        //鐧诲綍閿欒鎻愮ず
        function tipErr(obj, text, display) {
            var display = display ? display : "block";
            $("div.login-form-tip").html(text).css({
                "display": display,
                "color": "#c00"
            });
        }
        //琛ㄥ崟鎻愪氦
        var successTip = this.successTip;
        var tipContent = this.tipContent;
        /*ajax鐧诲綍*/
        $("#J_LoginForm").ajaxForm({
            beforeSubmit: loginRequest,
            success: function(responseText, statusText) {
                //闅愯棌loading
                $loading.hide();
                if (responseText == "鐢ㄦ埛鍚嶄笉瀛樺湪") {
                    tipErr($username, username_err);
                    $username.focus().select();
                    return false;
                }
                if (responseText == "瀵嗙爜閿欒") {
                    tipErr($password, password_err);
                    $password.focus().select();
                    return false;
                }
                //鎵ц鐧诲綍妫€鏌�
                $("#J_Login").html('姝ｅ湪鍔犺浇锛岃绋嶅悗...');
                CheckLogin();
                $(".blockPage").animate({
                    "height": "190px"
                }, 200, function() {
                    var successTip_dom = '';
                    successTip_dom += '<div class="success-tip">';
                    successTip_dom += '<h3 class="tip-title">鐧诲綍鎴愬姛</h3>';
                    successTip_dom += '<div class="tip-content">' + tipContent + '</div>';
                    successTip_dom += '</div>';
                    //鏀瑰彉瀵硅瘽妗嗘爣棰�
                    $("#J_DialogTitle").html('鎻愮ず');
                    //鏀瑰彉瀵硅瘽妗嗗唴瀹�
                    $("#J_DialogContent").html(successTip_dom);
                    setTimeout(function() {
                        $.unblockUI();
                    }, 1400);
                });
                //鎵ц鍚屾鐧诲綍js
                eval("urlarr = " + responseText);
                for (var i = 0; i < urlarr.length; i++) {
                    $.getScript(urlarr[i]);
                }
            }   //end success:function
        }); //end ajaxForm

        //鎻愪氦鍓嶉獙璇�
        function loginRequest(formData, jqForm, options) {
            //璐﹀彿
            var usernameVal = $username.val();
            if (usernameVal.length > 0) {
                tipErr($(this), "", "none");
            } else {
                tipErr($username, username_empty);
                $username.focus().select();
                return false;
            }
            //瀵嗙爜
            var len = $password.val().length; //鑾峰彇瀵嗙爜闀垮害
            if (len > 0) {
                if (len < 3 || len > 36) { //瀵嗙爜闀垮害涓嶈兘灏忎簬6锛屽ぇ浜�36
                    tipErr($password, password_lenErr);
                    $password.focus().select();
                    return false;
                } else {
                    tipErr($password, "", "none");
                }
            } else {
                tipErr($password, password_empty);
                $password.focus().select();
                return false;
            }
            //鏄剧ずloading
            $loading.show();
            var queryString = $.param(formData);
            return true;
        }

        $(".forgetPw").click(function() {
            $(".blockPage").animate({
                "height": "300px"
            }, 200, function() {
                var forgot_password = '';
                forgot_password += '<form method="post" autocomplete="off" id="lostpwform_LogH3" class="cl" onsubmit="" action="' + ELECFANS_BBS + '/member.php?mod=sendmailapi&apiname=getpassword&format=jsonp">';
                forgot_password += '<div class="lostpw-form">';
                forgot_password += '<div class="login-form-item">璇疯緭鍏ユ偍娉ㄥ唽鏃跺～鍐欑殑閭鍦板潃锛屾垜浠細鍙戦€佸瘑鐮侀噸缃偖浠剁粰鎮細</div>';
                forgot_password += '<div class="login-form-item">';
                forgot_password += '<input type="text" name="email" id="lostpw_email" size="30" value="" tabindex="1" class="login-input login-input-email">';
                forgot_password += '</div>';
                forgot_password += '<div class="login-form-item" id="lostpwd-username-box" style="display:none;">';
                forgot_password += '<input type="text" name="username" id="lostpw_username" size="30" value="" tabindex="1" class="login-input login-input-username">';
                forgot_password += '</div>';
                forgot_password += '<div class="login-form-item">';
                forgot_password += '<button class="btnnew lostpw-submit" type="submit" id="lostpwsubmit" name="lostpwsubmit" value="true">鎻愪氦</button> <a class="ml20" id="back-login-link" href="javascript:;" target="_self">鎯宠捣瀵嗙爜浜�</a>';
                forgot_password += '</div>';
                forgot_password += '</div>';
                forgot_password += '</form>';
                //鏀瑰彉瀵硅瘽妗嗘爣棰�
                $("#J_DialogTitle").html('閲嶇疆鐧诲綍瀵嗙爜');
                //鏀瑰彉瀵硅瘽妗嗗唴瀹�
                $("#J_DialogContent").html(forgot_password);

                $("#back-login-link").click(function() {
                    $(".blockPage").animate({
                        "height": "410px"
                    }, 200, function() {
//                      var dialog = new LoginDialog({});
//                      dialog.show();
$.ssoDialogLogin();//鍗曠偣鐧诲綍
                        return false;
                    });
                });

                function getpwdrequest(formData, jqForm, options) {
                    lostpwsubmit.disabled = true;
                    return true;
                }

                $("#lostpwform_LogH3").ajaxForm({
                    beforeSubmit: getpwdrequest,
                    dataType: 'jsonp',
                    success: function(responseText, statusText) {
                        lostpwsubmit.disabled = false;
                        if (responseText.status == 'successed') {
                            $("#J_DialogContent").html("鎵惧洖瀵嗙爜鐨勯偖浠跺彂閫佹垚鍔�");
                            setTimeout($.unblockUI, 2000);
                        } else {
                            if (responseText.needusername == '1') {
                                alert('璇ラ偖绠遍渶瑕佸～鍐欑敤鎴峰悕');
                                $('#lostpwd-username-box').show();
                            } else {
                                alert(responseText.msg);
                            }
                        }
                    }
                });
            });
        });
    }   //End Show
}   //End Login.Dialog prototype


$(function(){
     var getHost=window.location.host;
         getHost=getHost.substring(getHost.indexOf("."),getHost.length);//鑾峰緱浜岀骇鍩熷悕
    /*
     * 鎻掑叆鍗曠偣鐧诲綍JS
     */
    var setHost="https://passport"+getHost;//璁剧疆鍩熷悕
    var script= document.createElement('script');
        script.type= 'text/javascript';
        script.src= setHost+ '/public/pc/js/sso.passport.js';
        script.setAttribute("id","sso_script");
        script.setAttribute("data-ssoSite", setHost);
        script.setAttribute("data-ssoReferer","");
        script.setAttribute("data-ssoSiteid","11");
        var body=document.getElementsByTagName("body").item(0);
        body.appendChild(script);
    /*
     * 鐢ㄦ埛瀹屽杽璧勬枡椤�
     */
    /*var setHost="http://bbs"+getHost;//璁剧疆鍩熷悕
    var script= document.createElement('script');
        script.type= 'text/javascript';
        script.src= setHost+ '/static/js/organizing/js/organizing.js';
        var body=document.getElementsByTagName("body").item(0);
        body.appendChild(script);*/
});

$(function(){
    // 璧勬枡涓嬭浇璇︽儏椤甸潰鍙虫爮娣诲姞浜岀淮鐮�
    if ($('#page').is('.data-channel')) {
        $('body').append('<div style="left:1220px;position:fixed;bottom:200px;display:none;" id="pfwx"><img src="http://skin.elecfans.com/images/wx_right.jpg" alt="寰俊鎵竴鎵紝鍏虫敞鐢靛瓙鍙戠儳鍙�"></div>');
        $(window).scroll(function() {
            var scrollTop = $(window).scrollTop();
            if (($('#pfwx').length > 0) || (scrollTop < 0)) {
                function resizewx() {
                    var pwidth = $(window).width();
                    if (pwidth < 1110) {
                        $('#pfwx').css('display', 'none');
                    } else {
                        var rwidth = 1020 + (pwidth - 1000) / 2;
                        $('#pfwx').css('left', rwidth);
                        $('#pfwx').css('display', 'block');
                    }
                }
                resizewx();
                $(window).resize(function() {
                    resizewx();
                });
            }
        });
    }
});
/*涓婁紶璧勬枡涓嶉€氳繃鐐瑰嚮鎻愮ず*/
$(".upErrTip").click(function(){
    var tipFont=$(this).attr('data-title');
    layer.tips('<span style="color: #666;font-size: 12px;">'+tipFont+'</span>',$(this),{
        tips:[2,'#fff'],
        time: 3000
    });
    $(".layui-layer-tips").css('top',parseInt($(".layui-layer-tips").css('top'))-4+'px');
    $(".layui-layer-TipsT").hide();
    $(".layui-layer-TipsG").hide();
    $(".layui-layer-content").css({
        'box-shadow':'none',
        'border':'1px solid #666',
        'padding':'0px 6px',
        'line-height':'18px'
    })
});

//浼樻儬鍒告帹骞垮箍鍛�
(function($){
    function getCookie(name)
    {
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }
    var getCounponCook = getCookie('couponAd');
    setTimeout(function(){
        if($("#coupon-ad").length==0){
            $("body").append(' <div id="coupon-ad" style="background-color:#fff;cursor:pointer;width: 260px;height: 220px;position: fixed;right: 0px;bottom: -23px;display: none;z-index: 2;">'+
                '<div style="position: relative"><a id="couponClose" style="position: absolute;display: block;width: 16px;height: 16px;right: 0px;top: 0px;z-index: 2;"></a></div>'+
                '<img src="/skin-2012/images/live_ad.png?20170707" />'+
                '</div>');

            if(getCounponCook==1||$("#log-tip1").length>0){
                $("#coupon-ad").remove();
            }
            $("#pfwx").remove();


            $("#coupon-ad").click(function(){
                window.open("http://t.elecfans.com/3169.html?elecfans_trackid=pcyxj");
            });
            $("#couponClose").click(function(e){
                e.stopPropagation();
                var Days = 1;
                var exp = new Date();
                exp.setTime(exp.getTime() + Days*24*60*60*1000);
                document.cookie = 'couponAd' + "="+ '1' + ";expires=" +  exp.toGMTString();
                $("#coupon-ad").remove();
            });
            $(window).scroll(function(){
                if($(window).scrollTop()>200){
                    if($("#fixedWebinar").length>0){
                        $("#coupon-ad").remove();
                    }else{
                        $("#coupon-ad").fadeIn();
                    }
                }else{
                    $("#coupon-ad").fadeOut()
                }
            });
        }

    },2500)
})(jQuery);