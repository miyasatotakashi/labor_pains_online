require 'rails_helper'

RSpec.describe "パートナーモデル機能", type: :model do
  before do
    partner = Partner.create(email: "user1@sample.com", mother_id: "1", partners_id: "1", certification_code:"111111" )
  end

  describe 'バリデーションのテスト' do
    context '送信先のメールアドレスが空の場合' do
      it 'バリデーションに失敗する' do
        partner = Partner.create(email: "", mother_id: "2", partners_id: "2", certification_code:"222222" )
        expect(partner).to be_invalid
      end
      it 'バリデーションに失敗する' do
        partner = Partner.create(email: "user1@sample.com", mother_id: "", partners_id: "2", certification_code:"222222" )
        expect(partner).to be_valid
      end
      it 'バリデーションに失敗する' do
        partner = Partner.create(email: "user1@sample.com", mother_id: "2", partners_id: "", certification_code:"222222" )
        expect(partner).to be_valid
      end
      it 'バリデーションに失敗する' do
        partner = Partner.create(email: "user1@sample.com", mother_id: "2", partners_id: "2", certification_code:"")
        expect(partner).to be_valid
      end
    end
  end
end