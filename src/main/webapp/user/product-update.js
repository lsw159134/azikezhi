$(document).ready(function () {

    var count = 1;
    $("#add").on("click", function () {
        $("#add").unbind("click");
        layer.msg("一次最多只能添加三条,请刷新后添加");

        $(this).parents("tr").after('<tr class="text-c s">' +
            '<td><input type="text" class="input-text product s" placeholder="请输入产品" name="product"  /></td>' +
            '<td><input type="text" class="input-text manufacturer" placeholder="请输入生产厂商" name="manufacturer"  /></td>' +
            '<td><input type="text" class="input-text encapsulation" placeholder="请输入封装" name="encapsulation"  /></td>' +
            '<td><input type="text" class="input-text lotnumber" placeholder="请输入批号" name="lotnumber"  /></td>' +
            '<td><input type="text" class="input-text price" placeholder="请输入价格" name="price"  /></td>' +
            '<td><input type="text" class="input-text explain" placeholder="请输入交易说明" name="explain"  /></td>' +
            '<td><select name="goodinstock" class="goodinstock">' +
            '<option value="1">有现货</option>' +
            '<option value="0">没有现货</option>' +
            '</select></td>' +
            '<td><select class="quality" name="quality">' +
            '<option value="1">非原装</option>' +
            '<option value="2">国产仿制</option>' +
            '<option value="3">原装</option>' +
            '</select></td>' +
            '<td class="left-border"></td></tr></span>');
    });

    $("#submit").on("click", "input", function () {
        var Jproduct = new Array();
        $(".product").each(function () {
            Jproduct.push($(this).val())
        });
        var Jmanufacturer = new Array();
        $(".manufacturer").each(function () {
            Jmanufacturer.push($(this).val())
        });
        var Jencapsulation = new Array();
        $(".encapsulation").each(function () {
            Jencapsulation.push($(this).val())
        });
        var Jlotnumber = new Array();
        $(".lotnumber").each(function () {
            Jlotnumber.push($(this).val())
        });
        var Jprice = new Array();
        $(".price").each(function () {
            Jprice.push($(this).val())
        });
        var Jexplain = new Array();
        $(".explain").each(function () {
            Jexplain.push($(this).val())
        });
        var Jnumber = new Array();
        $(".number").each(function () {
            Jnumber.push($(this).val())
        });
        var Jquality = new Array();
        $(".quality").each(function () {
            Jquality.push($(this).val())
        });
        var Jgoodinstock = new Array();
        $(".goodinstock").each(function () {
            Jgoodinstock.push($(this).val())
        });

        if (Jprice.length > 1) {
            for (var i = 0; i < Jprice.length; i++) {
                if (Jprice[i] == 0 || isNaN(Jprice[i])) {
                    layer.msg("请填写正确的价格!");
                    return false;
                }
            }
        } else {
            if (Jprice == 0 || isNaN(Jprice)) {
                layer.msg("请填写正确的价格!");
                return false;
            }
        }

        var isgoodsinstock;
        if (Jgoodinstock.length > 1) {
            isgoodsinstock = new Array();
            for (var i = 0; i < Jgoodinstock.length; i++) {
                if (Jgoodinstock[i] == 0) {
                    isgoodsinstock.push("0");
                } else if (Jgoodinstock[i] == 1) {
                    isgoodsinstock.push("1");
                } else {
                    layer.msg("出错,请稍候添加!");
                    return false;
                }
            }
        } else {
            if (Jgoodinstock == 0) {
                isgoodsinstock = "0";
            } else if (Jgoodinstock == 1) {
                isgoodsinstock = "1";
            } else {
                layer.msg("出错,请稍候添加!");
                return false;
            }
        }

        var quality;
        if (Jquality.length > 1) {
            quality = new Array();
            for (var i = 0; i < Jquality.length; i++) {
                if (Jquality[i] == 1) {
                    quality.push("27");
                } else if (Jquality[i] == 2) {
                    quality.push("17");
                } else if (Jquality[i] == 3) {
                    quality.push("7");
                } else {
                    layer.msg("出错,请稍候添加!");
                    return false;
                }
            }
        } else {
            if (Jquality == 1) {
                quality = 27;
            } else if (Jquality == 2) {
                quality = 17;
            } else if (Jquality == 3) {
                quality = 7;
            } else {
                layer.msg("出错,请稍候添加!");
                return false;
            }
        }

        var str = "[";
        if (Jproduct.length > 1) {
            for (var i = 0; i < Jproduct.length; i++) {
                str += '{'
                    + '"product":"' + Jproduct[i]
                    + '","manufacturer":"' + Jmanufacturer[i]
                    + '","lotnumber":"' + Jlotnumber[i]
                    + '","price":' + Jprice[i]
                    + ',"description":"' + Jexplain[i]
                    + '","encapsulation":"' + Jencapsulation[i]
                    + '","quality":"' + quality[i]
                    + '","isgoodsinstock":"' + isgoodsinstock[i]
                    + '"}';
                if (i != Jproduct.length - 1) {
                    str += ",";
                }
            }
        } else {
            str += '{'
                + '"product":"' + Jproduct
                + '","manufacturer":"' + Jmanufacturer
                + '","lotnumber":"' + Jlotnumber
                + '","price":' + Jprice
                + ',"description":"' + Jexplain
                + '","encapsulation":"' + Jencapsulation
                + '","quality":"' + quality
                + '","isgoodsinstock":"' + isgoodsinstock
                + '"}';
        }
        str += "]";

        var productLevel = 1;

        var Jdescription = $("#description").val();
        var Jsupplier = $("#supplier").val();
        var supplieruid = $("#supplieruid").val();

        $.ajax({
            url: "productUpload",
            type: 'post',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: true,
            data: {
//				Pdescription: Jdescription,
//				Psupplier: Jsupplier,
                count: count,
                level: productLevel,
                Psupplieruid: supplieruid,
                product: str
//				product: Jproduct,
//				manufacturer: Jmanufacturer,
//				lotnumber: Jlotnumber,
//				price: Jprice,
//				description: Jexplain
            },
            success: function (data) {
                layer.msg(data.msg);
            }
        });
    });
});