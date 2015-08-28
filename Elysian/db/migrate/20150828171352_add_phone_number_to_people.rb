class AddPhoneNumberToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :phone_number, index: true, foreign_key: true
  end
end
