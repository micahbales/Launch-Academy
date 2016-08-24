It's time to put together all the pieces you've learned about CSS so far to create your first actual, complete web page layout! Your final design should look like this:

![](https://s3.amazonaws.com/horizon-production/images/css-exercise-page-layout-1.png)

The HTML for this exercise has been provided for you. Your job is to create the styling! This will involve drawing on your knowledge of text styles, sizing, padding, margin, borders, and backgrounds.

## Tips:
- The fonts used in this exercise are called `'Alegreya'` (this is the font used in the header), and `'Source Sans Pro'` (this is the font used in a lot of the body text). They have already been loaded into your site via a link from Google Fonts - you can now use those two names when setting your `font-family` values! (I.e., `font-family: 'Alegreya';`)
- If you want to make sure you get the exact colors used here, consider installing a [color picker add-on for Chrome](https://chrome.google.com/webstore/detail/colorpick-eyedropper/ohcpnigalekghcmgcdcenkpelffpdolg?hl=en)! This will allow you to hover over any section of a web page (including this one) and see exactly what color is being displayed.
- Pay close attention to the HTML provided. Even though you don't need to write it yourself, you should always have that file and open and be referring to it very frequently. Do feel free to change anything that you'd like in terms of class names or structure, although you don't have to!
- Remember to **use the Chrome Inspector** constantly! It will be invaluable during the process of troubleshooting, and understanding exactly what is going on with the styles that you write.
- Remember that your browser comes with a number of built-in styles called "browser defaults", and some of those you might want to over-write. As just a couple examples:
  * By default, the `body` element has a margin all around its borders. If you don't want white space around your entire web page, you'll want to put the style `margin: 0` on your `body` element!
  * Most text elements (`h1`, `h2`, `p`, etc.) have some amount of top and bottom margin. For some elements, you may want to change this amount of margin (or remove it altogether!) to get the desired look.
- Be aware of when you are trying to style one fairly *specific* element, vs. all elements of a certain type - and choose your CSS selectors accordingly. For example, the styles you'll write for the site's title should probably only apply to that one specific element, so using it's class name would be good. On the other hand, when you style the `h1` and `p` elements that make up the "content" of the page, you might want those styles to apply to *most* similar elements on the site, so using their HTML tags as CSS selectors would be a fine choice. - Don't forget to go back and look at previous lessons for reference! You aren't expected to have every one of these CSS properties memorized - that's what practice and documentation are for!

Good luck!
