class DoStuff < ActiveRecord::Migration
  def change
    def change
      create_table :nothing do |t|
        t.string :blank
        add_column :people, :job, :string
      end
    end
  end
end
