class Residence < ActiveRecord::Base
  belongs_to :home
  belongs_to :address
  belongs_to :utility
  accepts_nested_attributes_for :home
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :utility

  def sfoo
    if own == true and apartment == false
    elsif own == true and apartment == true
    elsif own == false and apartment == false
    elsif own == false and apartment == false
    else
    end
  end
      
end
