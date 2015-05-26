class DoStuff < ActiveRecord::Migration
  def change
    create_table :nothing do |t|
      t.string :blank
    end

    add_column :people, :job, :string
  end
end
