## OMG We don't know all the ingredients!

## Part 1: Issuing Post Requests

### Instructions

Our Brussels Sprouts recipe webpage only lists the first ingredient. This is a problem. How can we have sumptuous Brussels Sprouts without knowing how to make them? Well, we are web developers, and hungry ones at that. We understand HTTP request-response and can use `curl` to add the rest of the ingredients to the page. Your job is to do the following:

Using `curl`, issue a `POST` request to make sure all of the following ingredients are on the webpage:

```
1 1/2 pounds Brussels sprouts
3 tablespoons good olive oil
3/4 teaspoon kosher salt
1/2 teaspoon freshly ground black pepper
```

Now, say you are the server and you are especially invested in making sure we have all the ingredients for our roasted Brussels sprouts recipe (servers need to eat too). How does the server know what ingredient to add? Come prepared to discuss how this occurs and what the `params` hash does to enable this.

### Learning Goals

* Utilize `curl` to understand HTTP request-response.
* Understand the `params` hash that is part of web frameworks.

### Input

Make sure you have `sinatra` installed by running `gem install sinatra` from your terminal. Run `ruby server.rb` from your terminal to run the server on `localhost:4567`. Open your browser and go to `http://localhost:4567` to see the current status of the site.

Past lessons have covered how to issue HTTP requests with the `curl` command. If you don't remember the syntax, try out the Horizon search bar, or give the following Google query a shot: [HTTP POST request with curl](https://www.google.com/?#q=HTTP+POST+request+with+curl). Then, for a moment, ponder the fact that you are using a HTTP request to figure out how to create more HTTP requests.

### Output

After you have performed your `curl` magic spell, reload the web page in your browser. It should look something like the following:

![alt](https://s3.amazonaws.com/horizon-production/images/FCq35i5.png)

Provide a text file with an explanation of the steps you took to accomplish this task.

### Tips

* After `cd`ing into the project directory, run `bundle` from your terminal to have the right dependencies installed (like the `sinatra` gem, which is what your server is based on).
* You should not be modifying the view file or `ingredients.txt` directly at all. You're an elite hacker and should only be using `curl` to solve this problem.
* You might want to put a `binding.pry` into your `POST` method and inspect the `params`, but other than that, you should not be making any changes to the file. Note: If you plan on doing this, make sure to run `gem install pry` from your console as well.


## Part 2: Writing a Form

Right now, only web developers with an understanding of `curl` are able to add their tasty ingredients to the list. However, those non-developer Muggles also have some pretty tasty ingredient ideas up their sleeves, so it would be nice if they could easily post to our site using a form.

### Instructions

Add a form to `index.erb` that will post to `'/ingredients'` and add the user's input to the list.

### Tips

* Follow the example in the reading for help!
* Pay attention to what you're naming your input field, as opposed to what the `POST` method in `server.rb` is looking for. Consider sticking a `binding.pry` in the `POST` method again, to see exactly what is being passed in through `params` when your form gets submitted.
