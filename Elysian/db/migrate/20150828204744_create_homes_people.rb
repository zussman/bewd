class CreateHomesPeople < ActiveRecord::Migration
  def change
    create_table :homes_people do |t|
      t.references :homes, index: true, foreign_key: true
      t.references :people, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
