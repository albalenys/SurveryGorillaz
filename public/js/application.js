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

$(document).on('click', '.append-selection', function (e) {
  e.preventDefault();
  button = $(this)
  var url = $(this).attr('href');
  $.ajax({url: url, type:"GET" }).done(function(data) {
    button.before(data);
  }).fail(function() {
    alert("failed to append");
  });
});

// $(document).on('click', '.survey-form-submit-button', function (e) {
//   //$(".survey-form")
//   debugger
//   $(".question-form").each(function(i, question) {
// debugger // check arguments - question.siblings('.choice-form');
//     //var that = $(this);
//     //$.post(that.attr('action'), that.serialize());
//   });
// });

// //callback handler for form submit
// $(".survey-form").submit(function(e)
// {
//     var postData = $(this).serializeArray();
//     var formURL = $(this).attr("action");
//     $.ajax(
//     {
//         url : formURL,
//         type: "POST",
//         data : postData,
//         success:function(data, textStatus, jqXHR)
//         {
//             //data: return data from server
//         },
//         error: function(jqXHR, textStatus, errorThrown)
//         {
//             //if fails
//         }
//     });
//     e.preventDefault(); //STOP default action
//     e.unbind(); //unbind. to stop multiple form submit.
// });

// $(".survey-form").submit();

// helpful - http://itquestionz.com/questions/2543751/ajax-submit-multiple-forms-via-jquery


