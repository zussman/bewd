#Classes
If a class is a template, or a blueprint, then the object instance is a snapshot, or one example of that template. You could have a class, Car, and then have many instances of different types of cars.

##When to Use
It's the best way of modeling things and data out there in the real world, with Ruby. It's also a great way of defining a set of characteristics once, and then creating a ton of objects with those characteristics.

```
car = {}
 => {} 
2.2.1 :002 > car[:make] = 'Acura'
 => "Acura" 
2.2.1 :003 > car[:model] = 'NSX'
 => "NSX" 
2.2.1 :004 > car[:year] = 1996
 => 1996 
 ```
 To create a second car, we'd have to go through this entire process again! Blech! And what if we want our car to have actions that it can do?

```
2.2.1 :005 > car[:running] = false
 => false 
2.2.1 :006 > car[:velocity] = 0
 => 0 
2.2.1 :007 > car
 => {:make=>"Acura", :model=>"NSX", :year=>1996, :running=>false, :velocity=>0} 
2.2.1 :008 > 
```
Thos properties are realy important. And if we want to create a second car that has those same common properties it would take a lot of work. So instead, we creat a Car class.

When you call `Hash.new` or `Array.new`, the `.new` part actually just calls a method called **initialize** on the **class** `Hash` or `Array`, respectively.

So when you create a class you need to initialize it!

```
class Car
2.2.1 :010?>     def initialize(make, model, year)
```
A normal variable that is defined inside of a method will die inside of a method. But an instance variable can be born inside a method and live outside of it. The way the instance variables differ is that they're prepended by an `@` sign. In the context of the class, the instance variables are the actual properties.

```
2.2.1 :009 >   class Car
2.2.1 :010?>     def initialize(make, model, year)
2.2.1 :011?>       @make = make
2.2.1 :012?>       @model = model
2.2.1 :013?>       @year = year
2.2.1 :014?>       @running = false
2.2.1 :015?>       @speed = 0
2.2.1 :016?>     end
2.2.1 :017?>   end
 => :initialize 
2.2.1 :018 > 
```
Now, to create a new Car, we just:

```
2.2.1 :018 > dream_car = Car.new('Porsche', 'GT2', 2012)
 => #<Car:0x007f9a391fd008 @make="Porsche", @model="GT2", @year=2012, @running=false, @speed=0> 
2.2.1 :019 > 
```
Don't forget to include the properties. Remember that classes always start with a capital letter. Or, you can use all-caps, as with the `JSON` class that you used in last week's homework.


###Setter Methods and Access Methods
You need a way to access and modify your instance variables quickly when working with an instance of a class. For example, you might want to edit `dream_car`'s `make`. You cannot just say `dream_car.make`. You need a method for accessing and modifying the properties on your object instance.

You can do that through access methods and setter methods.

```
class Car
    def initialize(make, model, year)
      @make = make
      @model = model
      @year = year
      @running = false
      @speed = 0
      end
    def start!
      @running = true
    end
    
    def turn_off!
      @running = false
    end
    
    def accelerate!(mph)
      if @running == true
        @speed = mph
      end
    end

    # Access Method
    def make
      @make
    end

    #Setter Method
    # car.make = 'Acura'
    def make=(value)
      @make = value
    end
end
```
Ruby has a special method that people usually declare in the beginning of a file, called `attr_accessor`. You pass it a symbol, and the name of your properties:

```
class Car

  attr_accessor :model, :year, :running, :speed

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @running = false
    @speed = 0
    @driver = 'Stig'
    end
    
  def start!
    @running = true
  end
  
  def turn_off!
    @running = false
  end
  
  def accelerate!(mph)
    if @running == true
      @speed = mph
    end
  end

  # Access Method
  def make
    @make
  end

  #Setter Method
  # car.make = 'Acura'
  def make=(value)
    @make = value
  end
end
```
Using the `attr_accessor` method allows you to skip the Access Methods and Setter Methods. You no longer have to write those methods for every single instance variable. Remember though, *this only works for **instance variables** in the `attr_accessor`*. You could create access but not set capabilities at the top using the `attr_reader` function. Similarly, you can just have `attr_writer` to write attributes for specific variables. `attr_accessor` is basically, just `attr_writer` and `attr_reader` put together.

## Writing classes is a skill
Part of development is that your classes will always be changing, but you should sit down and map out what your class' properties and methods should likely be. It will help a lot down the line.

---
**At this point you went through the `creating objects` exercise, which is in your classworks folder, week 4.**

---
#Class 4 Part II
##Agenda
* Reviewing Scope
* Class Methods and Variables
* Sharing Code: Inheritance
* Sharing Code: Mixins
* Lab Time

##Scope
When you have a method defined in a class, you can call that method on an instance of that class. If you have the same method name outside of the class it is a totally different method and won't apply to class instances.

##Class instances vs Instances of a Class
* every defined class is itself an instance of class
* every defined instance of class are the isntances of that class
* So, stuff that uses `self.method` affects the class itself.
* Basically, you can use class methods (like `self.method`) to do something to all of the instances of a class.
* You have to use the `@@variable` to create a **class variable**. Those are variables for the class.
* Look up **singleton variables**.

##Inheritance
Inheritance allows you to waterfall class methods and properties, which can be really powerful.

Use the word `super` to look up the parent or super methods that belong to the parent. Super will work all the way up the chain, so you can reference things all the way at the top!

Please check out the code_cemo_stdnt_inheritance.rb file to learn about inheritance because it was too difficult to follow along and take notes at the same time.

* One class can inherit the capabilities of another using the `>` operator
* Sub-classes inherit from super classes
* A child can override a parent variable or method by reusing its name.
* If defined in different physical files, a child would need to `require` it's parent. That is a best practice in almost all occassions.
* You can only inherit from one class.

##Modules/Mixins
* "Mixins" are a facility to import code into a class.
* You can pull in a bunch of mixins into your class.
* Often have a 'able' ending to them

```
module Upvotable
    def upvote!
      @upvote += 1
    end

    def downvote!
      @upvote -= 1
    end
  end

  class Photo
    attr_reader :photographer, :resolution, :upvotes
    include Upvotable

    def initialize(photographer, resolution)
      @photographer = photographer
      @resolution = resolution
      @upvotes = 1
    end
  end

  class Story
    attr_reader :title, :author, :upvotes
    include Upvotable

    def initialize(title, author)
      @title = title
      @author = author
      @upvotes = 1
    end
  end

  >> story = Story.new
  >> story.upvote!
  >> photo = Photo.new
  >> photo.downvote!
```
You can have classes with the same name in two different modules! You use `include` to bring in a module.

