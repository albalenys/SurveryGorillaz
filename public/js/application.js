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

// function post(postObj, i) {
//   return $.ajax({
//     method: "POST",
//     url: postObj.attr('action'),
//     data: { data: postObj.serializeArray(), question: i }
//   })
//   .fail(function() {
//     alert("failed to post");
//   });
// };

// $(document).on('submit', '.submit-all', function (e) {
//   e.preventDefault();

//   var questionPromises = [];
//   $(".question-form").each(function(i) {
//     var question = $(this);
//     var choices = question.siblings('.choice-form');

//     var choicePromises = [];
//     choices.each(function() {
//       var choice = $(this);
//       choicePromises.push(post(choice, i));
//     }); 
//     // resolve choice promises
//     $.when.apply($, choicePromises);

//     questionPromises.push(post(question, i));
//   }); 
//   // resolve question promises
//   $.when.apply($, questionPromises);

//   var surveyPromise = post($(".survey-form"));
//   // resolve survey promise
//   $.when.surveyPromise;

// });















