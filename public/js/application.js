$(document).on('submit', ".delete-form", function (e) {
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

$(document).on('click', ".header-link", function (e) {
  e.preventDefault();
  var $target = $(this)
  var url = $target.attr('href')
 $.ajax(url).done(function(data) {
    $(".content").remove();
    var content = $(data).wrapAll("<section>");
    var section = content.parent().addClass("content");
    $("body").append(section);
  }).fail(function() {
    alert("failed to retrieve data");
  });
});

$(document).on('click', '.append-choice', function (e) {
  e.preventDefault();
  button = $(this)
  var url = button.attr('href');
  container = button.parent().parent('.question-container');
  $.ajax({url: url, type:"GET" }).done(function(data) {
    container.children('.append-choice-above').before(data); 
    container.children('.choice-form').children('.append-choice-above').before(data); 
  }).fail(function() {
    alert("failed to append");
  });
});

$(document).on('click', '.append-question', function (e) {
  e.preventDefault();
  button = $(this)
  var url = $(this).attr('href');
  $.ajax({url: url, type:"GET" }).done(function(data) {
    $(".append-question-above").before(data); 
  }).fail(function() {
    alert("failed to append");
  });
});

$(document).on('submit', 'form.survey-form', function (e) {
  e.preventDefault();
  var survey = $(".survey-form");
  postURL = survey.attr('action')
  postData = survey.serializeArray();

  $.ajax({
    method: "POST",
    url: postURL,
    data: { data: postData }
  })
  .fail(function() {
    alert("failed to post");
  });

  $.ajax('/surveys').done(function(data) {
    $(".content").remove();
    var content = $(data).wrapAll("<section>");
    var section = content.parent().addClass("content");
    $("body").append(section);
  }).fail(function() {
    alert("failed to retrieve data");
  });

});















