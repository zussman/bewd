class AddIndexToProject < ActiveRecord::Migration
  def change
    add_index :projects, :task_id
  end
end
