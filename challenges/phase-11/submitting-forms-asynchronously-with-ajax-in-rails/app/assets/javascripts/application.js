//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  $("form#new_comment").submit(function(event) {
    event.preventDefault();
    var commentForm = newCommentForm("form#new_comment");
    var commentCreator = newCommentCreator(commentForm.attributes(), "div#comments");
    commentCreator.create();
  });
});
