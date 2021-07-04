$(document).ready(function(){
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $("#hip_page").css("display","flex");
            $("#to_top_btn").css("display","block");
        } else {
            $("#hip_page").css("display","none");
            $("#to_top_btn").css("display","none");
        }
    });
    function rotateIcon(){
        $(".title_card").on("click",function(){
            if($(this).hasClass("collapsed")){
               $(this).removeClass("checked");
            }else{
               $(this).addClass("checked");
            }
        })
    }
    rotateIcon();
    
    // get size product
    var opts = $(".opt");
            console.log(opts.length);
            for(var i = 0; i < opts.length; i++){
                $("#opt"+i).on("click", function(){
                    console.log($(this).val());
                    $("#get_size_prod").text($(this).val());
                    $("#select_collapse").removeClass("show");
                })
            }
});
        
function showImageItem(imgs) {
            var getItemImg = document.getElementById("get_pict");
            getItemImg.src = imgs.src;
}
function likeProduct(){
            $(".fa-heart").on("click", function(){
                if($(this).hasClass("far")){
                    $(this).removeClass("far");
                    $(this).addClass("fas");
                 }else{
                    $(this).removeClass("fas");
                    $(this).addClass("far");
                 }
            })
}
likeProduct();

// edit show pages
var pageItems =  document.querySelectorAll("#section_prod_list .page-num");
var maxItem = 3;
var index = 1;

function showPages(){
    console.log("page num: " + pageItems.length);
    for(let i = 0; i < pageItems.length; i++){
        if(i>=(index*maxItem)-maxItem && i<index*maxItem){
            $(pageItems[i]).addClass("show");
        }else{
            $(pageItems[i]).addClass("hide");
            $(pageItems[i]).removeClass("show");

        }
    }
}
function countNumPage(){
    for(let j = 0; j < pageItems.length; j++){
        $(pageItems[j]).on("click", function(){
           if(j<(pageItems.length) && j>=(maxItem-index)){
            $(pageItems[j+1]).addClass("show");
            $(pageItems[j-1]).addClass("show");
            $(pageItems[j-2]).addClass("hide");
            $(pageItems[j+2]).addClass("hide");
            $(pageItems[j-2]).removeClass("show");
            $(pageItems[j+1]).removeClass("hide");
            $(pageItems[j-1]).removeClass("hide");
            $(pageItems[j+2]).removeClass("show");
           }
           else{
            showPages();
           }
           if(j==0){
            $(pageItems[j]).removeClass("hide");
           }
        });
}
}

window.onload = showPages();
window.onload = countNumPage();
