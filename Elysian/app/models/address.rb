class Address < ActiveRecord::Base
  belongs_to :city, :state, :zip, :home
  accepts_nested_attributes_for :city, :state, :zip
end
