#Sharing Behavior and Variables
#TIME: 20 min

# Create an employee class.
class Employee
  attr_accessor = :first_name, :last_name, :phone_number

  def initialize(first_name, last_name, phone_number)
    @first_name = first_name
    @last_name = last_name
    @phone_number = phone_number
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end

# A manager is contactable by email,
# and wants their title as part of their name display
class Manager < Employee


end

# A marketer can be contacted via twitter
# but is fine with the default name display
class Marketer < Employee


end



# BONUS: Come up with a class method, suggestion @@company.