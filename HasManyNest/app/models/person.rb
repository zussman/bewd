class Person < ActiveRecord::Base
  has_many :person_phones
  has_many :phones, through: :person_phones
  accepts_nested_attributes_for :person_phones
  accepts_nested_attributes_for :phones
end
