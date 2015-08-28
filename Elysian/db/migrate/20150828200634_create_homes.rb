class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :square_footage
      t.boolean :own
      t.references :person, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.boolean :apartment

      t.timestamps null: false
    end
  end
end
