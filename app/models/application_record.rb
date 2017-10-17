class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def hours_in_day
    24
  end
end
