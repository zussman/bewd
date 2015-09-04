class AddResidenceToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :residence, index: true, foreign_key: true
  end
end
