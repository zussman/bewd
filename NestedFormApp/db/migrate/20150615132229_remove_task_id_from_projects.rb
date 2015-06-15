class RemoveTaskIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :task_id
  end
end
