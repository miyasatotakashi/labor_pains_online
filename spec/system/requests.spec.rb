require 'rails_helper'

RSpec.describe "Partners", type: :system do
  describe 'Login処理' do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
      visit new_user_session_path
      # click_on  'line_login'
      page.all('a')[1].click
    end

    context 'リクエストページ' do
      it '繋がりコード入力ページが空の場合エラーメッセージを出力する' do
        click_on '繋がりコード入力'
        click_on '送信'
        expect(page).to have_content '繋がりコード入力'
      end
      it '繋がりコード入力ページからログアウトする' do
        click_on 'ログアウト'
        expect(page).to have_content 'トップページ'
      end
    end
  end
end