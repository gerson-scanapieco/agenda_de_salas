require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  login_user

  describe '#index' do
    it 'renders the :index template' do
      get :index

      expect(response).to render_template :index
    end
  end

  describe '#create' do
    render_views

    it 'creates a new Reservation record' do
      expect { 
        xhr :post, :create, reservation: { time: 6, date: Date.today }
      }.to change { Reservation.count }.by 1
    end

    it 'responds with a JSON containing information about the created Reservation' do
      post :create, format: 'json', reservation: { time: 6, date: Date.today }

      expect(JSON.parse(response.body)["reservation"]["email"]).to eq @user.email
      expect(JSON.parse(response.body)["reservation"]["id"]).to eq Reservation.last.id
    end

  end

  describe '#destroy' do
    render_views

    let!(:reservation) { create(:reservation, time: 6, date: Date.today, user: @user) }

    it 'assigns the correct Reservation in @reservation' do
      xhr :delete, :destroy, id: reservation.id

      expect(assigns(:reservation)).to eq reservation
    end

    it 'destroys the Reservation' do
      expect {
        xhr :delete, :destroy, id: reservation.id
      }.to change { Reservation.count }.by -1
    end

    it 'responds with status 200' do
      xhr :delete, :destroy, id: reservation.id

      expect(response.status).to eq 200
    end

    context 'when user is trying to destroy another User Reservation' do
      let!(:another_reservation) { create(:reservation, :with_user, time: 6, date: Date.today + 1.days) }

      it 'responds with status 401' do
        xhr :delete, :destroy, id: another_reservation.id

        expect(response.status).to eq 401
      end

    end

  end
end
