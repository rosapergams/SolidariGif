// function Comment(params) {
//   this.id = params.id;
//   this.content = params.content;
//   this.gif_id = params.gif_id;
//   this.user_id = params.user_id;
// }

$(document).ready(function() {
  $('.comment_loader').on('click', "a", function(event){
    event.preventDefault();
    $button = $(event.target);
    $.ajax({
      url: $button.attr('href'),
      type: 'GET'
    }).done(function(response){
      console.log(response);
      $('.comment_loader').remove();
      $('#content').append(response);
    })
  })

  $("#new_comment").submit(function(e) {
    e.preventDefault();
    console.log()
    $submit = $(event.target);
    $.ajax({
      type: "POST",
      url: '/gifs',
      data: { value: value },
      dataType: 'json'
    }).done(function(response){
      console.log(response)
    })
  });

});