class Home < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_one :address
  accepts_nested_attributes_for :people
  accepts_nested_attributes_for :address
end
