You've been provided with an HTML file and an empty CSS file. This exercise walks through the process of styling the page by presenting our steps as a series of problems and solutions. Please walk through every step of this with the tutorial, and actually use the inspector tools to practice finding the solutions yourself.

Our final site should look like this:

![](https://s3.amazonaws.com/horizon-production/images/ywGIxw7.png)

## Styling the Header

### Using a better font

First thing's first - never use plain old browser default text, it always looks icky! Let's change the font everywhere in the site:

```css
body {
  font-family: Helvetica, sans-serif;
}
```

Every other element will, by default, inherit its font-family from whatever font-family its parent has - which means once the `body` element has this styling, it'll apply to everything!

### Adding a header background Color

First, let's give the header a background color. Target the HTML element `nav` and give it a `background-color`:

```css
nav {
  background-color: #70B85D;
}
```

### Uh oh, there's white space around our beautiful header!

Right click on the page and select "Inspect". In the top left of the window that pops up, you'll see a box with a mouse pointer in the corner. This is your Inspect tool.

Click on it and hover over the white space above the green nav bar. You should see a blue box get highlighted. Click on it. The `html` tag should get highlighted blue. That means you're currently looking at the overall size of the `html` tag.

Now we need to figure out what is pushing the nav down from the top of its parent element. Select the Inspect tool again and hover around until you find something else whose color covers up the white space at the top of the page.

You should find that when hovering the `h1`, you see an orange bar above and below the blue box that shows where the actual `h1` content lies. This means there's a `margin` at play. In your browser, add the style of `margin-top: 0;` to the `h1`. Does this fix it? Sorta? Good.

Add that styling to your CSS file like so. We don't want to target *all* `h1`s in the site, only the ones *inside* the nav bar:

```css
nav h1 {
  margin-top: 0;
}
```

### There's still a bit of whitespace at the edges of the screen!

All of our hovering-around with the Inspect tool doesn't serve to find anything that's pushing our elements away from the side of the screen. This is one of those scenarios where THE INSPECT TOOL FAILS YOU!!! You can't trust it for everything. It's time to turn to the elements listed out in our Inspector window.

Hover your mouse over the code that's shown at the bottom of your screen, all the while looking at the colors that get highlighted on the screen. You should find one element that has a margin around it, pushing itself and its children away from the edges of the screen.

...it's the `body` element! Update the styles on your `body` tag to look like this:

```css
body {
  font-family: Helvetica, sans-serif;
  margin: 0;
}
```

### We want our links on the right, but they're way over on the left.

The following code makes an element slide all the way over to the right, and become kind of a "ghost" - no matter what's in its way, it just makes its way on over to the right, right through anything else that's there!

```css
.right-section {
  float: right;
}
```

### The green color of our nav bar no longer includes the list items!

As soon as something is "floated", all other elements start ignoring it. This includes item's parent elements! Normally, a parent element will decide how tall it should be based on the size of its children. In this case, since one of the child elements is floated, that child element is *ignored* in determining how big the parent element `nav` should be.

There is a hack to fix this! People call this the "clearfix hack". There's a set piece of styling you can add to your code to make parent elements *pay attention* to their floated children when determining their height. Google "clearfix hack" and click the result from CSS Tricks. Copy and paste their first chunk of code into your file; it should look like this:

```css
.clearfix:after {
     visibility: hidden;
     display: block;
     font-size: 0;
     content: " ";
     clear: both;
     height: 0;
     }
.clearfix { display: inline-block; }
* html .clearfix { height: 1%; }
.clearfix { display: block; }
```

Now, any element *that has the class of `.clearfix`* will pay attention to its floated children when determining its height. Add the class `clearfix` to you `nav` element.

### We want our links to not have bullet points

Bullet points are provided by the default browser styling `list-style-type: disc;`. You can see this in a grey box if you "Inspect" an `li`.

To override this, add the following code. Again, we only want to apply this to `li`s that exist within the `ul`:

```css
nav li {
  list-style: none;
}
```

### We want our links to display side-by-side

To display items side-by-side, we can add the style `display: inline;`.

Update your styling on `nav li`s to look like so:

```css
nav li {
  list-style: none;
  display: inline;
}
```

### We want more space between our list items

To add more space between our list items, update the `nav li` styling to look like so:

```css
nav li {
  list-style: none;
  display: inline;
  margin-left: 10px;
}
```

We could have also used `padding-left` or `margin-right` or `padding-right` here to similar effect.

### Our links are further down than our header

By default, our `h1` element is styled as `display: block;`, which means that it takes up the full width of its parent element and doesn't allow anything else to occupy the same line as it does. When the `ul` of links is deciding where on the page to sit, it goes to the highest place on the page that hasn't already been taken up by other page elements - right below the "row" of space where the `h1` sits.

There are a couple solutions to this.

Solution 1: We could make the `h1` elements only take up as much width as it needs to hold its text contents, by adding the styling `display: inline;` or `display: inline-block` to the `h1` element. Do this and hover over the `h1` tag in inspector to see how the element now is now only as wide as the text it contains.

Solution 2: We could remove the `h1` tag from the "flow" of the page altogether by adding the styling `float: left;` to it. This means that it is no longer paid attention to by subsequent elements on the page when figuring out where they're allowed to be placed. It has essentially become a ghost to all subsequent page elements. Remove your `display: inline;` styling and add the following instead:

```css
nav h1 {
  float: left;
}
```

### Our header is pressed way up against the edge of the screen

We want everything inside the header to be an equal distance away from the edges, so let's add a padding to the `nav` element:

```css
nav {
  padding: 15px;
}
```

Ideally, this padding will be responsible for all of the distance between the text and the edges of the green box.

### Our links and header are still at slightly different heights

Use your inspector (either the Inspect tool, or hovering over the code) to find the `ul` element on the page and try to figure out why it is being pushed down from the top of the page.

Tada! There's a margin (displayed in orange, remember, and on the box model at the bottom right of the inspector) on the top and bottom of this `ul`. We want this to be smaller - but we probably still want a little margin on top and bottom, since the height of the text is a little shorter than the header text. Let's add the following styling:

```css
nav ul {
  margin: 8px 0px;
}
```

When you provide two arguments to `margin`, the first represents the top-and-bottom margin, and the second argument represents the left-and-right margin. These same styles could also be written like this:

```css
nav ul {
  margin-top: 10px;
  margin-bottom: 10px;
  margin-left: 0px;
  margin-right: 0px;
}
```

### There's extra space at the bottom of the nav bar

Use your inspector to scroll around elements in the nav bar until you find what, other than the `padding` we deliberately assigned to the nav bar, is causing the bottom of the green box to be pushed down so far.

It looks like the `h1` still has a bottom margin, which is causing the nav element to be taller than we want it. Let's change the previous styling we added to `nav h1` - instead of `margin-top: 0;`, put `margin: 0;`. This will mean there's no margin anywhere around the `h1`.

### Our links look crappy

Let's add some quick styling to make our links look less browser-default-y!

```css
nav a {
  color: black;
  text-decoration: none;
}
```

This will remove the underline and change the text color.

Now let's make them interactive. Add the following styles to change what these elements look like them when the user's cursor hovers over them:

```css
nav a:hover {
  color: #2C5E2E;
  text-decoration: underline;
}
```

## Styling the Body

### The body content is pressed up right against the edges of the page.

Let's add a `max-width` to the `div` that wraps our main content. Let's also use `margin: auto` to center that object in its parent element (`body`, in this case):

```css
.main-container {
  max-width: 960px;
  margin: auto;
}
```

### We want the three `small-page-section`s to display in line with each other

First of all, we want each of those sections to be only about 1/3 the width of the page. (A little less, if we count the space we'll be adding *between* each element.) Let's set a width, as well as a background-color and border so we can easily tell how big each box is:

```css
.small-page-section {
  width: 25%;
  background-color: #eee;
  border: 1px solid #ddd;
}
```

To make each panel look a little better, let's also add `padding` to each one, which adds extra space inside the border of an element. Add the line `padding: 15px;`

Now we need to get these to display inline with each other. Let's try our traditional approach, `dislay: inline;`:

```css
.small-page-section {
  width: 30%;
  background-color: #eee;
  border: 1px solid #ddd;
  padding: 15px;
  display: inline;
}
```

**Oh no!!!* Everything suddenly looks like crap! It looks like each div that we assigned a background-color to is now tiny. This is because **you cannot assign a width to `display: inline;` elements**.

Luckily, there's another way. It appears we want our element to have some qualities of `display: block;` (i.e., we want to be able to specify its width), AND some qualities of `display: inline;` elements (i.e., we want it to sit nicely next to its neighbors). Enter `display: inline-block;`. This piece of styling allows both of those requirements to be fulfilled.

Add `display: inline-block;` to your styling so it looks like so:

```css
.small-page-section {
  width: 30%;
  background-color: #eee;
  border: 1px solid #ddd;
  padding: 15px;
  display: inline-block;
}
```

### Our panels are too squished together

Let's take those boxes we made and put a little margin between them:

```css
.small-page-section {
  width: 30%;
  background-color: #eee;
  border: 1px solid #ddd;
  padding: 15px;
  display: inline-block;
  margin: 5px;
}
```

### We want to center the panels on the page

So, we have these three panels, and now we want to center them. Unfortunately, we can't just add `margin: auto;` to our `.small-page-section` styling like we did with `.main-container`. Here's why:

`margin: auto;` takes a `display: block;` element that's *less wide* than its parent element, and makes it so the space on either side of this child element is the same - thus centering it in the parent element. This will *not* work for elements that are `display: inline;` or `display: inline-block`, and *also* not work for elements that are the full width of their parent element.

Instead, if we want to be centering these three items as a group, we should treat them as a group! Let's wrap them in a brand new `div` that groups the three elements together, and try styling that. Add a new div that surrounds all three `.small-page-section` elements, and assign that new div a class of `center`.

Now, this is a little hacky but it works - add the style `text-align: center;` to your new div:

```css
.center {
  text-align: center;
}
```

Woohoo! Now, if we don't want the actual text of our `small-page-section`s centered, we can just overwrite that in the styles for each individual `small-page-section`:

```css
.small-page-section {
  width: 25%;
  background-color: #eee;
  border: 1px solid #ddd;
  padding: 15px;
  display: inline-block;
  margin: 5px;
  text-align: left;
}
```

We should now have a site that looks like the demo picture!
