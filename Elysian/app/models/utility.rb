class Utility < ActiveRecord::Base
  has_many :homes
  accepts_nested_attributes_for :homes
end
