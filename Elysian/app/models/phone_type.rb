class PhoneType < ActiveRecord::Base
  has_many :phone_numbers
  accepts_nested_attributes_for :phone_numbers
end
