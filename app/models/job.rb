class Job < ApplicationRecord
  def self.search(search)
    where('last_name like ? or first_name like ? or subject like ?', "#{search}", "#{search}", "#{search}")
  end
end
