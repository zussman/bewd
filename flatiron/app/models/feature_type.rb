class FeatureType < ActiveRecord::Base
  has_many :features, dependent: :destroy
  validates :name, presence: true
end
