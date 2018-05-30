$(document).ready(function () {

    $("#submit").on("click", function () {

        var product = $("input[name='product']").val();
        var brand = $("input[name='brand']").val();
        var encapsulation = $("input[name='encapsulation']").val();
        var number = $("input[name='number']").val();
        var tel = $("input[name='tel']").val();
        var address = $("input[name='address']").val();
        var year = $("select[name='year']").val();
        var quality = $("select[name='quality']").val();
        var uid = $("#uid").val();
        if(uid == null || uid == ""){
            layer.msg("你没有登录!");
            return false;
        }

        if(product == "" || brand == "" || encapsulation == "" || number == "" || tel == "" || address == "" || year == "" || quality == "") {
            layer.msg("数据都不能为空,请输入后再提交");
            return false;
        }

        $.ajax({
            type:"post",
            url:"addps",
            async:true,
            dataType: "json",
            data: {
                product: product,
                brand: brand,
                encapsulation: encapsulation,
                number: number,
                tel: tel,
                address: address,
                year: year,
                quality: quality,
                useruid: uid,
                state: "代购中"
            }, success : function(data){
                layer.msg(data.msg);
            },error : function () {
                layer.msg("添加失败,请刷新后添加!");
            }
        })

    });


    var doscroll = function(){
        var $parent = $("#hothelpbuy");
        var $first = $parent.find("tbody tr:first");
        var height = $first.height();

        $first.animate({
            marginTop: -height + 'px'
        }, 500, function(){
            $first.css('marginTop', 0).appendTo($parent);
        });
    };

    setInterval(function(){doscroll()}, 3000);

})
