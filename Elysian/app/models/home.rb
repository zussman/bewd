class Home < ActiveRecord::Base
  has_one :residence
  has_many :people
  accepts_nested_attributes_for :residence
  accepts_nested_attributes_for :people
end
