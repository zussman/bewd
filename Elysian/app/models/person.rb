class Person < ActiveRecord::Base

  has_many :emails
  has_many :phone_numbers
  has_and_belongs_to_many :homes
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :phone_numbers
  accepts_nested_attributes_for :homes

end
