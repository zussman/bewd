class Utility < ActiveRecord::Base
  has_many :residences
  accepts_nested_attributes_for :residences
end
