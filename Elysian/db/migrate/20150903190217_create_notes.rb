class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
