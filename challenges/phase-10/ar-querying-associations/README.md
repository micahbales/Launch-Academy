How would you return all the recipes in your database?

recipes = Recipe.all

How would you return all the comments in your database?

comments = Comment.all

How would you return the most recent recipe posted in your database?

recipe = Recipe.order(created_at: :desc).limit(1)

How would you return all the comments of the most recent recipe in your database?

recipe = Recipe.last
comments = Comment.where(recipe_id: recipe.id)

How would you return the most recent comment of all your comments?

comment = Comment.order(created_at: :desc).limit(1)

How would you return the recipe associated with the most recent comment in your database?

comment = Comment.last
recipe = Recipe.where(id: comment.recipe_id)

How would you return all comments that include the string brussels in them?

comments = Comment.where(body: "brussels")
