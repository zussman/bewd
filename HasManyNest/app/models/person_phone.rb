class PersonPhone < ActiveRecord::Base
  belongs_to :person
  belongs_to :phone
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :phone
end
