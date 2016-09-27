// Capture user interaction with the "New Fortune" button.
// Prevent the default behavior, and submit an AJAX GET request.
$("#new-fortune").on("click", function(event) {
  event.preventDefault();

  var request = $.ajax({
    method: "GET",
    url: "/new-fortune.json"
  });

  // Upon a successful response, insert the new fortune into
  // the DOM.
  request.done(function(newFortune) {
    $("#fortune").text(newFortune["fortune"]);
  });
});
