class PersonLead < ActiveRecord::Base
  belongs_to :lead_source
  belongs_to :person
end
