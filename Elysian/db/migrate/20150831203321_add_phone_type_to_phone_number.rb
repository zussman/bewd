class AddPhoneTypeToPhoneNumber < ActiveRecord::Migration
  def change
    add_reference :phone_numbers, :phone_type, index: true, foreign_key: true
  end
end
