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
      # page.all('a')[1].click
    end
    it 'あなたとの繋がりコードページへ遷移する' do
      click_on '相手にメールを送る'
      expect(page).to have_content 'あなたとの繋がりコード'
    end
    it '繋がりコードメール送る' do
      click_on '相手にメールを送る'
      fill_in 'partner[email]', with: 'user2@sample.com'
      click_on '招待コードを送信'
      expect(page).to have_content '初期設定登録ページ'
    end
    it '繋がりコード発行からログアウトする' do
      click_on '相手にメールを送る'
      click_on 'ログアウト'
      expect(page).to have_content 'トップページ'
    end

    context '繋がりコード入力ページ' do
      it 'メールが空で送信の場合エラーを出す' do
        click_on '相手にメールを送る'
        fill_in 'partner[email]', with: ''
        click_on '招待コードを送信'
        expect(page).to have_content '入力してください'
      end
    end

    context '繋がりコード入力ページ' do
      it '繋がりコード入力ページへ遷移する' do
        click_on '繋がりコード入力する'
        expect(page).to have_content '繋がりコード入力'
      end
      it '繋がりコード入力ページからログアウトする' do 
        click_on 'ログアウト'
        expect(page).to have_content 'トップページ'
      end
    end
    context 'ママの陣痛待機室' do
      it 'メママの陣痛待機室へ遷移する' do
        click_on 'ママの陣痛待機室'
        expect(page).to have_content 'ママの陣痛待機室'
      end
      it 'ママの陣痛待機室からログアウトする' do
        click_on 'ママの陣痛待機室'
        click_on 'ログアウト'
        expect(page).to have_content 'トップページ'
      end
    end
  end
end