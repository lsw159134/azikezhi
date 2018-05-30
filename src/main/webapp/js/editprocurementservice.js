$(document).ready(function () {
    
    $(".submit").on("click", function () {
        var product = $(this).parents("tr").find(".product").val();
        var brand = $(this).parents("tr").find(".brand").val();
        var encapsulation =  $(this).parents("tr").find(".encapsulation").val();
        var number = $(this).parents("tr").find(".number").val();
        var tel = $(this).parents("tr").find(".tel").val();
        var address = $(this).parents("tr").find(".address").val();
        var year = $(this).parents("tr").find(".year").val();
        var quality = $(this).parents("tr").find(".quality").val();
        var realyear = $(this).parents("tr").find(".realyear").val();
        var uid = $(this).parents("tr").find(".uid").val();
        var price  = $(this).parents("tr").find(".price").val();
        var state = $(this).parents("tr").find(".state").val();

        $.ajax({
            type:"post",
            url:"editps",
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
                realyear: realyear,
                procurementserviceuid: uid,
                price: price,
                state: state
            },success: function (data) {
                layer.msg(data.msg);
            },error: function () {
                layer.msg("失败");
            }
        })
    });
    
});