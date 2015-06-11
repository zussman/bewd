class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :cars, :type, :name
  end
end
