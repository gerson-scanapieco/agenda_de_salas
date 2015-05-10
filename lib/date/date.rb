class Date

  def self.get_current_week_commercial_days(current_date)
    current_week = current_date.cweek
    current_year = current_date.year

    first_day_of_commercial_week = Date.commercial(current_year, current_week)
    last_day_of_commercial_week = first_day_of_commercial_week + 4.days

    first_day_of_commercial_week..last_day_of_commercial_week
  end
  
end
