class ModifyShirtsTable < ActiveRecord::Migration
  def change
    add_column :shirts, :price, :integer
  end
end
