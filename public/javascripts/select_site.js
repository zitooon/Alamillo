$(function() {
  $('a').mouseenter(function(){
    if ($(this).attr('id') == 'elalamillo'){
      css_left = '+=150'
      css_top = '+=0'      
    }else{
      css_left = '+=0'
      css_top = '+=150'      
    }
    $(this).children().animate({
        opacity: 0.12,
        left: css_left,
        top: css_top
      }, 1000);
  });
  
  $('a').mouseleave(function(){
    if ($(this).attr('id') == 'elalamillo'){
      css_left = '-=150'
      css_top = '+=0'      
    }else{
      css_left = '+=0'      
      css_top = '-=150'      
    }
    $(this).children().animate({
        opacity: 0,
        left: css_left,
        top: css_top
      }, 1000);
  });
});