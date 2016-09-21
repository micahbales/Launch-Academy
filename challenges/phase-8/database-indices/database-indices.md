## OMG It's Taking Too Long to Find Our Brussels Sprouts!

### Instructions

We have gigantic database `ingredients` of millions (or thousands, if your computer is slow!) of ingredient records. We want all the rows of ingredients that have Brussels Sprouts in them, but querying them is taking forever. Database indices to the rescue!

### Setup

Extract the `ingredients.tar.bz2` archive:

`tar -jxvf ingredients.tar.bz2`

Create a database called `ingredients`:

`createdb ingredients`

Now that you have created your `ingredients` database, we will populate it with data. The `ingredients-1m.sql` file contains 1 million records. The `ingredients-100k.sql` contains 100 thousand records. If you have a slower machine, use the smaller file to populate your database. Run one of the following two commands:

`psql ingredients < ingredients-100k.sql`

`psql ingredients < ingredients-1m.sql`

Now you have an `ingredients` table in your `ingredients` database, loaded with data.

Write an SQL query to

* Find all rows that have an ingredient `name` of `Brussels sprouts`.
* Calculate the total count of rows of ingredients with a `name` of `Brussels sprouts`.
* Find all `Brussels sprouts` ingredients having a unit type of `gallon(s)`.
* Find all rows that have a unit type of `gallon(s)`, a name of `Brussels sprouts` or has the letter `j` in it.

Finally
* Implement a database index to speed up your above SQL queries.

### Learning Goals
* Utilize a database index to speed up SQL queries.
* Get more comfortable with the `psql` console.

### Output
* Submit a markdown file titled `submission.md` that has embedded screenshots depicting a 'before' and 'after' of your query (i.e., without and with an index). Include the SQL queries you wrote to search the database as well as to create the index.

### Tips
* Use the `SQL` query prefix `EXPLAIN ANALYZE` to calculate the total runtime of a query.
* Find more on how to write a markdown file [here](https://help.github.com/articles/markdown-basics/) and [here](https://help.github.com/articles/github-flavored-markdown/).
* Use the following syntax for embedding an image into a markdown file:

```
![alt](https://s3.amazonaws.com/horizon-production/images/FCq35i5.png)
```
