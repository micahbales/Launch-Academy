## Introduction

Do you hear that noise? The rumbling of fun in the distance, the carefree destruction of our free time and supply of intoxicants...


## It's Party Time.

In the associated `code.rb` file, we've defined a `module`, `PartyGoer`, that we're going to use to define the behavior of the people invited to the party! When each guest comes in, we're going to include this module in them, and pass its methods on!


Our parties have simple rules:

-  Party goers should be able to `#drink`, `#sing`, and `#cause_havoc`.
-  `#drink` returns `true` until you try to have a fourth drink, after which it returns `false`.
-  `#sing` should always return a string.
-  We don't have any *explicit* ways to create havoc, and we'd rather let the party goers define that for themselves. Raise a `PersonalizedHavocError` error with the message "You should define this yourself!" when calling `#cause_havoc`. Hint: You will have to create a custom error class.
- The `PartyGoer` module should have an `invited?` method. When the `Launcher` class includes the `PartyGoer` module, `invited?` should be a class method in the `Launcher` class that returns `true`.
- As a "stretch goal", write unit tests for your module.
