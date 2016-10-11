Now that we're finally building Rails applications, we're on the route to success, but first we need a mode of transportation!

First let's setup the application!

```no-highlight
bundle install
rake db:create
```

### Hop on a Horse
We need to move quickly, so let's get on a horse!

Run the following commands to create a Horse model, controller, and views.
```no-highlight
rails generate scaffold horse name --no-controller-specs --no-resource-route --no-helper-specs --no-model-specs
rake db:migrate
```

Run `rake`. You should have some failing tests because there are no routes set up for the `Horse` resource. Add a route to the `routes.rb` file to get the tests to pass. Don't worry about the pending tests.

### Hop on a Car
Horses are great, but we need more horsepower, so let's get in a car!

Run the following commands to create a Car model, controller, and views.
```no-highlight
rails generate controller Cars index --skip-routes --no-helper-specs --no-view-specs
rails generate model Car name:string --no-test-framework
rake db:migrate
```

Also go to `spec/features/sees_cars_spec.rb` and remove the pending status from the test by changing

```ruby
scenario "see all the cars", pending: true do
```
to

```ruby
scenario "see all the cars" do
```

Run `rake`. You should have failing tests because your missing a route to your `CarsController`'s `index` action, your `index` action is empty in your `CarsController`, and your view is not displaying your cars. Address these issues to get the tests to pass.

### Hop on a Train
Cars are fast! However, sitting in traffic is THE WORST. Let's catch a train, so we are always on the move.

Run the following commands to create a Train model and controller.

```no-highlight
rails generate controller Trains -—skip-template-engine --skip-routes --no-helper-specs
rails generate model Train name:string --no-test-framework
rake db:migrate
```

Also go to `spec/features/sees_trains_spec.rb` and remove the pending status from the test.

Run `rake`. You should have failing tests because your missing a route to your `TrainsController`'s `index` action, your `index` action is empty in your `TrainsController`, and your do not have a view for `TrainsController`'s `index` action. Address these issues to get the tests to pass.

### Hop on an Airplane

Trains are sweet, but they still take a while if I want to travel across an entire country. Let's hop on a plane and travel the world!

Run the following commands to create a migration for your Airplane and run it.

```no-highlight
rails generate migration create_airplanes name:string
rake db:migrate
```
Go to `spec/features/sees_airplanes_spec.rb` and remove the pending status from the test.

Run `rake`. You should now create a model, controller, and a view to see all airplanes in order to get your tests to pass! **DO NOT USE GENERATORS**. Instead, manually create all the files and add the appropriate code.
