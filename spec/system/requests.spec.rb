require 'rails_helper'

RSpec.describe "Partners", type: :system do
  describe 'Login処理' do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
      visit new_user_session_path
      page.all('a')[1].click
    end

    context 'リクエストページ' do
      it '紹介コード認証ページからログアウトする' do
        click_on '紹介コード認証'
        click_on 'Sign out'
        expect(page).to have_content 'パートナー登録'
      end
      it '承認確認ページへからログアウトする' do
        click_on '承認確認'
        click_on 'Sign out'
        expect(page).to have_content 'パートナー登録'
      end
    end
  end
end