class Phone < ActiveRecord::Base
  belongs_to :phone_type
  has_many :person_phones
  has_many :people, through: :person_phones
  accepts_nested_attributes_for :person_phones
  accepts_nested_attributes_for :people
end
