# Wherefore are thou, CSS selectors?

We're going to take a scene from Shakespeare and make it a little more visually distinct, to help the reader really feel what's going on!

To prepare for this exercise, we can look at the provided `index.html` file. You can open that file in your browser by navigating to it from the browsers 'open file' dialog.

This file contains part of the first scene of Romeo And Juliet, where we see Sampson and Gregory (two young Capulet toughs) run afoul of Abraham, a Montague. Right now, the text is a little stale. Lets figure out what we want!

## Getting Started

The first thing we decide to do is change the text color of `capulet` portions of the script to a nice blue (`#0077CC`).

Looking at the structure of the HTML, I can see that there are divs 'wrapping' the line's line and dialog, and those divs have classes of either `capulet` or `montague`.

```html
<div class="capulet">
  <h4>SAMPSON</p>

  <p class="dialog">
    I do bite my thumb, sir.
  </p>
</div>
```

If I assign styles to the class `capulet`, then these entire divs will be affected!

At the topic of the document, I see a `link` element, pointing to stylesheet named `style.css`.

```html
<link rel="stylesheet" href="style.css">
```

We've provided this stylesheet for you alongside the `index.html`. We'll use it to add this `capulet` style!

## Keeping up with the Capulets

Inside of `style.css`, write a css rule for the `capulet` class, like this:

```css
.capulet {
  color: #0077CC;
}
```

Now reload / refresh the `index.html` file in your browser - you should see that the `capulet` lines all have a new color!

## Flipping the Script

Now that we've made that change, I'm hooked.

Make more changes to the HTML page by editing the `style.css` file to include the following CSS rules. Make sure to check out the `index.html` file to figure out what selectors you should be using in your CSS!

- All "montague" text should have a color of `#EE6363`.
- All names (`h4`s) must have a `font-size` of 24px. They should not be bold, and should be underlined.
- Let's make each name a little darker in color than its surrounding text. Write a rule that makes all names inside a `montague` div the color `#CD4242`. Write another rule that makes all name inside a `capulet` div the color `#0F5A8F`.
- All dialog must have a font-size of 16px, and a `font-weight` of `300`.
- Stage Directions must have a text color of `#362819`. They should be centered.
