#Skinny Controller, Fat Model
When you first begin with Rails, it is tempting to put a lot of logic in the **view**. Novices often write code that looks like this:

```
<!-- app/views/people/index.rhtml -->
<% people = Person.find(
	:conditions => ["added_at > ? and deleted = ?", Time.now.utc, false],
	:order => "last_name, first_name") %>
<% people.reject { |p| p.address.nil? }.each do |person| %>
  <div id="person-<%= person.new_record? ? "new" : person.id %>">
  	<span class="name">
  	  <%= person.last_name %>, <%= person.first_name %>
  	</span>
  	<span class="age">
  	  <%= (Date.today - person.birthdate) / 365 %>
  	</span>
 </div>
 <% end %>
 ```
 
This code is not only insanely difficult to read (remember that it's an older version of RoR as this blog post was written in 2008), but it also completely bypasses the C in MVC. Below you can see the controller and model that support the view we wrote above:
 
 ```
 # app/controllers/people_controller.rb
 class PeopleController < ActionController::Base
 end
 
 # app/models/person.rb
 class Person < ActiveRecord::Base
   has_one :address
 end
 ```
 
That's why novices love over-using the view. Because the vast majority of their code ends up in the view and so it's all in one place and they don't have to try and follow the logic of their program or switch back and forth between files. Also, they can get out of writing a lot of Ruby code by mostly relying on in-HTML code.
 
There are a lot of reasons that this is a bad idea. MVC has been successful for many reasons, including **readability**, **maintainability** **modularity**, and **separation of concerns**. 

A better way to handle this is to move as much of the logic as possible into the controller. That's ***what the controller is for***, for pete's sake! The controller is supposed to mediate between the view and the model. So, let it earn its right to occupy a position in the MVC model:

```
<!-- app/views/people/index.rhtml -->
<% @people.each do |person| %>
  <div id="person-<%= person.new_record? ? "new" : person.id %>">
    <span class="name">
      <%= person.last_name %>, <%= person.first_name %>
    </span>
    <span class="age">
      <%= (Date.today - person.birthdate) / 365 %>
    </span>
  </div>
<% end %>

\# app/controllers/people_controller.rb
class PeopleController < ActionController::Base
  def index
    @people = Person.find(
      :conditions => ["added_at > ? and deleted = ?", Time.now.utc, false],
      :order => "last_name, first_name")
    @people = @people.reject { |p| p.address.nil? }
  end
end

```

