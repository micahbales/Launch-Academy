## OMG We Need to Validate Recipes!!

### Learning Goals
* Practice writing instance methods
* Implement class methods to check inputs
* Clarify by practical application the difference between instance and class methods

### Instructions
Your client is highly allergic to many foods and can only eat recipes that contain certain types of ingredients, which are the ones below:

```ruby
Brussels sprouts
spinach
eggs
milk
tofu
seitan
bell peppers
quinoa
kale
chocolate
beer
wine
whiskey
```

If a recipe contains any ingredients other than these, your client will have to be sent to the hospital. That would be bad, both for your client and for your career as a developer. So what can you do?

### Requirements

* Implement an instance method in your `Ingredient` class that helps check whether an ingredient is valid (i.e., contains only the ingredient names above)?
* Write a `Recipe` instance method that returns `true` or `false` depending on whether or not your client can have that particular dish.
* What if your input to your `Ingredient` class comes in a different format? Write an `Ingredient` [class method](class-instance-methods) called `parse` which takes in a string that will look like `47 lb(s) Brussels sprouts` or `5 tspn(s) milk` and generates a variable of the `Ingredient` class in the right format. In other words, when that string is passed into your `parse` method as an argument, it should build an instance of `Ingredient` with a `unit`, `quantity`, and `name`.

### Final Submission Instructions
Submit your updated code in `code.rb`, with all class definitions necessary to achieve the requirements.

At the bottom of the file, write some Ruby code that serves as a set of "test cases" to ensure your methods are working. For example, try building a new `Recipe` with "safe" ingredients and make sure your method that checks the safety of the ingredients returns true when run on that recipe. Here is an example way you might do this:

```ruby
safe_name = "Chocolate Quinoa"
safe_ingredients = [
        Ingredient.new(1.0, "cup", "quinoa"),
        Ingredient.new(1.0, "cup", "chocolate")
      ]
safe_instructions = [
        "Melt chocolate.",
        "Pour over quinoa.",
        "Regret your life."
      ]
safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
puts "Is #{safe_recipe.name} safe? #{safe_recipe.has_allergens?}"
```

Include test cases for all three methods and think of unusual cases that may arise to make sure you've covered all your bases.
