**Acceptance tests** are high-level tests that essentially walk through an application as a user would. Acceptance tests will read like a script of a user interacting with our application, ensuring acceptance criteria is met along the way. We might have a test that walks through a user signing up for our app, filling out a form successfully, or viewing a particular item's page.

In this challenge you'll continue using your **T**est **D**riven **D**evelopment skills by building out the apps functionality. Test driven development helps create a clean code base with only the code for the exact features we expect users to use.

To be great TDD developers, you must first have an acceptance test written before starting on a new feature. Acceptance tests are based on user stories with acceptance criteria, and thus a well-written test thoroughly addresses these criteria. In this challenge, we have written the acceptance tests for the first two user stories. Let the failing tests guide your implementation of these features. Once all the tests are passing, fulfill the last user story by writing new tests and getting the tests to pass.

### Learning Goals

* Practice TDD by using Capybara to simulate a user interacting with a web page
* Writing Capybara tests driven by desired user story behavior

### Instructions

Build a Sinatra application that allows users to add their favorite shows to a list of tv shows. The list keeps track of details about the show based on the user input.

To get started, get the existing featured test suite to pass. Run the following in your terminal:

```no-highlight
$ bundle
$ rspec spec
```

**Important:** In order to allow tests to be independent of one of another, your application's data must be in the same state before every test. To accomplish this, the test suite will delete everything except the headers in `television-shows.csv` before the entire test suite is run and at the end of every test. Thus, your app will have no data at the beginning of every `it` and `scenario` blocks. If the test requires some data, you would seed that data at the beginning of the test. Take a look at `01_user_views_list_of_tv_shows_spec.rb` for an example of how to seed test data.

Take a look at the remaining tests as well and get a sense of how they are working. The tests cover the following user stories:

```no-highlight
 As a TV fanatic
 I want to view a list of my TV shows
 So I can keep track of and share all my favorite shows
```

Acceptance Criteria:
 * I can see the names and networks of all TV shows that have been added

```no-highlight
 As a TV fanatic
 I want to add one of my favorite shows
 So that I can encourage others to binge watch it
```

Acceptance Criteria:
 *  I must provide the title, network, starting year, genre, and synopsis
 *  The genre must be one of the following: Action, Mystery,
     Drama, Comedy, Fantasy
 *  If any of the above criteria is left blank, the form should be
     re-displayed with the failing validation message

Once you are finished write tests for the following user story and get them to pass:

```no-highlight
As an organized TV fanatic
I want to receive an error message if I try to add the same show twice
So that I don't have duplicate entries
```

Acceptance Criteria:
* If the title is the same as a show that I've already added, the details are not saved to the csv
* If the title is the same as a show that I've already added, I will be shown an error that says "The show has already added".
* If the details of the show are not saved, I will remain on the new form page

### Optional Challenge: Implement a `TelevisionShow` class.
Write unit tests for the following functionality and implement it:

1) `TelevisionShow` objects should be initialized with a title, network, starting year, genre, and synopsis. These attributes should have reader methods associated with them.

2) The `TelevisionShow` class should have a class method called `all`. This method should return an array of `TelevisionShow` objects whose attributes correspond to each data row in the csv file.

3) The `TelevisionShow` class should have an instance method called `errors`. On a newly initialized object, this method should return an empty array.

4) The `TelevisionShow` class should have an instance method called `valid?`. This method should return true if the two following validations are true:
  1. None of the attritubes of the instance object are empty strings.
  2. The `title` attribute of the instance object is not present in the csv file.

Furthermore, the method should satisfy the following:
  * Having called `valid?` on a valid object, calling `errors` on the same object should return an empty array.
  * Having called `valid?` on an object that fails the first validation, calling `errors` on the same object should return an array containing the string "Please fill in all required fields".
  * Having called `valid?` on an object that fails the second validation, calling `errors` on the same object should return an array containing the string "The show has already been added".
  * Having called `valid?` on an object that fails both validations, calling `errors` on the same object should return an array containing both error message strings.

Revise your `errors` method if necessary.

5) The `TelevisionShow` class should have an instance method called `save`. If the object is valid this method should return true and add the attributes of the object to the csv. If the object is not valid this method should only return false. Hint: Use `valid?` in your `save` method.

Once you have this class set up, use it in your app. For your `POST` route, you should initialize an object with the data from the form, call `save` on the object, and decide how to proceed based on the return value of `save`.

#### Note
The standard process for building out new features starts with writing a feature test, then implementing code to pass the test. If you write methods to help along the way, first write unit tests for those methods and then implement the method itself. Once you have tested methods, you can implement them in the code necessary to finish your feature and pass your feature test.
