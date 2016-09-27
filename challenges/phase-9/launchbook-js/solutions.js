// Exercise: Find the top navbar by query for the element type, which is <nav>.

document.getElementsByTagName("nav")[0];

// Exercise: Find the sidebar on the right by using it's id.

document.getElementById('sidebar-right');

// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.

document.getElementsByClassName('pages')[0];
document.getElementsByClassName('groups')[0];

// Exercise: Find all of the comments on the page.

document.getElementsByClassName('comments');

// Exercise: Find the first comment on the page.

document.getElementsByClassName('comments')[0];

// Exercise: Find the last comment on the page.

var posts = document.getElementsByClassName('post');
var lastPostIndex = posts.length - 1;
posts[lastPostIndex];

// Exercise: Find the fourth comment on the page.

document.getElementsByClassName('comments')[3].getElementsByClassName('panel')[0];

// Exercise: Find one of the ads in the sidebar and hide them.

var statusUpdateForm = document.getElementsByClassName('groups')[0];
statusUpdateForm.style.visibility = "hidden";

// Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.

var statusUpdateForm = document.getElementsByClassName('groups')[0];
statusUpdateForm.style.visibility = "visible";

// Exercise: Use setAttribute to change src attribute of one of the ads in the sidebar.

var statusUpdate = document.getElementsByClassName('groups')[0];
var link = statusUpdate.getElementsByTagName('a')[0];
link.setAttribute('href', 'http://www.google.com');

// Exercise: Find Sam's post and change it's text to something incredible.

var comments = document.getElementsByClassName('comments')[1];
var panel = comments.getElementsByClassName('panel')[1];
var comment = panel.getElementsByTagName('p')[0];
comment.innerHTML = 'Something incredible';

// Exercise: Find the first post and add the .post-liked class to it.

postOne = document.getElementsByClassName('post')[0];
postOne.className = postOne.className + " post-liked";

// Exercise: Find the second post and remove the .post-liked class.

postOne = document.getElementsByClassName('post')[1];
postOne.classList.remove('post-liked');
