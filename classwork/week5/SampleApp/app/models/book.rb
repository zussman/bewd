class Book < ActiveRecord::Base
  def upper_author
    self.author.upcase
  end
end
