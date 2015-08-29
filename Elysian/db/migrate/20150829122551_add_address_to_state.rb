class AddAddressToState < ActiveRecord::Migration
  def change
    add_reference :states, :address, index: true, foreign_key: true
  end
end
