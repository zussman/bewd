class Residence < ActiveRecord::Base
  belongs_to :home
  has_one :address
  accepts_nested_attributes_for :homes
end
