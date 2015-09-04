class AddLeadSourceToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :lead_source, index: true, foreign_key: true
  end
end
