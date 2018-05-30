/**
 * Created by Ponder on 2017/2/18.
 */
$(document).ready(function() {

    // var s = $("#type").val();
    // $(function () {
    //     $(".page").paging({
    //         total: 10,
    //         animation: false,
    //         centerBgColor: "#fff",
    //         centerFontColor: "#000",
    //         centerBorder: "1px solid #ddd",
    //         transition: "all .2s",
    //         centerHoverBgColor: "#25dd3d",
    //         centerFontHoverColor: "#fff",
    //         otherFontHoverColor: "#fff",
    //         otherBorder: "1px solid #ddd",
    //         otherHoverBorder: "1px solid #25dd3d",
    //         otherBgColor: "#fff",
    //         otherHoverBgColor: "#25dd3d",
    //         currentFontColor: "#fff",
    //         currentBgColor: "#f79898",
    //         currentBorder: "1px solid #f79898",
    //         fontSize: 12,
    //         currentFontSize: 12,
    //         cormer: 3,
    //         gapWidth: 3,
    //         jumpBgColor: "#fff",
    //         jumpFontHoverColor: "#Fff",
    //         jumpHoverBgColor: "#25dd3d",
    //         jumpBorder: "1px solid #ddd",
    //         jumpHoverBorder: "1px solid #25dd3d",
    //         beforeBtnString: "<<",
    //         nextBtnString: ">>",
    //         submitStyle: "ajax",
    //         submitType: "post",
    //         idParameter: "page",
    //         url:"passivecomponents",
    //         ajaxData: {
    //             type: s
    //         },
    //         dataOperate:function oprate(data){
    //             console.log(data);
    //         }
    //
    //     });
    //
    // })

    $("#category a").on("click", function () {

        var s = $(this).html();
        var supplier = '<div class="supplier"><table border="1" cellspacing="0"> ' +
            '<tr> <td>名称:</td> <td>123123123</td> </tr> ' +
            '<tr> <td>电话:</td> <td>1231231231231</td> ' +
            '</tr> <tr> <td>电话:</td> <td>12312398</td> </tr>' +
            '<tr> <td>QQ:</td> <td>8492342423</td> </tr> ' +
            '<tr> <td>地址:</td> <td>asdfasdsfd</td> </tr> ' +
            '<tr> <td>说明:</td> <td>sdafasdfas</td> </tr> ' +
            '<tr> <td>标签:</td> <td>电解电容/电解电容/电解电容</td> </tr> ' +
            '<tr><td>人气</td>' +
            '<td><button class="button button-rounded button-tiny up">顶()</button>/ '+
            '<button class="button button-rounded button-tiny down">踩()</button> </td> </tr>'+
            '</div>';
        $.ajax({
            url: "passivecomponents",
            type: 'post',
            dataType: "json",
            data:{
                page: 0,
                type: s
            },
            success: function(data) {
                var a = data.map.length;
                $("#content").empty();
                for (var i = 0; i < a; i++){
                    ajax(data.map[i]);
                }
            },
            error: function (data) {
                layer.msg("失败,请刷新页面后重试", {
                    offset:'100px',
                    shift: 1
                });
            }
        })

    });

    function ajax(data){
        var labelx = "";
        if(data.label.length > 1){
            labelx += data.label +"/";
        }
        if(data.label1.length > 1){
            labelx += data.label1 +"/";
        }
        if(data.label2.length > 1){
            labelx += data.label2 +"/";
        }
        if(data.label3.length > 1){
            labelx += data.label3 +"/";
        }
        if(data.label4.length > 1){
            labelx += data.label4 +"/";
        }
        var html = '<div class="supplier"><table border="1" cellspacing="0"> ' +
            '<tr> <td>名称:</td> <td>'+data.name+'</td> </tr> ' +
            '<tr> <td>手机:</td> <td>'+data.cellphone+'</td> ' +
            '</tr> <tr> <td>电话:</td> <td>'+data.phone+'</td> </tr>' +
            '</tr> <tr> <td>电话:</td> <td>'+data.phone1+'</td> </tr>' +
            '<tr> <td>QQ:</td> <td><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin='+data.qq+'&site=qq&menu=yes">'+data.qq+'</a></td> </tr> ' +
            '<tr> <td>地址:</td> <td>'+data.address+'</td> </tr> ' +
            '<tr> <td>说明:</td> <td>'+data.illustration+'</td> </tr> ' +
            '<tr> <td>标签:</td> <td>'+labelx+'</td> </tr> ' +
            '<tr><td>人气</td><td>' +
            '<input type="hidden" class="uid" value="'+data.passivecomponentsuid+'">' +
            '<button class="button button-rounded button-tiny up">顶(<span>'+data.up+'</span>)</button> '+
            '<button class="button button-rounded button-tiny down">踩(<span>'+data.down+'</span>)</button> </td> </tr>'+
            '</table>' +
            '</div>';
        $("#content").append(html);
    }

    $("#content").one("click", ".up",  function () {
        var up = $(this).find("span");
        var uid = $(this).siblings(".uid");
        var thi = $(this);
        $.ajax({
            url: "pcup",
            type: 'post',
            dataType: "json",
            data:{
                up: up.html(),
                uid: uid.val()
            },
            success: function(data) {
                layer.msg(data.msg, {
                    offset:'300px',
                    shift: 6
                });
                if(data.msg == '成功!'){
                    up.html(parseInt(up.html())+1);
                    // thi.attr("disabled", true);
                    // thi.unbind();
                }
            },
            error: function (data) {
                layer.msg("失败,请刷新页面后重试", {
                    offset:'300px',
                    shift: 6
                });
            }
        });
    });

    $("#content").one("click", ".down", function () {
        var down = $(this).find("span");
        var uid = $(this).siblings(".uid");
        $.ajax({
            url: "pcdown",
            type: 'post',
            dataType: "json",
            data:{
                down: down.html(),
                uid: uid.val()
            },
            success: function(data) {
                layer.msg(data.msg, {
                    offset:'300px',
                    shift: 6
                });
                if(data.msg == '成功!'){
                    down.html(parseInt(down.html())+1);
                }
            },
            error: function (data) {
                layer.msg("失败,请刷新页面后重试", {
                    offset:'300px',
                    shift: 6
                });
            }
        });
    });

    //
    // //贴片电容
    // $("#chip_capacitors").on("click", function(){
    //
    // });
    //
    // //贴片电阻
    // $("#chip_resistors").on("click", function(){
    //
    // });
    //
    // //直插电阻
    // $("#straight_through_resistance").on("click", function(){
    //
    // });
    //
    // //晶振
    // $("#crystal").on("click", function(){
    //
    // });
    //
    // //电感
    // $("#inductance").on("click", function () {
    //
    // });
    //
    // //直插LED
    // $("#straightLED").on("click", function(){
    //
    // });
    //
    // //贴片LED
    // $("#SMD_LED").on("click", function(){
    //
    // });
    //
    // //按键开关
    // $("#button_switch").on("click", function () {
    //
    // });
    //
    // //电位器
    // $("#potentiometer").on("click", function () {
    //
    // });
    //
    // //磁珠
    // $("#beads").on("click", function () {
    //    
    // });
    //
    // //电解电容
    // $("#electrolytic_capacitor").on("click", function () {
    //    
    // });
    //
    // //蜂鸣器
    // $("#buzzer").on("click", function () {
    //    
    // });
    //
    // //连接器
    // $("#connector").on("click", function () {
    //    
    // });
    //
    // //保险丝
    // $("#fuse").on("click", function () {
    //    
    // })


})