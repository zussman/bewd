class Home < ActiveRecord::Base
  has_one :residence
  has_and_belongs_to_many :people
  accepts_nested_attributes_for :residence
  accepts_nested_attributes_for :people
end
