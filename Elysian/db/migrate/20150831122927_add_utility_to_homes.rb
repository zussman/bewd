class AddUtilityToHomes < ActiveRecord::Migration
  def change
    add_reference :homes, :utility, index: true, foreign_key: true
  end
end
