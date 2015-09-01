class Car < ActiveRecord::Base
  has_many :makes
  has_many :pricings, through: :makes
  has_many :features, through: :makes
  has_many :feature_types, through: :features
  accepts_nested_attributes_for :makes, allow_destroy: true
end
