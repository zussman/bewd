class AddZipToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :zip, index: true, foreign_key: true
  end
end
