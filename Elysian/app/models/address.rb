class Address < ActiveRecord::Base
  belongs_to :city 
  belongs_to :state
  belongs_to :zip
  belongs_to :residence
  accepts_nested_attributes_for :city, :state, :zip, :residence

  def full_address
    [line_1, line_2, city.name, state.abbreviation, zip.zipcode].compact.join(' ')
  end
end
