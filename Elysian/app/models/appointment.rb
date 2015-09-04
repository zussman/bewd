class Appointment < ActiveRecord::Base
  belongs_to :program
  belongs_to :residence
end
