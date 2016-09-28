$('#get-dish').on('click', function(event) {
  event.preventDefault();

  // request a new dish and alert the user

    var request = $.ajax({
      method: "GET",
      url: "/dishes/random.json"
    });

    // Upon a successful response, insert the new fortune into
    // the DOM.
    request.done(function(randomDish) {
      alert(randomDish["dish"]);
    });

});
