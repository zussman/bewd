class AddManufacturerRefToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :manufacturer, index: true, foreign_key: true
  end
end
