module CapybaraHelper
  def self.included(receiver)
    receiver.let!(:current_user) do
      create(:user)
    end
  end

  def sign_in
    visit new_user_session_path

    fill_in "Email", with: current_user.email
    fill_in "Senha", with: current_user.password

    click_button "Entrar"
  end
end
