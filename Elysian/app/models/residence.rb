class Residence < ActiveRecord::Base
  has_many :homes
  has_many :people, through: :homes
  has_one :address
  accepts_nested_attributes_for :homes
  accepts_nested_attributes_for :address

  validates :square_footage, length: { maximum: 50000, 
    too_long: "%{count} square feet is a little too big for a house, don'tcha think?" },
    numericality: { only_integer: true, less_than_or_equal_to: 50000 }

  def number_delimiter(number)
    number_with_delimiter(number, delimiter: ',')
  end

  def sfoo
    if own == true and apartment == false
      "SFOO"
    elsif own == false and apartment == false
      "SF Rent"
    elsif own == true and apartment == true
      "Condo"
    else
      "Apartment Renter"
    end
  end
      
end
