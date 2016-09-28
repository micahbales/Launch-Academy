var page = 2;

function getMoreTweets() {

  var tweets = $.ajax({
    method: "GET",
    url: "/tweets.json?page=" + page
  });

  function loadData(tweets) {

    for (var i = 0; i < tweets.length; i++) {

      var newTweet = "<li class='tweet'><div class='body'>" + tweets[i]["text"] +
      "</div><div class='user'>" + tweets[i]["username"] + "</div></li>";

      $('.tweets').append(newTweet);
    }
  }

  tweets.done(function(data) {
    loadData(data);
    page += 1;
  });
};

window.onscroll = function(ev) {
  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {

    setTimeout(function(){ getMoreTweets(); }, 250);

  }
};
