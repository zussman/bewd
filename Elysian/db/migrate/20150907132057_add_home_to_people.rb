class AddHomeToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :home, index: true, foreign_key: true
  end
end
