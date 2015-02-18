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
});