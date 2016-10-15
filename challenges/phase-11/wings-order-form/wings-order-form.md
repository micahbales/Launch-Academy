# Wings Order

We have successfully created an application to create delicious wing orders of various flavors!

## Application Set Up
Set up the application and run the test suite with the following commands:

```no-highlight
bundle install
rake db:create
rake db:migrate
rake db:seed
rake
```
The tests should be passing, and the form should be working correctly.

## Refactor the wing order form

However, we did not use [Rails Form Helpers][rails-form-helpers], so the HTML that makes up our form is starting to become excessive and difficult to understand.
Let's refactor the form to use the appropriate rails form helpers to reduce the html clutter.

Refactor the form in `wing_orders/new.html.erb` to user Rails form helpers. Understanding and knowing your way around the Rails documentation is an important skill to learn. Look into the following resources for guidance:
- [Select and Option Tags][select-and-option-tags]
- [Collection Radio Buttons][collection-radio-buttons]
- [Check Boxes][check-boxes]
- [Collection Check Boxes][collection-check-boxes]

[rails-form-helpers]: http://guides.rubyonrails.org/form_helpers.html
[select-and-option-tags]: http://guides.rubyonrails.org/form_helpers.html#the-select-and-option-tags
[collection-radio-buttons]: http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_radio_buttons
[check-boxes]: http://guides.rubyonrails.org/form_helpers.html#checkboxes
[collection-check-boxes]: http://edgeapi.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_check_boxes

Once your are finished refactoring the form, run `rake` to ensure that the original functionality still works.

## Render forms in a partial

It would be nice if we could edit our orders in case we forgot to add ranch dressing! Write an acceptance test and implement functionality for editing a wing order. Leverage the same form helper we created by creating a partial for the form and rendering it in two places.
