class AddMarketCapToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :market_cap, :decimal
  end
end
