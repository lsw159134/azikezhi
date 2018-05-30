$(document).ready(function(){

    // //---------- Ajax换一批进行评论  -------------
    //
    // $("#change").on("click", function(){
    //     $.ajax({
    //         url: "change",
    //         type: 'post',
    //         dataType: "json",
    //         data: {
    //         },
    //         success: function(data) {
    //             var data = data.supplier;
    //             $(".newLeft").remove();
    //             $(".newRirght").remove();
    //             for(var i = 0; i < data.length; i++){
    //                 if(i % 2 == 0){
    //                     $("#new").after("<div class='newLeft'><a href='searchSupplierResult?id="+data[i].supplieruuid+"'>"+data[i].suppliername+"</a></div>");
    //                 }else{
    //                     $("#new").after("<div class='newRirght'><a href='searchSupplierResult?id="+data[i].supplieruuid+"'>"+data[i].suppliername+"</a></div>");
    //                 }
    //             }
    //         }
    //     });
    // });
    // //----------- 正则  -------------
    // $("p").each(function(){
    //     var comment = $(this).html();
    //     $(this).replaceWith(comment);
    // });

    var a = $("a");
    for(var i = 0; i < a.length; i++) {
        var hr = a[i].href;
        var index = hr.indexOf("product=");
        var url = null;
        if(index != -1){
            var product;
            url = hr.substr(0, index);
            product = hr.substr(index+8, hr.length);
            product = encodeURIComponent(product);
            url = url + "product=" + product;
            a[i].setAttribute("href", url);
            url = null;
        }
        // a[i].attr("href", hr);
    }

    $("#product button").on("click", function(){
        var val = $(this).prev().val();

        $.ajax({
            type: "POST",
            url: "addSimpleProduct",
            data: {
                product: val
            },
            success: function(data){
                layer.msg(data.msg);
            },
            error: function(){
                layer.msg("添加失败!");
            }
        });

    });

    $("#product").on("click","button",function(){

        var product = $("#inputproduct").val();
        if(product.length < 1){
            layer.alert("请输入需要我们进行备货的型号!");
            return false;
        }
        // $.ajax({
        //    url:'',
        //     type:'post',
        //     async:false,
        //     data:product,
        //     timeout: 5000,
        //     dataType:'JSON',
        //     success:function(data){
        //         layer.alert(data.msg);
        //     }
        // });

    });

    //----------- 文字滚动  -------------
    var doscroll1 = function(){
        var $parent = $(".list1");
        var $first = $parent.find("li:first");
        var height = $first.height();
        $first.animate({
            marginTop: -height + 'px'
        }, 1000, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };
    setInterval(function(){doscroll1()}, 3000);


    var doscroll2 = function(){
        var $parent = $(".list2");
        var $first = $parent.find("li:first");
        var height = $first.height();
        console.log(height);
        $first.animate({
            marginTop: -height + 'px'
        }, 1000, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };
    setInterval(function(){doscroll2()}, 3000);


    var doscroll3 = function(){
        var $parent = $(".list3");
        var $first = $parent.find("li:first");
        var height = $first.height();
        console.log(height);
        $first.animate({
            marginTop: -height + 'px'
        }, 1000, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };
    setInterval(function(){doscroll3()}, 3000);

    var doscroll4 = function(){
        var $parent = $(".list4");
        var $first = $parent.find("li:first");
        var height = $first.height();
        $first.animate({
            marginTop: -height + 'px'
        }, 1000, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };
    setInterval(function(){doscroll4()}, 3000);
});