class DropHomesPeople < ActiveRecord::Migration
  def change
    drop_table :homes_people
  end
end
