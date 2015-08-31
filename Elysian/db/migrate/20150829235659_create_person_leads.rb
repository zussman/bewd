class CreatePersonLeads < ActiveRecord::Migration
  def change
    create_table :person_leads do |t|
      t.references :lead_source, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
