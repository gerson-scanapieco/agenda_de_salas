json.reservation do
  json.email @reservation.user_email
  json.id @reservation.id
end