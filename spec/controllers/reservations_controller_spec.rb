require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  login_user

  describe '#index' do
    it 'renders the :index template' do
      get :index

      expect(response).to render_template :index
    end
  end
end
