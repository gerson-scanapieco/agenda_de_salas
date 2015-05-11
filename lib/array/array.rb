class Array

  def get_reservation_by_time_and_date(time,date)
    self.select { |reservation| reservation.time == time && reservation.date == date }.first
  end
end

