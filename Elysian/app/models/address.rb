class Address < ActiveRecord::Base
  belongs_to :city 
  belongs_to :state
  belongs_to :zip
  has_one :residence
  accepts_nested_attributes_for :city
  accepts_nested_attributes_for :state
  accepts_nested_attributes_for :zip
  accepts_nested_attributes_for :residence

  def full_address
    [line_1, line_2, city.name, state.abbreviation, zip.zipcode].compact.join(' ')
  end
end
