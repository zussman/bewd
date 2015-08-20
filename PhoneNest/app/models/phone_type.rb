class PhoneType < ActiveRecord::Base
  has_many :phones
  accepts_nested_attributes_for :phones
end
