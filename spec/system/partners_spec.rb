require 'rails_helper'

RSpec.describe "Partners", type: :system do
  describe 'Login処理' do
    let!(:first_user) { FactoryBot.create(:first_user) }
    let!(:second_user) { FactoryBot.create(:second_user) }
    before do
    #   Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    #   Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@sample.com'
      fill_in 'user_password', with: '111111'
      click_on  'commit'
    end

    context 'パートナーページ' do
      it 'ログアウトする' do
        click_on 'Sign out'
        expect(page).to have_content 'Sign'
      end
      it 'パートナーコード発行ページへ遷移する' do
        click_on 'パートナーコード発行'
        expect(page).to have_content '招待コード'
      end
      it '招待コードメール送る' do
        click_on 'パートナーコード発行'
        fill_in 'partner[email]', with: 'user2@sample.com'
        click_on 'Create Partner'
        expect(page).to have_content 'Partner'
      end
      it 'パートナーコード発行ページからログアウトする' do
        click_on 'パートナーコード発行'
        click_on 'Sign out'
        expect(page).to have_content 'Sign'
      end
        it '紹介コード認証ページへ遷移する' do
          click_on '紹介コード認証'
          expect(page).to have_content '紹介コード認証'
      end
        # it '招待コードメール送る' do
        #   click_on 'パートナーコード発行'
        #   fill_in 'partner[email]', with: 'user2@sample.com'
        #   click_on 'Create Partner'
        #   click_on '紹介コード認証'
        #   fill_in 'request[certification_code]', with: '222222'
        #   click_on '送信'
        #   expect(page).to have_content '承認申請を送りました'
        # end
      it '承認確認ページへ遷移する' do
      click_on '承認確認'
      expect(page).to have_content '承認'
    end
      # it '承認クリック確認する' do
      # click_on '承認確認'
      # click_on '承認'
      # expect(page).to have_content '陣痛'
      # end
      it 'メインページへ遷移する' do
        click_on 'メイン画面'
        expect(page).to have_content '陣痛'
      end
      it 'メインページへからログアウトする' do
        click_on 'メイン画面'
        click_on 'Sign out'
        expect(page).to have_content 'Sign'
      end
    end
  end
end