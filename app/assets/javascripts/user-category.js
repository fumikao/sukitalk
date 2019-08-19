$(function(){
  $('.user__categories--list').on('click', function(){
    let categoryId = $(this).data('categoryid')
    let categoryLists = $('.user__categories--list')
    let talkLists = $('.user__talks--lists')

    categoryLists.removeClass('selected')
    $(this).addClass('selected')
    talkLists.addClass('display_none')
    $(`div[data-categoryid=${categoryId}]`).removeClass('display_none')
  })
})