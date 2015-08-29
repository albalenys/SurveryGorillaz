$(".header-link").on('click', function(e) {
  e.preventDefault();
  var $target = $(this)
  var url = $target.attr('href')

  $.ajax(url).done(function(data) {
    $(".content").hide();
    var insert_this = $(data).wrap("<section>").addClass("content")
    $("body").append(insert_this.parent()); // dude. so weird.
  }).fail(function() {
    alert("I failed, I'm sorry.");
  });
});

// formatting of login form is a little off when using ajax
$(".login-link").on('click', function(e) {
  e.preventDefault();
  var $target = $(this)
  var url = $target.attr('href')
// debugger
  $.ajax(url).done(function(data) {
    $(".content").hide();
    var insert_this = $(data).wrap("<section>").addClass("content")
    $("body").append(insert_this.parent()); // dude. so weird.
  }).fail(function() {
    alert("Login failed.");
  });
});
