$().ready(function(){

    $("#addBill button").on("click", function(){

        var sele = $("#addBill select").val();
        var rmb = $("#rmb").val();
        var time = getNowFormatDate();
        var particulars = $("#detaild").val();// 明细
        var remarks = $("#comment").val();//备注
        $("#rmb").val("");
        $("#detaild").val("");
        $("#comment").val("");

        var str;
        if(sele == '支出'){
            countExpend += parseFloat(rmb);
            str = "<div class='de'><span class='deled'>"+sele+"</span><span class='pri expend'>"+rmb+"元</span><span class='time'>"+time+"</span><span class='detaile'>"+particulars+"</span><span class='remarks'>"+remarks+"</span></div>";
        }else if(sele == '收入'){
            countInc += parseFloat(rmb);
            str = "<div class='de'><span class='deled'>"+sele+"</span><span class='pri income'>"+rmb+"元</span><span class='time'>"+time+"</span><span class='detaile'>"+particulars+"</span><span class='remarks'>"+remarks+"</span></div>";
        }
        $("#countexpend").html(countExpend+"元");
        $("#countincome").html(countInc+"元");
        $("#count").html(countInc - countExpend+"元");

        $.ajax({
            type: "POST",
            url: "bill",
            async: true,
            dataType: "json",
            data:{
                time: time,
                particulars: particulars,
                remarks: remarks,
                detailed: sele,
                price: rmb
            },
            success: function (data) {
                $("#d").append(str);
            }
        });

        // var ex = $("#d .expend");
        // console.log(ex);
        // var countExpend = 0;
        // for(var i=0; i < ex.length; i++){
        //     countExpend += parseFloat(ex[i].innerHTML);
        // }
        // $("#countexpend").html(countExpend+"元");
        //
        // var inc = $("#d .income");
        // var countInc = 0;
        // for(var i = 0; i < inc.length; i++){
        //     countInc += parseFloat(inc[i].innerHTML);
        // }
        // $("#countincome").html(countInc+"元");
        //
        //
        // // var p = $(".pri");
        // // var cont = 0;
        // // for(var i=0; i < p.length; i++){
        // //     cont += parseFloat(p[i].innerHTML);
        // // }
        // var cont = countInc - countExpend;
        // $("#count").html(cont+"元");
        //
        // console.log(cont);
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
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    // var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
    //     + " " + date.getHours() + seperator2 + date.getMinutes()
    //     + seperator2 + date.getSeconds();
    return currentdate;
}

var countExpend = 0;
var countInc = 0;
(function(){
    var ex = $(".expend");
    for(var i=0; i < ex.length; i++){
        countExpend += parseFloat(ex[i].innerHTML);
    }
    $("#countexpend").html(countExpend+"元");

    var inc = $("#d .income");
    for(var i = 0; i < inc.length; i++){
        countInc += parseFloat(inc[i].innerHTML);
    }
    $("#countincome").html(countInc+"元");


    // var p = $(".pri");
    // var cont = 0;
    // for(var i=0; i < p.length; i++){
    //     cont += parseFloat(p[i].innerHTML);
    // }
    var cont = countInc - countExpend;
    $("#count").html(cont+"元");
}());