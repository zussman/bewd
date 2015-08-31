class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.references :residence, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
