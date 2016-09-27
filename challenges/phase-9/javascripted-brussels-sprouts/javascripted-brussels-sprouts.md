## OMG Someone Mixed Our Precious Brussels Sprouts Recipes with Bad Ones!

Brussel Sprouts are our favorite ingredient! But someone has cluttered up our array of delicious dishes with some dreadful non-Brussels Sprouts recipes. Of course, we could just delete them by hand -- but that's not the coder's way! Let's write some JavaScript to figure out which ones we care about, and which ones we don't.

Using JavaScript, do the following:

* Grab the recipes in the `dishes` array and split the ones that include "Brussels Sprout" in their title from the ones that do not.
* Generate two new arrays `goodDishes` and `badDishes` that contain recipes with "Brussels Sprout" in their title and ones that do not, respectively.
* Add the items in the `goodDishes` array to list items in the page.
* Right now, the `Click for more` button doesn't do anything. Refactor your code to make clicking it add the items in the `goodDishes` array to the list on the page.

### Learning Goals
* Manipulate the DOM with JavaScript.
* Work with arrays in JavaScript.
* Utilize the browser console to write and debug JavaScript code.
* Use `console.log` to see data output on the browser console.

### Getting Started

* `et get` this lesson

* Open `index.html` in Chrome

* The following `dishes` array is defined for you:

```
var dishes = [
  "Roasted Brussels Sprouts",
  "Truffle Salt Burrito",
  "Vegan Philly Style Cheese Steak",
  "Fresh Brussels Sprouts Soup",
  "Split Pea Pizza with Cherry Tomatoes and Chocolate Shavings",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Parmesan Toast with Green Onions and Thyme",
  "Hot Cheesy Roasted Brussels Sprouts Dip",
  "Gazpacho with Lime and Potato Sauce",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprouts and Red Potato Salad",
  "Smoked Gouda and Poppy Seed Crackers",
  "Smoky Buttered Brussels Sprouts",
  "Margherita Pizza with Mushrooms and Cantaloupe",
  "Orange Glazed Vegan Chicken Cutlet",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Jelly Bean Ice Cream",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]
```

### Output

Running your code in your browser console should result in the following (though the right side containing notifications like `VM733:9` will likely be different):

![alt](https://s3.amazonaws.com/horizon-production/images/hP4JSDV.png)

Calling variables `goodDishes` and `badDishes` from your browser console should result in the following:

```
goodDishes;
["Roasted Brussels Sprouts", "Fresh Brussels Sprouts Soup", "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon", "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries", "Hot Cheesy Roasted Brussels Sprouts Dip", "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro", "Roasted Brussels Sprouts and Red Potato Salad", "Smoky Buttered Brussels Sprouts", "Sweet and Spicy Roasted Brussels Sprouts", "Smoky Buttered Brussels Sprouts", "Brussels Sprouts and Egg Salad with Hazelnuts"]
```

```
badDishes;
["Truffle Salt Burrito", "Vegan Philly Style Cheese Steak", "Split Pea Pizza with Cherry Tomatoes and Chocolate Shavings", "Parmesan Toast with Green Onions and Thyme", "Gazpacho with Lime and Potato Sauce", "Smoked Gouda and Poppy Seed Crackers", "Margherita Pizza with Mushrooms and Cantaloupe", "Orange Glazed Vegan Chicken Cutlet", "Jelly Bean Ice Cream"]
```

### Submission

Submit the `index.html` file that contains the JavaScript code you wrote to solve this exercise.
