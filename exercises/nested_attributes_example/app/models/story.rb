class Story < ActiveRecord::Base
  has_many :comments

  has_attached_file :comments

  accepts_nested_attributes_for :comments
end
