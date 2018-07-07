$(document).on('turbolinks:load', function(){
  var input = "";
  $('#search').on('keyup', function() {
    input = $.trim($(this).val());
    $.ajax({
      url: '/words/search', 
      type: 'GET',
      data: ('keyword=' + input),
      dataType: 'json'
    });
  });
});
