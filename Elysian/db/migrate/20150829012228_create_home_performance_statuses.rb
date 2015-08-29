class CreateHomePerformanceStatuses < ActiveRecord::Migration
  def change
    create_table :home_performance_statuses do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
