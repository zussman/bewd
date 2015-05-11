class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :square_footage
      t.string :utility
      t.string :address
      t.string :email
      t.text :notes

      t.timestamps null: false
    end
  end
end
