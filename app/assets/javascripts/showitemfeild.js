$(function() {
    $('#add-item-area').hide();

  $(".add-item-link").click(function(e){
    $('#add-item-link').hide();
    $('#add-item-area').show();
    e.preventDefault();
  });

  $(".item-action").click(function(e){
    $("#add-item-area").hide();
  });
});
