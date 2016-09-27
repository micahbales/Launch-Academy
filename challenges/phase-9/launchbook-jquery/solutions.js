// Exercise: Find the top navbar by query for the element type, which is <nav>.

$('nav');

// Exercise: Find the sidebar on the right by using it's id.

#('#sidebar-right');

// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.

$('.pages');
$('.groups');

// Exercise: Find all of the comments on the page.

$('.comments > .panel');

// Exercise: Find the first comment on the page.

$('.comments > .panel').first();

// Exercise: Find the last comment on the page.

$('.comments > .panel').last();

// Exercise: Find the fourth comment on the page.

$('.post:nth-child(3) .panel:nth-child(2)');

// Exercise: Find one of the ads in the sidebar and use .hide() to hide it.

$('.groups').hide();

// Exercise: Use .show() to make the ad that you hid in the previous step visible again.

$('.groups').show();

// Exercise: Use .toggle() to toggle the display of the nav bar at the top of the page.

$('nav').toggle();

// Exercise: Use .attr() to change src attribute of one of the ads in the sidebar. Here's an image source if you need one: http://placebear.com/200/300.

var $groupLink = $('.groups .side-nav a').first();
$groupLink.attr('href', 'http://www.micahbales.com');

// Exercise: Find Sam's post and change it's text to something incredible.

$('.post:nth-child(2) .panel:nth-child(2)').text('Something incredible');

// Exercise: Find the first post and use .addClass() to add the .post-liked class to it.

var $firstPost = $('.post:nth-child(1)');
$firstPost.addClass('post-liked');

// Exercise: Find the second post and use .removeClass() to remove the .post-liked class.

var $secondPost = $('.post:nth-child(2)');
$secondPost.removeClass('post-liked');

// Exercise: Find any post and use .toggleClass() to toggle the .post-liked class.

var $thirdPost = $('.post:nth-child(3)');
$thirdPost.toggleClass('post-liked');
