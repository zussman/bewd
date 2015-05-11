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
* `app/helpers`: Utility modules which define methods for views to use. Agnostic to the models that you're working on. Maybe more for displaying all data in a certain way. Like, how many decimals should you have, or is it uppercase, or something.
* `app/mailers`: Classes that define various outbound emails in your app.
* `app/models`: Classes defining your data models (e.g.. `User`, `Comment`, `Post`).
* `app/views`: Templates called by your controllers to render HTMl.
* `app/views/layouts`: Master templates to be used throughout your website. Contains the HTML that is shared amongst the whole site.
* `lib`: contains any classes that communicate with other APIs. It is like a gem, but the ones that we write ourselves.
* `log`: is for logging the execution of your application.

---
##Lab Time
While other people were installing Rails you created your first Rails app entitled `hello_world`. You can check it out in classwork/week5/.
* Look up app naming conventions.

### First App - SampleApp
* There are a bunch of libraries that are already included when you create the new application, including things like Coffee Script, ActiveRecord, Rails, Tilt, SQLite3, Uglifier (Turns JavaScript into totally ugly javascript with one-character variables in one line. Basically, a hack to shrink your Javascript files into one blob) and a whole bunch more. In fact, your new application has 12 gem dependencies with 54 gems installed. It's pretty cool. You should look up what each of these do, as they seem pretty cool.

1. cd into your application
2. go to your rails server by typing in `rails server`
3. Go to `localhost:3000` in your browser. Mazal tov, you're using Ruby on Rails.

It will tell you what localhost you can use to see your application.

###Set up some CRUD pages
CRUD pages and scaffolding will provide: 
* controllers
* the model to represent the classes for the database
* a set of views
* will provide tests
* will provide CSS so you can style your views for the user.
* Will provide you a JavaScript file where you can write your JavaScript.

```
rails generate scaffold Book author:string title:string abstract:text

```

Rails provides generators that create some code up front for you. The command `generate scaffold` creates a code scaffold that you can begin working with. Rails created a migration that creates a table with the fields that we defined for us. Rails has a convention for naming, so that the name of a model is singular, but the name of the corresponding table is plural.

```
rake db:migrate
```
You migrate so that Rails can keep track of the migrations as a list of instructions so that it can recreate all the database from scratch. That way you can recreate the exact same database on other machines (for example, on the server). That is SO COOL!

We used the scaffolding to create some new books. It's really fucking cool. But we are going to construct this ourselves over the coming weeks, because it's best practice to create on your own and get deeper functionality.

####Look through the controllers! That's where a lot of the magic happens!

* The **index view** of your rails app typically shows all of the data you've created so far. 
* **Show view** shows specific information about one instance of a class. It will usually be accompanied by an ID from the database. The Unique ID.
* **Active Record** is the Ruby on Rails library for communicating with the database. You ***need*** to become really talented at Active Record. I think that will be a very important part of your success (or lack thereof) with Ruby.
* `.erb` stands for 'embedded ruby', which you can use to jave ruby inline in HTML.

##Rails Console
You can load an irb style environment for your application by going to the root folder and using the `rails console` command. That will load all the information and data from your application so that you can use methods and variables without defining them anew.

Your Rails server can also serve as a file server.

##Stages of Development
1. Development (working on it)
2. Staging (trial phase)
3. Production (when it's out in the world)

You should try and read up on stages of development.

#Part II - Wednesday May 6
---
*We went over some Git stuff this evening before getting into Rails.*

---

###Code Along!
We're making two games today:
1. Secret Number Game (together)
2. Rock Paper Scissors (on our own at the end)

####Routes
The order of routes does matter. It goes in order of precedence.
These are the default routes for your resources:

```
    secret_numbers GET    /secret_numbers(.:format)          secret_numbers#index
                   POST   /secret_numbers(.:format)          secret_numbers#create
 new_secret_number GET    /secret_numbers/new(.:format)      secret_numbers#new
edit_secret_number GET    /secret_numbers/:id/edit(.:format) secret_numbers#edit
     secret_number GET    /secret_numbers/:id(.:format)      secret_numbers#show
                   PATCH  /secret_numbers/:id(.:format)      secret_numbers#update
                   PUT    /secret_numbers/:id(.:format)      secret_numbers#update
                   DELETE /secret_numbers/:id(.:format)      secret_numbers#destroy
                   
```
The different routes allow you to go to the same URL but you can use different HTML verbs to route differently. The `.:format` allows you to have different endings to your URL like `.html` and still have your controller action work.

####View Helpers
We are going to use view helpers!
We need to create the route to the image and copy the image into the correct assets directory.
* `link_to` helper makes our links for us!
* `image-tag` - Specify your path in it and it will create the img source html for you!

Convention over configuration
We can often name our view the same as our action....this was important but I didn't get it.

When you're escaping from Ruby `=` will output the tag to the HTML, and when you don't, it won't be output to the HTML.
The instance variables you create in your controller will be available in your view. Remember that when you insubstantiate your models.


##MVC Ruby Framework
![](http://andreibondarev.github.io/bewd/assets/rails/mvc_diagram.png)

#Rails Help!
**guides.rubyonrails.org**

* Rails Routing from the Outside in
* Action Controller Overview
* Active Record Query Interface

CHECK THESE OUT, YO!
