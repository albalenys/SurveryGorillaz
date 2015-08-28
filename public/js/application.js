$("#add-dog").on('click', function(e) {
  e.preventDefault();
  $("#dog-form").show();
});

$("#new-dog").on('submit', function(e) {
  e.preventDefault();

  $.ajax('/dogs', {
    data: $(this).serialize(),
    method: 'POST'
  }).done(function(data) {
    $("#dog-list").append(data);
    $("#dog-form").hide();
  }).fail(function() {
    alert("i died...sad...so sad");
  });
});
