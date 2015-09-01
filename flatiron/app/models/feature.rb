class Feature < ActiveRecord::Base
  belongs_to :feature_type
  has_and_belongs_to_many :makes, join_table: :features_makes
  validates :name, presence: true
end
