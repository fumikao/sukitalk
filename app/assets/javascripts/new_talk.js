$(function(){
  $('#new_talk').on('click', function(){
    // TODO: スクロールできないようにしたい
    $('.shadow').removeClass('display_none')
    $('.new-talk').removeClass('display_none')
  })

  $('.new-talk__head--cancel, .shadow').on('click', function(){
    $('.shadow').addClass('display_none')
    $('.new-talk').addClass('display_none')
  })
})