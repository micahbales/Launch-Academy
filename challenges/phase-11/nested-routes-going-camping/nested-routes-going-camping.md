# Nested Routes: Going Camping


Some launchers are going camping, so - naturally - they decided to write a rails app to help them organize.

The Rails app has several Models:

`Camper`s, which reflect the people going camping.

`Supply`-ies, indicating the different supplies that the launchers are bringing with them.

`Campsite`, the different areas the Campers will be camping in.

A `Campsite` can have many `Campers`, and a `Camper` can have many `Supply`-ies.

We've got index views for all of those resources, but they're a little disorganized. What we really want is to see what each `Camper` is bringing, and which `Camper`s belong to which `Campsite`.

## Instructions

0. cd into the `camping-trip-rails`
1. run `bundle install`
2. run `rake db:create` to create your database.
3. run `rake db:migrate` to run all of your migrations.
4. run `rake db:seed` to seed your database with the camping data
5. Modify the necessary files required to make the tests pass when you run `rake`.
6. You should have the following routes.

- `/campers/:camper_id/supplies` should show us all `supplies` belonging to the given `camper`
- `/campsites/:campsite_id/campers` should show us all `campers` belonging to the given `campsite`

## Tips

* Look at the `routes` file to understand how the routing system currently works.
* Review the failing test setups to see what the end result should look like.
* Some controllers will contain logic that it only ever hits under certain conditions, depending on the route that lead it there!
