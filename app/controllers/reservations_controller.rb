class ReservationsController < ApplicationController
  include ReservationsHelper

  before_action :authenticate_user!

  def index
    @week = Date.get_current_week_commercial_days(Date.today)
  end

  def create
    @reservation = Reservation.new(reservation_params.merge(user: current_user) )

    if @reservation.save
      respond_to do |format|
        format.json
      end
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:time, :date)
  end
end
