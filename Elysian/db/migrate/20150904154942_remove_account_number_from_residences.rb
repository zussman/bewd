class RemoveAccountNumberFromResidences < ActiveRecord::Migration
  def change
    remove_column :residences, :account_number
  end
end
