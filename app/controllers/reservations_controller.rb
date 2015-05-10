class ReservationsController < ApplicationController
  include ReservationsHelper

  before_action :authenticate_user!

  def index
    @week = Date.get_current_week_commercial_days(Date.today)
  end
end
