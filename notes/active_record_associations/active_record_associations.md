#Active Record Associations
The Active Record Guide covers the association feature of Active Record.
* How to declare associations between Active Record models.
* How to understand the various types of Active Record Associations.
* How to use the methods added to your models by creating associations.

##1 Why Assoiations?
Associations make common operations a lot easier in your code. Without associations, model declarations would require you to include all of your data in one humongous database where any time an individual column had a unique field you would require a unique row! Instead, we can tell rails that there is a connection between two models. For example:

```
class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
end

class Order < ActiveRecord::Based
  belongs_to :customer
end
```

##2 The Types of Associations
In Rails, an **association** is a connection between two Active Record models. Associations are implemented using macro-style calls, so that you can declaritivly add features to your models. For example, by declaring that one model `belongs_to` another, you instruct Rails to maintain Primary Key-Foreign Key information between instances of the two models, and you also get a number of utility methods added to your model. Rails supports six types of associations:

1. belongs_to
2. has_one
3. has_many
4. has_many :through
5. has_one :through
6. has_and_belongs_to_many

In the remainder of this guide, you'll learn how to declare and use the various forms of associations.

###2.1 The belongs_to Association
A `belongs_to` association sets up a one-to-one connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model. For example, if your application includes customers and orders, and each order can be assigned to exactly one customer, you'd declare the order model this way:

```
class Order < ActiveRecord::Base
  belongs_to :customer
end
```
![](http://guides.rubyonrails.org/images/belongs_to.png)

`belongs_to` associations *must* use the singular term. If you used the pluralized form in the above example for the `customer` assocation in the `Order` model, you would be told that there was an "uninitialized constant Order::Customers". This is because Rails automatically infers the class name from the assocation name. If the association name is wrongly pluralized, then the inferred class will be wrongly pluralized too.

The corresponding migration might look like this:

```
class CreateOrders < ActiveRecord::MIgration
  def change
    create_table :customers do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.datetime :order_date
      t.timestamps null: false
    end
  end
end
```
###2.2 The has_one Association
The `has_one` asscoation also sets up a one-to-one connection with another model, but with somewhat different semantics and consequences. This association indicates that each instance of a model contains or possesses one instance of another model. For example, if each supplier in your application has only one account, you'd declare the supplier model like this:

```
class Supplier < ActiveRedord::Base
  has_one :account
end
```

![](http://guides.rubyonrails.org/images/has_one.png)

The corresponding migration probably looks a lot like a `belongs_to` migration:

```
class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :accounts do |t|
      t.belongs_to :supplier, index: true
      t.string :account_number
      t.timestamps null: false
    end
  end
end
```

###2.3 The has_many Association
A `has_many` association indicates a one-to-many connection with another model. You'll often find a `has_many` on the "other side" of a `belongs_to` association. This association indicates that each instance of the model has zero or more instances of another model. For example, in an application containing customers and orders, the customer model could be declared like this:

```
class Customer < ActiveRecord::Base
  has_many :orders
end
```

![](http://guides.rubyonrails.org/images/has_many.png)

The corresponding migration might look like this:

```
class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :orders do |t|
      t.belongs_to :customer, index:true
      t.datetime :order_date
      t.timestamps null: false
    end
  end
end
```

###2.4 The has_many :through Association
A `has_many :through` assocoation is often used to set up a many-to-many connection with another model. This assocoation indicates that the declaring model can be matched with zero or more instances of another model by procedding *through* a third model. For example, consider a medical practice where patients make appointments to see physicians. It seems like the `has_many :through` dependent should `has_many` the third model, and that the model being 'had' should `has_many` the dependent table and `has_many` through the third model. The third model should probably `belongs_to` both the dependent and independent model? The relevant assocoation declarations could look like this:

```
class Physician < ActiveRecord::Base
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ActiveRecord::Base
  belongs_to :physician
  belongs_to :patient
end

class Patient < ActiveRecord::Base
  has_many :appointments
  has_many :physicians, through: :appointments
end

![](http://guides.rubyonrails.org/images/has_many_through.png)

```

The corresponding migration might look like the following (note that there aren't any assocoations in the dependent or independent tables, but that the third model has belongs_to types for the dependent and independent tables):

```
class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name
      t.timestamps null: false
    end
 
    create_table :patients do |t|
      t.string :name
      t.timestamps null: false
    end
 
    create_table :appointments do |t|
      t.belongs_to :physician, index: true
      t.belongs_to :patient, index: true
      t.datetime :appointment_date
      t.timestamps null: false
    end
  end
end
```

**I did NOT understand this next part the first time through**

The collection of join models can be managed via the API. for example if you assign

```
physician.patients = patients
```

new join models are created for newly associated objects, and if some are gone their rows are deleted. Note that *automatic deletion of join models is direct, no destroy callbacks are triggered*.

The `has_many :through` association is also useful for setting up "shortcuts" through nested `has_many` associations. For example, if a document has many sections, and a section has many paragraphs, you may sometimes want to get a simple collection of all paragraphs in the document. You could set that up this way:

```
class Document < ActiveRecord::Base
  has_many :sections
  has_many :paragraphs, through: :sections
end

class Section < ActiveRecord::Base
  belongs_to :document
  has_many :paragraphs
end

class Paragraph < ActiveRecord::Base
  belongs_to :section
end
```

With `through: :sections` specified, Rails will now understand:

```
@document.pragraphs
```

This makes a lot of sense to me and is reall cool! Basically, I can create direct connections between grandparents and their grandchildren without mentioning the parent relationship explicitly except in the model. It will take a lot of work to chart all of the relationships for Elysian Energy, but I think with a whiteboard and some "stick-to-it-iveness" I can probably make 80% of our relationships using the models I've learned so far (`belongs_to`, `has_many`, and `has_many :through`).

###2.5 The has_one :through Association
A `has_one :through` association sets up a one-to-one connection with another model. This association indicates that the declaring model can be matched with one instance of another model by proceeding through a third model. For example, if each supplier has one account, and each account is associated with one account history, then the supplier model could look like this:

```
class Supplier < ActiveRecord::Base
  has_one :account
  has_one :account_history, through: :account
end

class Account < Activerecord::Base
  belongs_to :supplier
  has_one :account_history
end

class AccountHistory < Activerecord::Base
  belongs_to :account
end
```

![](http://guides.rubyonrails.org/images/has_one_through.png)

The corresponding migration might look like this:

```
class CreateAccountHistories < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :accounts do |t|
      t.belongs_to :supplier, index: true
      t.string :account_number
      t.timestamps null: false
    end
    
    create_table :account_histories do |t|
      t.belongs_to :account, index: true
      t.integer :credit_rating
      t.timestamps null: false
    end
  end
end
```

###2.6 The has_and_belongs_to_many Association
A has_and_belongs_to_many assocation creates a direct many-to-many connection with another model, with no intervening model. For example, if your application includes assemblies and parts, with each assembly having many parts and each part appearing in many assemblies, you could declare the modesl this way:

```
class Assembly < ActiveRecord::Base
  has_and_belongs_to_many :parts
end

class Part < ActiveRecord::Base
  has_and_belongs_to_many :assemblies
end
```
![](http://guides.rubyonrails.org/images/habtm.png)
The corresponding migration might look like this:

```
class CreateAssembliesAndParts < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :parts do |t|
      t.string :part_number
      t.timestamps null: false
    end
    
    create_table :assemblies_parts, id: false do |t|
      t.belongs_to :assembly, index: true
      t.belongs_to :part, index: true
    end
  end
end
```

###2.7 Choosing between belongs_to and has_one
If you want to set up a one-to-one relationship between two modesl, you'll need to add `belongs_to` to one, and `has_one` to the other. How do you know which is which?

The distinction is in *where you place the foreign key* (it goes on the table for the class declaring the `belongs_to` association). But you should give some thought to the actual meaning of the data as well. The `has_one` relationship says that one of something is yours - that is, that something points back to you. For example, it makes more sense to say that a supplier owns an account than that an account owns a supplier. This suggests that the correct relationships are like this:

```
class Supplier < ActiveRecord::Base
  has_one :account
end

class Account < ActiveRecord::Base
  belongs_to :supplier
end
```

The corresponding migration might look like this:

```
class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :accounts do |t|
      t.integer :supplier_id
      t.string :account_number
      t.timestamps null: false
    end
    
    add_index :accounts, :supplier_id
  end
end

**Note**
Using `t.integer :supplier_id` makes the foreign key naming obvious and explicit. In current versions of Rails, you can abstract away this implementation by using `t.references :supplier` instead.

###2.8 Choosing between has_many :through and has_and_belongs_to_many
Rails offers two different ways to declare a many-to-many relationship between models. The simpler way is to use `has_and_belongs_to_many`, which allows you to make the association directly:

```
class Assembly < ActiveRecord::Base
  has_and_belongs_to_many :parts
end

class Part < ActiveRecord::Base
  has_and_belongs_to_many :assemblies
end
```

The second way to declare a many-to-many relationship is to use `has_many :through`. This makes the association indirectly, through a join model:

```
class Assembly < ActiveRecord::Base
  has_many :manifests
  has_many :parts, through: :manifests
end
 
class Manifest < ActiveRecord::Base
  belongs_to :assembly
  belongs_to :part
end
 
class Part < ActiveRecord::Base
  has_many :manifests
  has_many :assemblies, through: :manifests
end
```

The simplest rule of thumb is that you should set up a `has_many :through` relationship if you need to work with the relationship model as an independent entity. If you don't need to do anything with the relationship model, it may be simpler to set up a `has_and_belongs_to_many` relationship (though you'll need to remember to create the joining table in the database).

You should use `has_many :through` if you need validations, callbacks, or extra attributes on the join model. This makes sense to me. I'll end up having to use the `has_many through` method for a lot of stuff because the join table will be just as important as the other two tables.

###2.9 Polymorphic Associations
A slightly more advanced twist on associations is the **polymorphic association**. With **polymorphic associations**, a model can belong to more than one other model, on a single association. For example, you might have a picture model that belongs to either an employee model or a product model (this is also what you've been thinking about with regards to telephone numbers, where the number might be associated with both a person and an account). Here's how this could be declared:

```
class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
end

class Employee < ActiveRecord::Base
  has_many :pictures, as: :imageable
end

class Product < ActiveRecord::Base
  has_many :pictures, as: :imageable
end
```

You can think of a polymorphic `belongs_to` declaration as setting up an interface that any other model can use. From an instance of the `Employee` model, you can retrieve a collection of pictures: `@employee.pictures`. Similarly, you can retrieve `@product.pictures`.

If you have an instance of the `Picture` model, you can get to its parent via `@picture.imageable`. To make this work, you need to declare both a foreign key column and a type column in the model that declares the polymorphic interface:

```
class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.integer :imageable_id
      t.string :imageable_type
      t.timestamps null: false
    end
    
    add_index :pictures, :imageable_id
  end
end
```
This migration can be simplified by using the `t.references` form:

```
class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
```

Or, for phone numbers, you might do:

```
class Person < ActiveRecord::Base
  belongs_to :phoneable, polymporphic: true
end

class Property < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true
end

class Account < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true
end
```
![](http://guides.rubyonrails.org/images/polymorphic.png)

###2.10 Self Joins
Sometimes, you will want to relate a model to itself. For example, you might want to store all employees in a single database model, but be able to trace relationships between a manager and subordinates (another good example would be tracking parent and child account relationships within your Accounts table). This situation can be modeled with self-joining associations:

```
class Employee < ActiveRecord::Base
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee"
end
```

With this setup, you can retrieve @employee.subordinates and `@employee.manager`.

In your migrations/schema, you will add a references column to the model itself.

```
class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :manager, index: true
      t.timestamps null: false
    end
  end
end
``
I don't totally get how this works. Does it create a new table full of managers and subordinates? How does it track which is which? Color me confused.

##3 Tips, Tricks, and Warnings
There are a few things you should know to make efficient use of Active record associations in your Rails applications:

###3.1 Controlling Caching
All of the association methods are built around caching, which keeps the result of the most recent query available for further operations. The cache is even shared across methods. For example:

```
customer.orders           # retrieves orders from the database
customer.orders.size      # uses the cached copy of orders
customer.orders.emptty    # uses the cached copy of orders
```

But what if oyu want to reload the cache, because data might have been changed by some other part of the application? Just pass `true` to the association call:

```
customer.orders              #retrieves orders from the database
customer.orders.size         # uses the cached copy of orders
customer.orders(true).empty? # discards the cached copy of orders and goes back to the database
```
###3.2 Avoiding Name Collissions
You are not free to use just any name for your associations. Because creating an association adds a method with that name to the model, it is a bad idea to give an assocation a name that is already used for an instance method of ActiveRecord::Base. The Association method would override the base method and break things. For instance, `attributes` or `connection` are bade names for associations.

###3.3 Updating the Schema
Associations are extremely useful, but you are responsible for maintaining your database schema to match your associations. In practice, this means that for `belongs_to` associations you need to create foreign keys, and for `has_and_belongs_to_many` associations you need to create the appropriate join table.

####3.3.1 Creating Foreign Keys for belongs_to Associations
When you declare a `belongs_to` association, you need to create foreign keys as appropriate. For example, consider this model:

```
class Order < ActiveRecord::BAse
  belongs_to :customer
end
```

This declaration needs to be backed up by the proper foreign key declaration on the orders table:

```
class CreateOrders < ActiveRecord::Migration
  def change
    createtable :orders do |t|
      t.datetime :order_date
      t.string :order_number
      t.integer :customer_id
    end
    
    add_index :orders, :customer_id
  end
end
```

If you create an association some time after you build the underlying model, you need to remember to create an `add_column` migration to provide the necessary foreign key.

####3.3.2 Creating Join Tables for has_and_belongs_to_many Associations
If you create a `has_and_belongs_to_many` association, you need to explicitly create the joining table. Unless the name of the join table is explicitly specified by using the `:join_table` option, Active Record creates the name by using the lexical order of the class names. So a join between customer and order models will give the default join table name of "customer_orders" because "c" outranks "o" in lexical ordering. Yikes, keep an eye out for this.
