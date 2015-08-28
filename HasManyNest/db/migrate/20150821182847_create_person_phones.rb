class CreatePersonPhones < ActiveRecord::Migration
  def change
    create_table :person_phones do |t|
      t.references :person, index: true, foreign_key: true
      t.references :phone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
