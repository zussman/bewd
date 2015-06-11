class User < ActiveRecord::Base
  validates_presence_of :email
  has_one :address
  accepts_nested_attributes_for :address
end
