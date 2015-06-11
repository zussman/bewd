class Car < ActiveRecord::Base
  belongs_to :manufacturer
#  validates_presence_of :make
end
