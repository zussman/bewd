class Task < ActiveRecord::Base
  belongs_to :task_category

  def category(id)
    task_category = TaskCategory.find(id)
    task_category.name
  end
end
