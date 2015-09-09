class AddUtilityIdReferenceToResidences < ActiveRecord::Migration
  def change
    add_reference :residences, :utility, index: true, foreign_key: true
  end
end
