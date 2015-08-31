class ChangeHomesTableToResidences < ActiveRecord::Migration
  def change
    rename_table :homes, :residences
  end
end
