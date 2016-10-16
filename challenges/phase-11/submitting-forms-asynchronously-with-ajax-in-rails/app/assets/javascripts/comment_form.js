var newCommentForm = function(formId) {
  return {
    element: $(formId),
    title: function() {
      return this.element.find("#comment_title").val();
    },
    content: function() {
      return this.element.find("#comment_content").val();
    },
    videoId: function() {
      var postPath = this.element.attr("action");
      var regex = /\/videos\/(\d+)\/comments/;
      var matches = postPath.match(regex);
      var result;
      if(matches.length === 2) {
        result = matches[1];
      }
      return result
    },
    attributes: function() {
      var result = {
        title: this.title(),
        content: this.content(),
        video_id: this.videoId()
      }
      return result;
    }
  }
}

function resetForm($form) {
    $form.find('input:text, input:password, input:file, select, textarea').val('');
    $form.find('input:radio, input:checkbox')
         .removeAttr('checked').removeAttr('selected');
}
