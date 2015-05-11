# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.create-reservation-link', ->
    cell = $(this).parent()
    time = cell.data('time')
    date = cell.data('date')

    $.ajax(
      url: '/reservations/'
      data: { reservation: { time: time, date: date } }
      method: "POST"
      dataType: 'json'
    ).done( (response) ->
      cell.find(".create-reservation-link").replaceWith(
        [ "Reservado para", response.reservation.email ].join(" ") 
      )
    ).fail (jqXHR, textStatus, errorThrown) ->
      console.log(errorThrown)