class Manufacturer < ActiveRecord::Base
  has_many :cars, dependent: :destroy
  accepts_nested_attributes_for :cars
end
