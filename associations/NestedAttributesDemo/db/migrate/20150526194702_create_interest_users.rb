class CreateInterestUsers < ActiveRecord::Migration
  def change
    create_table :interest_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :interest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
