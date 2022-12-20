require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'Login処理' do
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
    end
    context 'LINEログインボタンを押した場合' do
      it 'ログインができる' do
        visit new_user_session_path
        page.all('a')[0].click
        
        expect(page).to have_content 'パートナー登録'
      end
    end
  end
end