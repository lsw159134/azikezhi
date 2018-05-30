$(document).ready(function(){

    $(".showResult").on("click", function () {
       var btn = $(this).find("button");
       if(btn.prop("disabled") == true){
            layer.msg("您没有登录,请登录后点击!");
       }
    });

    var addButton = 1;
    $("#add").on("click",function(){
        addButton ++;
        if(addButton > 3){
            return false;
        }
        var rowspan = $('#rowspan').html();
        $('#rowspan').remove();

        var str = '<tr><td rowspan="'+addButton+'" id="rowspan" >'+rowspan+'</td> ' +
            '<td><input type="text" placeholder="请输入型号" class="product"></td>' +
            '<td><input type="text" placeholder="请输入需求数量" class="number"></td> ' +
            '<td><input type="text" placeholder="请输入封装" class="encapsulation"></td> ' +
            '<td><input type="text" placeholder="请输入供应商名称" class="supplier"></td> ' +
            '<td><input type="text" placeholder="请输入供应商地址" class="address"></td> ' +
            '<td><input type="text" placeholder="请输入产品年份" class="year"></td>' +
            '<td><input type="text" placeholder="备注" class="remark"></td>' +
            '</tr>';
        console.log(str);
       $("table tbody:first").prepend(str);

    });

    $("#submit").on("click", function(){
        var time = getNowFormatDate();
        var select = $("tbody #rowspan select").val();
        var product = $("tbody .product");
        var number = $("tbody .number");
        var encapsulation = $("tbody .encapsulation");
        var supplier = $("tbody .supplier");
        var address = $("tbody .address");
        var remark = $("tbody .remark");
        var year = $("tbody .year");

        // alert(product.eq(0).val());
        for(var i = 0; i < product.length; i++){
            if(product.eq(i).val() == '' && number.eq(i).val() == '' && encapsulation.eq(i).val() == '' && supplier.eq(i).val()==''){
                layer.msg('请输入内容');
                return false;
            }
            var str = '<div>' +
                '<span class="showProduct">'+product.eq(i).val()+'</span>' +
                '<span class="showNumber">'+number.eq(i).val()+'</span>' +
                '<span class="showEncapsulation">'+encapsulation.eq(i).val()+'</span>' +
                '<span class="showSupplier">'+supplier.eq(i).val()+'</span>' +
                '<span class="showYear">'+year.eq(i).val()+'</span>' +
                '<span class="showActualsNumber">'+remark.eq(i).val()+'</span>' +
                '<span class="showTime">'+time+'</span>' +
                '<span class="showResult"><button disabled="disabled">处理结果</button></span>' +
                '</div>';
            $.ajax({
                type: 'post',
                async: 'true',
                url: 'addMember',
                dataType: 'json',
                contentType:'application/x-www-form-urlencoded;charset=utf-8',
                data:{
                    product: product.eq(i).val(),
                    submittime: time,
                    year: year.eq(i).val(),
                    number: number.eq(i).val(),
                    encapsulation: encapsulation.eq(i).val(),
                    supplier: supplier.eq(i).val(),
                    supplieraddress: address.eq(i).val(),
                    userRemark: remark.eq(i).val()
                },
                success: function (data){
                    if(data.code == 1){
                        $('#s').append(str);
                        layer.msg(data.result);
                    }else{
                        layer.msg(data.result);
                        return false;
                    }

                },
                error: function(data){
                    layer.msg("添加不成功,请重新添加!");
                    return false;
                }
            });
        }
    });

    $("#s span button").on("click", function () {
        var uid = $(this).find("span").data("uid");
        layer.open({
            type: 2,
            area: ['700px', '530px'],
            fixed: false, //不固定
            maxmin: true,
            content: 'showMemberResult?uid='+uid
        });
    });
});

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate + " " + date.getHours() + seperator2 + date.getMinutes();
    // var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
    //     + " " + date.getHours() + seperator2 + date.getMinutes()
    //     + seperator2 + date.getSeconds();
    return currentdate;
}
