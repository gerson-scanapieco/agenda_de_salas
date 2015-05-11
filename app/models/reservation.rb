class Reservation < ActiveRecord::Base
  belongs_to :user

  validates :time, :date, :user, presence: true
  validates :time, uniqueness: { scope: :date, message: 'já existe uma reserva para este horário neste dia' }
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 6, less_than_or_equal_to: 23 }

  delegate :email, to: :user, prefix: true

  def self.has_reservation?(time, date)
    Reservation.where(time: time, date: date).any?
  end

  def self.find_by_time_and_date(time, date)
    Reservation.where(time: time, date: date)
  end

end
