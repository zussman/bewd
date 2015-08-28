class CreateUtilities < ActiveRecord::Migration
  def change
    create_table :utilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
