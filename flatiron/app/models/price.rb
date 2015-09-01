class Price < ActiveRecord::Base
  belongs_to :make, touch: true
  has_and_belongs_to_many :makes, join_table: :prices_makes
  validates :make_id, :currency, :price, presence: true
end
