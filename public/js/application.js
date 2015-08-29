$(".delete-form").on("submit", function (e) {
  e.preventDefault();
  if (confirm("Are you sure? This action is not reversible.")){
    url = $(this).attr('action');
    row = $(this).parent().parent();
    $.ajax({url: url, type: 'DELETE'}).done(function(data) {
      row.remove();
    })
    .fail(function() {
      alert("failed to delete");
    });
  };
});

$(".header-link").on('click', function(e) {
  e.preventDefault();
  var $target = $(this)
  var url = $target.attr('href')

 $.ajax(url).done(function(data) {
    $(".content").remove();
    var content = $(data).wrapAll("<section>");
    var section = content.parent().addClass("content");
    $("body").append(section);
  }).fail(function() {
    alert("I failed, I'm sorry.");
  });
});
