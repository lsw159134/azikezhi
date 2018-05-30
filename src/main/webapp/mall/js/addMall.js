$(document).ready(function () {


    console.log($(".isPurchaseNumber").val());
    $(document).on("change", ".isPurchaseRestrictions", function(){

        var isPurchaseRestrictions = $(this).find("option:selected").text();
        if(isPurchaseRestrictions == '是'){
            $(this).parents("tr").find(".isPurchaseNumber").removeAttr("disabled");
        }
        var val = $(this).parents("tr").find(".isPurchaseNumber").val();
        if(isPurchaseRestrictions == '否'){
            $(this).parents("tr").find(".isPurchaseNumber").val(0);
            console.log(val);
            console.log($(this).parents("tr").find(".isPurchaseNumber").val());
        }
    });

    $("#add").on("click",function(){
        var a = '<tr><td><input type="file" name="img" class="img"></td>' +
            '<td><input type="text" name="product" class="product"></td>' +
            '<td><input type="text" name="encapsulation" class="encapsulation"></td>' +
            '<td><input type="text" name="brand" class="brand"></td>' +
            '<td><input type="text" name="price" class="price"></td>' +
            '<td>' +
            '<select name="isLookGoods" class="isLookGoods">' +
            '<option value="0">否</option>' +
            '<option value="1">是</option>' +
            '</select>' +
            '</td>' +
            '<td>' +
            '<select name="isPhotograph" class="isPhotograph">' +
            '<option value="0">否</option>' +
            '<option value="1">是</option>' +
            '</select>' +
            '</td>' +
            '<td>' +
            '<select name="isLockGoods" class="isLockGoods">' +
            '<option value="0">否</option>' +
            '<option value="1">是</option>' +
            '</select>' +
            '</td>' +
            '<td>' +
            '<select name="isNotIncrease" class="isNotIncrease">' +
            '<option value="0">否</option>' +
            '<option value="1">是</option>' +
            '</select>' +
            '</td>' +
            '<td>' +
            '<select name="isPurchaseRestrictions" class="isPurchaseRestrictions">' +
            '<option value="0">否</option>' +
            '<option value="1">是</option>' +
            '</select>' +
            '</td>' +
            '<td><input type="text" name="isPurchaseNumber" class="isPurchaseNumber" disabled></td>' +
            '<td><input type="text" name="aboutProduct1" class="aboutProduct1"></td>' +
            '<td><input type="text" name="aboutProduct2" class="aboutProduct2"></td>' +
            '<td><input type="text" name="aboutProduct3" class="aboutProduct3"></td>' +
            '<td><input type="text" name="explain1" class="explain1"></td>' +
            '<td><input type="text" name="explain2" class="explain2"></td>' +
            // '<td><input type="text" name="explain3" class="explain3"></td>' +
            // '<td><input type="text" name="explain4" class="explain4"></td>' +
            // '<td><input type="text" name="explain5" class="explain5"></td>' +
            '<td></td>' +
            '</tr>"' +
        $("table").append(a);
    });

    $("#submit").on("click",function(){
        console.log($(".isPurchaseNumber").val());
    });

});