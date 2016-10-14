In this assignment, we will introduce partials. In order to adhere to the "Don't Repeat Yourself" (DRY) principle, we will use partials to share view markup across multiple view templates. We will also explore how they can be used to suit different contexts and needs.

### Learning Goals

* Build a basic partial
* Render a partial conditionally
* Render a partial in an index loop

### Implementation Details

#### Getting Started

For the purposes of this assignment, we will create a scaffolded application called `event_tracker`. Run the following commands to get started:

```no-highlight
$ rails new event_tracker
$ cd event_tracker
$ bundle
$ rake db:create
$ rails generate scaffold event name:string location:string
$ rake db:migrate
$ rails server -b 0.0.0.0
```

Start the server and navigate to [http://localhost:3000/events](http://localhost:3000/events). Create a few events to give us some data to work with.

#### A Note on Scaffolding

While using the `rails g scaffold` command is a quick and easy way to get a web application up and running, it creates a lot of unnecessary files. No doubt, you saw a stream of output after running the `rails generate scaffold` command. Each line of output was a file, some of which you will never actually use. Trust me, you are never going to use that `app/views/events/index.json.jbuilder` file.

Scaffolding is a great tool for building small web applications for learning. Scaffolded apps are an excellent resource for understanding out how to construct controllers and views. However, using scaffolding to build a production application is frowned upon for the simple fact that it creates many unnecessary files that you will never use.

If code doesn't provide business value, it doesn't belong it your repository.

Use the `rails g scaffold` command at your own risk.

#### Adding content to the application layout file

Before we dive into partials, take a moment to look at the `application.html.erb` file.

The layout file is very minimal, in keeping with what scaffolding supplies: a minimal, but functional application that allows us to interact with the data related to the model(s) we've scaffolded for the purpose of a learning aid.

Let's restructure the layout file a bit. Modify the `<body>...</body>` section to reflect the markup below:

```html
<body>
  <header></header>
  <section id="main"></section>
  <section id="sidebar"></section>
  <footer></footer>
</body>
```

We've omitted the `<%= yield %>` invocation. Where should that go in the above structure?

```html
<body>
  <header></header>
  <section id="main">
    <%= yield %>
  </section>
  <section id="sidebar"></section>
  <footer></footer>
</body>
```

Let's add some content to the header. Add a list of links that would take the user to other parts of the site:

```html
<ul>
  <li>About Us</li>
  <li>Legal</li>
  <li>Careers</li>
  <li>Terms of Service</li>
</ul>
```

Don't worry about styling these; the basic structure is all we want right now.

Once you've inserted these into the header, reload pages and move around the site. You can see that the content we added appears on all of our pages.

What if we wanted that same menu to also appear in the footer? We'd be breaking the DRY rule if we simply re-typed the markup in a second location. Every time we add a list item, we would have to update the markup in two places.

#### Using partials for repeated code snippets

Fortunately, there's a way in our Rails views for us to stay DRY. Create a new file `app/views/layouts/_menu_list.html.erb` and move the html for the list to that file.

In your `application.html.erb` file, place this tag where the list once was:

```html
<%= render "layouts/menu_list" %>
```

Try reloading pages in your site. Notice the difference in the way you make a call to render a partial versus the way the files is named.

**Note:** The naming convention of partials is important. The preceding underscore is what tells Rails that a file is a partial. Without the underscore, your partial file will not be recognized as it should.

Now, copy the `render` invocation found in the header and paste it into the footer. Reload the page. What happens?

Much like `yield`, which causes an action view to be inserted, the **render** method we've just invoked causes a file with a corresponding name to be displayed in place of the block of ERB it appears in. We refer to this file as a **partial**.  Partials provide a very convenient way to re-use standard parts of a page in multiple contexts.

#### Creating a partial for flash messages

The [Flash hash](http://api.rubyonrails.org/classes/ActionDispatch/Flash.html) is a convenient way to message the user that something happened in the application. The Flash is updated by the controller when a user modifies a record. Typically, we want to make this available site-wide.

Add the following code to `app/views/layouts/_flash.html.erb`:

```erb
<% flash.each do |type, message| %>
  <div class="flash flash-<%= type %>">
    <%= message %>
  </div>
<% end %>
```

Now, add a call to render this partial below the `header` tag in your `application.html.erb` file:

```erb
<%= render "layouts/flash" %>
```

#### Using conditional logic in a partial

We saw in the previous assignments that rendering of either embedded Ruby or a section of HTML can be conditional.

Let's suppose that when an individual `Event` is displayed, we want to display additional information about that event in our sidebar. On the other hand, when we're on the events `index` page, we'll use the sidebar to display only general information about each event. We'll only work with placeholder information here, as we're focusing on how partials can be utilized.

To test what we'll use to create the behavior we'd like, try adding this to the sidebar area of the layout file.

```html
<section id="sidebar">
  <%= controller.action_name %>
</section>
```

Try moving through different pages and actions in the scaffolded app. What do you see?

Let's extract the sidebar into a partial. Create a new file: `app/views/layouts/_sidebar.html.erb`. And move the HTML for the sidebar to that file. Don't forget to include a call to `render`.

Now let's add conditional logic to our sidebar to change the information displayed based on the controller action.


First, let's add an `<h4>` header in the sidebar partial (`_sidebar.html.erb`) that says "Event Statistics" if the controller action is `index`.

This might look something like:

```html
<% if controller.action_name == "index" %>
  <h4>Event Statistics</h4>
<% end %>
```

Ensure that this is working before proceeding.

Now, modify your sidebar partial so that it displays an `<h4>` heading for `show` actions that reads "About this Event". Test it in the browser.

The first impulse you may have, faced with these challenges, is to put the logic (the `if` / `else` / `end` blocks) in the layout file. Resist the temptation! This kind of logic should be put into the partial itself.

Partials are meant for re-use, as we saw with the menu example above. This means that when we create partials, we need to keep in mind that at a future date, the partial may be reused in a new context. Say, for example, we have a specific site meant for mobile browsers. We might provide a different layout for that site. If the logic that drives what the sidebar displays is embedded in the layout we're working with now, we'd have to re-write the logic in our new layout. If we kept our logic in our partials, we wouldn't need to duplicate that code. This paradigm keeps us in compliance with DRY and maintaining modularity. You should crave both things as a Rails developer.

Partials are a powerful way to take standard features and re-use them. In the case of the sidebar, a partial helps handle some of the logic, in order to display different content based on what action we're taking. In the case of the menu, it allows us to repeat the same content in different places.

#### Forms

Another common use of partials is for **forms**. Take a look at the `app/views/events/_form.html.erb` file, a partial that was generated when we scaffolded our `Event` model. If you open the `edit.html.erb` or `new.html.erb` files in `app/views/events/`, you'll find the following line:

```html
<%= render 'form' %>
```
When a user invokes either the `new` or the `edit` action in the `EventsController`, the resulting view will display the form contained in that partial.

**Quick Challenge:** Can you make the footer menu appear differently than the header menu? Remember they are rendered using the same partial. Take advantage of CSS to wrap each `render` invocation with a CSS class, so you can treat the header and the footer version independently.

#### Nested partials

Partials can themselves render partials, but this kind of nesting does need to be approached cautiously. As we move forward this will happen, but for now you should not need to do so. There is a moderate performance cost with every partial file that must be loaded, so you should use partials only where view logic is duplicated. The key point here is to not create partials for the sake of creating partials. Only extract markup to a partial if you need to use it more than once. Do not worry too much about this performance cost at this point.

#### Loops

One thing that partials are very powerful for is rendering in a loop.

Try the markup below in your layout file:

```html
<% 3.times do %>
  <%= render "layouts/menu_list" %>
<% end %>
```

Reload a page and see the result. This example is trivial, but there is a place where we can make this useful. Before proceeding, delete the loop you added.

Open the `index.html.erb` file. In it, you should find a block like this:

```html
<% @events.each do |event| %>
  <tr>
    <td><%= event.location %></td>
    <td><%= link_to 'Show', event %></td>
    <td><%= link_to 'Edit', edit_event_path(event) %></td>
    <td><%= link_to 'Destroy', event, method: :delete, data: { confirm: 'Are you sure?' } %></td>
  </tr>
<% end %>
```

Extract a partial from the snipped above. Select the HTML inside the loop including the `<tr>` tag and convert it into a partial called **event**.

The block in `index.html.erb` should now look like this:

```html
<% @events.each do |event| %>
  <%= render partial: "event", object: event %>
<% end %>
```

This looks DRY-er!  However, we can simplify it even further. The `each` loop can be condensed into this single line:

```html
<%= render partial: "event", collection: @events %>
```

Now reload your index page. You should see no changes, but examine the syntax that we're using. Calling render with a `:partial` specified is pretty much what was there before: the `:partial` bit was implied. The major change is adding a `:collection` argument, with our array for events. This tells the **render** method to loop through the `@events` array - our collection - and render each of them using the partial.

In the partial itself, the local variable `event` is made available with a corresponding`object:` argument to the loop.

### Rules to Follow

#### Share snippets of markup/ERB with partials to prevent duplication

The principles of DRY apply to all layers of the Rails stack. Take advantage of Rails partials to ensure that code and markup is not duplicated.

### Why This is Important

#### DRY Views Make For Reusable Views

As we've seen, partials invite us to think about the content in our pages as modular. When we start to see things that way, the amount of HTML and ERB we have to write starts to shrink. Combining layouts, views, and partials allows us to separate out re-used bits of code into modular pieces.

In these exercises, we've considered our HTML as purely markup: very little or no CSS styling has been added, apart from demonstrating that conditional rendering can include any HTML and CSS we want. But as we work with partials as pure markup, we tend to strengthen another good practice, which is separating our styling from our markup. The partials we use are highly susceptible to repurposing through intelligently-designed CSS.
