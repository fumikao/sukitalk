$(function(){
  $('#search_icon').hover(function(){
    $("#search_links:not(:animated)").slideDown()
  }, function(){
    $("#search_links").slideUp()
  });
});