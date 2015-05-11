require 'rails_helper'

feature 'create a Reservation' do
  background do
    sign_in
  end

  scenario 'creating a new Reservation', js: true do
    visit reservations_path

    within '.reservations-table tbody' do
      within 'tr:nth-child(1) td:nth-child(2)' do
        expect(page).to have_content 'Reservar'

        click_link 'Reservar'

        expect(page).to have_content "Reservado para #{ current_user.email }"
      end
    end
  end
end
