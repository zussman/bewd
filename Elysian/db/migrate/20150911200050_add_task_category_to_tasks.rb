class AddTaskCategoryToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :task_category, index: true, foreign_key: true
  end
end
