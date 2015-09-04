class PhoneNumber < ActiveRecord::Base
  belongs_to :person
  belongs_to :phone_type
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
end
