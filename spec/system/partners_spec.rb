require 'rails_helper'

RSpec.describe "Partners", type: :system do
  describe 'Login処理' do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
      visit new_user_session_path
      page.all('a')[0].click
      # page.all('a')[1].click
    end
    it 'パートナーコード発行ページへ遷移する' do
      click_on 'パートナーコード発行'
      expect(page).to have_content '招待コード'
    end
    it '招待コードメール送る' do
      click_on 'パートナーコード発行'
      fill_in 'partner[email]', with: 'user2@sample.com'
      click_on '招待コードを送信'
      expect(page).to have_content 'パートナー'
    end
    it 'パートナーコード発行ページからログアウトする' do
      click_on 'パートナーコード発行'
      click_on 'ログアウト'
      expect(page).to have_content 'トップページ'
    end

    context '紹介ページ認証ページ' do
      it 'メールが空で送信の場合エラーを出す' do
        click_on 'パートナーコード発行'
        fill_in 'partner[email]', with: ''
        click_on '招待コードを送信'
        expect(page).to have_content '入力してください'
      end
    end

    context '紹介ページ認証ページ' do
      it '紹介コード認証ページへ遷移する' do
        click_on '紹介コード認証'
        expect(page).to have_content '紹介コード認証'
      end
      it '紹介コード認証ページからログアウトする' do 
        click_on 'ログアウト'
        expect(page).to have_content 'トップページ'
      end
    end
    context 'メインページ' do
      it 'メインページへ遷移する' do
        click_on 'メイン画面'
        expect(page).to have_content '陣痛'
      end
      it 'メインページへからログアウトする' do
        click_on 'メイン画面'
        click_on 'ログアウト'
        expect(page).to have_content 'トップページ'
      end
    end
  end
end