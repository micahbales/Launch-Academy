## Challenge

We have a few tasks we would like you to complete.

First, take a look at the `http-questions.md` file we have provided. Inside you will find a number of questions you will need to answer about the HTTP protocol. Add your answers to the `http-questions.md` file.

Next, write some code to retrieve the HTML document located at [launch-academy-chat.herokuapp.com](http://launch-academy-chat.herokuapp.com/messages). There are many libraries that can help you out with this task. Read the docs, and try out the examples.

* [Net::HTTP](http://ruby-doc.org/stdlib/libdoc/net/http/rdoc/Net/HTTP.html) is a HTTP client which is part of the Ruby core libraries.
* [OpenURI](http://ruby-doc.org/stdlib-2.3.0/libdoc/open-uri/rdoc/OpenURI.html) is also a part of Ruby core, and is useful for issuing HTTP GET requests.
* [httparty](https://github.com/jnunemaker/httparty) is a Ruby gem that "makes HTTP fun again!" Check out the `/examples` folder on their GitHub page.

Now that you have the content of the [/messages](http://launch-academy-chat.herokuapp.com/messages) page, use the [Nokogiri gem](http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html) to parse and extract the messages from the page. Here is an example on how to use Nokogiri:

```bash
$ gem install nokogiri
```

```ruby
require "nokogiri"

# this is an example of a HEREDOC string
# http://ruby-doc.org/core/doc/syntax/literals_rdoc.html#label-Here+Documents

messages = <<-HTML
<!DOCTYPE html>
  <head>
    <title>Messages</title>
    <link rel="stylesheet" type="text/css" href="/main.css">
  </head>

  <body>
    <h1>Messages</h1>

    <div class="entry">
      <div class="username">matz</div>
      <div class="message">Update your Ruby to 2.3.0!</div>
    </div>

    <div class="entry">
      <div class="username">dhh</div>
      <div class="message">TDD is dead. Long live TDD!</div>
    </div>

    <div class="entry">
      <div class="username">sandimetz</div>
      <div class="message">OOP is the bee's knees!</div>
    </div>

  </body>
</html>
HTML

html = Nokogiri::HTML(messages)
html.css("div.username").each do |username|
  puts username.text
end
```

`html = Nokogiri::HTML(messages)` says, "Create a new Nokogiri HTML Document object." Then, we use a CSS selector, `div.username` to select all the `div`s in the page with the class `username`. Next, we iterate over those `div`s and print out the text contained within them.

Dissect the structure of the `/messages` page. Feel free to edit the document and change the indentation to figure out how to retrieve the messages out of the HTML document using Ruby. Once you have the messages, print them out to the console.


## Optional Bonus Challenge

Write some Ruby code to **create** a new message on [launch-academy-chat.herokuapp.com](http://launch-academy-chat.herokuapp.com/). What HTTP verb do you think you need to use? What path do you need to make the HTTP request to? How can you pass the **content** of the new message to the server? Make sure to take a look at the [form for creating a new message](http://launch-academy-chat.herokuapp.com/messages/new). Share a quote or an inspirational message with your peers.
