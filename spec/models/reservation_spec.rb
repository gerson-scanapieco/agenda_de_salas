require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'associations' do
    it { should belong_to :user }
  end

  context 'validations' do
    it { should validate_presence_of :time }
    it { should validate_presence_of :date }
    it { should validate_presence_of :user }
    it { should validate_numericality_of(:time).only_integer.is_greater_than_or_equal_to(6).is_less_than_or_equal_to(23) }

    describe 'cannot have reservations for same day and time' do
      let!(:reservation) { create(:reservation, :with_user, time: 6, date: Date.today) }

      context 'if a Reservation for the same date and time already exists' do
        let!(:another_reservation) { build(:reservation, :with_user, time: 6, date: Date.today) } 

        it 'is not a valid record' do
          expect(another_reservation.valid?).to be false
        end

        it 'adds an error message' do
          another_reservation.valid?

          expect(another_reservation.errors[:time]).to include 'já existe uma reserva para este horário neste dia'
        end
      end

      context 'if theres no Reservation for same date and time' do
        it 'is a valid record' do
          expect(reservation.valid?).to be true
        end
      end
    end

  end
end
