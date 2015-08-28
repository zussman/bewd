class Home < ActiveRecord::Base
  has_and_belongs_to_many :people
  belongs_to :address
  accepts_nested_attributes_for :people
end
