class AddAccountNumberToHome < ActiveRecord::Migration
  def change
    add_column :homes, :account_number, :string
  end
end
