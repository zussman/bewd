class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :price
      t.string :currency
      t.references :make, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
