class AddPersonToPhoneNumber < ActiveRecord::Migration
  def change
    add_reference :phone_numbers, :person, index: true, foreign_key: true
  end
end
