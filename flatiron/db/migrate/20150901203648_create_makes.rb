class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :vin
      t.references :car, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
