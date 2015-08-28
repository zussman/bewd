class HomesPerson < ActiveRecord::Base
  belongs_to :homes
  belongs_to :people
end
