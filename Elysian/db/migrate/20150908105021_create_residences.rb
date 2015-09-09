class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.integer :square_footage
      t.boolean :own
      t.boolean :apartment
      t.references :home, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
