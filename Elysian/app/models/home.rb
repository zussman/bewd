class Home < ActiveRecord::Base
  has_many :residences
  has_many :people
  accepts_nested_attributes_for :residences
  accepts_nested_attributes_for :people

  def full_address(id)
    residence = Residence.find(id)
    full_address = residence.full_address
  end
end
