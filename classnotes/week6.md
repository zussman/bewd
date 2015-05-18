#Models & Active Record

---
We ran an exercise and created a new movies app

---

Order in a route matters. It tries to match from the very top of the hierarchy. So make sure you set up your routes with priority in mind.

##Databases
Rails is database agnostic, so you can swap out different database types and still have a good solution. We aren't concerned with what database is being used behind the scenes. The reason we use databases is that we want our data to be **persistent**.

###Standard Data Types
* Text
* Numbers
* Dates/Times
* Booleans

A database is a collection of tables.
![](http://andreibondarev.github.io/bewd/09-models-active-record/#/7)

##Active Record
Handles our database for us. Doesn't require SQL calls. You can manipulate the database straight with Active Record through your models.

You should have *a single Active Record Model per table*.

##Seed Files
Used for initial data. That data could be states that you need for your application to run or things like *states* that people can select for their literal state of origin (Delaware, Pennsylvania, etc.). Or states like (paying user, demo user, etc.).

When Active Record converts your query to an SQL query, it does it dynamically based on the database you are using. So Active Record is smart enough to know what your database is and write the correct SQL command for that database.

If you use `find_by` to search for a field value in a database table and that search is not found, then Active Record will return `nil`.

##Validations
Validate your data before it's saved to the database. It's a good way to check stuff and make sure it's being submitted correctly. The validation even provides error messages. You can set the range of possible numeric entries, type of entries, etc.

#Forms

---
##Code Along
We are beginning with a code along using the ShirtApp in class 10.

---
There are two different ways to make forms, and each way is appropriate in different settings. First up, "Form Tag".

##Form Tags
Read **Fat Model Skinny Controller**!

You shouldn't use excessive logic in the controller. You should, if you can, define it in the model.

##Partials
Partials *always* start with an underscore `_`. Bonus to that nomenclature is that the partials all show up at the top in your directory!