After seeing Troll 2 for the eighth time, we decide to grab some dessert on the
way home. We return into town and visit one of our Ruby oriented shopkeepers. 

This time, we stop in at "Cookies & Code". As you may have guessed, before you
can enjoy a delicious cookie, there's code to be written! 

The owner has asked you to build a `CookieInventory` class.

This class should allow you to bake trays of `:peanut_butter`,
`:chocolate_chip`, and `:sugar` cookies with a `cook_batch!` instance method
that takes two arguments: the type of cookie, and the number of cookies baked.
This should increase the inventory for the cookie type baked.

You should also be able to `sell!` cookies with two arguments: the type of
cookie, and the number of cookies sold. This should deduct from the inventory as
you sell the cookies. Your instance method should also be sure not to sell
cookies you don't have in inventory. So, you should output an error message
"Sold Out!" and not deduct from the inventory if the sale quantity exceeds what
you have in inventory.

{% show_hint %}
* What data structure would allow you to correlate the type of cookie with its
    quantity?
* When you create a new `CookieInventory`, how many cookies do you start with?
{% endshow_hint %}
