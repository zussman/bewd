class ChangeHomesPeopleTable < ActiveRecord::Migration
  def change
    remove_column :homes_people, :homes_id
    remove_column :homes_people, :people_id
    add_reference :homes_people, :person, index: true, foreign_key: true
    add_reference :homes_people, :home, index: true, foreign_key: true
  end
end
