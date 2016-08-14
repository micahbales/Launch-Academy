[The Crypt of Civilization](http://en.wikipedia.org/wiki/Crypt_of_Civilization)
and its
[contents](http://www.oglethorpe.edu/about_us/crypt_of_civilization/inventory.asp)
are interesting and all, but what if we want to create our own Time Capsule?

### Part 1

We can use an array to store the contents of our time capsule in a variable
called `time_capsule`. Write a program that does the following:

* Greet the user and take their name. Store this name.
* Ask the user what they want to add to the time capsule. Give the user an option to type the command "FINISHED" which stops the user from getting asked to add more items.
* If they entered an item, store that item in the time capsule.
* Once finished, print out the contents of the time capsule of the user to see in the following format (`name` here is "Gandalf"):

```
Gandalf, thanks for trying our Time Capsule maker. Here is a list of the items in your Time Capsule!:

* Comptometer
* Box of phonographic records
* plastic savings bank
* set of scales
* Toast-O-Lator
* sample of aluminum foil
* Donald Duck doll
```
By the way, don't worry about duplicates here! If you type the same thing in a
few times, you will see it that number of times. For example, say you type
'Toast-O-Lator' three times in your list, you will see something like this
(depending on when you typed them in):

```
Gandalf, thanks for trying our Time Capsule maker. Here is a list of the items in your Time Capsule!:

* Toast-O-Lator
* Comptometer
* Box of phonographic records
* plastic savings bank
* Toast-O-Lator
* set of scales
* Toast-O-Lator
* sample of aluminum foil
* Donald Duck doll
```

### Part 2

Update your program from Part 1 to store a count for each item added. After
prompting a user for an item, prompt them for a number (greater than 0) of that
item. The output of your program should be the following (the number in
parantheses is the count of each respective item):

```
Gandalf, thanks for trying our Time Capsule maker. Here is a list of the items in your Time Capsule!:

* Comptometer (1)
* Box of phonographic records (1)
* plastic savings bank (4)
* set of scales (1)
* Toast-O-Lator (108)
* sample of aluminum foil (3)
* Donald Duck doll (87)
```

###Video Solution

{% show_solution %}
{% vimeo_video "124954510" %}
{% endshow_solution %}
