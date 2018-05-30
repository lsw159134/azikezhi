$(document).ready(function(){

    $(".addr").on("click",function(){
       layer.alert("地址:深圳市福田区华强广场C座23J<br\><span id='msg'>本公司不支持现金支付,只支持支付宝和微信</span>");
    });

    $(".lo").on("mouseover",function () {
        var t = $(this).data("title");
        layer.tips(t, this, {
            tips: 3
        });
    });

    $("#noProduct button").on("click", function(){
        var product = $(this).parents("#noProduct").find("#addproduct");
        var number = $(this).parents("#noProduct").find("#addnumber");
        if(!isNaN(number)){
           layer.msg("数量请写数字");
           layer.msg(isNaN(number));
           return false;
        }
        $.ajax({
            type: "POST",
            url: "addSimpleProduct",
            data:{
                product: product.val(),
                number: number.val()
            },
            success: function(data){
                layer.msg(data.msg);
            },
            error: function(data){
                layer.msg("添加失败!");
            }
        });

    });

});