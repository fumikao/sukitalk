$(function(){
  $('.genre_name').on('click', function(){
    let genre_id = $(this).data('id')
    
    $.ajax({
      type: 'GET',
      url: '/genres/display_categories',
      data: {genre_id: genre_id},
      dataType: 'json'
    })
    .done(function(categories){
      $("#category_area").empty()
      $.each(categories, function(i, category){
        let url = `/categories/${category.id}/talks`
        let html = `<li><a href="${url}">${category.name}</a></li>`
        $('#category_area').append(html)
      })
    })

  })
})