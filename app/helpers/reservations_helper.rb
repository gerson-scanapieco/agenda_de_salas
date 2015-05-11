module ReservationsHelper

  def reservation_entry(reservations, time, date)
    reservation = reservations.get_reservation_by_time_and_date(time, date)

    unless reservation
      return link_to 'Reservar', '#', class: 'create-reservation-link'
    end

    if reservation.user == current_user
      link_to "Reservado para #{ reservation.user_name }", '#', 
                class: 'destroy-reservation-link', data: { id: reservation.id }
    else
      "Reservado para #{ reservation.user_name }"
    end
  end

end
