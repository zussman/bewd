class PhoneNumber < ActiveRecord::Base
  belongs_to :person
  belongs_to :phone_type
end
