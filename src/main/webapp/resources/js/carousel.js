$(document).ready(function(){
    
   $('.prev').click(function(){
       $('.list').stop().animate({'margin-left':'-900px'},function(){
           $('.list>li').eq(0).appendTo('.list');
           $('.list').css({'margin-left':'-450px'});
       });
   });
   $('.next').click(function(){
       $('.list').stop().animate({'margin-left':'0px'},function(){
           $('.list>li').eq(2).prependTo('.list');
           $('.list').css({'margin-left':'-450px'});
       });
   });
   
   var auto = setInterval(function(){
   		$('.list').stop().animate({'margin-left':'0px'},function(){
           $('.list>li').eq(2).prependTo('.list');
           $('.list').css({'margin-left':'-450px'});
       });
   },2000);
   
   /* 마우스 올렸을때 캐러셀 자동 멈춤 */
   $('.carousel').mouseenter(function(){
        clearInterval(auto);  
   });
   
   /* 마우스 내렸을때 캐러셀 자동 다시실행 */
   $('.carousel').mouseleave(function(){
        auto = setInterval(function(){
         		$('.list').stop().animate({'margin-left':'0px'},function(){
           $('.list>li').eq(2).prependTo('.list');
           $('.list').css({'margin-left':'-450px'});
        });
    },2000);
   });
});