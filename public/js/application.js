$(".site-title").on('click', function(e) {
  e.preventDefault();
  var $target = $(this)
  var url = $target.attr('href')

  $.ajax(url).done(function(data) {
    $(".content").hide();
    $("body").append($(data).wrap("<section>").addClass("content").parent());
  }).fail(function() {
    alert("I failed, I'm sorry.");
  });
});
