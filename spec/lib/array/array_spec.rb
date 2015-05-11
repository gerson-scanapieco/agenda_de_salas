require 'rails_helper'

describe 'Array' do
  describe '#get_reservation_by_time_and_date(time,date)' do
    let(:reservation) { create(:reservation, :with_user, time: 6, date: Date.today) }
    let(:another_reservation) { create(:reservation, :with_user, time: 6, date: Date.today + 1.days) }
    let(:reservations_array) { [ reservation, another_reservation ] }

    it 'returns a Reservation that has the same time and date as the one passed in arguments' do
      expect(reservations_array.get_reservation_by_time_and_date(6, Date.today)).to eq reservation
    end

  end
end
