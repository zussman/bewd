class RemovePersonIdFromHomes < ActiveRecord::Migration
  def change
    remove_column :homes, :person_id
  end
end
