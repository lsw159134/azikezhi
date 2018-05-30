// $(document).ready(function() {
//
// 	// layer.msg("请选择添加类型");
//
// 	var count = 1;
// 	var productLevel;
// 	// $("#choose").on("click", "span", function() {
// 	// 	productLevel = $(this).attr("id");
// 	// 	if(productLevel == 'addExcellent') {
// 	// 		count = parseInt(excellent) + 1;
// 	// 		$(".s").parents("tr").remove();
// 	// 	}else if(productLevel == 'addGood'){
// 	// 		count = parseInt(good) + 1;
// 	// 		$(".s").parents("tr").remove();
// 	// 	}else if(productLevel == 'addAverage'){
// 	// 		count = parseInt(average) + 1;
// 	// 		$(".s").parents("tr").remove();
// 	// 	}
// 	// 	$(".text-c input").attr("disabled", false);
// 	// 	$("#submit input").attr("disabled", false);
// 	// 	$("#class").html($(this).html());
// 	// });
//
// 	// var excellent = $("#excellent").val();
// 	// var good = $("#good").val();
// 	// var average = $("#average").val();
// 	$("#add").on("click", function() {
// 	// 	if(productLevel == undefined) {
// 	// 		layer.msg("请选择添加类型");
// 	// 		return false;
// 	// 	}
// 	// 	if(productLevel == 'addExcellent' && count > 20) {
// 	// 		layer.msg("您的数据己添加超过20条");
// 	// 		return false;
// 	// 	}else if(productLevel == 'addGood' && count > 50){
// 	// 		layer.msg("您的数据己添加超过50条");
// 	// 		return false;
// 	// 	}else if(productLevel == 'addAverage' && count > 1000){
// 	// 		layer.msg("您的数据己添加超过1000条");
// 	// 		return false;
// 	// 	}
// 	// 	if(productLevel == 'addExcellent') {
// 	// 		count += 1;
// 	// 	}else if(productLevel == 'addGood'){
// 	// 		count += 1;
// 	// 	}else if(productLevel == 'addAverage'){
// 	// 		count += 1;
// 	// 	}
//         console.log(count);
//         if(count > 1){
//             console.log(count);
//             $("#add").unbind("click");
//             layer.msg("一次最多只能添加三条,请刷新后添加");
//         }
//         count += 1;
// 		$(this).parents("tr").after('<tr class="text-c s">'+
// 			'<td><input type="text" class="input-text product s" placeholder="请输入产品" name="product"  /></td>'+
// 			'<td><input type="text" class="input-text manufacturer" placeholder="请输入生产厂商" name="manufacturer"  /></td>'+
// 			'<td><input type="text" class="input-text encapsulation" placeholder="请输入封装" name="encapsulation"  /></td>'+
// 			'<td><input type="text" class="input-text lotnumber" placeholder="请输入批号" name="lotnumber"  /></td>'+
// 			'<td><input type="text" class="input-text price" placeholder="请输入价格" name="price"  /></td>'+
// 			'<td><input type="text" class="input-text explain" placeholder="请输入交易说明" name="explain"  /></td>'+
//             '<td><select name="goodinstock" class="goodinstock">'+
//             '<option value="1">有现货</option>'+
//             '<option value="0">没有现货</option>'+
//             '</select></td>'+
// 			'<td><select class="quality" name="quality">'+
//             '<option value="1">非原装</option>'+
//             '<option value="2">国产仿制</option>'+
//             '<option value="3">原装</option>'+
//             '</select></td>'+
// 			'<td class="left-border"></td></tr></span>');
// 	});
//
// 	$("#submit").on("click", "input", function(){
// 		var Jproduct;
// 		var Jmanufacturer;
// 		var Jencapsulation;
// 		var Jlotnumber;
// 		var Jprice;
// 		var Jexplain;
// 		var Jnumber;
// 		var Jquality;
// 		var Jgoodinstock;
//
//         if($(".price").length > 1){
//             Jproduct = new Array();
//             $(".product").each(function(){Jproduct.push($(this).val())});
//             Jmanufacturer = new Array();
//             $(".manufacturer").each(function(){Jmanufacturer.push($(this).val())});
//             Jencapsulation = new Array();
//             $(".encapsulation").each(function(){Jencapsulation.push($(this).val())});
//             Jlotnumber = new Array();
//             $(".lotnumber").each(function(){Jlotnumber.push($(this).val())});
//             Jprice = new Array();
//             $(".price").each(function(){Jprice.push($(this).val())});
//             Jexplain = new Array();
//             $(".explain").each(function(){Jexplain.push($(this).val())});
//             Jnumber = new Array();
//             $(".number").each(function(){Jnumber.push($(this).val())});
//             Jquality  = new Array();
//             $(".quality").each(function(){Jquality.push($(this).val())});
//             Jgoodinstock = new Array();
//             $(".goodinstock").each(function(){Jgoodinstock.push($(this).val())});
//
//             for(var i = 0; i < Jprice.length; i++){
//                 if(Jproduct[i] == "" || Jmanufacturer[i] == "" || Jencapsulation[i] == "" || Jlotnumber[i] == "" || Jexplain[i] == "" || Jnumber[i] == ""){
//                     layer.msg("所有内容都不能为空!");
//                     return false;
//                 }
//                 if(Jprice[i] == 0 || isNaN(Jprice[i])){
//                     layer.msg("请填写正确的价格!");
//                     return false;
//                 }
//             }
//         }else{
//             Jproduct = $(".product").val();
//             Jmanufacturer = $(".manufacturer").val();
//             Jencapsulation = $(".encapsulation").val();
//             Jlotnumber = $(".lotnumber").val();
//             Jprice = $(".price").val();
//             Jexplain = $(".explain").val();
//             Jnumber = $(".number").val();
//             Jquality = $(".quality").val();
//             Jgoodinstock = $(".goodinstock").val();
//             if(Jproduct  ==  "" || Jmanufacturer == "" || Jencapsulation == "" || Jlotnumber == "" || Jexplain == "" || Jnumber == ""){
//                 layer.msg("所有内容都不能为空!");
//                 return false;
//             }
//             if(Jprice == 0  || isNaN(Jprice)){
//                 layer.msg("请填写正确的价格!");
//                 return false;
//             }
//
//         }
//
// 		var isgoodsinstock;
// 		if(Jgoodinstock.length > 1){
// 		    isgoodsinstock = new Array();
// 		    for(var i = 0; i < Jgoodinstock.length; i++){
// 		        if(Jgoodinstock[i] == 0) {
//                     isgoodsinstock.push("0");
//                 }else if(Jgoodinstock[i] == 1){
// 		            isgoodsinstock.push("1");
//                 }else{
//                     layer.msg("出错,请稍候添加!");
//                     return false;
//                 }
//             }
//         }else{
// 		    if(Jgoodinstock == 0){
//                 isgoodsinstock = "0";
//             }else if(Jgoodinstock == 1){
//                 isgoodsinstock = "1";
//             }else{
//                 layer.msg("出错,请稍候添加!");
//                 return false;
//             }
//         }
//
// 		var quality;
// 		if($(".quality").length > 1){
// 		    quality = new Array();
// 			for(var i = 0; i < Jquality.length; i++) {
// 				if(Jquality[i] == 1){
// 					quality.push("27");
// 				}else if(Jquality[i] == 2){
// 					quality.push("17");
// 				}else if(Jquality[i] == 3){
// 					quality.push("7");
// 				}else{
// 					layer.msg("出错,请稍候添加!");
// 					return false;
// 				}
//             }
// 		}else{
//             if(Jquality == 1){
//                 quality = 27;
//             }else if(Jquality == 2){
//                 quality = 17;
//             }else if(Jquality == 3){
//                 quality = 7;
//             }else{
//                 layer.msg("出错,请稍候添加!");
//                 return false;
//             }
// 		}
//
// 		var str = "[";
// 		if($(".price").length > 1){
// 			for(var i = 0; i < Jproduct.length; i++){
// 				str += '{'
// 					+'"product":"'+Jproduct[i]
// 					+'","manufacturer":"'+ Jmanufacturer[i]
// 					+'","lotnumber":"'+ Jlotnumber[i]
// 					+'","price":'+ Jprice[i]
// 					+',"description":"'+ Jexplain[i]
// 					+'","encapsulation":"'+ Jencapsulation[i]
// 					+'","quality":"' + quality[i]
//                     +'","isgoodsinstock":"' + isgoodsinstock[i]
// 					+'"}';
// 				if(i != Jproduct.length - 1){
// 					str += ",";
// 				}
// 			}
// 		}else{
// 			str += '{'
// 				+'"product":"'+Jproduct
// 				+'","manufacturer":"'+ Jmanufacturer
// 				+'","lotnumber":"'+ Jlotnumber
// 				+'","price":'+ Jprice
// 				+',"description":"'+ Jexplain
// 				+'","encapsulation":"'+ Jencapsulation
//                 +'","quality":"' + quality
//                 +'","isgoodsinstock":"' + isgoodsinstock
// 				+'"}';
// 		}
// 		str+="]";
//
//         var productLevel = 1;
//
// 		var Jdescription = $("#description").val();
// 		var Jsupplier = $("#supplier").val();
// 		var supplieruid = $("#supplieruid").val();
//
// 		$.ajax({
// 			url: "productUpload",
// 			type: 'post',
// 			dataType: "json",
// 			contentType: "application/json; charset=utf-8",
// 			async: true,
// 			data: {
// //				Pdescription: Jdescription,
// //				Psupplier: Jsupplier,
// 				count: count,
// 				level: productLevel,
// 				Psupplieruid: supplieruid,
// 				product: str
// //				product: Jproduct,
// //				manufacturer: Jmanufacturer,
// //				lotnumber: Jlotnumber,
// //				price: Jprice,
// //				description: Jexplain
// 			},
// 			success: function(data) {
// 				layer.msg(data.msg);
//                 setTimeout("location.replace(location.href)", 1000);
//                 // location.replace(location.href);
// 			}
// 		});
//
// 	});
//
//
//
// });
$(document).ready(function() {

    // layer.msg("请选择添加类型");

    var count = 1;
    var productLevel;
    // $("#choose").on("click", "span", function() {
    // 	productLevel = $(this).attr("id");
    // 	if(productLevel == 'addExcellent') {
    // 		count = parseInt(excellent) + 1;
    // 		$(".s").parents("tr").remove();
    // 	}else if(productLevel == 'addGood'){
    // 		count = parseInt(good) + 1;
    // 		$(".s").parents("tr").remove();
    // 	}else if(productLevel == 'addAverage'){
    // 		count = parseInt(average) + 1;
    // 		$(".s").parents("tr").remove();
    // 	}
    // 	$(".text-c input").attr("disabled", false);
    // 	$("#submit input").attr("disabled", false);
    // 	$("#class").html($(this).html());
    // });

    // var excellent = $("#excellent").val();
    // var good = $("#good").val();
    // var average = $("#average").val();
    // $("#add").on("click", function() {
    // // 	if(productLevel == undefined) {
    // // 		layer.msg("请选择添加类型");
    // // 		return false;
    // // 	}
    // // 	if(productLevel == 'addExcellent' && count > 20) {
    // // 		layer.msg("您的数据己添加超过20条");
    // // 		return false;
    // // 	}else if(productLevel == 'addGood' && count > 50){
    // // 		layer.msg("您的数据己添加超过50条");
    // // 		return false;
    // // 	}else if(productLevel == 'addAverage' && count > 1000){
    // // 		layer.msg("您的数据己添加超过1000条");
    // // 		return false;
    // // 	}
    // // 	if(productLevel == 'addExcellent') {
    // // 		count += 1;
    // // 	}else if(productLevel == 'addGood'){
    // // 		count += 1;
    // // 	}else if(productLevel == 'addAverage'){
    // // 		count += 1;
    // // 	}
    //        console.log(count);
    //        if(count > 1){
    //            console.log(count);
    //            $("#add").unbind("click");
    //            layer.msg("一次最多只能添加三条,请刷新后添加");
    //        }
    //        count += 1;
    // 	$(this).parents("tr").after('<tr class="text-c s">'+
    // 		'<td><input type="text" class="input-text product s" placeholder="请输入产品" name="product"  /></td>'+
    // 		'<td><input type="text" class="input-text manufacturer" placeholder="请输入生产厂商" name="manufacturer"  /></td>'+
    // 		'<td><input type="text" class="input-text encapsulation" placeholder="请输入封装" name="encapsulation"  /></td>'+
    // 		'<td><input type="text" class="input-text lotnumber" placeholder="请输入批号" name="lotnumber"  /></td>'+
    // 		'<td><input type="text" class="input-text price" placeholder="请输入价格" name="price"  /></td>'+
    // 		'<td><input type="text" class="input-text explain" placeholder="请输入交易说明" name="explain"  /></td>'+
    //            '<td><input type="text" class="input-text goodinstock" placeholder="请输入数量" name="isgoodsinstock"/></td>'+
    // 		'<td><select class="quality" name="quality">'+
    //            '<option value="1">非原装</option>'+
    //            '<option value="2">国产仿制</option>'+
    //            '<option value="3">原装</option>'+
    //            '</select></td>'+
    // 		'<td class="left-border"></td></tr></span>');
    // });

    $("#submit").on("click", "input", function(){
        var Jproduct;
        var Jmanufacturer;
        var Jencapsulation;
        var Jlotnumber;
        var Jprice;
        var Jexplain;
        var Jnumber;
        var Jquality;
        var Jgoodinstock;

        if($(".price").length > 1){
            Jproduct = new Array();
            $(".product").each(function(){Jproduct.push($(this).val())});
            Jmanufacturer = new Array();
            $(".manufacturer").each(function(){Jmanufacturer.push($(this).val())});
            Jencapsulation = new Array();
            $(".encapsulation").each(function(){Jencapsulation.push($(this).val())});
            Jlotnumber = new Array();
            $(".lotnumber").each(function(){Jlotnumber.push($(this).val())});
            Jprice = new Array();
            $(".price").each(function(){Jprice.push($(this).val())});
            Jexplain = new Array();
            $(".explain").each(function(){Jexplain.push($(this).val())});
            Jnumber = new Array();
            $(".number").each(function(){Jnumber.push($(this).val())});
            Jquality  = new Array();
            $(".quality").each(function(){Jquality.push($(this).val())});
            Jgoodinstock = new Array();
            $(".goodinstock").each(function(){Jgoodinstock.push($(this).val())});

            for(var i = 0; i < Jprice.length; i++){
                if(Jproduct[i] == "" || Jmanufacturer[i] == "" || Jencapsulation[i] == "" || Jlotnumber[i] == "" || Jexplain[i] == "" || Jnumber[i] == ""){
                    layer.msg("所有内容都不能为空!");
                    return false;
                }
                if(Jprice[i] == 0 || isNaN(Jprice[i])){
                    layer.msg("请填写正确的价格!");
                    return false;
                }
            }
        }else{
            Jproduct = $(".product").val();
            Jmanufacturer = $(".manufacturer").val();
            Jencapsulation = $(".encapsulation").val();
            Jlotnumber = $(".lotnumber").val();
            Jprice = $(".price").val();
            Jexplain = $(".explain").val();
            Jnumber = $(".number").val();
            Jquality = $(".quality").val();
            Jgoodinstock = $(".goodinstock").val();
            if(Jproduct  ==  "" || Jmanufacturer == "" || Jencapsulation == "" || Jlotnumber == "" || Jexplain == "" || Jnumber == ""){
                layer.msg("所有内容都不能为空!");
                return false;
            }
            if(Jprice == 0  || isNaN(Jprice)){
                layer.msg("请填写正确的价格!");
                return false;
            }

        }

        var isgoodsinstock;
        isgoodsinstock = Jgoodinstock;
        // if(Jgoodinstock.length > 1){
        //     isgoodsinstock = new Array();
        //     for(var i = 0; i < Jgoodinstock.length; i++){
        //         if(Jgoodinstock[i] == 0) {
        //                   isgoodsinstock.push("0");
        //               }else if(Jgoodinstock[i] == 1){
        //             isgoodsinstock.push("1");
        //               }else{
        //                   layer.msg("出错,请稍候添加!");
        //                   return false;
        //               }
        //           }
        //       }else{
        //     if(Jgoodinstock == 0){
        //               isgoodsinstock = "0";
        //           }else if(Jgoodinstock == 1){
        //               isgoodsinstock = "1";
        //           }else{
        //               layer.msg("出错,请稍候添加!");
        //               return false;
        //           }
        //       }
        var quality;
        if($(".quality").length > 1){
            quality = new Array();
            for(var i = 0; i < Jquality.length; i++) {
                if(Jquality[i] == 1){
                    quality.push("27");
                }else if(Jquality[i] == 2){
                    quality.push("17");
                }else if(Jquality[i] == 3){
                    quality.push("7");
                }else{
                    layer.msg("出错,请稍候添加!");
                    return false;
                }
            }
        }else{
            if(Jquality == 1){
                quality = 27;
            }else if(Jquality == 2){
                quality = 17;
            }else if(Jquality == 3){
                quality = 7;
            }else{
                layer.msg("出错,请稍候添加!");
                return false;
            }
        }

        var str = "[";
        if($(".price").length > 1){
            for(var i = 0; i < Jproduct.length; i++){
                str += '{'
                    +'"product":"'+Jproduct[i]
                    +'","manufacturer":"'+ Jmanufacturer[i]
                    +'","lotnumber":"'+ Jlotnumber[i]
                    +'","price":'+ Jprice[i]
                    +',"description":"'+ Jexplain[i]
                    +'","encapsulation":"'+ Jencapsulation[i]
                    +'","quality":"' + quality[i]
                    +'","isgoodsinstock":"' + isgoodsinstock[i]
                    +'"}';
                if(i != Jproduct.length - 1){
                    str += ",";
                }
            }
        }else{
            str += '{'
                +'"product":"'+Jproduct
                +'","manufacturer":"'+ Jmanufacturer
                +'","lotnumber":"'+ Jlotnumber
                +'","price":'+ Jprice
                +',"description":"'+ Jexplain
                +'","encapsulation":"'+ Jencapsulation
                +'","quality":"' + quality
                +'","isgoodsinstock":"' + isgoodsinstock
                +'"}';
        }
        str+="]";

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
            success: function(data) {
                layer.msg(data.msg);
                setTimeout("location.replace(location.href)", 1000);
                // location.replace(location.href);
            }
        });

    });



});