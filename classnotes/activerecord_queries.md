#Active Record Queries
Active Record insulates you from the need to use SQL in most cases. Active Record will perform queries on the database for you and is compatible with most database systems (MySQL, PostgreSQL, and SQLite to name a few). Regardless of which database system you're using, the Active record method format will always be the same.

Code examples throughout this guide will refer to one or more of the following models:

```
Note: All of the following models use id as the primary key, unless specified otherwise.

---
class Client < ActiveRecord::Base
	has_one :address
	has_many :orders
	has_and_belongs_to_many :roles
end

---

class Address < ActiveRecord::Base
	belongs_to :client
end

---

class Order < ActiveRecord::Base
	belongs_to :client, counter_cache: true
end

---

class Role < ActiveRecord::Base
	has_and_belongs_to_many :clients
end
```

##1. Retrieving Objects from the Databse
To retrieve objects from the database, Active Record provides a bevy of finder methods. Each finder method allows you to pass arguments into it to perform certain queries on your database without writing raw SQL.

The methods are:

* `bind`
* `create_with`
* `distinct`
* `eager_load`
* `extending`
* `from`
* `group`
* `having`
* `includes`
* `joins`
* `limit`
* `lock`
* `none`
* `offset`
* `order`
* `preload`
* `readonly`
* `references`
* `reorder`
* `reverse_order`
* `select`
* `uniq`
* `where`

All of these methods return an instance of `ActiveRecord::Relation`.


