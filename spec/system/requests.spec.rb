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
      page.all('a')[0].click
    end

    context 'リクエストページ' do
      it '紹介コード認証ページが空の場合エラーメッセージを出力する' do
        click_on '紹介コード認証'
        click_on '送信'
        expect(page).to have_content '紹介コード認証'
      end
      it '承認確認ページへからログアウトする' do
        click_on 'ログアウト'
        expect(page).to have_content 'トップページ'
      end
    end
  end
end