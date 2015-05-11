require 'rails_helper'

feature 'destroy a Reservation' do
  background do
    sign_in
  end

  before(:each) do
    Timecop.travel(Date.new(2015,5,10))
  end

  let!(:reservation) { create(:reservation, user: current_user, time: 6, date: Date.new(2015,5,4) ) }

  scenario 'creating a new Reservation', js: true do
    visit reservations_path

    within '.reservations-table tbody' do
      within 'tr:nth-child(1) td:nth-child(2)' do
        expect(page).to have_content "Reservado para #{ current_user.name }"

        click_link "Reservado para #{ current_user.name }"

        expect(page).to have_content 'Reservar'
      end
    end
  end
end
