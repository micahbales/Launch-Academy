## HTTP Questions

These questions will help to reinforce your understanding of the HTTP protocol. Use the readings on HTTP, your notes, your peers, and good-old trusty Google to answer the following questions:

* * *
**Q: What are the five HTTP verbs we use to Create, Read, Update, and Delete resources on the web?**

A: POST, GET, PUT/PATCH, DELETE



* * *
**Q: Define each of the HTTP verbs in question #1.**

A: POST - sends information to be stored by the server,
GET - retrieves information stored on the server,
PUT/PATCH - updates information stored on the server,
DELETE - removes information stored on the server



* * *
**Q: What are the components of a HTTP request?**

A: 1. HTTP verb
2. Path
3. Protocol and version
4. Headers



* * *
**Q: What are the components of a HTTP response?**

A: 1. Protocol and version
2. Status code and message
3. Headers
4. Body



* * *
**Q: What is a Status Code?**

A: A number and message, indicating the response being given by the server



* * *
**Q: What are the different types of Status Codes? List a few Status Codes which you think are important to remember.**

A: 200 OK - the HTTP request was successful
301 Moved Permanently - indicates redirection of a URL
404 Not Found - the resource doesn't exist at the path provided
500 Internal Server Error - something is wrong with the server



* * *
**Q: Can you draw the HTTP Request/Response cycle from memory?**

**Note:** It is **highly likely** someone will ask you to do this in an interview setting. Try it out on a whiteboard or on paper, now.

A:

Request:

GET /r/widgets HTTP/1.1
Host: www.reddit.com

Response:

HTTP/1.1 200 OK
Content-Type: text/html
(other headers) ...
<!DOCTYPE html>
(body) ...


* * *
**Q: What is the difference between the `PUT` and `PATCH` HTTP verbs?**

A: PATCH is used to update parts of a resource, but not all of it
PUT is used to completely replace a resource with a new version



* * *
**Q: Name the different parts of the following URL**

```
-                      2                             4
            ┌──────────┴──────────┐         ┌────────┴────────┐
    https://learn.launchacademy.com/searches?utf8=✓&query=rspec
    └─┬─┘                          └───┬───┘
      1                                3
```

A:

    1. Scheme

    2. Hostname

    3. Path

    4. Query

* * *
