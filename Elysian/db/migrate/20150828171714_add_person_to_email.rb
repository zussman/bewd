class AddPersonToEmail < ActiveRecord::Migration
  def change
    add_reference :emails, :person, index: true, foreign_key: true
  end
end
