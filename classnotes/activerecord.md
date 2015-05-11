#Active Record Notes
##1. What is Active Record?
Active record is the 'M' in 'MVC' (Model-View-Controller)–**the model**. The model is the layer of the system responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database. It is an implementation (maybe even an instance?) of the "Active Record pattern", which is itself a description of the [Object Relational Mapping](http://en.wikipedia.org/wiki/Object-relational_mapping) system.

Use the ORM link above to read the Wikipedia page on ORM mapping. It is really helpful. Essentially, The ORM takes the atomized scalar database structure and allows you to create object-oriented non-scalar objects based on that data. It sets up the relationship mapping for you, so that you can focus more on how that data is created/used/edited/destroyed/etc.


###1.1 The Active Record Pattern
Active Record was described by Martin Fowler in his book *Patterns of Enterprise Application Architecture*. In Active Record, objects carry both persistent data and behavior which operates on that data. Active Record takes the opinion that ensuring data access logic as part of the object wil educate users of that boject on how to write to and read from the database.

###1.2 ORM (Object Relational Mapping)
ORM is a technique that connects the rich objects of an application to tables in a relational database management system. Using ORM, the properties and relationships of the objects in an application can be easily stored and retrieved from a database without writing SQL statements directly and with less overall database access code.

###1.3 Active Record as an ORM framework
Active Record gives you several mechanisms, including the abilities to:
* Represent models and their data
* Represent associations between those models
* Represent inheritance hierarchies through related models
* Validate models before they get persisted to a database
* Perform database operations in an object-oriented fashion.

##2. Convention over Configuration in Active Record
Other languages or frameworks might require a lot of configuration code. That is actually the case for most ORM frameworks. However, if you follow the conventions adopted by Rails, you can write very little configuration (or maybe none at all) to create Active Record models. The idea is that if you configure your applications in the very same way most of the time then that should be the default way. So, explicit configuration would only be needed in cases where you can't follow the standard convention.

***What are some examples of instances where you wouldn't be able to follow standard convention for your models?***

###2.1 Naming Conventions
Active Record uses some naming conventions to find out how the mapping between models and database tables should be created. **Rails** will pluralize your class names to find the respective database table. So, for a class `Book`, you should have a database table calls `books`. The Rails pluralization mechanisms are very powerful, and are able to pluralize (and singularize) regular and irregular words (for example, turning `Mouse` into `mice`, etc.). When you use class names composed of two or more words, the model class name should follow the Ruby conventions, using the **CamelCase** form, while the table name must contain the words separated by underscores. For example:

* Database Table - Plural the underscores separating words (e.g., `book_clubs`)
* Model Class - Singular with the first letter of each word capitalized (e.g., `BookClub`)

| Model/Class | Table/Schema|
| ----------- | ----------- |
| Article | articles |
| LineItem | line_items |
| Deer | deers |
| Mouse | mice |
| Person | people |

###2.2 Schema Conventions
Active Record uses naming conventions for the columns in database tables, depending on the purpose of the columns.

* **Foreign keys** - Foreign key fields should be named following the pattern `singularized_table_name_id`, (e.g., `item_id`, `order_id`, `contact_id`). Foreign key fields are the fields that Active Record will look for when you create associations between your models.
* **Primary keys** - By default, Active Record will use an integer column named `id` as the table's primary key. When you use Active Record Migrations to create your tables, this column will be automatically created.

There are also some optional column names that you can use to add additional features to Active Record instances:

* `created_at` - Automatically gets set to the current date and time when the record is first created.
* `updated_at` - Automatically gets set to the current date and time whenever the record is updated.
* `lock_version` - Adds optimistic locking to a model.
* `type` - Specifies that the model uses  'Single Table Inheritance'.
* `(association_name)_type` - Stores the type for polymorphic associations.
* `(table_name)_count` - Used to cache the number of belonging objects on associations. For example, a `comments_count` column in an `Articles` class that has many instances of `Comment` will cache the number of existent comments for each article.

---
While the column names are optional, they are reserved by Active Record. So, ***DO NOT USE*** the reserved keywords unless you want the extra functionality. For example `type` is a reserved keyword used to designate a table using ***Single Table Inheritance (STI)***. If you are not using STI, try an analogous keyword like "context" that still accurately describes the data you are modeling, but doesn't use the reserved Active Record keyword.

##3 Creating Active Record Models
It is really easy to create Active Record models. All you have to do is to subclass the `ActiveRecord::Base` class:

```
class Product < ActiveRecord::Base
end
```
That code will create a `Product` model, mapped to a `products` table at the database. By doing this you'll also have the ability to map the columns of each row in that table with the attributes of the instances of your model. Suppose that the `products` table was created using an SQL sentence like:

```
CREATE TABLE products (
	id int(11) NOT NULL auto_increment,
	name varchar(255),
	PRIMARY KEY (id)
);

Following the table schema above, you would be able to write code like the following:

```
p = Product.new
p.name = "Some Book"
puts p.name # "Some Book"
```

##4 Overriding the Naming Conventions
What if you need to follow a different naming convention or need to use your Rails applciation with a legacy database? No problem! You can easily override the default conventions.

You can use the `ActiveRecord::Base.table_name=` method to specify the table name that should be used:

```
class Product < ActiveRecord::Base
	self.table_name = "PRODUCT"
end
```
If you do this, you will have to define manually the class name that is hosting the fixtures (class_name.yml) using the `set_fixture_class` method in your test definition:

```
class FunnyJoke < ActiveSupport::TestCase
	set_fixture_class funny_jokes: Jokes
	fixtures: funny_jokes
	...
end
```
It's also possible to override the column that should be used as the table's primary key using the `ActiveRecord::Base.primary_key=` method:

```
class Product < ActiveRecord::Base
	self.primary_kay = "product_id" #instead of the default 'id'
end
```

##5 CRUD: Reading and Writing Data
CRUD is an acrobym for the four verbs you use to operate on data: **Create, Read, Update, and Delete**. Active Record automatically creates methods to allow an application to read and manipulate data stored within its tables.

###5.1 Create
Active Record objects can be created from a hash, a block, or have their attributes set manually after creation. The `new` method will return a new object while `create` will return the object *and* save it to the database.

For example, given a model `User` with attributes of `name` and `occupation`, the `create` method call will create and save a new record into the database:

```
user = User.create(name: "David", occupation: "Baker")
```
Using the `new` method, and object can be instantiated without being saved:

```
user = User.new
user.name = "David"
user.occupation = "Baker"
```
A call to `user.save` would commit the new record to the database.

Finally, if a block is provided, both `create` and `new` will yield the new object to that block for initialization:

```
user = User.new do |u|
	u.name = "David"
	u.occupation = "Baker"
end
```

###5.2 Read
Active Record provides a rich API for accessing data within a database. There is a really good resource for these at the [Active Record Query Interface Guide](http://guides.rubyonrails.org/active_record_querying.html).

###5.3 Update
Once an Active record object has been retrieved, its attributes can be modified and it can be saved to the database.

```
user = User.find_by(name: 'David')
user.name = 'Dave'
user.save
```
A shorthand for that is to use a hash mapping attribute names to the desired value, like so:

```
user = User.find_by(name: 'David')
user.update(name: 'Dave')
```
This is most useful when updating several attributes at once. If, on the other hand, you'd like to update several records in bulk, you may find the `update_all` class method useful:

```
User.update_all "max_Login_attempts = 3, must_change_password = 'true'"
```
###5.4 Delete
Likewise, one retrieved an Active Record object can be destroyed which removes it from the database.

```
user = User.find_by(name: 'David')
user.destroy
```
##6 Validations
Active Record allows you to validate the state of a model before it gets written into the database. There are several methods that you can use to check your models and validate that an attribute value is not empty, is unique, and not already in the database, follows a specific format, and many more. Yay! I've been wondering about this!

Validation is a very important issue to consider when persisting to the database, so the methods `save` and `update` take it into account when running: they return `false` when validation fails and they didn't actually perform any operation on the database. All of these have a `bang` counterpart (that is, `save!` and `update!`), which are stricter and raise the exception `ActiveRecord::RecordInvalid` if validation fails. A quick example to illustrate:

```
class User < ActiveRecord::Base
	validates :name, presence: true
end

user = User.new
user.save  # => false
user.save  # => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
```

The [Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html) guide has more info. You should really read this document because validation is going to be crucial for your models and it will be important for you to understand the tools available to you for validating data before saving it to the database.

##7 Callbacks
Active Record callbacks allow you to attach code to certain events in the life-cycle of your models. This enables you to add behavior to your models by transparently executing code when those events occur, like when you create a new record, update it, destroy it, and so on. You can learn more about callbacks in the [Active Record Callbacks guide](http://guides.rubyonrails.org/active_record_callbacks.html).

##8 Migrations
Rails provides a domain-specific language for managing a database schema called migrations. Migrations are stored in files which are executed against any database that Active Record supports using `rake`. Here's a migration that creates a table:

```
class CreatePublications < ActiveRecord::Migration
	def change
		create_table :publications do |t|
			t.string :title
			t.text :description
			t.references :publication_type
			t.integer :publisher_id
			t.string :publisher_type
			t.boolean :single_issue
			
			t.timestamps null: false
		end
		add_index :publications, :publication_type_id
	end
end
```
Rails keeps track of which files have been committed to the database and provides rollback features. To actually create the table, you'd run `rake db:migrate` and to roll it back, `rake db:rollback`.

Note that the above code is database-agnostic: it will run in MySQL, PostgreSQL, Oracle and others. The [Active Record Migrations guide](http://guides.rubyonrails.org/migrations.html) is basically essential for this.