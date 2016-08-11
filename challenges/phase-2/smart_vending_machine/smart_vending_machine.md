##Part 1

Time to put it all together and make a fully-functional vending machine! Well,
at least one that properly dispenses words.
Write a program that achieves the following steps:

1. Ask the user what's the name of the item they would like.
2. Accept the user answer and save it as a variable.
3. Ask the user how many of the thing they would like.
4. Accept the user's answer (should be a number) and save it as a variable
5. Use the answer to start a `.times` loop, in which you print the word the user asked for, the number of times that they specified.

####Sample Output

```
Hello, I'm the first and only Talking Vending Machine.
What would you like today?
> Bag of chips
How many of those would you like?
> 3
Bag of chips
Bag of chips
Bag of chips
There you go! Come again!
```

##Part 2

Next, we want to add one more feature to our vending machine in which a customer
can ask for "tons" of something as an amount, and get a random amount of
whatever they asked for. Modify your program so it achieves the following:

1. Start by going through the same steps as above.
2. When the user is asked how many things they would like, if they say "tons", do the following:
3. Begin an infinite `while` loop. Each time the loop runs:
  - Print the word(s) the user asked for.
  - Generate a random number between 0 and 14.
  - If the number is equal to 0, break out of the loop.

####Sample Output:

```
Hello, I'm the first and only Talking Vending Machine.
What would you like today?
> Bag of chips
How many of those would you like?
> tons
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
There you go! Come again!
```

##Part 3

Some customers are getting so excited by the prospect of getting "tons" of food that they aren't following our rules very well, and typing invalid input like "I want tons!!!!!" when asked how many items they want. Let's modify our program so that instead of needing to type the word "tons" exactly, a user can now type the word "tons" *anywhere* in their answer to get the same result as described in Part 2.

Modify your program to use `.index` and `.nil?` to check if the user input contains the string "tons".

####Sample Output:

```
Hello, I'm the first and only Talking Vending Machine.
What would you like today?
> Bag of chips
How many of those would you like?
> oh boy, tons!!!!!
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
Bag of chips
There you go! Come again!
```
