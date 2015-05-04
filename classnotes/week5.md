#Week 5 Class Notes
##Ruby on Rails
* Rails is an open source web framework written in Ruby for building websites/web apps
* Solves the most common problems faced when building websites
* Create by David Heinemeier Hansson in 2004 as an extraction of the reusable components of Basecamp (which is a project management application).

**Software Framework** - an abstraction in which software providing generic functionality can be selectively changed by additional user-written code, thus providing application-specific software.

Some things Rails does for us:
* Parses stuff for us.
* Consumes data for us (HTTP requests).
* Good organizational system - no longer have to create your own file system.
* Separate folders for HTML, CSS, etc.
* Has mailer functionality built in.

We'll start going into specific components of Rails in the upcoming classes. So we'll go into ActiveRecord, routing, etc.

##Rails and the Browser
***To understand Rails you need to understand how the Internet works.***

When you're in the browser and you type in a request for a Rails application, it's broken into many different packets for bits, which are linked together, it goes to the DNS server, goes through various routers and finally arrives at the server, which is running Rails.

The server needs to determine which piece of our code is responsible for what the server receives. There is a notion of **HTTP verbs**. Those are verbs like `get`, `put`, `post`, and `delete`. The verb you use will determine what piece of code the server should reference.
![](http://andreibondarev.github.io/bewd/assets/rails/response_request.png)

###Model/View/Controller (MVC) Framework
* Model: your database - Rails classes that communicate with the database
* View: JSON documents - template that will be generated into HTML. If it's an API endpoint, then the view will be JSON.
* Controllers: get the request, parse the data, and hand off to the model.

---
##Lab Time
1. You installed Rails v 4.2.1
2. You verified that you have SQLite 3 version 3.8.5

---

##Scaffold Books
##Structure of a Rails App
![](http://andreibondarev.github.io/bewd/assets/rails/app_structure.png)
* Most of your application logic belongs in `app/`
* `public/` contains statis files that are directly available.
###Structure of a Rails App
Most of the code we write belongs in the `app` folder.
* `app/assets`: CSS, JavaScript and images used in the views.
* `app/controllers`: Classes which receive specific requests and render responses.
* `app/helpers`: Utility modules which define methods for views to use.
* `app/mailers`: Classes that define various outbound emails in your app.
* `app/models`: Classes defining your data models (e.g.. `User`, `Comment`, `Post`).
* `app/views`: Templates called by your controllers to render HTMl.
* `app/views/layouts`: Master templates to be used throughout your website.

---
##Lab Time
While other people were installing Rails you created your first Rails app entitled `hello_world`. You can check it out in classwork/week5/.
