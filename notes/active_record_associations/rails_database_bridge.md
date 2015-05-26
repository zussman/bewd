#Active Record: The Rails Database Bridge
Rails uses ORM (Object-Relational Mapping) to let you manage your database in the business logic language (Ruby). Rails' ORM is *Active Record*. 

##What is Active Record?
Active Record is a layer of Ruby code that runs between the database and your logic code. When you need to make changes to a database, you'll write Ruby code, and then run migrations. The migrations will make the actual changes to the database. The cool part of Active Record is that it is database agnostic, so you can devellop with SQLite and deploy with Heroku (PostreSQL).

Active Record is the M in Rails' MVC Model.

##Creating Models and Migrations
You can generate a table a few different ways:

```
rails generate model Person
rails g model Person
rails g model Person first_name last_name age:integer
```
Note that you can leave `first_name` and `last_name` without a type because they will default to a string, which is what you want. 

What does this actually do? You'll see some output that explains that it's creating a migration file for you.

Note that if you created a table and didn't specify any column fields it would still generate three columns by default: `id`, `created_at`, and `updated_at`, which provide a unique id for each instance of the model class, a datetime for the creation of each model class instance, and an updated time datetime for each change in a model class instance.

###Rollbacks
One of the important ideas with migrations is that you can roll them back, or undo their effects. That means that each migration class needs to have enough information to undo its effects. Several methods, can "undo themselves", for example: the opposite of adding a table is removing it, which doesn't take any extra information. That is why we can use the `change` method here. However, if we were doing something that can't be automatically undone, we have to specify the actions for doing and undoing our migration.  In these cases, our migration class should have two methods: `up` and `down`. The `up` method will detail what to do when running the migration, and the `down` method will explain how to roll back the migration.

We can write our own migration from scratch to give the rollback feature a try. Start by generating a blank migration:

```
rails g migration do_stuff
```

There are a bunch of helpful methods that you can use in your migration files, including the following:

* add_column
* add_index
* add_timestamps
* change_column
* change_table
* create_table
* drop_table
* remove_column
* remove_index
* remove_timestamps
* rename_column
* rename_index
* rename_table

Here is a list of supported types that you can use in your migration classes:

* binary
* boolean
* date
* datetime
* decimal
* float
* integer
* primary_key
* string
* text
* time
* timestamp

##Looking at the Active Record Class
Now that we've set up the database, we're ready to look at the other part of our model: the Active Record class. This is the piece that you'll actually interact with from your Rails controller. When we created the `Person` model, a file `app/models/person.rb` was created; it looks like this:

```
class Person < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name
end
```

As you know, `attribute_accessor` makes the getter and setter methods for the attributes in question. Any attribute accessible properties can be set via mass assignment. This means setting a bunch of properties on an object at once is possible, as in the following:

```
Person.new first_name: "Andrew", last_name: "Burgess", age: 22
```



