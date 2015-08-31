class HomesPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :home
end
