class Make < ActiveRecord::Base
  belongs_to :car, touch: true
  has_many :prices, dependent: :destroy
  has_many :feature_types, through: :features
  has_and_belongs_to_many :features, join_table: :features_makes
  accepts_nested_attributes_for :makes, allow_destroy: true
end
