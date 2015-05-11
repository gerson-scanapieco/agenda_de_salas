# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
      [ "<a href='#' class='destroy-reservation-link' data-id='", response.reservation.id,"'>Reservado para", 
        response.reservation.name, "</a>" ].join(" ") 
    )
  ).fail (jqXHR, textStatus, errorThrown) ->
    console.log(errorThrown)

$(document).on 'click', '.destroy-reservation-link', ->
  cell = $(this).parent()
  reservationId = $(this).data("id")

  $.ajax(
    url: [ '/reservations/', reservationId ].join("")
    data: { id: reservationId }
    method: "DELETE"
    dataType: 'html'
  ).done( (response) ->
    cell.find(".destroy-reservation-link").replaceWith(
      "<a href='#' class='create-reservation-link'>Reservar</a>"
    )
  ).fail (jqXHR, textStatus, errorThrown) ->
    console.log(errorThrown)