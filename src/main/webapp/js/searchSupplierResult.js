$(document).ready(function(){

    var len = $(".pages").length;
    var page = len / 10;
    if(len %  10 > 0){
        page += 1;
    }
    for(var i = 0; i < 10; i++){
        $(".pages").eq(i).css('display','block');
    }

    for(var i = 1; i <= page; i++){
        $(".page").append("<li>"+i+"</li>");
    }

    $(".page li").on("click", function(){
        var l = $(this).html()-1;
        for(var i = 0; i <= len; i++){
            $(".pages").eq(i).css('display','none');
        }
        var j = (l+1)*10;
        console.log(j);
        for(var i = l*10; i <= j; i++){
            $(".pages").eq(i).css('display','block');
        }
        console.log(l);
    })

});


