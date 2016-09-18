# Dog Park: Lost and Found

OMG! Our dogs are having so much fun playing at the dog park that they're losing their collars. After a busy weekend at the dog park, the staff at the `Lost and Found` counter are determined to empty their storage of these crucial bits of lost property. Collars contain valuable information, such as the details to find the loving owner of a pup and the vaccinations required to be displayed in public. We have a mission.

### Learning Goals
* Learn about SQL Joins
* Understand what join is required to display a particular set of information

### Instructions

* Generate a database called `dog_park` in your terminal.
* Use the provided `schema.sql` file to import data.

Jessica, the developer on the the `Lost and Found` team, is going to open up PostgreSQL and start reconnecting dog owners with dog collars. She will find two tables already in the database:

### Dog Owners Table

This table contains the names of people and their dog. This data was recorded on the sign in sheet at the front desk.

![alt](https://s3.amazonaws.com/horizon-production/images/fRdwPhZ.png)

### Found Dog Collars Table

This table contains the names of the collars in the `Lost and Found` office.

![alt](https://s3.amazonaws.com/horizon-production/images/oD6NeZz.png)

### Where do we start?

To successfully start this mission, Jessica needs to make some connections between the two tables. SQL Joins are important tools in making this possible. She starts with this query:

```SQL
SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);
```

Here is what this query displays in her terminal:

![alt](https://s3.amazonaws.com/horizon-production/images/v1xUxzn.png)

Jessica has lots of bug fixes that need to get finished and pushed into production, so she's asked you to finish writing the queries that the team needs. She's provided you with a set of questions that can be answered using SQL joins.

### Joins

Here are some possible joins one can use when querying the database:

```SQL
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
LEFT OUTER JOIN
RIGHT OUTER JOIN
```

### What Jessica needs to know

Report back to Jessica with queries that answer the following questions:

1. Which collars have a known owner? Display only collars with known owners and those owners' names.
2. For which collars is there no known owner? Display only collars without known owners.
3. What collars are in our possession? Display all collars in our possession. If an owner exists for a given collar, display that also.
4. What owners do we know about? Display all owners known to us. If a collar matches that owner, display the collar also.

Use the provided `joins.sql` file to store your queries.


### Success! And Re-Factor.

Great! Jessica is very happy to have the results you've sent her. However, some of them are hard to read because the headings are ambiguous. For example, a heading may only display `name`, but we have both dogs and owners in our database. Let's clarify what data each column is using. Try using the `AS` keyword ([documentation](http://www.postgresql.org/docs/9.2/static/queries-table-expressions.html#QUERIES-TABLE-ALIASES)) to make any query more descriptive.
