require 'rails_helper'

RSpec.describe ReservationsHelper, type: :helper do
  describe "reservation_entry(reservations, time, date)" do
    context "when theres no Reservation for given time and date" do
      let(:reservations_array) { [] }

      it 'returns a link with text "Reservar"' do
        expect(helper.reservation_entry(reservations_array, 6, Date.today)).to eq link_to 'Reservar', '#', class: 'create-reservation-link'
      end
    end

    context "when the Reservation found belongs to the current user" do
      let(:reservation) { create(:reservation, :with_user, time: 6, date: Date.today) }
      let(:user) { reservation.user }
      let(:reservations_array) { [ reservation ] }

      before(:each) do
        allow(helper).to receive_messages(current_user: user)
      end

      it 'returns a link with the text "Reservado para :current_user_email"' do
        expect(helper.reservation_entry(reservations_array, 6, Date.today)).to eq link_to "Reservado para #{ reservation.user_name }", '#', 
                class: 'destroy-reservation-link', data: { id: reservation.id }
      end
    end

    context "when the Reservation found belongs to another user" do
      let(:reservation) { create(:reservation, :with_user, time: 6, date: Date.today) }
      let(:user) { create(:user) }
      let(:reservations_array) { [ reservation ] }

      before(:each) do
        allow(helper).to receive_messages(current_user: user)
      end

      it 'returns the text "Reservado para :another_user_email"' do
        expect(helper.reservation_entry(reservations_array, 6, Date.today)).to eq "Reservado para #{ reservation.user_name }"
      end
    end

  end
end
