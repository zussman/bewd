class AddEmailToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :email, index: true, foreign_key: true
  end
end
