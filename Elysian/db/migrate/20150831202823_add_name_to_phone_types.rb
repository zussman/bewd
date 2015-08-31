class AddNameToPhoneTypes < ActiveRecord::Migration
  def change
    add_column :phone_types, :name, :string
  end
end
