class Home < ActiveRecord::Base
  has_many :residences
  has_many :people
  accepts_nested_attributes_for :residences
  accepts_nested_attributes_for :people

  def square_footage(id)
    residence = Residence.find(id)
    residence.square_footage
  end

  def own_status(id)
    residence = Residence.find(id)
    residence.own
  end

  def address(id)
    residence = Residence.find(id)
    address = Address.find(residence.id)
    address = [address.line_1, address.line_2, address.city.name, address.state.abbreviation, address.zip.zipcode].compact.join(' ')
  end
end
