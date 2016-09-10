This exercise will walk through creating a simple sessions-based user ID system.

### Learning Goals

* Practice implementing and customizing the `SessionHash` in a simple Sinatra app
* Use `pry` to explore how sessions work in greater detail

### Before We Begin

Run `et get sessions-walkthrough` to download the files necessary for this exercise.

### Getting Started

After you've downloaded the exercise files, open up `server.rb`.

Let's start by enabling sessions within Sinatra. We will be using `pry` later as well, which will let us peek under the hood to see what's coming across in the `SessionHash` object. Add the following code to your `server.rb` file.

```
require 'sinatra'
require 'pry'

use Rack::Session::Cookie, {
  secret: "hello_i_am_a_frog",
  expire_after: 86400
}
```

The `use Rack::Session::Cookie` statement is how we enable the session cookie functionality in Sinatra with additional parameters, such as a `secret` key that is used to create an __HMAC digest__ to authenticate our sessions.

### Initial Session Data

When a user visits the `index` page, we will want to create a session to track their `visit_count` if they have not been here before. Add the following code to your `server.rb` file:

```
get '/index' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
  else
    session[:visit_count] += 1
  end
  erb :index
end
```

### (Very) Basic User Authentication

The session cookie is stored in the client's browser for a specified duration after the user has browsed to our site. Since this information is tied to the user, let's use this to create a basic system for verifying the user's identity.

We're able to use the session cookie much like a special kind of hash. You can define keys for the values you want to be persisted across browser sessions.

For the purposes of this tutorial, let's say we want the user to input a username, a "code word", and a message, and then we want to store these user inputs in the session cookie. To do this, we'll want to capture the user input from the `params` hash, and then create the key-value pairs in the session hash. Let's walk through an example.

##### Side Note: Passwords should never be stored in plain text! The "code word" is used for the purposes of our demo only, with the goal of illustrating how the developer can customize and implement `Sessions` cookies in a variety of use cases.

### Storing User Input

We've already created a form for you, which will POST to the `/create` path. Feel free to take a look in `views/form.erb` to see where the inputs are coming from.

We have specified three fields for user input: `username`, `code_word`, and `message`. These will match a route for `post '/create'`, so let's add the following code to our `server.rb` file:

```
post '/create' do
  session[:username] = params[:username]
  session[:code_word] = params[:code_word]
  session[:message] = params[:message]
  binding.pry
  redirect '/index'
end
```

Breaking this down, we're trying to take __user input__, which comes through our `params` hash, and store it in the `session` hash so that it can be accessed by the user across browser sessions. For example, in the line:

`session[:username] = params[:username]`

we are defining a key-value pair in the `session` hash. The key, in this case, is `:username`, and the value is whatever comes after the equal sign - in this case, whatever comes through `params[:username]`. Let's take a look at this in action.

We've placed a `binding.pry` before `redirect '/index'`, which will let us see what's coming through from the `post` after we fill out the form.

So run `ruby server.rb`. Open a browser and visit `http://localhost:4567/index`. You will see the form mentioned earlier. Fill out the fields and click Submit, similar to what's shown below.

![Simple User Authentication Form](https://s3.amazonaws.com/horizon-production/images/tt4WhAY.png)

Go back to your terminal. You should see that the output has halted in `pry`.

![POST in pry - terminal](https://s3.amazonaws.com/horizon-production/images/tFH97df.png)

At the terminal prompt, type in `params`. You should see the `params` hash appear:

![params result in pry](https://s3.amazonaws.com/horizon-production/images/M777Shk.png)

If you type in `params[:username]`, as with any hash, you'd expect to see the value for that hash.

![params username in pry](https://s3.amazonaws.com/horizon-production/images/VO8tthp.png)

This is the value that we'll be storing in `session[:username]`. Type in `session[:username]` at the prompt.

![session username in pry](https://s3.amazonaws.com/horizon-production/images/KJNBKfX.png)

The value we get back is the same as what was in our `params[:username]`. So we've successfully stored user input in the session hash!

##### Quick Challenge: Type in `session[:code_word]` and `session[:message]`. What do you expect to see?

### Exploring The SessionHash Object

Let's explore the `session` object a bit more. Type in `session` at the prompt.

![session result in pry](https://s3.amazonaws.com/horizon-production/images/HJ3b3yu.png)

Compare this to the `params` output earlier. It should look very much like the `params` hash we saw earlier. Now type in `session.class` to see what kind of object this is:

![session.class in pry](https://s3.amazonaws.com/horizon-production/images/MDlkly5.png)

It's a special object, `Rack::Session::Abstract::SessionHash`, provided to us by [Rack](http://www.sinatrarb.com/intro#Rack%20Middleware), the middleware that Sinatra is built upon.

The `SessionHash` is a hash-like object that allows you to define your own keys, and store values associated with those keys that will persist across browser sessions. In this case, we defined `visit_count`, `username`, `code_word`, and `message`, and we stored values associated with each of those keys in the `SessionHash`.

##### Before moving on to the next section, type `!!!` at the prompt to exit from `pry`, and then press `Ctrl+C` to shut down the server. After exiting `pry`, remove the `binding.pry` line from the `post` code above.

### Retrieving and Using SessionHash Data

At this point, your entire `server.rb` file should now look like this:

```
require 'sinatra'
require 'pry'

use Rack::Session::Cookie, {
  secret: 'hello_i_am_a_frog',
  expire_after: 86400
}

get '/index' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
  else
    session[:visit_count] += 1
  end
  erb :index
end

post '/create' do
  session[:username] = params[:username]
  session[:code_word] = params[:code_word]
  session[:message] = params[:message]
  redirect '/index'
end
```

To implement our simple user authentication, we'll want to have a way for the user to enter their `code_word` in order to view the `message`. Our `views/index.erb` file has some logic that shows a `code_word` field if a username exists, much like a password. The code word entered by the user (`entered_code_word`) would be compared against `session[:code_word]` - the code_word that was stored in the session. Add the following code to your `server.rb` file.

```
post '/codeword' do
  codeword = session[:code_word]
  entered_codeword = params[:entered_code_word]
  if codeword == entered_codeword
    session[:show_message] = 'true'
    redirect '/message'
  else
    redirect '/index'
  end
end
```

In the `post` block above, if `session[:code_word]` is equal to `entered_code_word`, we create a new key-value pair in the session hash: `session[:show_message] = 'true'`. Then we redirect to the `'/message'` route - a page we'll use to show the message if the entered_code_word is correct. Now add the following code to your `server.rb` file to create the `'/message'` route:

```
get '/message' do
  if session[:show_message] == 'true'
    @message = session[:message]
    session[:show_message] = 'false'
    erb :message
  else
    redirect '/index'
  end
end
```

The contents of the message, stored in `session[:message]`, are only passed through to the `message.erb` view template via the `@message` instance variable if `session[:show_message]` is `'true'`. After `@message` is set to `session[:message]`, the `session[:show_message]` flag is reset to `'false'`, so the user would need to re-enter the password to view the message again in the future.

Run `ruby server.rb` and head to `http://localhost:4567/index`. Re-enter the information in the form again, as it may not have been saved due to being interrupted by `binding.pry`. Click Submit, and you should a screen similar to the following:

![saved user information](https://s3.amazonaws.com/horizon-production/images/7d8qK1h.png)

Enter your code_word, and if it matches, you should see your original message displayed, similar to the screenshot below:

![display message](https://s3.amazonaws.com/horizon-production/images/p9yHQ6S.png)

### Clearing Session Data

Finally, `session.clear` clears the current session data. Add the following code below to your `server.rb` file, which matches a `GET` route to `/reset`:

```
get '/reset' do
  session.clear
  redirect '/index'
end
```

Save the `server.rb` file and restart your server. Run `ruby server.rb` and head to `http://localhost:4567/index`. Click on the `Reset User Info` link, and your data will be cleared.

### Additional Reading

* [Sinatra FAQ: How do I use sessions?](http://www.sinatrarb.com/faq.html#sessions)
