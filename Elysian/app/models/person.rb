class Person < ActiveRecord::Base
  has_many :emails, dependent: :destroy
  has_many :phone_numbers, dependent: :destroy
  has_many :homes
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :phone_numbers
  accepts_nested_attributes_for :homes

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def main_phone
    phone_numbers.any? ? phone_numbers.first.phone_number : "-"
  end

  def phone_type
    phone_numbers.first.phone_type_id? ? "yes" : "no"
  end

  def main_email
    main_phone = emails.any? ? emails.first.address : "-"
  end

end
