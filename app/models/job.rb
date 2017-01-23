class Job < ApplicationRecord
  def self.search(start_date, end_date)
    where("date_started >= ? and date_started <= ?", "%#{start_date}%", "%#{end_date}%")
  end
end
