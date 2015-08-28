class RemovePhoneIdFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :phone_id
  end
end
