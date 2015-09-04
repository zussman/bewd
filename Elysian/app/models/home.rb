class Home < ActiveRecord::Base
  belongs_to :residence
  belongs_to :people
  accepts_nested_attributes_for :residence
  accepts_nested_attributes_for :people
end
