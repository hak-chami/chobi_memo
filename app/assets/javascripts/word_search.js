$(function() {
  $('#search').on('keyup', function() {
    var input = $.trim($(this).val());
    console.log(input);
  });
});
