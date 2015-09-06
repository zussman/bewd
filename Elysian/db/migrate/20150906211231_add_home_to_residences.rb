class AddHomeToResidences < ActiveRecord::Migration
  def change
    add_reference :residences, :home, index: true, foreign_key: true
  end
end
